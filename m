Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB66FCD98CF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 00:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0VFoN2y8Bp3v5MjyaOS1eaWX0HBlVaXH4Oqqk7xrVWo=; b=BW+zQGnr/0a7lOrCGz4vJSIuzp
	rOL3wDuWCT5LFAIoYSsBFYhGSZlK4dzzLKaRKLDG8qNzTf/xS9NSuXl3Z/2+DLUAvRA/KIqHZevye
	P4mzbDGWIueRft+QPvc+GdvgcdnvgwvJWPGBcr8XYVU4FPzArSUh33KLI0vbwKmDqlV9xRDkRWv4c
	SL9uErsv+yhLi0omc3wo7wMgqpxwPSlt9g2dvTxS7NGfcwyvFF4cG1TLgt7RT7Fa1btaVVCA3EKm+
	VDW0G2Kvppb3GhrUE7KFglZLGPfCDcNaQUKCdlqKhK/4zlNMt+Iig0fY8Qp/4GWQlIN4GGfIwkX6g
	zt4THrbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCRa-0000000BqBh-3Ujp;
	Sat, 13 Jun 2026 00:41:50 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCRY-0000000BqAC-0wMY
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 00:41:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bf1f074a12so16037425ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Jun 2026 17:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781311307; x=1781916107; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VFoN2y8Bp3v5MjyaOS1eaWX0HBlVaXH4Oqqk7xrVWo=;
        b=QX1vsxf9oQW6jMwca205rSjH1imJGppk0vm035QkR/YMN2OkR7Kxq8LqXQ1E2HR5iK
         CV+PiBzy1STFU/JMp2bbQCKLs+JdVuJUfwEj4vNrmj6JafK6BH2U21HHM/t5Fqai9R/2
         R+OA9LT/yN+L+GmFAXdvx9Mr+W7S4D7TNZBfLhBK6k2oGmkR0FCUcKcKA5i+GxSAWxrN
         he7vWAgA2OlsHN4v7TEm+YajD880d55gac9vd2oQ8JpyJKH9gTHg/64ZMKTUq568Y1/f
         ms0lY6Q3Qw/u0PdaRPneqA2+oj3YZDKvYPqxDXfkoQ59kPhqPD2ej6oqvChweGlBiZxC
         5hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781311307; x=1781916107;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0VFoN2y8Bp3v5MjyaOS1eaWX0HBlVaXH4Oqqk7xrVWo=;
        b=PB8WIn18Z3M1TbuoFOOqeaMvJTWCDMlK0wgPtBXvzM/Aeg8yo7RaNfzalYKvvqq1Vb
         gq/Ue+XnpvC9AsBtN+5AmyE2kFhecAu7e8uc4Z6CwUUFJq567uEknvHIagVIITTAdzsY
         x+X/H9PPsgtGKFI5mOygoyEn9Jp+sPn5g6Ewp4uuvMNBzNY1aljfK0rMB0hhCyd8SaFO
         WHDQx9DrAGmOOLzzts8LTxpjfw2Q9PHBjX+Aj5AZUw8qmH5JyBulpWcSuSccLkQLqJIa
         A95PZTiWGoos6xiTd0YtQDff8rTPpkneq/bIUirmlvfNijQ3Qo7uY5Kk6UVETCGEpgjb
         ObvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8wvW7n9D28GVePF2H5YJgzA/ddcTDN57lHbV43hVFdi3uzgGOdLksTzzc17ezuZ6kRXsbSLeqNwhOCI4bCMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyt5LeuHAfwtblPll0odY6DMjuUYJx1lqWFs63Yzdk23ElpMS2
	58hGDRv6NCagUEp1ZQf+ts2HJwEuAo0J2/xTadmOAklPLjWhrgLst7jp
X-Gm-Gg: Acq92OH7lpZG7PSn1p+1vuiaIc98n8NrQ/hkG/MS+m0RpTEbhxOE5piXrxjeHpu+FTr
	hQBOMPKTtvVaLZRMS/jSLi6PVbpJuv1JOry0H7Ae7ugZHsLVkQH4BH39jJRqEaiYwr9ICW6fWCa
	Dpwg9VlA8sXYhDAgzBF5U710DALFLkdkSRkwRn4gs9PT69N+yz1SzumpROT0A3SztizzQecc5QF
	3Va6z9+fMk4CxFMjTSEGVy9ImaenNA3lStO9QcNkrW8388H4twEd35Itqlw66+ZGINyl9wuXLRB
	540uG8TZVJUUzaVNnBtAySpvn8BIOpnYPBEHsMT9TtA9kzIwxZJe1bDiBsd3EGKXD1TYv0EGnra
	8W26zF0OJJwI9Cra9wAEXlFEenUwp6KykcmkKKXqsIVlUfzBdo5ksEprisST5hs+7IjwHwqxkzP
	LaR0A72HARN84rXENQ
X-Received: by 2002:a17:902:cf0b:b0:2c0:c262:b917 with SMTP id d9443c01a7336-2c4109ed1b4mr60346495ad.5.1781311307363;
        Fri, 12 Jun 2026 17:41:47 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac72asm35515515ad.38.2026.06.12.17.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:41:46 -0700 (PDT)
Message-ID: <6a2ca74a.c5b1db4e.21a698.01e7@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sat, 13 Jun 2026 08:41:16 +0800
Subject: [PATCH] net: airoha: Fix typos in comments and Kconfig
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_174148_270911_49F55409 
X-CRM114-Status: UNSURE (   9.23  )
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

Fix several typos found during code review:
- Kconfig: "Aiorha" -> "Airoha" in NET_AIROHA_FLOW_STATS help text
- Comment: "CMD1" -> "CDM1" (Central DMA, not Command)
- Comments: "GMD1/2/3/4" -> "GDM1/2/3/4" (Gigabit DMA, not GMD)

These are pure comment and documentation fixes with no functional impact.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/Kconfig      |  2 +-
 drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index ad3ce50..1f6640a 100644
--- a/drivers/net/ethernet/airoha/Kconfig
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -29,6 +29,6 @@ config NET_AIROHA_FLOW_STATS
 	bool "Airoha flow stats"
 	depends on NET_AIROHA && NET_AIROHA_NPU
 	help
-	  Enable Aiorha flowtable statistic counters.
+	  Enable Airoha flowtable statistic counters.
 
 endif #NET_VENDOR_AIROHA
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 31cdb11..9d9d34a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -294,18 +294,18 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 			      FIELD_PREP(PSE_ALLRSV_MASK, all_rsv));
 	}
 
-	/* CMD1 */
+	/* CDM1 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM1]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_CDM1, q,
 					 PSE_QUEUE_RSV_PAGES);
-	/* GMD1 */
+	/* GDM1 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM1]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM1, q,
 					 PSE_QUEUE_RSV_PAGES);
-	/* GMD2 */
+	/* GDM2 */
 	for (q = 6; q < pse_port_num_queues[FE_PSE_PORT_GDM2]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM2, q, 0);
-	/* GMD3 */
+	/* GDM3 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM3]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM3, q,
 					 PSE_QUEUE_RSV_PAGES);
@@ -340,7 +340,7 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 							 q, 0);
 		}
 	}
-	/* GMD4 */
+	/* GDM4 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_GDM4]; q++)
 		airoha_fe_set_pse_oq_rsv(eth, FE_PSE_PORT_GDM4, q,
 					 PSE_QUEUE_RSV_PAGES);
-- 
2.51.0



