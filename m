Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1911BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7RkxqwSR55R/jMBi+d84f/jBu8qc4s6XMpVb6XlsLY=; b=vuw+C5iYd8CJmw
	rzB0LKj68Hu2Z2lP40NeP3coE/9p7U1KOoL2i5UcqZlvtOD3xHm26gtFyvDTs2am0u+vcgH6tC8We
	j5ESySG+9pC2zb0nQgW21qE9NBTt9Liia4jlS+ATdt1fEItNjQrYq/JqHfKUGQn+Ei+P789YVCwDO
	296nNlAQ4ms+mTjAGOJguuzRlqZeVDn5Rwp3X3wKlryYl7OPB4thuyXlCkGQcMYiJwITy4hcb1Qgr
	PEvpE4vtJGVPMco4fqbmHcYaLjKNw0G7MljaEBnveSF9rnfWq89uQgMSH27IdOExuZXc03CwJLNLx
	6OIiczYVzEIPIB0HmvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrVg-005j8d-Nv; Tue, 03 May 2022 12:20:08 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrVK-005isD-LF
 for linux-mediatek@lists.infradead.org; Tue, 03 May 2022 12:19:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id dk23so33078966ejb.8
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E0FzV2fBfe8kPBhuxEwn1PdqXllBR0GrPuRd857XDdA=;
 b=LPlJwbk1n+l06QinBjW6ePwHR8rrTDXnev1EfL6Au3JGuKa2VdGXO5DX2rfJuBtRDc
 e2YGAusK522SljneiVjCtnXAtiEl14s5LKap4NUY4seBcRscMT+nVNBUalCptRjamrDn
 D7J5YAnRFk+xGZRlvNdz3eB0RHYi1Eh5qKZNcgwDExGji4jq93OXX1rNCkZjwkeEmnWV
 K8orZxCpiowxnoyzxnBgB3xplvgRxr4A2nto9gakFJZqjpHHjilCTSkq5iCQYq9qCYIM
 XHtLpOW+vNtgWbuIg0lzQtESnUcMRSwn1ppF6Yv/nme9L9Y2fvc7CKA4SNm1w0xEAAjk
 gePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E0FzV2fBfe8kPBhuxEwn1PdqXllBR0GrPuRd857XDdA=;
 b=QV84GeYC929NktFGzRaVjFyL0WyhEyGQPRlPUDBwP5KOWIujW8eTVjRzClnqrpZaCC
 32NTHdBN1fra2Ca8S5Nb6dUeOk6TMKZlbOuVCo/h8LvAYI+QLDs8ScXG2Y/QHosdNuZx
 DY5uo6t5Z7jeWCrqkWHbvjFSVWFPYm+V68XbAXyzWihqXqpDa3kBbPFTkGIK7DjEqCu+
 pC+w6zCVa6u5lZZ609BBWxU3cBV/TV8kAJLzCjhRlbezhGgyrt0DA8qz2WVbvgXZESfT
 3MJcRmmEyEpPHq4doMchM0BxBfUGbZ+6mrkoE6o1utON9I+DbyK+Ed/bnIvgt1YmimYU
 Mg1g==
X-Gm-Message-State: AOAM533gi6qpk3VHlL1ArrCqagc+0RMg5sGXy0uJO4KyT1julD92nbZv
 tjKcQVrQBPFRVWengXk1iV5LBQ==
X-Google-Smtp-Source: ABdhPJxifn0hfMTBOE+xe9zJim85fEKHkZT0EqBYtldUSbjhvMttgkM6uEDWPlQ4LMHLFXvHIHgEkQ==
X-Received: by 2002:a17:906:7947:b0:6f3:f971:1d6a with SMTP id
 l7-20020a170906794700b006f3f9711d6amr15722768ejo.571.1651580383483; 
 Tue, 03 May 2022 05:19:43 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 v7-20020a056402174700b004275cef32efsm4551143edx.6.2022.05.03.05.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 05:19:41 -0700 (PDT)
