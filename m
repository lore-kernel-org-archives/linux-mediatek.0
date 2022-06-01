Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A4BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 01:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pl8GxN/0vb2rkwSCJZo602E6SP0eVR+11/C8Kf87fmU=; b=UKCM4dDhc41FZS
	hTon3k6qFU+KK/uN6bgg537O/qJpLRdbxGtHpoamcvvsU3IpHdlWihEQWcXcQsZ/muN+ZX5DjiYVp
	LwGRLbkkTRGydKQDVFH/kohH45XcExYoJ18QmXVOEhIG9kMbuqFwFlRFi2SXeoO5kHSRFoqRMmjEx
	3nTzl1SjiDpJpy4nCm0bYrij3UA0uCt97bRHr0LPL+mIKQKJe3awLl/WiOIjxGEFzjjsn1EaudXDJ
	71AAKTJ3zrELF5hXxQLd9m/lI+s9RkotP15Yld1O0Ex3/ZO+U9L1S79h13DblIQiwlT88aa7pe1z2
	mvhepgkciXaunQUlzGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwDQl-00DIxj-Cw; Wed, 01 Jun 2022 01:45:51 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwDQT-00DIri-Cn; Wed, 01 Jun 2022 01:45:34 +0000
Received: by mail-io1-xd2b.google.com with SMTP id 2so285815iou.5;
        Tue, 31 May 2022 18:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pyuU9OeurkYsRLJ+IwC7kgyYcpKMo7tA+yLD820Bc3k=;
        b=UtH5dIWP/r0OJOmktGdxZzRIyaGG/xFKUaRYt8IExtMk+oBufMbkxkn136F7SkF3iq
         7zFiieWeZDgwOFDsZ9jGJTeH8Ji2R6v0k8UduPqS+rb4A0W0EASaeavQopb9S1MB8OFf
         cAvLBgBB3UYL97Y0lxVasUaKmnHfH8uYqxXM7uHEJ1K6msSFweAzlzxOxyCyYZXcAGSJ
         6pc58iiupxfG0jGUEin91MaByNcsr/AOnsx2T9aP3tP10L90xqTcpfq6V4ty7+5674lo
         rWOpF+D7I3AutlLVIkPWHBIdHhOCbQ5h6lodxb5nFpyQNJr0ohIFZ+bvv1IIjozyqwH0
         ZBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pyuU9OeurkYsRLJ+IwC7kgyYcpKMo7tA+yLD820Bc3k=;
        b=JA8N5q9iXkwJbJFNoQBBD5v4zajnTq79YJEUZ6KJH3xi75BXN4rrWIpE07OZH50In+
         0Wj6iHD4vhhkJ9LD2u3u1w6Qfb5qd/TqxNkzh001se3YlasRn0WhD7eoJmvYBjNwjiT0
         csCq/MnoeEJ5NR0z1DQozZGkWXR5aL8w58LWcUnt0xqMe9POYSf0yQ4Xveiu1zLll83X
         KBRSkZlIkw6mW27X9Zh5UGXaH3AMED0Sk9+kR/FGjX9fXpfR3QqtKXZ96x/Zkb99mJHt
         jqx7nzXc+deXyn1cU6xev39Uj49VSRSLVAIRJdNp4r0nxsK6Jy4YXqbgcZZR4Y5Q1eng
         DZjw==
X-Gm-Message-State: AOAM533T/4mkrPkf1QDBO8zKa6/tYODn3MlEyvuOCQz/0zPvBJX3h+Ve
	9KsFYDH24loYkW0HaVzuSbQ=
X-Google-Smtp-Source: ABdhPJwkl5MzkDc8hG0AeONzlpN6CLFnewxxBB96sU2/QjzEAYjO25L+e41HcpoWIfVSr7+/yCxIzQ==
X-Received: by 2002:a5e:c30b:0:b0:668:825c:8556 with SMTP id a11-20020a5ec30b000000b00668825c8556mr7400697iok.68.1654047931596;
        Tue, 31 May 2022 18:45:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:2442:6db0:bd78:a862:1b9c:aef9? ([2600:1700:2442:6db0:bd78:a862:1b9c:aef9])
        by smtp.gmail.com with ESMTPSA id i41-20020a026029000000b0033155f242f0sm154414jac.23.2022.05.31.18.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 May 2022 18:45:31 -0700 (PDT)
Message-ID: <7c6f0015-cf50-4c8b-060d-f6641d0aeb16@gmail.com>
Date: Tue, 31 May 2022 20:45:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] scripts: dtc: fix a false alarm for
 node_name_chars_strict
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 casper.li@mediatek.com, chinwen.chang@mediatek.com,
 kuan-ying.lee@mediatek.com
References: <20220531053358.19003-1-qun-wei.lin@mediatek.com>
 <8d4b8cc3-8433-24f9-1fc5-12d71e640952@gmail.com>
 <20220531214914.GA2388344-robh@kernel.org>
From: Frank Rowand <frowand.list@gmail.com>
In-Reply-To: <20220531214914.GA2388344-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_184533_499391_0E54E2E2 
X-CRM114-Status: GOOD (  13.67  )
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

On 5/31/22 17:49, Rob Herring wrote:
> On Tue, May 31, 2022 at 04:43:18PM -0400, Frank Rowand wrote:
>> On 5/31/22 01:33, Qun-Wei Lin wrote:
>>> The function check_node_name_chars_strict issues a false alarm when
>>> compiling an overlay dts.
>>>
>>> /fragment@0/__overlay__: Character '_' not recommended in node name
>>>
>>> This workaround will fix it by skip checking for node named __overlay__.
>>
>> This is not a false alarm.
>>
>> Do not special case node name "__overlay__".  This node name should never
>> occur in a modern overlay source file.
> 
> A dtbo -> dts pass will give warnings, so handling these nodes is 
> worthwhile. Though thinking a bit more about it, I think this one is off 
> by default, but W=2 turns it on.

Yes, at least as of 5.18-rc1 the warning is only if
'-W node_name_chars_strict', so a dtbo -> dts pass will not give the
warning for node __overlay__ by default.

-Frank

> 
> Rob


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
