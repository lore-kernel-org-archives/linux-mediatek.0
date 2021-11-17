Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 18:00:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1148861AFB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 18:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1148861AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZThr86PIqdB0aQ1ZqPzQ1ppHxarTa/LMkin87rEuojM=; b=TiQpW2gjv69rBv
	02C/71sAKUkfsu2qzfKgvqymoCldqEJS3eYDPbQm4Dc9eYieohMZAuQyEjn7zxM1OfrpdkrjJLqCl
	VaOpCCye6AEwK2GBstYVv62okYC9Q564bXOzEeOFjcEPKYsvHJ0cXYNj1XwhAVQDMyKLZnZ9kLRaP
	giS357+o3Y6XcILZ74jvIYyp1x1n8zYRGc6GlkIHgxfDgYUgf08qYljTCnZBvWx9Gsr6T4v5VK70y
	bFX6b1Cz7J3Rv1MUzlAAl4HtcBx6yHCi9ROi4VA8D3dyhyF/4PKWTkfFRafyABw3uKGF55S350jHr
	P4XSdPgdS7JblOTCr8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnPE4-0060W8-Mz; Wed, 17 Nov 2021 18:00:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnP3k-005wZ7-OY; Wed, 17 Nov 2021 17:49:26 +0000
Received: by mail-wr1-x42d.google.com with SMTP id c4so6246774wrd.9;
 Wed, 17 Nov 2021 09:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fiHs8iQnwarpgINjD3LQ7dtBIrw9yKtXyNgpZs7Iakk=;
 b=AtDty0Mm3zDKVilAvvCwgO4E4Q+I09avG4GOJdJYB6Kroa4IQkpgG/AOf493yJc+YA
 HgQS3uno8JyJtEAVclwbe6Jak/vD3wlzx7XzD01h6TaJp/ELBXOeMUdALjEpj1KGBogM
 GN8i8vUPxMHBD6F9uY1WGIRuwoHQVZypgtTRaEWj9uRx7ISS6IPS1YI+kc6xMMJZV2ID
 ub/ETmhxyWPcCjxIF8SSnZvoFmK+4JHOstg1lz1aCAnW0Cp4B8dMYwtlWKRc8EDkMeMt
 pstt+o9puDIjjy2x93xDF5mTMkozEegd1pYeNB4Cxldcpmv44HZRrfcT9AyJaQuxzCWI
 +Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fiHs8iQnwarpgINjD3LQ7dtBIrw9yKtXyNgpZs7Iakk=;
 b=V2zJHR5OhrfsXU42tMH8kIKjG/3sdepVOjVkXBewp930lHten/FRZassQ6d6e1WGt3
 R+6vDrVeje7V9EngmVYLYSRJnx3j74K8rVtuB3SUze//Ia+zZYMskIrInkNAgzzDjAuf
 wlwfwJsKJV8b10EZ2rQcuHGVxfLcdaLa/cL8MG7k4AWFt7n37B/ZMVHw+ffwJX3TqxCR
 KaBIy9PgHt6IqAQr5G72fr3o+nwK28OCO9ppYoOezgAk5dDBtPpO9glFQwK+GDUyLxVs
 082U2kxtGgQp9UEugvf0NnO9ifiBfpFh+hHJPqZheO6mPkm99WCWzY0mJH6uOJ3RytVf
 //pQ==
X-Gm-Message-State: AOAM532EKViKv4TxzMl0SP9aKQmtS0RdbY0lHL+qP+tDJUBTaArJJ3SU
 mCZaq9uzF9469jMGf9KoVa4=
X-Google-Smtp-Source: ABdhPJyEaE48k1laWISx6Mz0Ip2Kud6SQkUsbpKJbrjEpkcvZPop620ByephU9M4Rl2b1ga5zVZwGw==
X-Received: by 2002:adf:dd0d:: with SMTP id a13mr21292351wrm.259.1637171362828; 
 Wed, 17 Nov 2021 09:49:22 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id 9sm808343wry.0.2021.11.17.09.49.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 09:49:22 -0800 (PST)
Message-ID: <003d475d-2dcd-ec24-0b9e-0cfd021f9da4@gmail.com>
Date: Wed, 17 Nov 2021 18:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173: Add gce-client-reg to
 display od/ufo
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20211104135254.580257-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211104135254.580257-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_094924_860164_D7566B0D 
X-CRM114-Status: GOOD (  14.97  )
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



On 04/11/2021 14:52, AngeloGioacchino Del Regno wrote:
> In order to use CMDQ commands on these two IPs, we need to declare
> the appropriate mediatek,gce-client-reg for them.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Now applied to v5.16-next/dts64 thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index dee66e5f054c..2b7d331a4588 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -1212,6 +1212,7 @@ ufoe@1401a000 {
>   			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_LOW>;
>   			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>   			clocks = <&mmsys CLK_MM_DISP_UFOE>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0xa000 0x1000>;
>   		};
>   
>   		dsi0: dsi@1401b000 {
> @@ -1316,6 +1317,7 @@ od@14023000 {
>   			compatible = "mediatek,mt8173-disp-od";
>   			reg = <0 0x14023000 0 0x1000>;
>   			clocks = <&mmsys CLK_MM_DISP_OD>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0x3000 0x1000>;
>   		};
>   
>   		hdmi0: hdmi@14025000 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
