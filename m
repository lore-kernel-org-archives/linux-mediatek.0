Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CDFC79F99
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k1VG1pmcGZNdUQpQRzwwsj0V+0yWbJ5/S21pa91tRek=; b=subox6CjFG70PmdTgoIwmEAmuY
	vOH4R3NJu2DXXVcFqum4K187Lv68RQwdH61RMqbI+WSyObbjESRtwPr6e6mWiAFU+WNj4exVqRjZS
	bGqiHLVgWEngrzETkcNRx0iDR1IyyXk8j/dmZL8ZaIka1FBRve4CicpAwHmXkb4ARvFhkQ98Gt1xH
	ZOWEDbjDN4CeFNExXf2ay4/1bedrxZOypB3DpxbJ0JRn8MYYWGzNBk5WfTCbL1u0HBgPKXb9lEuaG
	T22D5KSYtTgZ2jdJBxWNcy0BwTpMfFQYNC4Su4PB4LSXqNF3ZUY3YmF8Zch1iFYMjAKfvGoy/qryY
	iUApfK6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zrw-00000009roz-02uw;
	Tue, 08 Sep 2026 17:44:28 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zrt-00000009rnT-13PP
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:27 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356256so637418f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 10:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889462; x=1789494262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k1VG1pmcGZNdUQpQRzwwsj0V+0yWbJ5/S21pa91tRek=;
        b=jRhmr6LweP16ynKLk7iDO4swwlFtaji2XLyNQoXMqZEMR85Zs6D0xEr8uI/XjT9+pC
         RCRC96YjHwt15v4ln03wfoIi9Eh4ml5CL7KG0fOT9+fUOjy9rhh0GXGDYN6awZ3kQc0U
         rv6yWOaULnAi4cXWM3Ho0Bv/ORVC74FOKYFOR8EzK/MdaTU0JeLHCGWAxC5y/nhWCv96
         F+lXPbJdStVdHnnuf3yw/EU7MfzJyRYEJvgUy3eRcwNFr6ouPVmadLkHPLFMn3puuA1X
         SpyGEdXzE10KPLHFEFgmhvJTZAkmRpn55vEDBxDyy/yO0zunue5qVKHGMAZ/C8XdJ8lI
         gyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889462; x=1789494262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k1VG1pmcGZNdUQpQRzwwsj0V+0yWbJ5/S21pa91tRek=;
        b=HFWdnHNagEk2mA6XLvYiyMecmW9ELZkKn+t/gwnJ/+Z35eYHaQQaWQ4AkAJtqLz9Bq
         eP6TO0IZQP9E9f58NSaf0tvwwZnGQNhxQEI4bgjSwshbOJbJOtv4iorRzMSezntmGPW6
         m7i214852sRTeCYvmYnsiXXCkA/PRNlAhhS2vPy7Z9BlO+hAPDi0ciboaP5e5F0zBCR3
         r7gEFILyTqCd2/wb9f5XSiSAawoL5ZEsLwrFgGbJZT1WeuC1g1RE6Xkflg29Jp9tL1YH
         XQpwQQ4Qe2YNsXRMLqMDxE+lz37ILZjqTN8M8yM4Qza8/KHJwLPSb4RQRx7mJ5agW46B
         OBsw==
X-Gm-Message-State: AFuF++lpqvF2p9eXTlaBEdsxxA5ttUNEEKe/hsaDqUddOax5dVGdSqbL
	rl2g77v/63dAelBYd5BbElKbtwcpwtqhpFHed6+zDnl1sRueVDurH7fjBEWlEF8r
