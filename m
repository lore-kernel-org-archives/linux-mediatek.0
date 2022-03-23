Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zT/yjB6NzDGZ0/7vZPI61hr7gg9Zuw8qztk8jH5zfJA=; b=rnYaMws81CcpBs
	E8564mnEz3bKHlK9pcL/bFNUcVWGVU9nhfqyvOVUlvAv1YMt95WzGhQBiJGq+d2VAyK0Gtiy8/C6b
	qn1glG2D+nyB+HWCxTnKIE2VcXr2TasGaKlTTo3caGDfwxmUI4uiDcKwE+i74I3fOsmaFRrndnr9n
	ZE57uUMX+ltduLQutomC+bJXTdEHickTQeBSv+47Jp/pLnQfeLCANix7HSnBkVwHvbgNkn3qMnW6m
	fYPuee/r5scdAAMW/EboJqMzsbDD0weqh4OPpgs6tJiho+7iIZlNw/mNYleWtY9/K8amGfRC4Z7GI
	onjM1RKhBVSs97K388Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4l3-00ERaa-3w; Wed, 23 Mar 2022 17:26:53 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4kn-00ERTp-91; Wed, 23 Mar 2022 17:26:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id b19so3102137wrh.11;
 Wed, 23 Mar 2022 10:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=V9Yyooz68jl2Yv/SIAxGrm/okwE52nxnEfNEFc+sdng=;
 b=FrlZh6+UbspaaXyxhTyMHIa8XYe0QM+o1xheOIlAv4OtXepnmVZYhqUNJTBunN+QNA
 5EVR1h0DyGH7+43jc5PKu4FYGPEp03inEVfYWsDKTLpKrBHSv7ZWxFD3LoVz5typNvAs
 TO83pHFF1Hs9ATGDeTQWG3BR87fA1HAuTcynG6y84uo4VHkdiEpXHe9p19T1z5NbgpKA
 JBbCDBU2dX0qqapkPCi5FcwJBVxC1cOAYIunSgvLknsg8ibqoYVMILgtktz9EIdnh3YI
 Hv224v0kO4up3iC5sYXvibPhNm88mq3oS7pIUJDKYUUE165JQTX7TUM1pTXowL8KM8mc
 gwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V9Yyooz68jl2Yv/SIAxGrm/okwE52nxnEfNEFc+sdng=;
 b=XnII+wI3pqTX+SEdTZMz8zr+k4s5MaOLjN5efLei8x4eToSJmihPgmxEtMjN7hqhEa
 FZVkvYc3DMz5wCM/PvJGphNDM/FFuuh2U6FaoUm1nCrOIM231Oh+r5rPV+mqkd9RH/7L
 WugO5EOQtPVLhVDE/CGBqD1Z4cLUa2H3bJk1xfbyqex9B9me856yhF0nQu0WGq2eNrFC
 hG4HnjcTv/blxe66gGTCOGEUt+SaCS4JLm5Pq1qctImAfPa5GpQxuxI4EhvUMYhhx1dQ
 pyu1H4mgoO3j0eQmxL+90HNkkQL+W4q7twwb/HphvZYjsiB/wcKhBADBsioMxXm9ihwm
 4SzA==
X-Gm-Message-State: AOAM531FQs3fr0r7Qvsbkd4fz5uIQLFWtFVc6teTkakWK1+8GmkWRBJJ
 cLgrRdJBprU4u0AQU8hUnQE=
X-Google-Smtp-Source: ABdhPJz0Yv0mOtu8mBleQKGzx8/1JIWReXJKiILWv0hl+NKIR3DKIt6hnhyV6uzP2eJjCrNVa+qVlA==
X-Received: by 2002:a05:6000:2ca:b0:204:1e6a:d2a9 with SMTP id
 o10-20020a05600002ca00b002041e6ad2a9mr915767wry.182.1648056395232; 
 Wed, 23 Mar 2022 10:26:35 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c1c0f00b0038cabc63721sm378462wms.30.2022.03.23.10.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:26:34 -0700 (PDT)
Message-ID: <3c8b96c5-c390-0ff8-2434-b6bb2e60b3d3@gmail.com>
Date: Wed, 23 Mar 2022 18:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 04/22] arm64: dts: mt8192: Add SCP node
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
 <20220318144534.17996-5-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_102637_357100_29608488 
X-CRM114-Status: GOOD (  14.66  )
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
> Add SCP node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 9e1b563bebab..195d50894df4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -706,6 +706,18 @@
>   			status = "disabled";
>   		};
>   
> +		scp: scp@10500000 {
> +			compatible = "mediatek,mt8192-scp";
> +			reg = <0 0x10500000 0 0x100000>,
> +			      <0 0x10700000 0 0x8000>,
> +			      <0 0x10720000 0 0xe0000>;
> +			reg-names = "sram", "l1tcm", "cfg";
> +			interrupts = <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg CLK_INFRA_SCPSYS>;
> +			clock-names = "main";
> +			status = "disabled";
> +		};
> +
>   		nor_flash: spi@11234000 {
>   			compatible = "mediatek,mt8192-nor";
>   			reg = <0 0x11234000 0 0xe0>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
