Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3D2C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:51:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41EE661606
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41EE661606
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FsBH60MDXv1H+KOfsa7uMUQWZkcTL5kBP8mC+Oqw3bA=; b=Qs4LFXBN5Quri8SVVqxCShqMg
	w0tH3lvo7dvY0IgRcWGiQA1XD2GRnJClW3RoaZlGR7wRkay+2LYJ1FMlBwsKMUmO66kHIHksneEeW
	84R6nsTK/4vu58NljT/695E1hAuIaam0etdZQh3d7FKjZKwEVKIZrarQavZqVNOLUY/iJ8+VvQNBk
	3WS8NJ3i543qXE4YEyeF5Dm4ly440qbNLNJghZsLVZJrmUr64Zjkhqpe5sgDhWlVesMQDCqtAxIOk
	zO+Wpz0d1BOqXk8SU3LkiYgeKAPntiOM9hkmpHiiWxVWPM3CZXjY5R0hDh5WLVIaV7uobcbB0iGUz
	t+v2wnytA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgr8Z-003G0l-W8; Wed, 12 May 2021 15:51:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgr8W-003G0K-7E
 for linux-mediatek@desiato.infradead.org; Wed, 12 May 2021 15:51:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=dw/1ocCbLEH9860oe9ZU5bX1IwKMl+9j47T44u4KOU8=; b=4jxKM2rMhMFLKo8pHUBEfRgwBx
 SBfmSWBQ2m8BfJ6Q1EgFvn6sRcoJ+RL3NL98lMPJCnjdhyBSjTEjP73Ll8m2K3aPOAAaMiS30dqnp
 vDkpSIO0p7zgxv3yabxJG/klaNwOYJCjX9Sst7i8to5CqKVLYgWf945Kr9yH5dxszP9kmplFsXUaO
 Xz1bMUsR2XSH6oEN7hncIljd3nZAKM5jvrgFcaymQ7AvG65K0zcPuSF5dScOOXhAnJZ6agenXtAEu
 RJM11B1oy5JF9swu54tWLYIM9OGInLJKvcqngO+B9U7s2ZSSM+CZgijovXz1dDQlPVRNswTLxMgpX
 wBjWcjCA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgr8T-00AY3E-Gu
 for linux-mediatek@lists.infradead.org; Wed, 12 May 2021 15:50:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6BA7C61DF1;
 Wed, 12 May 2021 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620834656;
 bh=s3BM/sj6oyrnLcGniBopzOVI6NUof9Zb1aULINA8GoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iJg0wugv9JT/r0vWbE8x6Cr6ioP/TqgbzfwPHDoMsOsULyRXdK4Hyu+k72KPW0K6Q
 +NT15Rmwz6KxD5AKn2V7mPwXqUAfBsoaKP7x+B3UfpZg/BfLP44L7TnfVNVHlZsDsF
 lVv03vG9BQlMIL1Y6E4/KCY7xrwUordixD+exigY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 5.12 030/677] MIPS: pci-mt7620: fix PLL lock check
Date: Wed, 12 May 2021 16:41:16 +0200
Message-Id: <20210512144838.225243488@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512144837.204217980@linuxfoundation.org>
References: <20210512144837.204217980@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_085057_605620_AB4ED623 
X-CRM114-Status: GOOD (  10.74  )
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

From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

commit c15b99ae2ba9ea30da3c7cd4765b8a4707e530a6 upstream.

Upstream a long-standing OpenWrt patch [0] that fixes MT7620 PCIe PLL
lock check. The existing code checks the wrong register bit: PPLL_SW_SET
is not defined in PPLL_CFG1 and bit 31 of PPLL_CFG1 is marked as reserved
in the MT7620 Programming Guide. The correct bit to check for PLL lock
is PPLL_LD (bit 23).

Also reword the error message for clarity.

Without this change it is unlikely that this driver ever worked with
mainline kernel.

[0]: https://lists.infradead.org/pipermail/lede-commits/2017-July/004441.html

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: John Crispin <john@phrozen.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/mips/pci/pci-mt7620.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/arch/mips/pci/pci-mt7620.c
+++ b/arch/mips/pci/pci-mt7620.c
@@ -30,6 +30,7 @@
 #define RALINK_GPIOMODE			0x60
 
 #define PPLL_CFG1			0x9c
+#define PPLL_LD				BIT(23)
 
 #define PPLL_DRV			0xa0
 #define PDRV_SW_SET			BIT(31)
@@ -239,8 +240,8 @@ static int mt7620_pci_hw_init(struct pla
 	rt_sysc_m32(0, RALINK_PCIE0_CLK_EN, RALINK_CLKCFG1);
 	mdelay(100);
 
-	if (!(rt_sysc_r32(PPLL_CFG1) & PDRV_SW_SET)) {
-		dev_err(&pdev->dev, "MT7620 PPLL unlock\n");
+	if (!(rt_sysc_r32(PPLL_CFG1) & PPLL_LD)) {
+		dev_err(&pdev->dev, "pcie PLL not locked, aborting init\n");
 		reset_control_assert(rstpcie0);
 		rt_sysc_m32(RALINK_PCIE0_CLK_EN, 0, RALINK_CLKCFG1);
 		return -1;



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
