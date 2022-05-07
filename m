Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 644D3C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 16:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6ev+1y0hzBPGRudlZd35JmyJKsdxm8/lwfwWUFWkq8=; b=Bnnvfthmd8V7QG
	TUhH5Zw5xcfHYfcLFkzkCs6wOXCDmWsXtr6fCvvOiaeO9BuAQt9DGbd16Nc7Lvh5nwDCxQEyrBq8R
	qk1J+hf9UNV5I160f1bIdXhkjsxeopKZw3ziUPIz5sQXhs9QuOEo2qYJAM6AAnwmFzTiTRlg2MzrF
	AtdEoZ5QexgwUiZr/sblmCM9IsvAgacvENgzSxadM4YtZJgqAED7ywBPYSmVs6d1/rMN+xU/Y1MHT
	RjwNkVRfRsVeIXDj7/hYUqrUxDN6oAJw380Yv5K2W9N0wM2gr/fqX1lNWrlQLXDEJtsQgywQX6IiR
	lOgaeaup3bpyeYN4GKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnNNC-007fmM-Nk; Sat, 07 May 2022 16:33:38 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnNN9-007fl2-Nx
 for linux-mediatek@lists.infradead.org; Sat, 07 May 2022 16:33:37 +0000
Received: by mail-ed1-x531.google.com with SMTP id z19so11804370edx.9
 for <linux-mediatek@lists.infradead.org>; Sat, 07 May 2022 09:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pKO2GPtNdIghjz6m7nU4lvNqHCZJe8aOfScuIu52lYI=;
 b=cmLK3WTGMu+JUFTSMOh+sDJVERBH5LGbX9YNBtxSObQUA1nZntQ/c5pTdEdgArSC37
 XT6tUpq3xiwy+X2rC4oFU4oYhpSyi2ZMdwxuF1/jc+WO3kouQHwmm6wJ1TPVWLB/hVph
 fdYATZMGIKm4CHf2cx2DsjD7DxSjC+iFUqi1X9vEEz+hmBQg3XbevS6UT+UOjgiL9q+2
 yBZcs0eoG2RgtAGi7d54VnDIXKApqL7/8x1GGXDOH1gSU3Uy4RFm0CJnxvoCL/pnhNEF
 sjnStod+/FZH986KzgVqyZ3mXngZX3xkXCl89lVKWoQ3mQEmrEuYparnCmDAjUprWGF2
 6HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pKO2GPtNdIghjz6m7nU4lvNqHCZJe8aOfScuIu52lYI=;
 b=AwNf3ZBZEJWpuEcQ/hfKknP6MGvOUvR/GFhWFNQeCe11thE+fhNsnKHDgFctkW+JLr
 Z71EwMR0KVpTsRSrULfcYiTiTVOe2+CigQxg1JbR9Y3iWw7PTjOdnl83NRIOhkuJ6o7o
 aGwx1ue7GRduZ4GHN5KqxkGDpx+OhP5qf+V7nPM5nLlT1mSCfwUI0QNH9T5aVmwvopI3
 uW2EtsQCUGuRVZ6QzS5iv3LfStGkEsIWnYz9PAiAJRnyLAFrhgrybgYKKnGWDYUeUeY6
 6sQz3OeE6nvpH9aQHGnbhVVPHdhB4NPRQrsXo0K9MvAsEQUOmIMKEl8LODq5eFMEKObG
 O6VQ==
X-Gm-Message-State: AOAM533YKk3v9sGZg+s1Bi+avxltayYwcAhHrnlzTaiLbhoC7GweAzqc
 oRmgAZZyc/yuE7QMGM9My0j43Q==
X-Google-Smtp-Source: ABdhPJwHYjjrG+KKOOSLs6RtoUUFX0QbyyBt93Asr2h6J9e7iKcP3hEt3PXEy5+GCvVymWXolMYvWw==
X-Received: by 2002:a05:6402:5255:b0:427:de81:6af with SMTP id
 t21-20020a056402525500b00427de8106afmr9324701edd.269.1651941213736; 
 Sat, 07 May 2022 09:33:33 -0700 (PDT)
Received: from [192.168.0.233] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 w26-20020a50fa9a000000b0041d893ed437sm3745988edr.2.2022.05.07.09.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 09:33:33 -0700 (PDT)
Message-ID: <d3e027ca-9ccf-cf91-2414-85d2b9b680f0@linaro.org>
Date: Sat, 7 May 2022 18:33:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Tzung-Bi Shih
 <tzungbi@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20220506213226.257859-1-nfraprado@collabora.com>
 <20220506213226.257859-2-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220506213226.257859-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_093336_337757_D861645C 
