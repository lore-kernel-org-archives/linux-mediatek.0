Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F02FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5ZSl+MowW5JlxRGmymYat8zL3GSHQC00yFa7WT9cJM=; b=c4pPCNvivnIqio
	XqGCbusFI82yZw+NOwLeTzky/7WATQOVruJaw5Db1PYhABxQ2MfykPRoQxPowRQIr6hpTpWXIIs8h
	Cs0QzWkRjgqWwh3/nmTtINi4wVxP98J6wnVlFh+IumDj/kS4KumUVDUSZ4mU0+lDrpXwtzx1Q1Z7G
	k8YrdiJCEAnA1qHwcjkQ97QdrgKi85uEgopVdt7PErPGDzipl/2uJX/Fg75PRlrTyzpfKjDzrupVc
	qSzTn65VJpsD26nMeX7Y3z02f8NCPdCM47Oz2cIpxNg2Xv3ju7cAEaJFmTfIiy2c1sR9596Ip1uMV
	4rHCdiPj7vBv2BY3+Nkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhtzq-000juo-Uw; Fri, 22 Apr 2022 14:10:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhtzW-000jkl-16; Fri, 22 Apr 2022 14:10:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id x18so11284977wrc.0;
 Fri, 22 Apr 2022 07:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WHY5obBMCsooLhCw/OdTbOsgtgWent6rNWstqxABc8k=;
 b=e/2yN5QXX5uUIvThPXaFjSw4QvxarL0jFJu3iP+XV2vkhUWldP4uyN5EwZ9F6DjgEv
 4hQtzhWntNtvcgQHNnb8cPLxgGU3MJog3vehgdb9iqLNXHfrd1STE0v1IHHbFu1bfTjP
 h0Anp5g5MzaRrSaxPV+qKmF8EdlhofRpolYT2dCjq+A0v1Qwi4RkzyD35tOhh50y0Alv
 LIza9+/yJpBRZq/6dRs9X9zQfEgZopnC+Mp1RgEI5dVfsva/k94wyvXp2YgYgN+GQoZ9
 31M5Zy041aYQCi5j6Tia2lEH55rF1qdN0zC+9ZGFmjagbpGtxpMd5s8gcpRAe+QmqR3T
 217w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WHY5obBMCsooLhCw/OdTbOsgtgWent6rNWstqxABc8k=;
 b=ZfXkMgozM3qpOosUXZ4mWRHJDWQ5r5xntKFL/7EEEF5bocyZu72QfH2gg6ht3RZQKw
 xX4M6aPswlmiOHN2iz3V1CqWfG3OT3PS6qY08Rx+1F6P1sYamc6oYFwU/un6w15EzoOh
 /WC3P/jeshIxqlCh02TBuFLI9SdUo+yUZnlMbV3sod8zjqcPCnfdB5+es5JiWzbj/HcH
 yrVf2ZUrlKtVMySIw5O4aOcgaIrOI+MGVEB+mF54gf8OOFAvdUPSwFNLf8iH5HMBWRN4
 0WrrG2HauqfheW1aQUbjk0vVZSIzkg5WQQXgPhB/kBkvHBropMLG4ZsP0NFNbRtAMOzm
 W6sQ==
X-Gm-Message-State: AOAM531ld2b6UjpSPymYoDBN+AVRTvXAMA+/onqv1VsxXqQ2JZxDmgHO
 j54At92C+ZPayclofhcskHM=
X-Google-Smtp-Source: ABdhPJywHAB77yuMlFtbES0kJl5asaV9vipnnQKpbCcCz58AfmwYxCPCd4qbDAIkHpmtoRB+jxu7yA==
X-Received: by 2002:a05:6000:168c:b0:20a:84ea:6647 with SMTP id
 y12-20020a056000168c00b0020a84ea6647mr3979628wrd.191.1650636630327; 
 Fri, 22 Apr 2022 07:10:30 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 t4-20020adfe104000000b00205b50f04f0sm1818776wrz.86.2022.04.22.07.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:10:29 -0700 (PDT)
Message-ID: <13768c7c-41e4-e24a-b325-2f01eeb1883f@gmail.com>
Date: Fri, 22 Apr 2022 16:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] arm64: dts: mt8192: Add spmi node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220419063226.15958-1-allen-kh.cheng@mediatek.com>
 <20220419063226.15958-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220419063226.15958-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_071034_132191_9988FAA5 
X-CRM114-Status: GOOD (  13.47  )
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



On 19/04/2022 08:32, Allen-KH Cheng wrote:
> Add spmi node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index a6da7b04b9d4..164fae36a3d8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -537,6 +537,21 @@
>   			assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
>   		};
>   
> +		spmi: spmi@10027000 {
> +			compatible = "mediatek,mt6873-spmi";
> +			reg = <0 0x10027000 0 0x000e00>,
> +			      <0 0x10029000 0 0x000100>;
> +			reg-names = "pmif", "spmimst";
> +			clocks = <&infracfg CLK_INFRA_PMIC_AP>,
> +				 <&infracfg CLK_INFRA_PMIC_TMR>,
> +				 <&topckgen CLK_TOP_SPMI_MST_SEL>;
> +			clock-names = "pmif_sys_ck",
> +				      "pmif_tmr_ck",
> +				      "spmimst_clk_mux";
> +			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
> +			assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
> +		};
> +
>   		scp_adsp: clock-controller@10720000 {
>   			compatible = "mediatek,mt8192-scp_adsp";
>   			reg = <0 0x10720000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
