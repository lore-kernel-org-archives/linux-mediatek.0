Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0725DC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 10:27:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A91BD64E24
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 10:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A91BD64E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AHJkSdoDdx9Txg7Weu6VI5jOgoOMSBlZnpkJegXurUM=; b=3gbwoAnrs821A1AfV97v7llNW
	SD5WP6zdE754C+yr2nTf/qqKtXLNYMBmzjudLICS726l7WAR3JqlhnPPaLaqImsU3SBfCzPl2kCYl
	PXw7noXWFdPvw7Fngg4TN0KzIXZJ8fqnnJ4GtO9MxtwG/76STRwoOuM/4cMyk1IIMslnQ9BK3cj9A
	VFrYwQRnRK8Jgw+ppyCC3YK9oAjXQjSYKIpo9K/kwUci5/KrCDmazv4CXw3rEXiv3rj0KdpMmKxGA
	OCxgkFKD18kNhEXdDAkPxW77/F7GmQegIKJSTucQp+9gVilTzRLi1dIXy+GK4sXkhQRugu2HJXSdA
	bY+YYMWSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l69wW-0003dF-La; Sun, 31 Jan 2021 10:26:56 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l69wS-0003cU-Pq; Sun, 31 Jan 2021 10:26:55 +0000
Received: by mail-wr1-x42c.google.com with SMTP id c4so10669218wru.9;
 Sun, 31 Jan 2021 02:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NaDh0905GAPbuSjX0aob8gywlf+7SCUQGWq6wwIujR0=;
 b=M0pPLORKbh/3wLjb6w21AQTRqovtiZxuylFL5U+2MRUFO10hieXqDPzX/U+2w7b9Ng
 F17dZYh+SqP7A6uPqPCyeiVQmad5EpZrbyC6IFJy7GK7FvdLB/bbBXI6P6B0fDLlyE/D
 r2tk5+1M/9mWVDKc5u9L44dUmI+6AyrA4KkcPbhK/8UDvVIfvX6FMlmMypDpaKmrDJdV
 K+fsfldiVrs+VuqkgaD8Q7GOD6eTBzGnqTXxNpbdYAwhRagfoGMeamdw+r1wkZUNl2gX
 6nUQcJksuaA/FkTLhmuqDp6BO1HcW0Bxo3qvHpQOjK+ulWhDiYFY0JJyUfzYgSyWkAHo
 i9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NaDh0905GAPbuSjX0aob8gywlf+7SCUQGWq6wwIujR0=;
 b=Lo2Vd7+ya92cIfUospE0rEm5GmvVW0XbkUxeKYVUEtFITHewMDYH8aLqaiDNOL3VLU
 QYTtVbWv0kqw/W0NF+vhxGbSQv5jLQPvp9sTFs+H5JIQXi+p7n3npWA3pHDwmAlJ2/Rj
 VQn0c181c1AoxHPtfhJe9AeF80ZJ2whqNJMtswy8/Xx+BXJ34iF30dMjfPqsaAqR3gQH
 zojIiwSp+Wlk98qJrf4ShMl81AqS0Xs88v86BTdwMll0MrGlF86taZWb8VhtnF11jmX3
 B1TjFtfhDWdfzM5yraQLxBI7l0TCaUgy5+dEPUqNj1Y81ih1+CBc1fMt8ugoR/vFxn3W
 rb9w==
X-Gm-Message-State: AOAM531zZXTZ5wR8w/n6WCIaKl3NqKAIN0TYi/Vcybq7FA2nnE/YUgpE
 GC2rIJegpCNtk6r+aBiN/qMIicvwiCSGyQ==
X-Google-Smtp-Source: ABdhPJwPqCv/KSnVrMQa+fEvnvj2OwSAiy/q0hJWsVjIgka/Vrdny4An1cuW6cGOuxIyRn5wVf0VVg==
X-Received: by 2002:a5d:68cc:: with SMTP id p12mr12628137wrw.276.1612088811026; 
 Sun, 31 Jan 2021 02:26:51 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id s4sm17642913wme.38.2021.01.31.02.26.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 02:26:50 -0800 (PST)
Subject: Re: [PATCH v1] arm64: dts: mt8192: add nor_flash device node
To: Bayi Cheng <bayi.cheng@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>
References: <1607589283-31225-1-git-send-email-bayi.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <174ae215-38a1-0bb4-ad72-a3f59d35f2ad@gmail.com>
Date: Sun, 31 Jan 2021 11:26:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1607589283-31225-1-git-send-email-bayi.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_052652_974002_B268E236 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/12/2020 09:34, Bayi Cheng wrote:
> From: bayi cheng <bayi.cheng@mediatek.com>
> 
> add nor_flash device node
> 
> Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Applied to v5.11-next/dts64

Thanks

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index e12e024..b15b0d3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -379,6 +379,19 @@
>  			status = "disabled";
>  		};
>  
> +		nor_flash: spi@11234000 {
> +			compatible = "mediatek,mt8173-nor";
> +			reg = <0 0x11234000 0 0xe0>;
> +			interrupts = <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>,
> +				 <&clk26m>,
> +				 <&clk26m>;
> +			clock-names = "spi", "sf", "axi";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disable";
> +		};
> +
>  		i2c3: i2c3@11cb0000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11cb0000 0 0x1000>,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
