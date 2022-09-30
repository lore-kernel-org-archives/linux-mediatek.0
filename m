Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55887C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 22:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWEB/rLB4YuBED/9tszyVWJroTsFU3+z5EIjhz2gcPM=; b=vt9oTdVkvoPskT1NlX2gTR4cea
	LOsBRs5ysXDxFFB7gXYyF7U4xTJUB5WJzxpeYVQz3wn9NbiQRyQdkbXZpW4/JEEIZFLv3TlHGgDKn
	aq7Csix6+OKztHHxBJzXpUeAU8nA3vE+TYsp0cqRQAtj3nO4guirfwUQvv9PwJfvwg0Ix6GD9StTV
	0fKBsxuF1AQ1EN61AUPcJP8rzBMrIDeoqvAunMHwDDIuT6MQ/XEFHrMGa2PJU4wP5p7PTLkpyGzcR
	RHUQ4FDB3Du3cXAkv5nYI4gXiCEmKl+WymTrKQfb65WzqOgwsvAQwhoDvxfoPL+JM2uTpsz4Od1hW
	gDg/MAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeOEb-00BosW-Hh; Fri, 30 Sep 2022 22:11:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeOER-00Bop5-7d; Fri, 30 Sep 2022 22:11:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8888162535;
	Fri, 30 Sep 2022 22:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74E6C433D6;
	Fri, 30 Sep 2022 22:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664575901;
	bh=jWEB/rLB4YuBED/9tszyVWJroTsFU3+z5EIjhz2gcPM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HnYwT9bjmJ7KKe1kNE30DKjtaqP/oXYtkzYva1LOArVN3YvMC7/GD68i/sxbMxNTP
	 7KmlnErLQHN0p9ONKqM9XzBXxVMpWJxxa5l91UE3g+F6pAGCz1nakEjApj7Cc7qIGZ
	 hRYYC+5XvF17a2pIwP9uEFjZOPUJlpm2Y7xraptoXMCiK5UXaPduvSvJyyr3lug/pM
	 8ga0OPv6HrOTmwPzQTQ6setSxsGezc+loy2bdS6ofbCW04RR+bMkNW0tOvAYcfpAh2
	 fqIKyOrq9wUR6SGSFMe1GzqovpGFIiVHgpkwKYRpvd8CrpEphso6SgYpwp03rFTtTZ
	 ABIX2UiZ7Uj0Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220822152652.3499972-2-msp@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com> <20220822152652.3499972-2-msp@baylibre.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: mediatek: add bindings for MT8365 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <parent.f@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Markus Schneider-Pargmann <msp@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 30 Sep 2022 15:11:38 -0700
User-Agent: alot/0.10
Message-Id: <20220930221140.D74E6C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_151143_324064_3CB6671A 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

Quoting Markus Schneider-Pargmann (2022-08-22 08:26:49)
> From: Fabien Parent <fparent@baylibre.com>
>=20
> Add the clock bindings for the MediaTek MT8365 SoC.
>=20
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---

Applied to clk-next

