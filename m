Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1429DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EY/NQslRY4RVhvjvcvFYpY//rGzesRi8ZdgSJ7QM44=; b=BW71GYMwo/ShdA
	SwYUsxYrL1wcym1RLob9QiowK1FzRvSWRGnOGvuDi+fMxMRisOH8I2f0gPHP90n+CdnamIFARFqsk
	hLRPB3B75dHKta+gkHyO+WUs778tZUaGoA/hP9Vc2zHJOpk7hbTOQhIxrfWEZ68L3rkMtfHR1Kl+U
	ElW7QBJ5DZGVcrvA9ejl1pRvx4I624UlMU07+gNg1O5LrhuVH5tIc7ecSX4tiFMwcXjN6oVJMB3wS
	ceJoNm22hMb2lqQBE4eLNfHhwlUMZeZoSGr4T6HXUrcZLedWHITaQ7lxHhmOO3kRfOa0jiLFCACNN
	37RYBRceSe2lnSTzD35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3At-00EW0d-Qm; Fri, 18 Feb 2022 13:19:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nB-00ELGC-Mt; Fri, 18 Feb 2022 12:55:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 07B791F46724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188915;
 bh=Tpe2RPwvbdCojJ6DWrGoQuw8qWJegr0r7DlDrw/eAPk=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=BOWv9ZVUqUaglIggPkiRNn+3+u/HWW0z7myKhXZ2wmX8NSgYTYnonZ7n1U8zAt2ox
 eSEiSdSF+HjFhaQo8rdhdFgzKZPxIHJ8cugi/wS3e7fW8hQ3giP91irMtWg+o65iNZ
 9KZ6ZH4S5g5eGfN/nZjT4qCkleGoMN+iW0OOqvp9oR46xU7PcF2n2F6TkcBiV3Ez4q
 bz3MNL1QIZik43JPuB3BxVL55/aF6iOpp+/ZTkrCfcLmttKI2txBThKwNe4YuNyWXM
 N3nhIr3iuDEeBHcB+GiTM+lw3jxDnsunAaqHjq+O7liLrzhnckFpxEBISQQD6CEkcF
 +Mqi1YtJ4gqEA==
Message-ID: <932bb7da-fc2e-4562-a0fc-308a7c19343e@collabora.com>
Date: Fri, 18 Feb 2022 13:55:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 05/23] arm64: dts: mt8192: Add SCP node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-6-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-6-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045521_951477_0FA049AA 
X-CRM114-Status: GOOD (  13.29  )
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
> Add SCP node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index f92d8d7afa5d..61aadd7bd397 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -706,6 +706,18 @@
>   			status = "disabled";
>   		};
>   
> +		scp: scp@10500000 {
> +			compatible = "mediatek,mt8192-scp";
> +			reg = <0 0x10500000 0 0x100000>,
> +			    <0 0x10700000 0 0x8000>,
> +			    <0 0x10720000 0 0xe0000>;

Please fix indentation:
			reg = <0 0x10500000 0 0x100000>,
			      <0 0x10700000 0 0x8000>,
			      <0 0x10720000 0 0xe0000>;



> +			reg-names = "sram", "l1tcm", "cfg";
> +			interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg CLK_INFRA_SCPSYS>;
> +			clock-names = "main";
> +			status = "disabled";
> +		};
> +
>   		nor_flash: spi@11234000 {
>   			compatible = "mediatek,mt8192-nor";
>   			reg = <0 0x11234000 0 0xe0>;




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
