Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F78C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 18:31:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E3961107
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 18:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1E3961107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rUzenwA4N4eS3esSxkZwHnc6RCzluG5e2439+qmoT4=; b=lhiIu+/xsDYX64
	yCpWMtT2rA8LJTO/vxgHd8TAIatgOpbSb2mxwYInS89OJLuf3bIzWxOymS7xi8Ya0T/UWcZoRiuQS
	F/cwL6ii8s0PrXcR2sgnTUefVl/CyWM8R4nCr1/ReLu5saiE25eUnXo0Iq3h9CseKk7ONvTX0d2oF
	amauP7rIZ7I8k51+hl5ACJOgedrNucupYsKoOgcBApXXszYVaJXBS7LFzy2LJsmys0lT6M6h91MsA
	/Xu15nWKG80j2REPSghpGsEB7DzGSxV0qmuxfyjvFoz2dhMCDRUSsO6F8rGRFFY28/j+SWcH2stDA
	trgwTYXe2Jj8nCov46MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQDCu-006lu8-Lb; Tue, 14 Sep 2021 18:31:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQCoN-006gHC-48; Tue, 14 Sep 2021 18:05:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id i23so21676757wrb.2;
 Tue, 14 Sep 2021 11:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+1y8l2tNjfVvue0GuX0pU4hXK+xpXz6uowb3ztMXPXM=;
 b=lVX78cx2cu9BrWY/tMDofsnuzHJFq2TMG8Ky4M7BNgAAA3x8GrZbgFcOcHnhT0Dlk9
 CZG3gIeBPr9PQrCCJiN3B73jX1l5mXVhjhNtl0lXZctpsX9QN/qf6jb+x+WJ9i2onw5e
 TYsldgo7wemxEHewPYgD+8FsunBzv2rGD2GLOKzk0ZZuLmDwoTtNxr7xnknjW1GDfTub
 3UyWOs+CgPz3EbBfvxJtvvbxHw/0UfNJ+qa/iih66fGd4QbmGRgV52+2S/IqZCuCwoM6
 FZG2mhvPn+qwCxhEkRtLUxJq6B+u2wXUhZbvnRCSTaJZuRhvhsVbqF3qO5xXkKlB4OFu
 C0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+1y8l2tNjfVvue0GuX0pU4hXK+xpXz6uowb3ztMXPXM=;
 b=ctBfTL6v7G6oaDbqeT7OknMdr0W3+KYySDj5Zj1APaJjIR9KoQsKzPpRXOA5p/AeIg
 hlQ2II0jNPTZsmSeSvri1PxiPAe5cMjRWVWwzN6d8Q9eJMptsr2cq2YwlnTmcWozr0L7
 eWsAiAjjZdYHfqN4h82TfzQOPy/mfcAWstXHU4O6Gyvgq8x81KuV2KiX43kOUQdL8LoP
 0jFIxFA6ADY89hKEmEgKUpNZ7sURVcp/VC7384Ji0ZG04UryXS54oGzdot7Mc5aPig4d
 g+LUFKNCIolQ/klD112tWf+v2hYryNoVbyK1HM69Fuxo0I6m/2uNEf088TuU0pFmJZWj
 AAYQ==
X-Gm-Message-State: AOAM531tdhX8fr42PsV33dfb3zxPv98UOUnhaWjdTLEKAhEhEpkK2XsJ
 nl3T+QAW48CN22ap6Zer5kM=
X-Google-Smtp-Source: ABdhPJxqpTLNGYPNjmcbbLjVJoUGnCTDdwnuvBoAur6n27EC8bdWn7zaOL01tPtyuvM42HRh+nwEKQ==
X-Received: by 2002:adf:f911:: with SMTP id b17mr517696wrr.412.1631642735637; 
 Tue, 14 Sep 2021 11:05:35 -0700 (PDT)
Received: from [192.168.0.16] ([37.223.140.66])
 by smtp.gmail.com with ESMTPSA id g1sm1849151wrr.2.2021.09.14.11.05.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 11:05:35 -0700 (PDT)
Message-ID: <84ab5c30-7661-f225-96c3-59ead2391eec@gmail.com>
Date: Tue, 14 Sep 2021 20:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH] arm64: dts: mt8183: support coresight-cpu-debug for mt8183
Content-Language: en-US
To: Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com
References: <20210913092736.19207-1-seiya.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210913092736.19207-1-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_110539_256518_B747444A 
X-CRM114-Status: GOOD (  14.76  )
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



On 13/09/2021 11:27, Seiya Wang wrote:
> Add coresight-cpu-debug nodes to mt8183 for dumping
> EDPRSR, EDPCSR, EDCIDSR, EDVIDSR
> while kernel panic happens
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 64 ++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 409cf827970c..3ad4dd47518a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -367,6 +367,70 @@
>   			reg = <0 0x0c530a80 0 0x50>;
>   		};
>   
> +		cpu_debug0: cpu-debug@d410000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";

Missing a space:  "arm,coresight-cpu-debug", "arm,primecell";

I suppose that's a copy-paste from the binding doc which is wrong. Other then 
that, things look fine.

Regards,
Matthias

> +			reg = <0x0 0xd410000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu0>;
> +		};
> +
> +		cpu_debug1: cpu-debug@d510000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
> +			reg = <0x0 0xd510000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu1>;
> +		};
> +
> +		cpu_debug2: cpu-debug@d610000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
> +			reg = <0x0 0xd610000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu2>;
> +		};
> +
> +		cpu_debug3: cpu-debug@d710000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
> +			reg = <0x0 0xd710000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu3>;
> +		};
> +
> +		cpu_debug4: cpu-debug@d810000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
> +			reg = <0x0 0xd810000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu4>;
> +		};
> +
> +		cpu_debug5: cpu-debug@d910000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
> +			reg = <0x0 0xd910000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu5>;
> +		};
> +
> +		cpu_debug6: cpu-debug@da10000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
> +			reg = <0x0 0xda10000 0x0 0x1000>;
> +			clocks = <&infracfg CLK_INFRA_DEBUGSYS>;
> +			clock-names = "apb_pclk";
> +			cpu = <&cpu6>;
> +		};
> +
> +		cpu_debug7: cpu-debug@db10000 {
> +			compatible = "arm,coresight-cpu-debug","arm,primecell";
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
