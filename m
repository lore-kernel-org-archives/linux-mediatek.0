Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FADC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGNhwp42eubQiy4fKePr+aZg218DHtsJxffoNUVs/A0=; b=qOpowpwvxWdOey
	wegiEtuMhMef1aFvrs1k1rEtzWrSuq6BaER3HsqwmZryMQ/hIJRUnw06OJA5LGWRh+Ie9oLRVWJXC
	TqfveLFw67Lc4x3rlPxXD2vSRhA080QXjkBJBUzxZhCRp7SHNCV7Us/Yr5gzgNFVunwI12dq+fUZ/
	scM/GVsiqrxBbZrymmGUcPVxEfIwTk2xeGxrlK5JU9Usbm4iVzVMT12MC4eLlCOW3ez5XlkGfbjiw
	RZtoZtRxVVjXB1Sp3qBpfuvnTF9kUx1IamcoAxnmzSC+suaNcvG/7X/Zsk/mBHJ+BY28jCHR1AaP1
	nAbdznKRMQyVy2KI2QgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nriOP-0087vE-42; Thu, 19 May 2022 15:48:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJt-0083TN-68; Thu, 19 May 2022 15:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=O1k08BLLSrWLN8bDTTYO6I9etCPuXwIsP0TRdmjUUh8=; b=TLpnz007pQzPFSe0uU98jKi+E4
 Ioffri4ccV2RTZwc9W37L9JcC+F1vsgWW9Iw0vKsx2DRFRulU0crmFrSV4NF/LWsXivuylCHILGzP
 NBRgOEplzR9EQKWkyL4bAMtioCKHzoIXfkmyZUS6cG2mFf/e/CwQzwmiL3nnmw1creD+Nd3rzNfE6
 VagTsAWXwaBTtVBApr+/Eh8dRSmcnAlThIhnx19A0EiIlHkxCOjtFepQoKLgDHaqIZoIG0P6XDSSu
 3nvoIZuoo9rbFX6yfRxo4plY+EOz7axYrUEPJKeLqYX37ZA47gALFmTv8zToICxP3YESgcda5Fv29
 FequgfsQ==;
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]
 helo=mx0b-001ae601.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nriJm-00CqQl-LF; Thu, 19 May 2022 15:44:07 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k127002261;
 Thu, 19 May 2022 10:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=O1k08BLLSrWLN8bDTTYO6I9etCPuXwIsP0TRdmjUUh8=;
 b=lnkQKKHHuHjFy2bWDCn0K8JZyA+GsPfpvFgZ8fqdM3BOiG35hdgPqaNpjQdsSrkj7Yf6
 lLQfqfot2Htp2f4p2B5VtLD7M31mLzMxKDe0gK3iWoZA/8zc2ES0NKcd/kZ+d4CGyhp0
 vbglizWFVHzMOLJ8ncPuvYJGW6mS0fkaRV7tbgzqEpAZEyrPvld/OPJju8LzLbO6DQEU
 P+EpLEuGVy8l14E3a7Fdh8Z4Kq4hPmOGRNUmJSwU7O72KAe7t+YBxeA5nCo3d8JDsVKM
 ttTS+KvBrQlEwv5NLq3EpoiNmjPkXY4/jN9gB1hOvjQQJegSUx9dCkbYs1V/iU8U2/Wq Fg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:21 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 10C0511DA;
 Thu, 19 May 2022 15:43:21 +0000 (UTC)
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
Subject: [PATCH 37/56] ASoC: img: Rename set_fmt_new back to set_fmt
Date: Thu, 19 May 2022 16:42:59 +0100
Message-ID: <20220519154318.2153729-38-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-GUID: zERY7-qXw1jE8CwXTYUsZQAsiyaYzUHL
X-Proofpoint-ORIG-GUID: zERY7-qXw1jE8CwXTYUsZQAsiyaYzUHL
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_164403_048575_CE555825 
X-CRM114-Status: GOOD (  14.66  )
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
 sound/soc/img/img-i2s-in.c  | 2 +-
 sound/soc/img/img-i2s-out.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 79e733bc0ae69..97cab6d95b169 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -373,7 +373,7 @@ static int img_i2s_in_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
 	.trigger = img_i2s_in_trigger,
 	.hw_params = img_i2s_in_hw_params,
-	.set_fmt_new = img_i2s_in_set_fmt
+	.set_fmt = img_i2s_in_set_fmt
 };
 
 static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index d92539603d6cb..9ec6fc528e2b4 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -381,7 +381,7 @@ static int img_i2s_out_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 static const struct snd_soc_dai_ops img_i2s_out_dai_ops = {
 	.trigger = img_i2s_out_trigger,
 	.hw_params = img_i2s_out_hw_params,
-	.set_fmt_new = img_i2s_out_set_fmt
+	.set_fmt = img_i2s_out_set_fmt
 };
 
 static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
