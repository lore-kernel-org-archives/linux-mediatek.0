Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD1DE7718F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 21:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=V+sHQ7mY3MwIf/VsiMl4gaK88d9UqEmLFOQfH59gXv8=; b=hDAQ9NhkVlBTEmx4aQ32pmFA2i
	S1vJKlGv8awt+GB4XB3mmXU4DSgiQiMM3F9Fc1ah8IRpIqfS3YztFVpX5SXZ8S7nT5wbb8K6WhQOB
	htQAs7bzLoyWEI+dbPkcwWxJlsRH20jmHztEN2VatRL8UtNjUfM3s+Ens+6GVdnT8jqCWvoKjdbTM
	txoZVMbU84V1nogrRenUdWQabQiDhyn5EBv4PxCNQYvaYm8+maFj7yG0k+iTlI6wi1zZ+OYMx/giY
	KLZE56QB3zRziEUbVIAHVLB5v5Kc0RKiYbkj5rGYBxICB4SxCQPE3DEbq+vkTiD8TY2lD3aJ7rMhw
	EbRXSvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTp1d-0000000E0Dj-3tPE;
	Fri, 03 Jan 2025 21:16:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTp0L-0000000Dzro-3NkL;
	Fri, 03 Jan 2025 21:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6BE0A4107C;
	Fri,  3 Jan 2025 21:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E1CC4CED2;
	Fri,  3 Jan 2025 21:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735938888;
	bh=sFO4OH9CVkKVkoP3ZaKlYjcbwVR1mQy5pmUDUDk+dxk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BsB7G6j3mXf7S+4Or7YmadtifMWp4gWAqz/jVXG3Cba2mG0jI9jSDe2FVrTapZ+ZL
	 7WBNfkKJW6CkYWMvqMefbyAPXboKV/QNqHRge9ZkE6b2M1UcLO73RCTsx3EIQzxpLN
	 VOn45m+Hr2nJJo0EbSd3pEQxf6PRNbUKfC3nWj+LpJ6mqYAe0JoClW1aw/nwpoUA2q
	 yD4VoTB8tMqr/Kt9ClyJafBkXP5hxWyd0B2cgbnDUkTnOtog4ieGFHcgxaPCwYb34F
	 h3QGz49mTd7DsgSNy2G0swP6tQwc3d/kT/MrGFj0PUBbVKzMN9pYXWVhAvB0wOW9Kf
	 GoxTAYk9K9YUQ==
Date: Fri, 3 Jan 2025 15:14:46 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 14/19] arm64: dts: mediatek: asurada: Enable PCIe and
 add WiFi
Message-ID: <20250103211446.GA4063@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629155956.1138955-15-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_131449_910551_089F1031 
X-CRM114-Status: GOOD (  11.12  )
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

On Wed, Jun 29, 2022 at 11:59:51AM -0400, Nícolas F. R. A. Prado wrote:
> Enable MT8192's PCIe controller and add support for the MT7921e WiFi
> card that is present on that bus for the Asurada platform.

> +&pcie {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_pins>;
> +
> +	pcie0: pcie@0,0 {
> +		device_type = "pci";
> +		reg = <0x0000 0 0 0 0>;
> +		num-lanes = <1>;
> +		bus-range = <0x1 0x1>;

Hi Nícolas, what's the purpose of this bus-range?  IIUC this describes
a Root Port, where we can read and configure the secondary/subordinate
bus numbers from the RP config space, so it seems like we don't need
to describe them here.

> +
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		wifi: wifi@0,0 {
> +			reg = <0x10000 0 0 0 0x100000>,
> +			      <0x10000 0 0x100000 0 0x100000>;
> +			memory-region = <&wifi_restricted_dma_region>;
> +		};
> +	};
> +};

