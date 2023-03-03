Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7081C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 11:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTOaCzgj/BxJjNNBD+bjIj2CsWidDFU3+hKZax4NsQ8=; b=HrXVunV0VwdvkOBAvofTE2jfmQ
	7db7oAgl6gHEQqDpXVMrdR5MAkkBTb39dJdX0YtOwUXJkGXrvsJiOeRud466YYx6hqWIL4EnW6+Ek
	35PF0aj3jJqPyB0BH2IJMTCRF0HJfsa7AVxNiG3Fuf2Ev5GGwfhCs7kaRiNCcrMFuwMyI8YBfJNst
	+xeISJ/TRw4MOQBEpOhv0j69AwqNWdC9Q64zNjHvUixS7dfYLbiM6ykDRYqmmboGuvhI4Gl+XyLeo
	XBkxklv89JqSwXInX8b/gzwHSgsEDfuG68I+ArsNYTO9da8g7q6r+xglPcsDst6/uGNnBarJ5Zz0C
	txvqQYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3hH-006BEQ-TB; Fri, 03 Mar 2023 11:35:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3h7-006BBu-Ey; Fri, 03 Mar 2023 11:35:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 816886600013;
	Fri,  3 Mar 2023 11:35:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677843324;
	bh=eu7pJNx6dKERWOaTwlpIsno1hA3wEiySMHvMfeJYE70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OWAWMphgfQ/q3vgZj4XMqZ9atH2LP76OvMbrjwHXlP8Bw57UJoVPgLvwWjSEJ5bn2
	 p9tECf31NmQdbXNd94Uckl00o5aVSbd8/DteemZXQLDLMDq6Sf9LDD9fPh2TBJNZWn
	 P0zPSzRSzrubuVLANG0HfOU2l4VgTcP8LLHqIvs4Qw/XpxAx7Hxo3TXPTjUOFNIWLx
	 3eJPUCLV7MU56ifslMGhiXd6YUJOHCqdRE3sbIR9kUEIOGvbt5+5TpBqXhSRfXnRcv
	 XLQ6XGmx21zEbfP1NOnRp5m0Zz4pLvWrQGnZoOvc5hZlvDADapx11K05RKy0mRPNDJ
	 Sxzf45sVe0lSQ==
Message-ID: <8fb0176f-5587-e446-a084-05bd0572f2de@collabora.com>
Date: Fri, 3 Mar 2023 12:35:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 7/7] arm64: dts: mediatek: mt8186: Add display nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230303031728.24251-1-allen-kh.cheng@mediatek.com>
 <20230303031728.24251-8-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230303031728.24251-8-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_033525_679824_385F4AA9 
X-CRM114-Status: GOOD (  14.80  )
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

Il 03/03/23 04:17, Allen-KH Cheng ha scritto:
> Add display nodes and the GCE (Global Command Engine) properties
> to the display nodes in order to enable the usage of the CMDQ
> (Command Queue), which is required for operating the display.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 125 +++++++++++++++++++++++
>   1 file changed, 125 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index b9d5af26771e..909f1a6ae108 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -20,6 +20,13 @@
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> +	aliases {
> +		ovl = &ovl;

Are you sure that this alias shouldn't be `ovl0 = &ovl` instead?

> +		ovl_2l= &ovl_2l;

And this `ovl_2l0 = &ovl_2l` ?

Everything else looks good.

Regards,
Angelo


