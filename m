Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9D8C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 09:01:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65CF42073C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 09:01:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RG5WpVbQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p6fcjET4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65CF42073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5bc3dsBamYSJRcheoTRrJQOtOzM0eqf2tBLetjAsuo=; b=RG5WpVbQ/+O3CRgwikcOD/YKpK
	TcdDq1Fi5FDNzCCizDGD6JDjHdRpWzAsnFUlfStPSohAyAVII/Z95AYJNVv0DwD+Ljr+gI5davZ8N
	uLjG44FE8GEmVVrNxnqV5Zj/V47tI59HXOmjMDIb/SHNMhl+HaXjsVW4LOfdMbGm2E3U9uujUu82P
	/tc2VsE2jJst/nEeT8L6wiNCW8y1aaR1EbgZrBr2aYTpDZXxXmOSPHHJOmzrpRQLIV3uW5rdYR87G
	aO0dtc9j1BL0Gv4C1uxasR/ha9gWo1TKXIN8uAwkFJ7Hy0ujhWZZFRY6WbiMkclyR87DIzn/FJs+A
	eK7MB3VA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khUCt-0000MX-UK; Tue, 24 Nov 2020 09:01:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khUCr-0000LW-QC; Tue, 24 Nov 2020 09:01:51 +0000
X-UUID: 89f5383e0bbf48548f12a8333ddecaa9-20201124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+79SKGa+A8TGnUbLjyi9ibN0YOHhB4vqu41JpiHRmUg=; 
 b=p6fcjET4bppElR4RsYjpeJoegejkw4nH0LysqAesKlvqhQns2HuvDwLxQ9qymd3WC2HqXUOPvyir0fK44xZQuu6j9mtQBalt0IB3oH+w/vmsksQhQPU8MP3PvMsgrU2BHlIz53Kpi5leIFQlvqCAF+jJ/DtdHpFb5XBWs0jq5KQ=;
X-UUID: 89f5383e0bbf48548f12a8333ddecaa9-20201124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1754348229; Tue, 24 Nov 2020 01:01:42 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Nov 2020 01:01:36 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Nov 2020 17:01:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 24 Nov 2020 17:01:39 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] arm64: Kconfig: Add SYS_SUPPORTS_APM_EMULATION
Date: Tue, 24 Nov 2020 17:01:31 +0800
Message-ID: <20201124090131.27257-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_040150_076240_70D5535D 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, catalin.marinas@arm.com,
 yj.chiang@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Lecopzer Chen" <lecopzer.chen@mediatek.com>

Although most of modern devices use ACPI, there still has combination
of APM + ARM64.

In order to select CONFIG_APM_EMULATION, make SYS_SUPPORTS_APM_EMULATION
default is y if ACPI isn't configured.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Suggested-by: YJ Chiang <yj.chiang@mediatek.com>
---
 arch/arm64/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1515f6f153a0..5e9e3694015a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -260,6 +260,9 @@ config NO_IOPORT_MAP
 config STACKTRACE_SUPPORT
 	def_bool y
 
+config SYS_SUPPORTS_APM_EMULATION
+	def_bool y if !ACPI
+
 config ILLEGAL_POINTER_VALUE
 	hex
 	default 0xdead000000000000
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
