Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2906C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngVaiBOtj+FRtzhR3JUNryIUhMxAiy0rLQQ01yL7dFs=; b=Ox6jANBGG0cRWmn6soaLhVFed+
	zhdbessSjX3iYvzW+9W1Q2aV/2bWlYIv82J95YkA8iqWWPqfM4RnN/4EPnK7gZG8nImX5GiM9EdNj
	74Ve2g63kc5Jpismky38A57Ql+zm9K7o519WYcwPQcpwhrXBrPP2/J6h5vqnZnQeRE0o82+a11Bxz
	Yx5Dn+bKxiKUSV6Syzodz9OukoZfeGuAlsV/GRJqQEAOXHxsSXyx49cTCU45+mWfF3iQGcMN2XcgV
	NpPmk7E2qbXbzKt7456x1wV/GVQGG5jAx/+GZPhPntr8p9wCEdCKDCcvSQGA6Yi92hcU+lBjt8m2t
	LSiWJ6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEtrI-0029vd-RM; Mon, 09 Jan 2023 15:14:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEtqY-0029Rv-Vh; Mon, 09 Jan 2023 15:14:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C78DE660036F;
	Mon,  9 Jan 2023 15:13:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673277236;
	bh=OeYfEBPCu7fJ1Kg0yM6/gC8R+9+zgNLojttt7HhxyLI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oQiqv5huad9LHUBf0CGIxLMsqCtsYrfsUR7kGCWr5AtfR3BTH20CFsO1Aj0SaNt0W
	 KGkbggcMOtua5QIykkC8nkJunPbyEAX/ONUiT2oHLxYoQWEUP43jXH5sZAuLEtdTHM
	 ixuY+g56jyCmHPzhgykZxkXiO1h2N01vkJZvi+ZddoMheoSwMho3smTm98K0wmPrp5
	 VhgnGqdPdm80L9pOOAtrWRAXDBhCeGOe4AjMuWcEh0u0QgxOOy27sBXeEFxLbA7Omg
	 kn3pIE7NaYSJfkhX3aXTi8bbZBoCvpo6A1bAwAw8CGn4+5iJfYeMz04YIvgSh0jCD+
	 TAhCTxfoWqYSA==
Message-ID: <0ae6a31c-9a7b-ff05-08e1-eed96e672bd9@collabora.com>
Date: Mon, 9 Jan 2023 16:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and
 IOT's USB configurations
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Miles Chen <miles.chen@mediatek.com>,
 linux-usb@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230105092809.14214-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_071359_409313_33CF2E2C 
X-CRM114-Status: GOOD (  21.97  )
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

Il 05/01/23 10:28, Macpaul Lin ha scritto:
> Introduce the split MT8195 laptop and iot USB configurations.
> The hardware specifications for LAPTOP devices is different from IOT
> devices. The major differences include some hardware constrains for
> dual-role switch for USB controllers in different configurations,
> especially for power management and other control flows as well.
> 
> Here are some hardware specifiction differences listed:
>    1. LAPTOP (Cherry Tomato boards) don't support USB gadget (device mode).
>    2. IOT devices must support multiple gadget devices and host mode.
>    3. Dual-role switch is not fully supported. Only USB PORT0 support
>       dual-role switch.
>    4. Power management is designed in primary and secondary dominator.
>       For a dual-role port, the device controller is the primary controller
>       for power management; while the host controller is the secondary.
>       LAPTOP devices should remove device nodes for avoiding abnormal
>       behavior.
> 
> This modifcation is to add USB configurations "mt8195-laptop-usb.dtsi"
> for LAPTOP devices, and add "mt8195-iot-usb.dtsi" for IOT devices.
> 
> To remove common USB configurations for mt8195.dtsi and switch includes
> dtsi these new files for the boards will come in next patch.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

I'm mostly sure that there's no reason to split the two configurations.

I agree in that Tomato doesn't support gadget mode on the Type-A port and I
honestly don't currently know (and I'll test that later!) if it would be possible
to act as gadget on any of the two Type-C ports.
Of course I agree on the fact that a laptop acting as a gadget may not be useful,
but that's not something that I want to judge, as someone may find a usecase.

In any case, even if Tomato does *not* support gadget mode on *any* port at all,
I wonder why we wouldn't be able to probe MTU3 (and correctly describe the SoC)
on Chromebooks but only on MT8195-based IoT boards...
...and in case there's any real issue, we can always force host mode (with a
generic  devicetree property!) on the MTU3 on Tomato.

Finally, if we're able to add MTU3 to Tomato boards, this means that we won't be
seeing these two DTSI files and that USB nodes are still going to all lie in the
main `mt8195.dtsi` file, without all this duplication that I'm seeing here.

What do you think?

Regards,
Angelo


