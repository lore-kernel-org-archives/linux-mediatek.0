Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4E4C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 10:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j4ZVGeRqKMU3nyf6nzNvRFsoeF/EGxON3z9J6rKtVAk=; b=Lot4GXhqpBPbikTj5teLYK7o1L
	C1+fYCMXHHFHUlhpIssjsgPWQq8BIsDZ1qyZzwjNHHxqYcxQAbytDbyawNUrHKidAIYsSR4QuZOLD
	310CxpCabFaCizY6IA1ptaF4cv+mgRRO+KlhTU//4XkJYM1RK11mzAUdVOr3wHbQGCqVT9xhsdMno
	IfgOWSpQ8CGN7kb1N6DUeOowlkMg/T1t46oVkGU0c2m6Rk1uV8lMwjf0ne/xQctEWfMjJnNyLNq49
	S6U0D1QiBO7LTFtp0MNdKYXlsmbWA8PFfIIW9mH1uDxvBYVmliCEaH8aITwS+TyLj2HiqGaBVMXGp
	fOcK2cyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8sY-00000004klv-2rbG;
	Fri, 10 Jul 2026 10:54:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8sX-00000004klD-2nJv
	for linux-mediatek@bombadil.infradead.org;
	Fri, 10 Jul 2026 10:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=j4ZVGeRqKMU3nyf6nzNvRFsoeF/EGxON3z9J6rKtVAk=; b=IeraaFPfzmsZMSaIzhqD5MVFIM
	ZZ2XJoTxJBJ2lnQbspsHt+X21FuCPmV3qevnqw9wbCaYguCxXdHxUwISrmDaey8Y4WWGRBkmzEXie
	CJ32iadlwhdxG2MqMn2WB4fSg/iaeT5g8Rc4HCt1krD0EwigKfAIV+n6sZ2DwbIgBaR6PD1Bl9ZOu
	EQbOCpYb3ro7/bzAkZrcj45oIlb18cs6CtyzJYvN1Qj4OckBQU34TVhotuyczH6458krzqq5dcC5E
	ycPzOhGmDtrf+4vv6y7uusw+M0JuANGNyz6IRgZ5M/UoG0mWAtoHphn1VOv5sSPYctyqC1GE4UN+M
	K9oH6jYw==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wi8sU-00000009wh2-3qpB
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 10:54:44 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso532978a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680880; x=1784285680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j4ZVGeRqKMU3nyf6nzNvRFsoeF/EGxON3z9J6rKtVAk=;
        b=OukROMNl6G9+0Sz51b/qskbPekfnanlrOuJ+ATJgee5VTl5xaeSNiUP03RDdCmPxFs
         ifbcERBHmLezhx7MPh9WK7yUzoGcm4kkaquS5Nt0+lxcpDJH5qOa2fJNVSwotY/zV6Hn
         O+n0v6SkthbzKBKWs2eVHnFPuJQfN0TWKPR0bxKBqxteJ7JuddrLrvyd4aBBgRRK1Q/Q
         YTS3J6XbnE/M4oOF8WwUeNvP5JXnYRDMvpiDitWPIKmI725ce1ap7kJsxtJAQFf9aLEW
         Km50fYwYntxyKMiDAz8Qb725j+CoegDXJK3U/joTCqUPLGg2h6PIubh4r86LSuF8t1uo
         K4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680880; x=1784285680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4ZVGeRqKMU3nyf6nzNvRFsoeF/EGxON3z9J6rKtVAk=;
        b=CLoQ8zJardZ9o5hLdWGeu016sF5auTSBKCxyjg7YbB2J9c1TDJHpeLxtGSu1GKKwGJ
         QS6Q6PYgAaCxXJdeWt5gDyqhRJDN4XGxU25HIKtY/xBHF38zBUYdgreFwOxdSthgUby5
         njVJptLL+zHh+KFkz0gCOQ/jaJyRcVE3ZajeebHqkNcQ1tZRpYbwLcSnjpr4bSCoGjDJ
         MWZoU0ICXFAWeQp9G3Tr58oKod/Js0Vb9KKg8v93MGrKsFdL1kdo2968V4N0qZhqhlX2
         WwFXB3Doofp2cXlunP+xNv0JMtCDhoq0BFba7bpq2MGLAyFIXdyerxlOjaARjIKWQQh6
         E19A==
X-Forwarded-Encrypted: i=1; AHgh+RpwxpWEhgI1IjZvonnxfqfvQVoIHIo+E3weXMhoNCh9sNKHR8BF3a3pd56WPMgvwelUgfUkqMLYacL7drd3mA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxej3y/I4lUhSUeq0sGxh+Yn0D3qNjvZNEX3BTrhCSMX/KvfVxr
	axDQwVTLgIGd9GKVah5o2pCsRUVJuRhmQo5EVDhbZoHh7h2GK55Mv1HL
X-Gm-Gg: AfdE7cl7UuI7GO3xCZ5z8MOks3W+tjsGN7mAJivJngcT96Lb+IZkevlsp6TRy/CHe9/
	nbLvqW+ZB2H1f00azTX/oqZiFS/NtqTxcPi+5Xq7J/whb0EuxEOo5hRzHwMim/hXpe68QUTxBa2
	RRctxbBWbUGiHFRRo/rRu0o+jz59aXgF/a7PL6A9Oi200co8NbBJXu01+UNi89Nx95Pl8JPvup8
	ZxJ1bQ2aLIKBaGRULES+BnWxziI43cbtjVKTen2y0vEiasNiu2qM/nhsx0dndyVY4ppEDYzM5LZ
	GrDqSQ26XsDyDDwWK/8lLWIEGgYjOqW68tR/4c4OcfCqHtpRQi2W2HAXscBC0Wo+3rw/sYv4+86
	WVQfRpsmXVmIwP2zb9BRwZ1W4jZSJQH7f/aXNTnvY7MpSX0wKukfDnrcaD8wq+CdmGljVhN7tkQ
	/l1oRGMkCDiiunKW3Uknwa
X-Received: by 2002:a05:6a20:3d0c:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c0bcc4068emr13266820637.62.1783680880360;
        Fri, 10 Jul 2026 03:54:40 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm40752937c88.9.2026.07.10.03.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:54:40 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next 0/2] net: dsa: mt7530: add EcoNet EN7528 built-in switch support
Date: Fri, 10 Jul 2026 14:54:22 +0400
Message-Id: <cover.1783680864.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_115443_062853_E8606EA0 
X-CRM114-Status: UNSURE (   9.93  )
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

The EcoNet EN7528 is a MIPS SoC whose platform support is already
upstream. It integrates an MT7530 switch, memory-mapped like the built-in
switches of the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs, but with a
true MT7530 core, four Gigabit PHYs on ports 1-4 and a CPU port at a fixed
1000 Mbps full duplex link.

Patch 1 documents the compatible, patch 2 adds the driver support.

Ahmed Naseef (2):
  dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
  net: dsa: mt7530: add EN7528 support

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  5 ++
 drivers/net/dsa/mt7530-mmio.c                 |  1 +
 drivers/net/dsa/mt7530.c                      | 56 ++++++++++++++++++-
 drivers/net/dsa/mt7530.h                      |  1 +
 4 files changed, 62 insertions(+), 1 deletion(-)


base-commit: fe3e786ef4eb6e47d2901f568a27bd920477bbe9
-- 
2.34.1


