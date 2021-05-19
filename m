Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC6FC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:32:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A75661261
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 03:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A75661261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EZ3Ccl5CzlVOKlZpL5UfhYcq9USG/gpfDsu9p9Y3PpY=; b=C76rJqCu171OsDUycgpeH26T1T
	p8xdiG30Lp9r4YpT7nIULaCKtycrVSdGOdsxqtsA1aVUhGJlZN4BShpWPg7UOyxZHSSIupZIAf4pD
	akgMhfvbTcQxXcsgq4r6osGadlYhyC6T/7L5348q0unBY5EcJN0zsdkyW3nbUvo4O7UELh0acEBEM
	T7gl9NWfakdD1B2Pt+AldJbsIIclWGkZ5cWD8GHypZ/lstMkUGrdJfEBbayRVoiqhR/7N6rKz2NIT
	MT3eNdk1vsjfbt9J3nL9Agwi/digi+Lt9BZasGLA+6YDSyf7nlhUOqoYJOwG/UJAIxNjWEmkqt4ov
	gn0GWrJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljCwX-002ain-SU; Wed, 19 May 2021 03:32:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljCwU-002aiS-Lt
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 03:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=7wVF+iyY+kYlSNZc2QC2Z8VNfrjdof9DM0HbDZzRDL4=; b=d2DAo0RBmSx1CALhznm0O9/mTl
 LumX5m2yxy3+mkONHaJpIpVd3smsbjLmRGsMGh9M5egowfo4c9icveu2uoP98u2IL36aj+Tf7X7Lh
 2J0W7mny80rILUaHMu8fQWPPgfQhd4haukX/fOlrsdGsPp0p1FKJtZY5ikHf9CX+Fc/KKbzdWEOou
 GMhd1PRN7Rph66LMmzsK+THj1Rz+4klbVH+t79qqHDyl1PXwmvq2SP4g1gm/LiJiSOI/2TPW1W1hR
 p1+qmPlDxDL/BjrrUFK6/Pb6KTBSnTB4RPZOod6IbRWEy49KMPb8gGvMqdZpzWFcFyJeSiY6bEBKj
 rPaKO14w==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljCwS-00F5Xn-2R
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 03:32:17 +0000
Received: by mail-pf1-x42d.google.com with SMTP id q2so8901291pfh.13
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 20:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7wVF+iyY+kYlSNZc2QC2Z8VNfrjdof9DM0HbDZzRDL4=;
 b=aOyqJAKwmvsZyYiDlUgzeEe/3RU9eb2s4NxJULYlSTuRDmMUpja71h7HaBZCys3UiM
 CvuNuAGePQq3xt4HR/9abBde1nJuD7GVHZ0HsUIHFzUfsdVBypZd4eN9GUlbUBPK2eJK
 UxUw9pum7YIYqf3WsRXFz6NaOOhSEVU3+HDZvqBUtrK5DXb/ZQjuY89L1vy0EBFk/U4b
 aqwAzsRpM09sWwCVZneSlmxH3LJTbl9P261eXTjbD6YI23EMXIV87n7w1ocOywVo8nhU
 l2Va1mQuBjm5T4HlTs7PLEegs06/FyFPV3BfxpCdgZ+sOsVxstOMRHAmPxINpfe89zJk
 wDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7wVF+iyY+kYlSNZc2QC2Z8VNfrjdof9DM0HbDZzRDL4=;
 b=GVwM66gXVzag/LA2icerP7Rpwqb2nnF8Pdnm5DnNVjfnW5C8hnuyfsCsPRTSx+Bypl
 +4rVueqarAUYhWfkdVC2N5ZfWh3IMVi/b5HoeYw4XvzSvTieBzPMJyXZDhgMaRCY3Kn4
 DWpT88E5qBkMIfqLjKMKEgxrDNsn7BgWsO54Z7ptsUXUnpy23eZln8H0gZIgujvnAzs8
 7tSnnLLhnz5WUYU+250g6FjSh/4NxXdCCmU+G3KkkJ4PZ6oFkSbRF+g0bFgCBmiYgN3F
 xVIxTskcEJWT9+308pttFtlJuc2PEjm818KENqQ4WU4AjtuqQRrvh/NrRvAJLDjojZ6i
 nh1w==
X-Gm-Message-State: AOAM530l5NtoGQBESq3EvfwS0gjOfn2aFDiUGT+wnEC6N/82OeMYNg2M
 G1cHXNPZkzAT5zaTF57EpbI=
X-Google-Smtp-Source: ABdhPJzL5kZiNFGM+U3ygMPBbAYn/1cVFHYVTB5yxRM5MpHnBFLDvopgXYW7dJID7qZzvU4Ng4kDrQ==
X-Received: by 2002:aa7:8207:0:b029:251:20c1:1861 with SMTP id
 k7-20020aa782070000b029025120c11861mr8476632pfi.13.1621395134400; 
 Tue, 18 May 2021 20:32:14 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g13sm8244587pfr.75.2021.05.18.20.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 20:32:13 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/4] MT7530 interrupt support
Date: Wed, 19 May 2021 11:31:58 +0800
Message-Id: <20210519033202.3245667-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_203216_130644_32530D20 
X-CRM114-Status: GOOD (  11.15  )
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
  net: phy: add MediaTek Gigabit Ethernet PHY driver
  net: dsa: mt7530: add interrupt support
  dt-bindings: net: dsa: add MT7530 interrupt controller binding
  staging: mt7621-dts: enable MT7530 interrupt controller

 .../devicetree/bindings/net/dsa/mt7530.txt    |   6 +
 drivers/net/dsa/mt7530.c                      | 264 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  20 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek-ge.c                 | 112 ++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   4 +
 7 files changed, 384 insertions(+), 28 deletions(-)
 create mode 100644 drivers/net/phy/mediatek-ge.c

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
