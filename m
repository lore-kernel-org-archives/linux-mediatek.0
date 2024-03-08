Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5BEC54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 08:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRNfku4bJomaaMySPXnQbieyDkZSMCDLiDec+DXd1LU=; b=NJR6qF75ru88G5MoDR7nc+CbA2
	ZDbb/TXyMFK+3XByILNmnbQGsFkojVv7IK+4WnGOfqPZFR63gHhL7XBvMJlrxStx/NE6brdSjG/CR
	fxmEMb2w3JOXqPKIPW4olCx1g9rZ6gURbkLBLIutfna1vmMOaucdj+NLBfHcQ6odw9rxRcJ7rXTja
	73SCgi+gfF59B6G8e/3Xwytf8dpnYxDbOS4lLmMIX37z7Xo5R+YajWKPvXTh3sUrkUDvGdLLXrrH0
	O6v2MGPd52RxtUC9IZrI6mZeA6mmd1dXPB0UtTq+oR82SAqmiKhfpP2NqqktZWWF4tehjKdVbgPX9
	6OQinmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVnU-00000008NEs-0VFa;
	Fri, 08 Mar 2024 08:41:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVnN-00000008NAZ-42Xv;
	Fri, 08 Mar 2024 08:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709887296;
	bh=kNO+vJ8sYUNufRYtszG1eobTNUFc3K/W3CZuPG5GR5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GYeAJgDRUl+YAm1bhqIwpML9GBTQZTluXVJd7rNZYWOFdBla8icE64WRxxIBtLv+d
	 VSAPhz2EojjofWKw15JrQhXR3gEEkrefHtzdEEEGOjWh38+ER4sQUnO+ZkpliqyzJy
	 Pe/4cXKdprikEYT2Gmqy+H0aNqrmOg/MxU/q3O02UDRlWlgtHzfj/9BwQNifM7PJj9
	 /rkrGozn6AMoa3RZdjL9fm/Z663mkHvvS6Nr/hY6Bcv4IyLhHPbVtWh//c6ye1Ckec
	 dGEaLAZ1RDyQd0rBeCj8GeaBrxAT7UPNunKeGtfysl3L18zGz4PbEGA761kdzK6brg
	 MRjPq+l3KRrlg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C2EF937813CA;
	Fri,  8 Mar 2024 08:41:35 +0000 (UTC)
Message-ID: <ff708cd5-efe1-47e0-8112-ac7a2658cd8d@collabora.com>
Date: Fri, 8 Mar 2024 09:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mips: dts: ralink: mt7621: associate uart1_pins
 with serial0
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240307190408.23443-1-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_004138_834053_57F8EDB9 
X-CRM114-Status: GOOD (  14.58  )
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

Il 07/03/24 20:04, Justin Swartz ha scritto:
> Add missing pinctrl-name and pinctrl-0 properties to declare
> that the uart1_pins group is associated with serial0.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>   arch/mips/boot/dts/ralink/mt7621.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
> index 35a10258f..dca415fdd 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -123,6 +123,9 @@ serial0: serial@c00 {
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			no-loopback-test;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&uart1_pins>;
>   		};
>   
>   		spi0: spi@b00 {

The pins are muxed and can be either UART, or some other function that
is supported by the mux: this means that the pinctrl-xxx properties shall
*not* go into the SoC dtsi file, but in board dts files instead.

Said differently: the usage of the UART pins is board-specific, not SoC-wide.

Regards,
Angelo

