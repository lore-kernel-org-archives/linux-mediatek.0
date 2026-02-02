Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3863E7DF0F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMW/oMHowzkhOZv+qy1zpKgPYKu08+oUM+G5DAE6Clw=; b=qz7jmkrApiTu1IeWId5Eky5mhD
	hb7rdj7ClMIN+Wc3XwA+h8KGQ6CVMkeYqXIITIrrJZuv1V/2mXZEWpNNIy/XFfcT7ZMQDAVkdhaAV
	zMFp8dj08YM/RAg/eWZ9+OYR5xyuJPHwpbchtAY498bnUrIT+DYxbv66S3BZP35Bi0Esh8VqwaY/Z
	dc2XXS5r1stIrBLjTrGGz03Xjyq151GNmJMreh8uXdopMBbw0DHG0dbYaELduT80L0rE4bi8CiAc8
	VuPqzq/0LbzqM7VV5Nys+/8+wwyd+jiIreTEdUILg3J7DbGYQSNuFnqr/42VK+f6dQfpKdFedYXIY
	N6xTyDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxQw-00000005LFS-0C7h;
	Mon, 02 Feb 2026 17:09:54 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmxQs-00000005LEu-1rLh
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 17:09:53 +0000
Received: by mail-oo1-xc41.google.com with SMTP id 006d021491bc7-662f485e58aso1997079eaf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Feb 2026 09:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770052189; x=1770656989; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nMW/oMHowzkhOZv+qy1zpKgPYKu08+oUM+G5DAE6Clw=;
        b=mTY4LJZD2zPi/sRoKH1MGjbewHWsKnBay+aJpmaO+HAEAjhJQHGIL5ICSpjC58eJww
         nBgUC3PhUhNyRExc9rfiwBtTO7zB1zGJCxiaEUWAQ90e7IVA6aI5eCBW/jDE7bFeSkSp
         Vmc9iXom7NSkzwzcL3hxGZOzjMFes3IXOyxlNOC8jiWB2C8PYwf7lDp/IlnXKWsZPZLA
         /IVlPuioou5k2aNqF7RBfN0BImFeRS1j/OAFOxoRH/pzivbmmOUZg730SlRs5DF88YQ/
         9B+v+jpT0335n1kH9lHQnlZ+nbIACuwystdLr6qfWK+WvaB/TKsKDZbscuA4bNRNYGIk
         8Kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052189; x=1770656989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMW/oMHowzkhOZv+qy1zpKgPYKu08+oUM+G5DAE6Clw=;
        b=NT+WciPs/nixewl9aAzwTdHsvWgAQ7W5Gq9xzSibvxep+OyPsqGiqtCaJ4tx1T0oh7
         JP96dBjuNG31113hjgMpNtMkZ5zpOxmJQDBXpDjObX3sTWwdhPW+i+bDoYSt8Pg8+cMV
         QsWKiZqwUl+WAMCc5HrubcoSJu9jtw0LMQzFqN0iTV3bvNI2QA5sS8k4DwpvNR6+Yrzw
         +Cii9zKvEeecjl8tGIk7O/W17Mm7ygOeLQYmPwP0G3vlqN9RIHgB5fz8D76eR1q3v9W0
         yuaBBvZJRdffy+3c7QilK58E/ALrbsB2N2HHb85efViqbQm8GF6w/OjN39j8Uotvt4wc
         ZNBg==
X-Forwarded-Encrypted: i=1; AJvYcCUufT7QLyKTLRpzShZNxMBLByGntLIa6AqnLC+nh6RCZ9Hoh9PbZ+i4fLHkmmRmLbWsaeCaEz2qXaH1LFpPgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyQvHHSouF14azGLEvTUyLqSndy0QvOA2Segk7KqCN3/zizBum
	DJN9GUnYZdnbytL8nWQOQZ8LonacK1fq4KyVOhsNe6Pl7deo/1ruAD7j36dMu+3vtks=
X-Gm-Gg: AZuq6aJfaNYx7kM+utKNjI7yQnjvHqX4BqYuxcUOMAuEjT+MPedbZrCTzjiv76Hj7NJ
	SIxaKMOIGXWXiYt712BuYww5jg12b0cIg0Nyn+sL6y6GLyNazf3NDbwETjUs8kTdfEnBfIa5esk
	BCJODskUMyuDH/wK8a9OlBANV9CA+5PV4RmVnS1IqfL1+7lNhFEzoYtzr6BocSqf8rTI1lvHMBp
	5Kd71Rx/HHpyS8q9PGGUzdNVtU9tJWYpunVAFTvTLZohonjf+UG8ki1207x2a6xpkCyF3neMjqA
	d3kEAES44SjpiSiPYlrmTSDmi5hzCnd/jC6XJHRW7ZspR2vWofldpB/Jhn+e73o2yEuQqXwEOVn
	npVCSyfXsNSMheKbO63jWX54MIHmcYXn+G3P/ecfypodvuDOFGKUZr3qMaZT/MO1nYvFbO0pWuw
	VaUL1VAIeD+GAzygMeC00fesJv/qpB257/oV8Yf7Lyxs3kSLmBHuYwcM2MThZyXppju50n83o=
X-Received: by 2002:a05:6820:220d:b0:662:fabc:b108 with SMTP id 006d021491bc7-6630f008ef9mr5758808eaf.5.1770052189360;
        Mon, 02 Feb 2026 09:09:49 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:3695:6954:27c2:42ef? ([2600:8803:e7e4:500:3695:6954:27c2:42ef])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4095756cb0bsm11668068fac.18.2026.02.02.09.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 09:09:48 -0800 (PST)
Message-ID: <c616cc63-35fb-49a5-bd1a-ac559574c32d@baylibre.com>
Date: Mon, 2 Feb 2026 11:09:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8365: fix infracfg_nao node
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: Fabien Parent <fparent@baylibre.com>,
 Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251216-mtk-fix-infracfg_nao-compatibile-v1-1-d339b151ac81@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251216-mtk-fix-infracfg_nao-compatibile-v1-1-d339b151ac81@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_090950_945941_609692D3 
X-CRM114-Status: GOOD (  18.40  )
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

On 12/16/25 4:57 PM, David Lechner wrote:
> Use correct compatible string for the infracfg_nao: node and remove
> the #clock-cells property.
> 
> Likely this was copied from the similar infracfg: node. However,
> infracfg_nao: is just a syscon node with it's own register definitions
> and is not a clock provider.
> 
> Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index a5ca3cda6ef3..4116f96c81a9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -537,9 +537,8 @@ iommu: iommu@10205000 {
>  		};
>  
>  		infracfg_nao: infracfg@1020e000 {
> -			compatible = "mediatek,mt8365-infracfg", "syscon";
> +			compatible = "mediatek,mt8365-infracfg-nao", "syscon";
>  			reg = <0 0x1020e000 0 0x1000>;
> -			#clock-cells = <1>;
>  		};
>  
>  		rng: rng@1020f000 {
> 
> ---
> base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
> change-id: 20251216-mtk-fix-infracfg_nao-compatibile-ba543769f5b9
> 
> Best regards,

Hmm... it looks like someone sent the same patch (actually better
because they fixed the node name too) quite a while ago [1], but that
patch didn't get picked up either. So I suggest to drop this patch
in favor of that one.

[1]: https://lore.kernel.org/linux-mediatek/20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com/



