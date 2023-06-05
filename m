Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099D8C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uL24kGW25O0CYTvB13Fb5OAjwxCCLewfKZFu6e4+4PM=; b=wwO2lecQId7AW2VzN4dM/MM89k
	bS8BZr4+rghxnDjLUdmG/sFUbVsFaTkMQJ52wuO5jtdK/SThrEiqOCSWr8CJhAJKM0xJ2LhOB3i0N
	/NLnFv+94/+K1md08fuQ9ZQXGEQNy3SsG6qO6LcaNSPAArFLd61bgpdoqAkjgbO0rUJO6j0Jucb6v
	kAVG6JF5Ck0sIIvbOiGOk/OZTO9NK4aHsLgvklUxDL1yGlpcsJMc/Bg4RROLIAB50TxF4VbHqdMO6
	fJXCUiAwRYI2364piczek4zSv96NQJv9CahxV5AldbxS5vUUXQytMqIzewVJ9bDowPvshUN7uBD/d
	vDh/Wuug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q66mB-00EtVR-2G;
	Mon, 05 Jun 2023 09:45:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q66m8-00EtTT-16;
	Mon, 05 Jun 2023 09:45:21 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B436660037C;
	Mon,  5 Jun 2023 10:45:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685958313;
	bh=mEfqt1dlBpfVkkk0bVWukCJts1hAaNVDDjN5Ccn0QLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KDUnQXgkC9ssK+JFoXAIULspaWCPeNInczzPilPctimIMqTZMBvIug63Uy3+ip4CI
	 kCslNHgJuqVI8H5CAzB5DmFp8yvwGZZEt37PO8qA1rIjKEz9cijA6nxaTBEXwS5S4B
	 NovRUyiHzBBM2n7xDQdP3SlfWWhLXYwmCGA6qYSNIUT7u9JRFh5eftB+KQ5FabO1uA
	 wRvs1PJECv+/bXWWJR08AhfL7sP0ZAwwIiQEuuFBdcThi77aIN3evYZm+uVv3T/TRv
	 +Ip7IJjbaIBQCqq3sMQmCK6xrLwc7Q45QE4HV3I/vmzJlWWA6lUZHOXvGmHcJbmzBH
	 /N8f0NQlpIj3g==
Message-ID: <511269ce-2493-1d21-d8fe-a9d78828e018@collabora.com>
Date: Mon, 5 Jun 2023 11:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192: Add missing dma-ranges to
 soc node
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Yong Wu <yong.wu@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230601203221.3675915-1-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230601203221.3675915-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_024520_512121_58CD215F 
X-CRM114-Status: GOOD (  19.91  )
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

Il 01/06/23 22:32, Nícolas F. R. A. Prado ha scritto:
> In the series "Adjust the dma-ranges for MTK IOMMU", the mtk-iommu
> driver was adapted to separate the iova range based on the larb used,
> and a dma-ranges property was added to the soc node in the devicetree of
> the affected SoCs allowing the whole 16GB iova range to be used. Except
> that for mt8192, there was no patch adding dma-ranges.
> 
> Add the missing dma-ranges property to the soc node like was done for
> mt8195 and mt8186. This fixes the usage of the vcodec, which would
> otherwise trigger iommu faults.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> Matthias,
> 
> this is a very simple but important fix for the vcodec functionality.
> Since the vcodec node for mt8192 was just merged, can we please get this
> in in this merge window as well?

+1

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Thanks,
> Nícolas
> 
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 7ff183c35494..a3612de8e9d1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -401,6 +401,7 @@ soc {
>   		#address-cells = <2>;
>   		#size-cells = <2>;
>   		compatible = "simple-bus";
> +		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
>   		ranges;
>   
>   		gic: interrupt-controller@c000000 {


