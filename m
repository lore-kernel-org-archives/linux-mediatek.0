Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465B2C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 18:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C2y6sYHNEq/zZN0E8gf/+N5bxU9MEEKOU3kNqZF3SmI=; b=SXhNQvZZ5iPVEG
	2GPY1ZvVwXkzocAsac8wqBEr0XFm22m+0MBFWDMLKKbs+ctJRuH3liw+qM02SDx6BhOvQmp8D4l6z
	rO578mdZeuiYMLuJuKK7Sltna5jqxC844047zpizaJRorwCBAA2HCz4Bz/C4St9IJhgSRUAdeueR0
	Z61LZjS1fEdQ4KqIUdV4dm290AKHKFOCe6n2tbcrNXf5ZTQu5f8rqJyGTQ4U7hOA0sxcJj8NWJzSZ
	NxOU3VpgU1ylj/a1XsLcGGCmYCkEIQ95HGXYXma3hI5yfrXHzQwGAhg9AAY2KA78dFbNGIgmaG6EP
	SJHqMFNmPA3l8l3KpJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY5U-006uig-Jp; Fri, 10 Feb 2023 18:25:32 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY5I-006ucY-4i; Fri, 10 Feb 2023 18:25:21 +0000
Received: by mail-ej1-x636.google.com with SMTP id rp23so18152007ejb.7;
        Fri, 10 Feb 2023 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C2y6sYHNEq/zZN0E8gf/+N5bxU9MEEKOU3kNqZF3SmI=;
        b=GotghvooWKyyyM2R9iZpsuoUdkaw6mBtm/6brhpXDSbIBs0HPV3yHyP39dE6X185XV
         dLQBxhl3BxO0A0ilsFZgt8OXpPMQnpoAVmnnM5O3VcBzaP0g+716JfdGW3zJ/QdPQK0i
         GCHp27zC4x2f4C1avRkUlcGBF/th09UP3FHDAXBxdLqajrdSNBEzLPxuv7fBd4ZuQ7a2
         nHPosNvo4xuB5ITgxOPkefUadfhuFnONopl+FrzV+FJR2jeI5uWy6hVWDxF/5bBJyEdN
         JXA674PffEYrU3WZlKo027gr5QMnihp1ZWrrTpRoDZr9S5Qp5z+uWMcB6NU+aFKuVH0x
         GwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C2y6sYHNEq/zZN0E8gf/+N5bxU9MEEKOU3kNqZF3SmI=;
        b=oIYUrQcVZLjZ//z5FgfazUPLhFUR5Ww9MdGh9aNWSMrXnjelQvOSFCSuxREiKmhrkW
         +wlawOZ3t/rmmpRLXLnzKWxTqiDl6opwPp2dC5h/BTX+ahZjCTn+4+R0R7gzueMxcOBn
         7PqAofOYl+sPe99xTZVYKrb371oSlsdFVAvWbs1v+3we3XGtt7Hcb4wjHjVJMTyEW/FK
         LT+XEgbn4jDxJ4mk48YEVHpdH+yO9kgT+hPJ5mX7DIVpe5swEr+YKBfXyn8/WoJbhUft
         ncJmeDH/avdYOh9URYA73GsivrW73J+scKATvA27fHnmUOs3MjjBzhn0bhBIZAgGj+dL
         tBjA==
X-Gm-Message-State: AO0yUKV6oOqV5UZJUUbPxNL/Cvze3UTZnSq1QVbVzDR6x3j7K8E8nN54
	PGQdZVhwHGfN2aHs64NPJQ4=
X-Google-Smtp-Source: AK7set/6O05MRjLDgoZzrD7cqFf9vbGCMUu5OdtNyv9uaUgSi9zfXKxw0ZczNpSxDhxMClOOAQLllw==
X-Received: by 2002:a17:906:478e:b0:8aa:9abe:8edd with SMTP id cw14-20020a170906478e00b008aa9abe8eddmr18863182ejc.66.1676053517220;
        Fri, 10 Feb 2023 10:25:17 -0800 (PST)
Received: from arinc9-PC.lan ([37.120.152.236])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906024400b008aef19f678asm2708966ejl.165.2023.02.10.10.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 10:25:16 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/5] arm: dts: mt7623: relocate gmacs, mt7530 switch, and add port@5
Date: Fri, 10 Feb 2023 21:25:00 +0300
Message-Id: <20230210182505.24597-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_102520_234620_0C203CF1 
X-CRM114-Status: GOOD (  14.14  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Γεια σας και πάλι!

We're doing cleanup and adding port@5 as a CPU port.

The main takeaway of the cleanup is that the MT7530 switch is actually a
part of the multi-chip module on the MT7623AI SoC. I'm moving the bindings
for this switch to mt7623a.dtsi so they don't need to be defined on every
device with this SoC. This should ease it up for supporting more devices
with MT7623AI SoC on mainline.

I don't know if there's a pin wired for interrupt. The switch is going to
work with polling for the time being. Folks from MediaTek, feel free to
fill us in on this.

I've tested the CPU ports on my Bananapi BPI-R2. DTs compile fine.

v3:
- Drop phy muxing, add port@5 as a CPU port instead.

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
  arm: dts: mt7623: enable flow control on port@6
  arm: dts: mt7623: add port@5 as CPU port

 arch/arm/boot/dts/mt7623.dtsi                 | 12 +++
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts        | 86 +++++--------------
 arch/arm/boot/dts/mt7623a-rfb-nand.dts        | 86 +++++--------------
 arch/arm/boot/dts/mt7623a.dtsi                | 99 ++++++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 49 ++++++++---
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 37 ++++----
 6 files changed, 207 insertions(+), 162 deletions(-)



