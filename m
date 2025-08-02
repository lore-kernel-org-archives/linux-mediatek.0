Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB2FC87FC9
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Aug 2025 09:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EiAowMi8taw41epDYTzQ1GvOSih+RUmACOUotkg1UQ=; b=LKdHRCB+GsR6Izwr+4FquhXxLK
	jphEQYEs8UnfqS4Q34girjWUxf7maYWpFkmCAe/JS6zDlzs7wexMwAoQQvhK8Ud0opI1TyEPoPCF1
	tTeuSANNFZHdZ/tDSSaQU1ESnN6DeIgLgR4QWB0PaANLMbczGCUxE98SjfIipaiUEJZGj8jdgFcek
	shDYl1ASdpHI5CvXiAWSD38TpodrlV4AB8GbqkmNfRGdgnzotEMzeZpyBEM8gy51sN4l16507Z1pv
	GVyi3KVapmroHv3eQ9dpdb65orONHTqYBION3duyRxJYFZ4A0rjtzUExgRw6GLzkl0oC741ciQvw0
	TWI/Kn7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui8ax-00000007RSu-1vzT;
	Sat, 02 Aug 2025 09:32:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ui8au-00000007RRh-0OcL;
	Sat, 02 Aug 2025 09:32:01 +0000
Received: from [192.168.0.172] (mob-5-90-138-121.net.vodafone.it [5.90.138.121])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 079D63EB0;
	Sat,  2 Aug 2025 11:30:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754127073;
	bh=IirxBztmljSSgN2BVXB6cHuAJICj/kyqIr+6UJ76kV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TmEtBzqdBLqoZluZmZs8RWZtWynh8NG+K6Ba1+EQhY2cVQPMXqrZZI/bLcmAR0I4/
	 JHinrXd1/aSAMaplfSD+nTW92cFr9EAud1X6dQtjs6yp64g4C5UV1Y6sCRs19SnxRs
	 jonF1sJjFPnx6LCJpUmOEXFbILHpJm0DWXiE5iHU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Sat, 02 Aug 2025 11:23:12 +0200
Subject: [PATCH 50/65] media: s5p-mfc: Access v4l2_fh from file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-media-private-data-v1-50-eb140ddd6a9d@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9860;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=IirxBztmljSSgN2BVXB6cHuAJICj/kyqIr+6UJ76kV4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBojdj9WlUYBZnvtf2wlXVIHJUMp9jqezOCJZkEu
 ZnI1YN6t7OJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaI3Y/QAKCRByNAaPFqFW
 PNIKD/9gLwzi+0G2rYD3uhw/B90pgSgcO+CBQcWIi3EmM3D9Z5NL370hmM371eFP8iZ+KPoX2f0
 WNvQYpl+7zDqGikGkhpak7k0SmbxMaalX/OgFsHCx79mpOM06FBfqSDSDIA943JnuxIFpNn2ymB
 wF65SyOjgG0Vrp2l8HTSFSP1yugJr2jXchjFaqAwLd90RZx/qcJWBJ7H6Xzl4y8LfPDJIv1EfuJ
 QhQrrSrWgV3Ykci//zn8E1SVEnM0+D16nAXVGqI1Fm43/byjzJloxtHpzuwI1t9jKpgDWg79kNw
 VJvGq8STnkxwsw03Pr54zOR+AGKMpwu2WcEjnc76q2UX1lqOqAhGitu/HsStX4mMq8vCKEs+fC0
 MMkS3dqeBqqTemtbtodeIcWEIK2Xc6XAJe97Rj7WMwbGQncnUJgY12XhpkKKYNcyavDoNsMGEOP
 Q6eqUyYK1hFwo8/Cp0YvQWuknTsI5aznce/twxHwr+PdL3SWKa9mNtsplRx8YRFryUKkt6GVpCM
 BlziLQuxJgaPME2bQyq1e72z/X0RHeWzxSZhxXPA/Tk3i6YEcXxfa/v2hHjFnYmbnPgfHvY/8ca
 T3ICF5986+Vi7y/BaFmkldV4+Gs+luRI1xoHvEv9NEhaioZi6mtJOgg4XdXyObH6ALLGfS4602Y
 yx8stXWkxbGP4hQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_023200_423841_8EA24523 
X-CRM114-Status: GOOD (  14.47  )
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
 .../media/platform/samsung/s5p-mfc/s5p_mfc_dec.c   | 22 ++++++++++----------
 .../media/platform/samsung/s5p-mfc/s5p_mfc_enc.c   | 24 +++++++++++-----------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
index 3efbc336790629425c2a71e9feee8f073db55790..6a2703fe7e8cc3104fbaa3c7405e67295e87db5d 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_dec.c
@@ -345,7 +345,7 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 /* Get format */
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct v4l2_pix_format_mplane *pix_mp;
 
 	mfc_debug_enter();
@@ -442,7 +442,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 	struct v4l2_pix_format_mplane *pix_mp;
 	const struct s5p_mfc_buf_size *buf_size = dev->variant->buf_size;
