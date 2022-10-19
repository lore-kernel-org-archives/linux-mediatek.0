Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2547C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqvjHWUlk3KNFum9CdzugghlPYgbo32lSRlTs7sZX1E=; b=sByrQ/FU21BwJ7wrmAZUFLVbJm
	xL2KlyCcwxT6euVBFJ/seRfxOeuAyVzI7IIlzy3AZVFLc/KBWv88E3wahGGHJDuy76faH20x66Hnp
	koxsZlw4bqbkfYEJgqZqtL8LpDXao3CQTlx6EGaU0jkkXnX+/q6+j0i/8OrtaGe1iq5gGxuZtizkF
	DXVcqWBEVBny2EUmfskhLDWsyB20V9NlLP+AO6y15P5/Ik1DerJHhNcW25AFohrNplWE5Cuso5PzY
	6lGs0NujFKLpITiwqFNJqo+cOWRyApS8DhlyxDzl0km12RKZsVVCahC8U/leclbGW7eEfT2yuMn1T
	2VeVnlfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4SC-00GZEF-SB; Wed, 19 Oct 2022 08:29:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol4Rm-00GZ8I-Iz; Wed, 19 Oct 2022 08:29:08 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D3D016602388;
	Wed, 19 Oct 2022 09:29:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666168142;
	bh=ocWrVQMR3Z9kZzLMg8BVFlJNcN/HGEjR1aguO3cp0bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JslCHyyIYsNdzm6vEIetBjO8qkDZ/ptAL3uvjqbctSrFPeXp6ycqYEeYvuQ/rk3SE
	 m1vLNqJp0WOvN/qqMhIHUHGe+HO0NmOI7OcLVf0Mwm3li8sTr+h3xLZwiBdqYKBeuA
	 MytITpObucpWuclzLgmsf4eLGlxzpm1WgINdmBIo/uWbiGbokxPQ8kbvMRsHP+Hdwx
	 aJ1Bc+cN5c54wCsVIVhlnHsOXqmF+musNmIUniJQdOWyNX8H9CabdT5fh2VoDOD64X
	 6SoMfuVAF5hsoAfjGpHpsVsobEHrAmv/M1uLd0Hr4kn2O63JeTFY+Vac8yMRxaFyBW
	 tiL5rtbl75dQA==
Message-ID: <97916360-a24b-0e7d-cc86-9b801fadf869@collabora.com>
Date: Wed, 19 Oct 2022 10:28:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC v1 02/12] dt-bindings: PCI: mediatek-gen3: add support for
 mt7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20221017104141.7338-1-linux@fw-web.de>
 <20221017104141.7338-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221017104141.7338-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_012906_871775_992C6323 
X-CRM114-Status: GOOD (  23.28  )
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

Il 17/10/22 12:41, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7986.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> mt7986a.dtsi misses clock-names which are now required since support of
> MT8192/MT8188/MT8195. This change also introduces a 6th clock which is
> now needed for all pcie-gen3 dts.
> 
> i do not know how to map the clocks to the names...
> 
> mediatek-pcie-gen3.yaml:
> 
>    clock-names:
>      items:
>        - const: pl_250m
>        - const: tl_26m
>        - const: tl_96m
>        - const: tl_32k
>        - const: peri_26m
>        - enum:
>            - top_133m        # for MT8192
>            - peri_mem        # for MT8188/MT8195
> 
> mt7986a.dtsi:
> 
> 	clocks = <&infracfg CLK_INFRA_PCIE_SEL>,
> 		 <&infracfg CLK_INFRA_IPCIE_CK>,
> 		 <&infracfg CLK_INFRA_IPCIE_PIPE_CK>,
> 		 <&infracfg CLK_INFRA_IPCIER_CK>,
> 		 <&infracfg CLK_INFRA_IPCIEB_CK>;

If this SoC has a different clock tree... then you should add bindings for this
kind of clock tree.

CLK_INFRA_IPCIER_CK is *not* a peri clock: "peri" means PERICFG, which does not
seem to be present in this SoC... so no, you can't assign it to "peri_26m", nor
you can assign it to tl_32k, as that's not a 32KHz clock.

CLK_INFRA_PCIEB_CK can be a "top_133m" clock... as it is gating "sysaxi_sel",
which is a topckgen clock.

CLK_INFRA_IPCIE_CK is your "tl_(something)" clock, as that's effectively gating
"pextp_tl_ck_sel" (which is the PCIe Transaction Layer clock mux).

CLK_INFRA_IPCIE_PIPE_CK seems to be parented to "top_xtal", frequency = 40MHz,
so I don't see how can this be a pl_250m? Looks like being a 40m clock and I
wish we didn't have clock frequencies specified in the names, as "pl" would fit,
but "pl_250m" does not.
I wonder if we can change the clock names and reflect the changes to the mt8192
devicetree (mt8195 does not have any pcie node yet), and if that would be a good
idea right now.

...and I've left the first for last, because...

CLK_INFRA_PCIE_SEL: I have no datasheet for this SoC, but if you're sure that
this clock is selecting the source clock to CLK_INFRA_IPCIE_CK, then the clock
driver is wrong...

Right now, I see the following:

static const char *const infra_pcie_parents[] __initconst = {
	"top_rtc_32p7k", "csw_f26m_sel", "top_xtal", "pextp_tl_ck_sel"
};

GATE_INFRA2(CLK_INFRA_IPCIE_CK, "infra_ipcie", "pextp_tl_ck_sel", 12),

MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_SEL, "infra_pcie_sel",
		     infra_pcie_parents, 0x0028, 0x0020, 0x0024, 0, 2,
		     -1, -1, -1),

....so if you're right, we should instead have:

GATE_INFRA2(CLK_INFRA_IPCIE_CK, "infra_ipcie", "infra_pcie_sel", 12),

....with this meaning that adding CLK_INFRA_PCIE_SEL in devicetree is useless.

This clock tree looks a bit unclear (because again, there's no datasheet around),
but that's what I understand with a rather fast look in the clock drivers and
with some experience on other MTK SoCs.

Then again, if this tree is effectively incompatible with the one from MT8192 and
MT8195, you should have different clock names... and just as a fast idea:

clock-names = "axi", "tl", "pl", "top";

with clocks, in order:
CLK_INFRA_PCIEB_CK, CLK_INFRA_IPCIE_CK,
CLK_INFRA_IPCIE_PIPE_CK, CLK_INFRA_IPCIER_CK.

...but feel free to reiterate that :-)
Hope that was helpful.

Cheers,
Angelo


