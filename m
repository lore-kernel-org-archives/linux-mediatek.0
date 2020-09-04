Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBEEC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:50:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F3C2073B
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:50:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MKZ/lVNc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLj2zny+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F3C2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BWLEvVKVwW5HAavGR0bVdH/Z0NrBYDHsAx7stcJO+S4=; b=MKZ/lVNcUNtVH87/WSvEsKjBh
	WCmBLNDkxDeMV7W35UR3TVwkIdzZucnmGgYlHYHq90JsPjklGWLGvlgg321LdwyWisuR+LoQ0vmzg
	Zn5mppN08yogHyWLMUnjgTXal7RImRikNK7lwkEKPHyNsqanJRE7WZ6WF5GlNUfeaLhFiowoUGWAO
	eYxHSNbkmlfEIpSLfIejEuYROZMGbVspg7+R0TL5o+dN3zfnLdIfLa9bbocJEvOJlzVDqpXTZF/BV
	rDXt3QOw7PdXrk89+3YzNVelKQpjp00MCq2VZRogQFwzA7DHXzVletDGqvL8KA5IVb53DB0zfGD0X
	gtAqvn27A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2jn-0003bU-CM; Fri, 04 Sep 2020 03:50:07 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2jl-0003a6-8I; Fri, 04 Sep 2020 03:50:05 +0000
Received: by mail-pl1-x644.google.com with SMTP id x18so523187pll.6;
 Thu, 03 Sep 2020 20:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jyE5p+Uqsr/GNKcB4LBi0aiywESJTlFxnQEw8rSJKYs=;
 b=qLj2zny+rGviwUam1TIs1T8gP7D3vegYaED5OJKQVavIKrOjZAX+yTgmJc5PH6u/V6
 Tu6noP4FAl7SyJL6lCNbkTahEUwwIzs+1rfSblUTZfert6/GBmLiHfgEzRlovSp/74vk
 GJ8qHFnjYY7K9ShizgVs9Qozs2mPkZ7GEig1YA4ElqmB6fNFhVlMtEsi+dEICv3LADBh
 rE8DefFWIQ8aEQEzonHAl5IcmrZTlnm0llvLEpJC3iuApClCSV9ZCTFVX0vH/bVXPLUm
 /aoi+GK/epxqugIeedb7bKgvhgAf3sCbcfbviPf1XCto6wvOiLrukRCul4PPArxG8Htf
 zJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jyE5p+Uqsr/GNKcB4LBi0aiywESJTlFxnQEw8rSJKYs=;
 b=pJ09RJdKmhZxvdtf04lhsc3P5SJ1NRfJug/45jjmAoYcSz4YhhxPHZXFzaEiOkzJl+
 fLp9DP2L3H0lGvDcb84GqRhm7Y5jJweo7WbWqfwlbdnymIGl8ERyLgoJERQkc+fCRrwP
 0Msby7GDajc1LTyp/q6ybU8Msifpl+ogpt+Ff3bPyX2gq2nZ6syyJlhtSG+2FssKwTl9
 hejNeJdx0T1C6lcW2noDqbH1pLUXE+pxHbN22GMfK/c5yJuG7pDf5/lToeXEmnSNM3A2
 nH067odfu6ihH8DOYrpt/ek2K3fFzmZfq0Kb34fNEdYMiIbFxCD28IS8SbJSJvxBLnOM
 vlBg==
X-Gm-Message-State: AOAM532FCITWObya/UzfHB464789UFYPaRB51g01nuPZQZ0mqliEO7+K
 pb2LcY86DEgDeuD9nD+bWuoXl1psAdk=
X-Google-Smtp-Source: ABdhPJwHeIqKdWPmMEr1F4vHgjldqftNT5wDioCnMzggiZeFz84xh2dMQ7CNaQLEpqj40Nr/SelQ/g==
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr5900627pju.149.1599191402499; 
 Thu, 03 Sep 2020 20:50:02 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 i14sm3769331pjy.24.2020.09.03.20.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:50:01 -0700 (PDT)
Subject: Re: [PATCH v2 04/11] usb: gadget: bdc: fix warning of embedded
 function name
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597923046-12535-4-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4c77d18f-96d4-d7d1-84d9-73657ca912a8@gmail.com>
Date: Thu, 3 Sep 2020 20:49:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-4-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_235005_341232_FEF06198 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: Peter Chen <peter.chen@nxp.com>, Sasi Kumar <sasi.kumar@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 8/20/2020 4:30 AM, Chunfeng Yun wrote:
> Use '"%s...", __func__' to replace embedded function name
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
