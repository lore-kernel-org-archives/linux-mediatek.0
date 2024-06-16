Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569ADC2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWcPAj89icPemmCv/0wrLwKnYssXR5PJHE61cXfAVG0=; b=WpfHbyFpMDaUPdfnfPQhQP50Qq
	6Ex2+iIDkqO+mNNRUk41YTDn/0FWCK3f+LXxjaArZD7v8HMfkOjDyZ1Wt5UvVWNZjy/StXPpExrOW
	AUFfPs1Gadciog+c3zCRjpffKA1PGbbMhLe35j9/paAzvmuokpa2SlsBWhsJgR3hn/RD1B4kUHdzV
	pDerefFAE9E4Kfnjd8fc+sF3O4QIiKMd9S0ESgJ1IBsArfigwZNYAPosw9mT0yqmi7AdcuIlmb+Ye
	ptd6ZtmuUjgnYxLqhU4JYo5pDRLn+sQDBjbz3s2OTAbTcybHtZfho6/S827kf1XZzrjaQcYY/6CyQ
	GLm/xRHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlHn-000000078kk-3yOt;
	Sun, 16 Jun 2024 08:30:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIlGM-000000077lJ-05sX;
	Sun, 16 Jun 2024 08:29:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C0B060C72;
	Sun, 16 Jun 2024 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F11AC4AF62;
	Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718526555;
	bh=gLCaZE610rsmKqqdbcEc8ost1ZTS13TyJe0ZZJvoHZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UXd+1hKZ0BVdFf3sECRMmtUHQEmL0xGKfimQV0TgklP42K38C7FMB5931tiMADQhB
	 GYJRWfMfnArgUEnsIUkg83lwMHarrFZS3A67gmbayBtr+hC/kuj46Zadn21wTW9VbD
	 NPGvfT9lugINow1k6UxOnkhjGwgwEM1SXtads9lPIbJOIKK0n83wVLRU7sdmvVHS0+
	 6ABLECN9A2LW1aiYRe4+vOwvNW4Hr0LFYurQakJF1BwI61eEZ/Sor8IbPVhBNjd8xI
	 O2eRBzpcRH7wyoutudXYxBNks+LtLyaP/7HqwspchyYlM0kc+Aqjv7gZKtmjmW3wTG
	 BcB0rS5orWeTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37205C2BA15;
	Sun, 16 Jun 2024 08:29:15 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Date: Sun, 16 Jun 2024 16:29:18 +0800
Subject: [PATCH 08/13] drm/mediatek: Support RGBA8888 and RGBX8888 in OVL
 on MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240616-mediatek-drm-next-v1-8-7e8f9cf785d8@mediatek.com>
References: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
In-Reply-To: <20240616-mediatek-drm-next-v1-0-7e8f9cf785d8@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Daniel Kurtz <djkurtz@chromium.org>, YT Shen <yt.shen@mediatek.com>, 
 Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718526553; l=841;
 i=shawn.sung@mediatek.com; s=20240616; h=from:subject:message-id;
 bh=+M7/ziTHyUjzVsIkA+lS1U5EWG9ZgvZdQWr6HMIP4HE=;
 b=gJuRLhb/os/1rMsyV7dGCSEg52neTkCIAzjcbk5s6ct4W+UtNk8qcSQChx6TeNnogk/Xc8ssK
 0hQB4Q/YYu+BxMuftvTNHO9nX2+7OdcuZo8IUfOhBYyYHekGiy7x61G
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=lq1w8BuWDINX+4JHjGHhhbAU5ICP+cL9VCj7wn+cEDA=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240616 with
 auth_id=172
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_012922_590995_8E675F09 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Support RGBA8888 and RGBX8888 formats in OVL on MT8195.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index d970cdce06bc..738244a6164e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -114,6 +114,8 @@ static const u32 mt8195_formats[] = {
 	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XBGR2101010,
 	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_RGBA8888,
 	DRM_FORMAT_RGBX1010102,
 	DRM_FORMAT_RGBA1010102,
 	DRM_FORMAT_RGB888,

-- 
Git-146)



