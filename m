Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8862FC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Dec 2022 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1f++uD83Xxt2hyfb8j7hZsJ56j5K0hL7a8HogPi125w=; b=lnkIFMDR8wtOO4WmJHrfCPO75v
	4vmrk4QpHkAB5KImili3x/ouFLmLxAkZ60Iu2tU2Mtlnqr8nypMnIpXWN+CDmVKg0l/7JQXhLkU+t
	7tkUFgAnlx5RZNxC2w33ee3q4AF0RyFLPxl5CocQk7gXZFv1FKYQiEo9qKJD+ShSRvR0R6QBydfBj
	zmgR6ZUeDSm7OTvY0C11zLb2/hgVo2Z9dOGGWsGy3JkqoJ3B5zgBTjJVHmawXCmN2xkpT8N7iVdgo
	kLY9EwWOG0usYxQMVbuVrDWmpdqPjeYAAddSXTsSrZMMViGjR8YYMKMS5u+od0AML/mm+/U++ckqD
	6uQOJe8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBeQ8-007JbX-8H; Sat, 31 Dec 2022 16:09:16 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBePw-007JVw-KI; Sat, 31 Dec 2022 16:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672502935; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UfZZm/4JxJ+zm8FEUMAcouklCI6rihTeT+/+Mshu5qxR+BydT65RcYObClmabq45KUfHiaDL7ODl7xT9duDR5X2P5Dvige1XsZXvoeJNVXAVLx7wR7krALI40svsbRtQogqU0MXa6XGtQy89rq5qxlD4GplY7BTQ7mwQaGIrDBU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672502935; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=1f++uD83Xxt2hyfb8j7hZsJ56j5K0hL7a8HogPi125w=; 
	b=L5hUscFRyvRth1sld2Ra/HEFuiycWR1xLtA2Ae5PS+gV5xptg4o7UMN+UfwfTAhaLnZW9QTJi196cd1BiD9IOtpD43VwJ9TN1bjiJL2BekUsKYCtMG+wOVL/B988Nw5L5Jvas7SAWcUm2Lk/86tE8jAiticXyQox8ygRboJBq/A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672502935;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=1f++uD83Xxt2hyfb8j7hZsJ56j5K0hL7a8HogPi125w=;
	b=iMtkXEi8y6MEjuGxokIUJBlVRylxcsODdk2K/sb6UcYveRpkI37kCx1kvL6sSze9
	uEcvtXLpoovw69QxzlxmY4Nd24FftZRSf+HkxaZF7J3Wh2awFL+pGwnPOBCMQyzKqFA
	MCT8ll3LHkUFvWsHKblJNqrUifsmoHahvRyiWZQk=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1672502934275328.26427390757044; Sat, 31 Dec 2022 08:08:54 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	erkin.bozoglu@xeront.com,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v3 0/6] Enhance Ralink pinctrl documentation
Date: Sat, 31 Dec 2022 19:08:43 +0300
Message-Id: <20221231160849.40544-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_080904_841570_F954B515 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

Ho ho ho,

This series mainly enhances the Ralink pinctrl documentation, and make a
small variable name change on the subdrivers.

I've compile-tested all the subdrivers.
I've tested the dt-binding changes with:
make dt_binding_check DT_SCHEMA_FILES=pinctrl/ralink

v3:
- Changes on v2 were put on the last patch. Fix that.

v2:
- Add maxItems:1 to "groups" description.
- Change oneOf cases to anyOf.
- Add Krzystof's acked-by to the first patch.

Arınç ÜNAL (6):
  pinctrl: ralink: rename variables which point out the pin group
  dt-bindings: pinctrl: mt7620: add proper function muxing binding
  dt-bindings: pinctrl: mt7621: add proper function muxing binding
  dt-bindings: pinctrl: rt2880: add proper function muxing binding
  dt-bindings: pinctrl: rt305x: add proper function muxing binding
  dt-bindings: pinctrl: rt3883: add proper function muxing binding

 .../bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 633 +++++++++++++++++--
 .../bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 205 +++++-
 .../bindings/pinctrl/ralink,rt2880-pinctrl.yaml |  86 ++-
 .../bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 236 ++++++-
 .../bindings/pinctrl/ralink,rt3883-pinctrl.yaml | 205 +++++-
 drivers/pinctrl/ralink/pinctrl-mt7620.c         | 164 ++---
 drivers/pinctrl/ralink/pinctrl-mt7621.c         |  48 +-
 drivers/pinctrl/ralink/pinctrl-rt2880.c         |  28 +-
 drivers/pinctrl/ralink/pinctrl-rt305x.c         |  82 +--
 drivers/pinctrl/ralink/pinctrl-rt3883.c         |  44 +-
 10 files changed, 1467 insertions(+), 264 deletions(-)



