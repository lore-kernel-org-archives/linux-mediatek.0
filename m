Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4574AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 May 2022 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvD1Ax6vGCNDACD0l4pj5U3ijCzStOJi2/3hwwhYkT4=; b=s+86lIcuJ+fXH3
	nCXHVucTom8Q3/StmDXLZHFqg5Z3LY7GV2ha1fQ/MnKSwo2LPluLgvvSWLBCcBI6VfaCPymtWEXxs
	6r9Gg3RuciTbKcV0aypafexa2Xy0qMYO0d4iadOv0Zf0goxf5LzQnpTT300w097WLKtGKFTPuQyfq
	SZkotDfdUWYlvIbyEQF6nqYMwnJSughTeB1tzdiKt2xo0jdJ9vPXRoCvDJyudcNOKcd5mPMukOsu5
	edi5oYwi8911lXKvqMssTDFpLOFldTHKPhRMwTLK9U62rxu8UOdcKfej3gu5dfEAzKO1Ry5TD6OoM
	M8v5Vo1b0U2/KkgOZvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvDsN-003V4Y-Ke; Sun, 29 May 2022 08:02:15 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvDsI-003V3n-Tr
	for linux-mediatek@lists.infradead.org; Sun, 29 May 2022 08:02:14 +0000
Received: by mail-ed1-x529.google.com with SMTP id v25so1945497eda.6
        for <linux-mediatek@lists.infradead.org>; Sun, 29 May 2022 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UDbcZey2Qic72q7wZpZ3xzumGPDOPPDFso1OJL9a9QE=;
        b=gZn7NUJQBDiX30l4ps8Ty1Jgo+c9DBxt8rxmCX47qGVZlsNvF3/ziY8kLhwnEQmke1
         FuGjDvyAuI1I7ZLtiPhaNNolc16dzWLu2fMYwX63sYWWIGIHfBCRbVivSyQxnkefo/Bq
         SlP+PfB6EVS/SC4ABworMcY7cisT8Gfmb/7EGRN+GtJIhxMDW4aTvxPsvCHGjXv8W395
         UXVjwXk+hstu3nL6UPtGCNox5pUw9l9HaboW5JUpVxA2E5JyJTX/4O7ua02U6vA5XHcl
         qjQrRrXiDWeQJvuNLlVOn1w2R0SsJCD/Hrt8Gb2LeU9DtgXJbpjSm3xmWFM4sZBD5nib
         BLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UDbcZey2Qic72q7wZpZ3xzumGPDOPPDFso1OJL9a9QE=;
        b=23SsZxdkDdUbyeqImEx06A5oOhxbADkPepWdgdWRawPS7nSGNUh8csd5gDFiuohhj8
         n8HSyrbIMnioPzw0zHXoXiyKx4MmcjyhXF+VJIk8naHVou+cyB/MYScIh8zRdwISyF8W
         5K4F9qEpU78iA/5+zMn+JEdD9twqa9zHaKXgz0Lsg+yxr7SosJYjKIgzoJaxbbhhf1h0
         aUKwTL+sb/Qw66uHUS9dGt0TM5HDiGwzMsGzuBu2C1+qXVxkjw3xwr7dzWizxa70jzWm
         Ts1s6fxAzRYY6hJ8aNjuCgA3PqSyy2FlhrLdXc6dKa06bQeYAPQeX0XZRqbwHSmz3HkF
         /b4g==
X-Gm-Message-State: AOAM533SAcgSfR5hxh6u3UHGK0RZIzVVCXKzh5PCfPQ+T1UQDgrTPXLW
	EtNzY8ueH6p5pyyFt/XmVNCtiw==
X-Google-Smtp-Source: ABdhPJyehAc2r10hf/j2xJPy6edB19h6IE3t7+EDA/JJ+7Ogyn8k+xE2wE4zBRqodu+Al+nqDgwOSg==
X-Received: by 2002:a05:6402:6cc:b0:42d:bd2d:9f82 with SMTP id n12-20020a05640206cc00b0042dbd2d9f82mr5188023edy.59.1653811328959;
        Sun, 29 May 2022 01:02:08 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id pg7-20020a170907204700b006f3ef214dfdsm2950671ejb.99.2022.05.29.01.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 01:02:08 -0700 (PDT)
Message-ID: <21351474-56d5-6e11-314b-1599b34e3f42@linaro.org>
Date: Sun, 29 May 2022 10:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Shane Chien <shane.chien@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220509205847.607076-1-nfraprado@collabora.com>
 <e8d854c0-e2a5-2382-4b54-c5e879170324@linaro.org>
 <20220527190542.4jckyflvtkq4n7ie@notapiano>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220527190542.4jckyflvtkq4n7ie@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_010211_010570_C21B9B6F 
