Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBFAC48BC4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Feb 2024 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FoNJd93UYhml9Ujt4XegNPtQpjqvmz00PoAt/mJ9soA=; b=mIzlAf/l4kJdfZISeEe0Cwco0r
	sPY0klv8S2BX/wuiDF7ZsJxfcHx+n56icJjPgyOzabsssdFOqv04/aZirj82Jjsobtx127VJnrWQA
	Hq8xuVIyjKq0pIrY9JunWS8p4Y9gx3KLzTiC38nwBbPDcw4jyDrWJPnmMbtZ9migRqKia+euJrtoS
	0QsOF/TbWAQR1Y+Jn5cu3VEVuorrjHaNvUHmp2iVReEsJ31sTJjePWXFvsXZHT3hRdD866cqx0aAI
	4im5YF+LV1VuxQqtC0+NC54hDg1UwO19a81kLNVLEoQjfT+Wk7MCCAGrQw1NlwRfyvrYRS8PZ2zoV
	t7awNJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbQZ6-00000006Fh8-1E31;
	Sat, 17 Feb 2024 19:41:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbQZ0-00000006FfS-2OHg;
	Sat, 17 Feb 2024 19:41:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-33d3f0ed7b5so13278f8f.0;
        Sat, 17 Feb 2024 11:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708198889; x=1708803689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FoNJd93UYhml9Ujt4XegNPtQpjqvmz00PoAt/mJ9soA=;
        b=ecZ/HZtn3ql5l6u41X4TV+jPWzCNyb/4bxsiC/g89rag/1mfKQBFLfbucqQu6p1SJ5
         tPtfihpgyrbXXM5+ii3/bJdtIW8QyFs5qnwklbPt88EFAYMTAcuExcdq6BkRGkp6U4ki
         A+0L+7ha+qNL5tD3+5j2DZdDRP8FlOmOJTu8gM2XSiBsFSJ2b+c7MuTbyixkAcH15bbN
         y9KRno2lcjqhV0PIb1+YTs/2a5Yt9hoMhNHmgvQGLSsd+dND+1gdHW/Tq6ISN/FknKUF
         6rj8xVIeLRMJqttQYXcqFIxfAjOOqdCQqjk+TWb/IgzOSZJ+55LLWomN5LX7hONWijJH
         CFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708198889; x=1708803689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FoNJd93UYhml9Ujt4XegNPtQpjqvmz00PoAt/mJ9soA=;
        b=wwVsorqozchIFoPaXPUxPb4OvwziTSnRQiJjVA9GWhZvQQEm4gy7ThjulFlNwGT3+0
         nUHI5oAWdaGezwhQe7vzsL3c6I+yYlVScqSlnqDlCworpk1ej2sEyO6MZAcEAp7/4KHO
         /Iu6XXuf51loZqYNhyxASEpvklKLzIB/xMSZIBJq4ShDopn6Hyqyn1rtuB/xr2Pa6HcW
         mB5/wgFzkMnzk52Krk3AgwCI6mzkJlDJhlGliECktkt+Ty2w841Lp7F6vzMWxwWzkxUt
         pkZ6LLD0f3irbBQ7Q2MQhPM6sFvn6bDoB3c51k+Q86ZHLyDZdR+3JtisLuqT97Kxfiho
         MAbw==
X-Forwarded-Encrypted: i=1; AJvYcCVGPURYXVx0VtxyT9CLHyrT2zlwdTe/7SYqfGkvyeTqGGSAuEh7CATz+6N7WYWGGrC5iZynP9rfh3mVKgkFVTrsZvHHCclFOCv+4ew9LAlheH7gy9jR3G4KGQKdEEDrIuYZGUw6eT0znxvs654D44Z6jvBYtTG6ysyItSRFj8XDiotiVVy69cO38fNdKdkSvQAEaKnMBsdGGSqHvPVZ9l6KpIjTBxLOBkUtGlEAJdz/tpB334q4p6HJT6J0NIoW9g==
X-Gm-Message-State: AOJu0YwsbplUDDQJNGHK2GaVkKWevemSViIGkXFXCRqfABw5j5Qs5e+n
	niEEHhoGbaxPO6/4GIdWjfQsXUoh8jR4cVoJc2ijxTObIn8tflo6
X-Google-Smtp-Source: AGHT+IEMhpVotyrQM8FDDo2tYf/RWQ1+Gqe/hReAQZwCqW+WAIvjwxMBlc9fE/sBf+dXkJMnsRz3oA==
X-Received: by 2002:adf:fe46:0:b0:33d:29c1:c28c with SMTP id m6-20020adffe46000000b0033d29c1c28cmr1969393wrs.66.1708198888366;
        Sat, 17 Feb 2024 11:41:28 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id b10-20020a5d40ca000000b0033ceca3a3dbsm5661169wrq.2.2024.02.17.11.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 11:41:27 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Hennerich <michael.hennerich@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Richard Cochran <richardcochran@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Peter Geis <pgwipeout@gmail.com>,
	Frank <Frank.Sae@motor-comm.com>,
	Xu Liang <lxu@maxlinear.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Andrei Botila <andrei.botila@oss.nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robimarko@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 0/3] net: phy: detach PHY driver OPs from phy_driver struct
