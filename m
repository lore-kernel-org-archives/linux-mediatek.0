Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5747DCD98C5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 23:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mZeHPaYgjAc0cmERq1W7zmI0HdZsP4dzCZuF2djjKP8=; b=YDRiOWY3jv6Re1NwrVFcfO56ja
	ILCKZtqDXsJ6kBgvw1q+wQUoPmBsoQWnYYzmleilUAHP36vRInSqeEt1T6n+0uxZklIHxRVRJJHoD
	7/hlNGengcvO/FsiWVcqoXDRzktCOPZWvHqeUR9qX83PnV83KOrOupfIQ0BKrMl9jpcFZePl2kZno
	/G3LNb4LPwuWUYLkJy6jGobueFDPyQystr2CHd7EDpYYfotQ1igfIOArKhhtxs+9IJpQCmEnbP/Gk
	+gnUN89aPY/F83cT7ns4C4M9oi3yONGxfLc+LWwM4A+vPBbwnvkO6RAPotIOAA1IGNvkK1srXSYgX
	vNjQUvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXy0-0000000CcGJ-3rSK;
	Sat, 13 Jun 2026 23:40:44 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXxw-0000000CcFd-1rlj
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 23:40:42 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-842307472d4so826069b3a.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 16:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781394039; x=1781998839; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZeHPaYgjAc0cmERq1W7zmI0HdZsP4dzCZuF2djjKP8=;
        b=crBDhtYJ3a/Z01f1D0X7+sh80cF541Ye/vJkc4y+0SeqXGXanvVn1N0Z7iWlXgXL05
         VEJ8Df6hveBrHjrnO65sDgRHmCnp2E8MNQkxg5TON9dNa78h51GBOpZAe27HVFBxrKrj
         XZP3TdBelivSqOv9LJMj45UPLzCS4RoSWGXEgeZgUdYMadUWzDmcSViXRVfyrWLmAwIj
         qnC4WGA+yvBabHR2kborwFmEXKxYpd3H9EJOxVnbSq951tD+SOphcwT4mu+X8oJCxVDc
         aKb4dA5+GBWaLa8CwpmlzriyfFtPqgEEbYfARkk8VDT/Tq6jkxLxYhYPaceMX5fAHZVY
         Ctew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781394039; x=1781998839;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mZeHPaYgjAc0cmERq1W7zmI0HdZsP4dzCZuF2djjKP8=;
        b=tK6NcGwjAWj4cBbgSaYT0ObEXeObmPCTF/4bTcwNFwj7eHqf2nYsvTpaaGFriIsC8u
         5SUamfOmd+elqRprZmcUm+qkXwfuWI0cUwqfnlSLrEcGdWLg838aaxS/tpGaJoKEcm1l
         2fXA3RSgNziWCR7xkxCW4jDeNuNN8VrCtI6pGS2/kiUq1PBFEVfQe2fqAjnNcWsmD6h3
         ZLxj2Rxs589hJLiwVJhaB72WP9pDqaUHUShMjBJ8oRpxNs4tuouLT9sG0ZsKmykbzmOO
         wz8YB0FN9HE8uXOZJIkhMIIp07ZSmd8ED6NLWjhtMS6JCq8tAOfkw5cRuW3E7WWl2I6a
         1XMA==
X-Forwarded-Encrypted: i=1; AFNElJ9i2QIp2cfA8aCA4GLPlTQInYNC3646nNc1JUg+ZIPrBVYB66/sXcMAeXKZ242inVCtBvbbZh5YSiOWBJC2Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZQaieKCeuWUpazay2dMCUX9z8AN3PZXyZGfkkmQVIwGTj8WxE
	+UAnYqLlmALRoQPQB9fHAD1PAR00xXZecKGKRSNHsamBPGMrANaZnhIC
X-Gm-Gg: Acq92OHP0YJC569VCZnAUE1rvQ/j0o0XnfuhgJ6t3WWm79pPP+Y7R/06KMFkP9qwUW1
	p6CJEXxQLPHjm2ZL1iRDmXIuE09L63SUmz1jvhtYhB8dbqNecieUWlhUS0OgfieYSvgn00jH1zP
	52k/1HmTXEq2COkv6CyRbTvIof7FpWwsiOgn6y1NA00wmImvi8DYCK16mhUFnU2mnVxpxnuEIrN
	CAyPrH/WuYDTk8EHfYzbZajcfw/KnoxsdM9zuz8adp7OoZ6tQlX/NY9LzhFfG5fWojx74RfjEtZ
	uqpYA5hY7GS1cuaVRxmE9O7exfjayX2plNHUinj6zJMkKkmJwNuy5unAS9z7m5LdkZVPdvRKwhR
	zN/wGTi+dmm9WEUwYkusu1kANE2gfmVyaNVT8Ii0eFeKmG4lbGiVWEfT5JuSGdR3Ia6rN8/+Tmr
	tH7MYjLZ1hQTou700kjE2NeLIL6Dk=
X-Received: by 2002:a05:6a20:d818:b0:398:bda8:d8cd with SMTP id adf61e73a8af0-3b783b3e3e4mr9852452637.7.1781394039406;
        Sat, 13 Jun 2026 16:40:39 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434aca3041sm6041307b3a.5.2026.06.13.16.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 16:40:39 -0700 (PDT)
Message-ID: <6a2dea77.01c4f138.336eeb.a256@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sun, 14 Jun 2026 07:40:19 +0800
Subject: [PATCH] net: airoha: Remove dead MT7996 NPU firmware declarations
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_164040_486858_4F3831A0 
X-CRM114-Status: UNSURE (   6.58  )
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

Remove the NPU_EN7581_7996_FIRMWARE_DATA/RV32 #define macros and
their corresponding MODULE_FIRMWARE() declarations. Neither the
en7581_npu_soc_data nor the an7583_npu_soc_data references these
firmware names, and no firmware loading path in the driver ever
requests them. The only references are the #define lines themselves
and the MODULE_FIRMWARE() declarations below.

Keeping dead MODULE_FIRMWARE entries causes modprobe/udev to attempt
pre-loading non-existent firmware files, generating kernel log noise
and misleading distributors about which firmware files to package.

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Signed-off-by: Wayen <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 17dbdc8325..93095f3894 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -16,8 +16,6 @@
 
 #define NPU_EN7581_FIRMWARE_DATA		"airoha/en7581_npu_data.bin"
 #define NPU_EN7581_FIRMWARE_RV32		"airoha/en7581_npu_rv32.bin"
-#define NPU_EN7581_7996_FIRMWARE_DATA		"airoha/en7581_MT7996_npu_data.bin"
-#define NPU_EN7581_7996_FIRMWARE_RV32		"airoha/en7581_MT7996_npu_rv32.bin"
 #define NPU_AN7583_FIRMWARE_DATA		"airoha/an7583_npu_data.bin"
 #define NPU_AN7583_FIRMWARE_RV32		"airoha/an7583_npu_rv32.bin"
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
@@ -822,8 +820,6 @@ module_platform_driver(airoha_npu_driver);
 
 MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_RV32);
-MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_DATA);
-MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_RV32);
 MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_RV32);
 MODULE_LICENSE("GPL");
-- 
2.51.0



