Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB74BCC6B1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 07:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kNifP+lNRe64+F/AhAXVYl+xl398Z2+g6GcnWg6zy8g=; b=v7jvm28EB1uT472pbcuK7KxD0N
	I06VacwONmhVLMnSnzQ1qnhLVfhohmPU2QcDD339zRqQdpl1xf/OcRviqeQOkI8da1R1n1Ow7JKv8
	vlVhalBVYlGeBe/TT5pdb57T0+Rgqbq5i2FvboUSuVoph/pdnz6cPor1VEcNRbwDWuKtBPUFeu67c
	6nmNrNR1zE2WHV7p+F0JDIQnvUeW7edjAB2Dzw6NvURIpIZV2dUoS8XGm3+F/lI8Cxdai8qwafaJ/
	rs1KDjUc5jvehWjcrDwPZ1NdLsop3yvKFt2H5r1gJ8hasRK+IfCjTHMYmlJ/lcNFVDSI8HIUZJXce
	ht4QdubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFR-0000000EhyB-2iN3;
	Wed, 14 Oct 2026 07:18:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFO-0000000Ehtg-2E9r
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 07:18:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so7684775e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 00:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962276; x=1792567076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNifP+lNRe64+F/AhAXVYl+xl398Z2+g6GcnWg6zy8g=;
        b=hXzG3EQPcuugvejCcPoktYF46LR+gCWSY6MnP3pmuMxZK0wxYSheHUEtbzRrw22F36
         yAIbckvFpKXbPZOknzKQj7TNgKtv64yhK8yswkpXv1vTh7lg68YxIJdF+vYJDgWDbM7A
         Q+DPdV3w1XwP30uG9VBzDH1zuAwSpfZOL26yi4uOhC76pC+S/CSsBGc8V/pKtehIZanj
         Io62kDfFGJM+R6tVODx48tYV5ICHxt3vGpEbDMdAbiaIH5A1+auKtnf8C6pTHDO4fm8k
         LTKE22olgCUviGvG6vjvvilKAsyUsDvbVZ3vi0jT3eW+YClGBsU9/KJFkMsH1hCEyW7p
         s5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962276; x=1792567076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kNifP+lNRe64+F/AhAXVYl+xl398Z2+g6GcnWg6zy8g=;
        b=izDB8g++PTF2cIMWL+PAhU+tC+xwvEgs8jnVOEgPBB2GLtEMpaaUlmthFRk10wp2Kd
         AxfIzOG1cbwDjBbcA6ofyPRQYQtMHNHsKiC2uwNQZlG0ZOXBfTrYOWzrG6wESxsUASe/
         rs6vpcqNrm7iQzsTOSizSok6ypmQDZSBe99264LOfotEFHtmiUimFSgO0fxUE55yqZ10
         UoyuKNlHMurqp9uL6jjiXaL4iMc0y2sjvYK/RqDNkjB23QmQngnQtd1c1sQ1AyYFASl1
         B/rXmBrVVDSwX/VS9JOdxOT8V8gUlJrCDj61Qh1lJYC7ceOFTEykJHhnzcW4GZx192sa
         LiEw==
X-Forwarded-Encrypted: i=1; AKwUvBzDq+PpYKisiSjiEW1KodDUVUWNTJxaLUK0prkSRCXp/JoE9zXbnfQz9BAlujXfFBzMrn8uLRVky455XplmjQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIIUh4fn/yVinh43bMCHfzlATwKnxbS1fzkGoUR4Myng7Q23u/3
	PnZj3B7sTpngistZ/Qo7Lkr5wMb9sbz31Ku8oSqt9Ae5t6jPFBAyZ4nw
X-Gm-Gg: AYBFou38f/dF1pPSqzTScShj9DgYbastQexVBWAlFqlh+Ad2nlHY9NO14viV8suSJ6J
	jMtonPGMjEurBXFCmAuM/h1XvMF8U2pdMBfMzfu44PtZzNOUem8KeEYit804Psu6jwp74ufgwwP
	wtsVs4ih5ghuXY0+D9yI6jHZkQUcVBkeeSGn07Z/t40gUARH5QBKUEfovZ12KjnGN4azLiu7/NY
	Ybq9Ct3SO7K/ZpJkFlXlxYfxFs/4hJ3jCSWNsepHY5XicMzthLYjEOA2Li1sHIYEfu43qh5fmwV
	Y2AcsWIdwu5/hS5SYautv2qDDn5lWhZ/6p3rW0CzOr6B+1ezoPQDxlnF1mwKoUolJBju89lq0A/
	URDMXCKDm5/tmWc/RXn8HJpoMd5fE5uylPQS3Vv7WgViFI1HujHHMYAJrlthd8qvwwLXTxLnjF/
	QJGcNjC8QzE72MOS2nZabZJzOoGCRl4I9OnAVJybsCwfIDzgpYIIawLH3w5b5LkKFSWBUZCU0Tm
	ycwq42qJGM/+SiUAmQ3tXzbelt58wyxLhkBF/QBNIbZySx8dgl/VJmGyzxPIh6PlgBKRf00pL6G
	ilKg8oguMdbFkmGpAYMaWQ==
X-Received: by 2002:a05:600c:524a:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-4a18e4a4f2amr296146185e9.6.1791962276389;
        Wed, 14 Oct 2026 00:17:56 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1b35d64e4sm18756285e9.0.2026.10.14.00.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:17:54 -0700 (PDT)
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
	Ahmed Naseef <naseefkm@gmail.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 0/6] net: phy: mediatek: calibration for AN7581/3
Date: Wed, 14 Oct 2026 09:17:31 +0200
Message-ID: <20261014071739.216345-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_001758_592253_C671BB7F 
X-CRM114-Status: GOOD (  15.04  )
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
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1851 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  553 +------
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  377 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 8 files changed, 2365 insertions(+), 536 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.55.0


