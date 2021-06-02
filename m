Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65433C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 12:28:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3499F613BA
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 12:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3499F613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=E7cmL3wmtCTCfguLqLVEqCN1H7fn6lpsRinu7+rtfB0=; b=Xv+B0aJ6+AzN6m94elkDDhOau4
	UYLevU9i8HoHMW3FwZXwP4G5ZtQ6iXJdQdOG7r+5lSgwVFz2DKP/KUkWgBvjF9WSy53eXRjpbG4PT
	mMjCxyg5e0JRaiFa5fWVfmyuWkZFVoF02ZAxoj0KOdd7GnIP9bzXIJYdwpt35BKnj7MSMrt6tFJEv
	DTQ5rDGRZGT1np9r9xHZgrEHxqxxN/deCEYZ6e8BSjqTdsehpB1ZiubITKqnzk+km6IvTfi7X97dn
	5nGIZWxrMDGUi+QvMF6JF0W3FHoZGerIHBwSQZ0NXqQL9+w/+Q7wHz4+tXjRaSFRBeNT46yIXl30l
	JJs80z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loPyk-0043mW-6v; Wed, 02 Jun 2021 12:28:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loPmS-003xbE-8M; Wed, 02 Jun 2021 12:15:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id r13so1143899wmq.1;
 Wed, 02 Jun 2021 05:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NYQ0DBLeg82xJUk7GJVvs66y68mmqwOYU+5W+gTFjjU=;
 b=nT3mPDXaI76rhaGbXrGdOF2tQTVladAr1KfGrc6uARYU2qTKkYje3ge+Tfi3E4pUZJ
 5g7iayiriAI25OE++iuDiMSkDgYDj0gPG7swtdaRbKRlhKKSMRTaHOKOaJUkv7r1hXeS
 Qr+6WZN7wFevagpQDD5PRn/0+R9csUoEUYy+TnZcOD5+CqVe4YfCXvNlg2Zau2XUAwPU
 WfGbPzGGUXE7iBVoyRrL6i7hXprG9zdldXpCuU8Hhv/+UqvAG/K5FKL5bX9ZbMtIACOC
 /8zVk4WuevEtH0CEEe/HJMObpZwEBsEgIOYX5MZvj9Y56XwE3MMs1GCQ0yfUmNMZ8Xtn
 tEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NYQ0DBLeg82xJUk7GJVvs66y68mmqwOYU+5W+gTFjjU=;
 b=Th7qcOnFpq4jRJBFRu1/2DZdSSJYE+NL/tR1d0r0TaD87w+wAaLW7Xl2IGHgFZUwYm
 p0+lBwhC96yfMW/okq8L3+AVRP6isqpYAV13qSrp9xRqbu+uXsNqCxurKI3nHV1jri/T
 n9QqBqGsAuwi2BLSYP7wNSA5Z+k6GCuzDPoz6PtNFf6PDGLAcpkqBmxIq3+ZEzVm1Gw6
 +oHGujmd46X1A/fGIT0ksk0FKgkKBDP0tqtEpaIN8xkz0DTFdord5mSHVUxnmfWIK/pG
 23GrzgcKzanAGCiCrLPwTHMwvZ4sGDU3mZnbPAcRHjIkBGtgAM5H49o5KW4kSdX4QRfp
 P7jQ==
X-Gm-Message-State: AOAM5313ArC16nnFVG4fnDn9yBPEobF3l+7f/6DfMaikDTjbWjWOpZqF
 zCxL9j+DJFcK61tNFL7RosVHPN5rV+g=
X-Google-Smtp-Source: ABdhPJz9eiapwoSn11oUlnVhy+ovN96PWpChVj0Xk0ODghVf8PkV+hJjYAeeRSAVAkfUmKtepo/oVg==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id
 l18mr31359961wmc.142.1622636126300; 
 Wed, 02 Jun 2021 05:15:26 -0700 (PDT)
Received: from ziggy.stardust ([37.223.145.68])
 by smtp.gmail.com with ESMTPSA id d3sm6341225wrs.41.2021.06.02.05.15.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 05:15:25 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] arm64: dts: mt8183: remove syscon from smi_common
 node
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 chun-jie.chen@mediatek.corp-partner.google.com,
 Yong Wu <yong.wu@mediatek.com>
References: <20210601040014.2970805-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <27c155d4-6198-08f3-9972-1a8da1a026ba@gmail.com>
Date: Wed, 2 Jun 2021 14:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210601040014.2970805-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_051528_351237_72545A9B 
X-CRM114-Status: GOOD (  17.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 01/06/2021 06:00, Hsin-Yi Wang wrote:
> We don't need to register smi_common as syscon. Also add required
> property power-domains for this node.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.13-next/dts64

Thanks!

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c5e822b6b77a..e074c0d402ff 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1263,13 +1263,14 @@ larb0: larb@14017000 {
>  		};
>  
>  		smi_common: smi@14019000 {
> -			compatible = "mediatek,mt8183-smi-common", "syscon";
> +			compatible = "mediatek,mt8183-smi-common";
>  			reg = <0 0x14019000 0 0x1000>;
>  			clocks = <&mmsys CLK_MM_SMI_COMMON>,
>  				 <&mmsys CLK_MM_SMI_COMMON>,
>  				 <&mmsys CLK_MM_GALS_COMM0>,
>  				 <&mmsys CLK_MM_GALS_COMM1>;
>  			clock-names = "apb", "smi", "gals0", "gals1";
> +			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>  		};
>  
>  		imgsys: syscon@15020000 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
