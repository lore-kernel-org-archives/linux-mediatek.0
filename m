Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE1CC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 08:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0I5qGBRorIzU4/M9Z2JKZBtnIIxK+lV/fotyWPu8eo=; b=MijoYFzD7lh9Hj9ITzHSGiXPny
	Avph5z4xRrS+4ck3FWa+AQa3rqSUBms+Du+kp5bs+3cK5+ldmfmKOgT/JNhem5h+n55ywqAkltHHX
	5HVCUVvlyKTRbJnypW2WL6A5BTxfPzmoP3nqw782OAWL9ck6GpdaFYDdQ3/6W+CKw3JdaodFfOcX+
	2vEsorF6xu/6Y3Hk4g/WKXZ1Vs51emh31l0CLlL89RvmdOIEk8AIFe9Xi5ARM6/JJZwgbGI3J7QZP
	8GLs1dLPVrOdxqX2xoz+y/EtKLqzGdlgUrJhyybO5xF++r8l3nSEx7+qv53UFl8o6wd1msZqKSgFs
	l4gK6ujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPST-0046Wr-Kw; Tue, 23 Aug 2022 08:40:25 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQPSP-0046Sp-W2
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 08:40:23 +0000
Received: by mail-lf1-x12f.google.com with SMTP id bq23so9672456lfb.7
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 01:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=W0I5qGBRorIzU4/M9Z2JKZBtnIIxK+lV/fotyWPu8eo=;
        b=YfivAOPyp/S0t3HR39n5l6tvClobRS3WjgJLwTgsVGDusGuqa7DeH4gqCzzVzFxepy
         OW9z5QACGE6BtNdpfnV1/HM8WsRwMVBLMh7YHcIyDUF2/MY8bcVlCehu+nEIZUAsWx9c
         fkwMmvwOK97l7bl4OC/J8rsmNB/AQuWLY4nvO6ILnWgRoezZMuVZ3kY822corbLuFOpD
         UYCZ+XlyG4PQbltck8mA2bLjjbXpqsDw1J5IxUXZd+hrmHOhLc70LrN2dJXq+xs6XeFw
         ThxIm7/BGfRz9voj2AhZY9VnjvoLi91SlfokA7MoysD+QWK15MHumcudOkm1Oi0A03xn
         Fw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=W0I5qGBRorIzU4/M9Z2JKZBtnIIxK+lV/fotyWPu8eo=;
        b=Dt0zCLDRsLgtps0JPXQlgifuisBov5HYc5cFtob5HmOyDP1+4c8coBAAZoy80mOgZc
         sCqbFha6MKAPgO+eV2hvXA+mzVwhrc+rfegiE0qeJGQTFknoUPrgL4MQ1s2pgrX9SGOA
         52lWtKz7giZNHOUE0wGJXK0MGbrz/0JZ8EGNJDcJUGnFNzAPB3obkoeMxl6ZghD1C8bb
         ZzfGcM9U8YOK2eTbhpSX+uXBAWnMrbAVYle/GXkbfYLmCKO3DisxnK4F/0VR7cKACpZO
         jJ6VqLkAcwWS/bW3+v4JKdTM5tcXhNy2aZjgMiEOSDw9nc0vb0p17Dm07rc++Guh0B8V
         woPg==
X-Gm-Message-State: ACgBeo3TW20qPkDupRvkxG9kLlqO95d7Ul6gIfpb0rOf7IvF1QUKOZ2t
	l3PXQnnFF/dltldQJNgQ9sSzGQ==
X-Google-Smtp-Source: AA6agR5+rUJS0PTf+2wjIEbj+myfHGedVpyDY4058HVzXxye9slAAObIkitw5XGxHJ1FVj4NKKE3Hg==
X-Received: by 2002:a05:6512:118d:b0:492:da96:689 with SMTP id g13-20020a056512118d00b00492da960689mr4163856lfr.244.1661244020402;
        Tue, 23 Aug 2022 01:40:20 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id t20-20020a2e8e74000000b0025e1ec74e25sm2247874ljk.43.2022.08.23.01.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 01:40:19 -0700 (PDT)
Message-ID: <39f63588-bc88-a716-bc66-7f93c4aabc56@linaro.org>
Date: Tue, 23 Aug 2022 11:40:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] arm64: dts: Modify gamma compatible for mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
 <20220822091945.21343-4-zheng-yan.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822091945.21343-4-zheng-yan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_014022_158611_FD278D2F 
X-CRM114-Status: GOOD (  14.47  )
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

On 22/08/2022 12:19, zheng-yan.chen wrote:
> Modify gamma compatible for mt8195.
> 
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> 
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index a50ebb5d145f..8504d01b103a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2021,8 +2021,8 @@
>  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
>  		};
>  
> -		gamma0: gamma@1c006000 {
> -			compatible = "mediatek,mt8195-disp-gamma", "mediatek,mt8183-disp-gamma";
> +		gamma0: disp_gamma@1c006000 {

No, really, no.

Not explained in commit msg, violates naming convention, violates coding
style, not related to the patch at all.

Best regards,
Krzysztof

