Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B89DD111A8
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=97C/Ev0rC6JcGUG0mR7bjVxQO49skG60GnX/roDGMIg=; b=yG2p36Nqneor6XzKhcl/McdhoB
	T4pLz1A+Q8qa1vGuZIpwga4p7kxtF8M31M1AoLwP0kjTZdZAD7u7dMjgYC3frmzYxoMCSAtlYoTqm
	HmOtFzV2vTh6Gw0JdHfkRnChqPb4zpX3F9kdaTH75TTtgpH94HOiw4avpbVW/DKPrwvEhI43yQ8a0
	1WilImhw1NnX31r4tTXTQJsSXGnC2iVJUcvQN5sxAOtQOVlV90F/dUjCmnnYrH95gaA9xcKwzSn8w
	0nFc65kALNrOrkuT/i4W9QW6aoYrYpD0re6Gp0Oio4MyYzf6izXQUv1+x/s2iebFDfFHVq83hKGVO
	90R4hFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTz-000000038Di-0dho;
	Mon, 01 Dec 2025 08:42:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTf-0000000384S-1i7B
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 08:42:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-477a219db05so23756645e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 00:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578504; x=1765183304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97C/Ev0rC6JcGUG0mR7bjVxQO49skG60GnX/roDGMIg=;
        b=XOWMUaux3i4nJLs4PStZ1Qy1v877Yx3Wguf+DvNZE//FRbRSih8hinH7cKsQZQLYa4
         n6kNeWsU1GVLwKWCnddoCR7WhGZbmwMTkpBmuuPR3VfyuDDhSvUnHyk4x81BYa/sQ6FD
         gly3DMIrWbApTQQRNGzAHPnpZf99b6LgIUsip+vE7DAywleknmrMW2hkaYoWBDhVAHRJ
         bFcLxAlKr2Q4x7iqXk+HUTqIP6G9Y+d3K8Ww+umbnt1h+TyPtOxJQLCbFkt73OaDJyXa
         SzVCu5prxSjnwkdsLEaUarUNsl9KSGWZUVkUpT4U4FjBGQT8bsT9uBkNNTuK3EhjQtAY
         FrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578504; x=1765183304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97C/Ev0rC6JcGUG0mR7bjVxQO49skG60GnX/roDGMIg=;
        b=FA5Kjsg7v+X1XGc5WqwE+xU2XG44WEjDFHgp8hxAVx7NXC/eG/L9EI27PaekFd8qGA
         q0LQleWILUUecqjs6SZiGZ9e/6cJIfP3tL2f7k7GsdoV2mvOeVQxHjdEjvoUHrVepNTw
         T6SHrZAijtRsBpkpVIfTu24GUg6+6ONB5f536ITn6hjcHugQi713L5Qw6rXWE3UDqTBT
         h+rZhO2oSphu8NXpR7tAguVxTg0e/FcPjptgSAq5sXcVF4w6lnHkNIRHYL5o82Mp2h9X
         idJ6UlfKFIxvOMW5Ekl02C9JTSU5Fq3oaFa3z3adqbRfqKpXSa2pmhuS33dlsiAB++/W
         kwCw==
X-Forwarded-Encrypted: i=1; AJvYcCUm/zHbs0ieIk6TVEAvI7fKcW+93rTCuTJRieNSU9KHZRd58isiAP/t1eKfz18XTFDayf5dOg+77yd2IZDq+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRzIE+JEvebCh5vf+HzrvM6w2/MIkUMavsPth5o3Nf1U0SwG+z
	W5jYfUbRLRYAqVihIZx2YL+Ur9QQVIHjXQwEghY/48z54gMc5QjCKJbS
X-Gm-Gg: ASbGncvU13aMixq8SMZyEnvq9VwU41cDkpCQ++uOyoqeKhEE0xodns7HQM6aLthvDBc
	9bLnQqdINI8e12Db04UqaVs6wOpHfGVFJLyjn4iOLD+RparxEvjiQf5UdPH1wOAXuH3Dn3miDnh
	1e1PdBL1UpmNncES9ntXlx7bKxVseSAEW/ggqts9026NGcR83523PS/kKNv8MbGMFplu1ukBjd0
	jK27CivGVBAHHP+YLmgYTsun+0yDL0WzPDwEu7Qwp5SwagWCSJ4+Tz4GnNbCIZUjxfFDui+WuKx
	p/suBx9XVUg82tfce/T84UL2IleDLXFUOdYymazyFZ0VPmPiGt5o7Y7Z8VwO977WRP7E3vWgLtB
	qYZwRW9Iv3LKSyrYbs2ueuWjgsc2AYCgufFTgRraGzHkoFXA/U2KbIqZxdyRf8XwDwlMYwGrw9B
	DqEFF+g/oTfS7NMOipIRU=
X-Google-Smtp-Source: AGHT+IEH4NM/QZPkR7gSqqML8vC0a2C+GrElrhCzDKUMsoc7T3w5nfVWTh1hYMq9aVozC1eD1dOZYg==
X-Received: by 2002:a05:600c:3590:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-477c104fc20mr429686755e9.0.1764578504373;
        Mon, 01 Dec 2025 00:41:44 -0800 (PST)
Received: from owl5.. ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm24186087f8f.21.2025.12.01.00.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:41:43 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH 0/5] Add support for Ezurio MediaTek platforms
Date: Mon,  1 Dec 2025 09:41:35 +0100
Message-ID: <20251201084140.376058-1-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004148_522145_1EDE5D22 
X-CRM114-Status: UNSURE (   8.56  )
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

This series adds support for Ezurio MediaTek platforms called
"Tungsten". It includes support for MT8370-based Tungsten 510 and
MT8390-based Tungsten 700 SOMs.

Regards,

Gary Bisson (5):
  dt-bindings: vendor-prefixes: Add Ezurio LLC
  dt-bindings: arm: mediatek: Add ezurio,mt8370-tungsten-smarc
  dt-bindings: arm: mediatek: Add ezurio,mt8390-tungsten-smarc
  arm64: dts: mediatek: add device tree for Tungsten 510 board
  arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 +++++++++++++++++
 6 files changed, 1523 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi

-- 
2.43.0


