Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12EAC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:33:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E04060FD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E04060FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qM7lubWe1PgLRXpbdN4H6TPRX6Y2nKtzI1/qU4Vm/ro=; b=M8Ym8UMhyMhGCSnn75tldktZ1
	+Q335Lt7z7jO+ja9QlYIJ7egc5fTkE7OPljxeSymw1iw5QKAGlEfTZAAWUMKvWNX4NZrDR3noGbqA
	SqQZ5iy9nIY0Ho8wOHq9AKExznX4AQj/kOhur5F4kHNZaqfmV1P8QgB/l1qOQPwAvMnezaNwHiPeU
	S6S6O9NuK4/HGCNz1XE0DrSAumddildktZ3SMYboinCPZ3B58RcM68/GAc1g2lb6a1fBbs2Jv0riQ
	NIVzvfP98OQ2FbyxYTIlcVnyweWbM6t/Ky2XrCr3VFP4jcs/XXapEAKmHvSpLBGlVt5nK8hpVy7x5
	e11S3utoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljCx2-002anf-UA; Wed, 19 May 2021 03:32:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljCx0-002an3-AC
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 03:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=cU46aoQaP3zsCAzQqoMqrX6Zi5wdFXKEcbXbGkFJHJg=; b=YZtZDDY++WX3uVcqK/cfFJk/A3
 kTnJ2Suqn57q01IHuYTtxLp0Qj75yr+VqCyj3d/2sohwythBCAwOphlCXiN2lqEcDGse0l+zM4rgO
 DTYLRDLvM4CP7Ikw90i29dNVpAkvRVdh5KFjCLDNoW0qTOL67QpAkDwIjmew8Yl6zLUTfSEL7TWoh
 xmdFpgudZKuYy+ZhTuZq8mizB0A+eB/Qu8Rv41jWDMRfwTSd32sic0CbJDL7rScp6z73BLn0r+caH
 /8oE5Ciy+td1D2pPqAp/m0VEvRo5ves9LkkkRleOiu6nwhkP9Q1FSe7z7B5g4jkGHuFiLVHBi/y6F
 fATUvcAw==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljCwx-00F5bV-TP
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 03:32:49 +0000
Received: by mail-pg1-x533.google.com with SMTP id v14so5732695pgi.6
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 20:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cU46aoQaP3zsCAzQqoMqrX6Zi5wdFXKEcbXbGkFJHJg=;
 b=Py2UV9AnBv1/ncNmbnmTRHpSvk0WbcHX9zQmnaASFi6ATMOgoSsXAsOAMjegTa3vBH
 rSzQrZOXF17nMS98S7SoQT8kLVR5p7G2AO3hetRK6dTeHVG39sNdYXxI+CtlWUkeYyr/
 Q3f0qNRvqK8fB91FNP1hi7W2H4kNHynfovvdtyyI5CgkZ+BYskpmwAL/wb7qHdZf2TQa
 6HNF5dHPDvIdhT5z2GKZzC3p+KVaulPugVp+nFtz9LJyHTwq6rZqiJ2gAqf/FXIGAE2L
 vlaiwOmWMFgS938CHSzTrmujuMoYlX46SOKpl88ba9j5NTuBIHSY3pa0mIZeiE2/R2Z0
 i5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cU46aoQaP3zsCAzQqoMqrX6Zi5wdFXKEcbXbGkFJHJg=;
 b=IKsDYBJQWNYgK62Rck1G0x/rVlHIbkeMG4tbxcNyhxrcC85NIzJWF+L1nm0wVF6egP
 lX+TGBV90v/vbEaDag3odpXza/6nRPg/4zHNZgkCziWEFXKdTJaCy3eRS3yNa170jT1q
 hzuywBOKeWf/iQB+7796/djWIP+r1YJ7gexLphf/+jTCj0+OlS9rKuA3YWcLJz1S0sr/
 h1J57ZQqo20J7QUGmhDKFRd4i0xpkIvp6lDCj+mTgAO57WlqYnqtuFLt1HnILhtb1/Wj
 o/+rlo4vSoW2dYwaJ6kpJVOosWow1vnp5JcGwK1BWhmjLOs9BaTON04O3SYNx/Iehc9E
 m4YQ==
X-Gm-Message-State: AOAM532ksug+sfsQifpzCaTcqXUbV4vsCNqo0t16Zikg/TpxBAJCSQsd
 Zk6XwY1GCX5D+JsBkDfY1Oc=
X-Google-Smtp-Source: ABdhPJyg3qe/ZpL5oLW+mOEa0aXvCaTmjpc+MZIEIy7hvq34/CDsFAbCKFaESSa4EpddYj5LR1b8sQ==
X-Received: by 2002:aa7:88c8:0:b029:2de:7b37:7d23 with SMTP id
 k8-20020aa788c80000b02902de7b377d23mr5902108pff.59.1621395167152; 
 Tue, 18 May 2021 20:32:47 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g13sm8244587pfr.75.2021.05.18.20.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 20:32:46 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: [PATCH net-next v2 4/4] staging: mt7621-dts: enable MT7530 interrupt
 controller
Date: Wed, 19 May 2021 11:32:02 +0800
Message-Id: <20210519033202.3245667-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519033202.3245667-1-dqfext@gmail.com>
References: <20210519033202.3245667-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_203247_964795_0E79159F 
X-CRM114-Status: GOOD (  11.10  )
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

Enable MT7530 interrupt controller in the MT7621 SoC.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v1 -> v2:
No changes.

 drivers/staging/mt7621-dts/mt7621.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index f0c9ae757bcd..093a7f8091b5 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -437,6 +437,10 @@ switch0: switch0@0 {
 				mediatek,mcm;
 				resets = <&rstctrl 2>;
 				reset-names = "mcm";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
 					#address-cells = <1>;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
