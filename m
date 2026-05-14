Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF71CD4F25
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3vdcIG6wZtSxe+VtpnO2RW9SAO9uWsgPhoe8i1hM24s=; b=F6ROw4sFhkuFhd5moYrymmX+xP
	4GfTvP7QE9YpguGc3vafIJoRxbuwf9v4AXBARdHHohpM8gc0jL2bpLZyL9wT8qrLZiM8B0bYAFDXI
	6LlL1qZWDtd2yMKGP9oInDP+D2uL0pj0n+HLlHxHMzk/RlZMD9b/ny4FW8pqhRdBa+JGRHU3Qxjn7
	r0lX1WOJ5192NVQEEkqnBR+3nwb5xDxnKR0E/dY/B7frM6k6SXwVQB8hf7scnT1Lp0txo5fIz0ZF7
	wLujcAkwyf8NI9XsTOtG396AHh8jYxaeqaB3rGFzjkURwXEL7+CntvjZRNyf3bwdjojEs4SNXNCqm
	9FIpibVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT3y-000000059jL-327q;
	Thu, 14 May 2026 10:13:06 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT3w-000000059iQ-2dOr
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 10:13:05 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c8027e876fcso3292988a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 03:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753584; x=1779358384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3vdcIG6wZtSxe+VtpnO2RW9SAO9uWsgPhoe8i1hM24s=;
        b=OCRez0uaWULDoftLWrFY3DrTEppxuPr74BxoTsmqTtAXbo7aGQB757TY6F77pGB03L
         AIWTqvAUXgq5N4JaoLWuvLE3WT1q+jmxOPXn3vuY7sq4B1bAVBedOC3R4A/7cGGdbwXS
         yxue/BMM1TPwzvNLTc1kSo95J/PavrKZxVX3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753584; x=1779358384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vdcIG6wZtSxe+VtpnO2RW9SAO9uWsgPhoe8i1hM24s=;
        b=qvxHfNLUOeGcPQ0p9Hmwes6k0xm9rLFxG+hmF3VOM56P7s7oaTNKyz4eXPkAgvsW+0
         L1xoYNYrQHBv7LscR1CTfqMA9cBQoic67054Cm2D//BW+E7Y5BvNFq5xRf2NZLz0KDcV
         rAboVS3baY0TqWCZReZCul4zfAWbNPKlEkqMI2LrHlA9FpxTmya7vEMMq5BKTaIDB+vS
         yDbeZSCBSxbLx9fSNi1lO6IhewRYbtzMlYUqABBEioxWuFe89CRpauMVMBjoPqRd42kC
         ak39A4TWuEmJAUnWd2x9W64oN9sc4kKkfkIjvPol5uRNF+nsb3+7I+QUGp4NBWzkgQ85
         ZLsA==
X-Forwarded-Encrypted: i=1; AFNElJ/0mpZxzZOq8Ec618P774+4Dl69RQIw8eihmD7gcaSKWgJ/sxZoMB/UB9Wzs7nffJaQ1xBqac3V66fL/RLO1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzwSjxXET29wfesX5TteHq8m8SeBZrT00TEVzPMwYdbGylVZKC
	R/p1pKE50CdPydYDt4TaWcLApxu3SXh5eo/DN5luVGfK0b2wMfSvAEgYWXJqGKLNrw==
X-Gm-Gg: Acq92OEk4l1eEwJ2Fl6g5eeQgYU/rS50DCfVzmHTNYseOpKd9HNQJz8/LaifsXMrTN7
	/vcbTRZEaB/vPUOYBh+Zm5h4HLiO+TK3hhG+TBIZVxd+DaNDEsCMVAssc4cuHkmx71QYaCNmOQF
	0DyTxXL6tqddByuoubfIKfBWz/qPDJbo60aRxUNpWtBnSqhJQzDovRU/T4rjDBiAj9sC75XZdhV
	aYwqHMZ+wa5eRLJNpbbo5CIxhm6qskHhvl8rJxJtN5ui0RRvJl9/YJ2su88T6ZTHlQEZ5c/Ac/+
	IOS6UoWYl2zWEjxLqLk03ryyGFt7Uc7VKuUkwCPLrPtD/rZV7IFv//5n1p8+4TJ9eo8LyIKtmYO
	gePlQPc4ZSUTlscVkvfiQxTbtGEgq4pF4zL6sqeHQZTtWRNibS/roE31rJ3uxyc/zs4VSxqZq/o
	h0Ju+TpOrQGQv8SwCVv01f+xY7LM/YfBCQ4Bl3gNsZS6ZJaoTnlzplFwJYjMr2jWs5AMNZvclKM
	L/Mxlzn1FaVUB1i0ew=
X-Received: by 2002:a05:6a00:4409:b0:83d:6c12:a632 with SMTP id d2e1a72fcca58-83f05d82260mr6553294b3a.50.1778753583619;
        Thu, 14 May 2026 03:13:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:03 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: mediatek: random Chromebook cleanups
Date: Thu, 14 May 2026 18:12:48 +0800
Message-ID: <20260514101254.2749300-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031304_697411_38033714 
X-CRM114-Status: UNSURE (   7.36  )
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

Hi,

Here are some random DT cleanups that are not directly related to other
topics I'm working on, but came up when checking for warnings.

The regulator related changes overlap with my other "Regulator cleanup
for Chromebooks" series [1].

Please have a look.


Thanks
ChenYu


[1] https://lore.kernel.org/all/20260505101408.1796563-1-wenst@chromium.org/

Chen-Yu Tsai (4):
  arm64: dts: mediatek: mt8192-asurada: Fix SPI-NOR flash compatible
  arm64: dts: mediatek: mt8192-asurada: Add (BT|WIFI)_KILL_1V8_L GPIO
    line names
  arm64: dts: mediatek: mt8195-cherry: Fix names for EC controlled
    regulators
  arm64: dts: mediatek: mt8195-cherry: Sort top level nodes correctly

 .../boot/dts/mediatek/mt8192-asurada.dtsi     |   6 +-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 106 +++++++++---------
 2 files changed, 56 insertions(+), 56 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog


