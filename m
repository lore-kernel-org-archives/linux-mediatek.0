Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9936C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 03:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4GpAIRZdMhZSTsJPSVOYqCnYUdwUP7d/1luMYhvJfaI=; b=h3GxIyMTfP3VdRNbH/xwkhKNK3
	uzYfFmP6QoG92qFf2hqHptKw7mKTjc9pf4Hc9cf/1+n7zsW/n1c4yxPuYdWf4oOuIbTOY0tq+cXNH
	5aT11paIhhFk3KCgQe1l9b6LuObguxlco2rq1cDez1vUnmiUHRkkS0Hc55el5ZxFF4Td0mNdFyeP0
	yEM/u5bM9EtID8bdhT0rRFy5PdnV+8jyP1zjZDZoyM+l9A/a58KTBpa4T4cmXazOjyZETPw9ZU5Tj
	n3Q8TlzoaYwMWC9w7FpokyT3/LQCEIv2pQiSC3MZHhkQfJUI2qP/2476YnLQzUlH7uv2HUA2d0kY9
	xesdWMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZMDj-00000003XkK-1vct;
	Thu, 01 Aug 2024 03:11:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZMDg-00000003Xja-3EHv;
	Thu, 01 Aug 2024 03:11:14 +0000
X-UUID: b209ac264fb311efa6c87f6b4542ff6b-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4GpAIRZdMhZSTsJPSVOYqCnYUdwUP7d/1luMYhvJfaI=;
	b=piyTGWGqAqtDF6xg6X7BFIfGnwJqE/4YJru5cHQINeQkCeZlE9c45D/GbkK6L4uLCTOTNO/W4BCTa9sy120NjoTLPLGDk5t4USv3Lrg9ZeVqfK6+hs3iLeuaUS8ZGLtY/zc1sULtqS0duCI166uqjERe8QFaNQWf22t7mjdDFHU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7fbf9828-577e-4df6-a5f8-213b150c97b5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:09b102d6-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b209ac264fb311efa6c87f6b4542ff6b-20240731
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <yr.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1526648282; Wed, 31 Jul 2024 20:11:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Aug 2024 11:11:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Aug 2024 11:11:02 +0800
From: yr.yang <yr.yang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, YR Yang
	<yr.yang@mediatek.com>
Subject: [PATCH 1/1] ASoC: mediatek: mt8188: add register to volatile_register
Date: Thu, 1 Aug 2024 11:10:30 +0800
Message-ID: <20240801031030.31114-1-yr.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.381700-8.000000
X-TMASE-MatchedRID: rHai9PqIGYaLwgJA7qJvFMnUT+eskUQPuLwbhNl9B5UeaAmZIX542Jah
	y9R3rl2Rpg88JvjuALCKmwyUcf+f3LL5lB/vTWKDA9lly13c/gHt/okBLaEo+H5h6y4KCSJcpMB
	UwgqWxUfwHUSrzAMoARAISLmT6dDEHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgW/KZGkrHlNGg3u5
	jQHadGg6dqnoOcTqwEj6l9Lqw9rFdR8lOQtOtaFme5sbOn0w4k1/nMyHDPr2V8yzUl7m/92666w
	hc7npsj4sOrsb4iT/K/bbEolHIgZUOc7GjOamnWv5a9cmIodEszD8HZ4XvJ2ZRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.381700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F12722AC61B8F341386EF201A7D976671705BBB306208B188874C6169E7692B12000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_201112_836029_E008E887 
X-CRM114-Status: GOOD (  10.20  )
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

From: YR Yang <yr.yang@mediatek.com>

Add AFE Control Register 0 to volatile_register.
AFE_DAC_CON0 can be modified by both SOF and ALSA driver.
If this register read & write by cache mode, 
the cached value may be not the real value
when the register modified by other side.
It will cause playback or capture fail.
Need add AFE_DAC_CON0 to volatile register.

Signed-off-by: YR Yang <yr.yang@mediatek.com>

---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index ccb6c1f3adc7..73e5c63aeec8 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -2748,6 +2748,7 @@ static bool mt8188_is_volatile_reg(struct device *dev, unsigned int reg)
 	case AFE_ASRC12_NEW_CON9:
 	case AFE_LRCK_CNT:
 	case AFE_DAC_MON0:
+	case AFE_DAC_CON0:
 	case AFE_DL2_CUR:
 	case AFE_DL3_CUR:
 	case AFE_DL6_CUR:
-- 
2.34.1


