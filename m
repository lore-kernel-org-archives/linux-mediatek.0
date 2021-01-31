Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69639C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 15:02:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0438D64E1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 15:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0438D64E1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JqN4imIKngf1+OJVZ9ihIoUeutajripJiHnIrBGYpnw=; b=G/wXFMOPjgLkcm+lRDf4JRAlM
	c6dbJxXc4pPJbKckp9VLbMak7vg0CRjYs8sQ1ZziqTujzQh6g0ZEBLDX3OQbmmCfA63/WY/kPzsly
	S7zs3xWx68HqCoMXgZQ+qqDvr0A/QRNVDsE4Q41xlxAqJ9RvC/Hi7SllIhV+v9mGxQLUPtR8LH7p3
	g9o3TvXQyuvU8Zp4UiOzqpIqDnzwU2t0jplLWLNzkO8t3icHOf9FiE7p96Wc7BTbMhzoIoprVAEDU
	aY7M5lHuCJcpN22Xp3Fxbj9TiJuaidBi6AcSbueo1OPzkDJe+oFBv132TJtafdq1Esc3cmzbk5dzi
	7/b18VB1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6EEu-0001iz-Uy; Sun, 31 Jan 2021 15:02:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6EEs-0001iL-3I; Sun, 31 Jan 2021 15:02:10 +0000
Received: by mail-wr1-x430.google.com with SMTP id m13so13828685wro.12;
 Sun, 31 Jan 2021 07:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LjV7ACSqP+y+JnewS778JoLSAcQ5qx8sJ+ZVcy+lM+4=;
 b=FjBe/XzupUekMOot8PEzjBp8l9ZHr4GVrzUD+osKm2joyH0KvbD6t4boRgT8ffRubS
 /kRI9y4jGlJn1y/zwQ5xOWrxyYf9o3xvsOfZ2FGNO5x3iODENtI6Ms1ihuVB7SL1EvS3
 RVyyFoLWUJAl1b9Ray73p4oeVs7EVLrobwKzi2gyMozlky6CE1yXMi8h4RBxh2hq9vxr
 32mMTRpkhZNxyX65gWxVYpFNw5g5CbGSJ8Cig+6M6kN+h1C53UrB4eeqkN8HG3cFhzQ/
 ciAlntaZgQUnx4Tut892YcGZaBDAPJZ0+7yD7QAcAZMOvIuLuZPQpt54N/fFJjh5QD4C
 Ds8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LjV7ACSqP+y+JnewS778JoLSAcQ5qx8sJ+ZVcy+lM+4=;
 b=HKFlVGKeclelRkHuLh2z2UfADGIt+Sixs8GtshMZ2Z70Jr4uJld3ox6J47GOhX413C
 /6Zxoec82fVgdNi8kR4JJNiLlx7G3SBpbyC3TH0ul0rSMROnqMt0QJFHIt7CXNTurTFY
 xCgHO2/fFcrRd90mDocP63bMtvejSmMwEPRTPVSKmLlnxQfkgKbUy42AoWb3ZCHYry5y
 W4YMrBPuHTlMP+fwQZS7Hj1cohubeV19TGa+A5gx8tcz0r5JWrlCdq+wMPXwzfzlGZWC
 rFLuh5GMM6+9TNTvOZfkLkLvXw4189V8+DLYu0SmYjC4E/tindeuApXU1BdEPdTlqor1
 j8sg==
X-Gm-Message-State: AOAM531at00LUrMs+fD6E+0kUJD9Vm+3sFdMjdOkuWiW0Ta/7IuvQZGX
 hTGl6OX5Y9bl/VkmTneLvNcR7ca2gaVeEnP2
X-Google-Smtp-Source: ABdhPJwADIFtf12tUEUVrchilS5bjUGWeeee7D163mWyiDjr0XlCEtWtBP1e9CDewJbpjk8YOX3gtg==
X-Received: by 2002:a05:6000:188b:: with SMTP id
 a11mr13699113wri.151.1612105328923; 
 Sun, 31 Jan 2021 07:02:08 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id i59sm25056300wri.3.2021.01.31.07.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 07:02:08 -0800 (PST)
Subject: Re: [PATCH v2] dts64: mt7622: fix slow sd card access
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20210113180919.49523-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1109b776-b20d-91e1-d398-c48f3f5aa240@gmail.com>
Date: Sun, 31 Jan 2021 16:02:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113180919.49523-1-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_100210_169983_E328A749 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Wenbin.Mei@mediatek.com, sin_wenjiehu <sin_wenjiehu@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jimin Wang <jimin.wang@mediatek.com>, skylake.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/01/2021 19:09, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Fix extreme slow speed (200MB takes ~20 min) on writing sdcard on
> bananapi-r64 by adding reset-control for mmc1 like it's done for mmc0/emmc.
> 
> Cc: stable@vger.kernel.org
> Fixes: 2c002a3049f7 ("arm64: dts: mt7622: add mmc related device nodes")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied to v5.11-next/dts64

Thanks!

> ---
> changes since v1:
>  - drop change to uhs-mode because mt7622 does not support it
> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 5b9ec032ce8d..7c6d871538a6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -698,6 +698,8 @@ mmc1: mmc@11240000 {
>  		clocks = <&pericfg CLK_PERI_MSDC30_1_PD>,
>  			 <&topckgen CLK_TOP_AXI_SEL>;
>  		clock-names = "source", "hclk";
> +		resets = <&pericfg MT7622_PERI_MSDC1_SW_RST>;
> +		reset-names = "hrst";
>  		status = "disabled";
>  	};
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
