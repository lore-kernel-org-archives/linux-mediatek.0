Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD05606A6B8
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=160Wrihd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4kS87YM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=n+j7JQq7bAOQ9NxHtgY5eV6al7EOgUbRC6r9lYqsMuA=; b=160Wrihdsm4OnS08DLaILyZL6K
	5169GGrTNgDuuuuMc21kSl/4iVMOBn7ik2lcE1/0wDEfhyB6wldEjWjBSCU3/RVXTh73ZFgioa/Zu
	clRDEcLxjHIn7lTlXqlywYv+lPSKcBlciDYAjZR8fX8heBXrTdHqbAluHZ+fU0Flqnb9K1o4y3Ne5
	Ywm8wrXAPz2V+rYbfKZyLkQ95JReODmfrYEqFT8XrwF2tSh1us5a2//0qh+Sa+9+t+S7yWmer6u5S
	L1P7/CXvCv6nYO5KEJBPoaWSfQpB0gNj4e3skaTqO3QLCeTksoqIsLlsLoXo8/sM7Qe8YNQmJdFK5
	iF9qdXgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4f-000000036g7-2Ddr;
	Mon, 23 Nov 2026 11:19:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4a-000000036bG-1Bo6
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:03 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so514285166b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 03:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432738; x=1796037538; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n+j7JQq7bAOQ9NxHtgY5eV6al7EOgUbRC6r9lYqsMuA=;
        b=h4kS87YMr18TYFGt6GVAYeopQtrfmUGg5CZwDWh2kJc8L6N7rDUZWBoBQvWzPV2ZY+
         UdyAcJYqUvw6eh8qFxhhZEJdZiRlrtV01CYPeCp5VS1AilBCb41kanb80PcVmRUtZLv4
         NS3IWSVCKyxlgTyIYUfu1HHcMkVLp+6xL9YfBVLMbkncusVYvx1aBbtUrqatQI1lBaYG
         UcgAv8H13hZGIKJJXWCm8cobaUo+5yRoRH8912OFVi8zhIBkr/JxxBDIK3K68Th+4vB1
         RVkaJlfdbg0vO/3QWhdvoxc0YkI2m/cPnPzXqxpaOyjMz7N4Hj4j2BdMnEphOx1d1zRR
         1DiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432738; x=1796037538;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+j7JQq7bAOQ9NxHtgY5eV6al7EOgUbRC6r9lYqsMuA=;
        b=wjIlSSLzNVHPYHFHfzrLQYuIWVw6esBznoP6VN+thbrpUX5VZxv1Q6qYQaVBWISqFk
         QZaKhYn2TSyVf6l1WWfKu1pP23K+AYPBsFpkoQNZOuWxKJ/zSPXMb6o3QUCpiKqd1KmD
         OxFDEFck8R8U0FdMQbJ2fzXMzLKSNYSlyGRcmLfzXbib2ZIDZSu3dW/jwGX+UgjTMM21
         VQTgPU3bH2Rj6/dL/dAMNHik7ZtfOdRTzMEjBXgNEzMddBsIQkkUHsbF1afKzKDFbLe4
         W5LhefImpME5/CqiRpuICs018TowpJfjZnQB2JHFKL7h7NpHrfQ/Fcl5mWsy1CYJUHdD
         bE4Q==
X-Forwarded-Encrypted: i=1; AL+hErHvReKev3P+kvnaNeBWbJHbezf++M6Y8Xtk4b0UZWyG4D6CKo4kt3zPs+WTkeIWQN9KvUJpRSk6D1JTtETAHg==@lists.infradead.org
X-Gm-Message-State: APuU4Z98gJiuK+R4OdFp8qEDVISrIkXPsoTRONI0KPOXIIMYlNtds6hi
	Aey9dVpS3YjVlupRRErrjxRNFRXFffIlfzsekNt01TJldOyE3iEUfCFk
