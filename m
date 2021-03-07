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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367CBC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 04:18:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C8764DE2
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Mar 2021 04:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C8764DE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V5Tin1PQKtjVKvxjtNcD52MLg1nw9TPdfIY6Xmfb1gQ=; b=Is+CI761OW85p5gSlVq1d4KU8N
	v32rnmdn+PA8o+6yJiNJpasZkSAf7GwhlpBSBx6c2oZMIN4qKX3Y2i1STCtV9C/SpfFnxoCxTMb2g
	aUuvm7UnFOJuikyrt3OYwQ0Nd2WHXvqogUU9kNDBm8DVwqyOT3MqXiNC7EKKBN/pP+DphS6BIwJqm
	eCFK/iIz/GQn92Rl95nKNcfe1hwjqjlDeOyDcwK69lMnfiGF0szPnqhkxUoECK3rPtsQANOQSESSc
	xSECrbkIWzOGUVdN3LCUbgf1EUsAfOjP9wImuNwjzZTRl1fdifm+i8OFO7wbpyB5Z+1kySo6JyvHW
	suk4rZyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIkrh-00805Z-Gv; Sun, 07 Mar 2021 04:18:01 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIkrb-00801e-W4
 for linux-mediatek@lists.infradead.org; Sun, 07 Mar 2021 04:17:58 +0000
Received: by mail-pf1-x42b.google.com with SMTP id x7so1551778pfi.7
 for <linux-mediatek@lists.infradead.org>; Sat, 06 Mar 2021 20:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BwSr78t+B2LUeJacm/isuxGQ5VeOpmr80Bmxx6BZVJo=;
 b=as0fSSEQ1NH7aMWnQJdht3ERxBRoYl7zromvnpBnG5ajSrMlb8rmFESSDKeHSZjzzy
 tMjAGVm7JrPUrlgks3ZZN95V4PCjjZpHiGJeow1D+uLgD2YpjbH6QsN24WuXveF8OglL
 wTn1e2wj+a3CMGLfOwOXu1LQQrk98KtjFUMAJVEgFXYeW1YMoB9oSHbE5JSDr6/jbYnH
 UYwXNuf+V66jORDBKDQ2nzgySvZktKUESK1EfFS9suQRJxxPc1M+y6uxkWRfxDozgexc
 hgQx6MxapEWZwFNQ9FLVihY0euCGT2J+sSCUUGjr6+XLKdPIxeBnhtNtLgHUtzjhYVqU
 vo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BwSr78t+B2LUeJacm/isuxGQ5VeOpmr80Bmxx6BZVJo=;
 b=dAD41+pQP+G5yn/MG9Opv0JQXug+TRMveJ2z2J1uHf7jfmSN3bflFh/h5fn5JjXPSC
 QON6uDEDKPibDFVeQqLM7FvG8R9MumIgPc7XFXi2WeWVE3XAFRRds2yYZ9zJHAs7cvb0
 4kIpoXQHyeUbjg3Aov/yg3Zkpwem4Bvl/yljvjEROr9Jw7OfdcXrb3CIvOM5sNoh+ZfO
 5nZJ76dmL8LoTd5ew4NA3rtWcIeOx9CsOzeoj7g12SwCnuuhkfJBaKSdO/k6KrS7Nadu
 epjb29J2tmRnpCfaGKbO3LrmPRTJgeDIpwYW5ft3BTs+QKEAsRm6goSNWZaIloFgU3Nk
 o4Ew==
X-Gm-Message-State: AOAM531FY/+5n1vEF9Fe1qygZvO+U0BoMamseg9zYXTs6/WYxVGyAAMZ
 nLkS8xxU9RRvckwbmDTyBZc=
X-Google-Smtp-Source: ABdhPJxLQpQr+02pM9SlbvqEMAX/ywdeetyk6A67y+MpRa93jDqkPyR1VEHC5c4FGKmWfQkpS9UHzg==
X-Received: by 2002:a62:43:0:b029:1cd:2de2:5a24 with SMTP id
 64-20020a6200430000b02901cd2de25a24mr15382313pfa.27.1615090672295; 
 Sat, 06 Mar 2021 20:17:52 -0800 (PST)
Received: from z640-arch.lan ([2602:3f:e6a6:5d00::678])
 by smtp.gmail.com with ESMTPSA id l3sm6406619pfc.81.2021.03.06.20.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 20:17:51 -0800 (PST)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH] MIPS: pci-mt7620: fix PLL lock check
Date: Sat,  6 Mar 2021 20:17:24 -0800
Message-Id: <20210307041724.3185139-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_041756_153351_308058A8 
X-CRM114-Status: GOOD (  12.08  )
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
---
 arch/mips/pci/pci-mt7620.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/pci/pci-mt7620.c b/arch/mips/pci/pci-mt7620.c
index d36061603752..e032932348d6 100644
--- a/arch/mips/pci/pci-mt7620.c
+++ b/arch/mips/pci/pci-mt7620.c
@@ -30,6 +30,7 @@
 #define RALINK_GPIOMODE			0x60
 
 #define PPLL_CFG1			0x9c
+#define PPLL_LD				BIT(23)
 
 #define PPLL_DRV			0xa0
 #define PDRV_SW_SET			BIT(31)
@@ -239,8 +240,8 @@ static int mt7620_pci_hw_init(struct platform_device *pdev)
 	rt_sysc_m32(0, RALINK_PCIE0_CLK_EN, RALINK_CLKCFG1);
 	mdelay(100);
 
-	if (!(rt_sysc_r32(PPLL_CFG1) & PDRV_SW_SET)) {
-		dev_err(&pdev->dev, "MT7620 PPLL unlock\n");
+	if (!(rt_sysc_r32(PPLL_CFG1) & PPLL_LD)) {
+		dev_err(&pdev->dev, "pcie PLL not locked, aborting init\n");
 		reset_control_assert(rstpcie0);
 		rt_sysc_m32(RALINK_PCIE0_CLK_EN, 0, RALINK_CLKCFG1);
 		return -1;
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
