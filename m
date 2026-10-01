Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE19CA5FD2
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2026 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ssAgCLNB1hrn9m8PJ+lriduvIQBe6pwTyDTXeIxcaNY=; b=2Ef2WBEY9zmbuyceG1ugCYxtli
	U104mvBZNB0lT5NAf30AmI/YhGY+Bm/Bq4gUxvAZArxiCpZijABJAoSJhEDbzBOZ7CaxU7EJxsDcK
	33Yz1mcah/KcTn0jSB5mCuYVFIp6LETjOCjv9uJraZy8oW50DFlmAxJHhCTP1p/I+Pi8SJdY35HWl
	EgXxkOEUD6aVVUYlwqxZ6R7MXuoGrPElpv2kr+IOA6mJB9J434YAaGaY1q7lUE6NTBJI2aQcYTTBX
	Xqssz1CY+mcUQrNZnbNzgvpm0XAopgRbR9Zru0sMOApcCdEGa2xZoNVyU4cstVN9DyRqOp2npKqUj
	w9SAqSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGQU-00000009AA4-0sKD;
	Thu, 01 Oct 2026 13:02:18 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGQR-00000009A8j-1aWE
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Oct 2026 13:02:16 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso382443366b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Oct 2026 06:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859732; x=1791464532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssAgCLNB1hrn9m8PJ+lriduvIQBe6pwTyDTXeIxcaNY=;
        b=EOPTKR3e5eiupXoKWLXTSLSuAf3PW/COXAaP2ClQirMxE/Vp/FQjYkWPrpQOlHxjVQ
         ocZ1iCqHi4HQ50t8b0RqDTASPJxnP0ZR74vk4M4HcugH+YsFBeycF99JHdvxG2ougRHU
         faLtCf2rKLW9UzbpMrIKT0z93AhFc6k/gzu0lqyRhgR6hkDfRuQPsY4vzPbYssin+29W
         0pqeTENoPMv0NyJtKBazxtXCDnC3B4kjEkwuxMsOB5k5gJX7dGL9hXPMq0vi6tY1VyP/
         AcaubXMhi2Yc3zgApgZiCvpqIsXR0VnCoAYi2NsTx2NbPkw0vXWLrrJR7gFUYadJ14nq
         5D2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859732; x=1791464532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssAgCLNB1hrn9m8PJ+lriduvIQBe6pwTyDTXeIxcaNY=;
        b=wbcg/xhiwJQgl657v+AAaakO48jgtInwFqnuC+kv22RKpX0DB5BKJ4AGctX62Iv3Aq
         CyJgn8ZAauEg71eyTh2YYMrgaXvA1H1YJIB4zfRoa5cg52iuCCQIR1cugfiy1F3V89W8
         z1Ag+rXA4uKKUmeIcZ2EXBu0kRCYJbSn/7tuFiwZX5dZVVAoLYtvi/hZogaE5G0v9yvH
         Zb5v3ynxCYELzbpWDQD/xKMfcudJAVkgDITzFjDbVfoilA7mZFZ1iCT+ljWST79BVAOY
         Zkn8RHFcPAj0hOsUZVKT/nFMcx61IadFk244SaViSOJQgNiYw5XGDN69brLXSI+/Iopr
         3eKA==
X-Forwarded-Encrypted: i=1; AKwUvBwQDwLT1BZ/2WxcB0flbMahm2hSzwWC+OZ9sN7GbXHSv9/2fUHjlH2xt7lgkHd9YJORqYO0N6imdK2HK+86lg==@lists.infradead.org
X-Gm-Message-State: AFuF++llKSCRVhI7wYqepIEpYGVL6a594v33LuiTUJNl3iOBbOYD9/Dd
	nxLoUEodDeXvhy4s3zjqP8te5DRAh3Uhr/yCI6yOGIR19sAT426xuGTRoIrCAtbgdRg=
X-Gm-Gg: AYBFou18pIPRRt+NSt0a1Zf4xZxni/rE+KT1dZ97efGzexgKF6dEnp/yvaMdqaX9ZGA
	cOx1h3QzN+vaYCTS4dEogXc+TYo8qoV5Qq51zhuh16gn87swhCBzrMOfSmJi7dNDAw65vlxh6HV
	hXTqa4a1xAP2EtRrK6nJNVKDF70tC6+CN231x351zmFvO49RbR30xDhYZNIj4FGLOlqU+e8Th7c
	HMDvyZQDuIwLqaqCxWoZGsBmlFINb2pixK/0eDhW5pPO9qlxI1aFHW3a7xno4QTLc6GEdIcF6jQ
	O6lkf1/mBQA5RFI+ThGK8bYKr+5mBqJeDC1QlKZtVse8eMLHUd3JmAeA5DGuh6h2Ap8iaIRLiwB
	elznO/q0Oi6APysSnvus6jJZyzUvV9mwFpBBQmnwvRpoywGlN4M9gkjXvAILhRqaypBHblwMGHY
	GCVXMQHM8p1sz5bKNiZ8b118F7sfztdqng10HSPIpDzKjRA3jSGw==
