Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2EEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 06:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GaPRMu1eqKl8L3PV23NoRPlNyM9jK8/tzNBIT7Guiuw=; b=xeacLqwqeGQEs9
	DduKwF3Jd2A0Gb0hj2nsYoAr6JtM3zF2ubK5bltivOdGruLpZ8AH4qwbaylbH9NnfV1+utk9eoVWa
	8jo2IKwMPBzrQSM4EF3kN6iLUO4RnTxqwt1r61OASLw7fjtvqFzNeBHiRvAglnX2IkVp0Nw5+/dN1
	93TK1o8cMb7eUg4GLvxJfxfzl/kKVr1Ns9pnpQtf3LWlS1aJuVMthvGYj4dFO6AV2TSCbTWZNvmKU
	TP4LssAwiZ88rt8T78e74aiMEgfOE8g8Y2YwLiZdj4eW3XraQ4Ng+YgCwInq0VsyrIfCNWDOn7DP2
	qy2DI73S/506bpk1MVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu7Ja-00DeVH-Fi; Thu, 26 May 2022 06:49:46 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu7JX-00DeUe-MW
	for linux-mediatek@lists.infradead.org; Thu, 26 May 2022 06:49:45 +0000
Received: by mail-ed1-x52e.google.com with SMTP id q15so659512edb.11
        for <linux-mediatek@lists.infradead.org>; Wed, 25 May 2022 23:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7Bp9SA/1hFvtEI6hsrX+GVTXLacAaxb75saSLRSbPUs=;
        b=lZ0UFWMJZR/ScahCDhnrsdiqEMBsXhaUmxwPQYz8kGSkmNB/cfqAcxnwTVkp9xj0aE
         lsCoXp+eBgAG94q60rWQbm2Ev46NKSs7L0YuVDnsOuzPOSZw4gGFoRmjwrwitLfc/Q1u
         th3CE0lwu0KKph3kbzIli9VSAOxfe3FBTYhkQfWCArBTLj/bSslh3I5HWo53/4LUlp2Y
         EFr6Ux9jj1yIdsZLQ2Z0OF4eeKYkdllzrL3pr3b5ZFiR05utU1Q22S/gN01NaCibu8uA
         QiX4cooIXHCpWZc2KVRtRA0YzG91KtsCjTK6OcNFkVXfJD9Gs0VagoIP14zE/x1qcvgX
         f50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7Bp9SA/1hFvtEI6hsrX+GVTXLacAaxb75saSLRSbPUs=;
        b=AUzuxEeOrS3KhyZ+YB1InIc53ct90jFqaWjumQF+h5Fgr0KLCa/VciLTPh63SmJVoU
         23dLRW1/JWsjgtsg4cCwbwQWqQEUsKOjBed2tMqhgSbQzQgF5MxiJPKN1IBmvLOaZ0Pu
         fCFvCxIHbNrMr5ODNR5e+KiJuUq2aNBWkPny+s+AQr18cg/Z7xqR5O3p1o7W4z9k2UMC
         75v2dikNo2MTtowSmLm0wlZZ+q60ickVFwRD/ffb8Bc8dYQyLy7vT3aEp7QEHwfl1pas
         5gqEKdDaHw7AOhIDXiou41Q34UufEsDnOzTzhnh4IdYEjNB43srsq5UwzwHcpFS/CpTk
         +vMw==
X-Gm-Message-State: AOAM533Y6cF2xMTqxIvseNRH1wKNfZtTUGtTQeXle46xefVClLC8I2Pu
	3GOcc3Kq/NDnbRhY5DEqzvll5g==
X-Google-Smtp-Source: ABdhPJwr6AzAilZdcZEXaEVY/WvgakJfBGOFvOc7ZLnxseNZb9svTt9d2Rn3vt0YkLTvjnYO5aqOqg==
X-Received: by 2002:aa7:c4d0:0:b0:42a:ce47:e9c5 with SMTP id p16-20020aa7c4d0000000b0042ace47e9c5mr37950139edr.224.1653547781831;
        Wed, 25 May 2022 23:49:41 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id kq21-20020a170906abd500b006f3ef214e0csm225570ejb.114.2022.05.25.23.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 23:49:41 -0700 (PDT)
Message-ID: <e8d854c0-e2a5-2382-4b54-c5e879170324@linaro.org>
Date: Thu, 26 May 2022 08:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Shane Chien <shane.chien@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220509205847.607076-1-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220509205847.607076-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_234943_832939_1CA191E4 
X-CRM114-Status: GOOD (  22.19  )
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

