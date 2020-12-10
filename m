Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4CCC0018C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 17:33:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F225A23B31
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 17:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F225A23B31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LcorIbOJMdSeepy6Wl3lC+EcqZDS2ggmxUSJZqSfiUo=; b=Fr/vY3QC9XXG5gaKxfaQwAyK8
	+it9+kTgbcQFwug08Wb3VxQhub8X2fQSzqG9fXz0+EKnwt12LMFxfhsi8oXiN24gctdeoHvgYF4Is
	dC6hXw6JCapQYEQToxNEnNYlEqLRQvX3tvJFWK347/mqXRBt60fANCxqkTV2lh8uyo6CPOUv64Q0n
	yktwpv3CGzODhzMtYKR8LYsr5buAIoZR6jYwJkHY1BGJu+yzpAzvcb8nHQrxKkXB5UMqCWGcslmRq
	0XujvOuGhyi7HN1KLAuE9I2USN3HyInB9XPEQY0J5yyHBGI2cxz7w7SbOuMZbdmVZ5sZhfxrWGIDX
	yp0UJ71Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knPou-0001wf-HF; Thu, 10 Dec 2020 17:33:36 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knPot-0001wG-9Z; Thu, 10 Dec 2020 17:33:36 +0000
Received: by mail-lf1-x142.google.com with SMTP id m19so9432708lfb.1;
 Thu, 10 Dec 2020 09:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tv47+Gn9kE/EuHtBfv1iSClR82qDNTS3+tgrsyQwWZI=;
 b=qeHHxg2I3V3mzqIR8CHFHAnKgte4wW0I/vBa1eU3K/yYv8NzcWkYKZL3QTnyoM785c
 pvqVLBr4jsdWzAK6vxa1gcnv46LDBbmgbyHE1J8qGuba1otBI84SM50fLdasWbifIN7p
 zld331qUX+H+7WtvVCPks1j9TH60xfERq1HWBiTgndHWGKtgJrZkMkNHb5Iy7dRUL1o9
 nqx068ePhrhfHk1SzkgrHZuWWWSi/lsAqj2k91Y+iShCUDjg0BIl+E94iovRpi5Ili9L
 K/o6TR4OHdjy46qQGyaCgUEP3rsxCl4foYMvT5g18DGS3f+UbQkQcKlaGW0ydrztB9rz
 WUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tv47+Gn9kE/EuHtBfv1iSClR82qDNTS3+tgrsyQwWZI=;
 b=HE3pgeEu6GPL2Ov0G4C7oQRhGEpJk0GXfAxlornSdGEEYJljcsitaQyWhdimUWIPeL
 4VQtx+uupXgy2ko+7+0fzOJIyQaY945OT6odLHLhzZhYreLzkBhBWxdKD+ce8gutLn9J
 awSnazaI39hwE6AU/+e3wCuP7UxFvjGDnin+MUvAM+viIvQpxn2dvbzRasIBrMXKrSIf
 qNimaihX0RGZamXE/u3UaLQ9U4d3PemV8cJI51AEzaaPB3/PEHsIeAjvGWzCmXL7mdkc
 ANYkye0z/wNOe7GJO2A4wgg2ftxB4s6Gf0Nnb0X4Rw0+B266kiziFnsaAtCV7UmudsMW
 gLgw==
X-Gm-Message-State: AOAM5326l1htqnDaoVXv27hIQ2Q1mqb18bN1Dt/LRtjbX6C6fO2APL8O
 tIybuoo4uvDO2DRYTXf3h/IYv4pJmvw=
X-Google-Smtp-Source: ABdhPJzNKitFcR5xT9xBqWL+MiU/hMZbvU6keJXgcuRfRiEzojskCgnKER7r+yHYf/GlfmuUNKvrGg==
X-Received: by 2002:a19:c5:: with SMTP id 188mr3157333lfa.511.1607621612151;
 Thu, 10 Dec 2020 09:33:32 -0800 (PST)
Received: from [192.168.1.101] ([178.176.78.63])
 by smtp.gmail.com with ESMTPSA id z17sm588552lfg.275.2020.12.10.09.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 09:33:31 -0800 (PST)
Subject: Re: [PATCH v3] usb: musb: remove unused variable 'devctl'
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20201124084955.30270-1-min.guo@mediatek.com>
 <c2f3f643-8514-5c4a-dd52-7abc8a6dc501@gmail.com> <X9I4L3E9EJlcPMEu@kroah.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <e59a754b-ad3e-2f8f-417a-96ddfcd3cbd3@gmail.com>
Date: Thu, 10 Dec 2020 20:33:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <X9I4L3E9EJlcPMEu@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_123335_387686_0C035DB2 
X-CRM114-Status: GOOD (  17.61  )
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 chunfeng.yun@mediatek.com, Alan Stern <stern@rowland.harvard.edu>,
 min.guo@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/10/20 6:01 PM, Greg Kroah-Hartman wrote:

[...]
>>> From: Min Guo <min.guo@mediatek.com>
>>>
>>> Remove unused 'devctl' variable to fix compile warnings:
>>>
>>>      drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
>>>      drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
>>>      but not used [-Wunused-but-set-variable]
>>>
>>> Signed-off-by: Min Guo <min.guo@mediatek.com>
>>> ---
>>> changes in v3
>>> suggested by Greg Kroah-Hartman:
>>> Add a comment.
>>>
>>> changes in v2
>>> suggested by Alan Stern:
>>> Add void before musb_read to indicate that the register MUSB_DEVCTL
>>> was intended to be read and discarded.
>>> ---
>>>   drivers/usb/musb/musbhsdma.c | 8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
>>> index 0aacfc8be5a1..2a345b4ad015 100644
>>> --- a/drivers/usb/musb/musbhsdma.c
>>> +++ b/drivers/usb/musb/musbhsdma.c
>> [...]
>>> @@ -336,7 +334,11 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
>>>   						< musb_channel->len) ?
>>>   					"=> reconfig 0" : "=> complete");
>>> -				devctl = musb_readb(mbase, MUSB_DEVCTL);
>>> +				/*
>>> +				 * Some hardware may need to read the
>>> +				 * MUSB_DEVCTL register once to take effect.
>>> +				 */
>>> +				(void)musb_readb(mbase, MUSB_DEVCTL);
>>
>>    Hm, forcibly reading DevCtl in the DMA driver... sounds quite
>> nonsensically. Lemme take a look...
> 
> What happened to your look?

   I thought I posted it the same day... Indeed, here it is, archived:

https://marc.info/?l=linux-usb&m=160621841910477

> thanks,
> 
> greg k-h

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