X-CRM114-Status: GOOD (  25.00  )
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

T24gMjcvMDUvMjAyMiAyMTowNSwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gT24g
VGh1LCBNYXkgMjYsIDIwMjIgYXQgMDg6NDk6MzlBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3Nr
aSB3cm90ZToKPj4gT24gMDkvMDUvMjAyMiAyMjo1OCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8g
d3JvdGU6Cj4+PiBUaGUgTWVkaWF0ZWsgQUZFIFBDTSBjb250cm9sbGVyIGZvciBNVDgxOTIgYWxs
b3dzIHR3byBJMlMgaW50ZXJmYWNlcyB0bwo+Pj4gc2hhcmUgdGhlIHNhbWUgY2xvY2sgYW5kIGFj
dCBhcyBhIHNpbmdsZSBpbnRlcmZhY2Ugd2l0aCBib3RoIGlucHV0IGFuZAo+Pj4gb3V0cHV0LiBB
ZGQgcGF0dGVybnMgZm9yIHRoZXNlIHByb3BlcnRpZXMgaW4gdGhlIGR0LWJpbmRpbmcuIFRoZQo+
Pj4gcHJvcGVydHkgaXMgc3BsaXQgaW50byB0d28gcGF0dGVybnMgaW4gb3JkZXIgdG8gYWxsb3cg
YWxsIHZhbGlkCj4+PiBpbnRlcmZhY2UgcGFpcmluZ3MuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+Pj4KPj4+
IC0tLQo+Pj4gVGhlIHNlcmllcyBmcm9tIHYxIG9mIHRoaXMgcGF0Y2ggd2FzIG1lcmdlZCBhbHRo
b3VnaCBzb21lIGNoYW5nZXMgd2VyZQo+Pj4gc3RpbGwgbmVlZGVkIGluIHRoaXMgcGF0Y2gsIHNv
IHRoZSB2MSBvZiB0aGlzIHBhdGNoIHdhcyByZXZlcnRlZCBbMV0gYW5kCj4+PiB0aGlzIHN0YW5k
YWxvbmUgY29tbWl0IGFkZHJlc3NlcyB0aGUgZmVlZGJhY2sgZnJvbSB2MSBhbmQgcmVhZGRzIHRo
ZQo+Pj4gcHJvcGVydHkuCj4+Pgo+Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIyMDUwOTE4NTYyNS41ODA4MTEtMS1uZnJhcHJhZG9AY29sbGFib3JhLmNvbQo+Pj4KPj4+IHYx
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA0MjkyMDMwMzkuMjIwNzg0OC0yLW5m
cmFwcmFkb0Bjb2xsYWJvcmEuY29tLwo+Pj4KPj4+IENoYW5nZXMgaW4gdjI6Cj4+PiAtIEFkZGVk
ICJtZWRpYXRlaywiIHByZWZpeCB0byBwcm9wZXJ0eQo+Pj4gLSBSZXdyb3RlIGFuZCBhZGRlZCBt
b3JlIGluZm9ybWF0aW9uIHRvIHByb3BlcnR5IGRlc2NyaXB0aW9uCj4+PiAtIFNwbGl0IGludG8g
dHdvIHBhdHRlcm5zIHRvIHZhbGlkYXRlIHRoYXQgb3V0cHV0LWlucHV0IHBhaXJpbmdzIGFyZQo+
Pj4gICBkb25lCj4+Pgo+Pj4gIC4uLi9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1s
ICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKPj4+ICAxIGZpbGUgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sCj4+PiBpbmRleCA3YTI1
YmM5YjgwNjAuLjJhYmY0M2M2YzJjMyAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sCj4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFtbAo+
Pj4gQEAgLTU0LDYgKzU0LDIyIEBAIHByb3BlcnRpZXM6Cj4+PiAgICAgICAgLSBjb25zdDogYXVk
X2luZnJhX2Nsawo+Pj4gICAgICAgIC0gY29uc3Q6IGF1ZF9pbmZyYV8yNm1fY2xrCj4+PiAgCj4+
PiArcGF0dGVyblByb3BlcnRpZXM6Cj4+PiArICAiXm1lZGlhdGVrLGkyc1sxMzU3OV0tc2hhcmUk
IjoKPj4+ICsgICAgZGVzY3JpcHRpb246Cj4+PiArICAgICAgRWFjaCBJMlMgaW50ZXJmYWNlIGhh
cyBhIHNpbmdsZSBkYXRhIGxpbmUsIGlucHV0IGlmIGl0cyBpbmRleCBpcyBldmVuIG9yCj4+PiAr
ICAgICAgb3V0cHV0IGlmIHRoZSBpbmRleCBpcyBvZGQuIEFuIGlucHV0IGFuZCBhbiBvdXRwdXQg
STJTIGludGVyZmFjZSBjYW4gYmUKPj4+ICsgICAgICB1c2VkIHRvZ2V0aGVyIGFzIGlmIHRoZXkg
d2VyZSBhIHNpbmdsZSBJMlMgaW50ZXJmYWNlIHdpdGggYm90aCBpbnB1dCBhbmQKPj4+ICsgICAg
ICBvdXRwdXQgZGF0YSBsaW5lcyBieSBzaGFyaW5nIHRoZSBzYW1lIGNsb2NrLiBUaGlzIHByb3Bl
cnR5IHJlcHJlc2VudHMgdGhpcwo+Pj4gKyAgICAgIHBhaXJpbmcuIFRoZSB2YWx1ZSBzaG91bGQg
YmUgdGhlIG5hbWUgb2YgdGhlIGludGVyZmFjZSB3aG9zZSBjbG9jayBpcwo+Pj4gKyAgICAgIHVz
ZWQsIGFuZCB0aGUgcHJvcGVydHkgbmFtZSB0aGUgb3RoZXIgaW50ZXJmYWNlIHRoYXQgZGVwZW5k
cyBvbiB0aGlzCj4+PiArICAgICAgY2xvY2suCj4+PiArICAgIHBhdHRlcm46ICJeSTJTWzAyNjhd
JCIKPj4+ICsKPj4+ICsgICJebWVkaWF0ZWssaTJzWzAyNjhdLXNoYXJlJCI6Cj4+PiArICAgIGRl
c2NyaXB0aW9uOiBTYW1lIGFzIGFib3ZlLgo+Pj4gKyAgICBwYXR0ZXJuOiAiXkkyU1sxMzU3OV0k
Igo+Pgo+PiBSb2IncyBxdWVzdGlvbiBpcyBzdGlsbCB2YWxpZCAtIHdoeSB0aGVzZSBhcmUgbm90
IHBoYW5kbGVzPwo+IAo+IFNvLCBpbnN0ZWFkIG9mIGhhdmluZwo+IAo+IAlpMnM5LXNoYXJlID0g
IkkyUzgiOwo+IAo+IG9uIHRoZSBEVCwgeW91IHdhbnQgdXMgdG8gaGF2ZSBzb21ldGhpbmcgbGlr
ZSB0aGlzOgo+IAo+ICAgICAgICAgYWZlX2kyczg6IG1lZGlhdGVrLGkyczggeyB9Owo+IAo+ICAg
ICAgICAgbWVkaWF0ZWssaTJzOSB7Cj4gICAgICAgICAgIG1lZGlhdGVrLHNoYXJlLWNsb2NrID0g
PCZhZmVfaTJzOD47Cj4gICAgICAgICB9Owo+IAo+IE9yIGRvIHlvdSBtZWFuIHNvbWV0aGluZyBl
bHNlPwoKTm90IGVudGlyZWx5LiBUaGlzIGlzIGEgYmluZGluZyBmb3IgbWVkaWF0ZWssbXQ4MTky
LWF1ZGlvLCBub3QgZm9yIEkyUzksCnNvIHRoZSBwcm9wZXJ0eSBzaG91bGQgYmUgaW4gdGhpcyBi
aW5kaW5nIHJlZmVyZW5jaW5nIHlvdXIgZXhpc3RpbmcgSTJTCmRldmljZXMuCgo+IAo+IEl0IHNl
ZW1zIGxpa2UgYSBsb3QgbW9yZSBzeW50YXggdG8gZXhwcmVzcyB0aGUgc2FtZSB0aGluZyAoYW5k
IHRoZSBlbXB0eSBub2RlCj4gc2VlbXMgYXdrd2FyZCksIGJ1dCBpZiB0aGF0J3MgdGhlIERUIHdh
eSwgSSBjYW4gY2hhbmdlIGl0IG5vIHByb2JsZW0uCgpIbSwgdGhlbiB0aGUgZm9sbG93IHVwIHF1
ZXN0aW9uOiB3aHkgeW91IGRvIG5vdCBoYXZlIGkyczggZGVmaW5lZCBpbiBEVFM/CgoKQmVzdCBy
ZWdhcmRzLApLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
