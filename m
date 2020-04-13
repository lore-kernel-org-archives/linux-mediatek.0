Return-Path: <SRS0=tzuU=55=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0D1C2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 16:24:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D83420678
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2020 16:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NZfyuW4h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxTrCDfa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D83420678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G30UUCYqZfe+YjfT+XVus1I9GzH3u2skYYNU9XdSc+Y=; b=NZfyuW4hbMZih+
	Lpr2+Eth5bx7RofOw2n3YjexGqjr4yIPu6fJRVBbbHR9j7pcyvAOfHapb4c3L8OU2MEY1hucxTdxb
	jAz9U4Wg1Zp041ksVQQGRDYB5g5YTO7qecVqka86b1mRlsUyTZcAiIDJRymUlWE/Zh2lX0h1n5fTG
	DntcNCjLe89HI79fcXribbryx0F/6CPnHIgTYo+G3A3OJ3allI0q3sNIUznuPFKshkmiEn0rpdXKR
	ckkyGwh3BSRHnIZQ/9EPD31av68pOGJC4oKlxTQy2MqGmY9k5aCskp6qkkculPDfysmA21ptHnPue
	xei9lzxBdQxtMIb8YDrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO1sk-0000yY-3N; Mon, 13 Apr 2020 16:24:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO1sb-0000q6-Il; Mon, 13 Apr 2020 16:24:14 +0000
Received: by mail-wm1-x342.google.com with SMTP id o81so4265039wmo.2;
 Mon, 13 Apr 2020 09:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qXtx8pTfrIn1zXbbdxMLKHupYMldDuB/xcfzgVD2/4Y=;
 b=cxTrCDfaNSVq0KbO/slYbodm5PO63GOaSaGZztgQHMlusGJ1U3HDI8tD/veoZUH4qE
 yL/Z6fblhdhVeEl1x0F45BFvkrUr+4hP5qXNd6NRt9HynyYtkfoYeafz/4MA08Co6J/4
 KPE2obMJ51RnPX1/89IZRfApghGoq1QEYJJQWu++VXpMhU0WlZEf2IQ83HqcOzaT8kMe
 fwOC1CTerFYmi93xpDSSxrGaduA5NzlGhv6boSv8q5vmiT7xL5BeHP7eCVDbOFOEnDLc
 0SaNBZEbYQb/LdVbxKRHN5m/657N1/RI0MgQR86iaw53YkO880Lym0IxfPoy92XZQZlW
 mqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qXtx8pTfrIn1zXbbdxMLKHupYMldDuB/xcfzgVD2/4Y=;
 b=J8acn3lVS3CkGG0mrQp+mU+QMtXHaazH2bxDraghuyDS0wcyIXzE2d/E7cDR0gAKMC
 OtJJ9jB/9ysnvMUIn//hho2e99/aYJkFuWJX3PKdVcEojnkRkeoyZXBmJ+YeirmirQCQ
 ETzR+tmGzKyOeqSYSOs4TE/pfYrzuCeCaXopzPr8ec2wQpKp2CJdW/PpLwQDhdgWb47g
 N3kzm9rZiJMoZCWdK57Eaf2sFCo2BzTnRvTjuBmXeCz58G6HsJ9QPI7qI0GU0kv/+H7+
 5lYqDZ1PrhHXWwh20l3GuEgxacBPpJS2693ho0y2ytWj7baCuW5IbXdEoB4yfeRCnRLQ
 hM6w==
X-Gm-Message-State: AGi0PubRIViLXoBrhCTRRG5X0Jqwl8N00jnXSFSuR44bH8+3K9kDsc0A
 S4qTn4gEIhxIA/ImpOP2HPo=
X-Google-Smtp-Source: APiQypIub1H5T2wOlisyD5+cKtMSkwzxwYBxJAfApq0itvUcldvHMbGePzvT4NrF0LKC4F434xY7ZQ==
X-Received: by 2002:a1c:4d18:: with SMTP id o24mr18365679wmh.141.1586795051744; 
 Mon, 13 Apr 2020 09:24:11 -0700 (PDT)
Received: from linux-gy6r.site ([213.195.113.243])
 by smtp.gmail.com with ESMTPSA id j68sm15754725wrj.32.2020.04.13.09.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 09:24:11 -0700 (PDT)
Subject: Re: [PATCH] arm: dts: mt7623: add phy-mode property for gmac2
To: sean.wang@mediatek.com, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <70e3eff31ecd500ed4862d9de28325a4dbd15105.1583648927.git.sean.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
X-Pep-Version: 2.0
Message-ID: <e53c4dda-411b-4664-a6ab-94d9033d4814@gmail.com>
Date: Mon, 13 Apr 2020 18:24:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <70e3eff31ecd500ed4862d9de28325a4dbd15105.1583648927.git.sean.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_092413_618657_EF90709E 
X-CRM114-Status: GOOD (  14.70  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 john@phrozen.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 3/8/20 7:34 AM, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add phy-mode property required by phylink on gmac2
> 
> Fixes: b8fc9f30821e ("net: ethernet: mediatek: Add basic PHYLINK support")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Applied to v5.7-next/arm32

Thanks!

> ---
>  arch/arm/boot/dts/mt7623n-rfb-emmc.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> index b7606130ade9..0447748f9fa0 100644
> --- a/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> +++ b/arch/arm/boot/dts/mt7623n-rfb-emmc.dts
> @@ -138,6 +138,7 @@ fixed-link {
>  	mac@1 {
>  		compatible = "mediatek,eth-mac";
>  		reg = <1>;
> +		phy-mode = "rgmii";
>  		phy-handle = <&phy5>;
>  	};
>  
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
