Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9973AC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wUAbzcFVK3ZVITG+2l0a+xKU9wkLH90MaXKWziyaZMU=; b=gF12UxAk87wGwueUS7rCd/nqhd
	A/8cO8OiWm6nO0WNOQN8abPEt21NrEUjr49sq0qXzXyTfr2fGh9sm0Aq+knqca9wxlbi4kSNmg816
	qq6Rty59fiArCWwdjQiOcGOX617viVteeHKKZ1lWUDJpm8hc2GGKc17XHuItGLWeGe7ayXHBU1yWA
	jasrvjAZ/rYfl8DWj2TxeeCQ6wbevJIE6ChjyiIpgZNlj4nsN4a4JS1qW9QCYHoF5JXWeP8x4yS3x
	dCR91uYSbURMuAaeaeJzYUqJiTH/9dopSbQa/1B1lLC6Wco29qPcX2mNCLjBoKoPUVLuZojQhlA38
	fP4k2kEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f9l-005yiD-NE; Thu, 01 Dec 2022 08:42:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0f9S-005yTo-K3
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 08:42:40 +0000
Received: by mail-pf1-x430.google.com with SMTP id 140so1231388pfz.6
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 00:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wUAbzcFVK3ZVITG+2l0a+xKU9wkLH90MaXKWziyaZMU=;
        b=XMafgRnPXr3IThGMY0Kq7ugDvt8kIojuxnOikwBHoRWG3AOjnaOxKgo5j78aV2lGUv
         VU0PdkmKb+AjhopRlrKe19lR1pWSDWbhQxX9n1lDhc6Ym3hFbmkP7L7fB/nFGtRyi5e+
         r3gOgaH78vSTqZxhRBqIEepFi6tiNXg3Bi2vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUAbzcFVK3ZVITG+2l0a+xKU9wkLH90MaXKWziyaZMU=;
        b=yqX7hJJQ0Qdw2QfbKc1oOgoFBjhIOT7BUcAmpBriJ20KgTjRNVxaqTXs0hkk1Ikn7e
         bIR8gsthANMIVr5fhktS10ZkdNcyeAU9KgXFE4Fid/lpxVRrpavL20VNf+jdtIGAMvuk
         2mM/ew4Fm0iJqmcZ1uK5tSv5CYdIJCma+r5qwvWP6vy/DcS1ebT5Qbuz9RwWX9evkhu8
         bhqCMDljnKTHAmEFZkWxQCeh9z7htKFffUFktQ1DCPd7c/ybxDcg2Dnec+RJMJsaGoh6
         U0fhzVzR8ClWyO/7zuPRitrO6LkmmRQVTCxSFRtyVKQZ7/i5oRLZBDiauY1v+fbl/6jJ
         uvwg==
X-Gm-Message-State: ANoB5pnpXdJl3B1SWmkrFiFau9lrmPOGWUk3JgYY5qG8T32C3pH30lH2
	RykeM6P4sIjlJx9oUtVQxfWfBQ==
X-Google-Smtp-Source: AA0mqf4DVjDswN2LkRCBiGdapBmzeJV1WAJKCUf6aSfstFW/XOkPpCzHjNsjqlwZB823ZPCU2MWwIA==
X-Received: by 2002:a63:6f4b:0:b0:470:5619:4d7d with SMTP id k72-20020a636f4b000000b0047056194d7dmr57777194pgc.301.1669884154448;
        Thu, 01 Dec 2022 00:42:34 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2416:fa4e:4eeb:fcde])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902690500b001708c4ebbaesm2932293plk.309.2022.12.01.00.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 00:42:34 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/4] arm64: dts: mediatek: Fix systimer clock description
Date: Thu,  1 Dec 2022 16:42:25 +0800
Message-Id: <20221201084229.3464449-1-wenst@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_004238_664736_3A26A98E 
X-CRM114-Status: GOOD (  11.60  )
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

This series fixes the clock description for the systimer block. The
systimer is fed by the main 26 MHz oscillator, and internally divides
the clock, normally by 2.

However this ended up being modeled in various incorrect ways, such as
the clock divider being in the TOPCKGEN block, or as a standalone 13 MHz
oscillator.

This series fixes the description of the systimer clock input in an ABI
compatible way, i.e. the clock rate of the input clock remains the same
at 13 MHz. The clock is now modeled as a divide-by-2 fixed factor clock
being fed by the main oscillator.

An added benefit is that in Linux the systimer no longer requires the
main SoC clk driver to do an early init dance.

Please have a look.

The next step would be to fix up the systimer driver in a backward
compatible way and have it read the divider value from hardware.


Regards
ChenYu

Chen-Yu Tsai (4):
  arm64: dts: mediatek: mt8183: Fix systimer 13 MHz clock description
  arm64: dts: mediatek: mt8192: Fix systimer 13 MHz clock description
  arm64: dts: mediatek: mt8195: Fix systimer 13 MHz clock description
  arm64: dts: mediatek: mt8186: Fix systimer 13 MHz clock description

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 12 ++++++++++--
 arch/arm64/boot/dts/mediatek/mt8186.dtsi |  8 +++++---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++--
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 11 ++++++++++-
 4 files changed, 35 insertions(+), 8 deletions(-)

-- 
2.38.1.584.g0f3c55d4c2-goog


