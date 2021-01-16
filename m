Return-Path: <SRS0=K1YL=GT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EA2C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:36:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F413920DD4
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F413920DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xRWu75tnJbCZHgrSjC3p8eWjfVRSDFBgkMY1YcGpF9k=; b=ZrPOnrD49m5eoC5qnY5lprPlx
	nhRtsxbGYvdB1Nlz2PCjPUivxxvDIPCjyfy/+mdsLSKHv4r2yv67zajFdM6TNdTk2tgGlCgQkLIe6
	zf2wxm1BxWsSrB49K6o0AtpCP3zeYys9/tyS8ocHb3lkYFn56MViKP14vvq6R3cw1tYTjHmVlB9vX
	iPEBzp4MtdnElzdxwT8PJXyjNfVOfq+D3D3A+YC/UY1iZy3ysURLW1DrYF+Rs0xk0IedNJWwH0roR
	HCGN8BE46xW93yv35pTfLN3eucbZEPIXT25P0egkN5Ct7rH772zXpkSxXBvqi9hhsCQFifXfs3olA
	BX3fbTdgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0i0O-0003nB-Rw; Sat, 16 Jan 2021 09:36:24 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0i0M-0003mQ-MH; Sat, 16 Jan 2021 09:36:23 +0000
Received: by mail-lj1-x233.google.com with SMTP id y22so12964144ljn.9;
 Sat, 16 Jan 2021 01:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y1/w7su/UpjLoYG1ov/jnfBG4ouAVU7asO4b1yzoDl0=;
 b=GzbCj2MkywgL71ot3WCGYBGB9GTJISO1zj45D7yh6gkVVXYTr5IJdtSo8I119K/BzP
 45hqwF2CzF1d/NiA3fc9jW0/a4m4fivs1Q9jN0b+8+olnfDAeTzYoSR6g8lZUU0qSQQ+
 s9xK3wR/dWkXi6eJD6z7PA9aMnYvLMCorhnIj9SrvdDvCODaGHDtpeNcZiP4NABwDZhG
 LspKP+MldbY72Mcd6NtW+LHof8VggrvpfkxTlk+DFZIGNxxo/HuXSrHMCZ28a6K81dp/
 krC/427ADEdiJkD5y1BnwmbmiWh0Uxb3dROq5HFCa9kZA5juDI/f7CBJl4Q4BQetY6pm
 /+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Y1/w7su/UpjLoYG1ov/jnfBG4ouAVU7asO4b1yzoDl0=;
 b=efZ+o6st+giPOyIVMtMx6pZGDXWMSDmuSB5RQw0ItgX358g5f0U5brEHp2RNNwh2KN
 +2/P4XpfYplByR4KeEZqV1id19ef3jvNuazwbm4MJDZJb+JyIvlMLzs+BDiOqge8L7NM
 BSl8wpAN+AnlSE1umdnno3UekcSWsm5M0HTtREaEu2lz8kZomDTI0z2dzvtgi0fDenv/
 Vbl4Yol6QLrd+rRKDcDMHdeSJd0eqcXOV7xJ7kctFOYvaOwwDKeqDR5szRZI6b+eZPDA
 HhWYZrJbFNftClIlj8vmVWTQmuSZPS82lxKJ1iNWhE+CZcvTcIfYU6cXO+rUEvDZJgbI
 4iUw==
X-Gm-Message-State: AOAM532O3rZrUKicngWKd1mzsqyOByQdmJ8MFHxU2qYrcuz0XgipgZBD
 GtsNl4crVlrUrfuJEWQRUNY=
X-Google-Smtp-Source: ABdhPJyFgou3lwXctU4wQyITVlWwduN6ltASZdsQdknXs6mA3xX47n+j5xBShvtp5O9A38fjOwXmuA==
X-Received: by 2002:a2e:810c:: with SMTP id d12mr6634806ljg.400.1610789778971; 
 Sat, 16 Jan 2021 01:36:18 -0800 (PST)
Received: from [192.168.1.100] ([178.176.75.157])
 by smtp.gmail.com with ESMTPSA id t9sm1212989lff.45.2021.01.16.01.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 01:36:18 -0800 (PST)
Subject: Re: [PATCH next 11/15] arm64: dts: mediatek: mt7622: harmonize node
 names and compatibles
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-11-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <8f859d54-f9f8-d7c9-db66-89860124b539@gmail.com>
Date: Sat, 16 Jan 2021 12:36:16 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210116090656.11752-11-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_043622_784167_1D9603BA 
X-CRM114-Status: GOOD (  15.83  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello!

On 16.01.2021 12:06, Chunfeng Yun wrote:

> This is used to fix dtbs_check warning
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 5b9ec032ce8d..4cfa09b0ca3c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -740,8 +740,8 @@
>   		status = "disabled";
>   	};
>   
> -	u3phy: usb-phy@1a0c4000 {
> -		compatible = "mediatek,mt7622-u3phy",
> +	u3phy: t-phy@1a0c4000 {

    What is "t-phy"? Perhaps you should have used just "phy" here...

> +		compatible = "mediatek,mt7622-tphy",
>   			     "mediatek,generic-tphy-v1";
>   		reg = <0 0x1a0c4000 0 0x700>;
>   		#address-cells = <2>;
> @@ -875,8 +875,9 @@
>   		status = "disabled";
>   	};
>   
> -	sata_phy: sata-phy@1a243000 {
> -		compatible = "mediatek,generic-tphy-v1";
> +	sata_phy: t-phy@1a243000 {

    Same here...

> +		compatible = "mediatek,mt7622-tphy",
> +			     "mediatek,generic-tphy-v1";
>   		#address-cells = <2>;
>   		#size-cells = <2>;
>   		ranges;

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
