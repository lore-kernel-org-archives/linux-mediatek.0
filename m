Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2464C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 23:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6qNAnRQfWqCJIvUbkBu3BnOJ17o/EqxMEF9ruY9YHo=; b=Fy80X00mcHRBVV1A+3e7glA/pR
	nTWfEYTmpO6qTD5mpZGkFfnOVMgC5pGysdBmNaoxDo7um3emEe1qLnssouD4KAIQHRniAj4rhb/9r
	rbBQqYgYlzBt8YMAClL52p+wGWmHgPVsM0Rq+97ALDjt8rNzdGfU2dKaUKr+jk1y3Zzd42bIVCxu3
	nh4NLWcbMzqqinnFc3mIFpQ4+T5NFCFfooxITbrOtAcWMyuuON2Lof5n5AUL8E50q5fLnrwaSffZ7
	apewOdYAJpi92D9tHX/TM+RLU2b3iuepHEKOzpQ+f2WDVc9lFvOMwucw55eQ52qoucXMzAofZwDS8
	sJWU8vdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwVOM-0000000A8Cq-1Bhm;
	Mon, 15 Apr 2024 23:05:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwVOJ-0000000A8B5-0Rvh;
	Mon, 15 Apr 2024 23:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD1E360EB8;
	Mon, 15 Apr 2024 23:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EA4C113CC;
	Mon, 15 Apr 2024 23:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713222333;
	bh=ujka/03jMUb0XAncsAq1DSp6vUMODs+NmGkGQhLYg68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gx6d951XUcnisiPltyGh2R86ooQuEYTrxs3fuuz33iLrsJZKIr4Yh7kIEhpgZYT0u
	 +cscArqD1yK5tD3G0VQc+Ap7mBDtsJdrKBNrU1S3p32nkeZGHxgvSM3TImP1L3AnT+
	 F1Nn6ThGM/Nxfr+vuJQoaLTePGQ8EfFhYr8JHlpahucJC6/h2JaGVs/KfAy6oNyMOG
	 N+dAJk9Pas+V8JpKU1LFAZJsJJQ8Z4hWi+pQzAMfGyvrh+MkM1rVX2dbNMvB1H0UsB
	 9dOhkk3jUFJLdhWOMw6dCldHzd9gEp8IhUOIXELJODAGnL83vI0TUDlFCajFJHVR0y
	 /+aHDeMK9aFHg==
Date: Mon, 15 Apr 2024 18:05:30 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-bluetooth@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	netdev@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
	linux-arm-kernel@lists.infradead.org,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
Message-ID: <171322232789.252337.16326980700188367647.robh@kernel.org>
References: <20240412073046.1192744-1-wenst@chromium.org>
 <20240412073046.1192744-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412073046.1192744-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_160535_239322_E333F40E 
X-CRM114-Status: GOOD (  17.82  )
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


On Fri, 12 Apr 2024 15:30:42 +0800, Chen-Yu Tsai wrote:
> The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
> SDIO. WiFi and Bluetooth are separate SDIO functions within the chip.
> While the Bluetooth SDIO function is fully discoverable, the chip has
> a pin that can reset just the Bluetooth core, as opposed to the full
> chip. This should be described in the device tree.
> 
> Add a device tree binding for the Bluetooth SDIO function of the MT7921S
> specifically to document the reset line. This binding is based on the MMC
> controller binding, which specifies one device node per SDIO function.
> 
> Cc: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Expand description and commit message to clearly state that WiFi and
>   Bluetooth are separate SDIO functions, and that each function should
>   be a separate device node, as specified by the MMC binding.
> - Change 'additionalProperties' to 'unevaluatedProperties'
> - Add missing separating new line
> - s/ot/to/
> 
> Angelo's reviewed-by was not picked up due to the above changes.
> 
> Changes since v1:
> - Reworded descriptions
> - Moved binding maintainer section before description
> - Added missing reference to bluetooth-controller.yaml
> - Added missing GPIO header to example
> ---
>  .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 55 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


