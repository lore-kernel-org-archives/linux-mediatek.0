Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A161C61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sD9XmxwdpDc2jh4miP7TighcPFQqr+/oanR4Siz9kXg=; b=GAa0Z4jgluO2KtTJiOL5jKCDHX
	8AceRnFOLXF1F5GiI8YoDHBN+8tvMqmF6/D5azDbIDXho8US4zEjAmx61XS+ttJbYBVlqsFEGpyVq
	MT3w2UTDyS5NmOMd+vHwcsaGh5YHUo/qgHpNQiOFnQjdtN1Bt89CW9OpzMB7X5uW3hcRUxm4Yw/PF
	NfHXqtAAFcPiE+97RNyBwncc8/32rOj2GqQQ1dlHBqphJLllmwXzHTjFN1l7lxTDpuC4+MEqVtWeb
	o7IaMZ7iv+5fjAosdXkQUBZr1CL0BAz15Ftgdpc72U4xttpcI1ncKIhvMkSiuVk/Zl1pKBJR03Wer
	UsucWS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwCP-00270M-Vy; Tue, 14 Feb 2023 14:22:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvlz-001sGV-4i; Tue, 14 Feb 2023 13:55:08 +0000
Received: by mail-ej1-x62a.google.com with SMTP id n10so13332038ejc.4;
        Tue, 14 Feb 2023 05:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sD9XmxwdpDc2jh4miP7TighcPFQqr+/oanR4Siz9kXg=;
        b=nG/QSzXlu0zWOe4nIpZQDCa/ukl1i/U04S07Y3jhT9FMsZkiRqvbQaYhjSKWoVLwi4
         exPorjckhX8wNsfgqQA9PqFQ7i8GS+ads2GT9Q99lOupJtbzBYtI1Gp6+8gATTpvb8U0
         PRhk8yaa1KmNkjYo9UCQJl6ycLsAFADI2PRCp40Noe16vafZzoFkSe7V4ZzxDO8ROqRQ
         zSlnyQ0yefzNLN+r/l4YgqQ2z2Lg1wa44DBvOSJ5UU0pjrHvhKB3Kxgr+2WubHBY7eIz
         ID1K2Y5gaSf8P6wTJWMoetJM//+RR3BZ3+DpfqeGt0BnXnetaEsUoS/sAYl0XE3HcZjv
         e8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sD9XmxwdpDc2jh4miP7TighcPFQqr+/oanR4Siz9kXg=;
        b=Bmn9OhA+Ufsmh6PVxxB3fPcRUAg8ea1v/4XhabQSmL2PjNj6h+fWoRCdXX7lkCdROn
         eNu+LRkatEiHEbVZzXlDmtJfQFJsaxKXFLrVt7fPviSsUZfURMhXgyZSH1I8ThB5QmAe
         dTms3DAXS4i7koO5X410ZffSp8s1S6hyPYarkiY5ruX2tb0ha2npLVEhA+XOis7RJYd9
         dCpf+R3MoPNimLI+4e4XmtgisvVZKj/YbqX5HkKXPjEnYiqhKpptqrz4niTweeByw+K1
         OT00FL8wvrGJKQRYkf1uhhWiothJT8qYvHIrugCTaCUMC9Mi6fKiKoMX6/JRziKCCvTX
         iOQA==
X-Gm-Message-State: AO0yUKX0CPPXFeqPdDSIXDmoXqxTwjOlHjqJsvJvUcfTZZBV7ovrs/+n
	t0hhoLYDN9ZheBMOBSTzeEk=
X-Google-Smtp-Source: AK7set+ZJn7SXOy6FSwFbPNqbQeUuT8T5e+bobfo0l1w6nJ8E6AnFaXMXe3vDiRDuwDwcLDbtUqs3g==
X-Received: by 2002:a17:907:a40a:b0:889:5686:486a with SMTP id sg10-20020a170907a40a00b008895686486amr3893565ejc.30.1676382900735;
        Tue, 14 Feb 2023 05:55:00 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id gs4-20020a170906f18400b008a5cbd8f7d1sm8210895ejb.127.2023.02.14.05.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 05:55:00 -0800 (PST)
Message-ID: <1258b5b7-e8c8-cfb1-5bfb-c966dd4cfcf8@gmail.com>
Date: Tue, 14 Feb 2023 14:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] soc: mediatek: mtk-svs: delete node name check
Content-Language: en-US
To: =?UTF-8?B?Um9nZXIgTHUgKOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>,
 "matthias.bgg@kernel.org" <matthias.bgg@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <20230209162403.21113-1-matthias.bgg@kernel.org>
 <12ff7576-76d3-8cb6-4c8f-6c9417ac28c2@collabora.com>
 <65af4673ef79d8dd3404f4cfb773859410c85cc5.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <65af4673ef79d8dd3404f4cfb773859410c85cc5.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_055507_252411_FBB7B023 
X-CRM114-Status: UNSURE (   9.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11/02/2023 12:37, Roger Lu (陸瑞傑) wrote:
> On Fri, 2023-02-10 at 13:01 +0100, AngeloGioacchino Del Regno wrote:
>> Il 09/02/23 17:24, matthias.bgg@kernel.org ha scritto:
>>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>>
>>> The function  svs_add_device_link is called only internally from the SoC
>>> specific probe functions. We don't need to check if the node_name is
>>> null because that would mean that we have a buggy SoC probe function in
>>> the first place.
>>>
>>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
> 
> Reviewed-by: Roger Lu <roger.lu@mediatek.com>

Applied, thanks for the reviews.
Matthias

