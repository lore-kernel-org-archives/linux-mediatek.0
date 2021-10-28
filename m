Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E395C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1499961073
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1499961073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFP5dMNaqyjKtYYXyIcCSj6gbFtVz2/Jw5yaTptZZBk=; b=Pj0bzIoWBv9CL3
	oSxHkGikFL59edsWG/e2ftb4TQ8duqkfCGo5IT1IUJOUMSjjavZBqmu96lzAZ3LdjL+CMtf9EsVP1
	1TsPFe+/+jFTVqxG1eJYUUlgnOIZ9a9eQbwr9nWzFkqwH/prN9uaryuiOGGJGjdnIHlFEVYI4Vehy
	cxSBp4aUmRjZHs3BOmSv1tG5NEEb8zBk9EXfTDcUQ48FRV2NHLiW/xsDn4NK2a+cZn4nYAGve0ef7
	BTTAyY4toATVKPLvitAjF3cz6M9akXL/SVeD5v1FYWZ9zeRPPxLrjnsrstxvJLb5P5fhfpqfiXnJy
	P26Shm8MTiEhotHShM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfwgF-006oHn-5i; Thu, 28 Oct 2021 04:06:19 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfwfh-006o5r-Di; Thu, 28 Oct 2021 04:05:46 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 x16-20020a9d7050000000b00553d5d169f7so5090750otj.6; 
 Wed, 27 Oct 2021 21:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+tBzyjdtiL7WiGh5FMDAmWBmKCfNS0J8B90yCIvOhk=;
 b=CM/XdogpcvHEPwFAcgkLE7uiWCL/8qMOeb400V/JbUG3sXhNda00BpX1XVkThtVz11
 3lmjPzMgUv1IsXtuktrulzSI/4iOsQshS0zm0yp6RRbJvf9rVpkmbHBQW9M9Xdo1JWrJ
 bWrYFpJVBLGkYcoP04qyYITNUZUTAsLaR5Gotgd66KTIttiqNDQJ/TFoMgSBzJsSN1CB
 H/3yamELti7rjNVt5Hfa/72Ar8sXSquXOmmOAmxINU4vewfB5gvqktr3nscliwJBnQLE
 ngcuJZ9vCOvejdYMH8SpfVMgy73rz4qXioZ0moTAqMBAO+Se+s0zgUxyFWrBX5xFOar5
 StGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+tBzyjdtiL7WiGh5FMDAmWBmKCfNS0J8B90yCIvOhk=;
 b=TgPJbxSSNk3HA5uINssBYiTR35cJDdZZi+KC5BUBLCt4Iw2Qz60A3V9l3BYfRSbD8F
 8mGJMx2Zwa50c1nG0/HVzZhSu3b6hdNCOUc7g+4I8Ec4LlCy8ZSvXNMsnO3QbusbDejE
 +m04j0TmdHnQ0UDQZx81XtLGmtjlyIpen8p4FluAEz6HQWiX21GGsa25aiTiBEjnMOxp
 xWAOX+hHqUmcNNmvh3SfTaQnFjnDShgGe5jRt48dJQ06MBJwf6aGdkIkPnZWDBwYW3oi
 700l4bvL30tHr9MHokQX1nnnVGFiwJQ/EPqE2CX7lVs3rDFkttUt2oEsMwo+BfJAghe1
 44lQ==
X-Gm-Message-State: AOAM530tri0FP50pVs6f3jn56CtQ2rDULjynurrDoPsehox7/rw+yVb6
 PJQIjNhHa2I5AJv6C+S4HK8=
X-Google-Smtp-Source: ABdhPJz15h6Ua5d1nPpoPCyg4sOtLDX9RCc0IWLc+3V4EGGO8S09ewc0W/q3HfQeCpnKF5E0JShyCQ==
X-Received: by 2002:a9d:4b16:: with SMTP id q22mr1559700otf.72.1635393944151; 
 Wed, 27 Oct 2021 21:05:44 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
 by smtp.gmail.com with ESMTPSA id v13sm720310otn.41.2021.10.27.21.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 21:05:43 -0700 (PDT)
From: Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To: tsbogend@alpha.franken.de, sergio.paracuellos@gmail.com,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Cc: Wang Haojun <wanghaojun@loongson.cn>, sfr@canb.auug.org.au,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 chenhuacai@kernel.org, sterlingteng@gmail.com, linux-next@vger.kernel.org,
 Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 3/3] MIPS: traps: export a missing symbols to be able to
 use it from driver code
Date: Thu, 28 Oct 2021 12:04:54 +0800
Message-Id: <8c0287f7197e3d056e3954711aaa4501146de938.1635390750.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1635390750.git.siyanteng@loongson.cn>
References: <cover.1635390750.git.siyanteng@loongson.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_210545_494702_3C2F96F2 
X-CRM114-Status: GOOD (  10.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Wang Haojun <wanghaojun@loongson.cn>

Since commit 707a4cdf86e5 ("bus: brcmstb_gisb: Allow building as module")
the brcmstb_gisb bus driver is built as a module but modpost complains once
these drivers become modules.

ERROR: modpost: "board_be_handler" [drivers/bus/brcmstb_gisb.ko] undefined!

Let's just export it.

Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/mips/kernel/traps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 6f07362de5ce..409bcc755b89 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -104,6 +104,7 @@ extern void tlb_do_page_fault_0(void);
 
 void (*board_be_init)(void);
 int (*board_be_handler)(struct pt_regs *regs, int is_fixup);
+EXPORT_SYMBOL_GPL(board_be_handler);
 void (*board_nmi_handler_setup)(void);
 void (*board_ejtag_handler_setup)(void);
 void (*board_bind_eic_interrupt)(int irq, int regset);
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
