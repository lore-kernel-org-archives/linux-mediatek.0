Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC5CCD98CF
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0HX3ZYLkpoP4OKdcJqiss02RhOC7aeNFTtkhTsIn3N8=; b=CPdn8+9GMDVPiTQcp1rPmRLA/Y
	zNUIetqeWSr/Si9MuWUxTWrzgmX+LRKCOsZ2MAyv0iAsB9Zne/YZxkWW8Kvh6DvlrVGt0oODee6Ax
	hukavl9Q1KuITSsDjTb+6p/7ozvepgR0YM23mycrqe5bn5E6XkTUXC2Pfa+CHo24m91XuKp20Wmqe
	IWDBDEftCRdTM3efepvYB/yEWMaZzWMxqrnoA1mEpB8xZg1dICU4sDyUQHlLL3Mc/+LBoAsaN+cEs
	4q/8p5ZwLD+xLqolYp0t9gvYWjHOCRpYK5nN/fBs6iH9THWDS15PitT17sJMeMR7liVmtoADMLzBl
	0DtXvaAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYYVV-0000000CdZb-1Y5z;
	Sun, 14 Jun 2026 00:15:21 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYYVT-0000000CdZ3-38iq
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 00:15:20 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c31212104cso8938225ad.2
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 17:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781396119; x=1782000919; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HX3ZYLkpoP4OKdcJqiss02RhOC7aeNFTtkhTsIn3N8=;
        b=EGzu4gmQAFnNFJCfCW0s5kXGnkWmh41YMQm+enuYq5ZOw8MLuJ7VR/qNmHRcR7pkYP
         odPF49LofQ0Hy2373npK9Se9x34CH3xYexoclPlgaCGKK1DqDQP0jK2GerFNQiA+t9rH
         SvYeWY5RPc1XOt6jBPC2iAFg6NdLVbEYqXyq8qIjJSlhrKer8wMSEVXaOwXaZUu+mU5d
         CnhBDC79zczhin1eRZF6aax5LFh3tYuDNyZ1rApmng8IQ1rDwgndB/pcV4BGTVgv6biD
         PRJPkuGu3hMlv2iVWd6NhsdGRWspPULmUYWiNIRh6HUiQub6ObLamUMsFlBSsjCbMjZs
         pGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781396119; x=1782000919;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0HX3ZYLkpoP4OKdcJqiss02RhOC7aeNFTtkhTsIn3N8=;
        b=mhjJBxNvnjXL5vRGiVOz9kWJB3WwDbqvg/Z32F66Y0B+bgh8YbnV507ZkOlB+MRL2C
         g6OZOU0C94N7WT5q73Rs/D98ilBS7MqJP6QZD6ORlseRSp0k1TwhT7fmQ2f0Haz5Kg6s
         w1QdIu/WSKE47kwYrbJJuM66JfHr7svurK4iDuXnaEWHv8xaIZWC3OToYOGc4dBltqZm
         pSenVPmjNNmw22xBjq2/zkXyun+jxqqj/pIRSkBN1fOfZVJPz+rSXsPMrf/RxBTZLRHe
         qZqmpC57ZmpltXBM/ZDPCPtOEBfwQC7L3sNrmN2U16LYxbxjgqMQwEDb6mu5lXk66W+H
         f73Q==
X-Forwarded-Encrypted: i=1; AFNElJ/qWCbP+Bgeqw6I4hXRBcLCFJh4uSaXmrsRgcNqZRjxd3HT3BC1oNFUoomNXjz0nHw7lQYZTVnROwHTDJk2Cw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFc8Bhdmza+EWXHhfX9Wm85BqZE1536vG6IV/p2dkQnCRYt8SO
	eVKQivhbIq43JVsnLdohrOIrNBYoC7sqk47ia0L5oGJNqWYcuqhNj9K/
X-Gm-Gg: Acq92OFs8xwdeSjF/AlEGxLqZmOlAB6jvSElnskQHboAeQdmvFB0GF+/1Owoh8OCPVC
	GO92DMx565yXT72erf+EB6h6PEDxfVsdkTiLvJQeCuTf69+1NybzNTlXSGqLCwFU9tn3AMylOZ1
	dgI2kjsdprNJaGDjrt2i8XTrAZknlh6JABbnTwJc1LgVhcRMQwY5IuCOUF+EvIWSj3OB6G96yPH
	aN7XJ8BQSmCpOosd6sg+0q00I+S1mXonnxQaBjcRKPVJOu8ZYLhKsgjjgphjqJxvKyTTLFfFC+y
	yNSeE1mn6lpvhlpRS9E282h5haVk0vi9NlsU7HhyUKDXQXd9TIKkm/pLqzVPjNiY6OyW080wNZY
	BiQyYVMKkcGo9tl6zOCM8fn1Ccdsqmp4Z9jX6GKUnC8o80X1NMXiM7g+b1tE4jAE5noWfSPdjUF
	04yEIn77R1qk5Uwk1S
X-Received: by 2002:a17:902:f610:b0:2c1:88a1:983c with SMTP id d9443c01a7336-2c6642a7bafmr56205255ad.28.1781396119131;
        Sat, 13 Jun 2026 17:15:19 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4330782b2sm63552385ad.67.2026.06.13.17.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 17:15:18 -0700 (PDT)
Message-ID: <6a2df296.6b2684af.263065.8200@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 08:14:11 +0800
Subject: [PATCH] thermal/drivers/airoha: Fix low trip clamp using wrong
 variable
To: linux-pm@vger.kernel.org
Cc: Rafael J. Wysocki <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Christian Marangi <ansuelsmth@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_171519_811477_138562E5 
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

In airoha_thermal_set_trips(), the low trip validation incorrectly
clamps 'high' instead of 'low':

  low = clamp_t(int, high, RAW_TO_TEMP(priv, 0), ...);

This causes TEMPOFFSETL to receive the clamped high-temperature value
instead of the requested low-temperature value, making the low-temperature
alert threshold identical to the high-temperature threshold. As a result,
low-temperature interrupts can never fire independently.

Fix by replacing 'high' with 'low' in the clamp expression, matching
the symmetric pattern used for the high trip on line 264.

Fixes: 42de37f40e1b ("thermal/drivers: Add support for Airoha EN7581 thermal sensor")
Signed-off-by: Wayen <win847@gmail.com>
---
 drivers/thermal/airoha_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_thermal.c
index b9fd6bfc88..439aa011b7 100644
--- a/drivers/thermal/airoha_thermal.c
+++ b/drivers/thermal/airoha_thermal.c
@@ -273,7 +273,7 @@ static int airoha_thermal_set_trips(struct thermal_zone_device *tz, int low,
 
 	if (low != -INT_MAX) {
 		/* Validate low and clamp it to a supported value */
-		low = clamp_t(int, high, RAW_TO_TEMP(priv, 0),
+		low = clamp_t(int, low, RAW_TO_TEMP(priv, 0),
 			      RAW_TO_TEMP(priv, FIELD_MAX(EN7581_DOUT_TADC_MASK)));
 
 		/* We offset the low temp of 1°C to trigger correct event */
-- 
2.51.0



