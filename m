Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA32C4727C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 15:06:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8874C207F7
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 15:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dvXc1B5o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tzq+4MRr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8874C207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xtGG4Z0ENiKDyRJaXYR2ZwjZInt0UNX3W3FNzL89THo=; b=dvXc1B5o0NIHK39s+romHpYsa
	UKujeTmZutM5bbmo67NCUfWL1NusRwBlCv4+xeujBm7q1fmUM+En+yJIkHGbe/24xkBFW8TQ0LZxT
	/RjOK1BvI3PJIcAPkyYd4OATxGJH2a7Iobo4/u9XzlhdTFRjwoY2HGz0kA39ZrobwWhHuCAmk74MM
	phVRM2VQz4J4FhGGZX2ICvTl1lloIYeU0BN2wbV5avs53T9NkW0ukG7/l7r4eSRdEKLLfrKleIbea
	IxgXcCux0iGFArSAJKTwLM74sWNq3n2fhGu3nu9pdFEVJx/wirpY+Njk+B6kx+DkDwGxub6bw/OLf
	6FaB2NPAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO0A6-0004fw-0Q; Thu, 01 Oct 2020 15:06:26 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO0A3-0004f9-Ge; Thu, 01 Oct 2020 15:06:24 +0000
Received: by mail-wr1-x442.google.com with SMTP id k15so6186846wrn.10;
 Thu, 01 Oct 2020 08:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9X3iERDbIbWtybzrjpm4PyjretbOiJRxybaokBX9Fg0=;
 b=Tzq+4MRra4zQj+RCJIesVpnmOpe+lMM0r5EyIM+dLL5Y8ZF45juiRpqBPjXpJjTEep
 jZqq+RlXkaF/7ymYK2gdZSuAo1xTI2zzeGOyiH5XRCGvh9uPRFbC3h8nx1n33VUQlrZ0
 /kr0x697ID/2lcyIjaxNcz0mJG3bStTpSsihScQjy0hHcaic+wJFZrzkLiuRuTSUUIlb
 KgwwBZlSaKNU+ROfDzecfBCJY+QlrcpwkhAzMqLAWFnUI6TFgByOePz4Hfz/nt+yzrp4
 HXkxXEl5Im4vKPPK02YrT5J+KVFE70i2d49HTdnpdbQkmwnBqU8+NiBXJxGMUHqwIKf7
 /M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9X3iERDbIbWtybzrjpm4PyjretbOiJRxybaokBX9Fg0=;
 b=OLOWChvFVBDYCwfOnh3jW+ZMclUFHKNQ7W4Gy0mqoHB8nnj7tczig9ggJz2cq9iqVd
 49M8huthoFZ/+8IB6WV+QQkvojmnc4OwjHKqcAQkog8JjR0cl4/qVIRvo4PkcQBYGTiT
 LNI6iS+12LtTJM0p2zEnYFzJ8/OSAA142fBDOBsOuxsgbpq0jVnYwkJ+Rhd/w4UG1mQX
 8JU82fA0ae/Cz3yblwjsa0M4TKt/80bRXgPe2JNyI8NyZ1+dWDLrHJZNalxPgRbetrg5
 xM8GioZtCONi9/mRr0M8k261zYT7cql0rRS4IJ9EJbLFMMt1TGqh7VEJE2nWG+x7578i
 ehdw==
X-Gm-Message-State: AOAM531iC+4SUobBlJbSOBFkNGb36Y4O5epdwvXutEJKEAdyI0gDwUqc
 3uXYV+0h/JAGTZB9kdQm4fA9+8KKyiwFtQ==
X-Google-Smtp-Source: ABdhPJytgs70Nfgs1c16EtWZewVO9V+uwz7ZoF4TGOHupPJthQ6GrjQPZnvAXDHBzTfqqriYbRKa+Q==
X-Received: by 2002:adf:f5c1:: with SMTP id k1mr10257410wrp.271.1601564781886; 
 Thu, 01 Oct 2020 08:06:21 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id d19sm391985wmd.0.2020.10.01.08.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 08:06:20 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8173-elm: Remove ddc property from panel
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20200826090218.682931-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <55a87e63-0c9d-3481-797a-b2b4a13946c4@gmail.com>
Date: Thu, 1 Oct 2020 17:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826090218.682931-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_110623_568739_2E8D7B92 
X-CRM114-Status: GOOD (  18.19  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 26/08/2020 11:02, Enric Balletbo i Serra wrote:
> The elm and hana devices uses an Embedded DisplayPort (eDP) as interface
> for its panel, so the DDC channel specified in the binding is useless.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---

Applied to v5.10-tmp/dts64 which will be rebased on v5.10-rc1 and called 
v5.10-next/dts64

Thanks,
Matthias

> 
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index a5a12b2599a4..1fe5dac24ba1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -86,7 +86,6 @@ volume_up {
>   	panel: panel {
>   		compatible = "lg,lp120up1";
>   		power-supply = <&panel_fixed_3v3>;
> -		ddc-i2c-bus = <&i2c0>;
>   		backlight = <&backlight>;
>   
>   		port {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
