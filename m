Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CF5C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:34:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9232238EC
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9232238EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2bAZWYEm7BA8lFp9Eq1kjO3P0jDO8IpEXJHBXOu1oZU=; b=b3E88sMNTVcrUqaywQSNMreiT
	uuMw5DXR7Nh2aYgeo7EVzdkN38zvBEyCMld2VCHJRR14laFtHkCTu/nAWBiAdLGfqgTXLYRRkuXxU
	H6siKKba/0ZRry8Xa5EWNj8wCsE7Z2Q9xpod7VE9JmXv3LzRtArPkGD+hffrY1cDTMz/HFriN5tFr
	O47fv8vj9wUihpzban0Bkkk+P1tXxff86c64WBq6fCicQfhXDQde6igGFJeOtk+MIE07zohLj+Gez
	+ytm/omEt+5N02MzQkoyhOGj1gGWSSoIjMg5CTw9dfDB9DawmkGl4Z/r/YVXnGtXFYiFAy5BbPuTC
	tQuY1r3Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyBZl-00086O-Ej; Sat, 09 Jan 2021 10:34:29 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyBYx-0007pH-7V; Sat, 09 Jan 2021 10:33:40 +0000
Received: by mail-pj1-x102b.google.com with SMTP id iq13so5034716pjb.3;
 Sat, 09 Jan 2021 02:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oLn/SnoBrp3vqZ9sozuXKpJ43I84HTjowTO19xhLeG0=;
 b=AG/rOYoYRKgzWfqA56Rn+dg5UnJabvU6av5xhDPFM2zF5AyoVz1q4ouIgLU0rUwCf3
 GE8L0v5F5suRbnCEyfCMP1LYdLPT803JePm75nQeC45cv+2eRuIQcfrmVMx5rrX+vPmY
 VT7lek/olVSJGVT0tcb00utrd6oGbaL5pHfK6zrQOtvzLyTdtYKbTpRrbv9AlKg09v8V
 0HPUv2qKxgiSlO55/8VstzjDuZ/VK/nPdFqQyg4lXo/KwkkrKd+FfsCQ4tcvXso/m+9A
 IOk1rWNImSptf2gNWjE//OXdLb34y0erVoZB4eVGCeMN2E52fpzqD9DIII2Fd+vuN3ZQ
 3eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oLn/SnoBrp3vqZ9sozuXKpJ43I84HTjowTO19xhLeG0=;
 b=Gml6pL9P3iIkbtqizfhgsgtEbdWgVYTRI8AmuoIR8L4Px2TIWjW+4Rverkdh/PKXi+
 h4tFzcq234aFrIHVn6zXBtni0rc8kCmyZ99/0NNfeX9/wCGwatiBrh7u3bkItbqiwv78
 lSyYTQ9hjQ7lUL6IqLOriMZ6fFkIGUEheCk0prW3KcLoFV7Gtlev0jqewrR9oFabYjYy
 g91Z3m46otQjE+zDCPGkX7ETVtkTludCbrSGOxhBkUbGU0X31r8HfyxaDw7nnUBc1ff+
 QxIM5bBNMnUhKIP4ND0DdpcfNUjv3uMck+NxPp2yo0ioeN7mAk5AHKGMsYC1Apd88BP+
 S3hQ==
X-Gm-Message-State: AOAM530rXHmM7hdFS7FTy1HKGQA0CpQJM5oq1Cmr7We9rGT6ZORuddi4
 iV+fqoFZN0XdHgkuKSS0sxY=
X-Google-Smtp-Source: ABdhPJxIH5S3lPWz6xhxfymgG03a6AwgPQzKq4F2KcokdfmaTtrNpjtkVrmnEo0bgoXAa0A0Gz4I5Q==
X-Received: by 2002:a17:902:bb95:b029:dc:e7b:fd6e with SMTP id
 m21-20020a170902bb95b02900dc0e7bfd6emr11108147pls.12.1610188416663; 
 Sat, 09 Jan 2021 02:33:36 -0800 (PST)
Received: from localhost.localdomain (61-230-13-78.dynamic-ip.hinet.net.
 [61.230.13.78])
 by smtp.gmail.com with ESMTPSA id w200sm11691572pfc.14.2021.01.09.02.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 02:33:36 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] arm64: Kconfig: support CONFIG_KASAN_VMALLOC
Date: Sat,  9 Jan 2021 18:32:51 +0800
Message-Id: <20210109103252.812517-4-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109103252.812517-1-lecopzer@gmail.com>
References: <20210109103252.812517-1-lecopzer@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_053339_494668_26E2CD0C 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: tyhicks@linux.microsoft.com, gustavoars@kernel.org,
 Lecopzer Chen <lecopzer.chen@mediatek.com>, glider@google.com,
 yj.chiang@mediatek.com, robin.murphy@arm.com, andreyknvl@google.com,
 ardb@kernel.org, Lecopzer Chen <lecopzer@gmail.com>, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux@roeck-us.net, rppt@kernel.org,
 catalin.marinas@arm.com, aryabinin@virtuozzo.com, dan.j.williams@intel.com,
 vincenzo.frascino@arm.com, will@kernel.org, akpm@linux-foundation.org,
 dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

now we can backed shadow memory in vmalloc area,
thus support KASAN_VMALLOC in KASAN_GENERIC mode.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 05e17351e4f3..ba03820402ee 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -136,6 +136,7 @@ config ARM64
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN if !(ARM64_16K_PAGES && ARM64_VA_BITS_48)
+	select HAVE_ARCH_KASAN_VMALLOC if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KASAN_SW_TAGS if HAVE_ARCH_KASAN
 	select HAVE_ARCH_KASAN_HW_TAGS if (HAVE_ARCH_KASAN && ARM64_MTE)
 	select HAVE_ARCH_KGDB
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
