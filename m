Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BDACD4F25
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4+ZN/ez4nROwuYUMbT55lLWK9CfEBz3lhrRLyAE58o=; b=LXTPhJBx0Nd2aS7KtPxlwP2mt2
	1KRvhwQKljw3L599/+utmuTCJbcvaruyjlEd2ar0qL8DV0OB2FPw/U1a+HrxJ2ZDajRVGq+4ZOBo6
	SmDQVxW7mxRGZgAK2uQPdZ0nn5cLBUS41MgVq2uFrhYF6lOBfHhcLixcy5aeY/8spzOIWwRE9bSp/
	r+pgxugq/Fc/v8komJC57i5tZw5NlcZKJKIfpY94GzaAeJmChKmEiOIVvNs3VFx53PaCAg8pQNLnC
	8mu62YHWfsGVvN8iFxjmTwYRuo2Z2zCH3t6ZzuBcCbfVC2EPdm5TcDBRhnbTIp+A5212qSZGnGGqk
	wV7gY3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAN-000000051dy-47Om;
	Thu, 14 May 2026 09:15:39 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSAK-000000051c0-0QSt
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 09:15:38 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c8021c8c42fso3360160a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778750135; x=1779354935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4+ZN/ez4nROwuYUMbT55lLWK9CfEBz3lhrRLyAE58o=;
        b=lLmeOHGMZc3WLHUAipRC0WWjepTGN4aZ2tFFv+bYkp8aaVYJau39c+hxwoHILQ2EAc
         y/7Nh4R4fSj/MlIncz01mF7rCzYU7dfQWyXx9E5fUkXws13CLSI3XavMtj097olyzctz
         pP0Bpg4aVz9ZyjUQUKKSA5FR8aMvuS9iItieA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778750135; x=1779354935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4+ZN/ez4nROwuYUMbT55lLWK9CfEBz3lhrRLyAE58o=;
        b=GD8qlFwuzGbUsSRiR7WK0qO5LcJ3sotKFMYi1hfa8IyzfrL9xOGZHvjT9ye91+OJAg
         iwtUWVtNrODnTgGt9UDzMbSOJjB5+QEQPdba9nhdh9/9EXh9W7ntyKVtSzarzBniKy3G
         V2yrW44arhNoS0oF4FpJPnmPf/PlrBeh+85PkPR0gwtUv/raGg8HsNoA9IsKqRGOCO++
         TDy+78YdeXAbfR2Z9hpntACM0I6lqYgYV6TcZQE7RU6SH+8HWw2OzlQqF81ZM1ladgsw
         np5CyYXmvUWXwxYD/ZZv74s/L7FXW+FBzK1tuHadm1wOAtJM2luOIrPSD9oqs5bA925s
         t+EA==
X-Forwarded-Encrypted: i=1; AFNElJ9l6hSXyUZLJgB/+Iw94HgugLjspEqOZtO8DRFDPPrdFKOy5P96dT8HhoHAQV7fFUMx2txGh167ZiXJAVNhBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyceX6MIlmWjnrTVq+GH4Q4yeuMPsF3vCkcCgpA374LqcUas34S
	fp5vV966CkYqNzyZl4g//nzxY9qRTgWtr49LSsFJI0RaOaf6pMHTgwdBtSV0l6p72Q==
X-Gm-Gg: Acq92OEbgL9mpOhx7fkiOS8c988t5/Ex4LCvOjw+KgUR2xOhpaQTJhRyT81OsxgRRpE
	Wv1WGWJKENxO5tqquRmES+D0vX6txk3dQsOkOM48eOmS3c8/vj+3KtFU1oAU4eutitiKll0To+d
	6ta+QXnLliYw2Vp1T/X/XtKAQxrkwv84SF6C+YoxgsrO+62sdRdh3PLfAzsQVpO1+kj58KWGsdp
	XKT+Y2Ncyat4LCh5OrCuARpTQgDS9wmZbaHqrL1/S1czVxsxhs8E4G68BhjRfihHo2JMnXVMS0d
	DkYmrA29v9AyrqTqnOK6WDrpj824XQqkaMF18LAwsztDU9RJSaVWRcL3xgyQBtu6iMiFAB6vwpb
	anpzJ+6YIGgq2og9QrI74vj0fwuZWNOdzT9bht/4deMY6+oBFa8goxlriq8V1puypgc+VVJTYR7
	xaxA6c4WcP1MawcX4aOlR185Ba9pEj4TrXcKwGNjg9PPHGQjP9abYYcWEEPJjhhulibUYPVGDGx
	C/8r6iP
