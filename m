Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56439C001E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AzFyigJ847Mx7E2oFBB8SMRyOnv8+4md/Rgc3rIkTY=; b=mD99bcS8QpZVUkvRePh46qBEEm
	1FM4VREDPinvKYLoLgZsrKcQRD3vHQg3HS5zPdDFSfOZchZ2p6Mtzg2J2bvIb7XwwdGlQ7FM0m2QK
	2q57b6XoRrN4Xg2wRVrkpxsp1R8JXuUZEKhF1DlsaOMsdYzzH6Ldz6S6OtR8MEf7QKTHA1ozGs601
	aygyWPZLVGUN/lkPHE4NI3a6wJ8EF1ZMWXjrmZ/jhXZffqRFTvi0FJfywuLI1Drfe7J9USICLn6MB
	WBf+7Q57TCsyqdd4dscKwJNZ9dZ//EwKEgy8upacWt66vb8+Pu0ldXLwC7iygbhmIMTbQ3g8Kh8/G
	PPIH8n/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBjr-008bLH-0u;
	Thu, 10 Aug 2023 19:54:31 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUBjm-008bIP-0n
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 19:54:27 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-564cd28d48dso897879a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 12:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691697265; x=1692302065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AzFyigJ847Mx7E2oFBB8SMRyOnv8+4md/Rgc3rIkTY=;
        b=EhymeSt9AwGdnLF38z1BWoMcYtzxxbOkqvwmhWp/GRcUvwylg9CoK26H1e3AGke8+B
         RPety8gwpWVVuXWVCYQ3s1K3sd50189fikQk3mSOocuvNuuiO5MVVxnZBq2+8Iy3GSEr
         GVH5i8CrUQaibx4+voYbDmJYrn6UTF1rIVDow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691697265; x=1692302065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AzFyigJ847Mx7E2oFBB8SMRyOnv8+4md/Rgc3rIkTY=;
        b=YyHKyA7PLmKc1tv0t90+WhkNvd3UJlEdp+g8ym2Jxz795z6nRpwAKN++o2cL8f7raf
         yOno1WOBCqZx3K++a1CZmiTW9iwWUDSJtQe/d0MlUrwlOa29aHOX5ZlhAFMwKLovOcgu
         qZXBcFEM4OxWgyfYYSvxU8v242O+6vbe1B263Gu0scjNd62/vnBJm4jxLZWvZR19EsRC
         cwfGcB2zBKubMApV2lRtYz/Z6SR9QD/cZuHO4DIcikj/JRb5+i6jb3dX+Ix10TaQxgNQ
         QdkonSIR6/4ayRob1BlGIQ2Y9e2knt1N981MGr/B8PUREHEjXeg6CyAwl0WornPQsE4N
         9/zg==
X-Gm-Message-State: AOJu0YwdvrS5at24dGb5awpU3Jwr0QoGFXww598vvOpQhR40oAmOa8J4
	0ljWKWcY2nCreA2RuuSM1iQ+rA==
X-Google-Smtp-Source: AGHT+IHf7dBPbEfSl1xqIGQRGLihbjGL2keEOoa4x4FFnpIIuQxIh6x560I9zGOiV02ODZa7GkaZmQ==
X-Received: by 2002:a05:6a20:4424:b0:140:54ab:7f43 with SMTP id ce36-20020a056a20442400b0014054ab7f43mr4680369pzb.52.1691697265119;
        Thu, 10 Aug 2023 12:54:25 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u9-20020a62ed09000000b00668652b020bsm1890241pfh.105.2023.08.10.12.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 12:54:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Kees Cook <keescook@chromium.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Lecopzer Chen <lecopzer.chen@mediatek.com>,
	Oleg Nesterov <oleg@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Williams <dan.j.williams@intel.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 1/2] ARM: ptrace: Restore syscall restart tracing
Date: Thu, 10 Aug 2023 12:54:18 -0700
Message-Id: <20230810195422.2304827-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810195141.never.338-kees@kernel.org>
References: <20230810195141.never.338-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=keescook@chromium.org;
 h=from:subject; bh=PM9VbACsiruUm736SKU4lZ4ZDYtSsZTBmd3nctTMIWk=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk1UBrSDo2U2GotGsBMY+sQ1nnEqac9N2ubUHNK
 geMLpezF8yJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZNVAawAKCRCJcvTf3G3A
 JgEwD/4/PU3jZw0GGsDb1rhpeL2CWa374R86q0eGZC9bP7yNGHj2MZNotCIzG1ln7HnfvVYFEqj
 ImnJ1VEoF2kur2GameknXgNcAnswvPigS2VhmBQwdreCXLTctILVJ6xaNWv9zI7s/o8S2qRk3jx
 tLChRFwN5bYukIbOiCVJi0/ZlsEbrkv9KJ28UEoH+l52omPYycquPtuUAyyXjd/xqDSxNe8GHTg
 QPQTl40snYaEBVFrg4IYKAEqDn3MrTuaQh30+kT0is+AlcENKEFbC83w8dijgS+NDGYtqPW1Pum
 9wi3XC+PwGwDRMC2GBeIx/DMCWEE70iElmjUXaljFYAS2/Qn59GFtgeFca3bYN5R9VPBhI1UrBv
 /guxuT6h9WK0dK80nUqcPeAJyfQt9pOUleFh3lRAEYjCPJF3/eM0JRLofpZ/eJrvoqypt5ON8Vp
 90Qs6Yt1qvpF1b1kQqdrGNrG6NR1t1KmrcvoK/FvdJiLQh1uQ/P0sCJsv0sU8HL0XA3/KSORI7L
 vwl03qLaPkhHsbWxFWQKV+VGlVfniPDjLaDUiFEMiAkAXx3mla223m6DGkZex8RIy7IzHKQiLZ2
 6kZsj36XGm95XXJXq84VUgZfPu0oxDYeq5c+v0dlZgj2Vz4UqwZB9lEef1mWbHm8S64fjs1a/g4 2hN+/trZF0WnbKA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_125426_297770_70BDE103 
X-CRM114-Status: GOOD (  11.82  )
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

Since commit 4e57a4ddf6b0 ("ARM: 9107/1: syscall: always store
thread_info->abi_syscall"), the seccomp selftests "syscall_restart" has
been broken. This was caused by the restart syscall not being stored to
"abi_syscall" during restart setup before branching to the "local_restart"
label. Tracers would see the wrong syscall, and scno would get overwritten
while returning from the TIF_WORK path. Add the missing store.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Fixes: 4e57a4ddf6b0 ("ARM: 9107/1: syscall: always store thread_info->abi_syscall")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/arm/kernel/entry-common.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index bcc4c9ec3aa4..5c31e9de7a60 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -90,6 +90,7 @@ slow_work_pending:
 	cmp	r0, #0
 	beq	no_work_pending
 	movlt	scno, #(__NR_restart_syscall - __NR_SYSCALL_BASE)
+	str	scno, [tsk, #TI_ABI_SYSCALL]	@ make sure tracers see update
 	ldmia	sp, {r0 - r6}			@ have to reload r0 - r6
 	b	local_restart			@ ... and off we go
 ENDPROC(ret_fast_syscall)
-- 
2.34.1


