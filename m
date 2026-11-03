Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E3C606D821
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 22:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mItPDM+m;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCUPRS1Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YkikqgGDTTpfPmNY7tvfFChQYii8/CyTohIduvPVkhY=; b=mItPDM+m8yC4gC41/CQvdNO/R0
	lPQ6V/oR//VjsEMoV0RsPbgVUyK2vA85AKlvZ3ilVmk7NncYRN2tCI9zbTurEkJvyOnzaS8efDodr
	Vz1bb4Pg0dofxWA6IodbKpVonr7XcvJMBpn7uZAWO6Ei8tRJ/XmlyZbWQDS/qhBren8AJoRc0XdC8
	ufzyqdGyC+8aDZ69oBO3VrLhaM8Q+WgmikwUHCEJOpaF8YbwBXA1602iKmugVrFxlZaXSMpaChBqF
	DBoiyoVVe8tYu+lSyd11COWZCor0C5YSleBTbAL2cPN7ztHGExoQIdvHDtjoA2ot96jCQSI7l3C/Z
	3F96yHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmO-00000003oBT-1NWn;
	Tue, 03 Nov 2026 22:14:56 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmK-00000003o93-0iYP
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 22:14:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48b042c0728so13256f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 14:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744090; x=1794348890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkikqgGDTTpfPmNY7tvfFChQYii8/CyTohIduvPVkhY=;
        b=tCUPRS1YvrlMy+rAHaDuw4gUUcu8+RIIv6wQ1gw831H9XB7Hmj989kUcIxM1XasmX8
         KvKDHB13MgrYWMS/Ksh1bjlc9kopwSeSNog4LnysufPCEY9XcE2BDaKK1aHVSfy3mwCr
         WuJs0o29gwVyy4NM/MyQgenv8abNEmRBCTTX7Ht5v+ASCzVwxVWMNtkhaP2UQ86vvktl
         tFHMT2l3DTZ4IGMIreecrNgFl58J8TkvzlJ4bs2/GJMU9/1uub9NbifgXlQaoaBqIpKd
         GdzA2wlELAC3gxIfUQ8S8Xc/MmLWPA1EAZQDfY/CxacKazhIVuqvidFxrKMKtyotPFXB
         JZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744090; x=1794348890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YkikqgGDTTpfPmNY7tvfFChQYii8/CyTohIduvPVkhY=;
        b=ZKbvsGLXL8oMJc333aUJYUGZ8/pPwM4F/kKA+QGbpedDQEJa2plmqmVwvqnxZvAyYk
         v6/8UYK4GXLkHCQjQ1/+n8EGzAoVAyxtsv6diBu+u2M5vO1bUP6N2Z1lvBcNP1koj5gt
         uCUpGfZpMGhuXlA6k/a77yLh4usht+GsN6G1KnAhUiZGepH3afibcbd9UZ8UATZFkhMR
         LH8uhUIN1nhcsugrbId5QSxKA9Hub9qpnAt8ha+UeU1HD2952uYYzmd7dEpiNPGxpKeG
         DvGuIDLpXZMd00HK374nvJZO0AE6uuLDLS2MeaR9tGRCkiWRWLuRcYIdoKo9O+XZh7ZR
         Tt0A==
X-Forwarded-Encrypted: i=1; AKwUvBwVVipNHgqjOyOgGHQq4P+tEBFGrgXNEV49x27eEL4BjVFfTibEzBK2xH4+cTWcq3wRPS43jahotrw28qx6gg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+/z99to9TdqNCh2OVGIH6VJK6GqfjwrRRY5jAQWCYaHvlDCNSU
	/0iGbtJ+R/e/FNlJRLeeNRJGXgmXw7zZ4o1oNXpMmouE9H8tu9u3WGjr
X-Gm-Gg: AYBFou0g1NKJdy7uu8QPgdunqdaO17di4kfx0EtIVFru8CNSBzQUbcPgSyPrf94BSj5
	vj17rlDsioneaUqFZeXMKABLeEXn14ZSy7GEPLWk5BeNF+Gs2Ja2e8Y5IakIVzE6Bf1x6CoI3cn
	VOzh27qKMYUQ6WyN+m3pH0g3WjexDA8Fd8bWqZK2Qj3p3VRVVdrH3126PuEnZK9DiE1HMBrghLj
	4ughyQso/f568iPvXXzrukTia1Qjf2ujrcITfw06BjARWblbCxe3Rh36pxLsFYouDVm5juycJLF
	bWIEmu9qJrcYmZ2mD3jr1N+d/EZ0I7cVmVnZHIrkA+XSAuMeETIC5RA2MRO0Z6nUE/DRPdGaHCY
	TxO/UM+b3XBFKyrH5lWwgWkxz1/Mo4KwcHf5fr9dGeo14ezs+hgvHc9VC33acyl6n1zh0svz1+a
	NzIu25dCIMuUyAvyANFZEusDjoM7y3ChvvLt5o73kfwHBXDJrX/503iHyCSI9KqdkTrp9qV+IEp
	He/GLuxf2O3lDft6+xt8HxoLb9180jnAc8QHoerwKg96fmN65RNla9NVjP+sex9nE3UtvwKOzz6
	npGLFmsORju6h4rFfnTADQm/lLvW5zA5sNXHAGX0SxvA+T1DjpT2wV+5YyABbm//uLjbaTGx5TS
	gFQUtfIPmNdu4WXbmv6RIMHgjgS7YMYHKmA==
X-Received: by 2002:a5d:64e3:0:b0:48d:f876:f370 with SMTP id ffacd0b85a97d-48e6e309763mr30399015f8f.48.1793744090007;
        Tue, 03 Nov 2026 14:14:50 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:49 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 0/6] net: phy: mediatek: calibration for AN7581/3
Date: Tue,  3 Nov 2026 23:14:31 +0100
Message-ID: <20261103221439.30502-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_141452_245392_4E0292B7 
X-CRM114-Status: GOOD (  15.76  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Changes v4:
- Fix typo in Kconfig
- Prevent out-of-bounds for zcal_ctrl
- Protect concurrent rext_sw_calib_done
- Validate port 0 presence for calibration
- Correctly set shared local variable
- Use phy_package_init_once for shared tables
- Better handle early exit restore
- Better handle phy_select_page

Changes v3:
- Address comments from sashiko bot
- Apply review and suggested changes from Airoha
- Rebase on top of net-next

Changes v2:
- Split header register patch from cal_cycle part
- Fix missing EXPORT_SYMBOL_GPL

Christian Marangi (6):
  net: phy: mediatek: export __mtk_tr_write
  net: phy: mediatek: move MTK GE SoC registers define to dedicated
    header
  net: phy: mediatek: generalize cal_cycle function for GE SoC
  net: phy: mediatek: split Airoha code to dedicated source
  net: phy: mediatek: add calibration logic for AN7581
  net: phy: mediatek: add calibration logic for AN7583

 MAINTAINERS                              |    9 +
 drivers/net/phy/mediatek/Kconfig         |   18 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1882 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  553 +------
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  377 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 8 files changed, 2396 insertions(+), 536 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.55.0


