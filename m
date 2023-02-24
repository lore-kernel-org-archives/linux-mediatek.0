Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F328C61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 13:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wbr6LFEUXNON8lgHODiQ8ZT/2LcFGlYZDnmemH8Jt7Q=; b=C+U/IJI2K30zMP+8FDlhWE1V0b
	1C64ucfaXCJFFXgxFKnSvIUQoqEx1e+v8RtNfse4RRnMcOkqUGwm9hpbOsj8s7H+oGXJi32QPDLQb
	zdvmckl3sGopWCPcUTBm/HFj8GeyPFwljKJEFOhIcMD5TuKCkhDNiqFy2IYxMT3qLTQqBePrf07qB
	TjiVst59E7zLBU27GQVN7Z4Idhb2BMvuS74g1ZwirSgB6RH1QQbovYhXFVeZyPKjtK41+m6bcX4mZ
	gh6ys0bLgJ0kblIL8YbdsAIH+6IMzei3nRrIdTzvVBHoZmCPCcBWgFknoi5bJX1pzkbuJnnyYWo9z
	s8ke9qVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXqX-002ZDW-Qn; Fri, 24 Feb 2023 13:10:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXpa-002YiW-VT; Fri, 24 Feb 2023 13:09:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F3AFB6602FB6;
	Fri, 24 Feb 2023 13:09:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677244184;
	bh=eNRVBTrYla/JuAHqdu3DfZ00wg57f7iLgICRaNb9Zh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QtxSPp6n7A2HoEqRKa/hKmrhjzgs7KgoDfuIwGGbuWri+axuqr+i1FYKXHNeBy2gl
	 FO9/Oeb7LOyBn2GQkGfbtutzbjbuMlW3FeZ0VqzjOtrPoX2LNuT8Zuc7HQYOZKzRFo
	 9rVeinBG3lZ7VLJGtFVBboXPSge2Gkr0n6l7ZeQ+rKlNDogi399JN34fAUlkM6zjNB
	 OumQLNy899WgRda8wehFeyZViqMNxLVtA/36YznDKneBjvxLF6TTWwmUmukNOIwrP/
	 zPbaMxHPgD76B3a7ancx1R9yhwnw72SENmz/53qEXjRcASRmozUfxW5sFleN4/B4mX
	 pREtAMGa8ia/A==
Message-ID: <9e12c33a-998e-7042-27b7-320be99940ea@collabora.com>
Date: Fri, 24 Feb 2023 14:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 02/11] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FK8BjSgwS5276FJj4zG_3STMbQwQWdyn3LjOvQ=108RQ@mail.gmail.com>
 <CAGXv+5Gv19nijoW5i8=Ouh4H24X3pknM3ZBSo9Tgv8XkLt+XbQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gv19nijoW5i8=Ouh4H24X3pknM3ZBSo9Tgv8XkLt+XbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_050947_355661_356D514A 
X-CRM114-Status: GOOD (  12.42  )
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

Il 24/02/23 11:09, Chen-Yu Tsai ha scritto:
> On Fri, Feb 24, 2023 at 6:08 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> In preparation for adding new bindings for new MediaTek SoCs, split out
>>> the power-domain-names and power-domainsvariation from the `else` in
> 
>                                              ^ missing space
> 
> Once fixed,

I think you even mentioned that already, ugh. Will fix.

> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
>>> the current mediatek,mt8183-mali conditional.
>>>
>>> The sram-supply part is left in place to be disallowed for anything
>>> that is not compatible with "mediatek,mt8183-mali" as this regulator
>>> is MediaTek-specific and it is, and will ever be, used only for this
>>> specific string due to the addition of the mediatek-regulator-coupler
>>> driver.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