X-CRM114-Status: GOOD (  14.37  )
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

T24gMDYvMDUvMjAyMiAyMzozMiwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gQ29t
bWl0IGNhMjNlY2ZkYmQ0NCAoInJlbW90ZXByb2MvbWVkaWF0ZWs6IHN1cHBvcnQgTDFUQ00iKSBh
ZGRlZCBzdXBwb3J0Cj4gZm9yIHRoZSBsMXRjbSBtZW1vcnkgcmVnaW9uIG9uIHRoZSBNVDgxOTIg
U0NQLCBhZGRpbmcgYSBuZXcgZGFfdG9fdmEKPiBjYWxsYmFjayB0aGF0IGhhbmRsZXMgbDF0Y20g
d2hpbGUga2VlcGluZyB0aGUgb2xkIG9uZSBmb3IKPiBiYWNrLWNvbXBhdGliaWxpdHkgd2l0aCBN
VDgxODMuIEhvd2V2ZXIsIHNpbmNlIHRoZSBtdDgxOTIgY29tcGF0aWJsZSB3YXMKPiBtaXNzaW5n
IGZyb20gdGhlIGR0LWJpbmRpbmcsIHRoZSBhY2NvbXBhbnlpbmcgZHQtYmluZGluZyBjb21taXQK
PiA1MDNjNjRjYzQyZjEgKCJkdC1iaW5kaW5nczogcmVtb3RlcHJvYzogbWVkaWF0ZWs6IGFkZCBM
MVRDTSBtZW1vcnkgcmVnaW9uIikKPiBtaXN0YWtlbmx5IGFkZGVkIHRoaXMgcmVnIGFzIGlmIGl0
IHdlcmUgZm9yIG10ODE4My4gQW5kIGxhdGVyCj4gaXQgYmVjYW1lIGNvbW1vbiB0byBhbGwgcGxh
dGZvcm1zIGFzIHRoZWlyIGNvbXBhdGlibGVzIHdlcmUgYWRkZWQuCj4gCj4gRml4IHRoZSBkdC1i
aW5kaW5nIHNvIHRoYXQgdGhlIGwxdGNtIHJlZyBjYW4sIGFuZCBtdXN0LCBiZSBwcmVzZW50IG9u
bHkKPiBvbiB0aGUgc3VwcG9ydGVkIHBsYXRmb3JtczogbXQ4MTkyIGFuZCBtdDgxOTUuCj4gCj4g
Rml4ZXM6IDUwM2M2NGNjNDJmMSAoImR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazog
YWRkIEwxVENNIG1lbW9yeSByZWdpb24iKQo+IFNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIu
IEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPiAKPiAtLS0KPiBUaGUgaWY6dGhl
bjogYnJhbmNoZXMgYmVjYW1lIHJhdGhlciBsb25nIHNpbmNlIGl0IHNlZW1zIHRoYXQgaXQncyBu
b3QKPiBwb3NzaWJsZSB0byBvdmVycmlkZSB0aGUgcHJvcGVydGllcyBpbiB0aGVtLCBvbmx5IGFk
ZCBuZXcgb25lcy4gVGhhdCBpcywKPiBJIGNvdWxkbid0IGxlYXZlIHRoZSBpdGVtcyBkZWZpbml0
aW9uIGZvciBhbGwgdGhyZWUgcmVncyBpbiB0aGUgZ2xvYmFsCj4gcmVnLW5hbWVzIGFuZCBqdXN0
IGRlY3JlYXNlIG1pbkl0ZW1zIGFuZCBtYXhJdGVtcyB0byAyIGZvcgo+IG10ODE4My9tdDgxODYu
Cj4gCj4gQWxzbyBJIGhhZCB0byBhZGQgYSBkZXNjcmlwdGlvbiB0byB0aGUgZ2xvYmFsIHJlZy1u
YW1lcywgc2luY2UgaXQKPiBjb3VsZG4ndCBiZSBuZWl0aGVyIG1pc3Npbmcgbm9yIGVtcHR5LgoK
SXQgaXMgcG9zc2libGU6Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9z
b3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2V4YW1wbGUtc2NoZW1hLnlh
bWwjTDkxCgpLZWVwIGNvbnN0cmFpbnRzIGFuZCBsaXN0IG9mIG5hbWVzIGluIHByb3BlcnRpZXMu
IFRoZW4gaW4gYWxsT2Y6aWY6dGhlbgpyYWlzZSBtaW5JdGVtcyBvciBsb3dlciBtYXhJdGVtcywg
ZGVwZW5kaW5nIG9uIHRoZSB2YXJpYW50LgoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
