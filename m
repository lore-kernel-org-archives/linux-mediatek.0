Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEFAC79F82
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 23:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1s3LaP7Jy4m4cGgbuRjp7GOXlBBFK1CH2OoNIQ1nqo=; b=OZAUT2f6eXqzbp/iRZ9IEb83Up
	pNRaP/9YB1C1pdml9rFwOXrUA1ZdI1UvnOhqIXC0vyVbnN76FCDG2PLqbKvy8Q+Y3YA7KMOpm9rbk
	F/MDkNO/o+Mwf/Ugmd6+GxXzQ1ZQVJ7SDd6intN8hZBD7zHwk+LUrJ5Au8gNFNCzETP34h+cBzhQq
	jYWQGCQa/FOlrQhxpMObNoLWyyX+DdPlI8hqcy8P4di3clwpAd5zA0Z/Y8y3dsJv88vqxhao4QrGB
	3QeXOd8YjzoHPFjrgj4DdXZW0cqRE7ItF+9MFDfncWbadNMLg79IsiOos28UEJx85vIZH7Aj2SJra
	bEnhm/vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dHP-00000003T7v-3t8D;
	Fri, 04 Sep 2026 23:25:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dHL-00000003T75-1T93
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 23:25:06 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47de0093c42so1335327f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 16:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788564300; x=1789169100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1s3LaP7Jy4m4cGgbuRjp7GOXlBBFK1CH2OoNIQ1nqo=;
        b=AGdsyMNZQjeD/tyYXB5mV898atjWZAa4MYexfSbg7pBc94O34tD48cPFpHmCdQ9czm
         VGUkZP2oPvphTswAv31B94joqcpHJOTO7OS3/M/E2cn+LopNrFwQ4BFsWmVNilKALxMU
         1lOzQofjBVi0honcwriUAbkRkBj2D6rk6DwhhZXqY9CPd47499kC32kXBiA9FQRP6Jzd
         +b1N3oc36YO6a87x+tqdoiy5pwY2g7L18Skqa24ZtCWm7aAnYgvkfGdZ6tO+RAzrb28A
         KFYOXRZ50IRnhPRErpWPq2DmKjOGFQoWnb//F4P0wJFHfUSMe0vnnGymaF323XZ3wIyb
         frDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788564300; x=1789169100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K1s3LaP7Jy4m4cGgbuRjp7GOXlBBFK1CH2OoNIQ1nqo=;
        b=kh1eueuKheQdDKn5Xr9ldUgOWHLlJuitq3dez3Oj3oD2abZxDsORngcpl8hepJr1ea
         IlgNV5DD7Ez68ik+r7gpyTJqZ7mtIogyva+srSlrDsbufxqirhWGGV6v2y3eRXwAPSUv
         UDtSU5aVF+ZQ/pVYYOy5spcRIOVirv50oy2kpOl5/RygDKKuI7z1aZj6GK6GC5b6XiIi
         y6MoOFJrd09H9+Z9ruCrQbByhsjuJzAZZbMMDzROvg5JfkdpEr6JTjoCKNSRhaocJFsf
         nHWraW8itqGOvZd2f8WogbzkG+34/Vkwg7KguWyICW+Vbn/ApZY84HfD9Uiss0SGB9mo
         H2mA==
X-Forwarded-Encrypted: i=1; AKwUvBwvWg/JqVS8LFPpHPJjMuxEXOQ03pkGdzYwkj6EJfNGXawnhnhdmEWoPadUrzoi9sMlTzC9u9lbq5PkNQxhpg==@lists.infradead.org
X-Gm-Message-State: AFuF++k2MgihAb57URqpicp3TNjMIIxtItsWVIjDw/eJhQzYVdkrpGle
	Bj2d0l9UYOCG9FpLiQu6RgKkGYqQxTQ80bWXPGNU6Uf8DEJNqcZR9/BRzFBjgeQQZiE=
X-Gm-Gg: AYBFou085RvS/tEgUgofMkHkvTa+yNhm21/C1lHkwvlmBwsTru8BFow5QjT16zgAisW
	CRScPhWvazmG6+kr1MzSaP+FiR8VYNDNBZaiHgyCr7JhqLhgBX52mc7alQhOqXlLyHYWli15u9C
	LF6ambzRP1r028Uu68NP1cuHW76G4yhN8S3J2uhn1/gaxq7u3HUCxGfc6lMM2q8UkgCQPX4forx
	2kYPLbiCZwFq3INfSUgpuc9zQeSEth9pEhGkU3/PZdney4n0NnL0KlzhqCM8s4qC2IcF8Pbyrfc
	I0DS0Zdo5zjExC4hxNjpnPiVl5FEsVSLyqgO8RI1UdeiPDo4gtYoo3n8pbqMS736grMZDL0rA3x
	iBDasP3KixrcZmgyl4DESdKI4AeV2+RztGdXw14QwUhkJYY26hrjrabVre4Cy1UPwzbryXINSuy
	P0QtzjsYmQP9cLxW+Kz5/89x5r1v3rW3fsbL0mSAw=
X-Received: by 2002:a05:6000:2508:b0:485:8c16:5ee5 with SMTP id ffacd0b85a97d-4858e8bd21dmr3475598f8f.31.1788564300124;
        Fri, 04 Sep 2026 16:25:00 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm461764f8f.5.2026.09.04.16.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:24:59 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v5 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Fri,  4 Sep 2026 23:24:54 +0000
Message-ID: <20260904232454.391138-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <780c9e93-ca6d-4481-8709-c8e5058f0073@wp.pl>
References: <20260903123644.23800-1-f@lex.la> <20260903123644.23800-2-f@lex.la> <780c9e93-ca6d-4481-8709-c8e5058f0073@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_162503_446939_9BC82E21 
X-CRM114-Status: GOOD (  10.55  )
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

On Sat, 5 Sep 2026 01:10:33 +0200, Aleksander Jan Bajkowski wrote:
> I'm a little confused by this patch. At the same time, there are patches
> floating around mailing list to disable EEE on the MT7530 PHY[1]. Does
> the EEE work, or is it broken?

Both, at different layers, and the two patches don't collide.

The MT7530 internal GE PHY really does have broken EEE, and Vladislav's
patch fixes that in the PHY driver where it belongs. Mine is on the MAC
side: since the phylink managed EEE conversion, lpi_interfaces was left
empty for every mt753x port, so phylink never saw the MAC as EEE capable
and ethtool answered "Not supported" everywhere, including on boards
whose PHY is fine.

They compose, and the PHY wins. phy_disable_eee() clears
eee_cfg.tx_lpi_enabled and fills eee_disabled_modes, phy.c:1027 builds
phydev->enable_tx_lpi from that flag, phylink copies it into
pl->phy_enable_tx_lpi at phylink.c:1997, and phylink_activate_lpi() is
gated on (pl->mac_supports_eee && pl->phy_enable_tx_lpi) at
phylink.c:1583. A PHY that disabled EEE keeps LPI off no matter what the
MAC declares.

So with both applied, boards with the broken MT7530 PHY stay EEE off
through the PHY driver, and boards with a working PHY get back the
ability to turn it on. Mine doesn't enable anything by itself, LPI stays
off until userspace asks.

