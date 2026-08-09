Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18617C5AC80
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gNSsiXJWRtJEnKo3j2+KbnfQcpFMSwgfHd0NV7zL7z0=; b=oJmSc/HBINGvyaEd6Ws0b4Nbft
	voaO810dVU4CtmjpMKVpMLn4ec8JXlflihO31SEOMA+7yB4H3UzNzmvZczowmgJ9leyX7799rTm3R
	ZUzhTnOU2h4ty0ufHx8BdQ73VsyO7mswLJ4HCKU88iSU5wfPHFJwiZyiY0yt3yElxalrU1ao91/k5
	ZLGWrkKNyVj4Le/HWnEr4QppRwmI/pZJ6Qe9ZNgLxtJitQ4sJE7wG7i0azoExQZ1J1uv8OfVsqlkv
	jNU5LbxOx6tyYzzDbgtQLonMv6rCb5YWI8xoBjK3ktZ3Sb0vRs53Nx5syLRSwHmSvV8TBfMNwxOSj
	N8QySpDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63I-0000000ATAR-2XJp;
	Sun, 09 Aug 2026 16:07:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63F-0000000AT8t-1Hfa
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4955de8797cso6379525e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291623; x=1786896423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNSsiXJWRtJEnKo3j2+KbnfQcpFMSwgfHd0NV7zL7z0=;
        b=e9fLmvOEteSauRkvpadqQrEzcWVsRx/T+svACRkcEFiFMF4xPDMZ5BnLu9tS18YsDq
         vw3yzrJwJmKcotIpuJnkVGGk1dgNVhfHxq5vRpJdceYNR9DmrTArlH9CKPTYCq/XFDX5
         muF5naWBaTjbsrlSaHV/myd/WxklabXS2fbRV9plspC0GpyQLx48bMd0wdyH6uDzHrEZ
         AEPU87kVYCv7U4WFvqKK/aZP7QIKwQItkG8jXA736Hyjke5+VwToPdjiEeH1/1tTNQx1
         i5Awh+/N2gjqIhw2L6oPTocXc0zgmea5q+2GE2lsKW7YiQ2VNoSBvpmBdgVYTZ+f+q65
         CqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291623; x=1786896423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNSsiXJWRtJEnKo3j2+KbnfQcpFMSwgfHd0NV7zL7z0=;
        b=a1YzikyFp0Omn74+0jQlWEfzrZiaJ6U9phLKi6/d8ham3g5HEi/+RSTkj1butCUx0f
         XuqiNsC8g1BnS4YOyeRlOO0XIrqiaWLoEAVACK6azBXm+dyP1/NuIYJyJOIgHXQRVUcB
         lUs+bzT8Zrb8RWS00MZ9lyP9sCcYj+3eM1lLLVefwuJtwOy5C03DkNcSTQNfF8WftmsB
         /nTZYEC+dybRnBWHg+sS3IlLOjYL8yKq6xT/slTCmczEBxfiVM2MzmDTsxUIegMiSOqF
         qeek34HEcFyrgOF32t+7A21phT5LEflmvAyxdAnwy9pzaySwfF743nnLEw8t2fZKmbSG
         z+sA==
X-Gm-Message-State: AOJu0YwcPp5jrGTqKMANPJz9NK9132Xch3wmIs/5dNRcWbNdywkFDUqI
	9CRf3XMeTVE0PbuTQdT7z/D8uxVwAUlYpf7Wa2tlADZCKIQCI+fQAQ0gjvVLOpGZiT7koQ==
X-Gm-Gg: AR+sD10des0DkEd+WKJ7HXrabbNbGN7mm0WW5OQj0vFEcat+Q/Zb11kMyiKonAdEGEb
	25Ueibc0FrCED13kdhqoNgrPMTa3ml6U2Q1ZUUSV5xYO/B9Z/2nZeGr08v6c0myowVzxWWvnfA5
	v/5U8yGMU199bhIWB5Q5jKYXCNWW1XEz11DjcxxS6toHUsE1YMXriyls7bkcw80lgMdBgOk4vGA
	ii1vvHX/0FhxigVScaBCF0QnSvwR9U4eKX9SZTQz6epD+SLz/osXLjBh9P9vj4sFlAlDjgy/yUa
	vqjm6ZzPB5PBedVYHCFvDEMtvOuSI6UU5WI+mR9zaGz9NI/RdXksCX3w4fBPxOLvlb2+2iZLfTz
	Gp+Z+yr+tWbtNbPQpe4c36wqpRVW7JHb4r1rtIyWDmeYcLUQ0naTvin3Rl6poo90GiLRGAFyNj2
	sks5qoWjzNPpWkzwlXjDCwijuzQBaC7kzRY1PZWDL+d2WWCIl0cOgwkA==
X-Received: by 2002:a05:600c:4fcb:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-4995e084875mr196750445e9.7.1786291622542;
        Sun, 09 Aug 2026 09:07:02 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:02 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/8] Properly describe mt6589 and mt8167 toprgu resets
Date: Sun,  9 Aug 2026 18:03:24 +0200
Message-ID: <20260809160643.33991-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090705_388990_91D3E8D9 
X-CRM114-Status: GOOD (  18.07  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt, which does not support toprgu
resets yet. This series adds support for mt6589 toprgu resets with bit
definitions obtained from Android stock sources.

However, according to its data sheet, mt8167 has 15 sw resets instead of
12, and its reset bits point to different subsystems than the mt6589 ones.
If the number of resets varies between SoCs, the watchdog driver becomes
incompatible.

Therefore in the first three patches we improve the description of the,
resets for mt6589 using the definitions obtained from Android sources.

Then we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Also while
we're touching the bindings reset header, we add constants for the MMSYS
resets.

In the 7th patch we add a node for the mt8167 watchdog referring to the
new compatible in the SoC dtsi.

In the last patch, we define the mmsys reset table for the SoC. According
to the datasheet, there are 28 mmsys reset bits divided across two
adjacent registers.

Changes in v3 [3]:
- Improved explanations in the commit messages;
- Added the #reset-cells property to mt6589 watchdog node;
- Included the mediatek,mt6589-resets.h file in mt6589.dtsi;
- Included the mediatek,mt8167-resets.h file in mt8167.dtsi;
- Moved the mmsys reset table from the mt8167-mmsys.h header file to
  the mmsys driver implementation.

Changes in v2 [2]:
- Sashiko pointed out correctly a missing entry in the mmsys reset table
  in the last patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scorcia@gmail.com/
[2] https://lore.kernel.org/linux-mediatek/20260717163959.714561-1-l.scorcia@gmail.com/

Luca Leonardo Scorcia (8):
  dt-bindings: reset: Add mt6589 toprgu reset IDs
  watchdog: mediatek: Add wdt/toprgu resets for MT6589
  arm: dts: mediatek: mt6589: Enable toprgu reset controller
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  dt-bindings: reset: Add reset controller constants for mt8167
  watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
  arm64: dts: mt8167: Properly describe the SoC watchdog
  soc: mediatek: mtk-mmsys: Add resets for mt8167

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm/boot/dts/mediatek/mt6589.dtsi        |  2 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  8 +++
 drivers/soc/mediatek/mt8167-mmsys.h           |  3 ++
 drivers/soc/mediatek/mtk-mmsys.c              | 38 +++++++++++++
 drivers/watchdog/mtk_wdt.c                    | 13 ++++-
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++
 .../reset/mediatek,mt8167-resets.h            | 53 +++++++++++++++++++
 8 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-resets.h

-- 
2.43.0