X-Gm-Gg: AZFdTZfNpQud2MUUbRdqIEfNhfgr1vCa/SoW54FxDvZJYRU3qa6v7euw1GtntQl1us8
	jZNOlfVO1/8iM/xf6K5Ywl7Q2LOFY0agedJga0iXBaezP4i42fRgIGZ9oi92+5jBT38mpCPQCZQ
	8PvynDz1rF2muF51tq+Jp9QhpAQ2cwANX5EN8r2SCrGR3K+0BfxsRSMrIvSTJJsiK4gHhiqL6X+
	CheSqmkk41UpuwFSJfDTQcTVBi+dtqRrCQjJFzp4RMN73GshYQZsvaBINHky7asFMGWpIcQXUhJ
	vTTf55A1Xv1zbEGvrYbRu8Se2RB6S/X+fCHMNXjy4QVFqEMU4ca52FHv2+rhnj5PYNE0jjmW6ry
	/yjboEkUDVOfaRgbePDLWTAelTwZB2FrRWfv9JlbuHtO7wLYWdoqSzLn/SkPviwyK5OIe0BjUlH
	Euwd/00Ql4wkjP+Rm4J3W+HWL3cACoiKBWOTWasFLxIprHDMgEUFd2oqHBTdBxFx8SWipkWsmuY
	CywwHp0D2rQoSggOwBPSgQA+ZF6xVz58L2IpsBhNJTy9Y8zJPlaaotAm+JU34FBgoGKo8rZ0Y8I
	0MC5i3RBW8jguzSB97vH9wcoFw/JlTJZ5CBqxrKXaXWbbkC1OGqEiO4VcJpVeowzog==
X-Received: by 2002:a17:906:6690:b0:c4d:167d:dcee with SMTP id a640c23a62f3a-c513aabb216mr686937766b.40.1795432737778;
        Mon, 23 Nov 2026 03:18:57 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:18:57 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Subject: [PATCH v3 0/7] arm64: mediatek: Add initial MT6895 and Xiaomi Poco
 X4 GT support
Date: Mon, 23 Nov 2026 14:18:33 +0300
Message-Id: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12Py2rDMBBFf8VoXRk9LMkypfQ/ShdjeZSo+JFKi
 mkJ+ffKTqBNlxfmnjn3QhLGgIl01YVEXEMKy1yCfKqIO8J8QBqGkolgQnPOGQ1zyAFGOmXdWkW
 5Rs97DuiVIqV0iujD1w58e7/ldO4/0OWNsl0cQ8pL/N4/rny7u8OZEpxpIWolpGkM5RQSjAPWI
 /LXwwRhrN0ykY26ij89Lv9LrYIy2kDPAKwHaR/q15tVxM9zWZtvqmTClGBf21XPd25LT2F2OT5
 ymRGta3AYHLhf7ss2rYeEtIQp5K6yzKI3YEEyD1xa1BaVUig107plXjkHxghdjK4/QrqXzIcBA
 AA=
