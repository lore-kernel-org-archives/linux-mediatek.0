Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D2DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lHV3h0WAXDea8pwfzChq6RDX67a8D7h3SmSP3uYDtY=; b=K1Y0waZq/bsOxX
	F7wwxxUlMO+HqZblZrgzfYYQgoUNCPVwvf7VU5p7dcHf6rkkS9vZXEbsdp9vcWaaFNWfSInSEDnVa
	6vWPgQNir2X6SAuKAT6CJmfvNxs2YMjmhC+5TXQZsZadVtkug34YW/FcPjtwpmm5IlVDvMvDFmu7L
	WaqYuR1xmv5+AkAZVNXuzdvjJgRV9NQDvBpWeOA0kkinVczgM5IJMMxWOjHpM93ZnpfSTGeH34OlM
	JPJf9nRAjVocTCCXfJ05PxkIgFPpUJgq19T/wv1BBrKCpouBDS9cdvLmezvkmHMFuZZXeIQ6YrWFf
	CnA7Br1PFgCnpsDh9GGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIW7-00Bqnk-E1; Wed, 04 May 2022 17:10:23 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIVz-00Bqcx-Ug
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:18 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVq3001835;
 Wed, 4 May 2022 12:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=nYqn+GKDwKK25SWBWrV7lsZ0+GOZYWJKCzdENLiH9ww=;
 b=IVSgAPrHiyeXAxkKJRIj3MjXdfnaaFqhINpR1iewvscmkwA+fwtjsIpdomwDpVx9aiHQ
 p+8o32SAma5kWk3159tEYMzKODmo7Fpk4a6xSB3kA1MSLJIPguYUmN2T6TXwaxKM3TNG
 0H+9yNo3vQM9aMVZBnmSWHX0P8ejLIuPjgRV6t9Yhv6OBNv2Qto/607putTI2d2jZA64
 l5q2VjZpzk3expIu4ISxXt535LYtERC8jQzrR6DugxzZ4qO/CnwN8hGu3RwE77tatxgr
 qezTANdCYDusj86YeEoDJom7t/wNORMQre5GBswT0kGs62GI/xqlY7LOrHweaBlJekbn 8g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 330FFB10;
 Wed,  4 May 2022 17:09:05 +0000 (UTC)
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
Subject: [PATCH 01/38] ASoC: soc-component: Add comment for the endianness flag
Date: Wed, 4 May 2022 18:08:28 +0100
Message-ID: <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 7cO-NHnns4JYpS7pti-6iw9cMIvGoLBc
X-Proofpoint-GUID: 7cO-NHnns4JYpS7pti-6iw9cMIvGoLBc
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101016_077597_D271E6DE 
X-CRM114-Status: GOOD (  16.57  )
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

Add a comment to make the purpose of the endianness flag on the
snd_soc_component structure more clear.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-component.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 766dc6f009c0b..5a764c3099d3e 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -169,6 +169,15 @@ struct snd_soc_component_driver {
 	unsigned int idle_bias_on:1;
 	unsigned int suspend_bias_off:1;
 	unsigned int use_pmdown_time:1; /* care pmdown_time at stop */
+	/*
+	 * Indicates that the component does not care about the endianness of
+	 * PCM audio data and the core will ensure that both LE and BE variants
+	 * of each used format are present. Typically this is because the
+	 * component sits behind a bus that abstracts away the endian of the
+	 * original data, ie. one for which the transmission endian is defined
+	 * (I2S/SLIMbus/SoundWire), or the concept of endian doesn't exist (PDM,
+	 * analogue).
+	 */
 	unsigned int endianness:1;
 	unsigned int non_legacy_dai_naming:1;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
