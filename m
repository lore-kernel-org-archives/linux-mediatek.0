Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BE8C07548
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 10:25:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A3620BED
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 10:25:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MmcJU8w5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtLuCefB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43A3620BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NFkkSF+X15OTUE2+WXwZc+KnD+jwpbXGgdvi2+Qraak=; b=MmcJU8w5fQi3eKx6arM+cFZ5U
	28CyckG2Yg0Hr0VqQDWlZBVo0zkgFI7vPmj1Uf05YQlr9vMeWXxSh4cTyP8HyfTTl/RePOWRAXYSb
	z0gNCa7eR1ixSzy5g/h8pw/Kn9qnFcS5hQV0EVakfRIxcwZsjaZIXhcT8J4H2sBzgBEof7kAttkhu
	3GA19oxdQPk0pkI/lujMDky5994sgFZQepFpR/QRlgzo2UX7E2NAiP8SrDPPdifRdZV+WOrNa7L/f
	uEqDcWP2kM3z4YN66Xcxwjeke+NBpmuW62N+eGxj6/koYEHWJIiBZYi0GLWXqOEtfP1nQKh5RyWww
	gF3/m6u1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGJlm-0003Lo-9U; Thu, 10 Sep 2020 10:25:34 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGJlb-0003Hg-Se; Thu, 10 Sep 2020 10:25:24 +0000
Received: by mail-wm1-x341.google.com with SMTP id a65so5070952wme.5;
 Thu, 10 Sep 2020 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uDGopvs8aEy5CLN9XFvGzNsaYZBkoKWrQofytwNxzDI=;
 b=TtLuCefBkaK7TlKv/Sk2EuMm6ot39a7QJqRt/iyU/N/NhshX+ZQAp9ewNvpTs+0Z72
 8KF8R1rSgMj2lrRVEtQs7czdrs+vh7uMxahg7wcCNOCTeuhnnwrSWxkKefP8zzMlz8fr
 d+hjZlUbxc3sSiCsaeL/0LSEK5HD/coEmRMSUD99K6bySVOliMuw67g1DHV2G65QWMcM
 Awf7VI/yhh1E4RSovGaeLdgUdL8cZSyUB1aHo8KsNAE2Kvx1isaqgWevpgqpHKh5m6ux
 9jZli4FVifj/fryrULBwtCJrFAQI+fI1nGfp1Vw1RyITZmyJEnxUULbMPtd87vHxZjMB
 8spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uDGopvs8aEy5CLN9XFvGzNsaYZBkoKWrQofytwNxzDI=;
 b=HF+bd4cGoqwblKnWFnkR9EhsEGKHJkgCZH+MzgldRRYvKWftfaWtHCQzTVB44nBKja
 HJk149NGsGTTu9biQa4aEVur0hDLc7U724VpW2hXBDN3Wc86MBAWVkGfHLsNYvXjkV6d
 wfL8m2QmNL0yobR2EHHIKUlnK49UO+nPX7SlfTwb8BJVqseuqz8lPS484dCVwe5lWiJh
 /Zha1JDwcPhOJ31Ob3ibs1QahqG44qyxFcW0K6Q17ePAaxnATV2cvmfufKAJ6+4DeIMR
 O1dbI8OtVwbKH1b1+pE3D+/kvxTrFz17SiRc2mkZI8pELNd9rKHsF4auyzhQnLuAGQv9
 8K6Q==
X-Gm-Message-State: AOAM531Uto9g+xtWXuq8cFYceAB6dZ9w0s28rcfA1OmbTQc+8z9L6WRD
 Rt6XtwXU9IlOkKpow7TKpe4=
X-Google-Smtp-Source: ABdhPJwEntZMPev9H0+UabGQF6k7v0hipNAbHGksKxQPqTzKVMcHb27HZfswdjmY9yMhPtph54h6PA==
X-Received: by 2002:a1c:5a87:: with SMTP id o129mr8077545wmb.145.1599733522852; 
 Thu, 10 Sep 2020 03:25:22 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id g143sm2937249wme.0.2020.09.10.03.25.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 03:25:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8173: Set uart to mmio32 iotype
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org
References: <20200910084304.3429494-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9ca1b7c0-9fec-27b7-ae08-c00613c3004c@gmail.com>
Date: Thu, 10 Sep 2020 12:25:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200910084304.3429494-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_062523_961370_2C9F1A9B 
X-CRM114-Status: GOOD (  19.61  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 10/09/2020 10:43, Hsin-Yi Wang wrote:
> Set uart iotype to mmio32 to make earlycon work with stdout-path.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 5e046f9d48ce9..ca6ea71f5f435 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -613,6 +613,8 @@ uart0: serial@11002000 {
>   			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
>   			clocks = <&pericfg CLK_PERI_UART0_SEL>, <&pericfg CLK_PERI_UART0>;
>   			clock-names = "baud", "bus";
> +			reg-io-width = <4>;

Why do we need that, we have
device->port.iotype = UPIO_MEM32;
in early_mtk8250_setup(). That should do the job already.


> +			reg-shift = <2>;

Can't we just add
device->port.regshift = 2;
to early_mtk8250_setup()? I think that would be a cleaner solution. As the 
serial device is the same for all SoCs, I don't expect any regression here.

CCing Eddie to correct me, if I'm wrong :)

Regards,
Matthias

>   			status = "disabled";
>   		};
>   
> @@ -623,6 +625,8 @@ uart1: serial@11003000 {
>   			interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
>   			clocks = <&pericfg CLK_PERI_UART1_SEL>, <&pericfg CLK_PERI_UART1>;
>   			clock-names = "baud", "bus";
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
>   			status = "disabled";
>   		};
>   
> @@ -633,6 +637,8 @@ uart2: serial@11004000 {
>   			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
>   			clocks = <&pericfg CLK_PERI_UART2_SEL>, <&pericfg CLK_PERI_UART2>;
>   			clock-names = "baud", "bus";
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
>   			status = "disabled";
>   		};
>   
> @@ -643,6 +649,8 @@ uart3: serial@11005000 {
>   			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
>   			clocks = <&pericfg CLK_PERI_UART3_SEL>, <&pericfg CLK_PERI_UART3>;
>   			clock-names = "baud", "bus";
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
>   			status = "disabled";
>   		};
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
