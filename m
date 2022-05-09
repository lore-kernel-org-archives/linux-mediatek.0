Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA52C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 10:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hxprw1r2/UqZGBGaM1xAFJJELWbaKdv9l9vJWfPvwvk=; b=TMhXEboGgWGWRq
	myoZ3AZYSJCiPzcoP+1SnvvfLmV0cmgSQjMEHHqSljHtxZvsjJxCtUgvXckItS1Q/+dh1TKWcDG3m
	4xmG0PeslryKh1zyFtS+LuWx5kPEuTRgARLu7ONirE+6WoglH0U2KrXlK6Yrwqk4PsGFF+jQR11nO
	0bO/nokvCMYvdJAJCwRu4fzt/Ql1csl30QsfU5ABe7zZ1V+HL9Zd2sgK6725Qt561EpzKspQTs1+i
	UA/HbCTyzyM8l87hEbpvXyGerXlw2yFls6NxJLwLQ4aCKTwXuuCKL/JjzE9/Kw5pCf8sH0E5MQng4
	YYpearRyKAqfxMalfQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no0sz-00DqMr-HI; Mon, 09 May 2022 10:45:05 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no0sj-00DqFV-0d
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 10:44:54 +0000
Received: by mail-ed1-x531.google.com with SMTP id g23so15757944edy.13
 for <linux-mediatek@lists.infradead.org>; Mon, 09 May 2022 03:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=M2N9dAOBTm5M6ZFIRAQY9u+xLQ0LwoCVpAUO7hGxwek=;
 b=Pk61C9v83GjAFziN/8+zsxk25G08lVx7cudhCioDNnXyrKIV1KL4djTZVp1DChfx5p
 FcWhQhBnsOAoooH2GOHBO8y+b5gmnYM8odQNXrQhYNxHTYOQi+WHI88u0Du0Fs77HD5A
 HbqcS7wB3CVVilddsZh45uc1iu1GSP6fDMRjYfoK0Mp9G6/Cw1qpGJP23+cUTOUBSMuN
 EVU+x8T8/cT/LL02P0M9oWcT8go75notJSjcBirQkdAt8Jegk1EbMEzBnBdiExmn+RuY
 WwEBLj5ehki+d0K/MTG8ep6LT9iuLqfT8LcjJGXlEaWzS5zi3GnytzfmpMn5jup/xEcI
 Xp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M2N9dAOBTm5M6ZFIRAQY9u+xLQ0LwoCVpAUO7hGxwek=;
 b=1I4oTfHtgMEDvvowbhkniNSCobKL7y9aa/3l2wDG2EPvY0JvyeLrPdtfgoLpkSWgBK
 EqYt2yQh5Ae2rp9b6Siax1s5ltCoReG+pN9Zr0iXCIoJpCypvUcLWjlweGhrmGKp0xDY
 1eAnBPVCeQl1xx1dlTVjrjgyLagUbRCDGtiinc3Mdbmv3weyZzxFgcVKqdVDxHZ9D/Kz
 N/Vge/G712roimZLYSqO8JCeTeGYpEX7rxWNAuZSaZuyM2g9WuxMgZvB05VKnS0x9/fl
 EAibpRii/1Ifx7rnXXpnwdxdfXZ0mvf9Yn4WAAkvWFare6x+tmqq68AodmehWZKgTinU
 YcsA==
X-Gm-Message-State: AOAM530GL3PbJ89Pqup0wbSZp+2Cczzvdmepmh18uNSPNuZ+GhNHekDR
 DFhM+V8MK9BaHEPbhm5FsjqZhw==
X-Google-Smtp-Source: ABdhPJzzU6EC/aUpRD8D0fRRVVTzWv0vos1RTFGbs9TdRMKFyYlif1jkB+mJxvflJy3XSnfkDqFDeA==
X-Received: by 2002:a05:6402:2397:b0:426:4967:8574 with SMTP id
 j23-20020a056402239700b0042649678574mr15621823eda.197.1652093085832; 
 Mon, 09 May 2022 03:44:45 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 e15-20020a50e44f000000b0042617ba63c7sm6152351edm.81.2022.05.09.03.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 03:44:45 -0700 (PDT)
Message-ID: <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
Date: Mon, 9 May 2022 12:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
 <46bc32df-e4e8-ac47-426d-8056714f0d5c@linaro.org>
 <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_034449_097844_61FC712F 
X-CRM114-Status: GOOD (  10.56  )
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

T24gMDkvMDUvMjAyMiAxMDo1NCwgUmV4LUJDIENoZW4gd3JvdGU6Cj4+PiArICAgIHNvYyB7Cj4+
PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPj4+ICsgICAgICAgICNzaXplLWNlbGxz
ID0gPDI+Owo+Pj4gKwo+Pj4gKyAgICAgICAgZGlzcF9ldGhkckAxYzExNDAwMCB7Cj4+Cj4+IE5v
IHVuZGVyc2NvcmVzIGluIG5vZGUgbmFtZS4gR2VuZXJpYyBub2RlIG5hbWVzLCBzbyBkaXNwbGF5
LQo+PiBjb250cm9sbGVyPwo+Pgo+IAo+IE9LLCB3ZSB3aWxsIGNoYW5nZSB0aGUgbm9kZSBuYW1l
IHRvIGV0aGRyIGxpa2UgaW4gZHRzCj4gbGlrZSB0aGlzOgo+IGV0aGRyMDogZXRoZHJAMWMxMTQw
MDAgewo+IC4uLgo+IH0KCklzICJldGhkciIgYSBnZW5lcmljIG5hbWU/IElzIGl0IGFuIGFiYnJl
dmlhdGlvbiBvZiAiRW5lcmd5VHJhY2XihKIgSGlnaApEeW5hbWljIFJhbmdlIj8gSWYgeWVzLCBp
dCBhbHNvIGxvb2tzIHNwZWNpZmljIHRvIFRleGFzIEluc3RydW1lbnRzLi4uCgpCZXN0IHJlZ2Fy
ZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
