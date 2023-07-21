Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E484C001DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dk77Qc/dj00UQR6hsnHOlMA9gQBz3cX0XYQgbb44BiQ=; b=ntX49IGR4jvgwQhe8UUqSMLl2y
	d+QiG4Xb3Mfyt5ZAa9qzRjf+tb0U7F4dOGVB8JdyYlTH04LxAsta9B2pHYB6QnxHHTDTKntKzz49B
	BCR3Nm5GzY6bD3Clj4gJGlpY/tmTZ/hOVBWCMbONp38nDHUc0ayPVQvd1cBNKSD7/oNDssgoiBqFZ
	mI8Dq53adUJoeHsMXWLbvPbPFap/tKpRgj6/Z+4PJ7jpNzVOn+zbHA9obbBxEmDx+jLH5wQUIWEzo
	zkVYH7LZydkIbC2xexHnXwxOrG+Q72PGs5m+D5AVn73m9W4CKoiEXKLAb6eC5ttY40lZYvaGUVv+B
	jGjkg9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlJo-00DKS1-1X;
	Fri, 21 Jul 2023 08:16:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlJl-00DKQk-1t;
	Fri, 21 Jul 2023 08:16:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 043796606FD8;
	Fri, 21 Jul 2023 09:16:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689927407;
	bh=Da4LQlPmUJ4jB9lCBAB/poUxMFWGV22f2vqy6CM2uCE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TWzxKl8DzdNWcaEdkKBN9YU/bWg4LM3NKyQoQwTqZN6NVP5JIFMmOTo4ECDoU+EGp
	 exRttprdTpB/Q+mSz+jxxxOOLt6MyPTrWiAzf7HlFXGBtCAQ7VL4RsO/jU7C5/zI/9
	 bg2fYR1XyKACcVpe52w3hJv1c48xjh/hweGexcD67T7kjYWWA94iZZ570dpAjZC6SX
	 aTvDKDPufBOrsw+8EaDLLjwqCb8ILKdE69DBcAlFGNvKhT9YkutltakDfd2G3MVmrM
	 5wfLvwe0Uf9HgOwTuR+Vb/4laLbWQwbGXqjDt1iNKg3+hE+FP4r2j5kUZH6G9RoeJ3
	 b0cdkL7yx8jIQ==
Message-ID: <8bb1a42d-2809-04a9-dcdd-45fc91ea1bde@collabora.com>
Date: Fri, 21 Jul 2023 10:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Set DSU PMU status to fail
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Seiya Wang <seiya.wang@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230720200753.322133-1-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230720200753.322133-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_011653_812456_70BE99EB 
X-CRM114-Status: GOOD (  23.35  )
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

Il 20/07/23 22:07, Nícolas F. R. A. Prado ha scritto:
> The DSU PMU allows monitoring performance events in the DSU cluster,
> which is done by configuring and reading back values from the DSU PMU
> system registers. However, for write-access to be allowed by ELs lower
> than EL3, the EL3 firmware needs to update the setting on the ACTLR3_EL3
> register, as it is disallowed by default.

Typo: ACTLR_EL2, ACTLR_EL3 bit 12 must be set if SCR.NS is 1;
ACTLR_EL3 bit 12 must be set if SCR.NS is 0.

On MT8195 Chromebooks, SCR.NS is 1 - hence ACTLR_EL2/EL3 must have BIT(12) set,
but at least ACTLR_EL2 doesn't have it set.

I haven't verified EL3, but that doesn't matter, since both need to be set.

> 
> That configuration is not done on the firmware used by the MT8195 SoC,
> as a consequence, booting a MT8195-based machine like
> mt8195-cherry-tomato-r2 with CONFIG_ARM_DSU_PMU enabled hangs the kernel
> just as it writes to the CLUSTERPMOVSCLR_EL1 register, since the
> instruction faults to EL3, and BL31 apparently just re-runs the
> instruction over and over.

...at least for this SoC, TF-A's BL31 fault handler loops over the same
instruction forever, hanging the AP...

Regards,
Angelo

> 
> Mark the DSU PMU node in the Devicetree with status "fail", as the
> machine doesn't have a suitable firmware to make use of it from the
> kernel, and allowing its driver to probe would hang the kernel.
> 
> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 5c670fce1e47..0705d9c3a6a7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -313,6 +313,7 @@ dsu-pmu {
>   		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
>   		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
>   		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> +		status = "fail";
>   	};
>   
>   	dmic_codec: dmic-codec {



