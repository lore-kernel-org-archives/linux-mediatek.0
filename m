Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED15E8181B
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 04:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3E1i8LSIOlwTyuk1XAeWZA24GferWyjzighda7xVvfs=; b=dnLJQgf8CTVkwefmEZRSzdz7cw
	ezxjOe7OdJQtubTp+JPV7uW4ktKt2c0NGADA5etr57E7Zp9VSETcd1ohguhWUCn+F6XCJGG8OQaws
	NcHhEWQ6gNEE0ra8cD0Coo+Xp9gnRUAEjULk0Gd8OLd9w5w04XQzw7fLMDgyf8teGkNd/EUXr0HQQ
	k5Lcrrhx/P48LCCM8IT/rKe5SorRLjUkwNmQJ7cCwPM7uRg0N6HcJ5CzQQMKkjChAZ1U8FvLJhfeh
	VzXrZ5l/Dezh1hTSZD32aiaSu2pdxs0dQ8yApnjK0h3RXZSvYXKF/pD7u6ZF+Mmi6gDX8aqMwf7mU
	u89/XoiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzrt-00FZCR-0C;
	Tue, 26 Sep 2023 04:40:17 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkzrq-00FZ9g-0l
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 04:40:15 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3ab7fb1172cso3996609b6e.3
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 21:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695703210; x=1696308010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3E1i8LSIOlwTyuk1XAeWZA24GferWyjzighda7xVvfs=;
        b=cmg7zdlMRWeSuQB1hWvZ3lyjbujjlVoOu8/4+tOywvX0BiviUUuDYQCMuCJoP9CUhI
         cttVXT7+bEuC3J7cl2QAZ8RXWvQB7gw03FIZ0dVv/nLYCayJY0WpexqfN+9ON/KJQsPB
         ZDgr741xa20iDDvI+EBErDm941j5hYlD83cMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695703210; x=1696308010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3E1i8LSIOlwTyuk1XAeWZA24GferWyjzighda7xVvfs=;
        b=VxHkS2XRbjgjL26Zwy6juloPI2nsWk3/3xmgVcrBnhScxNWZwLyxOwVt+QwdYXA2KB
         7oHO+AWfvUiydF8qdVuKzVk+6nk+PZlNMBLYoC0M+5Hj0x3DdXKf7wdtpuWQtzGwegaC
         AwvMGlaPUDhF4JBHhLD8YgXiNI0hjNX4NM0LOeR/j3ZV0a+mF4zpgTf/rgHNvKVq2goO
         zP7zZscYaa8kFDeFlMR7A66VqAkSVb/cU2EqBvPjWoBM051g7nHTxkhQTpaoeAapnGef
         q0uy2MuyLDgK6I3/O3e5K4acrwfIyl8CpoZ6vNJ2gkPB+TADmQKVH7xGBbjZJTLrBJzu
         da4w==
X-Gm-Message-State: AOJu0YxiBdbPUGeuvYRgfrCOBs+s7pehkRfnwJ3dCDjvFXL5lqza7OPS
	yUS1fzK2uNxyUKwhrPYv9thgfw==
X-Google-Smtp-Source: AGHT+IE1o3rIsLU2bGltTLnHyrko+WsamuoFNkx5JhLKgydhfKe82ipsXYX70K9cDmuDGQev2xoeMA==
X-Received: by 2002:a05:6808:8f9:b0:3a7:6213:6897 with SMTP id d25-20020a05680808f900b003a762136897mr8120224oic.11.1695703210209;
        Mon, 25 Sep 2023 21:40:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ba86:87c4:df1a:be60])
        by smtp.gmail.com with ESMTPSA id p11-20020a63ab0b000000b00563590be25esm8667210pgf.29.2023.09.25.21.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 21:40:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND v3 0/3] regulator: mt6358: Remove bogus regulators and improvements
Date: Tue, 26 Sep 2023 12:34:45 +0800
Message-ID: <20230926043450.2353320-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_214014_273588_5367ED83 
X-CRM114-Status: GOOD (  17.24  )
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

This seems to have fallen through the cracks, so I'm resending with tags
collected and patches rebased onto next-20230925. The diffs remain the
same.

This is v3 of the remainder of the MT6358 regulator driver cleanup
and improvement series. v1 can be found here [1]; v2 is here [2].

Changes since v2:
- Merged patches dropped
- Fixed up pickable linear ranges' selector values
- Collected tags
- Patch adding missing regulator definitions squashed into patch using
  the definitions; recommended by Krzysztof on my MT6366 series.
- Remaining dts patch split out to be sent separately

Changes since v1:
- Merged patches dropped
- Added patch to move VCN33 regulator status sync after ID check
- Added patch to fix VCN33 sync fail error message
- Added patch to add missing register definitions

Various discrepancies were found while preparing to upstream MT8186
device trees, which utilize the MT6366 PMIC, that is also covered by
this driver.

This v3 series can be seen as two parts. v1 had three parts, but one
part was fully merged, and then v2 gained another cleanup. v3 drops
the "fixing bogus regulators" part: driver changes are fully merged
and device tree change has been sent separately [3]. All patches here
should go through the regulator tree.

Part 1 - Robust chip ID checking (patch 1)

Angelo suggested making the driver fail to probe if an unexpected chip
ID was found. Patch 1 implements this.

Part 2 - Output voltage fine tuning support (patches 2, 3)

Many of the LDOs on these PMIC support an extra level of output voltage
fine tuning. Most default to no offset, but a couple have a non-zero
offset by default. Previously this was unaccounted for in the driver and
device tree constraints. On the outputs with non-zero offset, this ends
up becoming a discrepancy between the device tree and actual hardware.
These two patches adds support for this second level of tuning, modeled
as bunch of linear ranges. While it's unlikely we need this level of
control, it's nice to be able to read back the accurate hardware
settings.

The series has been reviewed, and the mfd header change has been acked
by Lee. Please merge.

Thanks
ChenYu

[1] https://lore.kernel.org/linux-arm-kernel/20230609083009.2822259-1-wenst@chromium.org/
[2] https://lore.kernel.org/linux-mediatek/20230721082903.2038975-1-wenst@chromium.org/
[3] https://lore.kernel.org/linux-mediatek/20230913084457.1638690-1-wenst@chromium.org/

Chen-Yu Tsai (3):
  regulator: mt6358: Fail probe on unknown chip ID
  regulator: mt6358: Add output voltage fine tuning to fixed regulators
  regulator: mt6358: Add output voltage fine tuning to variable LDOs

 drivers/regulator/mt6358-regulator.c | 304 ++++++++++++---------------
 include/linux/mfd/mt6358/registers.h |   6 +
 2 files changed, 144 insertions(+), 166 deletions(-)

-- 
2.42.0.515.g380fc7ccd1-goog


