Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41A3C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rFChsskTfCyaj+1KhdWNad8kIz3NamK66A1GrnavCxU=; b=LOnpp/CYiJC5B/FiRZ8lpR0voX
	OHWvUexsMyQXW9rm3FA2aBphtCpW2OywAaxsdnVkdjGvc635F8dTwM361dAw5JgfFOqIAUxlktePl
	QT2sQWGwYl14E/bX3xqV6AENHIImnNsLiiVQqnVaKveVIp5iSfj76O5xvj5Op9rtG6Id1hRKTfGRP
	QWyKkd9FSitMu97Na7l24ddUiHoQ3lzd1y3IGGkof8PNRBefwLxxdLNS7fADM6cxBVAau6UM5Ajwc
	Q1+SSMT8QDo5VN4hmbaX4EO8yDr0O2wftRsOv5uqM1oZxX2SzZB9RLbUynAUYpi5ZSCYURdBdob/V
	IgzFLH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR89U-00A0cI-U4; Thu, 25 Aug 2022 08:23:48 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR89I-00A0W5-MD; Thu, 25 Aug 2022 08:23:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661415792; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bgCndV26sDNC03yHDLE03tr/4pKvYzMTEpJRw2wKa8KCXNFv1JA86XDtmC1BReXoHB61hD6844/EWweBhxXeN8Pon9G3Dbsz6X5mc5/zr9WB3tUSQcAu+I15gB87xsIYYiz+diHROX/kje5E4DbufNhYxsbK4LI/uo7S2XPIIdA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661415792; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=rFChsskTfCyaj+1KhdWNad8kIz3NamK66A1GrnavCxU=; 
	b=NBM3y7wUvfqaJaYlz+upVEkbHsUJd8n+UCDNbE7uYT2ad/7/4Z65/8WKBB8Jt3j0LT7ftLa9Ubw4/wBituyzh90Cx4t14GagWw1DxZot/IPCWEOvevUrnO4QJ7w9xgYDac5rGnrIPm7rGedlnQcOSpmQOMTD6SQLQtpAnQQ/4/I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661415792;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=rFChsskTfCyaj+1KhdWNad8kIz3NamK66A1GrnavCxU=;
	b=QsxU6xJSJoBtTYU2XspwCXI628aJAtVBJfIMpyXmlpICEOiXFWOtZBqW+qHgJZ1q
	n0OFZHl291nHwIf88CJUP1UUK/SeQALdbJh1k118LT2YKmh25anolvhILkAdLEuclWN
	hGytrwD47vStDII0saQeUK24K/baI9vcG9UgD/yw=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661415790051978.3919888258579; Thu, 25 Aug 2022 01:23:10 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Sander Vanheule <sander@svanheule.net>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v6 0/6] completely rework mediatek,mt7530 binding
Date: Thu, 25 Aug 2022 11:22:55 +0300
Message-Id: <20220825082301.409450-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_012336_797723_DBEF1C3F 
X-CRM114-Status: GOOD (  13.87  )
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

Hello.

This patch series brings complete rework of the mediatek,mt7530 binding.

The binding is checked with "make dt_binding_check
DT_SCHEMA_FILES=mediatek,mt7530.yaml".

If anyone knows the GIC bit for interrupt for multi-chip module MT7530 in
MT7623AI SoC, let me know. I'll add it to the examples.

If anyone got a Unielec U7623 or another MT7623AI board, please reach out.

v6:
- Do not remove binding for DSA ports from top level.
- On the first patch, remove requiring reg as it's already required by
dsa-port.yaml and define acceptable reg values for the CPU ports.
- Add Krzysztof's Reviewed-by: and Acked-by: to where they're given except
the first patch because of the changes above.

v5:
- Remove lists for single items.
- Split fix reset lines patch, add new patch to fix mediatek,mcm property.
- Remove Rob's Reviewed-by: from first patch because of new changes.
- Add Krzysztof's Reviewed-by: and Acked-by: to where they're given.

v4:
- Define reg property on $defs as it's the same for all switch models.

v3:
- Add Rob's Reviewed-by: to first patch.
- Explain why to invalidating reset-gpios and mediatek,mcm.
- Do not change ethernet-ports to ports on examples.
- Remove platform and, when possible, ethernet nodes from examples.
- Remove pinctrl binding from examples.
- Combine removing unnecesary lines patch with relocating port binding.
- Define $defs of mt7530 and mt7531 port binding and refer to them in each
compatible device.
- Remove allOf: for cases where there's only a single if:.
- Use else: for cpu port 6 which simplifies the binding.
- State clearly that the DSA driver does not support the MT7530 switch in
MT7620 SoCs.

v2:
- Change the way of adding descriptions for each compatible string.
- Split the patch for updating the json-schema.
- Make slight changes on the patch for the binding description.

Arınç ÜNAL (6):
  dt-bindings: net: dsa: mediatek,mt7530: make trivial changes
  dt-bindings: net: dsa: mediatek,mt7530: fix description of mediatek,mcm
  dt-bindings: net: dsa: mediatek,mt7530: fix reset lines
  dt-bindings: net: dsa: mediatek,mt7530: update examples
  dt-bindings: net: dsa: mediatek,mt7530: define phy-mode per switch
  dt-bindings: net: dsa: mediatek,mt7530: update binding description

 .../bindings/net/dsa/mediatek,mt7530.yaml       | 649 +++++++++++++++----
 1 file changed, 527 insertions(+), 122 deletions(-)



