Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2039BD15D8A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=00l+jC2uOyTPd/aiRiRrvwlSjWFTQ2XPXmYmaLpqa4g=; b=MK5tR18slQ+ayU4xFkWoTLo7M/
	StpEDr45Px3Ib99Jed4Bg2/FuIcID1D1nu1+FltdPt6YK4RZ+8QWhkskFbnQdpCJom3P2GztNDAnW
	PO6oHF2C5Xnh7Hag77pUCXeKGyyX33E3Bi0V0x1lp9jUUFCqhrOYHV2D/3tuvddHcMQNdzk00r26G
	MMjrGIIPj2jh45cTPG2EGQJDJcrNlG+YP9t6OWKqcs36Omq0Thng5AjmorAQVQo+MWarfeExldyqv
	Rssx4QscZyc+kRgOwnUYH4K+5jOrw6Et0fc1VTgqgMzMWWzKD4mY7B52FAK/cIRVrJetyZIs29Ser
	1eOXWH2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s9Y-00000007NPI-2eUB;
	Mon, 21 Oct 2024 13:08:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s3V-00000007M9x-2FiG;
	Mon, 21 Oct 2024 13:02:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so3331500f8f.2;
        Mon, 21 Oct 2024 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729515759; x=1730120559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=00l+jC2uOyTPd/aiRiRrvwlSjWFTQ2XPXmYmaLpqa4g=;
        b=Jf6AY3VRUfShFD9DCcXmShv3vQwzNh4Y3lx8zRgw6QcdTAfvdjGkrwOWVaNLLl6rbs
         jjLUgfX75c6WUmylM3kBaVss/KF6NeFKIChb6Vn/AqnDnZ9CR367V1UNxehVnQyAIEXH
         frZMVFQWzGJJqrCGDeSPoqkZ/e2jhwfJK/cQsTe4L6VqYuwCwE8av8tX9Q0j2pSrm51X
         N3Ily4nrTL2e6BvZsX/3oCUTDwU7XXpkhmSCTY7JpRQxEUI0eshDFYOvAWyiYDBzkH8+
         eyngf773+HouWqGajZnGpbmUEEb8PmJSRDLvWp3pb+v7yX229xIy6Nfa+1P+b1Xfcphc
         CLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515759; x=1730120559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00l+jC2uOyTPd/aiRiRrvwlSjWFTQ2XPXmYmaLpqa4g=;
        b=AvFSSvrOT/ZWUgbjrWi39VQl1mspDoZQHPKUFi4ogW419F9cajcudzN3j8IibMKg1M
         Tsq3QCru86IZzUFHvlMcmG4jSz75xOYjZ3ZNjVdA+lMaeMk88TMcEFZ7BSe1oXiKehEK
         KzwaGQls+KwE/C5zLKXPfvz0496d3SW+HkVhrr4+Ju6ksjBFvHdJcADgNAD5KPZVhn9Q
         /gJOthXCj3MOQAUWAwtplWBY2n1YA6f5oL4et+wta0tc+kp4ajF/mQ5t9b8DytalP6dW
         LCa1b3zyi3E/3xKsaM8XnicYg5gpgQ8CYQymJl1mj7NGlbehibMLZQCGRqiZWh01pC/5
         HcxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW42/uDwEGXicxzJ5Lr7jJ9q3YRgqrdbTuvqmAzlIAnnUvBm14e+by5yDncxUH8ZpD4Xr2ALwdt+eA8+XDoDCj7@lists.infradead.org, AJvYcCWmHK4J2cJ4JHNjuS1kmSCTo1P9OMedzlTwaEplxNB9HrKPJx+9wxmpT1sPhthq5iD7i6U3KOlwRMYPYDVSeUU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn0qApzHBSE5e632T1pYJmDIo4AwLx+IVz9oZY40PKfjj4KjKg
	2MzNfz2pzX/gc3LFhUBjNS+VX1cq9ZR0i23F6w0smydGu2Gikv5Y
X-Google-Smtp-Source: AGHT+IGi4EkVtSyQblvOmjpA4U0smdp9GUxWtw3ocNzEwJ6qTkiBx4UYhqSXBsqxX8gq/Uv/AK3uRQ==
X-Received: by 2002:adf:e787:0:b0:37d:5436:4a1 with SMTP id ffacd0b85a97d-37eab727771mr6738850f8f.3.1729515758667;
        Mon, 21 Oct 2024 06:02:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37ee0b9bcfdsm4295329f8f.103.2024.10.21.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 06:02:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next RFC PATCH 0/4] net: dsa: Add Airoha AN8855 support
Date: Mon, 21 Oct 2024 15:01:55 +0200
Message-ID: <20241021130209.15660-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_060241_619176_DD57F75E 
X-CRM114-Status: GOOD (  14.00  )
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

This small series add the initial support for the Airoha AN8855 Switch.

It's a 5 port Gigabit Switch with SGMII/HSGMII upstream port.

This is starting to get in the wild and there are already some router
having this switch chip.

It's conceptually similar to mediatek switch but register and bits
are different. And there is that massive Hell that is the PCS
configuration.
Saddly for that part we have absolutely NO documentation currently.

There is this special thing where PHY needs to be calibrated with values
from the switch efuse. (the thing have a whole cpu timer and MCU)

Some cleanup API are used and one extra patch for mdio_mutex_nested is
introduced. As suggested some time ago, the use of such API is limited
to scoped variants and not the guard ones.

Posting as RFC as I expect in later version to add additional feature
but this is already working and upstream-ready. So this is really to
have a review of the very basic features and if I missed anything in
recent implementation of DSA.

Christian Marangi (4):
  net: mdio: implement mdio_mutex_nested guard() variant
  dt-bindings: net: dsa: Add Airoha AN8855 Gigabit Switch documentation
  net: dsa: Add Airoha AN8855 5-Port Gigabit DSA Switch driver
  net: phy: Add Airoha AN8855 Internal Switch Gigabit PHY

 .../bindings/net/dsa/airoha,an8855.yaml       |  146 ++
 MAINTAINERS                                   |   11 +
 drivers/net/dsa/Kconfig                       |    9 +
 drivers/net/dsa/Makefile                      |    1 +
 drivers/net/dsa/an8855.c                      | 2008 +++++++++++++++++
 drivers/net/dsa/an8855.h                      |  492 ++++
 drivers/net/phy/Kconfig                       |    5 +
 drivers/net/phy/Makefile                      |    1 +
 drivers/net/phy/air_an8855.c                  |  187 ++
 include/linux/mdio.h                          |    4 +
 10 files changed, 2864 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855.yaml
 create mode 100644 drivers/net/dsa/an8855.c
 create mode 100644 drivers/net/dsa/an8855.h
 create mode 100644 drivers/net/phy/air_an8855.c

-- 
2.45.2


