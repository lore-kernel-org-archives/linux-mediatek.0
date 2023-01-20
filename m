Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A577BC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 20:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wYkI8Uy3eVoLHQriS3wJu7taBClC+zRZyntRCNh/0uo=; b=04JrvwNv4U5RYE
	zwSFIc4yfl7vzbcb1tFFHmSeN4t7tCj+2dBCd1rNlMCsHbp8TvKZQsxqGjoulUKWq7fCs7pZY4UNf
	+6Tm3h3m9BhagEIiAZDQGHs8KnpQt7g0eovWr2nNngcjcSlwnONNshZuqCWkQr0KyzJlfSsj+1wos
	5rJwmXzspU9TM6xQ5cr5uHfTfRk62lXbBBOlCfCPygKtv/vMMijkfAfpUpJ4Ft3Q54Fcbizsr98Bl
	hF4aOdXZODjJ/lDppl0SY+9AxEbnKXbjIEb5ENETuIJ03VZzomXXlMEa+3jHFiWYLNGPGvZkP10aS
	3oV5mgIPA6EJ+cYMhkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOU-00CLG2-Hi; Fri, 20 Jan 2023 20:53:50 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOQ-00CLEi-6k; Fri, 20 Jan 2023 20:53:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674248019; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d/gHxNp0++NB9ZIWOwKHTKU20QaujpwwROBT1VTRXDjisCXbataXwC2C+whpUOhFYufF28nYlhrUpyiXMFvQPBwioxxJCqUAQY8xzrblqoKMZ44MLDoywKFzXVXtbFQIMbVvfe9J8OfZkXR+H/B7+iiVGaCn9m90/FoXNV3dFI0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674248019; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=wYkI8Uy3eVoLHQriS3wJu7taBClC+zRZyntRCNh/0uo=; 
	b=ZqQpIxZtU8NNiVg78InF7a9LNiCccy7+2qinQPDsmNmhRWqtUwUU4qMszHtL/KI1is47HyqLHZUwKT7ffTcuy6NI/rfl6rz4WFTxYg6CK5RCkltEavpKEKKUSAiNLmS9rlhaUkMEUdzdtfYmTBnm95RXBxCAwU/S11XrzDq2YVc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674248019;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=wYkI8Uy3eVoLHQriS3wJu7taBClC+zRZyntRCNh/0uo=;
	b=gkyU2f23L9CMAit/jdrphftqgO6925/F3My+Q/sGfZ+3m8Exe1phfhALEaIFm4wY
	asGfcWAEfBcahN1+ewbihSEoXrXA7VO2or4pW4pnBtVP/65ylNTrBAnYwTtfTROFvjW
	ftZtfs0D1XvtFJ8ewZb7LxPGEyNELp9fccVO/XbY=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 16742480172821011.4408425398325; Fri, 20 Jan 2023 12:53:37 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/5] arm: dts: mt7623: relocate gmacs, mt7530 switch, and mux phy
Date: Fri, 20 Jan 2023 23:53:13 +0300
Message-Id: <20230120205318.519493-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_125346_340789_1F526688 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Yeia sou!

I initially just wanted to submit the phy muxing patch for BPI-R2 but after
looking around the bindings, I decided to do a bit of a cleanup.

The main takeaway of the cleanup is that the MT7530 switch is actually a
part of the multi-chip module on the MT7623AI SoC. I'm moving the bindings
for this switch to mt7623a.dtsi so they don't need to be defined on every
device with this SoC. This should ease it up for supporting more devices
with MT7623AI SoC on mainline.

I don't know if there's a pin wired for interrupt. The switch is going to
work with polling for the time being. Folks from MediaTek, feel free to
fill me in on this.

I've tested phy muxing on my BPI-R2. DTs compile fine.

Arınç ÜNAL (5):
  arm: dts: mt7623: add gmacs to mt7623.dtsi
  arm: dts: mt7623: add mt7530 switch to mt7623a.dtsi
  arm: dts: mt7623: change mt7530 switch address
  arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
  arm: dts: mt7623: enable flow control on port@6

 arch/arm/boot/dts/mt7623.dtsi                 | 14 ++++
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts        | 86 ++++++----------------
 arch/arm/boot/dts/mt7623a-rfb-nand.dts        | 86 ++++++----------------
 arch/arm/boot/dts/mt7623a.dtsi                | 74 +++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 22 +++---
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 13 ++--
 6 files changed, 147 insertions(+), 148 deletions(-)



