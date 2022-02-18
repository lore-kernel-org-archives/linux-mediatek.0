Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stRioLm8tt8mSxhvmLFYT9oXcgq7UFEfuYPl49A2RC8=; b=FQ5JAm+/TwjnDj
	RoB0+XxPKWJKhfJTEpBuaQ/Gc8u8Ejcq15xpOKEo6zmn6N2TSwzyR5wMS204d4+yA7FVsqxa1M0/+
	ywHbBPPwwGAio1nIxqb8DPUEbOnwX/x2D+ajDVGluGiDP0+0WvFr7XkhT3PKrashYWLIeZszYbtq2
	BSKPNhcAB88bjzfTuDpA0Ux0ovTOhcwY3nJ4tVUuZCzzw0IWxarhQ9rVZhwjuksYjfwuLY0SuPOy7
	DN9s6P8fPYmmYXN3+owtjqw9wWirhoRNSmZYaOFhuG4D8Aq1ANozka4dJyvv0b18DNk6Y0BKEgz2F
	m6aRWBkPP22038NInMEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3LN-00EaW9-A9; Fri, 18 Feb 2022 13:30:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nq-00ELZr-M7; Fri, 18 Feb 2022 12:56:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A74491F46724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188961;
 bh=d4Jdcn6sqeGA9YusiP+E1Q4QUac5jNdY0Bx26wxURBg=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=JC02n1Z2sDF4+nk3EoRHvRKIowkUO9LUIZZife7ds7FSmCOb1Y4u2+wt5WH4mbuL5
 y9XB3UKcLnct+rv1Rjj4ISv+U/rLUioVnZUsQghLgOQNtJVLy1TEUFRfjOEKxctF4n
 dJEVEe1J/kTmYZ/hWXnS44bsXFgMfBMBPdeYJ8+f4s2WulKUL0037Ak1i7AxfdRyMz
 WyUmfIwn463DE66uI+C7so6qdl1xUc6hmOzEYToDE/vl3MY+xIjfIrUxM1hFX3/L+t
 IicLyM+u4y2vghVitCDyYmM9MT8WGSFG9XUVg4F5dxJR7Fwqi9ndcZxTi4fnC9BD9N
 hUaSfc2kkkUJg==
Message-ID: <7ca84242-6abc-7598-89c2-c44e63026b03@collabora.com>
Date: Fri, 18 Feb 2022 13:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 14/23] arm64: dts: mt8192: Add mipi_tx node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-15-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-15-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045602_909247_F669BE5D 
X-CRM114-Status: GOOD (  14.13  )
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
> Add mipi_tx node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index cfc2db501108..f5e5af949f19 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1114,6 +1114,16 @@
>   			};
>   		};
>   
> +		mipi_tx0: mipi-dphy@11e50000 {
> +			compatible = "mediatek,mt8183-mipi-tx";
> +			reg = <0 0x11e50000 0 0x1000>;
> +			clocks = <&apmixedsys CLK_APMIXED_MIPID26M>;
> +			clock-names = "ref_clk";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +			clock-output-names = "mipi_tx0_pll";

Please, disable this node by default, as this is something that may be
enabled for some machine, but disabled for the other.

			status = "disabled";

> +		};
> +
>   		i2c0: i2c@11f00000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11f00000 0 0x1000>,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
