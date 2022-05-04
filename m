Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE00DC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iR3a9D8aRvwLsoWdrZ6Icx0ABil0OrI/KMIKsiG69UQ=; b=SLjVBJ6lwNGDFm
	SKFQb7/5M6IZCskm1SGmhDPqaBroCaXkL+yWE74Fp1Au3WMLNL1nroMzwkzZ+fLjQtxW2wYiaH7QZ
	1i+554Bnb4NGHIcF3ZFnFLcwGodZo988PeMdDDpY9mA7q+OFt7x9xlRtP0S6TiFPwae+6C+lTH7AP
	g0O/TpL0V1AjDBpNcx50ly4Mzb2zERlcCvRoPyMwcrVduusPRZwFjEQn68mXoh2woVjvWt00kHkj2
	jf3zncJK9vHA0Vke2zZMMQd9tdshISzGw32FFiFKeh4Bxpx/DBQxDSrupR+k93a2oiyfSX68QKTiE
	j5CE0GDyObsPtaJvMwQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmIWG-00Bqwo-HY; Wed, 04 May 2022 17:10:32 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIW1-00Bqgo-8Q
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 17:10:19 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2446CVq4001835;
 Wed, 4 May 2022 12:09:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=EI90RMcyBIAi4FClwD/aIfZyhedVb/sh3OETIn8Up8w=;
 b=FWKhKdqwQmaHr1od8bZHvQv0X26JEVVSXN+3qltM3MbLE0Q7+aVOI5DEs6phZER8N5M6
 1UdYBmVZQssJ0vjKHu1h3fgjw5Q7Ji7WMLcBZrxkiAkvF89oKpLwD/ZxeIjSk6UY4jL+
 lYGdbv8vGd+04jfFn1De5+9yv9ndKJO7jJg0bew1dhUz464UoX8d/BxY8/3UG3DKxCgg
 OODTEmb3gVRJLOCtiljMBFxVEiA/0TDTbk0ROU6R/TwmSmuxISl3Zg2kq7lJ0VQHaC6V
 cERkusEFLuizU5vFmlKOSs6FCF1tOA1n2Re0yv1DSGceHLo57i9O23xp75lp+L5vZlKA Ew== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fs2h2d8fp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 04 May 2022 12:09:08 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 18:09:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Wed, 4 May 2022 18:09:05 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 493E511D3;
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
Subject: [PATCH 02/38] ASoC: atmel-pdmic: Remove endianness flag on pdmic
 component
Date: Wed, 4 May 2022 18:08:29 +0100
Message-ID: <20220504170905.332415-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: Dl2PnAZgHnN7DisnkOvXW_Y4Hvvsj-yz
X-Proofpoint-GUID: Dl2PnAZgHnN7DisnkOvXW_Y4Hvvsj-yz
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_101017_322221_AD6B9146 
X-CRM114-Status: GOOD (  17.12  )
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

The endianness flag should have been removed when the driver was
ported across from having both a CODEC and CPU side component, to
just having a CPU component and using the dummy for the CODEC. The
endianness flag is used to indicate that the device is completely
ambivalent to the endianness of the data, typically due to the
endianness being lost over the hardware link (ie. the link defines
bit ordering). It's usage didn't have any effect when the driver
had both a CPU and CODEC component, since the union of those equals
the CPU side settings, but now causes the driver to falsely report
it supports big endian. Correct this by removing the flag.

Fixes: f3c668074a04 ("ASoC: atmel-pdmic: remove codec component")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/atmel/atmel-pdmic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 42117de299e74..ea34efac2fff5 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -481,7 +481,6 @@ static const struct snd_soc_component_driver atmel_pdmic_cpu_dai_component = {
 	.num_controls		= ARRAY_SIZE(atmel_pdmic_snd_controls),
 	.idle_bias_on		= 1,
 	.use_pmdown_time	= 1,
-	.endianness		= 1,
 };
 
 /* ASoC sound card */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