X-Gm-Gg: AYBFou2sfxF7hwre8pAU6D62QyIwizd+Pru+X44NtYBYiyze+bi/S7yaowqLn0fL9qs
	OP4pdPDZYfKZ2dO08nqBuMsaKFxujLWqtS2F71i86/Crm2rmWSd3h9eNAf1TMMwEFckT19pZdlP
	HoUMfpM44MZCJT74rM1MUfcpCO1A1j7f+bry6tJbXWNOcvQfGLD+sdtb+wtUR/K+UhUlZvogzBp
	9sM6+PZ1R/RHUAMi5F5pjFdMEgueVgNU9K+8PFmrhRjwLh4fCk4qTKgXY4HdOjS7uYTqKuW6ceF
	LLhXte90dgcQob7NPGHkxHxRADFpMmau4F2YoMp+7WjnYuhOu0StJPaOXXAsNSfWazU2ZKzdX3l
	ZNVhO/bO1SHs/32XFSujZUkobwNAUfpuC3fvVJHePvUpVLCBr4yxpErTDV/rvUT+2dZbY3b1+8N
	Sa4OqmPjm986sAXlvYtMSR9shkUXWgJ9xQ3Do/m3YeKE9EUqPR+OvETU5G
X-Received: by 2002:a05:600c:4ece:b0:49c:eded:44e with SMTP id 5b1f17b1804b1-49d175561bbmr82285015e9.7.1788889462025;
        Tue, 08 Sep 2026 10:44:22 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:21 -0700 (PDT)
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
Subject: [PATCH v5 0/8] Add support for mt8167 toprgu and mmsys resets
Date: Tue,  8 Sep 2026 19:38:27 +0200
Message-ID: <20260908174259.9009-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104425_318630_2827B368 
X-CRM114-Status: GOOD (  20.61  )
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
resets yet. In the first two patches we add support for the 12 mt6589
toprgu resets.

However, according to its data sheet, mt8167 has 14 sw resets instead of
12, and its reset bits are non-contiguous. This is currently unsupported
by the mtk-wdt driver and it caused confusion between reset IDs and reset
bits in other mtk SoCs device tree includes.

Therefore we introduce a dedicated mediatek,mt8167-wdt compatible for the
watchdog driver that describes correctly this SoC's resets. Since its
reset bits are non-contiguous, we add support for a watchdog reset table
to accommodate the distinction between device tree reset IDs and the
actual bits in the registers. Code is inspired by the reset table
currently implemented in the mmsys driver. There should be no effect
on existing sequential wdt resets.

In the last three patches we describe the mmsys reset table for the SoC.
According to the datasheet there are 28 mmsys reset bits divided across
two adjacent registers.

The series has been tested on a Sony PlayStation Classic Mini, on a Xiaomi
Mi Smart Clock and on a Lenovo Smart Clock 2.

Changes in v5:
- Dropped the binding header for mt6589 reset IDs;
- Moved the definition of the number of resets for mt6589 inside
  mtk-wdt driver;
- Separated the mmsys related changes to the last three commits.

Changes in v4 [4]:
- Squashed the reset IDs includes together with the bindings change;
- Added support for a reset table to the mtk-wdt driver. This allows us
  to decouple reset IDs from device trees from reset bits and lets us
  describe correctly the non-contiguous reset bits of mt8167;
- Improved explanations in commit messages.

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
[3] https://lore.kernel.org/linux-mediatek/20260809160643.33991-1-l.scorcia@gmail.com/
[4] https://lore.kernel.org/linux-mediatek/20260819101853.44681-1-l.scorcia@gmail.com/

Luca Leonardo Scorcia (8):
  watchdog: mediatek: Add wdt/toprgu resets for mt6589
  arm: dts: mediatek: mt6589: Enable toprgu reset controller
  dt-bindings: watchdog: Add compatible for MediaTek mt8167
  watchdog: mediatek: Add support for mt8167 toprgu/watchdog
  arm64: dts: mt8167: Properly describe the SoC watchdog resets
  dt-bindings: reset: Add mmsys reset ids for mt8167
  soc: mediatek: mtk-mmsys: Add resets for mt8167
  arm64: dts: mt8167: Add support for mmsys resets

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm/boot/dts/mediatek/mt6589.dtsi        |  1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      |  9 ++++
 drivers/soc/mediatek/mt8167-mmsys.h           |  3 ++
 drivers/soc/mediatek/mtk-mmsys.c              | 38 +++++++++++++
 drivers/watchdog/mtk_wdt.c                    | 54 +++++++++++++++++--
 .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 ++++++++++++
 .../dt-bindings/reset/mediatek,mt8167-wdt.h   | 21 ++++++++
 8 files changed, 157 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-wdt.h

-- 
2.43.0


