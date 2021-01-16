Return-Path: <SRS0=K1YL=GT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A25DC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:44:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C001A23A01
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C001A23A01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D2KNrEbg0Rx4MrNIKigJVWdUTlRHClohrjKHqbK5O+s=; b=q0DVC+esGJ71j0Tb3x05dchDm
	P+QOj6wpQMiVa8dMNUCrpOGftUjSUGWbQ3W+vd3wAoN4YauNrmIjjrT8kpJwAFFSgXvNjJnP5CvXG
	qMkMCwzcD69P5APG2Hv29mjtMQ+qFVe9PDj8iDpZUdqQFBcbwfbg7oZa/ZhFsTTMSIVhB1JsiysJg
	nE6E89GwIeF6BNsjMiJOL499Ux7fspCq25fO6mmE/8s8PhuPLXwHF07W9xf/9LyTq0R5n2gTuIWlR
	EGyvDiDuHoGpjYa4Uz1LurcmrzZoMhKonzFsUTkZ0eorjTBZ+glePBTHJcMmQnGozSWSQBSYvOoDI
	FylUUhXJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0i7h-0004KX-DG; Sat, 16 Jan 2021 09:43:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0i7e-0004Jy-Sr; Sat, 16 Jan 2021 09:43:55 +0000
Received: by mail-lf1-x12e.google.com with SMTP id o10so16816565lfl.13;
 Sat, 16 Jan 2021 01:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tH1FfnEn8JXTNa4hydnSMQatFGPe506ZHFNVWjurTFI=;
 b=n61YhPHsdYSoCtMD+DHDWHjOy/cP7S+HNnm/vVGgjvoSfHtfR5Mg9xHODAHtMyD/L6
 wsNOYb4W++J8YKDpJfI1sNkLJa2NvuGEgwubg/KoW59EHKNNVsvIqHXX8dDW5FwIjTwy
 2WuH3Wi2kiM2T6QqyCd8QetHQp4IFPogNnfEx6xA4Wl4eOyCmd9KsClOBALv3woAjD3r
 a1JpSVit/FtPAPYPrkHr4PweaigrQTFzeXze1wUfFt0b+dUYNtp6ZUFev9qb9VrIxuAL
 HDFreWJcORyLWT1toQenBk7S8pE5aOTXHonu38WsZKnFfaigUZH27wvf1sHj3gRzpVtX
 g8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tH1FfnEn8JXTNa4hydnSMQatFGPe506ZHFNVWjurTFI=;
 b=bSSBkMSj9hXQ4PmCmkeph7/R7D/VbbOSqgBLA7GL43nI1kaGHG+/zMjjtp6nu0C8mK
 RwaAaWfuzOG7oBqlWf+jdrS3GaFb2Yp88MYagsIQuC31HVhNTbrUS28lmVn8bwZxsTl+
 DsDSQ0V3U3miaXMTYXAj276foJuRoJn0j7ywbjhNSYKrMRceVSPHgepzvNGnReAo2dFL
 mJzQJZsjAPi986P2BsKOf9Hk8ZJuLCYi3+OtRdUriyD44vqk/j9wbdsSLjGbisVxsoJ1
 nqTGys/r1nBNmpeJAM65+KLHLzvTylgsqWJ0mMRypZGUwND1X2rjht5SygVIb2FgtujT
 Nt/w==
X-Gm-Message-State: AOAM5313880hB49DQk8TMaS9ivDH5Tad+4bI/ZM0D6KAp9VnWmvnUEaW
 JtxwVV55VyUOCNQPlCHpTNo=
X-Google-Smtp-Source: ABdhPJxkrY0FRHa3eEYLnBkBzPh2RfODh8hCDtchdj62H5fYZ9LULwnc7eSwbmYwjIw8MZyYYndp1w==
X-Received: by 2002:a19:7d2:: with SMTP id 201mr6935698lfh.518.1610790231095; 
 Sat, 16 Jan 2021 01:43:51 -0800 (PST)
Received: from [192.168.1.100] ([178.176.75.157])
 by smtp.gmail.com with ESMTPSA id t26sm1048194ljo.16.2021.01.16.01.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 01:43:50 -0800 (PST)
Subject: Re: [PATCH next 12/15] arm64: dts: mediatek: mt8183: fix dtbs_check
 warning
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-12-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <8973d175-441d-0b03-6763-6eeed8595b17@gmail.com>
Date: Sat, 16 Jan 2021 12:43:49 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210116090656.11752-12-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_044354_994841_79A0131C 
X-CRM114-Status: GOOD (  14.18  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16.01.2021 12:06, Chunfeng Yun wrote:

> Harmonize node names, compatibles and properties.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7..a69a033a68ac 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
[...]
> @@ -908,11 +908,11 @@
>   			status = "disabled";
>   		};
>   
> -		mipi_tx0: mipi-dphy@11e50000 {
> +		mipi_tx0: dsi-phy@11e50000 {

    Again, why not just "phy@..."?

[...]
> @@ -931,11 +931,10 @@
>   			};
>   		};
>   
> -		u3phy: usb-phy@11f40000 {
> +		u3phy: t-phy@11f40000 {

    Here as well...

[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
