Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05740C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 15:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWRpfSh7Y6/HjI/txFzpfXD06V97Su2IJPC3QF0OR/Y=; b=YgO2HnswykUdMJYhZKUPoh+WXh
	A5FZ8apcW4iLp+iv5IoddT2j8iCHKo5sqw3lGOA/JK3dXn/M/5gb3rV+HzGblO6WLLpopJTcbiCyk
	JG2JQVo5Aa7z8mvoOUwG9CcqbjjC/JCINUxXUoZ7LV95VhDMPkKbNcmtXR+WxLB4CwfLouE21iFXw
	7/uqv3Wur71EsVyPrhZxe+W3yKVztMk6fbAhoJALs77xfTJxlSyjm6ewQce0YeevUt4KLrRN+qgIG
	4N7KLPgfL/uskm/HqhcKNJTU6+9aMJAQ6Ia+ZBHG9hIFybG4EelK1rpHCYlQIo03AQZQZairzuKaD
	DzW5AZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC14q-00Ftow-3u; Thu, 14 Jul 2022 15:48:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0ur-00FnOR-G2; Thu, 14 Jul 2022 15:38:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 123ECB82158;
	Thu, 14 Jul 2022 15:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57CBC385A2;
	Thu, 14 Jul 2022 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657813089;
	bh=U9G5H+F5ke4Ig1zhCGdP+JXYur2miSUshKx7+9DJkZk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ntY6kk5rfRV/jplMtoO0VwrEPFtoYYymHPd19E+KscZ4zy+/+P+t9mZYZEf9XC2DC
	 bhYylukM6lpZwkEwUgC9UdUJliEBYkJQ4g/4soxJmsjapha3zIDibt9L/oBuv0g68M
	 redoVX+gBo2DDaV2XvKK4Kt7sGYWdxiWFm8Nn2U4xiJXLXat/FfzWN0WagJcrKbJM6
	 P0AEstXeJfYTDI7D0UfxoP7Jps1ciz97fusNVpTfCRRU5ExLryBTL4cTyuyWhEqcto
	 u9wprbirqr0GcN/ny3jsWZc5g6opGKzmcaxd+QywRP7Z4Wc7QLPkM7tsN2DrLSKQHk
	 +xo8rO5Ua7BDw==
Received: by mail-vk1-f181.google.com with SMTP id c185so964940vkh.12;
        Thu, 14 Jul 2022 08:38:09 -0700 (PDT)
X-Gm-Message-State: AJIora8CPFueTKFJXKxILPV/v33CKwU6NQnxZc5dQxO3KWgHi6e+kOUk
	P/uAXkQDG/jFCIHjVvlkCKbrdz4JRZDYtss11w==
X-Google-Smtp-Source: AGRyM1ueakcaqefdrg7VLkKXk8mWYborOH3gMs/rbv3OLb8P/RdVgXMatAj03gLpnDmmrBTDHwqD6nygYxHFXTW2Wnk=
X-Received: by 2002:a1f:2049:0:b0:374:866b:6dd8 with SMTP id
 g70-20020a1f2049000000b00374866b6dd8mr3907873vkg.15.1657813088619; Thu, 14
 Jul 2022 08:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220630131543.225554-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220630131543.225554-1-angelogioacchino.delregno@collabora.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Jul 2022 09:37:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLY7eSLKhRrL7hx9jFxTm-s=MmdXOVVJv3667fSoeSvSQ@mail.gmail.com>
Message-ID: <CAL_JsqLY7eSLKhRrL7hx9jFxTm-s=MmdXOVVJv3667fSoeSvSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_083813_727886_95DC6111 
X-CRM114-Status: GOOD (  14.82  )
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

On Thu, Jun 30, 2022 at 7:15 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> As was already done for MT8192 in commit b52e695324bb ("dt-bindings:
> pinctrl: mt8192: Add drive-strength-microamp"), replace the custom
> mediatek,drive-strength-adv property with the standardized pinconf
> 'drive-strength-microamp' one.
>
> Similarly to the mt8192 counterpart, there's no user of property
> 'mediatek,drive-strength-adv', hence removing it is safe.
>
> Fixes: 69c3d58dc187 ("dt-bindings: pinctrl: mt8195: Add mediatek,drive-strength-adv property")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 27 ++-----------------
>  1 file changed, 2 insertions(+), 25 deletions(-)

Now failing in linux-next. Looks like the example needs updating:

Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dtb:
pinctrl@10005000: i2c0-pins:pins: 'mediatek,drive-strength-adv' does
not match any of the regexes: 'pinctrl-[0-9]+'
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml

