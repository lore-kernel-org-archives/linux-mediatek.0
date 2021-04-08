Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDE0C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 12:39:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2493610CF
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 12:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2493610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vEurdmyNomAn5T8cIfzryN7DIa5lu/h9d560aqz0Nds=; b=mKWpUvoTqn/7SSZRKmkKJxpJD/
	xhjWz71pXTgT/bIm08BMXsJhiGhioBnixFKW7KkXU3JfaAUz2qhrben8z38mprSClD/5Ws+L5Et56
	u/mGJ4O8rB9D1mjnrDwk2vxpFFEFoozww2oCD5/9wUDC66FLuktgPn0MTcvidbKnY7cHfDLzVOoYK
	y+nkgflrbjH2+HSWjPoWywrmag2NvtZdC5/os0O35ecwIfJN/JHc8G5D8JOVvSHmGuqCNs9rCmXyn
	WLg4aXQjNm82eU5pbf0Z4mI/jqqw+jIWTGusmmkkoyUKf/NTCRbt480XUvYrsn9P79TrDs/hdQetl
	rCmRjiww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUTwg-0081Tg-7q; Thu, 08 Apr 2021 12:39:38 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUTwa-0081T8-AW
 for linux-mediatek@lists.infradead.org; Thu, 08 Apr 2021 12:39:34 +0000
Received: by mail-pg1-x534.google.com with SMTP id y32so1302542pga.11
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Apr 2021 05:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+QmHxLtSKiy/M0k5RFjpXgoAxgaENLbGHZnwkZzXYD4=;
 b=eVFhWLUE7G9oQNgyvcq6kKZy8Vl0StafOcaJBTHm6NaU/B30SGmjqkSHvRpMnEu3yZ
 UFHsRB3n8VQGSK/aa3BhgFfHtwF7f6hP26FYUMstC5KPoD2P+kCxmkJTcKo7WGmNl6Zt
 j/X9WOK1TqTiiBXkcw77pZy1OmzhtK63xj06TQt5iG8jfk3cTiyy0ZCDWVkoFdSSdXDG
 uUJLVtsVKwiG9vZMhh0TNL3VmyamyrNivv/crV/eLcNX4zVeIBulNP9q5N4aBCzTGH9z
 OhCLm4GCv9pNLqNkLY9CjiyiYioQdOEoT7pIJM/iUCWYqagTEUnNE+KQ5ByHdWP9BLaU
 EhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+QmHxLtSKiy/M0k5RFjpXgoAxgaENLbGHZnwkZzXYD4=;
 b=Mf3PVDDUdHOSqCoC+w5kmPNJVwQYn9SMWyCzqt1omX3u/sc7+nPaE81RfPwyiGRavG
 SSnMWVnsdD3HNp6irRL/ok8D3LBePI+8jqFMSjUVfEMKAu34cr7D0/k0Gfgx1Y7S/DQd
 gbflvP3N940fCFcxgEyVPVHVzYtXtavbnP3EhyPOwa2LROlMJfvjbhkZVMlFMwFyktBK
 8BVripW5+Zd70ysr01/uiujab3sCaKHGoaNJEK9q+wkRGQubz1bb5e5zOtfOx3m7DjP8
 Bud5zBR9LqTDjvvvp9WD9iG2vZh77+0ukagl4WhL1gKvIHc+GmvgPQtkwJQ0Nq8O1er+
 MB5A==
X-Gm-Message-State: AOAM532Ck9oQ2mtQiehmxhfPEnEmK6bJjcr8whtiN/53sbKSe2kbAZFF
 UYuv2L4m/mwEblklrjQHvqA=
X-Google-Smtp-Source: ABdhPJw7NzYVa2g9FhYvGUl4llk+/2n6jSAK9mJ0yj0DoybhePdFaNz3OQqsQtplw3NZrugrjc2Azw==
X-Received: by 2002:a63:d945:: with SMTP id e5mr7632086pgj.449.1617885570300; 
 Thu, 08 Apr 2021 05:39:30 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id e65sm25831311pfe.9.2021.04.08.05.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 05:39:29 -0700 (PDT)
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
Subject: [RFC v3 net-next 0/4] MT7530 interrupt support
Date: Thu,  8 Apr 2021 20:39:15 +0800
Message-Id: <20210408123919.2528516-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_133932_497646_85C9EC1A 
X-CRM114-Status: GOOD (  10.11  )
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
 drivers/net/dsa/Kconfig                       |   1 +
 drivers/net/dsa/mt7530.c                      | 266 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  20 +-
 drivers/net/phy/Kconfig                       |   5 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mediatek.c                    | 112 ++++++++
 drivers/staging/mt7621-dts/mt7621.dtsi        |   3 +
 8 files changed, 384 insertions(+), 29 deletions(-)
 create mode 100644 drivers/net/phy/mediatek.c

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
