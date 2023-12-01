Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443E8C07E97
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xo71djxsajeHBJ5KglpltjotuMnLdVy6TyZrZ9dX9t8=; b=t5SrK1AhPBNvpE53IaeVPTJCAb
	wa/3KZP2M6w83PQxlZHcL/UqJXffEqVdtRU0T+hKtUldDAOZAU6R5TCudh5jeEgXoegjz8WGBYqzH
	3VBBmlIBKEI8530b9fCwLvsPdou8mJr4hz+L3L81E23gYEnSK166irx/LiJhcUU6zsKSDRqNHOGC1
	n6EX0swvE5KcP5BrqxfXg1G0TM1wNlgAMIDWDRb6+3Gf1WJYTMWE3EoaLtpZjjg7woI6zbvVroLZz
	i3J/elBOUeru8QGG+2v9Kmu2F8LPNeENP9DauY2o/qoPiiBlv2wQ3LJGqPz/wkyBrRTkFRyCDdHrh
	dtdw0CNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zVx-00D3jW-0a;
	Fri, 01 Dec 2023 09:08:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zVt-00D3iv-2D;
	Fri, 01 Dec 2023 09:08:47 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AC51660739A;
	Fri,  1 Dec 2023 09:08:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701421724;
	bh=PrNOiryV2LYy+Uuh76/Z7l/ZUYqlS9fP9X5q/gjltQA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kEvXUR3YKIgGpnJipALuVIaL1ELMcPFqwdfQTihCWtCUznQgsfPU6z6+h/7vwHpax
	 CjE/RbwjYK681YEWe7jxwZgYcfVk38p0+DyIgfCjd65aezEKSiV5Yo/GswRXkJd4Yt
	 cEqDBqtBvo+S4VcXNZBjCmOjXJ00bKNOq5Bay27zNK9HCT8ocGkwpDrFeyQTZeTMjq
	 U6DmOdYoHrIjmGjkilxMTSG0fGuanWhNHrq2W2u14+Bi6x6EvfDxbWM8B07/CqS9hV
	 tgEchnPGERtFi2W2ft9YSOxW2Oo2TAiqy2tmICV4e3RwmtunB0uOs27k029+O6DhKZ
	 Fxb2mHk34uqqg==
Message-ID: <d4f33b5c-f80d-4808-8e94-5c01eda34f10@collabora.com>
Date: Fri, 1 Dec 2023 10:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi
 unnecessary cells properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 matthias.bgg@gmail.com, kernel@collabora.com, hsinyi@chromium.org
References: <20230814071053.5459-1-eugen.hristev@collabora.com>
 <170126437824.153055.10626099314938040381.b4-ty@collabora.com>
 <299f569f-c3e7-4807-a141-4bbc06435f03@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <299f569f-c3e7-4807-a141-4bbc06435f03@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_010845_855128_C8277E97 
X-CRM114-Status: GOOD (  10.58  )
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

Il 30/11/23 10:01, Krzysztof Kozlowski ha scritto:
> On 29/11/2023 14:27, AngeloGioacchino Del Regno wrote:
>>
>> On Mon, 14 Aug 2023 10:10:53 +0300, Eugen Hristev wrote:
>>> dtbs_check throws a warning at the dsi node:
>>> Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>>>
>>> Other DTS have a panel child node with a reg, so the parent dtsi
>>> must have the address-cells and size-cells, however this specific DT
>>> has the panel removed, but not the cells, hence the warning above.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi unnecessary cells properties
>>        commit: 4b66a34afe29d991155081b2f1e10482bd00cbaa
>>
> 
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
> 
> You know, your SoB implies review. Unless you want to say you
> usually apply code without reviewing it...
> 

Yeah, of course it does imply review ... but if there's no actual problem with me
also sending a R-b tag, it's more practical for me, because:
  1. I have mail filters to show me what I reviewed, and
  2. Matthias also can see what I reviewed....

...but I get it that in the specific case of *this* patch, I've sent a R-b just
before applying, so I agree in that this was actually really really useless to do.

so.. whoops :-)

Thanks, btw!
Angelo


