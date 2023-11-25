Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD6AC4167B
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 19:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6CfNN2Z8X5QY5A5KOdO3deQpJm61wgO3/ulw3bk6T8=; b=fBNzv8AbFaJ6dqYRrJvGCINUBn
	14braNCEEM+VC+odCosS8oVfREJ5zkuXCbDX4Quju5oRWNIGk19WfxrlKAU8JkdazaS4oJjGXvaVY
	lS8qPp/q8ydTTiZhNyzew4DEEfckelwpZb5txUUV7PS7xAYMEQ4nYsXfVfrFeb5AGRO7Lh12ej+ji
	f3Q43dSg6F5Iz8/g2RAVw2ePTSJtOtLM9fp467SeeLRah7OdVlF2YyOl70bXUnIOyL1ASBwB5d/rc
	tktxDHSBZAIN6yng0WJe+pwiYy9BSE54VzfiGhRTk7mm2h+/IutzJt5ySnAWTXo7dwpb+GVuKKg5h
	GyA43bew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6yPc-009iJ1-2q;
	Sat, 25 Nov 2023 19:33:56 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6yPZ-009iH7-0K;
	Sat, 25 Nov 2023 19:33:54 +0000
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5E2C32EF;
	Sat, 25 Nov 2023 19:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5E2C32EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1700940828; bh=t6CfNN2Z8X5QY5A5KOdO3deQpJm61wgO3/ulw3bk6T8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HI8sPjWpWXJ+tKUEs/C/KfnLll4zPcwZBo+FLGeMzciNTwTO7K8O3z9GziJib49Tl
	 uYW3mXodk1C/2mS87I4QRWMZTXrzAhES8XZD9CLFG6rXQ4YESejjd0Oe7BYLFACboA
	 /ZSyhKd0VaY5Pnq7CaonASA88352gX5481Ldl4Lco9NiBBBpJxwzPcTzEn7zbny8Px
	 +fKOvn1NKV3myLst7a0q6xQBH2wbF2N1Bz2m/DjkMpyJtRTBDLRRVlWmjQVd2mgqbr
	 FiwwKTk5kLrpO6ROhVX50aTLOc5vNmA/1XnKWcb/8kBJmTZvzScP0VF5yBPfJgDQZ3
	 7F9SUI41fxu4Q==
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Davis
 <afd@ti.com>, Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof
 Johansson <olof@lixom.net>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <zajec5@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
In-Reply-To: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
Date: Sat, 25 Nov 2023 12:33:47 -0700
Message-ID: <87v89p1vc4.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_113353_144944_EB0DDF4D 
X-CRM114-Status: GOOD (  11.22  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Document preferred coding style for Devicetree sources (DTS and DTSI),
> to bring consistency among all (sub)architectures and ease in reviews.

One little nit:

> diff --git a/Documentation/devicetree/bindings/dts-coding-style.rst b/Documentation/devicetree/bindings/dts-coding-style.rst
> new file mode 100644
> index 000000000000..e374bec0f555
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dts-coding-style.rst
> @@ -0,0 +1,194 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. _dtscodingstyle:

There is no need to put a label at the top of a document like that, I'd
just take it out.

Thanks,

jon

