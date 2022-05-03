Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D52C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eofhtb0t3KpcDUULD4x4Xoczuv7KGU+GaOFxjLpoyAY=; b=494njv8I7LorKi
	tFlaZur4eHg8ADQ2JyXZff15nUERTUw/bn/jgQ+p6p5pwStRaJAJR5TojtFRpb3db/mAVOhpzf2iF
	iTRj1zuDJCrPuMM5REUQya51szSoffHGmcIylS/NMAGnL3UBMcXb8blxUFPUwafsIo+LACihTVVrD
	o4Tt9nvnzj7Yt6ThNi2KEH6kLR6f9YuvZd5s+5k+H3iLTxjToQInXXk1lOZhQma14WV0jHPq9jNKi
	26BuBQa/RNbZbz7YGgrilBIl8hSYOcUgxAUiGDJy/yQEGglfBSXhNhRk/gYv/jQ5Rdqo963x4Ga8Z
	rPbNcjFuLep2torLXGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlrWP-005jcm-8e; Tue, 03 May 2022 12:20:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlrWL-005jYZ-TP
 for linux-mediatek@lists.infradead.org; Tue, 03 May 2022 12:20:51 +0000
Received: by mail-ed1-x532.google.com with SMTP id g23so19613818edy.13
 for <linux-mediatek@lists.infradead.org>; Tue, 03 May 2022 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ATypDYM1Hgw+JVW3PULzGTbDtRMsM1D9mY5duLSApB8=;
 b=nTPHWz/N33wHk9/lw+L2kBwXpj5x0zVfhGA+f3kH4W/aXt6VouU0DMNzNmUjp5XfrE
 K76y2ic2byO67ladLMh+lxvi8IP+l/ePGavIhGKhT34T3glgPwr6fVBHRd9ZREtsB92g
 AJhWF1SLB90XBjVer6ZUVlmFBilUfU9osp2fD2TokRZJkojd7JQZig44vqLztvKrdCHM
 +54+fXN91uESKdnk8igkoV5CMxPBB4wuyZ2HcwbA+5qI2xpiuRmagbpTCZ6YADyAYlxd
 hAK8nHs25AEdRh7P5sGbG+iXN7r2w2u1SmZodHKtmbK2obcrZOTSH4vucwYamdWF6RJZ
 vXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ATypDYM1Hgw+JVW3PULzGTbDtRMsM1D9mY5duLSApB8=;
 b=RUdA0uzP4FnDx1ETMslmkHu3UsdVaggXUMYVRBuKP0TZMmYNI8wc7lb/sYcTQ14PjG
 GuMpGSK4/tCU04MKT3ROM7ugfYRa+3T4klNEKWwSWk5/b6jGoSQftAl7cg1MLVQXcz6h
 NvmBbxNTJ1si84zPiDFESzPEzOAmIYHbkYQ6YbpIFHAiWQlqT7QxqDtvcfxB8mmzs0qh
 in53T0hj4JVoD3zdWFuI2rAQj2VybTFjtIGrMLtQM+ly8hkeMBXS19ly7HB2SCq5Lvic
 SV4l9CRJWUMTVuU1ScH3NnjNTlyHXKuzRj8r8yUQRQvs5gcxZF+R1ncBvlrRSMM6lWS7
 wBeg==
X-Gm-Message-State: AOAM530PPfB+V8IoL2fe6xwaipZRTUkoVI0w0YkBJW8JP+h4yy8U8KfZ
 24xzP4avluuKhr+x3YdtO/VR5w==
X-Google-Smtp-Source: ABdhPJwPIztAKjsTj9360EQjP1NOUrsVE200KUaRbSlAtUqgg3AOW7qipEdvW2qW35onBNwtlqtoJg==
X-Received: by 2002:aa7:d842:0:b0:425:f329:33b1 with SMTP id
 f2-20020aa7d842000000b00425f32933b1mr17829071eds.74.1651580446747; 
 Tue, 03 May 2022 05:20:46 -0700 (PDT)
