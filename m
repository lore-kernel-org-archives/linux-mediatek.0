Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF43C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 08:44:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 716D7206B6
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 08:44:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uYkivz/H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PS0nY6cn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 716D7206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ndP8abtfAx//EhflkNPiesNsBKxdSA72rtapSWDtfP4=; b=uYkivz/HB0x7mAnSAubHcHAUT
	RPVZq7se1tWh7qv+xfdqevC9izrQel+pGPKDmkMK0j9qXQzmTlrxRoQCzNbMwi5N5YMZjsT0Hh7hQ
	RP6MZ7BUJUv9jTqlnmYdsf4AONVq2H+J2vJT+i4gatPBwO00lbBf/Jx7voZMY6QPcFEPqYXUNRrMz
	YiGqxzEK2hJCc7EqdGM+hEtgQLeOADlPfDvXUwW1XXj7iQ+uuDvOKhBEkpnYyBlG/dO8gN6y7pJ+1
	CZF4jY0YAUIvIZt9Imf6woeAWp+UHWuGEivkJTezU1pDhySPSM2yrNsvgUMRT+O+YaabBWM4Iwyl2
	vR+2hN6Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcPG3-0006sP-Np; Tue, 10 Nov 2020 08:44:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcPG1-0006ri-DF; Tue, 10 Nov 2020 08:44:06 +0000
X-UUID: fe463dc1bee548098b20f04abc99feca-20201110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7Rq5/V+Gte3Cggvb6iriwAipGgJyx2ffchXlZoNHTwk=; 
 b=PS0nY6cnbRZQQwA4XEdPTDj/4JPAwGWTUVzZlQbRaGpcO4GaLQF6yq1mbgH0xLq3wCU9WbiZQPC1CHCfqy+3fg/NECHb3TBN1FR54QZeM+ZnUUOyLeMbNQ9yly3WSUopNulcuC/za5HvH3PPT/yN9qU6UIMJWEjGZdrywLOgT1E=;
X-UUID: fe463dc1bee548098b20f04abc99feca-20201110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1417162980; Tue, 10 Nov 2020 00:43:58 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 00:43:10 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 16:43:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 10 Nov 2020 16:43:09 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Alexander Tsoy <alexander@tsoy.me>,
 Nicola
 Lunghi <nick83ola@gmail.com>, Christopher Swenson <swenson@swenson.io>, Nick
 Kossifidis <mickflemm@gmail.com>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2] ALSA: usb-audio: disable 96khz support for HUAWEI USB-C
 HEADSET
Date: Tue, 10 Nov 2020 16:42:54 +0800
Message-ID: <1604997774-13593-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
References: <1604995443-30453-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_034405_669370_33102D3F 
X-CRM114-Status: GOOD (  13.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-usb@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mediatek@lists.infradead.org, Macpaul
 Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Ainge Hsu <ainge.hsu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The HUAWEI USB-C headset (VID:0x12d1, PID:0x3a07) reported it supports
96khz. However there will be some random issue under 96khz.
Not sure if there is any alternate setting could be applied.
Hence 48khz is suggested to be applied at this moment.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Eddie Hung <eddie.hung@mediatek.com>
Cc: stable@vger.kernel.org
---
Changes for v2:
  - Fix build error.
  - Add Cc: stable@vger.kernel.org

 sound/usb/format.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 1b28d01..7a4837b 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -202,6 +202,7 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 		fp->rate_min = fp->rate_max = 0;
 		for (r = 0, idx = offset + 1; r < nr_rates; r++, idx += 3) {
 			unsigned int rate = combine_triple(&fmt[idx]);
+			struct usb_device *udev = chip->dev;
 			if (!rate)
 				continue;
 			/* C-Media CM6501 mislabels its 96 kHz altsetting */
@@ -217,6 +218,11 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 			    (chip->usb_id == USB_ID(0x041e, 0x4064) ||
 			     chip->usb_id == USB_ID(0x041e, 0x4068)))
 				rate = 8000;
+			/* Huawei headset can't support 96kHz fully */
+			if (rate == 96000 &&
+			    chip->usb_id == USB_ID(0x12d1, 0x3a07) &&
+			    le16_to_cpu(udev->descriptor.bcdDevice) == 0x49)
+				continue;
 
 			fp->rate_table[fp->nr_rates] = rate;
 			if (!fp->rate_min || rate < fp->rate_min)
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
