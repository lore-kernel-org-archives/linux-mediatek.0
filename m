Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D247C04E69
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+KSmMqqtvDIiHz4Ho0lGfwn8AtEPGP14LPDghXjLYrI=; b=jhTCLOlU8cbFVF/bX8gpr8ysg2
	yS21Ok8vajixgxLQH3+qS+G8PYoBNuaWQ/D8n15gN79OlP+dn8wVb+D/lWOELQjCYwrE3ccoENOWJ
	KLWVnDeO/IZG1/X3r6OFVbTmnb1Eiv9pnbAhbkcWkqrG6GLlDARNw1skOPQSkzeaKpcmQKYbQ9xqT
	QyjSt9K4s4//4Lxsdgy3TVCSiCpxH+qTK0O796o1me5JqzT4iOSzfv01KmcvtTekv8AnLRoW6zMbu
	NMLcOTHTkZgBQa4MR+lBQewgm10G+sr4xKfGrwpMJtZnWyS1QxEzQqKf9IfMVZ1WoV0SAGFla4qvV
	8ntNSeJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBjq-008bL6-38;
	Thu, 10 Aug 2023 19:54:30 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBjl-008bHU-0r
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 19:54:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bc99545d53so11496555ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691697264; x=1692302064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KSmMqqtvDIiHz4Ho0lGfwn8AtEPGP14LPDghXjLYrI=;
        b=nrXbwl42fHl/TmgPZPbp4NYdzZS26suBRDTcs7Wk4VaUdbnJFtqlYuY2kVpZaOc7eE
         ZlYyHSoOEqPr8lDHmmJ2KCFnyPADLw+V4jlJXFebMimObgbYQvVI4AV6ufI6GOAMe0O3
         /cc+CErvpTqxvL+kqT8XL2a6TPPC7RrAj+ppE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691697264; x=1692302064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+KSmMqqtvDIiHz4Ho0lGfwn8AtEPGP14LPDghXjLYrI=;
        b=V+c9WWG4wK8QWGCr+F9tWD/K30m9riIv0abETHDsj+swHBh872zVqw+7Ci6mTs14tQ
         +6GlU1/kOnt7NoRmTr540Xxi4+LNWhyyBn44Q/zvYMqtWsrkUV51DysTaMUU+flArc+n
         LMVsGvcFgbr5MVtYOmFIjpmnmv6pp5jBAPg4EY9Se2laFwUSyQMJMq7SXJmvrW0T6z4i
         qk9DTaVhLKBrmylq0iJqXN0ckcmaduYaKvaYe+sYkmGxgZ8gFtGx9JF8+XHgSJt0w9O+
         l6CRpBpDpX6vU/3xwW+cGpG/R5nRrRLvyEJXTIlfk6QJDx7CoCzPDdkWH1O8pOAd9uBc
         qYrw==
X-Gm-Message-State: AOJu0YyE588LKkC161yyuYIvtdcCXtAZRSWZf25FKYNFVkkwrsWcD7A2
	LhXXeyszH1RddAquK+5WuHM7kg==
X-Google-Smtp-Source: AGHT+IHw2G+HNk0pb7rzPTFmiR+l4BrfXX5lv/VPOP/htPgz5DnJIC6tehMM+4QHARhcvvVVGb92Rg==
X-Received: by 2002:a17:903:22d1:b0:1b5:219a:cbbd with SMTP id y17-20020a17090322d100b001b5219acbbdmr4340562plg.3.1691697263898;
        Thu, 10 Aug 2023 12:54:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o4-20020a170902d4c400b001bbf7fd354csm2158636plg.213.2023.08.10.12.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 12:54:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Kees Cook <keescook@chromium.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Williams <dan.j.williams@intel.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 0/2] ARM: ptrace: Restore syscall skipping and restart while tracing
Date: Thu, 10 Aug 2023 12:54:17 -0700
Message-Id: <20230810195141.never.338-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=696; i=keescook@chromium.org;
 h=from:subject:message-id; bh=LCtgD+PkZR6hbDOPphiW7QCeCuo059Geg0rwEi/JXFY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk1UBqGYdSbOqXERSHJr0Lg4TG85J053QilT3rx
 86gcS3SVtWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZNVAagAKCRCJcvTf3G3A
 JiYID/4/t1FvGqMPIZTEFTDWaziXdqRsIgasib2VD3Jxm2l2wQZbrf4v5wkXyRD3N8pNt8bKWsP
 hgXBdnAmaw0wVgFVOd4ndKxz3mPyf4uRjrGZ+ROt4tk8jcuIesbqpiZG6hmphvaj6k+afiwDz4+
 rZsNZ4CSy01PD3/4xtg9DD3kQAMqcxL5DiOsysyu3r84yV2WDA9szFriGj1QZf136ah7QF3Aupm
 AldTkpzllWT2PV43vXW41N+rSQOKTApFMu3Zqx2yKXBy5uN9Oyo77xCXZgsyJ86SYRQvC7A1jCr
 eHc0NcFnR5cC2X5kexSm945JtTHCzDClECCewMFNJPnDr8jesTNw06UJEi+SM/xthFEeH7mcdhP
 KgVz28hRWjzk4vMgN2xcXBNae5I6RvEsPPd8RRFRib1H8QZzinYH24fnxgraz9R7E3d+ZaWWR8x
 nw1NCGg5UNWwTqfGmdoSl5KzS+WSnZAR/QM3TLGs5SdMfjgPsWAyZgCao60+nPHeiDmIsuB08uJ
 Wfp+BavPWbToB/UEl0uj61Pj/O349RScCZwUxwXdTXJzpFBKNG6uD0njcUxBk6vq1rbOxNPVlw0
 AXI1XTCDPJeyHMPgkipEVbyifWObQs6PoN1WsJA8zHa5BjgQlRGW6WZ6FlHuo84LJVxUKqgOzcr
 U11nDG3L XieHU1w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_125425_298017_7A24249B 
X-CRM114-Status: GOOD (  10.39  )
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

Hi,

Fix tracing on arm since commit 4e57a4ddf6b0 ("ARM: 9107/1: syscall:
always store thread_info->abi_syscall"). This was seen with the broken
seccomp tests "syscall_errno", "syscall_faked", and "syscall_restart".

Thanks!

-Kees

v2:
- split fixes
- move scno store into the actual restart path
v1: https://lore.kernel.org/lkml/20230804071045.never.134-kees@kernel.org

Kees Cook (2):
  ARM: ptrace: Restore syscall restart tracing
  ARM: ptrace: Restore syscall skipping for tracers

 arch/arm/include/asm/syscall.h | 3 +++
 arch/arm/kernel/entry-common.S | 1 +
 arch/arm/kernel/ptrace.c       | 5 +++--
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.34.1