@@ -598,7 +598,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 					  struct v4l2_requestbuffers *reqbufs)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (reqbufs->memory != V4L2_MEMORY_MMAP) {
 		mfc_debug(2, "Only V4L2_MEMORY_MMAP is supported\n");
@@ -619,7 +619,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 static int vidioc_querybuf(struct file *file, void *priv,
 						   struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret;
 	int i;
 
@@ -647,7 +647,7 @@ static int vidioc_querybuf(struct file *file, void *priv,
 /* Queue a buffer */
 static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->state == MFCINST_ERROR) {
 		mfc_err("Call on QBUF after unrecoverable error\n");
@@ -666,7 +666,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 	const struct v4l2_event ev = {
 		.type = V4L2_EVENT_EOS
 	};
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret;
 
 	if (ctx->state == MFCINST_ERROR) {
@@ -695,7 +695,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 static int vidioc_expbuf(struct file *file, void *priv,
 	struct v4l2_exportbuffer *eb)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (eb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_expbuf(&ctx->vq_src, eb);
@@ -708,7 +708,7 @@ static int vidioc_expbuf(struct file *file, void *priv,
 static int vidioc_streamon(struct file *file, void *priv,
 			   enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = -EINVAL;
 
 	mfc_debug_enter();
@@ -724,7 +724,7 @@ static int vidioc_streamon(struct file *file, void *priv,
 static int vidioc_streamoff(struct file *file, void *priv,
 			    enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_streamoff(&ctx->vq_src, type);
@@ -801,7 +801,7 @@ static const struct v4l2_ctrl_ops s5p_mfc_dec_ctrl_ops = {
 static int vidioc_g_selection(struct file *file, void *priv,
 			      struct v4l2_selection *s)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	u32 left, right, top, bottom;
 	u32 width, height;
@@ -856,7 +856,7 @@ static int vidioc_g_selection(struct file *file, void *priv,
 static int vidioc_decoder_cmd(struct file *file, void *priv,
 			      struct v4l2_decoder_cmd *cmd)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	struct s5p_mfc_buf *buf;
 	unsigned long flags;
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
index 6c603dcd56649fcabe161173c64b9ea8bd055b93..c6787ccfaaa422a905dbb136d992f2d15b8e484f 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_enc.c
@@ -1389,8 +1389,8 @@ static int vidioc_enum_fmt_vid_out(struct file *file, void *priv,
 
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	mfc_debug(2, "f->type = %d ctx->state = %d\n", f->type, ctx->state);
 	if (f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
@@ -1472,8 +1472,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 
 static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 	int ret = 0;
 
@@ -1531,7 +1531,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 					  struct v4l2_requestbuffers *reqbufs)
 {
 	struct s5p_mfc_dev *dev = video_drvdata(file);
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 
 	/* if memory is not mmp or userptr or dmabuf return error */
@@ -1601,7 +1601,7 @@ static int vidioc_reqbufs(struct file *file, void *priv,
 static int vidioc_querybuf(struct file *file, void *priv,
 						   struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	int ret = 0;
 
 	/* if memory is not mmp or userptr or dmabuf return error */
@@ -1636,7 +1636,7 @@ static int vidioc_querybuf(struct file *file, void *priv,
 /* Queue a buffer */
 static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (ctx->state == MFCINST_ERROR) {
 		mfc_err("Call on QBUF after unrecoverable error\n");
@@ -1657,10 +1657,10 @@ static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 /* Dequeue a buffer */
 static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 {
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	const struct v4l2_event ev = {
 		.type = V4L2_EVENT_EOS
 	};
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
 	int ret;
 
 	if (ctx->state == MFCINST_ERROR) {
@@ -1685,7 +1685,7 @@ static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *buf)
 static int vidioc_expbuf(struct file *file, void *priv,
 	struct v4l2_exportbuffer *eb)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (eb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_expbuf(&ctx->vq_src, eb);
@@ -1698,7 +1698,7 @@ static int vidioc_expbuf(struct file *file, void *priv,
 static int vidioc_streamon(struct file *file, void *priv,
 			   enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_streamon(&ctx->vq_src, type);
@@ -1711,7 +1711,7 @@ static int vidioc_streamon(struct file *file, void *priv,
 static int vidioc_streamoff(struct file *file, void *priv,
 			    enum v4l2_buf_type type)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		return vb2_streamoff(&ctx->vq_src, type);
@@ -2284,7 +2284,7 @@ static const struct v4l2_ctrl_ops s5p_mfc_enc_ctrl_ops = {
 static int vidioc_s_parm(struct file *file, void *priv,
 			 struct v4l2_streamparm *a)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (a->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		ctx->enc_params.rc_framerate_num =
@@ -2301,7 +2301,7 @@ static int vidioc_s_parm(struct file *file, void *priv,
 static int vidioc_g_parm(struct file *file, void *priv,
 			 struct v4l2_streamparm *a)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 
 	if (a->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
 		a->parm.output.timeperframe.denominator =
@@ -2318,7 +2318,7 @@ static int vidioc_g_parm(struct file *file, void *priv,
 static int vidioc_encoder_cmd(struct file *file, void *priv,
 			      struct v4l2_encoder_cmd *cmd)
 {
-	struct s5p_mfc_ctx *ctx = fh_to_ctx(priv);
+	struct s5p_mfc_ctx *ctx = file_to_ctx(file);
 	struct s5p_mfc_dev *dev = ctx->dev;
 	struct s5p_mfc_buf *buf;
 	unsigned long flags;

-- 
2.49.0


