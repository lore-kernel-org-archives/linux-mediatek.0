Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AEFCEF141
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 09:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfxCUWrWzvVlnA9roJq/uh4DkMbQvf0YjSCBq8NfOco=; b=qdafBvFgz05USt8pXmul45ZMqj
	fDz+tzCB78kjsFFoB4CCN4LC1Z+/and41uo6AgUTzVT7MsVobxj3kWq7P6bQA6wDRbhVIUTlW4COI
	hKMYpyHsNBmVauufrGewfNe/+7wN7w31xe9lo9AX2CqVC6zYoennAB8SidByZTk8ByH3/kLpDe0Dx
	sYr0I6XmJKe16O7RR9nBgojnztVn1fW8LdOw4iblMBZLym1+F/9ssLogsIm85CRtgs5A2cKoaTu2S
	B7XWor89ohcpgxe+z7aKWLexaGfjyIx1srQXZd9LGhOkk3x6OG9aYC386T593WbpZ0Adm3HjNJ5oL
	JVpmwejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6Qd-00000005HMT-26wA;
	Tue, 08 Oct 2024 09:22:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6DQ-00000005ExE-3VY2;
	Tue, 08 Oct 2024 09:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728378550;
	bh=VcBPpKEVgFfMDZkzhrWAutVnb7BL+fVfq11Zhn0EkLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jseM6zZJf+5n4xsFf6SROfF6nJz4IQhcqrTZdT0+iFaMJ3uEqlSmNv9xXeCOpseF+
	 U6Wm84NxLx+glkd5ts+2k5hamnalBeS6K/SbSBe9k3W0qOMyyXu35ZH8L10RTwQxaG
	 5eMk3skUSKkfEkd7Tz3y74gUy5Q9M1zKuG0LyLzxZb7ui23uFje5PcLw5S35A/J67T
	 C/o/qn4qUePWiwE682hhg9MpPjYPEZq6Y2rCKpxxdurFTolHoA9Z6hgPaaGDWY6o1X
	 +PnCRM8mUsfmIW3KsuqY8g2jKs96J/HKRgaB96hL8b7UqQNlc0OHm/mX5ZkbvtwHb/
	 zw/3rkgrXFFQQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B3B117E10D3;
	Tue,  8 Oct 2024 11:09:09 +0200 (CEST)
Message-ID: <e9277edf-d372-4a8e-881c-49a907f0a883@collabora.com>
Date: Tue, 8 Oct 2024 11:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8195: Fix dtbs_check error for
 tphy
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Seiya Wang <seiya.wang@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20241008071540.32607-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241008071540.32607-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_020913_105136_FD4431CC 
X-CRM114-Status: GOOD (  17.97  )
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

Il 08/10/24 09:15, Macpaul Lin ha scritto:
> The u3phy1 node in mt8195.dtsi was triggering a dtbs_check error.
> The error message was:
>    t-phy@11e30000: 'power-domains' does not match any of the regexes:
>      '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
> Fix this issue by dropping 'power-domains' of u3phy1 node.
> 
> This is because MediaTek tphy dose not need to add mtcmos.  It is not
> necessary to add 'power-domains'. If the power of the tphy is turned off,
> it will affect other functions. From the current USB hardware design
> perspective, even if mtcmos is added to the phy, it is always on.
> 
> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> Changes for v2:
>   - Add detail description of the tphy design for explaining the reason
>     of this change.
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index ade685ed2190..1c6f08dde31c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1920,7 +1920,6 @@ u3phy1: t-phy@11e30000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   			ranges = <0 0 0x11e30000 0xe00>;
> -			power-domains = <&spm MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY>;
>   			status = "disabled";
>   
>   			u2port1: usb-phy@0 {



