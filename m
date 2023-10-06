Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BEEE92FF6
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 07:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93orfpqZDdf36gAkqWIQODvWhDa0xsK8NTO91hVC3Mg=; b=T7GGYYLxEwGo845LFYdZt2mRX0
	A27MGgNMDJKihrhpx3OGlTo8DryQirg6jL0vSTwpYg60kIDP0Q1xrVOd6HUT9C2Kr83tf1B6pGWJ2
	W+2xRkGh4ET0fHeYNZqbu+ZyKKQAhH9mCCjI9uYh2UhzZhG82fHjoOH+xFTpj5h+/5dO+UtfNA0+s
	RoojeSOFgHPObbXMbcgspoMzYRe7ev/GiPlnfTqz+bNpaO3d6k+fabJn7/wiU+3SU858ot0IyNcCQ
	mzgJ/StkBgzO/ts5AmnAeL+lF3ShX6RhS4xCzLNcGZ8xfH7ShCnziLX0Pfhyp+ntc33dM2xXTN62c
	9RGyo3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qofRB-005B8M-1S;
	Fri, 06 Oct 2023 07:39:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qofR3-005B0o-1g;
	Fri, 06 Oct 2023 07:39:50 +0000
X-UUID: 8432813a641b11ee86758d4a7c00f3a0-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=93orfpqZDdf36gAkqWIQODvWhDa0xsK8NTO91hVC3Mg=;
	b=gBfkQ0vukrIp1fR6jrvJ8S72u3QlBYZPOJeMpVMLpRiRAbgEc+UWMRPZcKQ2fz0qS2UU2RcoQjpqgFeEbFwG+OJB1TW8oUfcDQ9/irgjYLgpS2hSDEoTzg4ckWsQRnphaVirgQhxLVFSjCwY3mPA2fJSrru8pk7JtVuGzP6+Hnc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:d22ef340-4438-4158-a6ee-8128279fd282,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:8bde82f0-9a6e-4c39-b73e-f2bc08ca3dc5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8432813a641b11ee86758d4a7c00f3a0-20231006
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 513108087; Fri, 06 Oct 2023 00:39:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:38:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:38:40 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Singo Chang <singo.chang@mediatek.com>, "Nancy . Lin"
	<nancy.lin@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	"Hsiao Chien Sung" <shawn.sung@mediatek.com>
Subject: [PATCH v7 21/23] drm/mediatek: Fix underrun in VDO1 when switches off the layer
Date: Fri, 6 Oct 2023 15:38:29 +0800
Message-ID: <20231006073831.10402-22-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231006073831.10402-1-shawn.sung@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.397400-8.000000
X-TMASE-MatchedRID: r15/GZU7YAxQlz7zzALRPqKa0xB73sAA7yWPaQc4INS0rcU5V/oSe8Ht
	HEmxq9+Y8G/bfvdFXyUnOAFYLaUTjVm72EsAF82QA9lly13c/gGSiza26cvwNH5h6y4KCSJcje0
	jgce+svLi8zVgXoAltsYlDcGKIsCCC24oEZ6SpSmb4wHqRpnaDhEa9sDDkr22LbG6i7W98dbd1i
	4KTSE2f89R4TWA696sOygFfwAQBHQ1pTQn8aCaylDADnj2lwwmQemDxUAjl6nn/SfPR3Dh3Ema3
	zYT97IFAYfQIAUhBayZvmCbKVb49sZL6x5U/HridGByp+zdaDg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.397400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 873682982834D8809BE0F82F0A91BE21551E3F3F614D78253E6819C916A67B552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_003945_568671_1155CC9A 
X-CRM114-Status: GOOD (  10.47  )
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

Do not reset Merge while using CMDQ because it doesn't wait for
frame done event as CMDQ does and could lead to underrun when
the layer is switching off.

Fixes: aaf94f7c3ae6 ("drm/mediatek: Add display merge async reset control")

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_merge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
index e525a6b9e5b0..22f768d923d5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
@@ -103,7 +103,7 @@ void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt *cmdq_pkt)
 	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
 		      DISP_REG_MERGE_CTRL);
 
-	if (priv->async_clk)
+	if (!cmdq_pkt && priv->async_clk)
 		reset_control_reset(priv->reset_ctl);
 }
 
-- 
2.18.0


