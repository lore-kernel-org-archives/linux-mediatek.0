Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1920C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ULPXPFiSOdZmCJgGf8LxNKIrP883dRhcYk2KSZlt2Y=; b=VDHgvaxzKCL46RdRZH7DtaxGTG
	cajm/RIiVW0JLnxVdiu/WXFF4eZwGCz3gcklGGCjHgrNDTNAxh1OVtWYos9vrwSiVIfLtmCV6/Vk3
	S7nRQ3VP8v7AOIYf+iQMhJ0NuT8JKARtPnOfaz6P8UFFdKJJ+UootzbMGsSwRNrAcrWGTbUeil0mn
	BWtF4dTKhx/cBTgRNWJmdFDzjG3Ym720Dyv44qp1fOXjYVAzrOp8iiYZMQWtM6rd5JQpwve0MXp18
	AFbEALFdMdZ9lhee3x8bV7EOL2WORhRtYcKMDyy9iXgLHpPP70MWOVaVZgFk3Il8zF0ly/FR3D6f8
	qzlK4j2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRZ-0000000Gsx9-49cg;
	Wed, 08 Jul 2026 10:23:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPRX-0000000Gsuq-0N8S
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 10:23:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-474560436c3so467147f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 03:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783506229; x=1784111029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ULPXPFiSOdZmCJgGf8LxNKIrP883dRhcYk2KSZlt2Y=;
        b=kh8fuHzXlOvNKl5AIgI9jO1PWspT2PGJF4y88W3qmSBFctWPsiRTzJIv8yhvfv570F
         eFyYNUJrApozuTAmegQDMUG4UhGthTur0NwZC6hSYctcq4ZsVLoGGfz3AGTIpuqFCp9p
         B9fq9C+dlLwJuVSAgeMsVEKp3uQI0gpEmOQQSxdQbHZe6dnQmnVJHw8r737Q6mifMT29
         dYYj3k1xeStySz8Wp/UNppuPcNSZDalG2hHPnqTFCCdw3uJznmIXBi6evhRGFxXEqmgw
         oLvkJpfV7CKkOJsg6XBIK0jnkMyH588dKcccAcAETI7Riyev7TYpapFq3PUIOm3f3mr1
         HmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783506229; x=1784111029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+ULPXPFiSOdZmCJgGf8LxNKIrP883dRhcYk2KSZlt2Y=;
        b=N7mFXny6dsUzlFannvT5l84ckcnjDUumENiTkiU/Gnuohdw9S+kSBjuMDOqoFGkgs0
         Z9no1zdZnlM3oVH6dZ0Oy2vY8elr40lreOBGioyIM2xOZXEPCxfRjjtdPkQy9ke+5jPR
         6QrdVAKlvhjxF3K/CLLiEWbZIgsD7FCUYLc9pMueSzzz9AbfSJh1fHhrUJltj5SHSCUe
         BZfoTuBsbjAJutm16XqwhwRAGgbxtLX05XbQeq2FtaZ8djr45eHY8ITxrSysQGlfg09Q
         eOqQCZO2vYjWRMnuuC0myftANmvuqF4SM4xhA6Bl1kM+zzChbjzfuHQWn6JvAIQFeOej
         iy0A==
X-Forwarded-Encrypted: i=1; AHgh+Rr5CkgLqcuNyGHbakeUpusP4BNDtr5TKaJKP2ZeerGEerqbjhHymULjqKXn7y7T6ENTkiBuxF5ybLhNxrR3Sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YznMFpCG4KxnB4EEJUI75WwO4BA4DTr0bpcPExIc3/WN+A17Hor
	VE5zOIkv4z2+Erokr3sqcuktIrC3Kyum706W0urZC4Ctbf9biliG0Bs2
X-Gm-Gg: AfdE7cmg2ICC+rpN/Av5Wzoat7xpf0cRZoSE2TjPuxq46UGVc7wUdmkUi05d+qy596k
	big6BazvhrrYmI3WCbpQ+vhUtAyFCsgM6LKI06ohZaeAVF76nyuSImkh5WHx6Xbcba1apKugbZq
	O5HJ/OP2/Vq6DQYdeOhdVAqSjB8Pu/VwMrb0T4EB2aa00NyBlJ9RfCnH7bAeVw3qQB8twcfFnMC
	65L6PQe9bDyOTxn7Pf9CP2pols+p12vB/wIgwtTjD/SydjeELQRBmzzzM8xRaLwLxjwLZQWNRnL
	rE/qfqFyemw8jxPoXEZWWVk0kCP/U7da+52uNbqB/FUsnPo3dQvM7g2BEQCklNbRuoM0ojW0rmO
	uP+U3NdPmH8uVGfNi1OYckO77zIguyb9EEarP2FKsHwBQvtaZOikyT9S6mwApT7iB+o1IaUzNWv
	WLhQFQYYvd4nsOdijNpZweXXNiSjD1LskUvagHW+WQ2VD8wGhkF0gfX+kPhJq9f+Z/JoUje0kAR
	8jVmaFO
X-Received: by 2002:a05:6000:2481:b0:475:f0d1:eb5a with SMTP id ffacd0b85a97d-47df07b9659mr2019348f8f.53.1783506228883;
        Wed, 08 Jul 2026 03:23:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f2186bsm40660248f8f.36.2026.07.08.03.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:23:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next 0/5] net: phy: mediatek: calibration for AN7581/3
Date: Wed,  8 Jul 2026 12:23:26 +0200
Message-ID: <20260708102341.53919-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_032351_171260_443432CD 
X-CRM114-Status: GOOD (  14.93  )
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

This small series adds calibration support for Airoha AN7581 and
AN7583 integrated PHYs.

The calibration logic is quite big so I decided to split
the driver from the mediatek one to keep things organized.

Minor change were needed and just additional symbol to use what
is common between mediatek and airoha PHYs.

I followed the naming pattern of mtk by calling the new source
airoha-ge-soc and related config.

The calibration use lots of static table and software calibration
at runtime instead of using efuse to calibrate.

There is one pecularity where some register and calibration needs
to be done on port0 first and then with the related port.

This is O.K. as port0 presence is mandatory for the functionality
of the integrated switch and it's assumed to be always present
on the MDIO bus.

MAINTAINERS is updated to reflect the changed code.

(this was tested from a long time and also verified by Airoha for
correct order of calibration)

Christian Marangi (5):
  net: phy: mediatek: export __mtk_tr_write
  net: phy: mediatek: move MTK GE SoC registers define to dedicated
    header
  net: phy: mediatek: split Airoha code to dedicated source
  net: phy: mediatek: add calibration logic for AN7581
  net: phy: mediatek: add calibration logic for AN7583

 MAINTAINERS                              |    9 +
 drivers/net/phy/mediatek/Kconfig         |   16 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1812 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  517 +-----
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  364 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 8 files changed, 2311 insertions(+), 500 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.53.0


