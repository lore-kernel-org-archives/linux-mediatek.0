Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D228C5AC80
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 08:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JNvAhMakBMCB2Za5yQlirrHhgtFAds445Zn94S2EPWw=; b=uq2uoQSi641zC/SqMOZvM/KVLB
	ZO5kMlulnvjbI8F+6rBfeNyeWgiAjAtSS8xaWZ2HB6G39BhyEuW1EcSnLFvgkoBrMGouLjv+zfCk8
	Mv/PAHk57ia3VmWTYgsVepj9kVyq/sXOU+d5dXnPmFsa/BfpoFJLYH0vA11f//nLOZsPoXik2wtq1
	IUAgKKjEwQjrMaBV2NjBtzszMYXT4A2Zvvz0GlfbYawk076MLVcLxXon7bEoRDkcTQHfaTlfP+jFV
	YOcs3O7fSv1vxbWSrG4b+eVI6fTP02X7LLjELo/CrYJn0LjdLNn5TJ8RuBvpgtUE1Hl9ac9xYyEK5
	3cv6fbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsyWz-0000000A51f-396q;
	Sun, 09 Aug 2026 08:05:17 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsyWw-0000000A51F-21IU
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 08:05:15 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso545891a91.3
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 01:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786262713; x=1786867513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNvAhMakBMCB2Za5yQlirrHhgtFAds445Zn94S2EPWw=;
        b=k8kaWJ8vhVIKnWybcjcLQzPqn2cHuwJMKZMjdTDEF/lF6doBZmdSFv4lNTcL3v2CSC
         N6LZXjorJnzYye6gqTZxcyMecI6jOOv06pv5fAwlhM3QfAISHri6IqjRHGaUVZbpyzYN
         quhqz6s4bwp9XXWXrgfCP6Mvcdq0DfkTgBR/nDBxy2KsezpvLoIWFh9CV71BlrpsA4nB
         3YR/uG3mZesaIn7CfRRtcFi2hpYE/4GteWST74Td9P7MqCG9nT/wdxErR0QCUVlm023U
         zWpXpE697/CgJy/HTItGyuAI2F4qcHgUvXkjEQTSaz06JnuBaZjDuiEKX3QUVMSPPkTR
         P3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786262713; x=1786867513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNvAhMakBMCB2Za5yQlirrHhgtFAds445Zn94S2EPWw=;
        b=tFhzZdX3/qk+O7HlLH38LEVcywFoVCdX/CrCHjdM8+sw9SolnvAw19znIlOvLfD3ej
         Au7BARllyIbo3gQsQXVfv63RzukSZrlpZod6fsBTQcUe++Cmwyat3Z1n74b4rTxV3u2/
         IJgBUrAU2gTQKCaYUM0pX3CTfA0uSj5fbah9K0TnVTl/dOUCQkg1+GNZT/EozX//SxnA
         c/FoGqLgZQKx9UVPM4eSPTJRd/w/cioZo05Zaff9/7h8bz0Vc8a4w2CTRedvjkCQrf6+
         MLB6LeaNCIDa+VicfdzFLJAs5X4TknpG5LrsRhgDb1NIUwHxv2BnnMq3HBn6kc7Lt6H2
         MhQw==
X-Forwarded-Encrypted: i=1; AHgh+Rrwk2/EJhX/f0V5aD2MYavInzTVgMhnnq8v7KvTElw/c0GuR1TbjEcfb8NcufXIXifS3TPu1ShLlyfebRhvgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcA6Myb1dLCrnaZWNMHDeaZW4AYmhZaxoW9Vf0PhhS9r3rQK5v
	+txdMvbdKI8ciToADrZ+AyfipwQGCXg6+F8YfRRyvc3nSoAyRaQqwnmi
X-Gm-Gg: AR+sD128l3nvP2TMxHAeP5xxrBWBHslP9iqLlBvnT5OtA9TK/t1hShmCJ8y6rN9fRTa
	brWShwTmdOVmBIxYxSUWeqO8qrzmmxy5vVKE9PQqwGq2lrVz5sfBa7MtEfzCf9rW788VYraatcc
	kTWYfwrcBEaDx22cZuoIS7jXJMTxW3IDJXtjtTZrp4Fcm1KEGPWD0tjahp5Hg294Q1x4cFXu/T8
	2u6c3+ZRkGFKCj2+hEhIX+allDmqYot9pVxQsCKVhmN6ezhQqEryYCR43nswln+1FqPAEbMiScY
	TZosyK7QvdGhBvtLO200keJHzjumQULP5cr8HoYde4+hkmOkoPveP4kvp+k/eN3HtA+5q66knyi
	J8wIj8R/1AVTbPRpoxKBiYYsaTZsn+/Z19YH2vvHeCp4WrZJXcj5fGPVxHh11N3m3d+T83lgewz
	a7o6hGbLGrwvuVt9jD/ZaQryxzLahcyOMsZSc8L8fMOD9Lj7sW0fIx/mj+nHLpNm07iA4b
X-Received: by 2002:a17:90a:c106:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-3909d8d5993mr21121164a91.16.1786262712632;
        Sun, 09 Aug 2026 01:05:12 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14101b7b39bsm23315598c88.14.2026.08.09.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 01:05:12 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
Date: Sun,  9 Aug 2026 12:04:57 +0400
Message-Id: <cover.1786262697.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_010514_567951_7B7D2BAA 
X-CRM114-Status: GOOD (  13.46  )
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

The EcoNet EN7528 is a MIPS SoC that uses the same pin controller and GPIO
IP as the Airoha SoCs, so it reuses the shared driver code introduced by
the split into per-SoC drivers. Its register layout differs from every
existing variant though: all IOMUX mode bits live in a single CHIP SCU
register plus a few spill-over bits in IOMUX Control 3, EJTAG has its own
enable register, and every pin configuration register is at a different
offset than on EN7523.

It also differs in a way the shared code did not model: only GPIO0-GPIO15
are wired to the interrupt controller, while the driver assumed all
AIROHA_NUM_PINS GPIOs could raise an interrupt. Patch 1 adds a
num_irq_pins field to the per-SoC match data to describe that, bounds the
interrupt callbacks and handler with it, and feeds it to gpiolib through
gpio_irq_chip::init_valid_mask so gpiod_to_irq() fails up front for a pin
that can never be an interrupt source. All existing SoCs pass
AIROHA_NUM_PINS and are unaffected.

Patch 2 documents the binding, patch 3 adds the driver.

The series is based on linux-pinctrl/for-next, as it depends on the
per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
phandle that landed there.

Tested on a DASAN H660GM-A (EN7528, Airtel), booting OpenWrt.

Ahmed Naseef (2):
  pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
  dt-bindings: pinctrl: Add EcoNet EN7528 pin controller

Benjamin Larsson (1):
  pinctrl: airoha: add support of en7528 SoC

 .../pinctrl/econet,en7528-pinctrl.yaml        |  190 +++
 drivers/pinctrl/airoha/Kconfig                |   15 +-
 drivers/pinctrl/airoha/Makefile               |    1 +
 drivers/pinctrl/airoha/airoha-common.h        |    3 +
 drivers/pinctrl/airoha/pinctrl-airoha.c       |   33 +-
 drivers/pinctrl/airoha/pinctrl-an7563.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c       | 1204 +++++++++++++++++
 10 files changed, 1443 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7528.c


base-commit: 87e787e591a82b9b324aa0968795b256f789d287
-- 
2.34.1