Message-ID: <a95fc4a9-af6b-e2c2-ef41-df9742d393de@linaro.org>
Date: Tue, 3 May 2022 14:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: mediatek: Fix optional
 reg-names for mtk,scp
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
References: <20220429211111.2214119-1-nfraprado@collabora.com>
 <20220429211111.2214119-2-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429211111.2214119-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_051946_728448_16765B4B 
X-CRM114-Status: GOOD (  18.20  )
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

T24gMjkvMDQvMjAyMiAyMzoxMSwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gVGhl
IFNDUCBoYXMgdGhyZWUgbWVtb3J5IHJlZ2lvbnM6IHNyYW0sIGwxdGNtIGFuZCBjZmcuIE9ubHkg
c3JhbSBpcwo+IHJlcXVpcmVkLCB0aGUgb3RoZXIgdHdvIGFyZSBvcHRpb25hbC4gRml4IHRoZSBk
dC1iaW5kaW5nIHNvIHRoYXQgdGhlCj4gb3B0aW9uYWwgcmVnaW9ucyBjYW4gYmUgb21pdHRlZCBh
bmQgcGFzc2VkIGluIGFueSBvcmRlci4KCk5vLCBjYW5ub3QgYmUgcGFzc2VkIGluIGFueSBvcmRl
ci4KCj4gCj4gQWxzbyBhZGQgdGhlIG1pc3NpbmcgbWluSXRlbXMgdG8gdGhlIHJlZyBwcm9wZXJ0
eSBhbmQgdXBkYXRlIHRoZQo+IGRlc2NyaXB0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE7DrWNv
bGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPiAKPiAtLS0KPiAK
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwgICAgICB8
IDEyICsrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwKPiBpbmRleCA4MjNhMjM2MjQyZGUuLmVj
OWRkZWI2Y2EyYyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwKPiBAQCAtMjQsMTQgKzI0LDIwIEBA
IHByb3BlcnRpZXM6Cj4gICAgcmVnOgo+ICAgICAgZGVzY3JpcHRpb246Cj4gICAgICAgIFNob3Vs
ZCBjb250YWluIHRoZSBhZGRyZXNzIHJhbmdlcyBmb3IgbWVtb3J5IHJlZ2lvbnMgU1JBTSwgQ0ZH
LCBhbmQKPiAtICAgICAgTDFUQ00uCj4gKyAgICAgIEwxVENNLiBPbmx5IFNSQU0gaXMgcmVxdWly
ZWQsIHdoaWxlIENGRyBhbmQgTDFUQ00gYXJlIG9wdGlvbmFsLgo+ICsgICAgbWluSXRlbXM6IDEK
PiAgICAgIG1heEl0ZW1zOiAzCj4gIAo+ICAgIHJlZy1uYW1lczoKPiArICAgIG1pbkl0ZW1zOiAx
Cj4gICAgICBpdGVtczoKPiAgICAgICAgLSBjb25zdDogc3JhbQo+IC0gICAgICAtIGNvbnN0OiBj
ZmcKPiAtICAgICAgLSBjb25zdDogbDF0Y20KPiArICAgICAgLSBlbnVtOgo+ICsgICAgICAgICAg
LSBsMXRjbQo+ICsgICAgICAgICAgLSBjZmcKPiArICAgICAgLSBlbnVtOgo+ICsgICAgICAgICAg
LSBsMXRjbQo+ICsgICAgICAgICAgLSBjZmcKClRoaXMgYWxsb3dzIHRoZW0gaW4gYW55IGNvbWJp
bmF0aW9uIHdoaWNoIGlzIG5vdCB3aGF0IHdlIHdhbnQuIElmIGJvdGgKYXJlIG9wdGlvbmFsIGFu
ZCBib3RoIGNhbiBhcHBlYXIsIHRoZW4gbGFzdCBzaG91bGQgYmUgYSBjb25zdDpsMXRjbS4KCkJl
c3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
