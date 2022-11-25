Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD36AC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 11:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pfmGj3n+/D4OOR0KW1UL0Yr1eU1di1nwqLF0WEzrPA=; b=W1O3DN6F2QJo5l7p3y/FwSy50J
	NRZpzuudqyzfDIHIgJv8zlV9bmFZNngsD0TBn09PZPDYKr3Ir2MpN8NUhk7jAYc2xzmXcbw9X7Teg
	lybO3ZS0Zi+/CrvUyRs7NG/0CBvlRkoar/qJ1rhG/0sAtlDr0W8whfxMCAyeFTR93OopWbp0CYGgG
	QEB3dfHP8J4kaO5dnTmTnH6HV7Lf9fI4PsFbriYY8SdIIq5N6mA79xIKLjNzIzPt+UKzhEk+pTAff
	FFiUVT16Wt1gzTKJYzIl1bXicaY9i3OTwDlX33QjPfNUWmSVxMgODo/EstxKyOQ/ZsAapVIV8FxqE
	GB3O6asA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWdS-00FxRC-Ki; Fri, 25 Nov 2022 11:12:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWdB-00FxFZ-7A; Fri, 25 Nov 2022 11:12:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 538146602B09;
	Fri, 25 Nov 2022 11:12:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669374742;
	bh=yrGzlYyUJPuHN8Ic2oxE9qynptqYof+6qB23kgdmUJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G+ubczkD8YTiVw5jS7J4Sy4StxTZ7mOtUU4yMZPy4LeiF+B6WWeQO8W1iP/rcRzc2
	 5j6rV5MNGp66G89nKFaz/DNMiF3F6noRSrUtAzjRtFpx2uDP9hHbiIAdsJwIEqu2w/
	 0IseGaeWs01mmFd2QmN4zPWBDTK2PWILjfXKY1e3rhm1SEGb4htuhd2+ub6WQi/COz
	 o/Y+i9R5ESajKuivLjYvCz3mf6YqQjiMk0wWD8S5FtXMNWrOUGZxyDIJ9BpOEIzhgZ
	 cvxKpbN7UQhHkwBvy2IHx03sVRRNwXGH7XOIjIxfUAmWYAnXc5aYJpzyaOxtu+PC15
	 MrrZ6AwI87SOg==
Message-ID: <375d45fa-fdfc-37a5-9d32-b0412cad7bc0@collabora.com>
Date: Fri, 25 Nov 2022 12:12:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH RESEND v2] dt-bindings: pwm: mediatek: Add compatible for
 MT7986
To: Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.or,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, Zhi Mao <zhi.mao@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>
References: <Y39PjU1BqBB8tZ98@makrotopia.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y39PjU1BqBB8tZ98@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_031229_548065_38484064 
X-CRM114-Status: GOOD (  23.83  )
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

Il 24/11/22 12:03, Daniel Golle ha scritto:
> Add new compatible string for MT7986 PWM and list compatible units for
> existing entries. Also make sure the number of pwm1-X clocks is listed
> for all supported units.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> Changes since v1: list compatibles, fix pwm1-n clocks for all SoCs
> 
> Rebased on linux-next and re-run scripts/get_maintainers.pl on patch to
> makes sure dt maintainers are included. This has been requested by
> Krzysztof Kozlowski.
> 
>   .../devicetree/bindings/pwm/pwm-mediatek.txt  | 20 +++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> index 554c96b6d0c3..952a338e06e7 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> +++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
> @@ -2,14 +2,15 @@ MediaTek PWM controller
>   
>   Required properties:
>    - compatible: should be "mediatek,<name>-pwm":
> -   - "mediatek,mt2712-pwm": found on mt2712 SoC.
> +   - "mediatek,mt2712-pwm", "mediatek,mt6795-pwm": found on mt2712 SoC.
>      - "mediatek,mt6795-pwm": found on mt6795 SoC.
> -   - "mediatek,mt7622-pwm": found on mt7622 SoC.
> -   - "mediatek,mt7623-pwm": found on mt7623 SoC.
> +   - "mediatek,mt7622-pwm", "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt7622 SoC.
> +   - "mediatek,mt7623-pwm", "mediatek,mt7628-pwm": found on mt7623 SoC.
>      - "mediatek,mt7628-pwm": found on mt7628 SoC.
>      - "mediatek,mt7629-pwm": found on mt7629 SoC.
> -   - "mediatek,mt8183-pwm": found on mt8183 SoC.
> -   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
> +   - "mediatek,mt7986-pwm": found on mt7986 SoC.
> +   - "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8183 SoC.
> +   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm", "mediatek,mt7986-pwm": found on mt8195 SoC.

I'm sorry, but all these compatibles make little sense at best.
Each of these PWM controllers have different properties as they may *by hardware*
be featuring more or less channels, they may be a different IP revision and/or
sub-revision requiring even ever-so-slightly different handling (check pwm45_fixup
and has_ck_26m_sel).

If you want to add MT7986, the best thing that you can do is to simply add

+   - "mediatek,mt7986-pwm": found on mt7986 SoC.

this line ^

...and then please don't touch the others.

>      - "mediatek,mt8365-pwm": found on mt8365 SoC.
>      - "mediatek,mt8516-pwm": found on mt8516 SoC.
>    - reg: physical base address and length of the controller's registers.
> @@ -20,11 +21,14 @@ Required properties:
>                   has no clocks
>      - "top": the top clock generator
>      - "main": clock used by the PWM core
> +   - "pwm1"  : the PWM1 clock for mt7629
> +   - "pwm1-2": the two per PWM clocks for mt7986

That's not your fault, but the binding is already wrong (yes it must be fixed!) and
unless my brain is failing somewhere, there's only one clock per pwm (as if there's
any children, it must be parented to .. well, its parent, in the clock driver), and
note that the driver is actually parsing "pwmX" clocks, never "pwmX-Y" clocks.

Relevant snippet:

		char name[8];

		snprintf(name, sizeof(name), "pwm%d", i + 1);

		pc->clk_pwms[i] = devm_clk_get(&pdev->dev, name);

Just... please don't keep doing the same mistake that is already inside of here...

So, coming to an end: I think that this commit should be a one-liner that documents
your "mediatek,mt7986-pwm" compatible and that's it.

A schema conversion would be welcome: in that regard, I can make a conversion
and send it next week, along with that clock-names fix.

Regards,
Angelo

