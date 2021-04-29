Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C48CC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 06:22:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D46CB61446
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 06:22:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D46CB61446
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kQn30imQM7QtHLDZkcdEEMiKEC27s6GfC5i85JAix3c=; b=EKrcuOCPr8ajviqhlEZe6kcAC
	WuDnFfZoSivzarnsyHhKde97r11jGSpmUOpwm8gcBbmpX0yUIiO/TqApn8fd6YDt+2OXZcx2EluMs
	RlaSlW8afvh+7ZU3liP0fTA+4vkqvppHeJj+5p5Gi8C/augqh96XSpcW51b5If0Y+MLRlCvyNhYHG
	cK/HkPxBtqJFXukK8rnI7Dc80YfJ8UfvwjUIBmG2YSgpBgGnO6Hk1OxduI8iIcgTYMaXRjPJpx7N5
	E6CYDdBj3KmwT8iaHO9GheguwTJuOcamsr8iZ4eD9WSlQ1T2D2b6eyRAt7EJ/gMi5jSw9pT5UN8Kv
	wRceBatQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc041-0053L6-Ab; Thu, 29 Apr 2021 06:22:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc03y-0053KX-Fq
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 06:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RSIa7cBeJXNMWSKO0g+y/qJaGWxsHGcVnf++n7k/uXw=; b=dDiEaLuQnKIVJuv3zp9cHaBWqL
 VtqY0igOcK/oD+F4V3UPKSjRHCMXUZNA8ADL/z9iRYvmULexSo5XPh4PZVobDuzdvtSr/C1GgXcb6
 pxtODjwzfiuYU7KhrUSc78vm3GL79pu2gwFENUQPlZwxnU8rL5lhQ4RNKuxc6tYQOsbqClkByAjz6
 vcBc1VVeWh99kfcqznSc1MkowAMqcls1kPSPYVXHaNxrbfncoXDJlHX7kSUxp2IWv1pZ7mkDfZcd1
 8m45YcHj9CmFPODp3C3H2l6d+W22cJBW/dXOO3DZ5bZmKX1XlaTW/F5APC03bNEnMdTgHdw+DUlgc
 PGSIuWkg==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc03w-000PGl-5X
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 06:22:13 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 h14-20020a17090aea8eb02901553e1cc649so8213774pjz.0
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 23:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSIa7cBeJXNMWSKO0g+y/qJaGWxsHGcVnf++n7k/uXw=;
 b=BRiQ7/DW5YHwWO7c9iXHCGkrjRhxLKv9pg5hGtzg+gFnL9Nvlgjnkf1yYCu0SW5yzJ
 AUjvGQyY3l+d5rz7Ctg7S615v/rQYvfgcRIKCFMXFpGPndl+wZ/EORLtJY4B5mn2QsCx
 UGzG8fBwRxkBDtHatHgiZuG9zf2iIYKdUCgvtvjKOTzH7wz1MQ/ngQo/AnKKFOcIWeKX
 4nkA+T1OKeAf8aoVn1IShyvoyJKyGhDEok2cmttnKyDIlr4Md7Rsp+NDMA34Jdp61HA+
 qrl8FT1SuRMiTMzD0oZYF7sDt3VUkCbS/74b9+NTZSB0nwyfjIeVjio6OoTpTBYFuJZs
 ZBBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSIa7cBeJXNMWSKO0g+y/qJaGWxsHGcVnf++n7k/uXw=;
 b=jn+/rwfTKjfCqIpgoZZcjEwwNKYnxWVXZzBa4nd94o2WJC1niy3qtpR+1ziqN1igok
 3eN7wMpzYCysjRM+Pv8hL7rcuPz4N9zocSYVWfpBxUEPVx9qCUZjHlhnP2PSIA8GnVAn
 2DO3bWgi7SCyOgBIzWlyPyn5BAMsa8z0Rxg3OQRZP2QGWlx0CCgE2xfO7iVeSpKd2eyZ
 +Lq2tPUOyKeAjFzSAfeZK+nzu2H4CGLH6ODeaf/LTk5v9n1y0fH6Pd2PPzVvLACb5tPM
 GIDWTW53z1elPZPce8bbNeLBRB+6bVUeQa8luLyvUlFEpxl4eplOF2/JogL6QaIuzFWC
 bUkw==
X-Gm-Message-State: AOAM532T0vL9sOdtKnudj6scdQol0/L0nLsLFwZMFX/F7tvj6A8jeid1
 3anCO4W7thVJX0g8nrX0ht4=
X-Google-Smtp-Source: ABdhPJz78bH+9TBRL6WkYhA1HjaOrdEk/3am69Dj1OmvsxGayn11HtBOKdGvNOoxsDI1jcc4AlHTUg==
X-Received: by 2002:a17:902:a582:b029:ec:d002:623b with SMTP id
 az2-20020a170902a582b02900ecd002623bmr34077406plb.36.1619677331784; 
 Wed, 28 Apr 2021 23:22:11 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id b7sm1431008pfi.42.2021.04.28.23.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 23:22:11 -0700 (PDT)
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
Subject: [PATCH net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt
 controller
Date: Thu, 29 Apr 2021 14:21:30 +0800
Message-Id: <20210429062130.29403-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429062130.29403-1-dqfext@gmail.com>
References: <20210429062130.29403-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_232212_224141_C473CC8E 
X-CRM114-Status: GOOD (  10.15  )
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
---
RFC v4 -> PATCH v1:
- No changes.

 drivers/staging/mt7621-dts/mt7621.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 16fc94f65486..0f7e487883a5 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -447,6 +447,10 @@ switch0: switch0@0 {
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
