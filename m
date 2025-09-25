Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8C4CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ms//Cx2KpQPodFvmBjr5qtYhxMu5fF/NuoJ5civygTU=; b=PDrS0v9MpeDsITEh7FNXyYtXEF
	bFOlDl6wSrxwKLS2kA5vWuRL5GqMRPOcgKYCXAEkAUoOIsm7J8zNdcwz5ePg5zJgXtb6m9DryEOpe
	71vPa5vipWBHTqPmElOccjJyIIhN3oNXgMdETypiKoqkwhftw05bTDy3M4QxJ6poI4LAGqt3G60j1
	s+lidSv7wlNWRQW6GVb16T7iw7U9GcGHReB/Uww+IBnIdxdYQUXZ8CbCcfOXobaV7cnK9Qbp48u4o
	VjBQ0MJ3SFLDGDAFmm1gBQfJJXk7aP42J/T7azjlNfsk3l07t/uKtkAu/Aura11Y/9PFnj4168e+8
	q809QcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1V-0000000BCsa-1gAk;
	Thu, 25 Sep 2025 16:40:49 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1T-0000000BCqe-1ElQ
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 16:40:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso1304770f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818445; x=1759423245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms//Cx2KpQPodFvmBjr5qtYhxMu5fF/NuoJ5civygTU=;
        b=WKRNz9/YC+jABPa4HdHE/cH9rWhN7yprThkwkayXO9D+Gxu5rXh6Ti3BWZWlbzQeFi
         Jh/nmU5jMt6XbSOBwVC0Lr4D0Vu/kAH6N3rAQ0bjjGbFekfFLAFV8tr02tRzuLxqXB1E
         amVmbN0oNspmiD5PuHXxVh4mv1dSWZlcoc1ZpamLcYRhkHPIbZn9TTF90RDelWHZvtYr
         WavMevTR9NwVlt3S+9P3OD46b+DXeHeee8FnSC4khwMdgrH8cqEdRxXQb24DNXNM+hSS
         YTUsawpEAv5VyNlxG0bYsYV0s6CCVM3hQnt6Ybd/emAgcDg8rdV8M1p2gQYbLMSxoRxq
         FBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818445; x=1759423245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ms//Cx2KpQPodFvmBjr5qtYhxMu5fF/NuoJ5civygTU=;
        b=HiC5KGjwcjBKLC35+3uKWWjpEH0yvcxrQ/lVXll5BEW5YhIVKY5W5aTr2RBfJvMBXU
         Z7n8VRm+lOGtGQNWUSouZTT+MsaOc0eAcVNZACqMR8pWo9itCqHUtREbpraLC9zTXpw9
         Wcn5/09Hzizf0ctPdBcvsPXRPOgoWnP+hOsxhbIjiogI2MloPqQD8Tj8W+7LoowBWFdY
         HSE03tZDjbwqZmqRocEANpzkDiw1n/978p4jlQRasUsTr062vM2UcKge3mdlrDE0eVN6
         3HivaHLkwNDn5h3dXWALdSropI30guMg2ESkOJgfa3Jqv3rTDrfKbLgSdgbeoaJ5oAmO
         ZuAw==
X-Forwarded-Encrypted: i=1; AJvYcCUuAH7x0x+RJ6iF369N7XKfzXZrccTUJHzkE6ChCiRnLCcCLa99nsgK27syzqGB31/GuvXpDOCC7lGIOU87/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu/cSX8A9sFsumzTJg90qS6YZfZYmPccvYpcXmBYPw2YO7WdI4
	w15h7bIVhyCPtCVC4cGh7WI9o4igveFb/vt861V1Raktuy1zfQ5xpwPk
X-Gm-Gg: ASbGncu77yhUcnlLlk0EaUPdzFBbgJLCbrUw51B44Q/fTgDd+a/zTW6RtkXOshWI3zX
	N1aiz/r9PuejKz467vX7Wn3ESDpjHEv9Rl6HT0LkzuSfrOixaJFE7WqiBlaWFhR/AA3pNYsRSun
	5eYEVUzX36kzxaCPEbPEJzE/v09dzkDWWGZnomlTOV8w9wbefTGb9Ao7qhTV09gKKzusB/0dx6e
	js5Kdr56aSUdqA0vUWJw4YoF4l5cSbtSAck0lar1BtdZ1iRUITlbx+gFBkU27v8pyy5KrZdCzHx
	Mv8HGfWb3O34JaXWobUSRXTh8BTSN41BxVzBqH187y3I2rIxLLyAKYu5SVGDU7SrpQEaFnHEKQd
	F0VBgAUoThLiXn06Fen6oIoiPZ31sfpmKKZefM6yWkOwQbBkLyKlP7sxc1nCzqcOTBk64lIY=
X-Google-Smtp-Source: AGHT+IFhsb6qW5/GahKJeP2Wl3RdIGj6vmskf1jEdNXYYA/Gj3jq1OBG69r49jeZED4H7pHpv3jTpA==
X-Received: by 2002:a5d:588c:0:b0:3e7:6268:71fd with SMTP id ffacd0b85a97d-40e4cb6e2fbmr4192124f8f.52.1758818445399;
        Thu, 25 Sep 2025 09:40:45 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/4] arm64: Add AN7583 DTSI
Date: Thu, 25 Sep 2025 18:40:33 +0200
Message-ID: <20250925164038.13987-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_094047_339536_BC488CA4 
X-CRM114-Status: GOOD (  10.98  )
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

Simple series to add initial AN7583 DTSI. More node will be
included as they will be supported.

Changes v3:
- Fix typo EN7583 -> AN7583
- Add specific compatible for watchdog and crypto engine
Changes v2:
- Fix DTB BOT warning (fix crypto compatible and OPP node name)

Christian Marangi (4):
  dt-bindings: crypto: Add support for Airoha AN7583 SoC
  dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
  dt-bindings: arm64: dts: airoha: Add AN7583 compatible
  arm64: dts: Add Airoha AN7583 SoC and AN7583 Evaluation Board

 .../devicetree/bindings/arm/airoha.yaml       |   4 +
 .../crypto/inside-secure,safexcel-eip93.yaml  |   4 +
 .../bindings/watchdog/airoha,en7581-wdt.yaml  |   6 +-
 arch/arm64/boot/dts/airoha/Makefile           |   1 +
 arch/arm64/boot/dts/airoha/an7583-evb.dts     |  22 ++
 arch/arm64/boot/dts/airoha/an7583.dtsi        | 283 ++++++++++++++++++
 6 files changed, 319 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi

-- 
2.51.0