X-Received: by 2002:a17:907:2da2:b0:c2a:fe4e:61c5 with SMTP id a640c23a62f3a-c2e33ffd009mr234417066b.22.1790859732009;
        Thu, 01 Oct 2026 06:02:12 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2cd0fsm5568155f8f.30.2026.10.01.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:11 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 0/3] net: phylink: wait for a PHY that probes after the MAC
Date: Thu,  1 Oct 2026 16:02:05 +0300
Message-ID: <20261001130208.105558-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_060215_488542_43DD8D87 
X-CRM114-Status: GOOD (  14.66  )
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

On the Keenetic KN-1012 (MT7981B with an MT7531 switch), the Airoha
EN8811H behind lan4 has its PHY driver built as a module on the root
filesystem. The switch sets up its ports before that filesystem is
mounted, so the port is validated against the generic driver, fails its
phy-mode and stays dead for the uptime. DSA does not retry it.

Patch 1 lets the PHY node say so with needs-host-firmware. Patch 2 makes
phylink poll for such a PHY instead of giving up, for a MAC that opts
in. Patch 3 opts in DSA user ports of switch drivers that set a flag,
and sets it in mt7530.

The poller can still lose a race against an unbind of the PHY driver,
between its readiness check and the attach. That window is phylib's:
any phy_attach_direct() caller racing an unbind has it. The attach
guard series [1] closes it.

Tested on that board with the series backported to its OpenWrt 6.18
kernel, together with a940003f44e7 and 07d995873960 (the mt7530
.get_stats64 atomic-context fix). The debug kernel used here wedges a
CPU without that fix, unrelated to this series. Two local debug
parameters, not part of the series, drove the error paths. One fails
the connect after a successful attach a given number of times, the
other ignores the opt-in.

 - boot: the switch set up its ports at 3.2 s, the PHY driver loaded
   its firmware at 8.7 s and lan4 attached at 9.5 s. Link up at 1 Gb/s.
 - opt-in ignored: the old behaviour. The generic driver took the PHY
   at switch setup and the port never polled.
 - two injected failures: "failed to connect late PHY: -EIO" twice, a
   second apart, and the third attempt attached. Link up at 1 Gb/s.
 - failures that do not stop: four attempts, then one "giving up on
   /soc/ethernet@15100000/mdio-bus/ethernet-phy@d after 4 attempts",
   and no further poll in the 25 s that followed.
 - switch unbound while the poller waited: the poll stopped, nothing
   oopsed, and the port attached normally after a rebind.

No in-tree device tree sets needs-host-firmware yet. The board is
supported out of tree, in OpenWrt.

Changes in v5 (since v4):
https://lore.kernel.org/r/20260925001209.2334139-1-f@lex.la/
 - Deferral is opt-in. A deferred connect returns 0 with no PHY
   attached, and some callers read 0 as a PHY being there. A MAC opts
   in with phylink_config.phy_may_probe_late. DSA sets it for user
   ports of drivers that set dsa_switch.phy_may_probe_late, and mt7530
   does (new patch 3).
 - Defer only with a known interface mode. The poller no longer fills
   in PHY_INTERFACE_MODE_NA, so the MAC is never started with NA.
 - kernel-doc names the opt-in and the state after the retries run out.
 - Rebased onto current net-next. Patch 1 is unchanged, Acked-by added.

[1] https://lore.kernel.org/r/20261001130120.104628-1-f@lex.la/

Aleksei Sviridkin (3):
  dt-bindings: net: ethernet-phy: add needs-host-firmware
  net: phylink: wait for PHYs that are known to probe late
  net: dsa: let user ports wait for a PHY that probes late

 .../devicetree/bindings/net/ethernet-phy.yaml |   6 +
 drivers/net/dsa/mt7530.c                      |   1 +
 drivers/net/phy/phylink.c                     | 221 +++++++++++++++++-
 include/linux/phylink.h                       |   4 +
 include/net/dsa.h                             |   5 +
 net/dsa/user.c                                |   1 +
 6 files changed, 230 insertions(+), 8 deletions(-)


base-commit: 47a1446725732cd3996edf607e8739334bbf4d78
-- 
2.53.0


