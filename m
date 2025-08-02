Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB6EC87FD2
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Aug 2025 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVyu7zb4i+vAmltXy3rOL4h677GGzMZS2dhrlF6n7Z4=; b=ofEDjKZLYf61RRT6kmNx6+70+j
	YhHj7114fsun4DMAIqjDzjMASk2lTi5ZLvdO8Ak7GxYZi28rYfL7A4M8lP+4Wbok5t1kXrWx8paly
	NTnQ0RiRFLXSW6AvjxrGwFA6guE5y4t1G+4oPkE06WpGkk2NjQ0p/D08AzjxqRLnTWrerDpAN7dsH
	yZiJjUB59JwMHrAfx4IGLQCOSBWb1YonZwu8u0TfqZGC4CV4iCmxa0UcK/vd2VOKHbC9AmQyteM6y
	rUvyCObqxdY4DZxySWVmeQFneqD2ei3+YI5SJIZkcZIw9SjgPyau8PoB3zfh9tr372yv0HH47x3lp
	svdZ/ZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui8cg-00000007SGT-2OnK;
	Sat, 02 Aug 2025 09:33:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui8cd-00000007SEU-3Sxw;
	Sat, 02 Aug 2025 09:33:49 +0000
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F1A939D0;
	Sat,  2 Aug 2025 11:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127181;
	bh=plUDcgbQkGw4JyRbthC79SLTx+gbob3U9axm5vZyPtk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SkX6QI0fVpdZyZWipUKoRAh6k0e+KWR2tAAJnBI4jQ23/Jqyuwg3nvBEqmr2hdkvu
	 f3kK5CxdreRfQcAG/s/J8ryTY8EWe3hohBJEYgb614t2SVt/j3dRn/xosIhuT7TpD9
	 IIMKMGph9jDhippZQMTJbMZkOzAa9CJnWTL5yD2w=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:22 +0200
Subject: [PATCH 60/65] media: usb: uvc: Access v4l2_fh from file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-60-eb140ddd6a9d@ideasonboard.com>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
In-Reply-To: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Christian Gromm <christian.gromm@microchip.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andy Walls <awalls@md.metrocast.net>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>, 
 Zhou Peng <eagle.zhou@nxp.com>, 
 Xavier Roumegue <xavier.roumegue@oss.nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, 
 Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Corentin Labbe <clabbe@baylibre.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-tegra@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7314;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=plUDcgbQkGw4JyRbthC79SLTx+gbob3U9axm5vZyPtk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj+Gv25IxJxmaQk2kge3awblRwS1LI4XdRw4
 Rr8AM7v8PyJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/gAKCRByNAaPFqFW
 PKg0D/40XOP1ymiqV3UZQ3VXGNXxWoOIIzNeadTf1tfqQ0EWWeJ1hUxsU5M5ACuvX6TBofNvS50
 kh+QpYAgXd6q4dudHmxvocEcg8NOyRQ5uW2Cyrs/GqSqaN7SMh6q76tjdsA8tbXXh0o3oyDe36B
 qjtT/cC2i5fIerKN3xco2Cpff20JshnqvaKgBVIcK8Ze+iVAqqAiO2cWAFUOts/lJk+5kN9yRDN
 qfGrm8F90EMGjayFJq6JiDsE+d3pCUIY9ZQb+zaqdNUGPGc1FzzQbYmd744+C9o8qo3OBLOgGT+
 EFCV4vdHx7xoSCsRkBSiPnKCx/ztAthTj1AsUTGJyzsAGNRiTAJRIItVGRO8dXkgSv2+ZryniHl
 9Bf1/2lj18fmhHdihFTmpREVk0r5kVu3+GmZMdRqaZN8iG4yB6UzGURtlj6ejN+rF6yOolxUf+N
 k/p3Lk+q7ULyckIqziFqIJ4v0pihZUwPacSTI2LXjwAoqSK1EQngHats7fi1V1PVOVMHNqeHr+e
 +trroR5QY+A8Oa/hYZbYaDpK1CvEhT1pzcwWvkToNgcrwafRJc5WCAU2lDs9CF4KnQCrpvcLqMy
 SXVP98AjcOz2xZDPMONZFIfxUuwv4TEh+ccR0/QCEUpUVsLzM28z9M5iF1oaU3d6+ktbS7+13FQ
 O+Ls+rwA+ykB7OA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_023348_014739_C578AA0E 
