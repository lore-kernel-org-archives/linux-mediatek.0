Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829A2C48BDF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 14:22:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 552C0611ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 14:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 552C0611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Me+O6hKIONhy6xAZXnfP7oaUGPRKJ+CtlLi88jGeSkc=; b=SfYMQ4gj5WOaj4mi815nBcZvR/
	UIUuOrs8rjSia3ntXeop4Wylk+QNKMSzbIFoeDXR9UEY/h08jGrlbr8+Ouqlo64bd6R42QpXG/KMP
	oJSAGAiZ7yV3hDcBRmCw1w51nSh/w3ty9pFHKmD3slaSvt/fYQjfFm2UMb/vxYQN42HSH84fmNM52
	1LlP2+XYwg0soI0/+/GpHvE8LUTydRG9iwLdXQDaBebF2rMcptuXl9kBOCt3f+9N/5MWuziFeLaTG
	t/9Bu9yjfIEJWpyHc/PefbcmD7aJ2rr84vteSF72TJ8fWWXi9JkkJL6nBWlMJw7+08w6xQtYu43hw
	KOCuqWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luFNx-00ESga-PJ; Fri, 18 Jun 2021 14:22:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luFNi-00ESdv-CY; Fri, 18 Jun 2021 14:22:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l9so5787416wms.1;
 Fri, 18 Jun 2021 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/biPioDVeS+IYbxYtzg7Tz6IEPtjr5QXhP/AdQlfO84=;
 b=P4/4h2b8qp4XU9blbA89ELz8vd5WafBNDUFlcZ1rj6cknCBtbZrc20qCrXCo/NAQ+0
 IzaZPkavTJrdzjocPjtmceGDDcolEMj/M7faIc99CL3xJ2dRr4YYi6ogQ2e+YlQw54oQ
 413krdch49fpbem9cgIxN7ox0jAl2jZnuQmVBGp5AoW2CX3wrGSkCg8iola01SIFn/ch
 D5swQzJBZx72+6P4nMYOUmQmVWCTlrFylwfmtWCKGiK3Do/WTPNIIlGHmXOiy0fNKp4R
 9ECjXAHpoNYBRlYjnvans2huDbtNpNkcEC4/VIdWqzKzDeOIDWjiqrgACJhaO98P5riJ
 TLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/biPioDVeS+IYbxYtzg7Tz6IEPtjr5QXhP/AdQlfO84=;
 b=TiYLjNt5LqgWaz4LyetvCEFS24y7Ns8aLDUoIkw6DV8kBBCzeW+Pgkz/g+r/X+NGoi
 ofK/SQd/TkcAUkiW5EwGDJ15GCD7x4/12SKPl4qx2f+ISP4JZPE1xo6BmMDgcBgxmt6I
 6pLOQAfzWE/5JU0WNkfqPwPYxQwfU6//he9bywEhu0xSAH1mZMtS7PaZV4q/rJEVAGZ3
 oVk2Wg+rqY72VG5AfGY5p/LHMBxqUKBtCDFnsmegUg3U/oKkXZgv+QYJXXocc+Ck352h
 PAbzhEpAJoshiDiuvpWfKIlVLUuw0zc0JB3cFLfxdhI4dFyxtVUaUVLjhsnfuiVutrsj
 g58g==
X-Gm-Message-State: AOAM531D0wOCX/g21UFZYI+3X34IEkZraLFWnBbcXCtcWG26u6qPavKl
 epxJDQufasE5z5iu6kUE6NI=
X-Google-Smtp-Source: ABdhPJyKstre3DomrgnI/Zr73Kb9mawHY+FIwq0XyXEcaToktorCgbIDII2H5TgRhE1qLHB74af1bw==
X-Received: by 2002:a1c:5413:: with SMTP id i19mr12213783wmb.12.1624026120589; 
 Fri, 18 Jun 2021 07:22:00 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id x18sm8583826wrw.19.2021.06.18.07.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 07:22:00 -0700 (PDT)
Subject: Re: arm64: dts: mt8195: Add Mediatek SoC MT8195 device nodes
To: Tinghan Shen <tinghan.shen@mediatek.com>, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com, wenst@google.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b1ee64c4-eeb6-a664-ebcd-4a0cc62e2ded@gmail.com>
Date: Fri, 18 Jun 2021 16:21:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_072202_523359_D6A448E2 
X-CRM114-Status: GOOD (  15.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tnghan,

It looks like as if you send a whole bunch of device tree files which don't have
any binding description yet.

Can you please filter and only send these patches that actually have a binding
entry? That would make my life much easier.

Apart from that it would be good if you could ask internally to get some advice
how to improve Signed-off-by tags (I spotted at least one patch where yours was
missing) or how to improve commit messages.

Thanks!
Matthias

On 15/06/2021 19:32, Tinghan Shen wrote:
> This series is a collection of device nodes for Mediatek SoC MT8195 and
> depends on patches[1][2][3].
> 
> The dependency list is not complete.
> some dependencies are still under working.
> 
> [1] arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and Makefile
>     https://patchwork.kernel.org/project/linux-mediatek/patch/20210601075350.31515-2-seiya.wang@mediatek.com/
> 
> [2] dt-bindings: power: Add MT8195 power domains
>     https://patchwork.kernel.org/project/linux-mediatek/patch/20210610023614.5375-3-chun-jie.chen@mediatek.com/
> 
> [3] dt-bindings: pinctrl: mt8195: add pinctrl file and binding document
>     https://patchwork.kernel.org/project/linux-mediatek/patch/20210413055702.27535-2-zhiyong.tao@mediatek.com/
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