Date: Sat, 17 Feb 2024 20:41:11 +0100
Message-ID: <20240217194116.8565-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_114130_637239_CB5B737A 
X-CRM114-Status: GOOD (  16.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Posting as RFC due to the massive change to a fundamental struct.

While adding some PHY ID for Aquantia, I notice that there is a
big problem with duplicating OPs with each PHY.

The original idea to prevent this was to use mask on the PHY ID
and identify PHY Family. Problem is that OEM started to use all
kind of PHY ID and this is not doable, hence for PHY that have
the same OPs, we have to duplicate all of them.

This is present in Aquantia PHY, but is much more present in
other PHY, especially in the BCM7XXX where they use a big macro
for common PHYs.

To reduce patch delta, I added the additional variable without
adding tabs as this would have resulted in a massive patch.
Also to have patch bisectable, this change has to be in one go
hence I had to use this trick to reduce patch delta.

Other solution to this problem were to introduce additional
variables to phy_driver struct but that would have resulted
in having 2 different way to do the same thing and that is not O.K.

I took care to compile-test all the PHY, only exception is the unique
RUST driver, where I still have to learn that funny language and
I didn't had time to update it, so that is the only driver that
I think require some fixup.

I posted 2 example that would benefits from this change, but I can
find much more in other PHY driver.

Christian Marangi (3):
  net: phy: detach PHY driver OPs from phy_driver struct
  net: phy: aquantia: use common OPs for PHYs where possible
  net: phy: bcm7xxx: use common OPs for PHYs where possible

 drivers/net/phy/adin.c                   |   4 +
 drivers/net/phy/adin1100.c               |   2 +
 drivers/net/phy/amd.c                    |   4 +
 drivers/net/phy/aquantia/aquantia_main.c | 189 +++++++++--------------
 drivers/net/phy/ax88796b.c               |   6 +
 drivers/net/phy/bcm-cygnus.c             |   4 +
 drivers/net/phy/bcm54140.c               |   2 +
 drivers/net/phy/bcm63xx.c                |   4 +
 drivers/net/phy/bcm7xxx.c                |  72 +++++----
 drivers/net/phy/bcm84881.c               |   2 +
 drivers/net/phy/bcm87xx.c                |   4 +
 drivers/net/phy/broadcom.c               |  42 +++++
 drivers/net/phy/cicada.c                 |   4 +
 drivers/net/phy/cortina.c                |   2 +
 drivers/net/phy/davicom.c                |   8 +
 drivers/net/phy/dp83640.c                |   2 +
 drivers/net/phy/dp83822.c                |   8 +-
 drivers/net/phy/dp83848.c                |   2 +
 drivers/net/phy/dp83867.c                |   2 +
 drivers/net/phy/dp83869.c                |   2 +
 drivers/net/phy/dp83tc811.c              |   2 +
 drivers/net/phy/dp83td510.c              |   2 +
 drivers/net/phy/dp83tg720.c              |   2 +
 drivers/net/phy/et1011c.c                |   2 +
 drivers/net/phy/icplus.c                 |   8 +
 drivers/net/phy/intel-xway.c             |  20 +++
 drivers/net/phy/lxt.c                    |   8 +
 drivers/net/phy/marvell-88q2xxx.c        |   2 +
 drivers/net/phy/marvell-88x2222.c        |   2 +
 drivers/net/phy/marvell.c                |  44 +++++-
 drivers/net/phy/marvell10g.c             |  16 +-
 drivers/net/phy/mediatek-ge-soc.c        |   4 +
 drivers/net/phy/mediatek-ge.c            |   4 +
 drivers/net/phy/meson-gxl.c              |   4 +
 drivers/net/phy/micrel.c                 |  54 ++++++-
 drivers/net/phy/microchip.c              |   2 +
 drivers/net/phy/microchip_t1.c           |   4 +
 drivers/net/phy/microchip_t1s.c          |   4 +
 drivers/net/phy/motorcomm.c              |   8 +
 drivers/net/phy/mscc/mscc_main.c         |  30 ++++
 drivers/net/phy/mxl-gpy.c                |  24 +++
 drivers/net/phy/national.c               |   2 +
 drivers/net/phy/ncn26000.c               |   2 +
 drivers/net/phy/nxp-c45-tja11xx.c        |   8 +-
 drivers/net/phy/nxp-cbtx.c               |   2 +
 drivers/net/phy/nxp-tja11xx.c            |  16 +-
 drivers/net/phy/phy-c45.c                |   2 +
 drivers/net/phy/phy-core.c               |  18 ++-
 drivers/net/phy/phy.c                    |  85 +++++-----
 drivers/net/phy/phy_device.c             |  79 +++++-----
 drivers/net/phy/qcom/at803x.c            |  18 ++-
 drivers/net/phy/qcom/qca807x.c           |   4 +
 drivers/net/phy/qcom/qca808x.c           |   2 +
 drivers/net/phy/qcom/qca83xx.c           |  12 +-
 drivers/net/phy/qsemi.c                  |   2 +
 drivers/net/phy/realtek.c                |  46 +++++-
 drivers/net/phy/rockchip.c               |   2 +
 drivers/net/phy/smsc.c                   |  14 ++
 drivers/net/phy/ste10Xp.c                |   4 +
 drivers/net/phy/teranetics.c             |   2 +
 drivers/net/phy/uPD60620.c               |   2 +
 drivers/net/phy/vitesse.c                |  22 +++
 drivers/net/phy/xilinx_gmii2rgmii.c      |  16 +-
 include/linux/phy.h                      |  57 ++++---
 64 files changed, 737 insertions(+), 291 deletions(-)

-- 
2.43.0


