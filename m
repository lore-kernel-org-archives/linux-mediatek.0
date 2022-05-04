Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6E9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZm9ehd5ApHjIGenjrC66w2rbqYzEHg85X76VcVBKgU=; b=0Pkx8pWnNixKcG
	Ok26n66B4+Av8QpZB4TMoJFqkc7I1UnsSPd+4TwuEvxxldaXWBrsWrBkYH+FG72egA1mccs4y8BQg
	P7NeNzCERh5+x+IiSXqZT0h5hwf92YKc035G63J3I9GDYgFMHuvuOqu8vk6MfyUVhTWLW8XMf9w1R
	tpKtU8XWGG1ZGZU3VjCAhhaELY6q3OGsslj8sH+AVuPPx7XhAJIASlAIjOeQ/kzHHkLZk6WBXYUWr
	nVYltExRXCRqCPIOJiMHgmcvjwHn5S23WTYpY8xRPfzvsr8QUQ2bLnZCf/uym5HlQhoyAvvDHwZLM
	T3XtHhbxn1n9PTMpIzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIXV-00BsMs-84; Wed, 04 May 2022 17:11:49 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIWr-00Brf0-IZ
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:11:11 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446OErA006119;
 Wed, 4 May 2022 12:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Qk3O9+dwBWfQfMGPzfJExY/QxQpXXpUqkr1HbbXKW/o=;
 b=YP1lnHJDvmebmhDOPVQ/fkkEOKhJtXezsFHcnKiwlUn5i/RYn/7Z7DHilW1EVwuY5U8v
 6pMmiJGbu3mQVAoTjlJhiCU74Pchkt69ERPfXIMFWE9pk39cn9m+q0ciiMOT2dEbPNc/
 vwgfd5V1LqoRaOrW0fIpadGRWc/zRgrvAbtodZbbVkltgSIUy8T3X9vvouP9t3CSdkNQ
 iKX6eM9iGu4rumMX7BbFBPY6rX5ZpIr1RTcvAj1PYs4zbMy4QWOljL6SyeQfehozEefG
 Fel3cInzET3sahShFHb7jTcRwB1+jAYsp/nTzWw0NIx0dNx17+vniV0Ra/0y3+lXDODd FA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fs1hpcxsh-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:26 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:07 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7273211DA;
 Wed,  4 May 2022 17:09:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <codrin.ciubotariu@microchip.com>,
 <lars@metafoo.de>, <cychiang@chromium.org>, <tzungbi@google.com>,
 <bleung@chromium.org>, <matthias.bgg@gmail.com>,
 <kmarinushkin@birdec.com>, <oder_chiou@realtek.com>,
 <steven.eckhoff.opensource@gmail.com>,
 <srinivas.kandagatla@linaro.org>, <alexandre.belloni@bootlin.com>,
 <kuninori.morimoto.gx@renesas.com>, <jiaxin.yu@mediatek.com>,
 <alsa-devel@alsa-project.org>, <chrome-platform@lists.linux.dev>,
 <linux-mediatek@lists.infradead.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 38/38] ASoC: sdw-mockup: Add endianness flag in
 snd_soc_component_driver
Date: Wed, 4 May 2022 18:09:05 +0100
Message-ID: <20220504170905.332415-39-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: _koVlLFTGB7xPE7EDzNIqAHAAw3G4517
X-Proofpoint-GUID: _koVlLFTGB7xPE7EDzNIqAHAAw3G4517
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101109_785194_7EF52F94 
X-CRM114-Status: GOOD (  14.54  )
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

The endianness flag is used on the CODEC side to specify an
ambivalence to endian, typically because it is lost over the hardware
link. This device receives audio over a SoundWire DAI and as such
should have endianness applied.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/sdw-mockup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/sdw-mockup.c b/sound/soc/codecs/sdw-mockup.c
index 7c612aaf31c75..288b55368d2a4 100644
--- a/sound/soc/codecs/sdw-mockup.c
+++ b/sound/soc/codecs/sdw-mockup.c
@@ -38,6 +38,7 @@ static void sdw_mockup_component_remove(struct snd_soc_component *component)
 static const struct snd_soc_component_driver snd_soc_sdw_mockup_component = {
 	.probe = sdw_mockup_component_probe,
 	.remove = sdw_mockup_component_remove,
+	.endianness = 1,
 };
 
 static int sdw_mockup_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
