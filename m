Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E65C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SckdELIRdVaN95Qoh6UwKSuOzishJKcJ1QKE1Q8bhS0=; b=waXNHd/qX5xJ+q
	qXN2MYsNNQg5UEkjtL0BJxgaq7H9LYVMAEj0GgfODwPhndvqeuaXDGx2WbdAKOI8axxTSaeb1uzrH
	aFaBp0CQkEp3RO3/XhoPtaJmoVvymowqj8jWbDOuwozbsLAdYrtcU4fCqgz0NExumXOmTIjXvJ1h5
	IYJEQVfw+Fru8elpaygx//1ecMX5PD/ACVNbGOdm61O5+UAu8XhxNNquNPPY4Je95iNRA7hakFbOw
	zZ/40j/HeOOlLD2h9kwOOvpygMkHxpok77fol8sL3+pE6nvDOSYwQzTz3wlcS2AfcHRMSA3j2V5Xl
	dhCOH6ALJ0W+I3aKYlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3R0-00Ecsb-SW; Fri, 18 Feb 2022 13:36:30 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2o7-00ELiQ-E1; Fri, 18 Feb 2022 12:56:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8C7451F46724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188978;
 bh=NvjhI6vTcbisSLhBidwMYqGEIuAV29q+/5LZdCEocHQ=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=EQwXK/InctD2BH8Hf3POfLASdcUdHA98OGoH3X/vdsB7ojkof3cDAMLZIeECqWm2L
 4h18RrCwNDAqi0jMXTuuwtXZqo/As9PTY5Qcn1X65uZ1EML/hFVdGQajyNLnLmHIEt
 fI5VR4haBroGkgsCE+Jhgk948vYYsmhmuKswMr0pEapTxM+WP7jSmMuGyzaCh1OieW
 OoS+8cTbyHnnSePOTtKmyaeAw3m6okvKP1pdfKxjW3VvIq1KQQWjZL+3QuhXAMSPVH
 FJq3BveCmXO+xfXvNNizkyGqTQjKNerKr8Vh6Po7pUyyGxDgv+dy4kIRkHEsBaWEIx
 gVwgoKqH0eHsg==
Message-ID: <a77916bd-4129-90c4-8b6a-dfe2b71b7a98@collabora.com>
Date: Fri, 18 Feb 2022 13:56:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 19/23] arm64: dts: mt8192: Add i2c aliases
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-20-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-20-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045619_695507_7929204A 
X-CRM114-Status: GOOD (  12.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> Add i2c aliases for mt8192 SoC
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 55bcbf72a366..e3314cdc7c1a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -21,6 +21,19 @@
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> +	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
> +		i2c8 = &i2c8;
> +		i2c9 = &i2c9;
> +	};
> +
>   	clk26m: oscillator0 {
>   		compatible = "fixed-clock";
>   		#clock-cells = <0>;



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
