Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3068EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 11:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5OsQ4AuyiC2CrHHurCsWNqs5Q2r8YSSGtzarIpfdSs=; b=3GzvFQY6c8yXtv5MZHn07kEEUk
	5HvWNzjizl0mNUOqLkD3QcsHhf1iTMaiJzQifEejwL8ELuf9DNj5LGxPRooIETrX/L/FKns1EZLbW
	OImHHVO6HJdhXMghjGWdiJ/Y/87VcksPxHi55uMcMIaHygu+GFPh3LHrtcRhWZ5UQEKTW+lz0nai7
	cD0QH+2RoKm3bKDg501KMIEwJ5v/r2SZkuJK+jZy5BgHkdkR/0kDM9rKDLA1RZ9BkjLL7WehVuAtv
	vHtKrPZ6inwFt0nx8qTBuOyorzjAz6QXQNAlL+ledkkLfZY3NhUvtSnxeC+ySm0Kct4XSN1Hr1GL+
	BWMZbt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSy3Y-00Gxeu-2j;
	Mon, 07 Aug 2023 11:05:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSy3W-00Gxdb-0p;
	Mon, 07 Aug 2023 11:05:47 +0000
Received: from [192.168.0.125] (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 47F7966071C7;
	Mon,  7 Aug 2023 12:05:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691406340;
	bh=5YZT2Ezwe663qvbFpPpMjH+Ew5+w9TA+lbeL02sFIH4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PqnXPwe27tmgzJ/9eJPCGfRFEWlwIVmjykHR/a8JuqJVr5orHWac7Bt7j3HI/UQD6
	 bScMtv0xOeakR53Cm43plg2SnKUy5AvGLSig4JyGbwt1qtarHiIGAv0sBdZVSFMUjZ
	 fGAo6CkcObnixHCWDRv0y1vNRPe7zfdhMv3whGb+LZhdUOeGfbQHv8ifqZemtxTOye
	 memHGt2MQgztxy1zkdBQIAo2mQKoJ2g9zq4z9sgceDGL4Txh6wWgmyyXaWsYwuXWJ/
	 Vu6CjVfqpuMQdkACXl/gc6oHO6qObC5aHe+4M3w45213DPpentP4N4NrRxJlNYafUc
	 C2u1to8BEK8Eg==
Message-ID: <f9ed06cb-2c9b-6b82-0bb4-2189a05218a1@collabora.com>
Date: Mon, 7 Aug 2023 14:05:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: dts: mt8195: change watchdog reset boot flow
Content-Language: en-US
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Hsin-Te Yuan <yuanhsinte@google.com>
References: <20230807085811.1.I7d08b8323531c59c0ec247570b2d05a790bfd3d4@changeid>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230807085811.1.I7d08b8323531c59c0ec247570b2d05a790bfd3d4@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_040546_479402_3C025335 
X-CRM114-Status: GOOD (  14.91  )
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

Hello Hsin-Te,

On 8/7/23 11:58, Hsin-Te Yuan wrote:
> The external output reset signal was originally disabled and sent from
> firmware. However, an unfixed bug in the firmware prevents the signal
> from being sent, causing the device to fail to boot. To fix this, enable
> external output reset signal to allow the device to reboot normally.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@google.com>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 37a3e9de90ff7..5dc4214e1840b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -1147,6 +1147,10 @@ &uart0 {
>   	status = "okay";
>   };
>   
> +&watchdog {
> +	/delete-property/ mediatek,disable-extrst;
> +};
> +

Does this affect only the mt8195-cherry or all mt8195 boards ?

Judging by this commit , I think only mt8195-cherry, but your commit 
message somehow suggests otherwise.

Eugen

>   &xhci0 {
>   	status = "okay";
>   


