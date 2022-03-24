Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E50C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OX+hAdN33AYdATXCkduyKzs1oKtb4ZlOxo3gbAYe1tE=; b=KJMwMiN4XxfcSp
	HyAJ2jjYJt0ZM5cME2HowfhH8WXXGIGczwnXSYlPl4YXZYHzIqD4yOlmahMDpdXpr1VAzNIiciqND
	LgCN39rcfDTxJjpudBko6/8nfO1bTa8ZKRq7kMQWWteYwT2a4tEYizyaOm+QEUHXy3dIo4fONF91F
	fsRk7jw1OI0i/JEaVHfqbDpjBu7sQx/MTljAOOsjCvbVCh+vqybXCJYG6idlosRu28TOzYKF182HC
	vt8sO7dtZ+adscyTnniuQiljdcHlteUjwLBroFWPSCqKkI6eW0KHNXq3LbggvZrv+cXHLgWknuoKC
	TT8YycxwB5t+VkJ2GpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXMcA-00GYDA-12; Thu, 24 Mar 2022 12:30:54 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXMaI-00GXIb-S7; Thu, 24 Mar 2022 12:29:00 +0000
Received: by mail-wr1-x429.google.com with SMTP id h4so6378123wrc.13;
 Thu, 24 Mar 2022 05:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0ov3ZR+ak5DEDpTymdl0/BQjBNtuGJXsPc9qEMjlbkQ=;
 b=hVtw6rp+xuX0d32ARb62dUhqM4R3VC5pofs48O+4O920vt8CSq/sMLpt+8+LAZTn6e
 VIElYkUtW8LSN1yoQMFd2i9puNjj5gYEvYDBOb3SSsgi3tPQAHlmFxSvRgtvszbt6FyO
 NmOZEEZDK1GdAONx5AAxdMlRMLuKDF0uAD55768LvcmNbHzBYo4INUMN+su5fvumLCJ1
 7ktrUpLJEE/CMXKFSi0V3hAuB4a5tjC8+ZX/61G0VwG54/3FBkrPk9WXLZmeRHMYXL8P
 XdaRpRUztUdXn2sXDoBLQN3klBO9J8OPo2ShA+q9B8maZSx5U5yC9a+7/BJ9zNKLqQix
 g6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0ov3ZR+ak5DEDpTymdl0/BQjBNtuGJXsPc9qEMjlbkQ=;
 b=k7HjPdD7NyQqwpXN/6AGS3WPlH69obxLovbb04/Ntjqcdq90js0SD6R3GC2DvDtRzA
 oIb2OYD9ov2poNV6+6c2odB+u+vm7g99F6CIzI1b6LdsWN2lQobtk0+Yxzo8BQB4KKq6
 4vUYpB2B5H/E0ooNe/PCiRem1M12yTNkynYJp+Oq4iqCbRjuSwh3SumSfoTSJIImmcL3
 44NPN3wAcGuzv2mmU57kr3Wt5nOI95lz2puDoXzaIZBxQJttDkCdsYXO62FCOSdmgzqb
 hSfGO8YDyHgrIMaRCGtKDrqO6ggIbgDcFsqn/i92+pWtzEHurJ/EkVAn7wmObcvEgr/W
 3wWA==
X-Gm-Message-State: AOAM530LmUi56DQRg4lOyazpih14S3hpPVTm7iaf/3+wo01t9DcpcdiT
 HubxiDh4jQGA5kJVYhvG3xc=
X-Google-Smtp-Source: ABdhPJzsygHW9SyBpZIAEvN/v/Oz7TkRtXHqmlOfpcjumaG0XM8yQr5RnjRWRQydHA0frLg8LXHT8A==
X-Received: by 2002:a05:6000:168e:b0:204:fe5:a55 with SMTP id
 y14-20020a056000168e00b002040fe50a55mr4282985wrd.453.1648124936591; 
 Thu, 24 Mar 2022 05:28:56 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm3913847wri.0.2022.03.24.05.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 05:28:56 -0700 (PDT)
Message-ID: <0bd165e6-6d2c-7586-44c3-9c257843600f@gmail.com>
Date: Thu, 24 Mar 2022 13:28:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 05/22] arm64: dts: mt8192: Add usb-phy node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-6-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-6-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_052858_991301_99455861 
X-CRM114-Status: GOOD (  14.30  )
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



On 18/03/2022 15:45, Allen-KH Cheng wrote:
> Add xhci node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 195d50894df4..28b93b76fe17 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -875,6 +875,28 @@
>   			#clock-cells = <1>;
>   		};
>   
> +		u3phy0: t-phy@11e40000 {
> +			compatible = "mediatek,mt8192-tphy",
> +				     "mediatek,generic-tphy-v2";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0x0 0x11e40000 0x1000>;
> +
> +			u2port0: usb-phy@0 {
> +				reg = <0x0 0x700>;
> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +
> +			u3port0: usb-phy@700 {
> +				reg = <0x700 0x900>;
> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
> +		};
> +
>   		i2c0: i2c@11f00000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11f00000 0 0x1000>,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
