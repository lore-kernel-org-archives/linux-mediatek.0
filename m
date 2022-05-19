Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BFBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvemhryF8Bb2+rO29KE5H8CgWVjCDptd9tWXakWRUkw=; b=JaMOsCP5gFHivX
	dacX0nAsWP2IN8Ralt0W44MG2p6SabX/NLhLG96F1G4TN6Hd18R6LyvuYVVqm9AML0ZVAs+zhzaay
	uDGgnzvgeeAnDKpJjIAdms3Or1wc9pBFwwUq0jCs6bh7X0R899B1WKrKPhlZNbIng5dG0zLpW63U7
	uwCWiiqU3QCCnytuzgRL2lwA1tDG2ku5Q7qE93HKDbg1S1QTe9FG/t+WZWOpoz9ixs2ZACBKRmC/g
	hRy73g3UBhAy97HprcA0/CNa/z4y0vSWBoU4SX+8I8hOAdB+yBcw2FndvIPQA7YtzpMs7bvknP56k
	aKpBpSFA4DHbdGUuxAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriNV-00872F-Ek; Thu, 19 May 2022 15:47:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJr-0083Rz-Vl; Thu, 19 May 2022 15:44:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=honbQV96RT4wGQVCBJ49Oesqj/VfCnS8zttmRmgGZz4=; b=jeUiifehBAJ7vtAbGyDMWtxU9V
 5yLTTIwsAhNFmv8F+sK9xWzQSwJjNBTySNnOWY6DMh4KYPxClqXSnm4Vip1A0pUBfrXD72/X5n30H
 jd1kEs+KsNVx1K9HgTOVuPSV7nNzV0oCYrCO87Dpl2+QzP6NFSE5Iz0cdiGeSml0/Al+hoTBy/leu
 iuEYfS1eFIvW7Tookfi/zM34JIFPBkcfqdszVOZ/GZVeG68zYprfobtZ4lNt8xY5FXMrnK2ToDUmV
 cpUcfS0lFPfy+KAyMWFskyRC2O7gsGPFp3fbJyfD8O1xwz1P3SBfI2jveK3sTjGlt+DQsSR0jCy5z
 yclzzQAg==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQW-LI; Thu, 19 May 2022 15:44:06 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k124002261;
 Thu, 19 May 2022 10:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=honbQV96RT4wGQVCBJ49Oesqj/VfCnS8zttmRmgGZz4=;
 b=JJqiiYQjkKr2XvWMkR8tNwSqVJp+YSWsMJkSg5E15kElZDaLSKMCDLT36wdwrudjeksl
 JgNU/huoLRvceBA+ha1QR7VIurYLvMLsjICy54k6lX+7SWKqT/ptmuilKjX/oeQLaAr5
 VwazGdJUdvbmF+MCOYi78H9XGOFe7Adod9LfMKaz32pNV1FAEgKiLFRseAIDgYo8LDYy
 a0OR7NiIrZ63jJjOqrTMwjmDuH8VKEWDh9crxzjTLSkHvh6ikFbU0QSO+7UTCvhpEtq5
 sRkK+HVqAFjiUXQwubahPE7RCep3x4mGbelpGNgsV5QITCe0avLuoCfk5NKcFFSGQymR MA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:38 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CBEF511D1;
 Thu, 19 May 2022 15:43:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
 <nicolas.ferre@microchip.com>, <nsaenz@kernel.org>,
 <shawnguo@kernel.org>, <linux-imx@nxp.com>,
 <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <daniel@zonque.org>,
 <srinivas.kandagatla@linaro.org>, <linux-rockchip@lists.infradead.org>,
 <krzk@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
 <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
 <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
 <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 34/56] ASoC: dwc: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:42:56 +0100
Message-ID: <20220519154318.2153729-35-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: VseCsXBrEPJX1DXWVtuHsVN7M3OYMRpM
X-Proofpoint-ORIG-GUID: VseCsXBrEPJX1DXWVtuHsVN7M3OYMRpM
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164403_044750_44CD74FB 
X-CRM114-Status: GOOD (  14.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Now the core has been migrated across to the new direct clock
specification we can move the drivers back to the normal set_fmt
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/dwc/dwc-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index d3778d2d739d8..e794e020052ef 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -387,7 +387,7 @@ static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
 	.hw_params	= dw_i2s_hw_params,
 	.prepare	= dw_i2s_prepare,
 	.trigger	= dw_i2s_trigger,
-	.set_fmt_new	= dw_i2s_set_fmt,
+	.set_fmt	= dw_i2s_set_fmt,
 };
 
 #ifdef CONFIG_PM
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
