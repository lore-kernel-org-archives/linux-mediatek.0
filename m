Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 06:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxIIXrl1sXgI+vmb3TL/Wz8bBjBEmGseGACgFNzzp9M=; b=qavfh+jepQ3V0H
	vEHu7dE/mxIzLzZ21xmiI+Yfjm4+qCwjCaivk/Ibih+XgOQSa9jkCgS9jvbapk5MHLOinT0BfZIqz
	cFBe1oAnSHIAldGPg4Vpl3WgPRUTzCELcqIJT9MOFJrw7SxaQ/BufbfyXWO/O/hyRl+SxStW4p146
	rzHdJddfpJWtrThqF3Jyfse4nANrguzvoQfHEBbuFS+4JvVDw8hrTz+BuxxIn8ZmCfub1IBfwi8NF
	8ujca6esGyqiqnk7rEynlsqEljJPE+k+eRwrssG9PMtGaAHYlFcuscatK043VRIK6XqQ3fzpg9OR+
	e6l/0eHpFhKenMSiXUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1net3S-00475b-7U; Thu, 14 Apr 2022 06:34:10 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1net3N-00471a-B2
 for linux-mediatek@lists.infradead.org; Thu, 14 Apr 2022 06:34:07 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z99so5089357ede.5
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Apr 2022 23:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=D/ipfU28h+YDs/vQIG6JpjOGobV5kM+7VxkHsaNF4ec=;
 b=lZLxBSicwQ6JPl/gDsf9rr5+CGdgLAmoNPUZUVHZK8g5tXZJmEny8FUdllZsxJeUfL
 M36irxT2X0vs9gudKyATRAU3b8XDS+BBkTrtvuZ0RP9pvKTY0RyWQN3sNs7QGkPA9qVb
 GmHcYJ677mTEUSgLs+n/kGTCrhJw+aVjKfE7OQbUIZB0iCeZtgvWUjXTwlis+OCrvzvw
 X4zVznSHvIOGIVB7cqueULuRBc3jXtWoDlVpQeZo1TN71MzCYkJ+CAU4kBuQwsE23Uua
 cQvhydwvxhZTzFkgtZV1uyBs9IL29U1EjZvGfqAPiYLm+HdDAzkMkVMX4OL9KPTY2t9I
 8nFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D/ipfU28h+YDs/vQIG6JpjOGobV5kM+7VxkHsaNF4ec=;
 b=W1zQnKJukKc0BjXp1EfikVMH6rGXxOIVZkKZQVQqVlScuohqrh1tB0aeidHZZ9bv6k
 khiDi7ahhfKhlWiI3pZN7ogAZ+uhJ5EoYSfKk9c8c3UVMeYj5+FlP+wSs1KJkJ7s0YnW
 T014LkSTWTOJlz+f0yEC6M+K+tWuXTrsivk/M4SKucbhEIMoCSLyEHmKa6uZMrewa9Zp
 CNKnefdAIvDJ4a1rfg6ir2iJyZCNsEMbzizxGrNKXz5FLfMAtHwn87kS2ac8JPHLEpZ7
 SDQ7NxVUlbTuO5Asp/uBpFFUL1uzP8mISeEm7tgKIF1NQyba+CkKWgi/7kldDNroCT+o
 ZxXA==
X-Gm-Message-State: AOAM533LC/3e6oHaNAjkH+hcXb6P23jBa249/u5aLT8WmQuMzSt+HWws
 bfXukc+VS9lQFuq17TwleFbLWA==
X-Google-Smtp-Source: ABdhPJwI0GhVFonB/NHPCfl4LSJUKJAZdcyNcDL79mP/DnGRcGHRwDgh7BGiywroN2IPiIZTffK5sw==
X-Received: by 2002:a05:6402:40c9:b0:419:4b81:162e with SMTP id
 z9-20020a05640240c900b004194b81162emr1368483edb.380.1649918032495; 
 Wed, 13 Apr 2022 23:33:52 -0700 (PDT)
Received: from [192.168.0.208] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 b5-20020a17090630c500b006e8044fa76bsm332851ejb.143.2022.04.13.23.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 23:33:52 -0700 (PDT)
Message-ID: <02953ce1-0a43-5918-d139-35afd5f15b5b@linaro.org>
Date: Thu, 14 Apr 2022 08:33:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 11/14] dt-bindings: pinctrl: add binding for Ralink MT7620
 pinctrl
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-12-arinc.unal@arinc9.com>
 <41fa58ee-728b-7f0d-eea7-448c59641d85@linaro.org>
 <0dd1da16-232b-d634-3146-bf91e58c9543@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0dd1da16-232b-d634-3146-bf91e58c9543@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_233405_408987_68746152 
X-CRM114-Status: UNSURE (   7.77  )
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

T24gMTQvMDQvMjAyMiAwMzo1MiwgQXLEsW7DpyDDnE5BTCB3cm90ZToKPj4KPj4+ICsgIGlzIG5v
dCBzdXBwb3J0ZWQuIFRoZXJlIGlzIG5vIHBpbmNvbmYgc3VwcG9ydC4KPj4+ICsKPj4+ICtwcm9w
ZXJ0aWVzOgo+Pj4gKyAgY29tcGF0aWJsZToKPj4+ICsgICAgY29uc3Q6IHJhbGluayxtdDc2MjAt
cGluY3RybAo+Pj4gKwo+Pj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+Pj4gKyAgJy1waW5zJCc6Cj4+
PiArICAgIHR5cGU6IG9iamVjdAo+Pj4gKyAgICBwYXR0ZXJuUHJvcGVydGllczoKPj4+ICsgICAg
ICAnXiguKi0pP3Bpbm11eCQnOgo+Pgo+PiBXaHkgZG8geW91IGhhdmUgdHdvIGxldmVscyBoZXJl
PyBwaW5zLT5waW5tdXgtPmFjdHVhbCBwaW4gY29uZmlndXJhdGlvbj8KPiAKPiBZZXMsIHBpbnMt
PnBpbm11eC0+cGluLWNvbmZpZ3VyYXRpb24gaXMgY3VycmVudGx5IGhvdyBpdCdzIGRvbmUuCgpJ
dCBpcyBjdXJyZW50bHkgZG9uZT8gQXJlbid0IHlvdSBicmluZ2luZyBoZXJlIG5ldyBiaW5kaW5n
cyBhbmQgbmV3CmRyaXZlciBzdXBwb3J0PwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
