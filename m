Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EC3C54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 02:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIq2XNSv0yqdGYVBR9gJeJ3g2wDYMFascBPP14gWnV0=; b=JR1udjf8BmmURAcJi3ZmQNwlHz
	QXMZk3ih//BDbzm4a9uh7LL1Lq5dFaa25h7IapGdBP8bEziRhJKTvYklDROkaz5HAxkqWrSpS9GZr
	SXBdZX/A48SjiSf2u+afu5QyUHzzyUv3thg8IdMYn1MSX5477gyeErStBLpXAe5jQ9z0UxhVeaUMc
	7mCJx+KskVGdxX0uRbqIa6oK/mFhrZ8nRKhG5bg7GxRFTaiIJGlTyNDDa+mq2suQUyELj0FSoxvUU
	ikv2S9DA/EBOtqceTl7CZvZVqtjFq7zm1gUQ4TSin/WxePP9x+cCe6cfXtwGWE++/WXGhemPE8Euh
	p5veMX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrg4-009PQ6-7Z; Thu, 26 Jan 2023 02:07:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrft-009PNz-8q; Thu, 26 Jan 2023 02:07:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9CAB1B80DC0;
	Thu, 26 Jan 2023 02:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42852C433D2;
	Thu, 26 Jan 2023 02:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674698854;
	bh=F9namJy2H7fXeX9apQRVPaLcYLheAotswZx/3mZWdJk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ffGT4D6kPViviUTwSZ8BlwETgHtu2rGL/6yh5gVjCjxwvq5fAmOpf31iXyHwljbIH
	 jwC2R7OpQdOETNo8LAPlmA83wlpq/P818izEeyitg3d0IZPCEQA1Xy5jrQsJBRfTpe
	 vBsBINStVguX31vOtvT6n6v5Da0W6DVF4W4fxZFKbsn7+SkzXdqQjdBRnlfyds5SeX
	 A8nfdUnyGMOyPXEQhG7nx8Tl4i5eBYH9P0vO/aj2UWXZVUY3NosLUSVi6Te1Oxxm2i
	 +ykZoT4gnyoub/b/5S+1iRyUo+BQoknb2cBUYI2lQe+/1N083eo8zEnrcSPVRgI0M9
	 Wo0/iSIZPLAIw==
Message-ID: <5036f36916e12429d6f853049a2e5836.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
References: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/6] MediaTek Frequency Hopping: MT6795/8173/92/95
From: Stephen Boyd <sboyd@kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, jose.exposito89@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Wed, 25 Jan 2023 18:07:32 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_180737_477583_A99B0B4F 
X-CRM114-Status: GOOD (  12.53  )
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

Quoting AngeloGioacchino Del Regno (2022-12-22 07:51:41)
> This series adds support for Frequency Hopping (FHCTL) on more MediaTek
> SoCs, specifically, MT6795, MT8173, MT8192 and MT8195.
>=20
> In order to support older platforms like MT6795 and MT8173 it was
> necessary to add a new register layout that is ever-so-slightly
> different from the one that was previously introduced for MT8186.
>=20
> Since the new layout refers to older SoCs, the one valid for MT8186
> and newer SoCs was renamed to be a "v2" layout, while the new one
> for older chips gets the "v1" name.
>=20
> Note: These commits won't change any behavior unless FHCTL gets
>       explicitly enabled and configured in devicetrees.

Can you resend this? It conflicts with your latest cleanup series.