T24gMDkvMDUvMjAyMiAyMjo1OCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gVGhl
IE1lZGlhdGVrIEFGRSBQQ00gY29udHJvbGxlciBmb3IgTVQ4MTkyIGFsbG93cyB0d28gSTJTIGlu
dGVyZmFjZXMgdG8KPiBzaGFyZSB0aGUgc2FtZSBjbG9jayBhbmQgYWN0IGFzIGEgc2luZ2xlIGlu
dGVyZmFjZSB3aXRoIGJvdGggaW5wdXQgYW5kCj4gb3V0cHV0LiBBZGQgcGF0dGVybnMgZm9yIHRo
ZXNlIHByb3BlcnRpZXMgaW4gdGhlIGR0LWJpbmRpbmcuIFRoZQo+IHByb3BlcnR5IGlzIHNwbGl0
IGludG8gdHdvIHBhdHRlcm5zIGluIG9yZGVyIHRvIGFsbG93IGFsbCB2YWxpZAo+IGludGVyZmFj
ZSBwYWlyaW5ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8
bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gCj4gLS0tCj4gVGhlIHNlcmllcyBmcm9tIHYxIG9m
IHRoaXMgcGF0Y2ggd2FzIG1lcmdlZCBhbHRob3VnaCBzb21lIGNoYW5nZXMgd2VyZQo+IHN0aWxs
IG5lZWRlZCBpbiB0aGlzIHBhdGNoLCBzbyB0aGUgdjEgb2YgdGhpcyBwYXRjaCB3YXMgcmV2ZXJ0
ZWQgWzFdIGFuZAo+IHRoaXMgc3RhbmRhbG9uZSBjb21taXQgYWRkcmVzc2VzIHRoZSBmZWVkYmFj
ayBmcm9tIHYxIGFuZCByZWFkZHMgdGhlCj4gcHJvcGVydHkuCj4gCj4gWzFdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDIyMDUwOTE4NTYyNS41ODA4MTEtMS1uZnJhcHJhZG9AY29sbGFi
b3JhLmNvbQo+IAo+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA0MjkyMDMw
MzkuMjIwNzg0OC0yLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tLwo+IAo+IENoYW5nZXMgaW4gdjI6
Cj4gLSBBZGRlZCAibWVkaWF0ZWssIiBwcmVmaXggdG8gcHJvcGVydHkKPiAtIFJld3JvdGUgYW5k
IGFkZGVkIG1vcmUgaW5mb3JtYXRpb24gdG8gcHJvcGVydHkgZGVzY3JpcHRpb24KPiAtIFNwbGl0
IGludG8gdHdvIHBhdHRlcm5zIHRvIHZhbGlkYXRlIHRoYXQgb3V0cHV0LWlucHV0IHBhaXJpbmdz
IGFyZQo+ICAgZG9uZQo+IAo+ICAuLi4vYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFt
bCAgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1hZmUtcGNtLnlhbWwKPiBpbmRleCA3YTI1YmM5Yjgw
NjAuLjJhYmY0M2M2YzJjMyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sCj4gQEAgLTU0LDYg
KzU0LDIyIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIC0gY29uc3Q6IGF1ZF9pbmZyYV9jbGsKPiAg
ICAgICAgLSBjb25zdDogYXVkX2luZnJhXzI2bV9jbGsKPiAgCj4gK3BhdHRlcm5Qcm9wZXJ0aWVz
Ogo+ICsgICJebWVkaWF0ZWssaTJzWzEzNTc5XS1zaGFyZSQiOgo+ICsgICAgZGVzY3JpcHRpb246
Cj4gKyAgICAgIEVhY2ggSTJTIGludGVyZmFjZSBoYXMgYSBzaW5nbGUgZGF0YSBsaW5lLCBpbnB1
dCBpZiBpdHMgaW5kZXggaXMgZXZlbiBvcgo+ICsgICAgICBvdXRwdXQgaWYgdGhlIGluZGV4IGlz
IG9kZC4gQW4gaW5wdXQgYW5kIGFuIG91dHB1dCBJMlMgaW50ZXJmYWNlIGNhbiBiZQo+ICsgICAg
ICB1c2VkIHRvZ2V0aGVyIGFzIGlmIHRoZXkgd2VyZSBhIHNpbmdsZSBJMlMgaW50ZXJmYWNlIHdp
dGggYm90aCBpbnB1dCBhbmQKPiArICAgICAgb3V0cHV0IGRhdGEgbGluZXMgYnkgc2hhcmluZyB0
aGUgc2FtZSBjbG9jay4gVGhpcyBwcm9wZXJ0eSByZXByZXNlbnRzIHRoaXMKPiArICAgICAgcGFp
cmluZy4gVGhlIHZhbHVlIHNob3VsZCBiZSB0aGUgbmFtZSBvZiB0aGUgaW50ZXJmYWNlIHdob3Nl
IGNsb2NrIGlzCj4gKyAgICAgIHVzZWQsIGFuZCB0aGUgcHJvcGVydHkgbmFtZSB0aGUgb3RoZXIg
aW50ZXJmYWNlIHRoYXQgZGVwZW5kcyBvbiB0aGlzCj4gKyAgICAgIGNsb2NrLgo+ICsgICAgcGF0
dGVybjogIl5JMlNbMDI2OF0kIgo+ICsKPiArICAiXm1lZGlhdGVrLGkyc1swMjY4XS1zaGFyZSQi
Ogo+ICsgICAgZGVzY3JpcHRpb246IFNhbWUgYXMgYWJvdmUuCj4gKyAgICBwYXR0ZXJuOiAiXkky
U1sxMzU3OV0kIgoKUm9iJ3MgcXVlc3Rpb24gaXMgc3RpbGwgdmFsaWQgLSB3aHkgdGhlc2UgYXJl
IG5vdCBwaGFuZGxlcz8KCkluIGFueSBjYXNlIHlvdSBtaXNzICRyZWYuCgoKQmVzdCByZWdhcmRz
LApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
