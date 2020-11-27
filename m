Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D453C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 11:23:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9EAB21534
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 11:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rt5KnnMU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtMIQeon"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9EAB21534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T1FJ32LacNZCn0zgYE4lS7vOfQAClyFZ2dd+kvZaImA=; b=rt5KnnMUc19HngY675wEuAb2U
	DYlBsu4Sw1ULC1EbOlBI6ltw3OEB/j2o2HjbSWWCDLLHnWrFNi0FdLhjT8A55flCQ9txbd1cfcRjb
	1tIHEP89XWkP1biyQMRjJUGBueVsLhFGjHN/dFAkNaR9WY8EqyIVueLI0uLRSixWmvzvShbsl5S8x
	Rneizf6yOEVCbgkeRhVlzLCst7QtDg/d9i8IKORBbPsRHzkQtmZ7U2I3bvg7tXOfQJhkPnY2kSsHZ
	3oliQuGCGDvAHxoek/aO9SNAxGflVqZcuftzYJRvw7DrCjtb44yF6zGbuEaH6SQv67YCBMBpZ16m4
	KEwGmtzQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kibqn-0007rS-Gt; Fri, 27 Nov 2020 11:23:41 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kibqk-0007px-7b; Fri, 27 Nov 2020 11:23:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id r3so5228532wrt.2;
 Fri, 27 Nov 2020 03:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LhhiEW4KSlNFZUbpyyVfomsLPj+WD51ZBQLOEOaXXA4=;
 b=VtMIQeonz59RDuOkHzr0iTf6DwQwS647PwRLUPfmoqqVOmnzv6KGmYvJ17YWGeOIq3
 Nqu2yCrgPZw9CEYtmxwL6wY8BKOUmEr3ZF2jr8l7SZrkpgMVll+OpErOCwsGVoWJhsr3
 rZQDX9Nz3dlAE2kc3o57fDUVfeacBzA/mWByrHSnx6KVZ+YFhEnDKanZ9sMawAjSc2U/
 xxYAJvSLxg+yZMkFmStdOS66jcl+whTAwofjIvBZtQJTbO8HvqKXUC3Lif2Cxg5YTaWc
 pnLv8GRqnAAj8YtqRiWoagqRTpTM5n7nPuitC0RhvUPK8CkRyOM5o1wvY967JJBSue5c
 rlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LhhiEW4KSlNFZUbpyyVfomsLPj+WD51ZBQLOEOaXXA4=;
 b=tyMwzlPvU4dwzrBScaQDiaNYPGKJmcLgVyIL/i9WxQ6AfpsVuJnYOC07vG2sAxEa+v
 XntGX20J5ZbEKw0O4vvVJCBmo5qTq+0XGzDxIKdPORxjM4hPkBxeNoZxbGWu9JfuGWZG
 95g7Xy7yjOPrdHLNihN1NC08usgAPuazSHsqwQhiUaPjq9yVrvjVDg3wTyE0KGfIFHuL
 3K6BAtb2qilN5TeK4XlXsH8tmiaRSLyPLLATxwlentTlCaL9+EdMMfU5F1KOiqRbWtHp
 2bVnnWlLyAMrixehM6g3RvHYKgQo7hnE4vefLWsjtwhaVgHWnQduLEgznBt/7xU64X9v
 H+Cg==
X-Gm-Message-State: AOAM533QCzOQFWjDrgJ3R3gEioRDquDVdC7TjwfUsQXenOG+vj54oM6R
 Hslljz5ha06x8PbijUguvtj6MJBwKgKsSQ==
X-Google-Smtp-Source: ABdhPJxY/2/QR/4yr5F1mQgU87OQIFws27IhKyl9W840Q9+BZaUu+NSpgPsf2FlkbuSiMwOT17tYFw==
X-Received: by 2002:a5d:49ce:: with SMTP id t14mr9851504wrs.75.1606476215624; 
 Fri, 27 Nov 2020 03:23:35 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id v6sm15302413wrb.53.2020.11.27.03.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 03:23:34 -0800 (PST)
Subject: Re: [PATCH 0/3] arm64: dts: mediatek: Add dsi and display support for
 MT8183 based boards
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20201127104930.1981497-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <96ae2394-ed66-f233-e858-00890813793c@gmail.com>
Date: Fri, 27 Nov 2020 12:23:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127104930.1981497-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_062338_307886_D249C370 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: devicetree@vger.kernel.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 27/11/2020 11:49, Enric Balletbo i Serra wrote:
> Dear all,
> 
> The following patches add the required nodes to enable dsi and display
> support for MT8183 based boards. The patches were tested on a Lenovo
> Ideapad Duet with an out-of-tree patch that enables the display for that
> board.

Applied to v5.10-next/dts64

Thanks!

> 
> The patches depends on [1].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=374013
> 
> Enric Balletbo i Serra (2):
>    arm64: dts: mt8183: Add iommu and larb nodes
>    arm64: dts: mt8183: Add display nodes for MT8183
> 
> Jitao Shi (1):
>    arm64: dts: mt8183: Add dsi node
> 
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 224 +++++++++++++++++++++++
>   1 file changed, 224 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
