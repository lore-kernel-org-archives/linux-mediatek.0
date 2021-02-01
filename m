Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EA5C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 12:14:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04A9264E8F
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 12:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04A9264E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srnp73hrqO/JoNuDbvFycIr5JV+bMabYQWC4b56EzhQ=; b=n0FWHkjk4HqONIEnxOs/yT1QL3
	Hox9oNUaVnbqAhTVWkS6pmk9WeOZsfV4cysvEE9mTDSNRMa9wLcqfnKuLv88CUDn4uZRaD/tJkDxL
	zvsZKxA4C1RXUzIye2ad0mWcNkIx/uzohOLLU5PLjoNj1q1eJAI4vJKrMqB/vNp7S4koaSg9hFRUW
	TvXR5I5KANHuAfD6FOLShVNorg3KcYvEVdNBwz9aJfG84u5yN0iNzGcH1dikZgJ2vhVABYhB66zKq
	lRroFRMNjXm7tFAfJoL2oj22FObN7IG239gMLouiNs1Rvd6HOqlrpP7LQMltQM1sZZD1612EpAqre
	P04ywokA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Y69-00016G-Qk; Mon, 01 Feb 2021 12:14:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Y61-00012N-6j; Mon, 01 Feb 2021 12:14:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id u14so12440205wml.4;
 Mon, 01 Feb 2021 04:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O7LEqE301i0utftIEa551QfXNX2X5B5jgaY6PWrEijQ=;
 b=OCuIx7GJoUPlt6a5ceSbMt2Vj5WKZZE7ls7EL1x4KnLZ6CuQKEycbe314oynUSOHIV
 a58OAN2bxvOlx016lFZBEBCy+8uem2cwJMZFpDoNM7ORM5Q7RRzE/pn0ZiJo6QlJ0b1/
 7cy1i2ViFNk3mK4zB2VB5jsvysYOs9bIXLOrxdDkCxg4Z2IW5ekz6AxF8UwMwnpahzU9
 G+45fgMfQwvHhmiS7FLKvrwGfJ4xdgc8EQ4vCU5X7n0Lt3p5QX9reffA3G7f1mtcumW5
 TOn2vbh9ViynKhGYVLERo5g3Lx2QNkc+uOXF10i95QrJ0HF8mfekHPPHW9WulFsyVNK2
 KUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O7LEqE301i0utftIEa551QfXNX2X5B5jgaY6PWrEijQ=;
 b=HPX17FfKV8TBF4oQHyR61BbOosgWwTtDGU6Sa3l72ucE1i9N8dgsNOtXDAm/PMJcQe
 nPJixOUwP+tu/lcJt6qi/qwX6IxdfYl2J7qhLCT6XYJnGDdgYD6/wn9Uk85+nl+1/Oyo
 EYVFhemgBNSikTubNiKaoCgcRL47YUaRGLzsvZdFMtw3b+qYMim0U/5lMQUOHehAYXmK
 AGSFnw4j2oXDqVvxNSgokv+OB6fupxIpdDFiidWkvOUwqNHh7DCsP5kgGTwIpaKhm/6Q
 WuLBiW1F1yL3Onk7PcTC9HoXBz5zfkD3Y2OdOXRecijAgEHwYqrg6CD7L2XEEREqsnpi
 nadw==
X-Gm-Message-State: AOAM532F7M9jW3supqFwZVqKGmdS/u8n/TYXvowDKyKt4/7Y7NThS+56
 g7SF8/2Do/lDfEZMAd61m1NeMNhao/QPKsDB
X-Google-Smtp-Source: ABdhPJwOuVm8lLkSy36OuClrBdp2b3D1NYc1jr8EDZykah2SgHBYS1aBk75CAcS9UbFwHuYmWI9sJA==
X-Received: by 2002:a1c:1f4d:: with SMTP id f74mr1782289wmf.133.1612181659606; 
 Mon, 01 Feb 2021 04:14:19 -0800 (PST)
Received: from localhost.localdomain
 (cpc141888-watf13-2-0-cust663.15-2.cable.virginm.net. [86.14.42.152])
 by smtp.googlemail.com with ESMTPSA id j13sm20698332wmi.24.2021.02.01.04.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:14:19 -0800 (PST)
From: Bilal Wasim <bilalwasim676@gmail.com>
X-Google-Original-From: Bilal Wasim <Bilal.Wasim@imgtec.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 enric.balletbo@collabora.com, hsinyi@chromium.org, weiyi.lu@mediatek.com
Subject: [PATCH v2 2/3] soc: mediatek: pm-domains: Add domain_supply cap for
 mfg_async PD
Date: Mon,  1 Feb 2021 17:14:15 +0500
Message-Id: <20210201121416.1488439-3-Bilal.Wasim@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
References: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_071421_321416_E1BAD0C6 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mfg_async power domain in mt8173 is used to power up imgtec
gpu. This domain requires the da9211 regulator to be enabled before
the power domain can be enabled successfully.

Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/soc/mediatek/mt8173-pm-domains.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
index 3e8ee5dabb43..065b8195e7d6 100644
--- a/drivers/soc/mediatek/mt8173-pm-domains.h
+++ b/drivers/soc/mediatek/mt8173-pm-domains.h
@@ -63,6 +63,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = 0,
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8173_POWER_DOMAIN_MFG_2D] = {
 		.sta_mask = PWR_STATUS_MFG_2D,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
