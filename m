Return-Path: <SRS0=Dmy6=IF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933E2C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 19:08:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3238A64EF4
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 19:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3238A64EF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R38jP1A7gGbmQLYPzVjMTR0KoYPo9fL0hlHs1XIawyY=; b=LI3+dw0WE8llt1Es2PkFdK9TCE
	UF1z1ErNuq8WTzyz1VZMnG9i9KcJQQMoR4iTVsV1CAubW88xgtXBCAiEhd6jH5BBjSXwZn5m0t4Qn
	WAflRDNq90Uf/cbbBxFLYxDwXKcSabx2HewaXDC3mA1dXK6T0LfF4fGKwlPAetFSIzvzbYAPKaSqr
	2zOi4Y8Qy7TAPJYbfbBKVg6YZAcVThWuIIwxAfOtEMUYUjV339wK1tAmYmhC3f+sAnPA5qHm/oPir
	XwD4L+doa5tFXXfBd/X0S7J/jRo/7CaBuUcZbgrDhUZ/sXj9gs1avw6VT5J11wbR2XWaz9cFPVPan
	GYJhdcJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIylI-00BrW9-4h; Sun, 07 Mar 2021 19:08:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIylA-00BrUP-6g
 for linux-mediatek@lists.infradead.org; Sun, 07 Mar 2021 19:08:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id x7so2317523pfi.7
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Mar 2021 11:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GwMIYd2aV+XXRot1tFZrSh9m+xuglTUB/+BUvlkK3IE=;
 b=PosIdd0P9xOzXAH2spYx5P0uFH1CYzD8cR1Ef5KfZSig0LgtZ9vNNS+Sb1qVqnJCpz
 ds6aAZbcCNhJrgUAq6UsUODKfXNxqnYp13P7QGnXoWudzwG+PusG6IQTmpIfkqU7tRnH
 lWNaw8Wc7GgMvnRhRqwcIkij5oQaD7EOx/A1LoeGu1jI2Jr7Y6AxFFIR0tMzjWiZ1jny
 eGgSH28X/Mm4MTLALUwHYByF7q+WxfrsxzpzhFJq7WkrjWEohN2YemLSF5FtQJwLAYBq
 0fnqVzC9gWxKm9tczVhG1Re2efdrjwEXXBg3csuKmbf6FEoKLbrt0KahNCqogqSMiZKn
 mhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GwMIYd2aV+XXRot1tFZrSh9m+xuglTUB/+BUvlkK3IE=;
 b=nh/CMMCsKijHYfiH6wnIftvIltfPsikiHQGi9WCsa23GuPK/WHGmrqDsYLbXQBheyI
 8V/T7MtFLjscMwyVPWxS2F2/dj2zcIPRRnsM4ysfP+/+Bt0RyduaRrgGvbcb16U+xgQJ
 2fDF+6eLysrIt8T0jzCAQp2UwjaB5MG8E0DDAh3pw3aiWKiG/C1EegL58DojtkSSm63V
 yTFPCyFT4VnLNU8Ptt8+s3UHMz3/ywYMl5KzpCyGy4MN2jqXmXXNbw31nKM++Jd7Ow/0
 TWMis9Xk4pSmpyYb4ogS7dyJTcxdTevxrbJEpIze+vMlr8i4tjI4vtEWz1y4Ym+qj9Mh
 4/nA==
X-Gm-Message-State: AOAM533Av+pLKZlBv6zJOEWFI7R++LLQYhO6DyGBJPTL/GnvPpGgBtCv
 qF41Fm+9iUsMldCEqEcW7WI=
X-Google-Smtp-Source: ABdhPJySoqAvxLUXrLa3YBV7XlcOUT2CqkmnMeSZihLSaDXIXhJUDJKp5S66ABbDs0YY+CgaLG1d/A==
X-Received: by 2002:a65:6209:: with SMTP id d9mr17256515pgv.206.1615144090625; 
 Sun, 07 Mar 2021 11:08:10 -0800 (PST)
Received: from z640-arch.lan ([2602:3f:e6a6:5d00::678])
 by smtp.gmail.com with ESMTPSA id y63sm7499955pfy.68.2021.03.07.11.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 11:08:10 -0800 (PST)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 John Crispin <john@phrozen.org>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: ralink: select WEAK_REORDERING_BEYOND_LLSC on MT7621
Date: Sun,  7 Mar 2021 11:08:06 -0800
Message-Id: <20210307190806.5211-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_190815_787606_123DA7EB 
X-CRM114-Status: UNSURE (   7.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Upstream a long-standing OpenWrt patch for RALINK MT7621 SoC. Selecting
WEAK_REORDERING_BEYOND_LLSC fixes random kernel hangs. This bug and fix
was reported by MediaTek WCN division [0].

[0]: https://lists.infradead.org/pipermail/lede-commits/2017-August/004537.html

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/mips/ralink/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index c20c44788b62..31671bbf26ff 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -62,6 +62,7 @@ choice
 		select CLKSRC_MIPS_GIC
 		select HAVE_PCI if PCI_MT7621
 		select SOC_BUS
+		select WEAK_REORDERING_BEYOND_LLSC
 endchoice
 
 choice
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
