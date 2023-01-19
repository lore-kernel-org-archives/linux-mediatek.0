Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164E1C6379F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQl7qUGxsdoKFrCBv66aUl3ctKwMQI8qh2LAJ26Qshs=; b=p97sz4G4NqKQA8p+KdToNSYqiD
	IJXU3jQPM9qmFpVQmAlgitgKV1ytzZOuplRZS3Yj9pSKSAY9ygYbSQvVOxA1U5RtJ5OZiVSZAGBN9
	XIgeFUophlXTlWn3ek7vVeqUI3KPN+tkFTs2Txb4h5zewOneRqoxESQIieb1jvttCUei6Woqr/Wi7
	gNQAAWv/PA6LYFH8N13bZOmLJ0yHYcKDBGvHUtn6c4Jb/nZkwo7FA2Nzjalu7FvAcbJsF6/NCDOKa
	GmDRz5jUrOAu5HdtbS7/jVesxlB51H5Tt3T3Z0LdDxy8WF869Q6NANIxMl92NrnIB3j13YMvfx2KO
	3QxDYaag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXvz-0062KH-6z; Thu, 19 Jan 2023 16:38:39 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXvk-0062Gb-TT; Thu, 19 Jan 2023 16:38:28 +0000
Received: by mail-wr1-x436.google.com with SMTP id r30so2417072wrr.10;
        Thu, 19 Jan 2023 08:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zQl7qUGxsdoKFrCBv66aUl3ctKwMQI8qh2LAJ26Qshs=;
        b=XSLEULwtL1hfc0ehGCkOo/d8/WdNcR/Ld/stT0tCp64bOhVWhM2UelHbCVpKCI+Pke
         5ADmmJB+wxQEtBkGa0n9l4yHXw3+POItWwRLe/ctscm15xN3fIczmH5Xm/CWQ6r6Wm+Q
         tbLxMd+Xvwd75WTdxb6mKorM4fVKjA30BrjMPyCl0WM7410KQ6aP6RKAkzRr2n3V2O/Y
         /yOE2+G+Nh1Kc/jYSd3ZUhsuf1oFFTLQ/D/QrpLOIQO20Ig6a3ZqnPz3SmxP2ixaDPTU
         g+gq52AnXwnO7JcGGSLoxj+R4CBc1MOqJ1FWwltb7C0HlR17u4gFcwVNRo4wMDXe/uyf
         YQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQl7qUGxsdoKFrCBv66aUl3ctKwMQI8qh2LAJ26Qshs=;
        b=OwW4/479a0P4is4/JJ42cAkMKxSsgB6yrwVo/ftv/kyZw917HhWLWG+NcTYa0s87ma
         jJE/iN8ROKwfT/VvmHmLibIlpctjF1f65TO6Tz3nVB5etVtCKNlhOeew1koHE6PDN0zI
         ysCR1DoWYVRP10acv+dSPV/Vx7+EoOej1i2HomIE4TmHVL4x7GEOi7R8MI6bqdsB8/YE
         LYY5ADnhxXQ+LNYAVn73g1SaZuIMoM6iGlj8q43lVjTY11j+tyWHnp93B6S/6CcmuOJv
         bM8e/K8hsyjxE+cZ/RouM3fQ+MKi1G+mDLKcgMhthNyjUJzNOlUf65PoMO6ulXrt5nhh
         k04A==
X-Gm-Message-State: AFqh2krATNLIeFg7kdln1jf0aQt9t2y4JfDBNqVAvIRxvzUe9vYDTjQM
	b7rTQ28+KyEK0gKVSH7BVaI=
X-Google-Smtp-Source: AMrXdXt8fakZIEKWCsTm2c2xaq1MMWkP19AbenzPjcXfucpcdAoh9oJ2/Tedi7D7HHxw+dMNzUWA6w==
X-Received: by 2002:a5d:6b42:0:b0:2bc:7e6c:7cd8 with SMTP id x2-20020a5d6b42000000b002bc7e6c7cd8mr10363922wrw.26.1674146303319;
        Thu, 19 Jan 2023 08:38:23 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g2-20020a5d64e2000000b002be063f6820sm14948613wri.81.2023.01.19.08.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:38:22 -0800 (PST)
Message-ID: <344b14cf-7b87-34ac-5588-58388399357c@gmail.com>
Date: Thu, 19 Jan 2023 17:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/9] arm64: dts: mediatek: mt8186: Add ADSP mailbox
 nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-5-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118091829.755-5-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_083824_999845_992CC817 
X-CRM114-Status: GOOD (  14.18  )
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



On 18/01/2023 10:18, Allen-KH Cheng wrote:
> Add ADSP mailbox node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index a8ff984f1192..a0b7dacc10cd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -640,6 +640,20 @@
>   			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH 0>;
>   		};
>   
> +		adsp_mailbox0: mailbox@10686000 {
> +			compatible = "mediatek,mt8186-adsp-mbox";
> +			#mbox-cells = <0>;
> +			reg = <0 0x10686100 0 0x1000>;
> +			interrupts = <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH 0>;
> +		};
> +
> +		adsp_mailbox1: mailbox@10687000 {
> +			compatible = "mediatek,mt8186-adsp-mbox";
> +			#mbox-cells = <0>;
> +			reg = <0 0x10687100 0 0x1000>;
> +			interrupts = <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH 0>;
> +		};
> +
>   		nor_flash: spi@11000000 {
>   			compatible = "mediatek,mt8186-nor";
>   			reg = <0 0x11000000 0 0x1000>;

