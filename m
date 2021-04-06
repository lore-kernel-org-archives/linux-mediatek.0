Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88B9C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 14:18:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A89561382
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 14:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A89561382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qi1fbyQanHuKt9fjK6qEfPwMOccfQzXApWiHgCPC5Hc=; b=O70W70gj5KxbHCi101YlvrCHyg
	3m6+4DKTNcSXJfgSVFlWZwPqpaGTRz3JzJkt3f0edeinw+sMGds2AL+WAkETYaA2DUaugoac0BfvC
	9blDEnENfDpBGNhsf8ko6DQaUBYRedAgt+u61rgGoSWYLJx4lymKdBn8vLTDmkUPMX9RmP1BgMEjn
	cO/zXIJeyfEjOZLozp68XmDodIH23oFSr7swdMwi0jvgCitslRq8IFT7cjGS3nZqVFaveHI+MWGu1
	qendGlXeZOrSzKOnzfwSy2m5dLzhbauvJb1aD1vt/7gnETnwVAXk1sD9FxkjqyRjix9iPlCij8Rfj
	l0SNX37g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTmXL-002or6-7b; Tue, 06 Apr 2021 14:18:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTmXH-002oqj-Dj
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 14:18:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id t20so7562250plr.13
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 07:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHeyYOhTyr/Pj14dswoKpegMv2vJUh025+BN2sVtXu8=;
 b=RtwbzxaLtNZ0nmdC4WJ/Cx9sZwXO1DHJ8WqQYOxbxvHGlQneXoT8hZHtjuYkmAPLAn
 +6JTWU6Ws84uztBHt7NYBcbVcXDde3Fj5zcCJ5ssBJQDm9xUC4IaYY0HcCH+8YFW/sDo
 4mu6CsmLrotTPSTK9y77uxPSMmLcL3qJBaJhRafv9kEsBXP62g+trAQjsOGilTI0c00Y
 zQmg6e8jMR4cMxkGHgs4R7BFQA+O035RKOVNLgcCWxHlWwMBKQRC3FavgUGBJ8WpE974
 ui3F38lBrgyaZ5tDeXKuR/6umDgfaSsfj+ifEIs2c1ddA3B9/Z4FrDCcvKIa7ONX2wu2
 dJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oHeyYOhTyr/Pj14dswoKpegMv2vJUh025+BN2sVtXu8=;
 b=a6AAuUZe/3v3lw2Nqx7kCPfnLfZprbNeQdNT8HskLxIVjePGH2twpYLD7HCuQjt3wV
 l30/KIGc/EeODj++tjHs099j1gXEcmTM9MbLJCsvmqef48ZqpsUn65XZOCtGy/73bDpv
 HphERaIv7OW3BMFpSBIdxKLJUgJ+aLloFptHHeAkcNMDKxXTykdBunH01oPI+M0Qb6oi
 4EywV7W+HFwfzd2PmLo5DTux5V+r1ISQ2ah8ns64Ewik/NpVdzrIV+DIC4GtBdzgpn6s
 UJ9tu3mvtvlMV8FXMxHNxjIEphGNsKcadLPxKdCiTqzq+pBFoc5U2kDtS/AvHhLH3Yr0
 INYQ==
X-Gm-Message-State: AOAM5324cPXZqkUvD59nLaoiIa6NVSnY1JNGjIK/vJik+MfvrMfsvq8P
 C/QkWcqhhV6brmBYL97HTM6RlwxRc5Z+sNb5
X-Google-Smtp-Source: ABdhPJycUf08xH7qOZt9syoGWZKCK/ZFzVK3LiVHhby8ua9De8vgDPchYrwqPZAbqEJIvB6LOhGhgw==
X-Received: by 2002:a17:90a:314:: with SMTP id 20mr4735746pje.72.1617718709461; 
 Tue, 06 Apr 2021 07:18:29 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id u1sm18337581pgg.11.2021.04.06.07.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 07:18:28 -0700 (PDT)
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
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [RFC net-next 0/4] MT7530 interrupt support
Date: Tue,  6 Apr 2021 22:18:15 +0800
Message-Id: <20210406141819.1025864-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_151831_534138_713D4E57 
X-CRM114-Status: UNSURE (   9.77  )
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

Add support for MT7530 interrupt controller.

DENG Qingfang (4):
  net: phy: add MediaTek PHY driver
  net: dsa: mt7530: add interrupt support
  dt-bindings: net: dsa: add MT7530 interrupt controller binding
  staging: mt7621-dts: enable MT7530 interrupt controller

 .../devicetree/bindings/net/dsa/mt7530.txt    |   5 +
 drivers/net/dsa/mt7530.c                      | 203 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  18 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek.c                    | 109 ++++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   3 +
 7 files changed, 323 insertions(+), 21 deletions(-)
 create mode 100644 drivers/net/phy/mediatek.c

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
