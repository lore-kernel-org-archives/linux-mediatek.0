Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C016DC3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnacwdNXQeiYAN/vyHCjqJ3Z55j/qGrBpNl88GFWc6Q=; b=YllSCoBxwzdRtKqrdncXWUSYV7
	hrsQBhBPPaEHsVmmTyQf+9MNa7zfRbTxHtTCfa+cquMbmh4+0+BVrK0ZSPjA25XNkcQpOQBSUehIk
	QK021zO8P+Ri9JujPFud7iOLWmJp6SyPK81yIFaMSuczyCsqX/4xFDSJdkizoiFuESvSwDxhI05jn
	Q9x91Lgb201RFfHAQA4l7kEOlpE5RziVCZlA3ffFxRqPlVzrMwx1AOBbNytFqyn81UE2Xl3W3KvGH
	dm+FEKeEe/a1CgwzbIAMKqBcW0XorrlR5O2/9+lZZQ9zO+D4JowBtL/jzmZ9/cC3cI4OT+vJXEcxp
	ZHrPiOTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYicH-0000000EOD9-0m2j;
	Tue, 30 Jul 2024 08:53:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYibp-0000000EO7s-1LrB
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jul 2024 08:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722329607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YnacwdNXQeiYAN/vyHCjqJ3Z55j/qGrBpNl88GFWc6Q=;
	b=Ca71Jd6JrQnZO06iqbveJo7GLkXoI3yR75FDNyQ6RUh2qen61q+eamWGY3ecAx+Vw6oA6m
	t7LcWvWMsrgg/uzb8dmepK6FDxZ1J2ZUsbzvC+J/fcXFO3/T5c4Z+fCiPUWiy2YsWcsMcG
	WjKBUnmtSWw1ITnLNw/BU5GYXY6ucZg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-JIEtRKsuNS6k8Ln3zeUMog-1; Tue, 30 Jul 2024 04:53:23 -0400
X-MC-Unique: JIEtRKsuNS6k8Ln3zeUMog-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4281e72db54so2949155e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jul 2024 01:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722329602; x=1722934402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YnacwdNXQeiYAN/vyHCjqJ3Z55j/qGrBpNl88GFWc6Q=;
        b=f5zsyt7Q8R9gJo0yApliZw3y2UxAoQZbaaYF+r15TQJJ2MZ82DNVV1tB0sKHT8qErs
         goz//K23zC3GWP8yxrHf13YkU0Y8VtUeBcRzcWgmiJvsuMme4Mba8Ihzwu0JraG+xGLk
         EI4/i8Uj6cDYE83rYfgqDwjZYpiXvVd9ad0OnTdhbsbP+peg5alOQX38/zNlK4qemqdQ
         CDR/Z7bsGuqQoo7fpOe4zGXcvNdZ5LnD4hL2ajoD1XHlrkOpSmmt1eYaRZ1xAbvOaRD8
         /5ZuQlJ2Sm0oUvRIwfqbo/QfKSs7Q0KS9vkAOdJUuocalHU1EtJlD3STQj3A4TACnLBm
         p3iw==
X-Forwarded-Encrypted: i=1; AJvYcCW8J+TpHn+UexjRYm73MyRiLicdOKohgQeKsIX+WYBgQE8ytQuLaYVLnKPtApU6OZJqkExbm3O8LBFo+9zy7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdZzRfMSLHNLfVGPEbbLJbEc53/75W8DD8M7VW6isuJUnwKyWQ
	OXgR6VfE1JVz8H+ozrBcwCnyVHKN88hr0o2E0sVZJ0puEBI7+XDNGEnPtagAcQXzBAqyKsm7mpy
	rDD3Dv3Mej3K7ByiqaupiHHbOTNW0RsPlmaKC1Zkgl2AsGVqNRjPV3tB5rCnWTUsglfUgJA==
X-Received: by 2002:a05:600c:4fc2:b0:427:9f6c:e4bd with SMTP id 5b1f17b1804b1-42805713af0mr69580125e9.6.1722329601924;
        Tue, 30 Jul 2024 01:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe5skEumfC7OwYco+fwnLjIRX5mFiP+wG2g0HwUfV8HU5TLSTPaOIm8pjlpNbR0ZWFSuDj1w==
X-Received: by 2002:a05:600c:4fc2:b0:427:9f6c:e4bd with SMTP id 5b1f17b1804b1-42805713af0mr69579945e9.6.1722329601387;
        Tue, 30 Jul 2024 01:53:21 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410:9110:ce28:b1de:d919? ([2a0d:3344:1712:4410:9110:ce28:b1de:d919])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428089c28f0sm191284215e9.28.2024.07.30.01.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 01:53:20 -0700 (PDT)
Message-ID: <738f69e6-1e8d-4acc-adfa-9592505723fe@redhat.com>
Date: Tue, 30 Jul 2024 10:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: drop clocks unused by
 Ethernet driver
To: Jakub Kicinski <kuba@kernel.org>, Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <5f7fc409ecae7794e4f09d90437db1dd9e4e7132.1722207277.git.daniel@makrotopia.org>
 <20240729190634.33c50e2a@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240729190634.33c50e2a@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_015329_442065_C1370FD7 
X-CRM114-Status: GOOD (  10.20  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7/30/24 04:06, Jakub Kicinski wrote:
> On Mon, 29 Jul 2024 00:00:23 +0100 Daniel Golle wrote:
>> Clocks for SerDes and PHY are going to be handled by standalone drivers
>> for each of those hardware components. Drop them from the Ethernet driver.
>>
>> The clocks which are being removed for this patch are responsible for
>> the for the SerDes PCS and PHYs used for the 2nd and 3rd MAC which are
>> anyway not yet supported. Hence backwards compatibility is not an issue.
> 
> What user visible issue is it fixing, then?

Indeed this looks like more a cleanup than a fix. @Daniel why net-next 
without fixes tag is not a suitable target here?

Thanks!

Paolo


