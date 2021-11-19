Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F64C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 10:38:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E51D6117A
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 10:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E51D6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOEfv0S7AFLJSOYZCcrya0mkfi0N1bZ2cd2aQSZ1xfs=; b=mZfyvd8lZKIABu
	eVANCQVxBUqR/WJgEmqvxN8dNdWPmn6SNUbQiZ68jEtNAmeMHFmag2im/FFditEJqQ3MR1gWvADQt
	mA0/+J7pXyR5vttxd0Y/oSrTilfPgmUsOCpqUZsse5lRVNPrCyQKOqiPH5at8nhkOpu1EaZgw4ZUu
	R9yAEuA1aXbleM12D2hGD8NXLjgtuo4U4d/SKtv24z6TWcqWA9QdeHJWUFyslnfLrjdKyLCJmgzcM
	S7lH1Fy6ol44wgLKV76thIEWq21EvKxInpyO0+By/achGMX/TgTiddb5onBdM2vx0H/5hGanKMCTo
	+C/ohVPuAHph5z026cVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo1Hp-00A9Kv-RS; Fri, 19 Nov 2021 10:38:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo1Hc-00A9Ii-Pt; Fri, 19 Nov 2021 10:38:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 z1-20020a05600c220100b00337f97d2464so7435373wml.1; 
 Fri, 19 Nov 2021 02:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QtA7B3OppLxMsQFCLEypGqTxZJM9PfVKbPN7FBqSKVA=;
 b=QCKvKb228ZQS/w7qvoX0rrvOWiqVfykx8wBtcJbNxo9kGe91M1urHDE/JENLaW7jMe
 98NakgGsBPzkzMYfgdc5fkfNITEPhp/jRigeBwQeTJ1ZHD2ZAxysUZxcgvbGn9z5diIc
 kyq2hscMGd7CxUyIXilW3QQfp164uVDDt4vUBJebed3E5NIKWCKx3i+HmLo4P62D1hK3
 4vhG5DcEMucRevuswlir07+jvWkrSXk/vKTh48r6HxQRRW38usAog99y0VMe9YExo1T5
 eMwLlbx5MnY7PDWtrFj7APWMGObUgeC3ygJVCk3jABnCNaAjBiQpeUPiCpNAy6ai29xK
 /RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QtA7B3OppLxMsQFCLEypGqTxZJM9PfVKbPN7FBqSKVA=;
 b=JDW+ZgwCpCupX+NfRh7EOpnilRSVL0brCR9pXsh147Z08Cw0Gc7B8lxhh32MdlyePl
 lBJQzVMcaRwc+kGKiFYjSWl09UXhvX8NmwEyMN3eU95SS32nPbpsD682vqQABhaONZdl
 KiTUHcb0inhswh2eBlGqAxiexPhkIEklJjJnsM693bKuiGystN5Hc6+MNjy8w1Pj60h/
 0dtyNIAI1V1QbJT9+o82Z4KeoZhg9vS37Jx0MlMI/tX71b4iNbX/d7Lj9ENqSgWCSsyl
 Yv1rDAL+PKWF3G0vVn+8pCCOhCx1uAC87fCsUKJFVnTA8pfOhjdlP5n0Dz/saeoqDapT
 4bbA==
X-Gm-Message-State: AOAM533aVzs0SsLdsXht8JJ98HlLmXAZb67IomNz4u7vN8VFwR1ldfGs
 OfHd5ooXegMXEmCUn9mxFyXioaxphRg=
X-Google-Smtp-Source: ABdhPJzHgRy4bZNWJW5/fNsaV5sUrjkOLCir646W22JSvcC1grDH5KucDPgbH2KABAbGzf8UdyQzcw==
X-Received: by 2002:a05:600c:1f0c:: with SMTP id
 bd12mr5513469wmb.56.1637318294484; 
 Fri, 19 Nov 2021 02:38:14 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id g18sm14709725wmq.4.2021.11.19.02.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 02:38:14 -0800 (PST)
Message-ID: <e840f54f-ead6-838b-4433-39cfd309d930@gmail.com>
Date: Fri, 19 Nov 2021 11:38:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RESEND v2] arm64: dts: mt8183: support coresight-cpu-debug for
 mt8183
Content-Language: en-US
To: Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com
References: <20211102090230.25013-1-seiya.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211102090230.25013-1-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_023816_881349_F8B5A99C 
X-CRM114-Status: GOOD (  13.54  )
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



On 02/11/2021 10:02, Seiya Wang wrote:
> Add coresight-cpu-debug nodes to mt8183 for dumping
> EDPRSR, EDPCSR, EDCIDSR, EDVIDSR
> while kernel panic happens
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>

Applied to v5.16-next/dts64

Thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 64 ++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 409cf827970c..2d36575e7dbe 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -367,6 +367,70 @@
>   			reg = <0 0x0c530a80 0 0x50>;
>   		};
>   
> +		cpu_debug0: cpu-debug@d410000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x0 0xd410000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu0>;
> +		};
> +
> +		cpu_debug1: cpu-debug@d510000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x0 0xd510000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu1>;
> +		};
> +
> +		cpu_debug2: cpu-debug@d610000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x0 0xd610000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu2>;
> +		};
> +
> +		cpu_debug3: cpu-debug@d710000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x0 0xd710000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu3>;
> +		};
> +
> +		cpu_debug4: cpu-debug@d810000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x0 0xd810000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu4>;
> +		};
> +
> +		cpu_debug5: cpu-debug@d910000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x0 0xd910000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu5>;
> +		};
> +
> +		cpu_debug6: cpu-debug@da10000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x0 0xda10000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu6>;
> +		};
> +
> +		cpu_debug7: cpu-debug@db10000 {
> +			compatible = "arm,coresight-cpu-debug", "arm,primecell";
> +			reg = <0x0 0xdb10000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu7>;
> +		};
> +
>   		topckgen: syscon@10000000 {
>   			compatible = "mediatek,mt8183-topckgen", "syscon";
>   			reg = <0 0x10000000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
