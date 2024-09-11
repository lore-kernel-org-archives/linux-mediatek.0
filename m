Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5622EE499D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 12:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzTizxwaP/eY8nli56OKtq3gvU5KkhD8BrZkzMqR5VQ=; b=B6CWGQfwQiaXscqRQD6wwgyQJv
	CNhlMvVZ2PzWzaSdUOvyWuRWGgxjxV0iQEmnELDaItJ6E8m1QP8gr9g+CKSXDAyxfqwZaHKm1aTNW
	ynzUnbPropQBHSske8cxKQxjat58VJPncNF7p7+T+bpsI9mvkyFVjGhtR0NILby/8duOIUg0dYQiI
	tp35NfrdX18j7S1YCE4Zrda+5HoijAjkrIr9Ah8x4u5PjgErBUjtahm8MVw8+1EEjQWbKk4CH01X1
	rgFKN00ujq/prCNcqLTP1xLPZS8kvnVYmIjdiJsM2mGvetGIyITer13XvF7REMm5r8nTH0ya7Iip3
	Q7LhTQhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soMUa-00000009UHz-2BTW;
	Wed, 11 Sep 2024 12:30:40 +0000
Received: from a7-41.smtp-out.eu-west-1.amazonses.com ([54.240.7.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLSN-00000009HLG-28L8;
	Wed, 11 Sep 2024 11:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726053855;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hHJ57GhW0AFY9cSfQETXEPzqEG5qaB2u3OM/P4qkqdw=;
	b=W2+nlYL6l3Ifay5LfDY2VcUxw8euLV6Shr/V13oKkRK2wAR2Cyk/g65qu+pqzhpM
	siGXPa7dBKQGuE3j2niVBhE2noVC0bNmUXj8eUexPwIR1Oh6mcMmM8ZhEQ3TVuAW5k6
	Gg3YNFXiTj5psn9xeuKjZZPA2Ljdw+Nj826XLHgZiVOux0Ri90k8aQYIfzoMjKPSDK7
	+jIFcAPTFMv0DVGOA9hHeDITCbMzGGicUKDxjA4AwcusTaJr54ioGO1Q6L2p0XGBbgr
	OsJJJ9IMrDjH6yg+pwHhpPsqekMHu/HPjyselVlTLXVdyEi+hw5lOmkMtaNilpyi63A
	Oh4vEa8Xww==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726053855;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=hHJ57GhW0AFY9cSfQETXEPzqEG5qaB2u3OM/P4qkqdw=;
	b=NNZM1fd+JQfraNqX4sU6XTxUxLO9givFV134ofEjiyX5N67Qo1FuiQN4LIVwH6hl
	YwgagntumKK7dSRxBFB0GFMpnDUuVJQiF0NXFO/DzRdHqq9Qm33K62SOvoRzEd4Bwr0
	SvsyKRiDDt3QY1TyAO57cMBC6lqHDshLMfOmI3fs=
Message-ID: <01020191e0d3af7a-8a1d9882-90d0-4def-a05f-c29e7c479dff-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 11:24:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: mediatek: mt8188: Add SPMI support for
 PMIC control
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
References: <20240911105131.4094027-1-fshao@chromium.org>
 <20240911105131.4094027-7-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240911105131.4094027-7-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_042419_736711_5E11069C 
X-CRM114-Status: GOOD (  11.14  )
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

Il 11/09/24 12:51, Fei Shao ha scritto:
> Add SPMI node for PMIC control on MT8188 SoC.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
> (no changes since v1)
> 
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 61530f8c5599..32e5b7108f6a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1306,6 +1306,18 @@ pwrap: pwrap@10024000 {
>   			clock-names = "spi", "wrap";
>   		};
>   
> +		spmi: spmi@10027000 {
> +			compatible = "mediatek,mt8188-spmi", "mediatek,mt8195-spmi";
> +			reg = <0 0x10027000 0 0x000e00>, <0 0x10029000 0 0x000100>;

Please drop leading zeroes on iospace sizes 0xe00 and 0x100, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



