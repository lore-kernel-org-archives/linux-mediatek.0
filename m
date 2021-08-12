Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1E9C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 16:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0CF06104F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 16:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0CF06104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ulO2cuO8p4xvFr9fkmo6IBGKKthDoujZU508p/zgiz0=; b=CjY4O3R5r713Gcx8bW2mxR7/qU
	u3rbQE3loI4PspIWKC+SbHMsz7OpybmjFgKDJ/KKYSN/+PDcm3Jw/+Q1HOCYH1kN6nUnG7RSaqwlj
	562bI5cmi9T2See7j5mjmgdORJDLgBNNHS7cKv80RnzvI8yxIgPsyzBY9M70f4H40U2JdtQtKyK8Z
	oFJBEJkx9+2IdVsuhvsSR5HkjXYQwhgF87/fZnZd/4iLhxVaSDfki8/1b2WaIIqzeNjuferrE14Gj
	zzn4ptPhJGEPm0q59JkSi7EZ/sPSZ6SCnLvzyvQixUUi5Ab4KbQPYjy1u8adiguy32ypYZ6JUOYVJ
	hD/qRXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEDMT-00AdJf-6W; Thu, 12 Aug 2021 16:15:17 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEDMR-00AdJ3-2E; Thu, 12 Aug 2021 16:15:16 +0000
Received: by mail-lj1-x22c.google.com with SMTP id h2so11348472lji.6;
 Thu, 12 Aug 2021 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q1kP8IDfWs3KYwhhLGYrvublLDH8i7aJatyFRJI0aDQ=;
 b=O2nG2V6paudkRTLvKKBvSW4Vzfdiqn7OBX0xqWqsk4KJFuZFlfV7qIIY0RnpjQspV6
 JZxD+D1sXcF6B9cBMHcrG+rtbo1eaHJg5+u6FtbJAAMt1+EHhPEAfIrGS2baPavi2ULQ
 gJFy+ugYFJ2KAZWQsUZk5Vrp3wH22DbiT0nIOETuFQQ7n5MZbVzwWTeqxx5RU+nBVD0m
 6T3kMvrUIrGLrwvjCgwAY7o6OwaTJ/XgC960HZiZEU3RhGJmh3kN2/+9zYhSYhCncceh
 o0ThDntonzjPShFU3ywxcfVh01s8IN4VKcGxR/T/ouSZRB6o5VEoNG1XqXjaklAZ0F1D
 Tx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q1kP8IDfWs3KYwhhLGYrvublLDH8i7aJatyFRJI0aDQ=;
 b=qotbZhzHtHhxSdArYqBmnO+yYIirG2mVwV1Qem/+khdPiOYQnktvOYNIInFV0D5dg8
 CYCKcdNSs6eGbaqzmYdFq7mx7fccY6l8wahyXV5XxM548ETE1VI+QbblY8KCxnwaH3uQ
 TwproM3Pcq4Sa9JKLkABBseFcVmD9YTOJMlEy4QOI70Ygs/ZlenIeQ/3hYdVnIHDCNYa
 UUoEIU9Pyum1w3mhfegAZ3v76J6Ta95mgqzKM0Z4OwiqSATsaacgnwxv/CrY3XuFaqsO
 geCu+3Yt3c8scSRSBB5fltRvVQkusuuau9YC+WLWcISGCl2uM5jiWz37t0MPa4PvtR5v
 6n3Q==
X-Gm-Message-State: AOAM530YSHLY16ernuzkaQZHVnZFc/m4rW/VttBK3kPNZ0SZFHBLw/wo
 J1yrvmQzOarx1qG0DyyifpA=
X-Google-Smtp-Source: ABdhPJw8Y+4oboFgVDcsxDZ5DafHZB6Fmy0rHyftgqwU1KidVKdYV7L6Oq0+j6F4JOqgaGTP6nwKjw==
X-Received: by 2002:a2e:a70f:: with SMTP id s15mr3366180lje.343.1628784904468; 
 Thu, 12 Aug 2021 09:15:04 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.76.126])
 by smtp.gmail.com with ESMTPSA id d17sm346650lji.102.2021.08.12.09.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 09:15:04 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] usb: gadget: bdc: remove unnecessary AND operation
 when get ep maxp
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>, Al Cooper <alcooperx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Eddie Hung <eddie.hung@mediatek.com>
References: <1628774283-475-1-git-send-email-chunfeng.yun@mediatek.com>
 <1628774283-475-6-git-send-email-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <4e751ea2-7e42-3378-397f-7bf913752da2@gmail.com>
Date: Thu, 12 Aug 2021 19:15:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1628774283-475-6-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_091515_179359_3C0114FD 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

On 8/12/21 4:18 PM, Chunfeng Yun wrote:

> usb_endpoint_maxp() already returns actual max packet size, no need

  "No ndeed to", perhaps?

> AND 0x7ff.
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