X-CRM114-Status: GOOD (  12.46  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The v4l2_fh associated with an open file handle is now guaranteed
to be available in file->private_data, initialised by v4l2_fh_add().

Access the v4l2_fh, and from there the driver-specific structure,
from the file * in all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 09677ed639ae9252a57ce09cdbcfd567ad7aabc2..10196d62f287502b0dd472ac68ec6914ca4eb06b 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -391,7 +391,7 @@ static int uvc_v4l2_try_format(struct uvc_streaming *stream,
 static int uvc_ioctl_g_fmt(struct file *file, void *fh,
 			   struct v4l2_format *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format;
 	const struct uvc_frame *frame;
@@ -427,7 +427,7 @@ static int uvc_ioctl_g_fmt(struct file *file, void *fh,
 static int uvc_ioctl_s_fmt(struct file *file, void *fh,
 			   struct v4l2_format *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 	const struct uvc_format *format;
@@ -460,7 +460,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
 			    struct v4l2_streamparm *parm)
 {
 	u32 numerator, denominator;
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 
 	if (parm->type != stream->type)
@@ -496,7 +496,7 @@ static int uvc_ioctl_g_parm(struct file *file, void *fh,
 static int uvc_ioctl_s_parm(struct file *file, void *fh,
 			    struct v4l2_streamparm *parm)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 	struct v4l2_fract timeperframe;
@@ -641,7 +641,7 @@ static int uvc_ioctl_querycap(struct file *file, void *fh,
 static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
 			      struct v4l2_fmtdesc *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	enum v4l2_buf_type type = fmt->type;
 	const struct uvc_format *format;
@@ -665,7 +665,7 @@ static int uvc_ioctl_enum_fmt(struct file *file, void *fh,
 static int uvc_ioctl_try_fmt(struct file *file, void *fh,
 			     struct v4l2_format *fmt)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_streaming_control probe;
 
@@ -675,7 +675,7 @@ static int uvc_ioctl_try_fmt(struct file *file, void *fh,
 static int uvc_ioctl_enum_input(struct file *file, void *fh,
 				struct v4l2_input *input)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	const struct uvc_entity *selector = chain->selector;
 	struct uvc_entity *iterm = NULL;
@@ -717,7 +717,7 @@ static int uvc_ioctl_enum_input(struct file *file, void *fh,
 
 static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	u8 *buf;
 	int ret;
@@ -745,7 +745,7 @@ static int uvc_ioctl_g_input(struct file *file, void *fh, unsigned int *input)
 
 static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	struct uvc_video_chain *chain = handle->chain;
 	u8 *buf;
@@ -780,7 +780,7 @@ static int uvc_ioctl_s_input(struct file *file, void *fh, unsigned int input)
 static int uvc_ioctl_query_ext_ctrl(struct file *file, void *fh,
 				    struct v4l2_query_ext_ctrl *qec)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 
 	return uvc_query_v4l2_ctrl(chain, qec);
@@ -808,7 +808,7 @@ static int uvc_ctrl_check_access(struct uvc_video_chain *chain,
 static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 				 struct v4l2_ext_controls *ctrls)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 	struct v4l2_ext_control *ctrl = ctrls->controls;
 	unsigned int i;
@@ -892,7 +892,7 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
 				 struct v4l2_ext_controls *ctrls)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 
 	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_S_EXT_CTRLS);
 }
@@ -900,7 +900,7 @@ static int uvc_ioctl_s_ext_ctrls(struct file *file, void *fh,
 static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
 				   struct v4l2_ext_controls *ctrls)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 
 	return uvc_ioctl_s_try_ext_ctrls(handle, ctrls, VIDIOC_TRY_EXT_CTRLS);
 }
@@ -908,7 +908,7 @@ static int uvc_ioctl_try_ext_ctrls(struct file *file, void *fh,
 static int uvc_ioctl_querymenu(struct file *file, void *fh,
 			       struct v4l2_querymenu *qm)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 
 	return uvc_query_v4l2_menu(chain, qm);
@@ -917,7 +917,7 @@ static int uvc_ioctl_querymenu(struct file *file, void *fh,
 static int uvc_ioctl_g_selection(struct file *file, void *fh,
 				 struct v4l2_selection *sel)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 
 	if (sel->type != stream->type)
@@ -951,7 +951,7 @@ static int uvc_ioctl_g_selection(struct file *file, void *fh,
 static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
 				     struct v4l2_frmsizeenum *fsize)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format = NULL;
 	const struct uvc_frame *frame = NULL;
@@ -991,7 +991,7 @@ static int uvc_ioctl_enum_framesizes(struct file *file, void *fh,
 static int uvc_ioctl_enum_frameintervals(struct file *file, void *fh,
 					 struct v4l2_frmivalenum *fival)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_streaming *stream = handle->stream;
 	const struct uvc_format *format = NULL;
 	const struct uvc_frame *frame = NULL;
@@ -1063,7 +1063,7 @@ static int uvc_ioctl_subscribe_event(struct v4l2_fh *fh,
 static long uvc_ioctl_default(struct file *file, void *fh, bool valid_prio,
 			      unsigned int cmd, void *arg)
 {
-	struct uvc_fh *handle = fh;
+	struct uvc_fh *handle = to_uvc_fh(file);
 	struct uvc_video_chain *chain = handle->chain;
 
 	switch (cmd) {

-- 
2.49.0


