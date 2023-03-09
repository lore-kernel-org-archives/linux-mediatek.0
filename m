Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87958C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 22:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KK2kVS/pDWxq/x5pUQs4W8hA5sU/CpHNUPW7RfmKdu0=; b=GpkgsCv11tbh8i8WiIwZNBy8hD
	7Bers99Ak8WnkdBhE46YUaj5BBRTPXUAl4YSNN+HXjHoG3Hw5sVtL6461UAkA0CCe9i693mHLx82X
	mz7iDNo6eoy3ac7Dwt2c9cTqdsv0RtNhoqmKzbowaVpc2or8gKik535ugznY4QCrEr60UmFRwi9iz
	FY8saxFCD3WxsW8j4Tav4AAfKwpH0FePn3a0UevbQYTBhbFXUeDf7a9nyIWmGsA/vUxMpiOtZIb+t
	fndT+4NfSjgYREvDSae2ZJS0KgruFkJ/9ZyHdBfPJGStnCphDDVulnOkwQs+S1SDX5y1mcMpdW/Bu
	6VkxKYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paP2E-00CFYG-IA; Thu, 09 Mar 2023 22:46:54 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNul-00C0b5-Dh
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 21:35:09 +0000
Received: by mail-ed1-x530.google.com with SMTP id i34so12643926eda.7
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 13:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678397703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KK2kVS/pDWxq/x5pUQs4W8hA5sU/CpHNUPW7RfmKdu0=;
        b=oBBXq4iAeXbCsT2PF/6pqeDn93WEhifSbV1qlFa/7iop2+zWVFoeABEAekMO3CFjo8
         XXFd5i2aeyKAoNCdnQEt/4uAjlOK6cjFdPbuGtqF/txObVlNkQwgyPHFXVzDNoHgTnRR
         rbpW2nXtXY4BLA0DPrDKkKgmfaZVSLLq/BXxs6eYSYcWD5MNVmyFED/xQHLX4yhhxcWL
         ru/lfliBr65TCIfvp6fTHZN9Jly/jxxB/fjLOL7OSb4u5/2I7a5UAAuTw/9EWTwf+GNM
         1b+Xfi3rSFDIlGp/PJtFNMlsbCYUyB6GNpBEmGc55AAsMCj/rbV0o/F1u1pzCU6CFKQe
         E7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678397703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KK2kVS/pDWxq/x5pUQs4W8hA5sU/CpHNUPW7RfmKdu0=;
        b=14XoU9FKfvzazRe7/6nIjL9K0/qTkri4QVANekNazOxtv4hhLRUF5HNIxnL4D3CteV
         f3HyUKiLxnNinVJ4odINqMM/c3Yj8Kvb5L6dXk0aJZDGcKJebHA7IbbJHZflFYUn53AF
         LXMwUwBfIjKRHbs4678UbQcG3psBo6fgloVzKZBKGOIm5NVd/QA62A1ucYTbUNsF86OR
         38HVrgeXmop3OdQ3Ez/R7TnOPWSUQxol7audVF+OR2f7WQNgcRKOd/jO+XUJAocnHGSU
         fQe64/X4rSR4vcWJyqVz2lX+Co4/Ib82Kys3OQ1QrgGfg5i3aHvxSsB9f39ycA2PZTUC
         DMVw==
X-Gm-Message-State: AO0yUKUDftx/MORq5CJ3PFGt6UVESju/OoQvfUvdCzVVFeYCZkKmBkax
	6vM2eSoDXu7mNCQP36sS+PK22PJxhQo2sQhz+c8=
X-Google-Smtp-Source: AK7set/lpUBZ9Bne9GGWFN6gWynBHiCiKi1zXGKsV102g3fb0dLfD4PR0FwBl6fJxgTrdcDKS96V+A==
X-Received: by 2002:aa7:d7c8:0:b0:4ac:c85c:fb8d with SMTP id e8-20020aa7d7c8000000b004acc85cfb8dmr24734520eds.10.1678397703225;
        Thu, 09 Mar 2023 13:35:03 -0800 (PST)
Received: from ryzen9.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id 8-20020a508748000000b004af7191fe35sm211486edv.22.2023.03.09.13.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 13:35:02 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de
Subject: [PATCH v11 0/3] Add minimal MT8365 and MT8365-EVK support
Date: Thu,  9 Mar 2023 22:34:58 +0100
Message-Id: <20230309213501.794764-1-bero@baylibre.com>
X-Mailer: git-send-email 2.40.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_133507_698992_51A46933 
X-CRM114-Status: GOOD (  12.02  )
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

v11:
  - Fix typo in systimer (Thanks Angelo)

v10:
  - Fix systimer properties (Thanks Amjad)
  - Drop components of the patchset that have already been merged

v9:
  - Fix a regression in v8 that broke the USB port
  - Remove superfluous include in mt8365.dtsi
  - Fix some naming issues pointed out by dtbs_check

v8:
  - Add binding descriptions for mediatek,mt8365-systimer and
    mediatek,mt8365-uart
  - Specify ranges with parameters for u3phy

Tested-by: Kevin Hilman <khilman@baylibre.com>

v7:
  - Update GIC information in mt8365.dtsi (thanks to Marc Zyngier for
    pointing out the problem)
  - Adjust the timer to match the updated GIC information

v6:
  - Add systimer in mt8365.dtsi
  - Add I/D caches and L2 cache details in mt8365.dtsi
  - Move bl31_secmon_reserved from mt8365.dtsi to mt8365-evk.dts
  - Fix inconsistent indentation in mt8365-pinctrl example
  - Further mt8365.dtsi cleanups
  - Submit to additional maintainers spotted by get_maintainer.pl

v5:
  - Reorder top-level entries in mediatek,mt8365-pinctrl.yaml to match
    example-schema
  - Use consistent quotes

v4:
  - Remove pins-are-numbered references that have been holding things up
    now that the patches removing it from dt-bindings have landed in linux-next

v3:
  - Remove a number of components that are not yet supported (they will
    come back alongside the corresponding drivers)
  - Address issues found by dt_binding_check (mostly fixing pinctrl
    bindings)
  - Address issues pointed out in comments
  - Reorder patches

v2:
  - Add missing dt-bindings documentation
  - Small cleanups addressing issues in v1 pointed out by Krzysztof Kozlowski


Bernhard Rosenkränzer (2):
  dt-bindings: irq: mtk, sysirq: add support for mt8365
  dt-bindings: serial: mediatek,uart: add MT8365

Fabien Parent (1):
  arm64: dts: mediatek: Initial mt8365-evk support

 .../interrupt-controller/mediatek,sysirq.txt  |   1 +
 .../bindings/serial/mediatek,uart.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts   | 168 ++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      | 377 ++++++++++++++++++
 5 files changed, 548 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

-- 
2.40.0.rc2


