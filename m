Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8E4C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTAIShT4ejiwcdAZYmu1frQ1WA1PtPTK9mkypxJnrVg=; b=xGA/NwqRuw5P1q5FtP6P8B4ZBZ
	A//RLVaXSXduZZu0AYpFrx5/VKEDGYhd8vZRaX3HufG1lVtHwRtgPO4kk1ShacosZnXScgFt0JZ0v
	1VkVTb69xC0Ll4l9ZkWLL2SvTz6rGows+UVxmMdi05QotIBSXuDrKnvqiesgfyFluuUUZSIcy3GuZ
	KhZkCJgmwo5trnebnQ64cWIDi4mzCVWt6D43meUHcC2sUSveBYLufbXk1ARflOmbDaEKZCTfHp/eg
	iEapadRotZrYS690yQFd46/RUmZ97cuwhgLIPt0mzMIwghCxm0FM1U7cdTjdowSOuogquK13A9y+/
	j5c4lC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXEm-000Azz-Nu; Mon, 14 Nov 2022 11:02:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXEZ-000AvD-DM; Mon, 14 Nov 2022 11:02:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F8A26601E4C;
	Mon, 14 Nov 2022 11:02:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668423753;
	bh=Vdfc8dY/vI6TMkcQxnexuBFAvBXuoQ1lTIkgbdeds7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SOzYkjV4PcS+7Fp5HVYXPg5UfEmPi5X/LU0D7bnQqtw8C05Bxa5hoojhVeu+6buoO
	 lbV+ff1Oc0eAyBYzSbYYGo32GimqE5r1AdKNOLi9H80htfVqhfGCds6nsIUkJpw1d5
	 AMG4HzseXAZovbHUWS2fNr8+wVcR9biVT1ZxawcZ6l97/ov9H1m+LEt0MK7GR3IsLh
	 1CP2etsIE5oLM+jIvK5sD1oc3MttCb/hDd+UMbNeSeo5S4Cosox/K7JXHR1vaM3Dw0
	 HESmvu3OhtOaXQVcdh4+7xza1vaGPSyPFxH9SGyo5dlHRikq0KfZoJPq/ySMIZr4gB
	 QAZJvHQUSzoCw==
Message-ID: <1683603c-8486-b7a7-e9d7-bddd28c1cd8c@collabora.com>
Date: Mon, 14 Nov 2022 12:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: Add SoC compatible
Content-Language: en-US
To: matthias.bgg@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 frank-w@public-files.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <mbrugger@suse.com>
References: <20221111113635.4603-1-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221111113635.4603-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_030235_615758_7C5314E5 
X-CRM114-Status: GOOD (  15.60  )
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

Il 11/11/22 12:36, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> Missing SoC compatible in the board file causes dt bindings check.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 2 +-
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index afe37b702eef9..0e3b603159477 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -9,7 +9,7 @@
>   
>   / {
>   	model = "MediaTek MT7986a RFB";
> -	compatible = "mediatek,mt7986a-rfb";
> +	compatible = "mediatek,mt7986a-rfb", "mediatek,mt7986a";
>   
>   	aliases {
>   		serial0 = &uart0;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 72e0d9722e07a..1191ecf345a7d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -14,6 +14,8 @@ / {
>   	#address-cells = <2>;
>   	#size-cells = <2>;
>   
> +	compatible = "mediatek,mt7986a";
> +

It's DTS that shall declare the machine compatible and it's expected that they
all declare their own, so please drop this one.

Also, while at it, the same should happen with mt7986b-rfb.dts: can you fix that
one too?

	compatible = "mediatek,mt7986b-rfb", "mediatek,mt7986b";

Cheers,
Angelo



