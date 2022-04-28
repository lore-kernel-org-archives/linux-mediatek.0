Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CA6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKEDfHz/puvXdt5BZGko+7xpvvN7KKLT1GcgwddHUyM=; b=OYPUCUkUb2GVSn
	7eqhyGEi2WS8iFHFC2rZCyCz8qIyhJfwXq65b+kcwUa8gE/0dK/i2asdVIV3suxhgLfJzMZojCajG
	qjhyF9UEKlUyZibEBVrn5R8ev5E+3THUfm9L8qJMnXazrNfTWx2WsdkQLVAIpKvI+sp6P7wKNv5mu
	qYNUGZhBPo+uDw6XGyiyl5kEcBwRKv6z9M1z7Ig8U65K9DVqUbr7N3xVfJn4saO3ziCergm8iBDW+
	pTiSxj7ezh0kqYwshLcVGwEzjRx82cBeFP1vQmgIZ73fEobAcXfzimTC/OCIoZ4x2YllYNLVWe+ao
	OhBdPQy7uS9ipt/2ACUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0Wq-005k6K-Cj; Thu, 28 Apr 2022 09:33:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0WR-005jxx-St; Thu, 28 Apr 2022 09:33:17 +0000
Received: by mail-pf1-x435.google.com with SMTP id j6so3744366pfe.13;
 Thu, 28 Apr 2022 02:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Jx2sI9U4OCn+w0obbX5GiL9CUWZWFJnR6/XlVL4TXok=;
 b=bFBvSiqIfUxsZ8Ums18LxH6niAvg0Lz5mTnbjPoz6e7cc3W40d5Td4P9r4NmpzYzlG
 pb2pvd/fXNxKbXjjuxJTRfqemXZc5KxQbMZ5Wuk+EUVJrFkJk3ha3u/vUTc8gcDH2ZH4
 DYNBWeJ8rGROjMMEZ74Ps4VHWwPSQWgFFGQhUW73O+VsGZpTH8xrRumYjdv5aVujDovW
 zKdYJPsJ3gw/4mCZrUbNmmJy/mzwVjz8dWSQRaGHn6VmDpfh03IlvxgWESyWPR4FK9Lp
 317ZFqDKgDGgi8ciEAnbSuQhGJ9IijVs0u6OI4FyqXw6w9ULSoYT0tsHNkCckiPlaBBO
 ED6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Jx2sI9U4OCn+w0obbX5GiL9CUWZWFJnR6/XlVL4TXok=;
 b=IRFKaQPINszb2srVQvrRZzMMPSHZXncQNu21mu+lJEoKiXuvZmVkZB+ZkVMiV4vxEQ
 gK1vMlFjKBE+3dIqrQ0XVwQybdDTbhC4j5bREmKtz7xdUN0SoIFrx0BtPpqDb4PUPpOe
 MB5VM1IboVcYpjw30Gf6PR8MWmlrZ5nmw/+/97IIT6ZJuYPzRZX1TuAVlYUdcZ2Yvxt1
 MBfyJFUI/zRB9fHeUw3NuYGtSEY2TmYcjDnwkVRxL1e38kWzd5TJFL/eQFDqKK3fmxSd
 LHqqYMIUdrtW4SwR0QHfamz9lJ3fC3tftCUPCfeT94Laz6XnDAO8sKdmc0Tjoh3wM8fX
 4tYw==
X-Gm-Message-State: AOAM5316W66ntN3V/3iUFJrEnTPLIbqilvrG9W3gUOhVQ8Q0Yrc99ISt
 6pmiZ597L5olMwYpYnEPkeM=
X-Google-Smtp-Source: ABdhPJzT2s4BUbfVF0ibXJZuFaWAvgA8sAUtMX0axqPQQcd8lpcMQU7X+4fWs802ydw8Yj9CznwA5g==
X-Received: by 2002:a63:8943:0:b0:3aa:f1ce:4f24 with SMTP id
 v64-20020a638943000000b003aaf1ce4f24mr22369940pgd.34.1651138393834; 
 Thu, 28 Apr 2022 02:33:13 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:569:2b1f:d169:337e:6359:8ff7])
 by smtp.gmail.com with ESMTPSA id
 i66-20020a628745000000b0050d36a5fe70sm15457932pfe.127.2022.04.28.02.33.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Apr 2022 02:33:12 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: pavel@ucw.cz,
	matthias.bgg@gmail.com
Cc: cy_huang@richtek.com, jacek.anaszewski@gmail.com, gene_chen@richtek.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] leds: flash: mt6360: Fix the wrong enable_reg in
 multicolor brightness set
Date: Thu, 28 Apr 2022 17:32:42 +0800
Message-Id: <1651138365-17362-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
References: <1651138365-17362-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_023315_970019_6E356E69 
X-CRM114-Status: GOOD (  11.61  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Fix the wrong enable_reg in multicolor brightness set.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/leds/flash/leds-mt6360.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index e1066a5..712cd46 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -115,7 +115,8 @@ static int mt6360_mc_brightness_set(struct led_classdev *lcdev,
 		struct mc_subled *subled = mccdev->subled_info + i;
 
 		real_bright = min(lcdev->max_brightness, subled->brightness);
-		ret = regmap_update_bits(priv->regmap, MT6360_REG_ISNK(i),
+		ret = regmap_update_bits(priv->regmap,
+					 MT6360_REG_ISNK(subled->channel),
 					 MT6360_ISNK_MASK, real_bright);
 		if (ret)
 			goto out;
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
