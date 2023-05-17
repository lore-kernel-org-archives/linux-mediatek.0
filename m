Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56156C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hnp/57gXsk+TNT/fI9Yb95VTEke89vqAlK7MkECjAkM=; b=CDMam/oOmlG8fwRKMNdTyxpg3p
	6Nx8k3mBloDzUr++DZp5A+L042wklYsZBzjHOht1tNA+YN5W9+GXutRDgsCj3vcW5yWpDcgXmCRrw
	ERwwtLFcUPIZcJjFxsrGEMWGiqN7HM96nJogqXusweaqNPd8xyeVm1MCAca6UaruwjSVhBF2/wU9A
	V15gQrmiAkrFt6NHISGXZg0tkkMQjjBG0ywQqYp3h0ihqFRE5yZeNG7Fx1ywcoX4tYv86ibCUtGUe
	eJNCUflDnaVm7MzvKoYgih7R9exk+RbVj2FN6ULRqjyisA9gJQEd9EcVesv7366uftxbqGXSE7y2X
	Dwtip/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFhr-009gKH-2u;
	Wed, 17 May 2023 11:52:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFhk-009gH7-1d;
	Wed, 17 May 2023 11:52:29 +0000
X-UUID: 4956b6f8f4a911ed912e1518a6540028-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Hnp/57gXsk+TNT/fI9Yb95VTEke89vqAlK7MkECjAkM=;
	b=ELnfav6LkboVr2GTecY/zJ1/9cm8y8w5WYrkUG/rzgVv0trmI9Dr4/YMAAFPoRKaBlZ3k1BJQl3JMD7RoPJ5HbqbyzCLWDZ+cQ29eCeHKswJ3582Zi79B/wA3MpEZERZTN2TnzpBayjFRHxIE/9JGKtTxeMHsSMlwGU/naRvaE8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:39c46459-cf69-4102-a0e7-b4d28df7e62b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:b91c26c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 4956b6f8f4a911ed912e1518a6540028-20230517
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 41422275; Wed, 17 May 2023 04:52:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:52:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:52:20 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <bicycle.tsai@mediatek.com>,
	<ting-fang.hou@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND 1/4] ASoC: mediatek: mt6359: add supply for MTKAIF
Date: Wed, 17 May 2023 19:52:16 +0800
Message-ID: <20230517115219.532-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517115219.532-1-trevor.wu@mediatek.com>
References: <20230517115219.532-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_045228_547505_D9B3FFEF 
X-CRM114-Status: UNSURE (   9.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are three output data pins MISO0, MISO1 and MISO2 for mt6359.
UL_SRC should be enabled when MISO0 or MISO1 is used, and UL_SRC_34
should be enabled when MISO2 is used.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index cb487e63615c..d6a93da2644e 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -2358,6 +2358,10 @@ static const struct snd_soc_dapm_route mt6359_dapm_routes[] = {
 	{"MISO2_MUX", "UL2_CH1", "UL2_SRC_MUX"},
 	{"MISO2_MUX", "UL2_CH2", "UL2_SRC_MUX"},
 
+	{"MISO0_MUX", NULL, "UL_SRC"},
+	{"MISO1_MUX", NULL, "UL_SRC"},
+	{"MISO2_MUX", NULL, "UL_SRC_34"},
+
 	{"UL_SRC_MUX", "AMIC", "ADC_L"},
 	{"UL_SRC_MUX", "AMIC", "ADC_R"},
 	{"UL_SRC_MUX", "DMIC", "DMIC0_MUX"},
-- 
2.18.0


