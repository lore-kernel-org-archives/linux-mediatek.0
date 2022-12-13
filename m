Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524ACC10F31
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 13:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HBt2SS58XZzUibGPuuuRWTkBBCLZP/33uVke48GYcq8=; b=4Xs7eBYjRdVo8gziScLKiUglCw
	gKA8eunj8bwUlJlUsnCyjUPSDrruaumwO4rCmNOU/3KzP9kZEG+ZSxk2cAs+RiysGdaCDmW/ReuLw
	xVTZmt81QZuNbCYh3tb174N8P+Zygr+s5HCcsYvIKy1OnNgSzaGEYn15GBnaF0iZAU55X6mh1wOQW
	MHX4MiNV9+Sl07wLoQZYPz0ylsi5CxgnXcZzigoUfGzKczZf+ipDimTtEeEMKAjsCmwf8YV3vcYBL
	1SQ5FIBNBj4AAykzAIaSu2AH7haANnJWNLOfLlV6SZ2iKpWVVmViQLiqmzl5R5MMx8ZsA8hZbmW9c
	/Yp3Xxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p54y7-00025p-8Q; Tue, 13 Dec 2022 13:05:11 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p54xv-0001rx-Fi; Tue, 13 Dec 2022 13:05:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670936693; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NJyWtGUqF9JoKZqBoobQ45oKdr1MImtZ5bqTP16He/oe6n/w4IXVSLMAGk/7K+edz1KdoZBUnSJM39bCP8NbRa03dcKVqAZEJdhLZIQucuGMzSm9XNxPvqSO7eR545qWHAh5acYl5A3Qij1xblYgVMdXfI15EDvt/qMqy3nrkpA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670936693; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=HBt2SS58XZzUibGPuuuRWTkBBCLZP/33uVke48GYcq8=; 
	b=BBp/PvcTELArqBLbNLEyTZrQNzJuHRXR1j/76UpmDWf+oWQB6kqrsrIIbNf4oxTc5oCaEqEPc/yjTB+TMhqpNmSK319seMdiagFnkCtlYCzEkjKAU+WOe5vravoeXtSM+NFTrUwvkojS0eNakDN4xqtiJ/9OP0eMQOJwWF0LuTo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670936693;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=HBt2SS58XZzUibGPuuuRWTkBBCLZP/33uVke48GYcq8=;
	b=MwFCLHL6CARmRv4PykO1TpwxEXK3NSqSf8G4CwIfEJRvO253WHyH674UPFGLCiTY
	jz4yiJTXdjWOOW5HdgaTOS3hoEMCIngzBmFDo9++ehqctwY14aSwbCs5Uf0BbBhPth/
	KYsQAqQdk6hQT6ily0LrvYuyaajkgWZXQ2aXzjqs=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1670936688339228.90466503221523; Tue, 13 Dec 2022 05:04:48 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 0/6] Enhance Ralink pinctrl documentation
Date: Tue, 13 Dec 2022 16:04:24 +0300
Message-Id: <20221213130430.172876-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_050459_597386_68DB8A57 
X-CRM114-Status: UNSURE (   7.56  )
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

Heyo,

This series mainly enhances the Ralink pinctrl documentation, and make a
small variable name change on the subdrivers.

I've compile-tested all the subdrivers.
I've tested the dt-binding changes with:
make dt_binding_check DT_SCHEMA_FILES=pinctrl/ralink

Arınç ÜNAL (6):
  pinctrl: ralink: rename variables which point out the pin group
  dt-bindings: pinctrl: mt7620: add proper function muxing binding
  dt-bindings: pinctrl: mt7621: add proper function muxing binding
  dt-bindings: pinctrl: rt2880: add proper function muxing binding
  dt-bindings: pinctrl: rt305x: add proper function muxing binding
  dt-bindings: pinctrl: rt3883: add proper function muxing binding

 .../bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 632 +++++++++++++++++--
 .../bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 204 +++++-
 .../bindings/pinctrl/ralink,rt2880-pinctrl.yaml |  85 ++-
 .../bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 235 ++++++-
 .../bindings/pinctrl/ralink,rt3883-pinctrl.yaml | 204 +++++-
 drivers/pinctrl/ralink/pinctrl-mt7620.c         | 164 ++---
 drivers/pinctrl/ralink/pinctrl-mt7621.c         |  48 +-
 drivers/pinctrl/ralink/pinctrl-rt2880.c         |  28 +-
 drivers/pinctrl/ralink/pinctrl-rt305x.c         |  82 +--
 drivers/pinctrl/ralink/pinctrl-rt3883.c         |  44 +-
 10 files changed, 1462 insertions(+), 264 deletions(-)



