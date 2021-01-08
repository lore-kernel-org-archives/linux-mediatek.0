Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D77FC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 082F323447
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 082F323447
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HZp9wyPrdK32IchpX964rOYMzsXnurW1adUZnRGrv10=; b=US1m6BKwZ7i5PMuKzBLwDyk1S
	cqEwHmnP47XwpNcBDINiAes/LvIRoOFskLE3Ce8Ph/85tZM2b+cuwE1klfGv6j6UJKW1WR1bTjwjx
	Bv4CtchHIyZ2UguqI36W6P51Xbz/bkDEEO33G+NIA2Er3h8mVQZ0wL+D/hnc467dLFVgy9InZ551B
	ryVM7WFZ4TGxV5jDpwMP/8UjHpnn2QoTJGm9mTfGG1PGSpnAnE2uSq7oFeFICL2awFdiJGLiRa7ta
	Qr4YW2UEAL+bQKueu6UXC6sTHeNycDfCskrGZmkBnUYbjLNO9G0/1sDSNvDztGxne804bYvpdzvr3
	0cSuCMkqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxmyJ-0003Af-WB; Fri, 08 Jan 2021 08:18:12 +0000
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxmyH-00038F-Id
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 08:18:10 +0000
Received: by mail-qk1-x749.google.com with SMTP id u9so8708562qkk.5
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 00:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=R57CcAcJp5uD5dq5EWgT5pOw4gxHlrQ3Su0vEVAHoVA=;
 b=BwTJuMFDGoSghD5LbsH5Cw7LX0/rKMZncBvaYZmRRftCpPS9ikO90ooY3zKsdBHh0R
 CWQ4iBzzkqTJ39D0Yw4W6CAF5nepOQ+ExE7x9ZiXEDenNPmY3P9HZigEYXbkFkkHNsSU
 SJXVByg5dPtfQXULAO04yhngGjj2YUq7Sv4aqVoQlhd4ahZQia3YHUOrbgHirzEep4Qi
 bUbwkQyT5tM/KCUUj4xsczk/IsYJ/zjKkdFcukHKGbmz5KoJMoWo/nTusrS7wY71Zg4T
 c5adwvygIR9zH2k8XCT4ixdFebAy+5sDWfL7DoGk0iuA1ly9FHeF++vt2ORArBYSCTlW
 L9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=R57CcAcJp5uD5dq5EWgT5pOw4gxHlrQ3Su0vEVAHoVA=;
 b=EGClpvR9qQ8UDGN6zJW2yYL1wHytddnz2NIfDgUSGjB5oTJacE0P2CmA8bfnQnSjiz
 SgFrInl49ir+IeKrEEG/3UdysIJNIQi9abiCLu1uejho/cLrtfApPgCMAHtujQA7IkXZ
 MC/IOAWwUyuSClTGAeg//XYKYewKu2Ew664iAFIHkGpZXPRbyvXKWojDL3RXhKW6M7Wq
 htMsca22wcjCWBSwWawWqBNcdfODzPzxPsNYk+zbqNYuNgLvGYzvKtgAgfMXnr90J6HU
 NvidBTTBIloqhxqUrtYzzJh3qwfuhowhtumfqjJ6y8p55VxX8fyjenbIvB/nU5P2FDpS
 UwIQ==
X-Gm-Message-State: AOAM531MafNEoyJSu9AwjFj9fqHt0JciKx7DbIIeOCZJKNkI7lMNI0rC
 wobn3GvJ9ZA0pyW3NDHZ9jWrhzuiIaQc
X-Google-Smtp-Source: ABdhPJwHhuxkzvvD6e9WI7V4kGI7pAXOpvrQPy2rirJ5V9r+aLhmL4ro1CwshF/ltrcIA1JYp9UCtMgshgTP
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:f185:: with SMTP id
 m5mr5692827qvl.19.1610093880727; Fri, 08 Jan 2021 00:18:00 -0800 (PST)
Date: Fri,  8 Jan 2021 16:17:36 +0800
In-Reply-To: <20210108081738.2175224-1-tzungbi@google.com>
Message-Id: <20210108081738.2175224-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20210108081738.2175224-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2 2/4] remoteproc/mediatek: enable MPU for all memory regions
 in MT8192 SCP
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_031809_674735_FAC540C6 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org, stable@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The register MT8192_CORE0_MEM_ATT_PREDEF contains attributes for each
memory region.  It defines whether a memory region can be managed by MPU
or not.

In the past, due to the default settings in the register, MT8192 SCP
works luckily.  After enabling L1TCM, SCP starts to access memory region
that is not included in the default settings.  As a result, SCP hangs.

Enables MPU for all memory regions in MT8192 SCP.

Note that the register is read only once when SCP resets.  Thus, it must
be set from kernel side.

Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
Cc: <stable@vger.kernel.org> # v5.10+
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from previous version[1]:
- Adds Fixes and Cc tags.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=410291

 drivers/remoteproc/mtk_common.h | 1 +
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 988edb4977c3..661c998288d7 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_MEM_ATT_PREDEF	0x10008
 #define MT8192_CORE0_WDT_CFG		0x10034
 
 #define SCP_FW_VER_LEN			32
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 1f0ed2974d5c..c33c41fe54cd 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -369,6 +369,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
 	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
 
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+
 	return 0;
 }
 
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
