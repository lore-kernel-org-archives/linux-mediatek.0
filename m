Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632B2EE4990
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 10:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9F2aGkSIX+tU8jvwsj/hE0S4SW+rIPtA8qWeS5ayQds=; b=FqC7u2ldFSpXrZlOCoysJ6r9V2
	aUVdThXpPIRFryVgPnih5Mgn4eZ7331fmv+JT3sxDqQtcyFx4KUzhVKRuf1cqvUl+N3VtlibU+Dik
	Ue70rW1YpGMEFVOturuMfsdmwBNe3xLzR2WW1uME52CTSXZ9wJzH3aUJ+2ovv0FWWG85nWuUBx5TW
	GE2tp/agACNO7efAhxKWj9jRcxqg1bnwnJq9D54rA5/5CoiJbfi5etciws6OGOitzX+hXfhfFANkR
	9cmLCJccSjqwIn7TtenJF1Efc4nG+QSa/14u1UFeUZRPxS9TlOyIyFYhNwz8ufwN1eIlPr3qRZPSD
	wLs2ghSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKvx-00000009AQ2-0URg;
	Wed, 11 Sep 2024 10:50:49 +0000
Received: from a7-41.smtp-out.eu-west-1.amazonses.com ([54.240.7.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKri-000000099gX-3RHJ;
	Wed, 11 Sep 2024 10:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726051583;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=zaEEDAHRbtRTZKTSPKKof3QCdZ3ptIytzTpSz+i25aw=;
	b=gdCzt6ctTxu1pBI6S44bZ+GPVF5BgnhIDWemAvKqe358hnJLPrNv5nWoCq1K6PNJ
	zBWZPUDM+bivqP91mI6HG33QhjRWmqkUJt6ySJXZwWJAr2I1ecbqttsDxTbwSphk96W
	x9lcsOIDHBFD2nHsdwMIDmX55bN0MY26xoykm4lvK8cswTnzFwzAnxTVJJPdS4U09c8
	KyBNA448Xsojnt4aTG3cK5uH2ZcXz6IoJfeOPKII48njqpW7CZYQBf1o9zFn79TnVkX
	DKNQwucLe2p8k4E/38BXf/CyJO21SzkSFP9hT4OivOhjZiw4MLetKQq35O7gPO08fKh
	mpLu1RDawQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726051583;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=zaEEDAHRbtRTZKTSPKKof3QCdZ3ptIytzTpSz+i25aw=;
	b=Mrwby2XnraJoo6GZb4q0tGVgPI1+fNDZSNK44heftrf/pDZgV4Htmt8mdWWeqEwH
	3nRxpoTRKi+eccLvjAVtfLHiPwKH5ps8RSsW3QW9baW8OBStZq4yYOLlDh2N9Qyg3Av
	G8ea7L34EhDzTk2wMciEumTluSlKdEU97xFbK+qQ=
Message-ID: <01020191e0b103c3-00fad6e7-f81f-4a76-a75f-1420574f71df-000000@eu-west-1.amazonses.com>
Date: Wed, 11 Sep 2024 10:46:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] arm64: dts: mediatek: mt8188: Add missing GCE clock
 names
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
References: <20240909111535.528624-1-fshao@chromium.org>
 <20240909111535.528624-6-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240909111535.528624-6-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.11-54.240.7.41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_034627_038841_F963C09F 
X-CRM114-Status: GOOD (  13.18  )
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

Il 09/09/24 13:14, Fei Shao ha scritto:
> Add the missing clock-names property for GCE nodes to fix errors from
> `make CHECK_DTBS=y mediatek/mt8188-evb.dtb`.

I've sent a patch [1] relaxing the requirement for clock-names in the binding.
There's no reason to make clock-names mandatory, as there is and there always
will be one single clock for each GCE mailbox - and also the driver is not
trying to get the clock by name, but rather gets the clock at index 0 anyway.

Please drop this patch.

Cheers,
Angelo

[1]: 
https://lore.kernel.org/all/20240911104327.123602-1-angelogioacchino.delregno@collabora.com/

> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> index 445d30eee2a1..2900d78b7ceb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1316,6 +1316,7 @@ gce0: mailbox@10320000 {
>   			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
>   			#mbox-cells = <2>;
>   			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
> +			clock-names = "gce";
>   		};
>   
>   		gce1: mailbox@10330000 {
> @@ -1324,6 +1325,7 @@ gce1: mailbox@10330000 {
>   			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
>   			#mbox-cells = <2>;
>   			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
> +			clock-names = "gce";
>   		};
>   
>   		scp: scp@10500000 {


