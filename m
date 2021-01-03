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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB28AC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 17:12:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85CE2206F4
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 17:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85CE2206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=04ULTlT0+tC1mlmSHRWf8kBo5hFMa5sJfyQYpk3ElCo=; b=UQJ81jV5WEc70z4D2QvlCFgSa6
	xJ0le+a6qz8CQGdxFJfZuE1xT/LqDW+8ZTaepHMyQXTl/hp3vSXMoq17/hvGlZRYs3TEpnxr8Rv8w
	AaK7fzBDlafI05UCiJLMdpThRg0emDWDRY+vU9e7se9w9Er4TsStn11ATHjMeZSuEG9IHeGRZXgaR
	VuHO+fREUwlStpXjoAEWMrWYMKQXafHiOFEckDhydOXPMRWA2ZMwNwmZ+q21z4CkV5c0Lmsc3PoAA
	zKc3PRv+aCdilM1FqCPxEtpTSJP00V9fuGO4QNSb09Mim7td4mZqADi9wRzyIZHvy/DtM/gSb4Xs1
	EfoP7lJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw6vm-0003NN-1w; Sun, 03 Jan 2021 17:12:38 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw6vh-0003LF-Tb; Sun, 03 Jan 2021 17:12:34 +0000
Received: by mail-pf1-x436.google.com with SMTP id c12so14893830pfo.10;
 Sun, 03 Jan 2021 09:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/GeiIxcJ64ZQ6SmObKp07RN0gB/xHVcCELrAtFy6J8=;
 b=j9nC8spDRsbKIqITtcFVK5qfNVqGd72bWGhC3L39q82R8010SlWb58g4xtF50sisUa
 CfMxfvTnGgeJKwMLbxYvaE5kCZi0IvGeR3BidI8+fAl8OE1m9ex3PjGA7l5UqpCdsT8S
 CClk/1SFkcl8k97Jxq7SWRUVMGeCADSH2ApMpuinr1XvsQiYSvwvzasCmOh+FDJUp0Om
 TodXjnTwaBrW6MTUzvvXn9BG1fUoJ7hC0QKUOPOOXCdJtwB3gmstUWRzTpxCBS6Pdftp
 tj0cJiWF3qGNKeBorCQmV3YLO1jiIhCt7sTf6RH4bjvwmI5zU4UBNxMvwPLlw0T5wOYt
 PsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/GeiIxcJ64ZQ6SmObKp07RN0gB/xHVcCELrAtFy6J8=;
 b=b7TfYN4Q60PSf94fd6d1fUUKM3e9JRSuDovDndoMaMFKQDtkCiyTio/O1YiV/IoLS8
 2Lq6Bc7ik8NyuFAD4Ba8cqVg3+ifjudtvNGYNa7uMh5gx9SYJEaf6hA3kGVy2Zj2dfa+
 A4wQSc2n2nnOoagUPEqhA8H4us7WPKKqjiRKMJoeoVT7ZVsWAcASsrIicA/IeRN/a1vI
 J/E5dTVcBL/cMGuhLyW7jV2kmSh56XsQDFeQhXBwvyh5QkMtl2MRREUh/ac3NyM/QMq0
 nopmo5iNtK+wU4GUFpzA/T1COehPEjvcMXW0Fv9JIM/9tHMDNKDbZIt1+zB+HutPKQR1
 O1Qw==
X-Gm-Message-State: AOAM533XYzI4zDKwlTR3IKNWbsyuesD/ZnZRYJerIn9oTb24+C4nYUnT
 oqujWCyeAKHoFJ5c9lDF+n4=
X-Google-Smtp-Source: ABdhPJwVkKI1/s0n073MJPATBjaxsZ36JasEetjbvlDaf7VaG92vb5iUjgmHPzD5NvQlqz5H++LpZA==
X-Received: by 2002:aa7:9619:0:b029:1ae:33b2:780f with SMTP id
 q25-20020aa796190000b02901ae33b2780fmr7380595pfg.26.1609693951614; 
 Sun, 03 Jan 2021 09:12:31 -0800 (PST)
Received: from localhost.localdomain (61-230-37-4.dynamic-ip.hinet.net.
 [61.230.37.4])
 by smtp.gmail.com with ESMTPSA id y3sm19771657pjb.18.2021.01.03.09.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 09:12:31 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] arm64: kasan: support CONFIG_KASAN_VMALLOC
Date: Mon,  4 Jan 2021 01:11:34 +0800
Message-Id: <20210103171137.153834-1-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_121234_036971_10CE2FF8 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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

Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
("kasan: support backing vmalloc space with real shadow memory")

Acroding to how x86 ported it [1], they early allocated p4d and pgd,
but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
by not to populate the vmalloc area except for kimg address.

Test environment:
    4G and 8G Qemu virt, 
    39-bit VA + 4k PAGE_SIZE with 3-level page table,
    test by lib/test_kasan.ko and lib/test_kasan_module.ko

It also works in Kaslr with CONFIG_RANDOMIZE_MODULE_REGION_FULL,
but not test for HW_TAG(I have no proper device), thus keep
HW_TAG and KASAN_VMALLOC mutual exclusion until confirming
the functionality.


[1]: commit 0609ae011deb41c ("x86/kasan: support KASAN_VMALLOC")

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>


Lecopzer Chen (3):
  arm64: kasan: don't populate vmalloc area for CONFIG_KASAN_VMALLOC
  arm64: kasan: abstract _text and _end to KERNEL_START/END
  arm64: Kconfig: support CONFIG_KASAN_VMALLOC

 arch/arm64/Kconfig         |  1 +
 arch/arm64/mm/kasan_init.c | 29 +++++++++++++++++++++--------
 2 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
