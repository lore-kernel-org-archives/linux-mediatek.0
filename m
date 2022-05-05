Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27B5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdhDoiEVbuiq++g9sQVpBPIokBfz8V7pSLAi2hnWNIY=; b=MrXiMysTzctDnn
	N+5EBzcnXv/l/ZaZ6Bo30mOxuaVbsf7HhwNqx1JCtI76hsh2w8O0mpzO84YPtwFcsgTCnRuWNZ80V
	4AqVChqAlthKF+1rjOb+OrlA7Wlha5kyhYmPzDZ52rMV8sveLXhwc6Z7qXKPwAFQAjbh0DrZnEzOs
	SYhk2E8/DirymRYu/xZCjzjYn2oy7AlZvWiT5ok8XC93kJhZLzkZnbQJ7QhwQnkncRh2nO9L7ogEp
	02PKUIce4tY/8KVy0GcbacK8evZTmyn4ttrSqZZi8JutNly+KlEoO2gzfnr0J9LSrSNeY1zPlK+gv
	t1PiJQBBniIMbwCqCr3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmXY7-00Ewdz-KI; Thu, 05 May 2022 09:13:27 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmXY4-00EwcO-HU
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 09:13:25 +0000
Received: by mail-ed1-x532.google.com with SMTP id p4so4484037edx.0
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 02:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C13CFKJEOWyH4FQIHZ/zbMnXVynUc/Y9MwQkzIzQHbE=;
 b=F6SFjkjjWudZLAozoSYNPJQraIiViaBJ2Unq9ZF3WmHPCPxSPqMYXfwo0cWrp7R3Zs
 3zplapT1nChS1cRnMbQFli1zcNAGqFo1MPfGZark0mRVOumKUdefulsAmgfA0QxoP2Qr
 uWM+ij6HoeUN1G4VKS/bR4UCiXvXLxsG0vvS2pTdph1ldSuw2KoWBGgBPnbkUJW0Co+R
 +bktWgbr5PDS4JNOEuhDuBaeqHNJeBkJscx7s0uAFHq+Ke3XEfA0jFFwiXXr1Qh91JJv
 tlEtjRTPjzzm3ZNSM60oHrmgcE38hIDGHZwFnLnvLXi87ZRuHOEu8MZNadxmbkazggCL
 XuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C13CFKJEOWyH4FQIHZ/zbMnXVynUc/Y9MwQkzIzQHbE=;
 b=p2a4+XxATqvYZon3udhnKv2EO14cyvtOgassao5p9eqPNUAmuBftc1Z9QjgntXbMgI
 lsIpYwyWJl0NbMGZcr7ihFq1QfklQ+SDJ0Qar+29OQ7PT7w5fwnZ1vTjS2zv28CjwqWJ
 DJR2B/emZQgEYU5qi+Jr+nS5kVIEkBtIwgE+S/8dfXo9we1uHY0o5oBbCIdQCtfAaXwU
 eLBd3eMqED3ZVxPxwo8mNIbF8xME1uzBYU+2kLpHvtL4gOP2w83uIGIwAUZAOxCqbiUU
 3QCgp64/O9yO0nqjYPgwTljTHEJX/YKYhXBPzoUZl7S1Q3HduT7Hr9VQw+qjVwcYXl5L
 x0Gw==
X-Gm-Message-State: AOAM531xpXNvnJYrsSNMKZwDyVV3C3PS5p9e3wGzP1wfS3WCKTy1/C6H
 1OIEk+IiL+cr3ruBg1Oh+pIVnA==
X-Google-Smtp-Source: ABdhPJyauXqqC7x8uraKE/6KGzasb6Rf6omeH6bh0NkPyDvQ1ATzyeeI5h3E8OUKjmWmg42poxBUVQ==
X-Received: by 2002:a05:6402:849:b0:427:edfe:1b7e with SMTP id
 b9-20020a056402084900b00427edfe1b7emr12779009edz.355.1651742002696; 
 Thu, 05 May 2022 02:13:22 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 my50-20020a1709065a7200b006f3ef214e79sm502596ejc.223.2022.05.05.02.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 02:13:22 -0700 (PDT)
Message-ID: <c790db17-79b9-a73f-ed0f-728a8a075ba1@linaro.org>
Date: Thu, 5 May 2022 11:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 optional for mtk,scp
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20220503211114.2656099-1-nfraprado@collabora.com>
 <20220503211114.2656099-2-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220503211114.2656099-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_021324_632696_D3E03EA4 
X-CRM114-Status: UNSURE (   9.57  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDMvMDUvMjAyMiAyMzoxMSwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gVGhl
IFNDUCBoYXMgdGhyZWUgbWVtb3J5IHJlZ2lvbnM6IHNyYW0sIGNmZyBhbmQgbDF0Y20uIFdoaWxl
IHRoZSBmaXJzdAo+IHR3byBhcmUgcmVxdWlyZWQsIGwxdGNtIGlzIG9wdGlvbmFsLiBGaXggdGhl
IGR0LWJpbmRpbmcgc28gdGhhdCBpdCBjYW4KPiBiZSBvbWl0dGVkIGFuZCB1cGRhdGUgdGhlIGRl
c2NyaXB0aW9uLiBUaGlzIGdldHMgcmlkIG9mIGR0YnNfY2hlY2sKPiB3YXJuaW5ncyBmb3IgZGV2
aWNldHJlZXMgd2hlcmUgdGhlIGwxdGNtIHJlZyBpcyBtaXNzaW5nIGxpa2UgbXQ4MTgzLgoKUGxl
YXNlIGFkZCAiaWY6dGhlbjoiIGZvciB0aGlzIGNhc2UgKG5lZWQgdG8gcHV0IGFsbCBpZnMgaW4g
YWxsT2YpLiBJCnVuZGVyc3RhbmQgdGhhdCBsMXRjbSBpcyBvcHRpb25hbCAqb25seSogb24gbXQ4
MTgzLgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