Received: from [192.168.0.203] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f3ef214e0esm4543127ejc.116.2022.05.03.05.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 05:20:46 -0700 (PDT)
Message-ID: <c3789226-849f-4a90-d68a-d0e46763c8ee@linaro.org>
Date: Tue, 3 May 2022 14:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: mediatek: Fix optional
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
References: <20220502192420.2548512-1-nfraprado@collabora.com>
 <20220502192420.2548512-2-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220502192420.2548512-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_052049_977722_6BFBF625 
X-CRM114-Status: GOOD (  18.81  )
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

T24gMDIvMDUvMjAyMiAyMToyNCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gVGhl
IFNDUCBoYXMgdGhyZWUgbWVtb3J5IHJlZ2lvbnM6IHNyYW0sIGwxdGNtIGFuZCBjZmcuIE9ubHkg
c3JhbSBpcwo+IHJlcXVpcmVkLCB0aGUgb3RoZXIgdHdvIGFyZSBvcHRpb25hbC4gRml4IHRoZSBk
dC1iaW5kaW5nIHNvIHRoYXQgdGhlCj4gb3B0aW9uYWwgcmVnaW9ucyBjYW4gYmUgb21pdHRlZCBh
bmQgcGFzc2VkIGluIGFueSBvcmRlci4KCkkgY29tbWVudGVkIGZvciB2MSAtIG9yZGVyIGlzIHN0
cmljdCwgc28gbm8gZm9yIHRoaXMgY2hhbmdlLgoKPiAKPiBBbHNvIGFkZCB0aGUgbWlzc2luZyBt
aW5JdGVtcyB0byB0aGUgcmVnIHByb3BlcnR5IGFuZCB1cGRhdGUgdGhlCj4gZGVzY3JpcHRpb24u
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bj
b2xsYWJvcmEuY29tPgo+IAo+IC0tLQo+IAo+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+IAo+ICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCAgICAgIHwgMTIg
KysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbAo+IGluZGV4IDgyM2EyMzYyNDJkZS4uZWM5ZGRl
YjZjYTJjIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
ZW1vdGVwcm9jL210ayxzY3AueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbAo+IEBAIC0yNCwxNCArMjQsMjAgQEAgcHJv
cGVydGllczoKPiAgICByZWc6Cj4gICAgICBkZXNjcmlwdGlvbjoKPiAgICAgICAgU2hvdWxkIGNv
bnRhaW4gdGhlIGFkZHJlc3MgcmFuZ2VzIGZvciBtZW1vcnkgcmVnaW9ucyBTUkFNLCBDRkcsIGFu
ZAo+IC0gICAgICBMMVRDTS4KPiArICAgICAgTDFUQ00uIE9ubHkgU1JBTSBpcyByZXF1aXJlZCwg
d2hpbGUgQ0ZHIGFuZCBMMVRDTSBhcmUgb3B0aW9uYWwuCj4gKyAgICBtaW5JdGVtczogMQo+ICAg
ICAgbWF4SXRlbXM6IDMKPiAgCj4gICAgcmVnLW5hbWVzOgo+ICsgICAgbWluSXRlbXM6IDEKPiAg
ICAgIGl0ZW1zOgo+ICAgICAgICAtIGNvbnN0OiBzcmFtCj4gLSAgICAgIC0gY29uc3Q6IGNmZwo+
IC0gICAgICAtIGNvbnN0OiBsMXRjbQo+ICsgICAgICAtIGVudW06Cj4gKyAgICAgICAgICAtIGwx
dGNtCj4gKyAgICAgICAgICAtIGNmZwo+ICsgICAgICAtIGVudW06Cj4gKyAgICAgICAgICAtIGwx
dGNtCj4gKyAgICAgICAgICAtIGNmZwoKTm9wZS4KCj4gIAo+ICAgIGNsb2NrczoKPiAgICAgIGRl
c2NyaXB0aW9uOgoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