X-Received: by 2002:a05:6a20:5497:b0:398:bda8:d8cd with SMTP id adf61e73a8af0-3af7fb74ea0mr7618829637.7.1778750135053;
        Thu, 14 May 2026 02:15:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0fef5esm1650768a12.15.2026.05.14.02.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:15:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/6] regulator: mt6359: cleanup and add supplies
Date: Thu, 14 May 2026 17:15:13 +0800
Message-ID: <20260514091520.2718987-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_021536_188095_F0D9576E 
X-CRM114-Status: GOOD (  20.48  )
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

Hi,

This is v4 of my "MT6359 PMIC cleanup and add supplies" series. This
version addresses review comments from Sashiko.

Changes since v3:
- Dropped duplicate 'va09' regulator from 'vsys-ldo2-supply'
- Added ending match to regex for deprecated vcn33_[12]_(bt|wifi) nodes
- Updated regulator DT example to use proper vcn33_[12] nodes
- Changed vbbck's supply name to 'VIO18' to match vio18 regulator's
  default name
- Fixed index off-by-one in error message in mt6359_sync_vcn33_setting()
- Added check of return value from mt6359_sync_vcn33_setting()
- Link to v3:
  https://lore.kernel.org/all/20260512085358.1693208-1-wenst@chromium.org/

Changes since v2:
- Fixed vsys-smps-supply property name (from "vspms-supply")
- Collected reviewed-by on patch 3
- Included Lee in recipients (sorry about that)
- Link to v2:
  https://lore.kernel.org/all/20260429074113.3720271-1-wenst@chromium.org/

Changes since v1:
- Moved regulator supply properties up to the PMIC mfd node
  - This requires moving the properties to the mfd bindings
- deprecated vcn33_[12]_(bt|wifi) regulators and added vcn33_[12]
- model the deprecated ones as downstream to the new ones
  (vcn33_[12] -> vcn33_[12]_(bt|wifi)
- Handle internal supply of vbbck directly in the driver, instead of
  specifying it in the binding
- Added patch to constify data structures in the regulator driver
- Link to v1:
  https://lore.kernel.org/all/20260320072440.2403318-1-wenst@chromium.org/

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6359 PMIC.

The MT6359 PMIC is similar to the MT6358 and MT6366 PMICs. I've done
cleanups for those in the past.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 drops the restrictions on the regulator-name property from the
binding. The name of the supply rail ideally should match the design
schematics, not the PMIC's output name. The DT should be free to set
whatever name it needs.

Patch 3 deprecates the vcn33_[12]_(bt|wifi) regulators, and adds new
proper vcn33_[12] regulators. The two *real* VCN33 regulator outputs
each have two enable bits that are OR-ed together to control the
output. This allowed WiFi and BT stacks to separately control power
output without coordination.

Patch 4 constifies the data structures used throughout the regulator
driver. While not directly related, it touches the same context and
it is easier to include it in the series.

Patch 5 adds the supply names from the DT binding change in patch 2
to the regulator descriptions in the driver. This patch has a whole
bunch of checkpatch.pl warnings, but I wonder if it's because the
context size for checking complex macros is not large enough.

Patch 6 implements the changes of the DT binding change in patch 3.


One part not yet covered in this series is the removal of the *_sshub
regulators. These are not actual regulators, but a set of separate
configurations to be used by the low power sensor hub or embedded
controller. How these combine with the standard set of configurations
set by the main processor is TBD.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (6):
  mfd: dt-bindings: mt6397: Add regulator supplies
  regulator: dt-bindings: mt6359: Drop regulator-name pattern
    restrictions
  regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split
    regulators
  regulator: mt6359: const-ify regulator descriptions
  regulator: mt6359: Add regulator supply names
  regulator: mt6359: Add proper ldo_vcn33_[12] regulators

 .../bindings/mfd/mediatek,mt6397.yaml         |  50 +++
 .../bindings/regulator/mt6359-regulator.yaml  |  70 +--
 drivers/regulator/mt6359-regulator.c          | 405 ++++++++++++------
 include/linux/regulator/mt6359-regulator.h    |  10 +-
 4 files changed, 348 insertions(+), 187 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog


