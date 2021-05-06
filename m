Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CD6C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 08:50:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABC48610FB
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 08:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABC48610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rMgh3wmFwwNaiNLrSRVbRbYusQhVgDzUCZI5iZ36FW0=; b=rSZ0piiARYVlrPNfeiML7N0Az
	3+igIPhV7q55G9XcAm+5147VcfryIXa7udTPiUC0GNcUGWM5v/1U3Gon4cz6EF5xRZ5794ftSSoBL
	0eynrVRLYiftDm2wJNLStke2QJk9LFt/X6XsE5o4EJz4bxKq7UDAG6VWlaA3CGkfDIxRDwPi2D2D9
	8J6XkSxMrOv4EGgJfkuzfWDMEUl9zJfQMle5cie8FqdY9orljaCSPUFZH6ZdaW7t6eF8ja69OOBR5
	ypoKBmFaMZRfO43duEW/AbtBoizdnjfaDEeoCXUbesNtJsniS8dkINWpSqBZAtbpeAS1ymFyrn4jo
	KySNbu6LQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leZiD-003ial-F0; Thu, 06 May 2021 08:50:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leZiA-003iaS-Jz; Thu, 06 May 2021 08:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=GQzYD8IMdKxKUQHT8Y9HzqUwvH2gLhXKjYg9fagd5/c=; b=R9Ka17kZuRKa8ED6xD0JNeFUQn
 qa0JSgtJHfEfW4ETV7l5HvESCMpKVu69R13ZfFEaWKWhIIgcDwa6WLRSXPkqHCe9v78azD5BzGQlX
 yDEGD7+PchRebav9HR2zOp0ZBwIeBqFDsce7vwiI8s/RfZLdOpi+OqdHUjjc4DfRX5eUsl9zK3ahx
 vYCx1InjFKRPfzgNJYuXOB0wUSgqRet6G3B0C2f2Ahh0Gju8u55X8Gbf8J1Ls2MosQ0wnO7BwvDC4
 yVUXPl755W85VaUoI08AWYm7LiURg6l1cyfvelycsBCfEW4qYzPOIMmIsyElEv9cl7tX82UP6gEHl
 TDqLiXhg==;
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leZi8-005smv-5N; Thu, 06 May 2021 08:50:21 +0000
Received: by mail-lf1-x12e.google.com with SMTP id z13so6718390lft.1;
 Thu, 06 May 2021 01:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GQzYD8IMdKxKUQHT8Y9HzqUwvH2gLhXKjYg9fagd5/c=;
 b=uGtvohP514NsY1pQwvQlV2/nAq2R+d+/fvuUXsrW7wmw10qx+2P32KmM+k1Kz5V5bT
 nf8rlm56/VF7YPEQgcil36ARt7xSX2hDgo2CkMuH6AhoSM/cYpMfJ0E8RrP01k9gw2JB
 SzRqcZ9LDZJB88GUWTThaz+/PO3fyKHhPzFOhV6CtjT3uWWn+9WTxMnidJ3LICa8YMqn
 ySfiIewxkAmsMuPQ59kyt9H2lHv3q9+BDb2YXHmrh7xIzIDd40xtdHxZ8h2dX9u/YRXt
 1/8IeB8r9JAWWqDTagZCfIj3fi1/LZQNnCusMKLVkeM1FRF70xVv5oKa403Nyci5qTbJ
 MZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GQzYD8IMdKxKUQHT8Y9HzqUwvH2gLhXKjYg9fagd5/c=;
 b=MC01C/+7uEJxXphPDpCuUiOB2QPcAVmqvlWObWK1daVvZAAt77zxJjTi553PvBFjP9
 nQYXZP73fO/+0aOyNVInhdsgC6Yzv6M0pOWGy/+pPfAnVMKi8AMWNhS7ITNPpXhw844R
 jW9dxlMIGLlBdmj25WYFhVViK3Cqs1MMsRsESGDLxxWdYxeIG9gPvUg6wroj61pyRVYy
 pTAyNglwoYpGdeW/btl3fy/cyzGsJAs4+Mp/1HrnWQnMEqUpxf909Bii2+xml7W6Gp0O
 J+wV+NNadgc0rkhgphL8a32jnVHlXrkdBsD3CGaQUVsqMtzBVflfWWxtn1+3+yPuHL7H
 f3SA==
X-Gm-Message-State: AOAM532epBaNU5uHimOp1ZYPyHj+gmEnWobcYC0GcKLyQGC0OBQbVTL4
 TcyKELflPMwBn3cT/M6PR6E=
X-Google-Smtp-Source: ABdhPJx72N5YWuM1xVu+aCni/65ECaH9pXVrqgltse4psZObd0GtgeyfvhXQxrB1Mukmwop4ZfuwKA==
X-Received: by 2002:a05:6512:3d8f:: with SMTP id
 k15mr2234631lfv.227.1620291017411; 
 Thu, 06 May 2021 01:50:17 -0700 (PDT)
Received: from [192.168.1.100] ([31.173.80.19])
 by smtp.gmail.com with ESMTPSA id n16sm505586lfe.245.2021.05.06.01.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 01:50:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] usb: xhci-mtk: use bitfield instead of bool
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ikjoon Jang <ikjn@chromium.org>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <a3d1a695-3138-f322-3b4f-5d00e9c85a50@gmail.com>
Date: Thu, 6 May 2021 11:50:10 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_015020_233270_0FD99214 
X-CRM114-Status: GOOD (  10.55  )
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

Hello!

On 06.05.2021 9:31, Chunfeng Yun wrote:

> Use bitfield instead of bool in struct
> 
> Refer to coding-style.rst 17) Using bool:
> "If a structure has many true/false values, consider consolidating
> them into a bitfield with 1 bit members, or using an appropriate
> fixed width type, such as u8."
> 
> Due to @has_ippc's default vaule is 0, no need set it again if fail

    Value. :-)

> to get ippc base address
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
