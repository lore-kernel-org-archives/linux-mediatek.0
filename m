Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696AFC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 06:22:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B98EE61446
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 06:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B98EE61446
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zuQGZKtLQfknu+6uBYSCRDd3S0EW3AD4U96ov22erMo=; b=AxO6Bmu43m2iydu4DsABOGJczv
	z3mzcQqbF4mRdIn/B4MFojvygrqKBRfWx+8OsmcZzzSl4DR1eOFHcUA53TicXEDRD3rZZbFdD1qD7
	ve1C8DbX9KQd7y6/0y9jbYcbpAExGc9FHBFJpqJxXwJkj5Cb84lIXA+neWwI5q5lKc8T9OfrcQ1TJ
	+03pATtZcZWpJy9EzHk3AwDSbw7n94mFhNERWRyt7eEGo8//LrXsN3tC5aF2McN+236jKqz2hhQUV
	IkdRzYJqosBeGXiZCm2BnXqQPSPtrFiOwBuidqmkMO9xuwbHRkeo/oVG81pw5hzch7JP5ukOoj8u3
	5kaOBoOA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc03Y-0053Ds-Sn; Thu, 29 Apr 2021 06:21:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc03W-00535D-0a
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 06:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=cSEiNE02KkOTwO/RKhNbgZVSZuIXExN7hZU+pPtcLaA=; b=uCX2PYcm0G5NKbjqyLWeAZ0IVC
 WpisRP9yuD+S51DZXUImt0Bihsp36cDYsKtQfqe7bP74EJUXeJBGbV3BEVRhG9MZomxgSZRSRQa4G
 1iiHIAOlQ5o1B5wiurNzNHUdcq6xxaW4e9w2iU29/iY7ReZmnWMqpY3HzcEKYJAjL4XHccHme36ib
 a7JYyUhiePCL4kBetfOYCGQMOrY+t7LEt5tqq9DzoSU91sOQ2xn+1RrkwsmHBjcy2zE8X7WFJFAWZ
 Qy9zUDsDqARv8bAwWIuZEFBChjRjeiHHuLGtNRHvuzqM0mqHTypnk3RLMcyQk9ny4Y4LiEAfEDSmp
 xc4vKO4w==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc03T-000PCW-Jp
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 06:21:44 +0000
Received: by mail-pf1-x42a.google.com with SMTP id h11so5757357pfn.0
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 23:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cSEiNE02KkOTwO/RKhNbgZVSZuIXExN7hZU+pPtcLaA=;
 b=nbSHE1l3NP5OwYE5EpCU3ThMiKP9NsP7Bywu8FPOZy/Vzh1szBvBOiCkGq0abTdHRm
 OMQYBr1XHVHRpEcHVV9RTUkXRFru5qiZCDHr7hsFf/8U2mSbpbA33gCWUGiQHv4L7Zor
 3D1oINl27NIFDJc4gBBz6XuyFym0FTIgM0fSC+r6dpw/CN+ZGnojk2ObkUjzqKDJJQC4
 ieNpsLMxVPLIjFGSg6XXMSol+kM4D9RdkZS85jszhApH4uPJMF3xe/2+nRuN8y/QdLB/
 Ba8aAkqt5AatUncj+gqkcn6S3l6uyWPaIlkUKYDscyQZjfbsBBsDr4pv4hQ6BLZy7Q4B
 /V2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cSEiNE02KkOTwO/RKhNbgZVSZuIXExN7hZU+pPtcLaA=;
 b=agTpkYi2mzD1iw6pOp3VYY0VSObDToq/iUmWlquNUpf+c4h89yDac1H9TdKrGID1C2
 BfmpT0qW/Rsqlm075AhgW06KiFIyU2XJhsJwqEXlmM5tQcerdIJJZFX5D+D/p3lU6FRi
 nmg3BVkuh0aJrozki7rNK7mDpfLRGYx1wuZSscY0M6EVyNOPFL9vfnfCC4aLSAaVjzi7
 wKyvWLXpPNNXOgCxtGc2R/fp736KTV1dzOYYb/SsXSKZEmtono6tMB9rfKni/2ktpVrZ
 PxCQJEIAZrkxuTGV2Bu1swI6RwHLYBpUWbI627tGYO/TZym8YSPNhR3yl3XzoMY6FNcB
 bSeQ==
X-Gm-Message-State: AOAM533OA4Bscppp8JjJKl6B+s+eBw+WZAfh3bF/AjjNeplweh8JyBO8
 ETY6NwcH96UCAmYy+fvZCHM=
X-Google-Smtp-Source: ABdhPJxCISaXTPCHZ6fvrC28Ztfs6TYBjxQ36OVnc7nf0Q2Y0g2Un2fmRrsDf5JqqBpiA+kSQoYlHQ==
X-Received: by 2002:a05:6a00:1494:b029:278:a4bc:957f with SMTP id
 v20-20020a056a001494b0290278a4bc957fmr15386193pfu.55.1619677301870; 
 Wed, 28 Apr 2021 23:21:41 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id b7sm1431008pfi.42.2021.04.28.23.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 23:21:41 -0700 (PDT)
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
Subject: [PATCH net-next 0/4] MT7530 interrupt support
Date: Thu, 29 Apr 2021 14:21:26 +0800
Message-Id: <20210429062130.29403-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_232143_686163_D9D65869 
X-CRM114-Status: GOOD (  10.10  )
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

 .../devicetree/bindings/net/dsa/mt7530.txt    |   6 +
 drivers/net/dsa/Kconfig                       |   1 +
 drivers/net/dsa/mt7530.c                      | 264 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  20 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek.c                    | 112 ++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   4 +
 8 files changed, 385 insertions(+), 28 deletions(-)
 create mode 100644 drivers/net/phy/mediatek.c

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
