Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B90C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18ia72DeCJXTBG/3lKRZDcCr7u13ct+BTv+oOCyhZ4c=; b=gJ7dvCOFsLInGg
	8ws7VcDuXfc5qLceQ4YnNeIEfxXBK3aiA/m6rnogqNghB0V78YyzyPRC961IDVxi9EVXWUYwa/wLt
	uk67m/IFuvpDVHIVcqcdI/WMzbTE3yIXHiAqYc7gnr4gUz8FshvLNOglTrbqtLH3/IzS7h5PSrmK/
	aPIMmwQm9xl9PFgFuDYzlhqmG6YVi31cRBqYFcRMZY5/frgjs6NBw+0TDq5XVSmFTrskq+yVCSSbq
	EkteMv/KVz+Hb0NfJaTvGMi138DCQwNQFbleMC4B321fqH/c8NGayuN0dUaOWk7tOaEFFmbFN5vsO
	gUpFu+5e2UKOHO8z9mzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noiQO-0066Jg-1n; Wed, 11 May 2022 09:14:28 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noiQL-0066Gu-3F
 for linux-mediatek@lists.infradead.org; Wed, 11 May 2022 09:14:26 +0000
Received: by mail-ej1-x62f.google.com with SMTP id g6so2774339ejw.1
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=bHmJ4JQM0ahp4y4UqiuvyOdC9DhyYS0199lrFCEzmUw=;
 b=A+fkhlX3WrnIJwoPrBo2HZxSYfi4zPTUMo2UXnzO4F2uAiRkc6YPp+X8Iy5f8aiJOc
 1zFYgKlp3cq/2uTrX3xiUwlIOQquQGa+z6BLya8KxkdEoz7Znujtl8Daai+EGoPZZbja
 SDeRb9ZH7Ar3GBSTwKGZE7aIdi670ysp339ZyDTENJH2KFbO7VTNPd2Ssix5WRiJndNh
 XwQw51D1nlGgRJxnrSRnABUxgr21MPLCIMTMb+Jh377tSdVtIJ+mwG/b5w8EhqqrxAg0
 Z43L30PP3u8+Q6h3Qp05ZOlpxdDQ5weozC9dZIIkUNvp341vNKOQpYuvz5z3JxRpFv5f
 uOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=bHmJ4JQM0ahp4y4UqiuvyOdC9DhyYS0199lrFCEzmUw=;
 b=q/XMKoh6wvcOI+I+t8kzl2zQqWsp14inQQ15rcPYJMTUgUvqz9Baif2SlyxZo7fqfA
 HnfBYFq+m5qIqcHLPZdybjVuM6tQR7F2rYldqlarphDoUGRzeCIPaLxa4+O5rPowLNXl
 kmTz3mJV71ozOpmj4us8mOxljmwIzMuhUKbH3tfYzHyoV0oVHX83o5TqT/pz+zBHtRvf
 dGhQ1vwn279L91s3JpTY+o3f4BfIWdrykq4UeEB483mqI+do3Kb4DUq/gvnsJmZBiLJm
 LM2yvr6KxN6jSmFoSpJVFobHGGurFTsCx48tHfwMgKSVPFNK5vcvHz4i/QRn3tadZ+UL
 7MkA==
X-Gm-Message-State: AOAM533mVYLfe+qUOWzkJY0VS34EIGYg02wy5ScUMdMLQXWhcnpNPUss
 7sci9u2IzSy65Don0/a2nHYg3w==
X-Google-Smtp-Source: ABdhPJxDrbjJVt79t2h9FiSlpJoNszdUyEQni7whfaHreR3sdC7CxegUPLZyiivDrf/5AS2/zp+N7g==
X-Received: by 2002:a17:907:8a21:b0:6f4:d2e5:4d17 with SMTP id
 sc33-20020a1709078a2100b006f4d2e54d17mr24229498ejc.196.1652260458589; 
 Wed, 11 May 2022 02:14:18 -0700 (PDT)
