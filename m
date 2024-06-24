Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA7DC2D0D1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aXkFnl1gbgMS/cNx7a1wFEypeYkF+yjqkt3QVTPW/A4=; b=QQJmZSSF7W3qmOBkLbF5w4JYK/
	+zC1BC66goJoBmFPeBCvXOaTLq/j/Sn1f2JxyJgRoitlgwmZpFSLAD+g0A2BZ6YP7fOFk8iPdWmaV
	cjVjrh9c7ix6Af/SgnZ9m9Uz2IqbUbHVqcZYGmlAhgD2tVdtEJjrGbLyKJg/7Y9etoJ1pjSo+ZPzW
	DZwDYGOZ0y4XFS9AJF0dnbZNZPPOXjGgFn0qxS/1tdltBre47CubE0PCrpvCLrqOtw66l9qB4Pj2j
	DmB6USmzDNyflTtBQr107OkmqJcHw5AeFCNxLDcM4f1RLYl3me8eeYzO8hRhcymHZ6t1Y3/3MyfMV
	ZW+FfyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLkKa-0000000H2Sl-1Bs7;
	Mon, 24 Jun 2024 14:06:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLkKW-0000000H2Rx-403p;
	Mon, 24 Jun 2024 14:06:02 +0000
X-UUID: df0ce9ca323211ef9daba96ee3f3cc8c-20240624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aXkFnl1gbgMS/cNx7a1wFEypeYkF+yjqkt3QVTPW/A4=;
	b=DKVoMb6tFT9PKxp3WtKBlPdu+3YCc2wVYx+jVjgkz8quwLJTgU9uBMA0qNIRaUKX7CYktkaW7LYyYhPaHEIYqAnJR6RcVSQ5RwjYoiBg0PrF75JRTd4HzxZOZQy1RPDx3Ow5yStWD70i15qBGBKnFs+IVvzKewIey95GCbYcu60=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:0981b2bf-d6b7-4e2c-9306-8034435bed0a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:393d96e,CLOUDID:952f5f94-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: df0ce9ca323211ef9daba96ee3f3cc8c-20240624
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1817497104; Mon, 24 Jun 2024 07:05:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 24 Jun 2024 21:55:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 24 Jun 2024 21:55:47 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH RESEND,v2] ASoC: mediatek: mt6358: Add "Dmic Mode Switch" kcontrol for switch DMIC mode.
Date: Mon, 24 Jun 2024 21:55:46 +0800
Message-ID: <20240624135546.19275-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.655100-8.000000
X-TMASE-MatchedRID: gtvpwGSUn6ZUeA157rRKD2h77jTUbA6yoA9Le8XJpbovM0Gdq0fzqaJQ
	wY2eSfAKzQCEFcQpqpiD1p+T3PkHc6o+znd4MHO5l1zsjZ1/6axDGFvBeB2nXEuCjz4ggdtwU7g
	EPucszGcM1uAoS31c84on+M6nzz7EMtPBNyXS88a4jAucHcCqnX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07UngwKs5OejnuXgkVn0JDJE4akP/ZSUN3KtRKNFqtU0lysvSvATs2Zs4Wp3OuoY81CL+Y
	Okaei+S6pCYQ5VLYGbfrVNSLotorpd/GKMggNgToydMlEjRcid9fBQSbWi4PMsNjEULX/uuMIFA
	PLUElJzAvpLE+mvX8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.655100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 20DB901DD7FBC1216EBBCC858B30E70948715DD87123211B1B3E9751DD044ABB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_070601_012503_C1596137 
X-CRM114-Status: GOOD (  14.03  )
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

There are two hardware connection methods for DMICs on the MT6358. In cases
where more than two DMICs are used, we need to time-multiplex these DMICs.
Therefore, we need to dynamically switch the modes of these DMICs based on
the actual usage scenarios.

            ---- DMIC1
AU_VIN0 ---
            ---- DMIC2

AU_VIN2 --- ----DMIC3

When we want to use DMIC1/2, configure it to one-wire mode. When we want to
use DMIC1/3, configure it to two-wire mode.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
Changes in v2:
  - fix potential mixter-text errors, only allowing the user to set it
  to 0 or 1.

 sound/soc/codecs/mt6358.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 0284e29c11d3..9247b90d1b99 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -96,7 +96,7 @@ struct mt6358_priv {
 
 	int wov_enabled;
 
-	unsigned int dmic_one_wire_mode;
+	int dmic_one_wire_mode;
 };
 
 int mt6358_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
@@ -577,6 +577,39 @@ static int mt6358_put_wov(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int mt6358_dmic_mode_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
+
+	ucontrol->value.integer.value[0] = priv->dmic_one_wire_mode;
+	dev_dbg(priv->dev, "%s() dmic_mode = %d", __func__, priv->dmic_one_wire_mode);
+
+	return 0;
+}
+
+static int mt6358_dmic_mode_set(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
+	int enabled = ucontrol->value.integer.value[0];
+
+	if (enabled < 0 || enabled > 1)
+		return -EINVAL;
+
+	if (priv->dmic_one_wire_mode != enabled) {
+		priv->dmic_one_wire_mode = enabled;
+		dev_dbg(priv->dev, "%s() dmic_mode = %d", __func__, priv->dmic_one_wire_mode);
+
+		return 1;
+	}
+	dev_dbg(priv->dev, "%s() dmic_mode = %d", __func__, priv->dmic_one_wire_mode);
+
+	return 0;
+}
+
 static const DECLARE_TLV_DB_SCALE(playback_tlv, -1000, 100, 0);
 static const DECLARE_TLV_DB_SCALE(pga_tlv, 0, 600, 0);
 
@@ -599,6 +632,9 @@ static const struct snd_kcontrol_new mt6358_snd_controls[] = {
 
 	SOC_SINGLE_BOOL_EXT("Wake-on-Voice Phase2 Switch", 0,
 			    mt6358_get_wov, mt6358_put_wov),
+
+	SOC_SINGLE_BOOL_EXT("Dmic Mode Switch", 0,
+			    mt6358_dmic_mode_get, mt6358_dmic_mode_set),
 };
 
 /* MUX */
-- 
2.25.1


