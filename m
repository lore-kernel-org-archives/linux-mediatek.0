Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2108CD98CF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zK4mML80EwVGL6lWczcuu1KIJZUvXPEYaU6eVFtltBg=; b=VehSfuZXzvFGvN+ZL2kiSbQ/oN
	2IaQKYONoVUyODS/QJpdRKct+GDPqTik/3tCpitnyRRhhf5EtJaKigdpSxjwQz23Gc1aH/Vj7Jtk1
	y3+GS4RnP2/bN/iVZNWcRfHnwc/5OpcvytLrQndHSjge1b2YGcQkGQQw80DzQAdIv5ct1qjUEAepE
	WJLNnGmpsS4uiOw2pXLqZ6zz9WSQ6FMrqD+KlzlysX0XHtwTcbd1RFIftQGSgxa9waizw4TEdZAJn
	sizqySW4KXVxcLTkK4rB6XRtzIhRYwaSFpj+Ns5rUgGQ6+HZLK+pGofVZvkIfB8FUrrPh8zTCCFgp
	YXq5LDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYY9w-0000000CcnK-0Edo;
	Sat, 13 Jun 2026 23:53:04 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYY9r-0000000Ccm1-0xvo
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 23:53:03 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso1058099a91.2
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 16:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781394778; x=1781999578; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zK4mML80EwVGL6lWczcuu1KIJZUvXPEYaU6eVFtltBg=;
        b=cEFgm8mVrAFOJyXorsWUtKbueW4GnFk9RajwfHFCcWBuk2KYFptGrp0OSGqG+vLFgo
         +KStZMnYMWJijljUj6ZKMR9fbgTkThBAN7efg32tGGfAh14n0z1eOrd6RP0I6+NVccBN
         yok2FBx3hBzsTtYFw/HNKTnE+JYY1wYNrkfvU5VZGxvZSpSptPZuqqH+L8e/SMPWQcdp
         BvrlUKK6YfEYdqPbtWWN3L2hiuCCX8I9kI0cHw7Ez4eNBni7pVXIPFE2OXKVIvmkTo+h
         bB9Cobu598yaB4kxu5RFSMsNTnTgMdNLoqNmLfj4XlBMLD9VP5QseUrSxAZVtSK1PsZ0
         vWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781394778; x=1781999578;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zK4mML80EwVGL6lWczcuu1KIJZUvXPEYaU6eVFtltBg=;
        b=Bm6vaO8LAIqG/0evtC2hSE1FQACnysU/3q9KXlXYzIgmjs5CZ/15fSaZQvw1/N6X87
         zMdlf6GY5YLYYlT+TxYHohCxk6gO+atZJYQvlKRYkf5BGAEEaybVGVZt6lTAW8Di5yYk
         tTtNmpkGsVv3JwmM/5xK7glSvvlidx1K1YXLm9EVRnM/XQKTcDAVEeH5oZ6Yy4jDpkUb
         bNSLZ2NWhwflyENlPHygi1TiA8T6jGmskwpZ8dIM+vk78mz8fQUMtfbZIIVcn6i/sRdh
         pjTUGuMARNrvCUl3z9C4mMU56D+KJG27Ve9B/ZmyUGympCSEFJ+/rgMwoD6gtSrMZ38z
         xVhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ZJTIgX4U1TPLju6hggSgyWf907ognzl+dSTKKODTMoMeMw2SKYz8HPvmuWt0aKFLZU25sDZye8YZwYoFzpw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsp8COw125Uq+nh7LekAbiO3dXm1M1SKADeK8rl9xc50ckTB8w
	DuUZSzzlYL097M8p0vDFsCpzgddEjipfs+GdlMnsF5/i85J2a1DDdcKU
X-Gm-Gg: Acq92OEV276Lw6b0LCozwQrFqLgpzo989qEWrmsGx7SCGZUZrt4mCpaC8u1iMzIYtV4
	2orsRkcRlwT5rpxvJdxk6I4x6DBt4Y1QFzBoj7aQ7ZuDPCIMTSZYLM2baoTKSU9OvPDelaBI2n0
	/Fs6a6pQA0qhDzVE3w/MJpy8BJhTf25DaZO7i0KLgpwNr73EHNoVchwnTKmdmzX4jW8HQudkSRF
	ugneArLZPMdZSY+tjnonndUOyxioHuZlR1lcddYqjX5m6QUSlAXM/pwhZLiuVfW2qKiv9RTKgdZ
	L4kNXph1b4cgwfH3vPYTTCR0WPJsuTKoOMQ1098axke+b4OyhqXKZ9pli71Q1Qu5ySo0MnEZmZo
	EZtgvXnRP7ggsBHVwz21oPbLW6VhdRBuFK2FPsQ3YonoDyj8+H+8LHCHpq3WKCoAwsBUO8p/bTq
	a65/J/+8wozjv+6Qyd
X-Received: by 2002:a17:902:da2d:b0:2c4:d55:eb88 with SMTP id d9443c01a7336-2c410cd169dmr91771305ad.4.1781394778226;
        Sat, 13 Jun 2026 16:52:58 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a4c1fsm58185565ad.53.2026.06.13.16.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 16:52:57 -0700 (PDT)
Message-ID: <6a2ded59.63d39acb.391892.7632@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 07:52:39 +0800
Subject: [PATCH] net: airoha: Fix MODULE_LICENSE to match SPDX GPL-2.0-only
 identifier
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_165259_272582_2DCDCF18 
X-CRM114-Status: UNSURE (   9.51  )
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

Both airoha_eth.c and airoha_npu.c declare SPDX-License-Identifier:
GPL-2.0-only but use MODULE_LICENSE("GPL"), which the kernel module
loader interprets as GPL-2.0+ (any GPL version). This mismatch causes
license compliance tools (FOSSology, ScanCode, etc.) to misidentify
the effective license as more permissive than intended.

Replace MODULE_LICENSE("GPL") with MODULE_LICENSE("GPL v2") to
align with the GPL-2.0-only SPDX identifier. Per include/linux/module.h,
"GPL v2" maps to GPL-2.0-only, matching the source files' declared
license.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 2 +-
 drivers/net/ethernet/airoha/airoha_npu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11cd7..960727957e 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3333,6 +3333,6 @@ static struct platform_driver airoha_driver = {
 };
 module_platform_driver(airoha_driver);
 
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("Ethernet driver for Airoha SoC");
diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 17dbdc8325..870d61fdd9 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -826,6 +826,6 @@ MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_RV32);
 MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_RV32);
-MODULE_LICENSE("GPL");
+MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("Airoha Network Processor Unit driver");
-- 
2.51.0



