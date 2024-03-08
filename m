Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB81C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 12:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQFLpfmyEqeXPKgqckeD2rd+DY5hIF5n/f8YwLuQ74w=; b=prqJU4L5z7qAGPVr539PracKmr
	x9sWwTNJthbhptN05YdzQv/+lNPLzYPPY7DRRoBP8ijHm00nlyL2la5W+MPV3KPu8MCktSzplX7O6
	PxQqNT0J+/NTXDpQJikjDg68vyv6qxr2YrlzilimubhRqtPgBYVrnotWXTWgRA6KOWv9PSUtYG2LK
	LN+pfzTU6lq4StnhqkswpO2tcE0yt0RFmv2Z1uIcQmmTvBxdEr8LxPE9lb4BEjElEDMN0QIXD5+no
	KqPmRzeQ/lmGqyh0glImxN/3A3HI3nPyjmL+odf2MEdRDhn4Kt8KasRMH3FuwNsLcoQc+NCSTSYgE
	+2XedyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riYud-000000093Fx-30B6;
	Fri, 08 Mar 2024 12:01:19 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riYuZ-000000093EA-1CSs;
	Fri, 08 Mar 2024 12:01:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EFDF7240003;
	Fri,  8 Mar 2024 12:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1709899271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GQFLpfmyEqeXPKgqckeD2rd+DY5hIF5n/f8YwLuQ74w=;
	b=RqQcen2rU6DljnjLVlUeNiNNuf9fm3lZOkjI55/yyHCmvShczq9vN3ZJ14+nSt8BMKYGO1
	wKRlLOr/UwG6pcKGVVXYtqKBKJL9hj7nmvuYeniwqbILC6NzGJ1m/UFSYqIYNIXkKn6BXk
	p/pwpdcOoNLZVpShHlBCBJRqXD4FDL98f54Zo5C8rADOrLZFa59wIpTeLsg6UluaoRE9VB
	uUGZzD/WTi5GYch6f73VKRaOFHdopxNAzh4Y75Z+2Eb1DqHjlsOiIes9VJQuKdibJg2kV0
	xpBWX+oGOy72hio8Eq00BRTwk7XUkBj3lNL7XoDx7eSPyNtapfA5++IhfvhNEQ==
Message-ID: <c445fd12-f8a8-41df-bee8-8b126b26110b@arinc9.com>
Date: Fri, 8 Mar 2024 15:01:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mips: dts: ralink: mt7621: add cell count properties
 to usb
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <0001-mips-dts-ralink-mt7621-add-cell-count-properties-to-.patch>
 <20240307223756.31643-1-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240307223756.31643-1-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_040115_503679_9862D9FD 
X-CRM114-Status: GOOD (  16.70  )
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

On 8.03.2024 01:37, Justin Swartz wrote:
> Add default #address-cells and #size-cells properties to the
> usb node, which should be suitable for hubs and devices without
> explicitly declared interface nodes, as:
> 
>    "#address-cells":
>      description: should be 1 for hub nodes with device nodes,
>        should be 2 for device nodes with interface nodes.
>      enum: [1, 2]
> 
>    "#size-cells":
>      const: 0
> 
> -- Documentation/devicetree/bindings/usb/usb-device.yaml
> 
> This version of the patch places the properties according to
> the order recommended by:
> 
>     Documentation/devicetree/bindings/dts-coding-style.rst
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>   arch/mips/boot/dts/ralink/mt7621.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
> index 5a89f0b8c..7532e17dd 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -289,10 +289,10 @@ usb: usb@1e1c0000 {
>   		reg = <0x1e1c0000 0x1000
>   		       0x1e1d0700 0x0100>;
>   		reg-names = "mac", "ippc";
> -
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>   		clocks = <&sysc MT7621_CLK_XTAL>;
>   		clock-names = "sys_ck";
> -

Please keep the empty lines. It's easier to read. I don't see anything on
the Devicetree Sources (DTS) Coding Style that would restrict this.

Arınç

