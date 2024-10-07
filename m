Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144CDCFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 07:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foPbD0apNGD991d0AC2YtB9IbbEd440LT5kWdpFQixQ=; b=J3RhDjM2jTvabDON6t3kBXlU8r
	15Y8ollE2RrojrlsvfhUVcF+kd+ChGGfYqDbTvzRnEmJaMz/ry5wLkWKWI9HSvkjHflM6nRgaUGXn
	xUSXp77/KRRz6jSwk5KOtDJCMNA5b/vumE2xoLeIb3FO6UYFea9DQHkbr9ZqqYU3mwyu5zquEyWi8
	TK6Tcko/a1M/Lsw6ta8uikOLxTA8ATbrGrDG1t5T2A7Gz8ggngHxWUKr17HAuF1qmz0yZeqJuSVey
	otZc6suR1kYEFiMdVwziQEdpfjPDNzhCk20E6S/UgCUZDcZ8NMPQFvp0iaik9yxNNRp2NB8+nnafJ
	hrBogorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhsu-00000001Xhx-0XLf;
	Mon, 07 Oct 2024 07:10:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxhk1-00000001VuZ-3Odk;
	Mon, 07 Oct 2024 07:01:16 +0000
X-UUID: ed34210a847911efba0aef63c0775dbf-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=foPbD0apNGD991d0AC2YtB9IbbEd440LT5kWdpFQixQ=;
	b=l9Rb0/97cB6ETImZeMt8Hjk32F2oeEDVnSyf2VaJaYgKIC6lN2rtQPyFv7Vysfxc7U7vM4XvZhkxmFtclrCtT6bRu6DalnQGBEoY8Yt/lTYCQyS/PWwDA0oZjgkIMEn0T2v9NhSoG95v6UjnRdgiZHxXMJxpJzvg4AjansPUYtc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:51475b91-4766-48a6-943e-c65f1d7a14a9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:e67f6526-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ed34210a847911efba0aef63c0775dbf-20241007
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1338821416; Mon, 07 Oct 2024 00:01:07 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 15:01:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 15:01:03 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Adam Thiede <me@adamthiede.com>, Yassine Oudjana
	<yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, Alper Nebi Yasak
	<alpernebiyasak@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 1/5] drm/mediatek: ovl: Fix XRGB format breakage for blend_modes unsupported SoCs
Date: Mon, 7 Oct 2024 15:00:57 +0800
Message-ID: <20241007070101.23263-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.144300-8.000000
X-TMASE-MatchedRID: auvC3QTXpfnPl7LciQedTsDORqgKKiYqUAjrAJWsTe+CsBeCv8CM/dS/
	hfkVqvWdD2EF2wJcjhei2CV2woUvEFm72EsAF82QA9lly13c/gEK3n1SHen81eO53bHtM9W3QVh
	QktC6mCo6Av71VIw5dIAy6p60ZV62fJ5/bZ6npdiujVRFkkVsm0KRNS3nURDdYX20ZXgGme8uSE
	1WVaGxAVzM8RLhWMtt1IGf4vNKEEL3ugAbtT6cRkv95ivUjpgUh8kI3MxsG5XZAuBXdw+XWo6H7
	DI0GsVcMmI24qiENwrMpIbcl3IoA+q1XYAYw09q9Z1yWryVTWo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.144300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 692070F7659E55B9377DB75BF4DEBA22298D9C1AB68C9BAD0ADB1DCB47CD31722000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_000113_873491_E0AA2669 
X-CRM114-Status: GOOD (  11.74  )
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

If the constant alpha always enable, the SoCs that is not supported the
ignore pixel alpha bit will still use constant alpha. That will break
the original constant alpha setting of XRGB foramt for blend_modes
unsupported SoCs, such as MT8173.

Note that ignore pixel alpha bit is suppored if the SoC support the
blend_modes.
Make the constatnt alpha only enable when having a vliad blend_mode or
setting the has_alpha to fix the downgrade issue.

Fixes: bc46eb5d5d77 ("drm/mediatek: Support DRM plane alpha in OVL")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6..8453a72f9e59 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -473,8 +473,14 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 
 	con = ovl_fmt_convert(ovl, fmt, blend_mode);
 	if (state->base.fb) {
-		con |= OVL_CON_AEN;
 		con |= state->base.alpha & OVL_CON_ALPHA;
+
+		/*
+		 * For blend_modes supported SoCs, always enable constant alpha.
+		 * For blend_modes unsupported SoCs, enable constant alpha when has_alpha is set.
+		 */
+		if (blend_mode || state->base.fb->format->has_alpha)
+			con |= OVL_CON_AEN;
 	}
 
 	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
-- 
2.43.0


