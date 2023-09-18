Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EED7C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 20:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOr9w91T+ds4SmTeXHa8VfhYE/qadbLyHETqw7pcL+k=; b=NmGG88vCEoLj2YBVc7BJQshaMd
	bIwVcjPFoIgfobzNprSDZ/j27Q+vShrywZMHwu0RJCu2i1BkkG+Mn+tddRC+prlJeXMWrf5hBPpvU
	xUw654FaJBMhl2Y03eph+OdDZu9a62Jb/UiPxXKueJkBvnTB85K4huupMh+yA+sBh7OnXIyzIss0G
	YSQqddl6beIZQ3by3js8pQWEEqcgkSVqJ8i1RVqTlHgaeemyiLNJ9XHQkWjJzCmCrYcugPhomlwgs
	QdeIlF2w3no+2XIrO3Ktxz+HCAj+IZ7XUcFduJ22ouphNqRSC6HtbFqh8KKf16gvUDjgDpXsEpNj2
	qs1ihsFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLAg-00GJkw-1d;
	Mon, 18 Sep 2023 20:48:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLAd-00GJji-12;
	Mon, 18 Sep 2023 20:48:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8C25AB80FE3;
	Mon, 18 Sep 2023 20:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67386C433C8;
	Mon, 18 Sep 2023 20:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695070114;
	bh=Bo+bZhZuj9bWW94JFZSXNjfJwa6uMxx0LXt2pIQ+Fzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CodZ8P7WHzDqXcSxW2bOFAkrXOgbSARbKSWfTdbrirhlxJAYY+FY+0phDJZyxamo4
	 /eQOCL5OKCXxLDCszEbx9XZP+cNKgyHYgCik72ahpXNJcMZhdnBHtASrJMFNJHILbq
	 RzPR35YlvzgQxQsoseW3xLzYXWn3lcQGjI+ZusgyiRLfGC5rYtB5eZO9GKce5bVoUO
	 ahdpZ0B/N/ykm20GizHNPDiY9sFYm5l8Bs3WlK9vk4TFJVfT5fNqNMvtjNvAr+3Iue
	 9z9s59mZ1TKIGGUUYzDhYcyxaV1QFA5pWBe3z8FTdPzD35uh5ehgtZuinGDRDGhmAA
	 FQ558CDgHX/hQ==
Received: (nullmailer pid 1743079 invoked by uid 1000);
	Mon, 18 Sep 2023 20:48:31 -0000
Date: Mon, 18 Sep 2023 15:48:31 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mithat.guner@xeront.com, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mtmips: add deprecated
 ralink,rt2880-pinmux
Message-ID: <169507011071.1743029.15067549858483442.robh@kernel.org>
References: <20230917162837.277405-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230917162837.277405-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_134839_507641_ECBBECB9 
X-CRM114-Status: GOOD (  10.04  )
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


On Sun, 17 Sep 2023 19:28:36 +0300, Arınç ÜNAL wrote:
> The "ralink,rt2880-pinmux" compatible string applies to all MediaTek MTMIPS
> SoC pin controllers. Add it as a deprecated compatible string.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml | 5 ++++-
>  .../devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml | 5 ++++-
>  .../devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml | 5 ++++-
>  .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml   | 5 ++++-
>  .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml   | 5 ++++-
>  .../devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml   | 5 ++++-
>  .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml   | 5 ++++-
>  .../devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml   | 5 ++++-
>  8 files changed, 32 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


