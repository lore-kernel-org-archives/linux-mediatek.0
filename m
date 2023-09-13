Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE6CCA5509
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LS+dPzs/esrRECMW0r4zvqkr3eodLloQmjRx4zag1qY=; b=sTGCvVuMWWgkWacVdv3yjlLshJ
	v9TvIsrwsD++nNlkhLE8ENRe47v2h20K8biv77DrR2lw8eItL+RqrD3V4MVdH8ObYSnZqlfOywVt0
	YY7yuxSTavdv1ojq4YJm5Ev3P2bOM2sGbmRCJKCuHpDfX/cEMvyoRZv9BKld8txrZOF5gs1YeDoRX
	a1VCU4T7p8EUGrPmru/+Uei59LZkaLJirzqv8sNvCYXvXJ6Eev4bsEuMKNDccmmMsbkaekBTlHKxn
	J7tT1EoIC7wSt8Ct9xDvpPtu/TYqzMzWZs4khDWyZ/GOKhYMdojQUnxcwPUuysIZNtA8NwAMQC2iV
	3/LDkmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLFq-0056Hj-2B;
	Wed, 13 Sep 2023 08:29:46 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLFk-0056BV-36
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 08:29:42 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68cbbff84f6so503933b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Sep 2023 01:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694593773; x=1695198573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LS+dPzs/esrRECMW0r4zvqkr3eodLloQmjRx4zag1qY=;
        b=a+TlSX71a8GdzQ/RXOt6wNUw+HsxM0C2Bv0rEQcgP8+bmyOhALiPTTRlBTTDA4X87H
         xkxGxubo6E8hbaHzHgL6GDUQ5DHT9EP+cZ0fBArU/FwPTbL9WLkydC63LMirxL1UHRK2
         HHoUcijEn4N9gUv8ajVdpFBksadxXbHsAdo0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694593773; x=1695198573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LS+dPzs/esrRECMW0r4zvqkr3eodLloQmjRx4zag1qY=;
        b=sAnyBuehZ5l457J8x4CfUBOU1vf/IqHP8NfR9ARJOGo32ZXevO96kQsQmeuQBoTDpB
         YQ16LioSu+QeeicaArmzrbpqFDkAOQ0v/wAjq8YsEnb5yVkUMMZuiIRUUHxwF4fDw0Xk
         6wWpf6yeaYxTjoVNBUoa4EkHekmU6s1zuC+Q/YoNM0SR21nRmDwNZmh45uzyKv2pgEoO
         i7HNnSFFmtDDW/jGEi0igDbXJvOZCR3ySBbaAwtniQQOWqMkjE9PK6SD0B5gnc9BOSEL
         a9/PvwkuodN0CxLhZvn7gVAiIuJnSuACWihCGU5mBMMixIzVvkkon1yPDkOhdLVp/av4
         ph/Q==
X-Gm-Message-State: AOJu0YzrllaqBw51Ko1Jx4V2WCKiR6EvCLYzpPIH5MMCXuWoGKi7a1D7
	c/u9xl4Ev1zIM7qZFKCqkTy6qg==
X-Google-Smtp-Source: AGHT+IHbVPdTuFhGeeVxawUbl5Rb0U2ZDVoMhMmu0Yn9YrtDJoRoIvMf+QNC1WT0MA1dyWigw9x1yw==
X-Received: by 2002:a05:6a20:9382:b0:153:4ea6:d12e with SMTP id x2-20020a056a20938200b001534ea6d12emr2727186pzh.17.1694593773090;
        Wed, 13 Sep 2023 01:29:33 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b24c:3be4:d952:d3b1])
        by smtp.gmail.com with ESMTPSA id g6-20020aa78746000000b006901bd3a9e4sm418781pfo.104.2023.09.13.01.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:29:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/3] regulator: mt6358: Remove bogus regulators and improvements
Date: Wed, 13 Sep 2023 16:29:15 +0800
Message-ID: <20230913082919.1631287-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_012941_023387_6043EF2A 
X-CRM114-Status: GOOD (  16.65  )
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

Patches 1~3 should go through the regulator tree, and patch 4 through
the soc/mediatek tree.

** Note: patch 2 needs an ack from Lee for the mfd header change.

This v3 series can be seen as two parts. v1 had three parts, but one
part was fully merged, and then v2 gained another cleanup. v3 drops
the "fixing bogus regulators" part: driver changes are fully merged
and device tree change will be sent separately.

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

Please have a look.

Thanks
ChenYu

[1] https://lore.kernel.org/linux-arm-kernel/20230609083009.2822259-1-wenst@chromium.org/
[2] https://lore.kernel.org/linux-mediatek/20230721082903.2038975-1-wenst@chromium.org/

Chen-Yu Tsai (3):
  regulator: mt6358: Fail probe on unknown chip ID
  regulator: mt6358: Add output voltage fine tuning to fixed regulators
  regulator: mt6358: Add output voltage fine tuning to variable LDOs

 drivers/regulator/mt6358-regulator.c | 304 ++++++++++++---------------
 include/linux/mfd/mt6358/registers.h |   6 +
 2 files changed, 144 insertions(+), 166 deletions(-)

-- 
2.42.0.283.g2d96d420d3-goog


