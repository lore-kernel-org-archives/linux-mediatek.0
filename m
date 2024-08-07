Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F375FC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Hv+QuR3hzdkyIxFQPItdFYXvjKJYSHWt11XpxPYkqA=; b=zrWpsgH983UDNo
	yoS5tLODuzTILwgUIFEOT/XvC3qztGE+lF34OTanerlCm2Q7BMzS/zSmhBSTshy8velvRnM4DCF8P
	n6pHj6QtfE3zCp5zSTA7A3ghuuqxVnF+mLAHNw9xjm7u5F1P5MYL1wKQmtROkXQ0H0nblyAASOF1p
	n9wJxUkssahS2ixUOF7qgoPMWaQgf86tbx2mAcgkCaWgQK0a5RAdicpviZRi24Q4q3i+Y2hF0mt7F
	cdlKxN8Z08bSQak3Oa79n+tTXfGWnYUChn38kejrh/NoCFOf2W+pqjXfhEK1xcaFPN/fAH1QSWzsU
	TIUbKE5oVb2k0rFrz2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbk0k-00000005lFP-1opj;
	Wed, 07 Aug 2024 16:59:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbk0B-00000005l8z-0uky;
	Wed, 07 Aug 2024 16:59:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3AB9F61203;
	Wed,  7 Aug 2024 16:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905B9C32781;
	Wed,  7 Aug 2024 16:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723049945;
	bh=dPEdhycVTOguP7QecWh2DLLxhHRJ4mnqR6lRY3q91o8=;
	h=From:Subject:Date:To:Cc:From;
	b=CspDVK3wd+jRFcuLGCeShKTTd8tY+e04zAx8Y9cxjm7jKJMSUg44wQnhtjROu6/Y6
	 /D7lNY6r1PqQoRzZhLG6nWmSmy/Pqu4rZhF6WRn3ODgnQ0QRxg+QKPfDQUrfugKl7u
	 K9Tlb8IFGi/MtHxGpaGUEf+YXaq55OCAKF3y2pKTNyhNwZwwSi+xgmwZ8yCTjOXAJX
	 la1s0001V4ghioc4GvSuw5l+apgiVWv05qwX5vTvSI/SN1ltea01Uk6UsY8wl5kfML
	 /RMzhwCRCPBb5pTesnTLCey0BLJNLuNQXNWbsu2nIMEgm05+vj5rE2TRxGuqCNxrWn
	 7/rBQq/sct6aQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH 0/3] dt-bindings: Convert and move Mediatek clock syscons
Date: Wed, 07 Aug 2024 10:58:52 -0600
Message-Id: <20240807-dt-mediatek-clk-v1-0-e8d568abfd48@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMyns2YC/x3MQQqAIBBA0avIrBtQiYquEi0GHWuoLDQiiO6et
 HyL/x/InIQz9OqBxJdk2WOBqRS4meLEKL4YrLa17nSL/sSNvdDJC7p1wc4EarhtApGDUh2Jg9z
 /cRjf9wNnlYZBYQAAAA==
To: Stephen Boyd <sboyd@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_095907_376483_154B128D 
X-CRM114-Status: UNSURE (   7.83  )
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

This series converts all the Mediatek syscon bindings which are clock 
controllers to DT schema format moving them to 'clock' directory. The 
existing schemas in arm/mediatek/ which are clock and reset controllers 
are also moved to 'clock' directory.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (3):
      dt-bindings: clock: mediatek,apmixedsys: Fix "mediatek,mt6779-apmixed" compatible
      dt-bindings: Move Mediatek clock controllers to "clock" directory
      dt-bindings: clock: mediatek: Convert MediaTek clock syscons to schema

 .../bindings/arm/mediatek/mediatek,bdpsys.txt      | 24 ------
 .../bindings/arm/mediatek/mediatek,camsys.txt      | 24 ------
 .../bindings/arm/mediatek/mediatek,imgsys.txt      | 30 -------
 .../bindings/arm/mediatek/mediatek,ipesys.txt      | 22 -----
 .../bindings/arm/mediatek/mediatek,ipu.txt         | 43 ----------
 .../bindings/arm/mediatek/mediatek,jpgdecsys.txt   | 22 -----
 .../bindings/arm/mediatek/mediatek,mcucfg.txt      | 23 ------
 .../bindings/arm/mediatek/mediatek,mfgcfg.txt      | 25 ------
 .../bindings/arm/mediatek/mediatek,mipi0a.txt      | 28 -------
 .../bindings/arm/mediatek/mediatek,vcodecsys.txt   | 27 -------
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     | 29 -------
 .../bindings/arm/mediatek/mediatek,vencltsys.txt   | 22 -----
 .../bindings/arm/mediatek/mediatek,vencsys.txt     | 26 ------
 .../bindings/clock/mediatek,apmixedsys.yaml        |  2 +-
 .../{arm/mediatek => clock}/mediatek,infracfg.yaml |  2 +-
 .../mediatek => clock}/mediatek,mt8186-clock.yaml  |  2 +-
 .../mediatek,mt8186-sys-clock.yaml                 |  2 +-
 .../mediatek => clock}/mediatek,mt8192-clock.yaml  |  2 +-
 .../mediatek,mt8192-sys-clock.yaml                 |  2 +-
 .../mediatek => clock}/mediatek,mt8195-clock.yaml  |  2 +-
 .../mediatek,mt8195-sys-clock.yaml                 |  2 +-
 .../{arm/mediatek => clock}/mediatek,pericfg.yaml  |  2 +-
 .../devicetree/bindings/clock/mediatek,syscon.yaml | 93 ++++++++++++++++++++++
 23 files changed, 102 insertions(+), 354 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240807-dt-mediatek-clk-81fa6e76faac

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


