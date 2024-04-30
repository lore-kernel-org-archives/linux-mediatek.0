Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9348DC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AEkTUCbNPrFE2pG5AZKralNxmw0WZK222OSot1GTwM=; b=0n8cBj8xYQKa960mE1vJtB6jzE
	OhDu3k/EJOvPfq1C5B8QqE+aru6DGRU0nFf3GnvJ/T4H5hcNXj4crL9XyCl22dZuP5S+Y+w+eIm6x
	5uU4LIn7yrOn1V/Gmhv3s1dgQCYUcvMyKxVSFibhnFJQslHh3XL1Xu/LibUkxYosQ0AH+pkvlXXNj
	nHhVQbGlYgTcTX9AzpMpoH5m6WKHHlBdK3Jf7A8j6N5sD9rlZgW61Gb4HIPod17UR8aQ+OdCkcGpd
	jylw9d8JGNqP46MQXBV88uyCfgKIQoqZ7Mrel//K+8kQDVcOQn97SORCiFq5kOFwn6IB1uEHksy02
	9yAwp2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ifo-00000005Zrp-0N6A;
	Tue, 30 Apr 2024 08:17:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ifk-00000005ZqN-0zPb;
	Tue, 30 Apr 2024 08:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714465026;
	bh=YiqPXDGuBJ9ChCHuLfO5SZxskbmlZQtPZtwhXVSn32Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fW57j2P2O3Z+7aEhUtDF2jmZ1Kp4MjGO34GUw7v8M7qlscjAQD8DLyxvBZ30CLiMe
	 bkoo5irtEB8p1ZL1xZtYLsQJXCWreJtRxyhUjIIKzBg4wjHyqw5ioTGK+oH7XxGa9T
	 3S7tWy8Yr9BPAEYCjcMsjblhhZ4MxXAv6Ljo8DqqPCjMLnhRlIQjSz39Hs/ILpOFHf
	 6IiPK37h9Bj5Bp31Aei5UioFpuQ3lhjM4vw68UDxcGQkUjA7pamvfj8TDfUCVLDEfM
	 ezfLq41ahK0JQ9zsDMMw/EpwnASuEXCcQmGXhzpE8GolwV0oDOuK80Vsqg0szww558
	 IiSTvoS3S+GbA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3BDDF378134F;
	Tue, 30 Apr 2024 08:17:06 +0000 (UTC)
Message-ID: <b3c69a78-78c9-4a15-829b-e4b36e16566a@collabora.com>
Date: Tue, 30 Apr 2024 10:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Add off-on-delay-us
 for pp3300_mipibrdg
To: Pin-yen Lin <treapking@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 Hsin-Te Yuan <yuanhsinte@chromium.org>
References: <20240429095333.3585438-1-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240429095333.3585438-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_011708_438481_1889A0F6 
X-CRM114-Status: GOOD (  15.26  )
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

Il 29/04/24 11:53, Pin-yen Lin ha scritto:
> Set off-on-delay-us to 500000 us for pp3300_mipibrdg to make sure it
> complies with the panel sequence. Explicit configuration on the
> regulator node is required because mt8192-asurada uses the same power
> supply for the panel and the anx7625 DP bridge. So powering on/off the
> DP bridge could break the power sequence requirement for the panel.
> 
> Fixes: f9f00b1f6b9b ("arm64: dts: mediatek: asurada: Add display regulators")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 

Uhm, there might be more to it - I don't think that this should ever happen.

The regulator is refcounted, so...
  * Bridge on: panel goes off, but regulator doesn't turn off (refcount=1)
    * Panel resume -> sequence respected (refcount=2 -> wait -> more vregs, etc)
  * Bridge off: panel is already off (refcount=0)
    * Bridge resume -> refcount=1, no panel commands yet
    * Panel resume -> refcount=2, wait -> more vregs, etc

Can you please describe the issue that you're getting?

Cheers,
Angelo

> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> index 7a704246678f..08d71ddf3668 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -147,6 +147,7 @@ pp3300_mipibrdg: regulator-3v3-mipibrdg {
>   		regulator-boot-on;
>   		gpio = <&pio 127 GPIO_ACTIVE_HIGH>;
>   		vin-supply = <&pp3300_g>;
> +		off-on-delay-us = <500000>;
>   	};
>   
>   	/* separately switched 3.3V power rail */


