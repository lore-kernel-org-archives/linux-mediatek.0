Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65522C4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Nov 2023 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xzMcm/4giFrxMClkYwrYltTytmsL0thmxiAZbeFwHOg=; b=pGOtZunOXEs6f/zr/lSyfK/smT
	VVeP1dBKu3GgEBwjmdR75xiZ9o/ZqoFXfId+at4kRIv23a6IEfHYVkH0tqdd5Kwbh+QNYm6kxC7iK
	QG3owiywuMcz1F9n6mgvdKOd9HXXTI0muC9yKxMs5Lo6yLS4SeYBWIj7ywKVBPMLyZwwAT5baY4D7
	wv6dQOFHdZWCmfzPtPTDOZpJLFoH9+KVkig2Nsz9mJgJ/8Wlo351atjrPs4XlxpNjQriLj8czUrlG
	5ZB/o3cEyXxT8DtRpy+mYpdDnn9bBydxCDp3FfLwoY2LeBQbWunoWvRY18FV3m1aPFIPI5v0XyTyP
	HWhlcg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8bfF-00A7IZ-0I;
	Thu, 30 Nov 2023 07:40:49 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8bfB-00A7HR-1x
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Nov 2023 07:40:46 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6cbe68095a3so560867b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Nov 2023 23:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701330043; x=1701934843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xzMcm/4giFrxMClkYwrYltTytmsL0thmxiAZbeFwHOg=;
        b=mu9PeN47gmJOtdkLl8GjfvCuWPQCmc0vU+fexmFUAOLZAC/KV7aRBmnuAjS7iTqD4+
         7jvD67WRLw8WWnB4/W5VUM4l4UBgmSKn80FGB1Mtnyyleej0L7pkAT3Vzr9xRAro1XDG
         TQje1Mp2dwEAXwlL41Na8dlE55l237nunJBbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701330043; x=1701934843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzMcm/4giFrxMClkYwrYltTytmsL0thmxiAZbeFwHOg=;
        b=IN2FldyifyIYvS74HBwx1nbVdUjnxJMN6Cmzb/gwZkFuZR55C5LqW0rxZAu8BGSii0
         sTravyoYHvHv/NUIP7BvuroLH3xjlCznx8dw6uLrwmhMaIMXt2M4mWqoDJsyZk2ed4M4
         TayCVvt9fAvy7HO9fLPmH4lOmElP5mEZltCzsIFedlHBnppajhitprPUnC4ZHWjLjVwE
         HVa59PuOAbcmKSkzfTxRJjz8Voul8b8mIrOSRIEbImzMFYP6TBzsm0aQBvpNQl73JmXW
         gqxHDw9/LI2OY+r66jp5JFnLVaZRG788IV0mbbmjoeCBs2nTmoi66+EGOzr4Xl713g0y
         DcPA==
X-Gm-Message-State: AOJu0YxB3IQKwwqRqYxE22qW9T06M6Mlzth+FQZ7x4ekDXHCen0gN2H8
	QHXXgw7YM59acXcmdVQ+wuXClA==
X-Google-Smtp-Source: AGHT+IH4Vyiy69Wx5dpcW6tYy2rej0U+Buxiro8U+QktBGOAg6tGBdr4/KhwXWHc9RHdnAT00fhu9A==
X-Received: by 2002:a05:6a00:3a09:b0:6be:acc:8973 with SMTP id fj9-20020a056a003a0900b006be0acc8973mr20577904pfb.20.1701330043351;
        Wed, 29 Nov 2023 23:40:43 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7c8f:dafd:65c3:2bcf])
        by smtp.gmail.com with ESMTPSA id p35-20020a634f63000000b005bd3f34b10dsm612870pgl.24.2023.11.29.23.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:40:42 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] arm64: dts: mediatek: Random DT cleanups
Date: Thu, 30 Nov 2023 15:40:28 +0800
Message-ID: <20231130074032.913511-1-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_234045_694961_B1BB0D5A 
X-CRM114-Status: GOOD (  10.34  )
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

Here are some random DT cleanups that I've accumulated. This should get
rid of some warnings.

Please have a look.


ChenYu

Chen-Yu Tsai (3):
  arm64: dts: mt8183: kukui-jacuzzi: Drop bogus anx7625 panel_flag
    property
  arm64: dts: mt6358: Drop bogus "regulator-fixed" compatible properties
  arm64: dts: mediatek: mt8186: Fix alias prefix for ovl_2l0

 arch/arm64/boot/dts/mediatek/mt6358.dtsi            | 13 -------------
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi     |  1 -
 arch/arm64/boot/dts/mediatek/mt8186.dtsi            |  2 +-
 3 files changed, 1 insertion(+), 15 deletions(-)

-- 
2.43.0.rc2.451.g8631bc7472-goog


