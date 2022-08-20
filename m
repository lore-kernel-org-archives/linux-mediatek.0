Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B84AC32793
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 08:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NeRoVH6YC+bOoPXLzZ/zHt1qQTsqVmbHTKnjSX+8XSQ=; b=KuPmmVtOLjAUWFGj1ieTNmYswJ
	0j+XzEGM18Qz2C1yJXq6E2cbETaB6NptKY2kgM1i+9d7fehSduy0KSeld1AWcYaFMP5JozYq5evq4
	piXQ3uR3xi93Bmz2Y+9HodJFhZCRlCemjqejU66B9NfWkpxNjsFeZTrC7O1jlpZgoF5Z7oN/bBcru
	/rb+pwV5xPidWWIpK5WaBOEr3S2Dz28eT7F7tmoaZZAmnNIa0Lo2iCWD5iUX+vuZTg+O5RlL+IaV9
	kUic70WxdRakUT9XRGs09dAmJf/6yEgy/txhzZDibegV4xNwQ8LzEOabYuGl5pkohmThwhy49/dEQ
	iZ9kRvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJXC-004duJ-1N; Sat, 20 Aug 2022 08:08:46 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJWz-004dng-AT; Sat, 20 Aug 2022 08:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1660982888; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Do4/0bKH2TLQt23fEbxQeWdNNRPu5G9ElmZ+hJQUxk4BjzxxyoiOJAuLgOGwxqlRU3g2VFT/J01b3Z/U/S6h3AGjkIfwulFClx0EzAc+mHfaIJjPtkPokeNz7VTDeOH3EoqG32rmcQkV2NQCoSXkHyON9sANAV9F4ywa+kTAAeQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1660982888; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=NeRoVH6YC+bOoPXLzZ/zHt1qQTsqVmbHTKnjSX+8XSQ=; 
	b=Dvehy5nM+pLU8nUfOPCusyYb0akpPYUOUW3qzRkB0lderFkOqBXPQB/UFmVkVUAN5oIo+PSV9nETc10p5iPvbu0nfZiSq2CtTwZm3AhIF+XhIpN3zWQJULUtzxaEoDSWgZoHuWRaiZ2o/vvM51VfUWxF9ASNVRZG16oGLjWrvr0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1660982888;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=NeRoVH6YC+bOoPXLzZ/zHt1qQTsqVmbHTKnjSX+8XSQ=;
	b=FLgMImQ/DHgfxVRjJtEQTWm4Bz0LmhOGwJEUEoq5+bfs8lWSMjz6MpBHFbkSzs3H
	BZYSD4KvDJCX/7C0tEXoZehBW7tO2pXFCKeThlt84WDZeOF6Cd52yS3TfKyUbubwbnQ
	OyhH4Pm38StiQO62buSvGicXJ6+AvB/ajBP3lo4k=
Received: from arinc9-PC.lan (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1660982886821459.07285493323946; Sat, 20 Aug 2022 01:08:06 -0700 (PDT)
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
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v4 0/6] completely rework mediatek,mt7530 binding
Date: Sat, 20 Aug 2022 11:07:52 +0300
Message-Id: <20220820080758.9829-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_010833_457986_E4E689EC 
X-CRM114-Status: GOOD (  12.04  )
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
  dt-bindings: net: dsa: mediatek,mt7530: fix reset lines
  dt-bindings: net: dsa: mediatek,mt7530: update examples
  dt-bindings: net: dsa: mediatek,mt7530: define port binding per switch
  dt-bindings: net: dsa: mediatek,mt7530: define phy-mode for switch models
  dt-bindings: net: dsa: mediatek,mt7530: update binding description

 .../bindings/net/dsa/mediatek,mt7530.yaml       | 677 +++++++++++++++----
 1 file changed, 542 insertions(+), 135 deletions(-)



