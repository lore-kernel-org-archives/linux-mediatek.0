Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441D3C77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ui38aPU8PITDpl60dWAnkxQVrreBpXSBV3p6xtYYmRs=; b=GYs7XKYn0GIqgpN7VDKI1GfKsn
	ATVEZNSpH2exEOMw7Qm+1rlKY9omjZYrvGGtnPja42DXzGKGgmBXiAPg0M+LUJ9ZOh9hKXqff+J/7
	HGxYSpYoWJ0cSjWWONpWZ5oIJwk0sTWzy3qFpA0xkihfJ01e4658Cn4mqiU6XeaNLKETi4PuLyIgj
	n1SaVOv9b32dEBpM7fLVTUdcTcFjCcVpn+0dgS7aDdk53e/bN+4dZAxGKWkvHGXIO34K1CQeJIBB9
	RIcup1JkbDWkw5Kf25fkpmHP2SmdAY6dBIu8fRiWAwpkqqxDwESHXhv0j8bGfXOvbWxXlYNfgBrRi
	dnPjegtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnOCF-00AMp8-0k;
	Fri, 14 Apr 2023 18:30:55 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnOCA-00AMo2-2W;
	Fri, 14 Apr 2023 18:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681497022; i=markus.elfring@web.de;
	bh=4THy5S1zSzl+WBFeDQSgq2WZGHTK5AmyAL0vwl6Ck5c=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
	b=h622cmztAaAGVGdPYsd7j+2mcKuXgZm2NVYEiicB87AUVf/HDr/sYg6/CEwm9ucfM
	 6W6HOQ2U65h/bdmFxpdhbLI6YqsI9xosoYo62E9GX1qA/CwsKzDCLrkGFLBA8oNkyf
	 7xzjoVEYTfIDNP9E6jOd9Dc2wIHE6Vw/sRn6mzRQB0rnwX+EEohMdG+RYWQmKtlcT0
	 QjEWsZR9W9fbrE0tNa1osPcCuAl51YRJG3toABIhEZ8kYvrD2Vkn2UbBeSfp/5dlq/
	 TsiS34dxM3X+8w1z+BPhvkDzJqaO3GhZcy9m6naPT4Wl6nA6PsRmVUBDDeCh9TNJsq
	 tycqO0RQMVXUA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwjJo-1qY2U80Ehu-00ySyr; Fri, 14
 Apr 2023 20:30:22 +0200
Message-ID: <b98dcc94-13f3-a6cb-f5bd-f1f8644d87d1@web.de>
Date: Fri, 14 Apr 2023 20:30:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH] media: mediatek: vcodec: Move a variable assignment behind
 condition checks in vdec_vp9_slice_single_decode()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Guo Zhengkui <guozhengkui@vivo.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Haowen Bai <baihaowen@meizu.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mingjia Zhang <mingjia.zhang@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2Yx9WQLSLdMDVajG3OxtB2qMwsC6ueaycbkN30z2vYmJGnKf0F9
 o6eB0KmGCQL7pz2RsLRFMm7I+/YbJlSUWNJkKwuotr+qmwsjFZw88uJSR1IbtlKqDbslrxu
 qM7HJxbvpcmRXvdkI/Png6qz/ujw8NPG5jt2MHLIRf4H3X59ROl6oZhzR2acSnvGwpyTfoX
 1KaUC7TMvrBwS1pQk9i2w==
UI-OutboundReport: notjunk:1;M01:P0:OAOICbMF1/w=;nFtDtiqPPaQNZHgMHXrS+LCw90r
 Zxo7ndExIT0qO4VqxPCfT42LW9RElUS2OReaQVG0DuQfSlZb1f29V8X4F+YiSi9oHtZ6Rm+py
 p638shBzq0vzN/KJ0bHPUMP6GPvEX4xZv5wUASglsfyZq/rdLdA3CvNw7MuMQUjLswQBLYTkO
 R79rMxjRhqiKlHLlEUrRHFhUYWhXzxw3CARfva1HM5wjcBVnqdpiTIIe0BRXlxpdxR7Ir6nWI
 lJd79sIXanFMF8rJ6dkzzvZCPw3lKmoHGqJfQ0MySE1sTLYeGp2TiBYr0GB2W3YlpWcmfvgQ1
 ZVk0UMYUkydvdZXn5ZxiRQprKjfPNRZG0B5CubLjzWJh5UW6khF5i6x0kgaGzQ5pvbrLxYkjx
 Tr4jZ+tuPDOLRt/duIyE33/DyzFzz54EUxeZGAtwwcGH1P8hKPBkfPcZOA5NYEF8iIJmv35FP
 r8289+UH2gOlFiNolkT9bu7AJRQ7jAAbr9j/WhP3IBh+GgyHPPoUwZ9dp9h8Wbjgexq6kj2ki
 hc8D2A/xMZ76ekZFiOSUTX9EyvN9k3blwTbBIC1uHYKENBsYfiQ15kcnRZbND5O3rR2T/zaHx
 6H8R0Vr0C0WT1iFJOzVbqsMOfCTUMf9+9Wl5NEgskp6yV9I1AXgevkFY1M9qxxo2rzL1ww/0B
 tYAXHyzCAehEkqAo16Lq1yT/xdjyDoL6S7vl3RyatJv9t9NEL58MStwk1IJ8ag/IyGfMXcN7z
 /vahBS1GrtsBx0GhUa864Tmrf/OOYvBb4wfK7EqEyyUx2rjuZ4pvFBFae0TizGamdjPkgKWpE
 7S/DbJ3ZwWXxg7Sn8Y2DRzxcNvdLcx0xZ/tAnIvBofJ4VXkphecac5k84EWhW4Le/ReVpov6F
 wvMGx0M17ydClLHrU5hPXPu4omgFK/FA1Uv/2robQDdWir+atRGBWTsa0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_113051_298863_8A1862FE 
X-CRM114-Status: GOOD (  10.44  )
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

Date: Fri, 14 Apr 2023 20:07:01 +0200

The address of a data structure member was determined before
a corresponding null pointer check in the implementation of
the function =E2=80=9Cvdec_vp9_slice_single_decode=E2=80=9D.

Thus avoid the risk for undefined behaviour by moving the assignment
for the variable =E2=80=9Cpfc=E2=80=9D behind some condition checks.

This issue was detected by using the Coccinelle software.

Fixes: b0f407c19648ae9110c932c91d6e1b9381ec0aeb ("media: mediatek: vcodec:=
 add vp9 decoder driver for mt8186")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 .../media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_=
if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
index cf16cf2807f0..22b27f7b57bf 100644
=2D-- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c
@@ -1990,7 +1990,7 @@ static int vdec_vp9_slice_single_decode(void *h_vdec=
, struct mtk_vcodec_mem *bs,
 					struct vdec_fb *fb, bool *res_chg)
 {
 	struct vdec_vp9_slice_instance *instance =3D h_vdec;
-	struct vdec_vp9_slice_pfc *pfc =3D &instance->sc_pfc;
+	struct vdec_vp9_slice_pfc *pfc;
 	struct vdec_vp9_slice_vsi *vsi;
 	struct mtk_vcodec_ctx *ctx;
 	int ret;
@@ -2007,6 +2007,7 @@ static int vdec_vp9_slice_single_decode(void *h_vdec=
, struct mtk_vcodec_mem *bs,
 	if (!fb)
 		return -EBUSY;

+	pfc =3D &instance->sc_pfc;
 	vsi =3D &pfc->vsi;

 	ret =3D vdec_vp9_slice_setup_single(instance, bs, fb, pfc);
=2D-
2.40.0


