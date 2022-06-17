Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F4FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkp4uK11/4OrCEaz4XjJ83xXpjDH+S9v2Ae5rIMepB0=; b=i6swc7C2y47rPVQ6ezkez+U59+
	7jnwsBdrYs7aNtbEDcC+vUG6xIuxwPyp0uh6xbwc8Su2a298kikBv+HyODoIXvlkkQcdeyxX2T43I
	W8FauBP3ZskzrI9h3OfXMdMX8rMWtuoxPXpcdnZibGOd6NJUmkxLq+HuQVgYDcCTLaLZ5bd1CArNG
	qFAruCbs0Xp8eIygwmVeNgWEqdEZE1dc5MJpNft6oexKVrr4YHe4woT9fyems9EQkZm9jyPh4oce+
	qA60Q3GO0TwZqu3iNy3xXeXywLmjPFijiOwCWpHIK888AsL171LDiNOPPTFQLjDHES3Rs7oXbjqwa
	W5ZXT/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29Q6-0070HU-Gl; Fri, 17 Jun 2022 10:41:42 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29Pv-0070EL-ER; Fri, 17 Jun 2022 10:41:32 +0000
Received: by mail-ed1-x530.google.com with SMTP id o10so5654354edi.1;
        Fri, 17 Jun 2022 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=hkp4uK11/4OrCEaz4XjJ83xXpjDH+S9v2Ae5rIMepB0=;
        b=IbJe/gK1k4fHKqOVKnPxE8nZTqSlRC79Yfe71BoqEPgwqA4lei8xO41woON7CzD3jo
         2U2gcLr3zjHGaPsCwuJeZUUs671h5K3x6RoqOi7jjpfEVh5zlcEy+Fr2WSN6NMXmRH2t
         GkV3OUxyd7JyF2fB/GawNHu3nhLnsOqzGJunDcCm26ikQZUo5XhCqdhCchzplyH1JTqB
         q0Jcmikt/70zFb14mBWo9xodn0RawKh3/TdzJIRzlqmHJumGwPLvJnBvMJsrjXQW7jGL
         bgwriH9nisl8rcT5K0ycBDvIyBOTEyKncSFsT3P4qkfk35OnFERacVtv3w+P0HnLZTa+
         z4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hkp4uK11/4OrCEaz4XjJ83xXpjDH+S9v2Ae5rIMepB0=;
        b=yuo00DOc95vnjZme/4lDNir75ZW3rIefA1JivpLpx8+PtdRtkZwHaV25tc9m8S7srv
         OF4WfSl/PnugLTwR5UH71RvRZ1HXxthvODcoZedD8l1ObJsahenWaX2w90ienF9VIkuV
         ruwjmeCDU1NX4sJYKOFOKdxZq5DEsehttJVO54DrzlHuL32RvPbuo9gnCR+eRrR9kKZ+
         Szc/6yiKrZ//QUd6QEJhfJbTIT3jwuNCX3VrzhSUTZLvuBvY8hg+vZOlfHC8pIAr8aFU
         fN3I0jKEXWLXntiIcS4ZSp9i7cTRFclm6ehCY1K7GPOAydLX6D98IvED4qncb65+Ej0Z
         LhNw==
X-Gm-Message-State: AJIora86BNXFAHQQSK/llwECrfaBwVs5IfFSPca7hEVuHEIfzK4dFkre
	JHnWeTPeLSlVwKjiE6LdL2Y=
X-Google-Smtp-Source: AGRyM1upqkFvOJmB/mMBOlwf8qUMZi3Mn3x6lcJ0th8pgh5jhc5LwNGxznaYkOW3GVsCG4Z5WAv9Fg==
X-Received: by 2002:a05:6402:2682:b0:42e:1c85:7ddc with SMTP id w2-20020a056402268200b0042e1c857ddcmr11367546edd.143.1655462489240;
        Fri, 17 Jun 2022 03:41:29 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id b14-20020a056402084e00b0043565c79879sm467500edz.43.2022.06.17.03.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 03:41:28 -0700 (PDT)
Message-ID: <fcc5f00b-0776-9511-845a-5eac5d4c7876@gmail.com>
Date: Fri, 17 Jun 2022 12:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 17/40] arm64: dts: mediatek: mt7622-rfb1: correct
 gpio-keys properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, arm@kernel.org,
 soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-17-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616005333.18491-17-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_034131_558800_054C876D 
X-CRM114-Status: GOOD (  14.50  )
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

On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 

Is it me or doesn't the commit message match the actual commit? Change looks 
good, but message puzzles me.

Regards,
Matthias

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> index c28da9323a9c..1a86857c9027 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> @@ -40,7 +40,6 @@ cpu@1 {
>   
>   	gpio-keys {
>   		compatible = "gpio-keys";
> -		poll-interval = <100>;
>   
>   		key-factory {
>   			label = "factory";

