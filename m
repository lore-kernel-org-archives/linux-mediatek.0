Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251FBC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:10:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10D861B3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D10D861B3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+SwaEZCZhOlSvaATjM/h3BTl+nK+Go/UWrxVFJQtvVw=; b=kIYE4YUjE/T045
	iJkPyp+bGyP4bHhs6RNoassOa/xxv+QRzAt1wwqkL2KVQAe0rQARM4tcD94SWPZuCBlHR0cZZrRej
	bNa61rIzovJdAX1vU55kOaVLTbCeKriTvGUYCpWAW+otUYBxACC7YVeznIdpd0N3rLCE32dJKxVDO
	QEg8aTflC9vmMMZJ5HR/XVATaegx+Z093wfYX+4U6aUS6wJsQDa6AuU5tX6KDVrHHWWysTxFGWExi
	mQnNAbOv6HcYjLoZXQdK2I8PHY3nXS1QvGwLV/+vlpG1il2Bqyr0eX9jol6j0hvS1I2rj0vq4Bjn0
	eWv60pAdPlN21Lk076IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnORZ-005oCe-Oj; Wed, 17 Nov 2021 17:09:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnORL-005oAv-BX; Wed, 17 Nov 2021 17:09:44 +0000
Received: by mail-wm1-x335.google.com with SMTP id y196so2880095wmc.3;
 Wed, 17 Nov 2021 09:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0B+N0FA61IWnA1l5AfQzrBop1ZHsqAbfOO+sgyYzC58=;
 b=Ks1SXb180c0C9y2x2MA1wxqwqNhxfF1eIbBVXQ/pLIUBawraenmhHjlLtFqYaP5rRM
 JD99zoH+3g8POKfTifx0n5M9w/xP9atLflYx35pxWWgJzIcz9Ll4qhRRDSHODLp36Tte
 ztIbX8l0EsVjCP7get9NWkhCrC8fkXfYz/yRWEz/C7M8oOOnleGUUMwiep+6unGy6Lok
 j6e8qtJKTanvbHhlgdguDdZXc3hTYNVDjRlYLFxtIdilrFj2Vf4QiO4A8bBrq56mm6wR
 +4uV01kPmJhbAtICFVFWMOPdOL2/uCbbKJdkztnSBCb0+Dy3zAppcdWqKWeV3ZcCNazr
 KmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0B+N0FA61IWnA1l5AfQzrBop1ZHsqAbfOO+sgyYzC58=;
 b=E/o+liAJJk1k/onA0Yakvxn8s8bTHkEvZqZrZ4Pdbam7iyqaRp1YRtD0o5kIORGGih
 4wvNNTzIK7I3jyN7Idc/m5kWnJVvBaIlYZYcjb4Sc/c8hwSwFsvrUB7IYY9H8IN2kd8m
 d30fTIqfn1eEjx9zAtQhRGAnzvYwBUZX1oMSTnQ5kcBUoJixtHgdXsjH4hhJX149cB+V
 PJr6caamyZESBOOjgwUHF2F1xR/8ZWZegl8OD2V9w1radiKYEMBEYQXrAEdSYCrKUWIi
 YuDGizSPPhI88oszJe18BwwFQ+Qsl6zQ+/YQ0nC+tFDMMlrWATFeBqfcP+4qgsdsgEN/
 VSpw==
X-Gm-Message-State: AOAM532GlY+2UArsB0UYX5neWJ2nwvdFeGAevgsSo6n1b78OmMC8oBcq
 FCfq8lM6B4XCP7vIFJLo4Ts=
X-Google-Smtp-Source: ABdhPJxGcBEQhtQFfbKcOJuuOam7iLbD22APsVdCohpJtRkkAnBdMxBD3SvwJTW07cLtCktLxwczaw==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr1396307wmj.91.1637168981409; 
 Wed, 17 Nov 2021 09:09:41 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id m17sm432110wrz.22.2021.11.17.09.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 09:09:40 -0800 (PST)
