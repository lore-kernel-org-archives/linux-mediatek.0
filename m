Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05A1C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 03:43:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 492096109E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 03:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 492096109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IsB/i81Blg/SAiGoHjRKBhjhUzSyGYXqOSKe+NGIBGU=; b=c+3MeoNAaFX+csHp4AZY4DMPy
	UCJFOzj6KSZDwPkWoIN8g/Tmj2P2RrUa5vGu0D68LRqJfL0hsBSDfI2HCKmHslCGFRxjdJboOWiGk
	BFn9ts70ImeJ1VA4XuNeDbSWlykfyJbFn+nPy3S6wuhruVX6SRSeYEUb15VII/VEpgMJoYAsHQr8j
	qSwRhqNVPbTwygv9P8YYMsALKq3fNN0tutByavo5khey1uFIbftxSVjXhItuQOxogfcM5aBavoDX6
	I1/bQKAtmgYyPQP3mMhLDpt/fCQu4x8nVsm7df5DFIPIoec4+XDfxkFoLBw21Z94Mj5Epv55kKSee
	npTfCzl4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVnTu-005cE3-Ub; Mon, 12 Apr 2021 03:43:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVnTt-005cDo-A1
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 03:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=B7rQ+eZyVc+UGwnL8MpFME+8yUWCYk1WtHWcRPLJGoU=; b=C7kBaT/aOg6G7X8bBToKPXWSyw
 1mprXa6CkNW/27uG95TAB59i3P66LMjYkM5dlJYllQMrvmtI+vZY4hlzjwVow8RqyijJbuO+9dXMz
 Xa8lPuUPrcx0lQddnYwoHC44lALqytEzViYnsnf6D6kC1LiRV9zt6HALvsZlAkDjhPs6YV3Dn1YZ5
 5ir5mQ7ojylnuieathnQF3nbBwscxIGynmYd80E6Wa3kMWI2+tS6BQMF1l2gFJokKVelgaAYMG/rm
 czEQ3s+gjB9cVO8wPRK2i6rQD+oudUSPyVSraM82cS54Nwj4Z+KxC0ceu7/m4CitAE3uBlfgCx+CM
 mpWzFUFA==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVnTq-005rUR-Uh
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 03:43:20 +0000
Received: by mail-pf1-x436.google.com with SMTP id o123so8327010pfb.4
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Apr 2021 20:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B7rQ+eZyVc+UGwnL8MpFME+8yUWCYk1WtHWcRPLJGoU=;
 b=SX9V77mQzekQf74AmDKyq12CC70YI2JSMomXypPWg9EHeJO19nYLvD9v1RV/OQhqZ2
 bnJ5kqRCF0sI51ZclyYfkhiK9LsuieMFVM5BMyGSBtOSFI3OnQmY73FUusH6Tq7gNyW2
 osgLXz40/Q0FOx3/MmRNi33vLAK8MLpJUCpJ1aSJSc4Rfl/ljkQoYNCAfyc1Aj/nLRel
 mWEh8nXmAf9GZPeHwdRvCxRvs8ryBxXafF5k8lQFak74lGtR9/mvfyb0hCDlputgEcIh
 PQvVZPo35rol+nKCC9hUzYYCm7LFmGgBN03lYQlYMjwaE1P8oTR+LBzBAMFJU+ehziGn
 guBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B7rQ+eZyVc+UGwnL8MpFME+8yUWCYk1WtHWcRPLJGoU=;
 b=O/9qpL0DOszc5MrQAe9m5tcq4iItq/27qWe9SMTuv7MXfS1w1F45m7bySm+OpSwi5K
 GITz374IA2JpqvjMTWpD9DgHFl/zj5/KvCzBTeZTQqYpbzBNEpVIN+BWbH4c2MLEs3DX
 o6GnikWkrk+zTqQSZzUyhUPOkcp7rJf9hWiKAs6QusQRwMGTx89MoW/VZKQUW42Y/GX/
 rO9fZLp6FuuQIRkpO7VK3VEx2QWJfCtmTEXDbPJh0pS7D0MfOwi+RrBKFH2HTf6d0MjX
 AapklKy4jHONw0ZLNeUFmxatt4FMEdRmg2YRf6WYnAw1B/iGmdfUivT0hsGXcSqerF+r
 LkzA==
X-Gm-Message-State: AOAM532FXjmISCODsBEJDxT3B2FgyVBeQL1Oi1LEK9612IIrsP26iHkG
 aBQjojsmWzt2pEPk8vb7uhQ=
X-Google-Smtp-Source: ABdhPJydgOU/45ri7toqVvb8GVdWpTxBGy/14uX4uwb3MKKywYOtmAFOl76qvuEMw6EYJbxuNTiK6w==
X-Received: by 2002:a63:1c22:: with SMTP id c34mr18489418pgc.408.1618198998301; 
 Sun, 11 Apr 2021 20:43:18 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id v22sm5387185pff.105.2021.04.11.20.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 20:43:17 -0700 (PDT)
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
Subject: [RFC v4 net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt
 controller
Date: Mon, 12 Apr 2021 11:42:37 +0800
Message-Id: <20210412034237.2473017-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412034237.2473017-1-dqfext@gmail.com>
References: <20210412034237.2473017-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_204319_004793_7F3496F1 
X-CRM114-Status: GOOD (  10.23  )
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
---
RFC v3 -> RFC v4:
- Add #interrupt-cells property.

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