X-Change-ID: 20261110-initial-mt6895-16ef1b1aef55
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexander Letuchiy <asalde.le1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031900_373303_ABF7763D 
X-CRM114-Status: GOOD (  21.95  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds initial support for the MediaTek MT6895 (Dimensity
8000/8100) SoC and the Xiaomi xaga board, sold as Xiaomi Poco X4 GT, Redmi
Note 11T Pro/Pro+ and Redmi K50i. It is enough to boot to an initramfs
with a serial console, CPU idle, the CPU and DSU PMUs and the volume down
key.

Dependencies
------------
The SoC DT describes the pin controller and the board DT uses its pinmux
macros, so this series depends on the MT6895 pinctrl series:
https://patch.msgid.link/20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com

Bootloader dependency
---------------------
This was tested with a modified LK bootloader that is not public.
The stock LK cannot boot this DT, as its Android fixups expect nodes
that are not present here.

The DT relies on the bootloader to:

 - update the /memory node
 - add all firmware carveouts to /reserved-memory
 - pass the command line from the boot image

The carveout addresses are therefore not listed in the DT, as the
bootloader allocates some of them dynamically. I can describe the
fixed ones in the DT if that is preferred.

Firmware behaviour
------------------
Two things in the stock TF-A affect what the DT describes, but not the
DT itself:

 - TF-A rejects CPU_SUSPEND for about the first 40 seconds after boot.
   The vendor kernel lifts this earlier with a SiP call, so with this
   series the idle states only start to be used after that time.
 - The DSU PMU registers are lost when the cluster powers down. TF-A
   can preserve them (PRESERVE_DSU_PMU_REGS), but the MediaTek firmware
   does not, so DSU PMU counts are only reliable while the cluster stays
   powered up.

Testing
-------
Tested on a Poco X4 GT with 8 GiB of RAM, using a minimal config and a
script in the initramfs. The results were:

 - All 8 CPUs come up and match the DT (A55 on 0-3, A78 on 4-7), and
   CPUs 1-7 can be taken offline and brought back through PSCI.
 - The cache sizes and geometry in sysfs match the CCSIDR registers on
   every CPU.
 - The redistributor is found for each CPU, and timer interrupts reach
   every CPU.
 - Once TF-A accepts CPU_SUSPEND, every CPU enters the CPU and cluster
   power down states, and the system timer wakes them up as the
   broadcast timer.
 - Each core PMU counts only on its own CPUs, and its overflow interrupt
   arrives on the right CPU through its PPI partition.
 - The DSU PMU counts, and its overflow interrupt arrives on SPI 18.
 - The pin configuration of the UART0 and keypad pins matches the DT.
 - The volume down key reports presses and releases, with no bounce
   through the 32 ms debounce.
 - UART0 output works at 921600 baud, and its TX interrupt fires on the
   expected line.
 - About 7 GiB of RAM was written and verified with no errors, with the
   carveouts added by the bootloader.
 - The watchdog resets the board once it is no longer pinged, and the
   ramoops console log survives that reset.

UART1 is disabled and was not tested. Only a minimal config was tested
on the device, not defconfig.

Tool use
--------
The commit messages, this cover letter and the test script were
drafted with Claude Code (Claude Opus 5.5). I reviewed them
and tested the result on the device.

Based on next-20261120.

---
Changes in v3:
- Drop the watchdog binding and driver patches, they are now in
  linux-next (next-20261119).
- Board DT: use a zero-size placeholder for the memory node,
  instead of hardcoding the size.
- Board DT: order properties alphabetically.
- Board DT: drop Angelo's Reviewed-by, as the memory node was changed
  beyond the requested property reordering.
- Rebase onto next-20261120.
- Link to v2: https://patch.msgid.link/20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com

Changes in v2:
- Describe MT6895 as Dimensity 8000/8100 in the commit messages.
- watchdog binding: drop the mediatek,mt6589-wdt fallback, as the
  MT6895 reset layout is not known, and drop Conor's Acked-by.
- New patch: add the MT6895 compatible to the mtk_wdt driver.
- New patches: system timer and keypad bindings, pinmux header.
- SoC DT: add the cache nodes, CPU capacities and idle states, the CPU
  PMUs with PPI partitions, the DSU PMU, the system timer with a 13 MHz
  clock, the pin controller and the keypad.
- SoC DT: use IRQ_TYPE_LEVEL_HIGH for the architected timer PPIs.
- SoC DT: order the nodes as required by dt-check-style.
- Board DT: add the UART0 pins and the volume down key.
- The series now depends on the MT6895 pinctrl series.
- Link to v1: https://patch.msgid.link/20261105210622.523747-1-asalde.le1@gmail.com

---
Alexander Letuchiy (7):
      dt-bindings: arm: mediatek: Add MT6895 and Xiaomi Poco X4 GT
      dt-bindings: serial: mediatek,uart: Add compatible for MT6895
      dt-bindings: timer: mediatek,timer: Add compatible for MT6895
      dt-bindings: input: mediatek,mt6779-keypad: Add compatible for MT6895
      arm64: dts: mediatek: Add MT6895 pinmux macro header file
      arm64: dts: mediatek: Add MT6895 SoC
      arm64: dts: mediatek: Add Xiaomi Poco X4 GT

 .../devicetree/bindings/arm/mediatek.yaml          |    4 +
 .../bindings/input/mediatek,mt6779-keypad.yaml     |    1 +
 .../devicetree/bindings/serial/mediatek,uart.yaml  |    1 +
 .../devicetree/bindings/timer/mediatek,timer.yaml  |    1 +
 arch/arm64/boot/dts/mediatek/Makefile              |    1 +
 arch/arm64/boot/dts/mediatek/mt6895-pinfunc.h      | 1524 ++++++++++++++++++++
 .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts |   87 ++
 arch/arm64/boot/dts/mediatek/mt6895.dtsi           |  461 ++++++
 8 files changed, 2080 insertions(+)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261110-initial-mt6895-16ef1b1aef55
prerequisite-message-id: <20261118-pinctrl-mt6895-v2-0-0728c4eddcac@gmail.com>
prerequisite-patch-id: 68c077b6ff907e42d02115ed9b95bb5349eae7ef
prerequisite-patch-id: b404409a8981e9d462b7fdb6eeb092c69bba50bd

Best regards,
--  
Alexander Letuchiy <asalde.le1@gmail.com>


