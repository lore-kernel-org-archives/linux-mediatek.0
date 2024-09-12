Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05DAEEB59B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXaVTQ5m6MG09NFO24FVUmqku7KZsPbsRL1jbFVcyl0=; b=nD2XT1gTAwRvpIT2UTZUfiTp3d
	IWtOqDf1Iuh/wrOV8a3eql8RBicLGm0M+72oiNqgJwFmVBA3uCUig8ueDefYbfgvz6gLdyCufcEHk
	44Ud6sz3fkOpTZV9dMXbJN7nkMzwbfrmyBLk8PftL3o6bf3BR5Sez1wqpSe1otYcndyzt2u7G3eRa
	IJfSjiEsHlUS9ZL1d/pWEHw+nhQtY3m2EZDTyG2SpZ6gt9QWTne6b82eJm5ISo4LckbTEx4AcaC1v
	crbRDWph0Bsa+ziM/OYrzoa4Imp+7/dQIYHjNgTaVnLUQMXxs++nfd2Q//QF6cPbjz4ykhW6OQY2Y
	vacObDbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soign-0000000CyDI-0pZ7;
	Thu, 12 Sep 2024 12:12:45 +0000
Received: from a7-32.smtp-out.eu-west-1.amazonses.com ([54.240.7.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soifI-0000000Cxjb-0EQl;
	Thu, 12 Sep 2024 12:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726143068;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2bcxoMD+cj1qNRt+Y8OhtR+SXNu5doal71FkCvDP6Ck=;
	b=E/Mxrh4LnDaV9UEv7xbNmR8LX8sdTQ5UKY+XTFZQX8+TiAVYVa73TAI8Henff3cV
	lTP2mUD1mqXovHW52ApZfY/1VTCBP+4Ikpmfa2htYZSFGHHxiRg7RnUwmscH3mI1YNQ
	yPWqSCZDPs1UzFi+Dxf7JmYQynNYxzYyjcj68EOEdn5oVT34cFJ/o4mW69KEMW4CZyI
	9+dI6tRLpvn+v8MlHiC4YnNbDrgU3gXDVXGYYQMRgktoXXkMSHl1OB19+7tR9+BhDNY
	IYOyBtMon9Jh6366qFZuhV6E5isB3PBrWe6soT90jOlsABHwGlTse+RY4Q7bGrp+CUX
	CWVG5dBGJQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726143068;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=2bcxoMD+cj1qNRt+Y8OhtR+SXNu5doal71FkCvDP6Ck=;
	b=hcVRnVhInK0IHoJFxwyNuNQRERW3LKno54/EBEuwpEUf7GAReQkyQwyshYo+O4Rs
	W7YxHKpYOfNmKMlfDwbxEwb0+O31c92N/0CpXNpc8D6TowFCJNw8giDmjSWYEIIg4B6
	zpb7uvQu7pVn6gOdqqdq/g4jxxIj7NI5XAMV1ME0=
Message-ID: <01020191e624f788-d1ad3271-81ef-47ec-931a-e638927114a0-000000@eu-west-1.amazonses.com>
Date: Thu, 12 Sep 2024 12:11:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable
 GPU
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240912070624.25540-1-pablo.sun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240912070624.25540-1-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.12-54.240.7.32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_051112_289708_77D4A20F 
X-CRM114-Status: GOOD (  11.10  )
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

Il 12/09/24 09:06, Pablo Sun ha scritto:
> Enable the Mali Valhall GPU on Genio 1200 EVK by providing regulator
> supply settingsi to gpu and mfg1, and enable the GPU node.
> 
> In addition, set the GPU related regulator voltage range:
> 
> 1. Set the recommended input voltage range of DVDD_GPU to (0.546V-0.787V),
>     based on Table 5-3 of MT8395 Application Processor Datasheet.
>     The regulator mt6315_7_vbuck1("Vgpu") connects to the DVDD_GPU input.
>     Note that the minimum voltage in SoC eFuse data, which is read by
>     MTK-SVS to adjust the regulator voltage, does not go below
>     the recommended operating voltage in the datasheet.
> 
> 2. Set the input voltage of DVDD_SRAM_GPU, supplied by
>     mt6359_vsram_others_ldo_reg, to 0.75V, the recommended typical
>     operating voltage in MT8395 Application Processor Datasheet.
> 
> This patch is tested by enabling CONFIG_DRM_PANFROST and
> on Genio 1200 EVK it probed with following dmesg:
> 
> ```
> panfrost 13000000.gpu: clock rate = 700000092
> panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x1 status 0x0
> panfrost 13000000.gpu: features: 00000000,000019f7,
> 					   issues: 00000001,80000400
> panfrost 13000000.gpu: Features: L2:0x07120206 Shader:0x00000000
> 					   Tiler:0x00000809 Mem:0x301
> 					   MMU:0x00002830 AS:0xff JS:0x7
> panfrost 13000000.gpu: shader_present=0x50045 l2_present=0x1
> [drm] Initialized panfrost 1.2.0 for 13000000.gpu on minor 0
> ```
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



