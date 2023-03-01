Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7E1C64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 12:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JujL0zJMof6BeSlvA5bvmTeu3hHrd2enXVP0mfRzsrA=; b=FmNZyKuvTPUbDxool4TgzZ31Ms
	5Doo0ECLHLw0RyY1VAkowJKXJ4suxT0XZn1KLzOnaDvq0LlLBdZLGsAX0N2wHSdpYmfsWP53BDjrm
	J7vzBU7+xrz1U4JMqkVv8ubE6kdiqfzuRoxZr1QzQjVA4N6NDzrUpl4NwJYGD73UTq0OndDjFY916
	7PEHKDY16dorKltLcx5KqGEu6HhPzR/yo+X0K3ct0KmiPK0RU0d1CnjxxxoDTa/topO/OxinLLa0b
	qZwrigAONMvpPKyJpMSMsOMd2JJe2/4l5rk0BF8iG8wIPTbrJ6Vu9NDS/WGBkUgamHpHZ1BcO9WMK
	ZSBe4pnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXLN3-00G4PD-9V; Wed, 01 Mar 2023 12:15:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKF0-00Fqfv-Rw; Wed, 01 Mar 2023 11:03:25 +0000
X-UUID: 80d6e686b82011eda08d4d6090ec5a5c-20230301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JujL0zJMof6BeSlvA5bvmTeu3hHrd2enXVP0mfRzsrA=;
	b=egqhgcTJMRLOXnyC2Ff0GDXNNYeukR0m3xLRRHFCd+mnOv0KWkc568qo0c0p29Vxjn4Ei6J71AJj/05oUc4KGk2qAmCcN1teh94ANqg4KUQBxN6IMxGToEZPeu030fhfBsadFTvqC0lEekh4EsOs+7/LjJAwD66QuPGBoN+TSbs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:3ef8d431-6fba-426f-aa53-f973f35c2b14,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:a609deb1-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 80d6e686b82011eda08d4d6090ec5a5c-20230301
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1448282283; Wed, 01 Mar 2023 04:02:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 1 Mar 2023 19:02:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 1 Mar 2023 19:02:03 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] ASoC: mediatek: mt8195: add missing initialization
Date: Wed, 1 Mar 2023 19:02:00 +0800
Message-ID: <20230301110200.26177-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230301110200.26177-1-trevor.wu@mediatek.com>
References: <20230301110200.26177-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_030322_930408_7527DD41 
X-CRM114-Status: GOOD (  13.88  )
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

In etdm dai driver, dai_etdm_parse_of() function is used to parse dts
properties to get parameters. There are two for-loops which are
sepearately for all etdm and etdm input only cases. In etdm in only
loop, dai_id is not initialized, so it keeps the value intiliazed in
another loop.

In the patch, add the missing initialization to fix the unexpected
parsing problem.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index c2e268054773..f2c9a1fdbe0d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2567,6 +2567,9 @@ static void mt8195_dai_etdm_parse_of(struct mtk_base_afe *afe)
 
 	/* etdm in only */
 	for (i = 0; i < 2; i++) {
+		dai_id = ETDM_TO_DAI_ID(i);
+		etdm_data = afe_priv->dai_priv[dai_id];
+
 		ret = snprintf(prop, sizeof(prop),
 			       "mediatek,%s-chn-disabled",
 			       of_afe_etdms[i].name);
-- 
2.18.0


