Return-Path: <SRS0=/oW/=GG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B83C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 17:13:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A889B206F4
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 17:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A889B206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GJayXwyHZmCWI340oapsq1CwquLaKlpl/ECANdt4/40=; b=yX/peCDf2ATlKWBK2CFhzUz1N
	HH4ZOoh1DFrInGTVJnLURVlNvi4JsFKYwPYrHSMEDDYXFjgIWzcB9GtmNCh7S7dBgHo/96SXyoBBO
	2r3mEiMa4TndV1F0f9npdQmAtCROkGZuga8zT69DrBozu4w23LJ0lmoexwfRdrZwcsoLSpBtUl4pr
	yBepAymJVYRmVGkish8Lbi/XNJPRMUWdb2V9XIIoGEFy38itdBORog3yhHPQHjtly3tL964QLQAeR
	5xo06MUSEmvU9mmz9wr2ks932rXXdFf7LggR3V6lBHXRiXZVc5KwUKi3LtONjzjSP9Pujz2A8G2Cy
	EmqGlOZxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw6wM-0003eF-9b; Sun, 03 Jan 2021 17:13:14 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw6wC-0003XN-90; Sun, 03 Jan 2021 17:13:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id q22so14889640pfk.12;
 Sun, 03 Jan 2021 09:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DJN/Pu+8mLKZ+B4Z+Om7De+VUDyUCro4rXn59AnfrE4=;
 b=GJ5A/1auzoduEeasEqtvu6hr2Gs+drY4Z01k6WXJ2D0EaD0TxZpf80iuC/SBcfu7Kb
 hXyPC3xEMoHL/mgBh6vg/GZfWEibhw/I4yDdJRXQ8Yt9oW/rFji7DYEgtbvRlAKYL4By
 b/gJD/6JFcbSBIpVUjlL6DhJ5fhxZTR7Sla9lgdVXU1mMNFIKRm5anKzzOVNDwfXX1XU
 gCDzb2f6wfp4r9vsDorKGW3kakon1w2NTvb/PUjFtuPv+ghU1N5U9Dcn6V+zl7GFCwr5
 9myPOPcGdnFPuk9yF/SSMGbjOnj0N29Z3+HjPDhCf05bEwLSdjP3BpbLNi0UnIHBwFf6
 zePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DJN/Pu+8mLKZ+B4Z+Om7De+VUDyUCro4rXn59AnfrE4=;
 b=bWIDCjVM1sM5hxuLpb3mzJVdMjU+7ufcgSXSMK2qc+qPgqRnqZIafgXdUEKktykEq7
 6ZTUCE4lVIjZ3NqJr8KZ4kjlJPGUJkUAseWFrzYfgiqfXWkz7jk+zMiFFizG0rabBQSq
 VOwd0z/9wFZAE9hb9o+WUnajMsKLxtze8sEkURPJhvbiLN0AzTzKgBkYejizOgjlX519
 QesBUEGlEJqH1sRdleTppA2eQS4hv5q8U56qpd/tKZSOHZddbiipXTiqfJIVHomqvKlE
 YYIHV58msfW2RVDRw2TpIdrKvkRAU1lqL9qfYwxbf8x+z/CE0Md+07N9QrDI6/cnnufx
 +HSQ==
X-Gm-Message-State: AOAM532/8PsktuAb+bxFmwYRRFEke7E0K8MfCTMNAIZnSRO5F/rKDjJ4
 EX+iIy++gRKbpfwqTxe7CVI=
X-Google-Smtp-Source: ABdhPJyrjwRxNiXYf74ApoL/95Jw1Unu7nMqfXQ+KrD97MJV6r4/uJZcqZdl4vapaCluE9JG/ag4iQ==
X-Received: by 2002:aa7:86d5:0:b029:1a3:61b6:9c1 with SMTP id
 h21-20020aa786d50000b02901a361b609c1mr61911995pfo.55.1609693982185; 
 Sun, 03 Jan 2021 09:13:02 -0800 (PST)
Received: from localhost.localdomain (61-230-37-4.dynamic-ip.hinet.net.
 [61.230.37.4])
 by smtp.gmail.com with ESMTPSA id y3sm19771657pjb.18.2021.01.03.09.12.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 09:13:01 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: Kconfig: support CONFIG_KASAN_VMALLOC
Date: Mon,  4 Jan 2021 01:11:37 +0800
Message-Id: <20210103171137.153834-4-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210103171137.153834-1-lecopzer@gmail.com>
References: <20210103171137.153834-1-lecopzer@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_121304_391779_E5307F96 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, glider@google.com,
 yj.chiang@mediatek.com, Lecopzer Chen <lecopzer@gmail.com>,
 linux-mediatek@lists.infradead.org, catalin.marinas@arm.com,
 aryabinin@virtuozzo.com, dan.j.williams@intel.com, will@kernel.org,
 akpm@linux-foundation.org, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Now I have no device to test for HW_TAG, so keep it not selected
until someone can test this.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 05e17351e4f3..29ab35aab59e 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -136,6 +136,7 @@ config ARM64
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN if !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
+	select HAVE_ARCH_KASAN_VMALLOC if (HAVE_ARCH_KASAN && !KASAN_HW_TAGS)
 	select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
 	select HAVE_ARCH_KGDB
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
