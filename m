Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F466C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6UxdFPymbGprmTe4eBjG0Y5GF8xFEu5mJKO3YHkCQnU=; b=ezyDziOf3Uy4kv
	G8HNvw33LimHBBmBz7uGdgssPU6mCHyqJrHOfZH1f47piZVXoTPnGW3Yao5ZjeO2lgFpaMKg/CJzn
	abofDeFeJ7vqMziY/slUWVMosNuGGGmOFL4/U5QYb6MCRh0rRztc4y5pFE1Qi8u+pb5u1yKT+Ptve
	DsOG4xuYhrIijou/HlY6DvDT6jKOjAklFmwgtx2BmvgIUIhUMUhaktaoB2MRLAsHU7KITP6oYSUZf
	5d3bVvIwC3s4XT2tDCFZ1ZnkElhQx3G8i+WAluWICMV3n+dfLZXeLzbyQrmTYa+XQALtKga7W9eXO
	1xTHqXEzdXImdrmdZXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIIJ-00DHf7-QG; Wed, 01 Feb 2023 18:57:19 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNII7-00DHZC-SL; Wed, 01 Feb 2023 18:57:09 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z11so18727795ede.1;
        Wed, 01 Feb 2023 10:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6UxdFPymbGprmTe4eBjG0Y5GF8xFEu5mJKO3YHkCQnU=;
        b=AbOQRA07suPEDpJpJx4bqRvx1cSDqzRKLA7jdRCUdvtbqo1gOBGpY7us7ITyqjnhyD
         QXGOnfnqJSTnLcx0zdN+fQZvN2K/6Sr0QJY3Kn35eyCFgNKLdxTpMechGaeqps+W+XIM
         egocf+E4v6+9+pH10QeBrawbtENmvaGag3nREeG9DXrSGoh6Wad2zAen/gMkbbTp8WCm
         SpUkOedh1vy/BmN+9QV3ai04paKe9scGqLxCO6BzREgcxEfaRPzrXPq9vIzdWFvThjA9
         P3zTejok2wYLRFcDAb5KMoTKeVT/a7wJmBx4jSM0FFLXtHkYYjVJ6Go/i9vyUhEHjED/
         FZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UxdFPymbGprmTe4eBjG0Y5GF8xFEu5mJKO3YHkCQnU=;
        b=SHm0rNqc6hvPxoZGajjpTZ0kj1FZJzk3V+7boqgD+9zw12RwevbYRcqV30Ow/ZWMHy
         FUgLW7HsC0aJDSBt4cAqFyPStDAwo18kByM4oH/mwpI21gyJILdUHiF7g/mXu3PpNeEO
         1F6EsxR/BL31Bpw1Je38OMD0+0S76+4DptnKQ317UFBFIJXLH5ehFZVFPW/bFxO8/vJt
         dzD1fl8MSKpmRV4rZ3HvkEvIZ09Rz3xhP+Nj5lCpPprfsFrGh8jbfY9o3ZuQrGSGo7v4
         J8Iwyhkw2kfIaZbHiFiduEMSxC+3zL3iI9JPlabnibUs2fePC3BzQEUBO1+njAkdzAWE
         Yy8Q==
X-Gm-Message-State: AO0yUKUYHPNr4S67GnZIq3IKPMFNzThcchMWUR29aAzy3/QO4x/BjZPH
	XpGTzx2nWdkfHqHUjeZPhWo=
X-Google-Smtp-Source: AK7set9bay2RnP3GeWQZ4wzsdd/XhhlNvNhrCcMjKzYFhVScgcc4tV0IJwP7yMFpMceXcfHwnOYv5Q==
X-Received: by 2002:a05:6402:b37:b0:4a3:43c1:8441 with SMTP id bo23-20020a0564020b3700b004a343c18441mr2141941edb.21.1675277823400;
        Wed, 01 Feb 2023 10:57:03 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id dy25-20020a05640231f900b0049e210884dasm10100883edb.15.2023.02.01.10.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 10:57:03 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/5] arm: dts: mt7623: relocate gmacs, mt7530 switch, and mux phy
Date: Wed,  1 Feb 2023 21:56:51 +0300
Message-Id: <20230201185656.17164-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_105707_939306_334F0865 
X-CRM114-Status: GOOD (  14.99  )
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

Γεια σας και πάλι!

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

v2:
- Do not define phy-mode on mt7623.dtsi, it should be defined on the DTs
that call mt7623.dtsi instead.
- Use the labels for the MACs, remove them from under &eth on the DTs that
call mt7623.dtsi.
- Mention on the log of the forth patch that the interface name will change
from wan to eth1.

Arınç ÜNAL (5):
  arm: dts: mt7623: add gmacs to mt7623.dtsi
  arm: dts: mt7623: add mt7530 switch to mt7623a.dtsi
  arm: dts: mt7623: change mt7530 switch address
  arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
  arm: dts: mt7623: enable flow control on port@6

 arch/arm/boot/dts/mt7623.dtsi                 | 12 +++
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts        | 86 ++++++----------------
 arch/arm/boot/dts/mt7623a-rfb-nand.dts        | 86 ++++++----------------
 arch/arm/boot/dts/mt7623a.dtsi                | 75 +++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 42 ++++++-----
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 37 +++++-----
 6 files changed, 170 insertions(+), 168 deletions(-)