Message-ID: <acf4a474-7abf-49e5-aa4e-a25d101fb3d8@gmail.com>
Date: Wed, 17 Nov 2021 18:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 4/4] arm64: dts: mediatek: mt8192: fix i2c node names
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211110194959.20611-1-fparent@baylibre.com>
 <20211110194959.20611-4-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211110194959.20611-4-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_090943_431634_ACA5A2CB 
X-CRM114-Status: GOOD (  14.53  )
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



On 10/11/2021 20:49, Fabien Parent wrote:
> Fix the i2c node names to be compliant to the YAML schema. The
> I2C node name should match the following pattern: "^i2c@[0-9a-f]+$".
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.16-next/dts64

Thanks

> ---
> 
> v3: rebased
> v2: new patch
> 
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index c7c7d4e017ae..53d790c335f9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -479,7 +479,7 @@ audsys: clock-controller@11210000 {
>   			#clock-cells = <1>;
>   		};
>   
> -		i2c3: i2c3@11cb0000 {
> +		i2c3: i2c@11cb0000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11cb0000 0 0x1000>,
>   			      <0 0x10217300 0 0x80>;
> @@ -498,7 +498,7 @@ imp_iic_wrap_e: clock-controller@11cb1000 {
>   			#clock-cells = <1>;
>   		};
>   
> -		i2c7: i2c7@11d00000 {
> +		i2c7: i2c@11d00000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11d00000 0 0x1000>,
>   			      <0 0x10217600 0 0x180>;
> @@ -511,7 +511,7 @@ i2c7: i2c7@11d00000 {
>   			status = "disabled";
>   		};
>   
> -		i2c8: i2c8@11d01000 {
> +		i2c8: i2c@11d01000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11d01000 0 0x1000>,
>   			      <0 0x10217780 0 0x180>;
> @@ -524,7 +524,7 @@ i2c8: i2c8@11d01000 {
>   			status = "disabled";
>   		};
>   
> -		i2c9: i2c9@11d02000 {
> +		i2c9: i2c@11d02000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11d02000 0 0x1000>,
>   			      <0 0x10217900 0 0x180>;
> @@ -543,7 +543,7 @@ imp_iic_wrap_s: clock-controller@11d03000 {
>   			#clock-cells = <1>;
>   		};
>   
> -		i2c1: i2c1@11d20000 {
> +		i2c1: i2c@11d20000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11d20000 0 0x1000>,
>   			      <0 0x10217100 0 0x80>;
> @@ -556,7 +556,7 @@ i2c1: i2c1@11d20000 {
>   			status = "disabled";
>   		};
>   
> -		i2c2: i2c2@11d21000 {
> +		i2c2: i2c@11d21000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11d21000 0 0x1000>,
>   			      <0 0x10217180 0 0x180>;
> @@ -569,7 +569,7 @@ i2c2: i2c2@11d21000 {
>   			status = "disabled";
>   		};
>   
> -		i2c4: i2c4@11d22000 {
> +		i2c4: i2c@11d22000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11d22000 0 0x1000>,
>   			      <0 0x10217380 0 0x180>;
> @@ -588,7 +588,7 @@ imp_iic_wrap_ws: clock-controller@11d23000 {
>   			#clock-cells = <1>;
>   		};
>   
> -		i2c5: i2c5@11e00000 {
> +		i2c5: i2c@11e00000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11e00000 0 0x1000>,
>   			      <0 0x10217500 0 0x80>;
> @@ -607,7 +607,7 @@ imp_iic_wrap_w: clock-controller@11e01000 {
>   			#clock-cells = <1>;
>   		};
>   
> -		i2c0: i2c0@11f00000 {
> +		i2c0: i2c@11f00000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11f00000 0 0x1000>,
>   			      <0 0x10217080 0 0x80>;
> @@ -620,7 +620,7 @@ i2c0: i2c0@11f00000 {
>   			status = "disabled";
>   		};
>   
> -		i2c6: i2c6@11f01000 {
> +		i2c6: i2c@11f01000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11f01000 0 0x1000>,
>   			      <0 0x10217580 0 0x80>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