Received: from [192.168.0.152] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 au18-20020a170907093200b006f3ef214df9sm733996ejc.95.2022.05.11.02.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 02:14:17 -0700 (PDT)
Message-ID: <5c0bc870-2514-57b6-1ff3-c393b57fc5f0@linaro.org>
Date: Wed, 11 May 2022 11:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
 <d3e027ca-9ccf-cf91-2414-85d2b9b680f0@linaro.org>
 <20220510165016.r7nyck2abt5m4djp@notapiano>
 <66796853-efe7-f661-9637-ac6cfefc68e5@linaro.org>
In-Reply-To: <66796853-efe7-f661-9637-ac6cfefc68e5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_021425_163638_288056CA 
X-CRM114-Status: GOOD (  13.26  )
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

T24gMTEvMDUvMjAyMiAxMToxMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxMC8w
NS8yMDIyIDE4OjUwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90ZToKPj4+PiBBbHNvIEkg
aGFkIHRvIGFkZCBhIGRlc2NyaXB0aW9uIHRvIHRoZSBnbG9iYWwgcmVnLW5hbWVzLCBzaW5jZSBp
dAo+Pj4+IGNvdWxkbid0IGJlIG5laXRoZXIgbWlzc2luZyBub3IgZW1wdHkuCj4+Pgo+Pj4gSXQg
aXMgcG9zc2libGU6Cj4+PiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qv
c291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9leGFtcGxlLXNjaGVtYS55
YW1sI0w5MQo+Pj4KPj4+IEtlZXAgY29uc3RyYWludHMgYW5kIGxpc3Qgb2YgbmFtZXMgaW4gcHJv
cGVydGllcy4gVGhlbiBpbiBhbGxPZjppZjp0aGVuCj4+PiByYWlzZSBtaW5JdGVtcyBvciBsb3dl
ciBtYXhJdGVtcywgZGVwZW5kaW5nIG9uIHRoZSB2YXJpYW50Lgo+Pgo+PiBIaSBLcnp5c3p0b2Ys
Cj4+Cj4+IHRoYXQgZXhhbXBsZSBvbmx5IHNob3dzIHNldHRpbmcgbWluSXRlbXMgdG8gb3ZlcnJp
ZGUgdGhlIGRlZmF1bHQgdmFsdWUsIGJ1dCB0aGUKPj4gaXNzdWUgaGVyZSBpcyB0aGF0IGl0J3Mg
bm90IHBvc3NpYmxlIHRvIG92ZXJyaWRlIG1pbkl0ZW1zL21heEl0ZW1zIChhZnRlcgo+PiB0aGV5
J3JlIGFscmVhZHkgc2V0LCBldmVuIGlmIGltcGxpY2l0bHkpIHdpdGggYSBkaWZmZXJlbnQgdmFs
dWUgaW4gdGhlIGlmLgo+IAo+IE5vLCB0aGlzIGV4YW1wbGUgc2hvd3MgZXhhY3RseSB3aGF0IHlv
dSBuZWVkIGluIGZpcnN0IHN0ZXAgLSBtYWtlIG9uZQo+IGl0ZW0gb24gdGhlIGxpc3Qgb3B0aW9u
YWwuCj4gCj4gVGhlcmUgYXJlIHNldmVyYWwgb3RoZXIgZXhhbXBsZXMgZm9yIHRoZSBlbnRpcmUg
cGljdHVyZSBvciBkaWZmZXJlbnQKPiBhcHJvYWNoOgo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2V4YW1wbGUtc2NoZW1hLnlhbWwjTDkxCgpXYWl0LCB0aGlzIGlzIHRoZSBzYW1lIGxpbmsuLi4g
YmVjYXVzZSBpdCBleGFjdGx5IG1hdGNoZXMgeW91ciBjYXNlLgoKQmVzdCByZWdhcmRzLApLcnp5
c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
