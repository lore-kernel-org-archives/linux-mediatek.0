Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAA7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 08:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGQ9IaDM79o/9yp++0BuwMvphEqlJtbYX9lIez3gkFw=; b=wCfUzL6ImE0aJX
	MthiXh8mNX9BgXsAajc8Q5+Djh15X8V1yANwy/7kWvGvH6wmqapI12yOw62b/A4M3TVzjs8KPaqkX
	Uj/Gk3cn0AuavEXAUk+yOjGQYQr8bqsmDV1ABZWPJ/Y6wTiXc3U/2wUv77YwHZVQjGFpwqcKXFVhs
	vTJUkZtTxhvG3WikJsqvK232ml0CFNSBLrqi6mR9A4tEdNUmdZEEHEU81DDxoCPJDIrQEAxLri0BM
	A7RTxZ3Xn0HIYd/JujPlk/6buoG/QD1g/z80ZF6J63PvilJ/4580hao3MtWO0YBEuOZnMoIwLRxOJ
	VUcL8uIQGjXRbbcn63FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npQSr-00EzpI-NP; Fri, 13 May 2022 08:15:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npQSp-00EzoX-Gj
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 08:15:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id t6so10378475wra.4
 for <linux-mediatek@lists.infradead.org>; Fri, 13 May 2022 01:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mTQPBz30cCLuWgIJk7/NZCaC5miWia1gCjLQnZteLLo=;
 b=y/nWzJG4Fbw8/7Hr2WEQpFWbOnZphvs3gwZ72nPwxDPJfy7dy0gJY7R2lFYGrleewa
 UvN7q6TursJjqMpYGLwvl54QyuMBBG279rXkcLYs8J8YGa9ZZh2XDKFqqevEAFoqYQ8N
 LI8AYCHjsqeJqRXdo95z9Gy5PyyEsRgzj2Hdg+VIhyTudoCxR35KZDtptDp2IZ+MQVpc
 txgGTwv9RJDpztlhSVPQRLtfIoWcXWhQ6ZkBHBOEgBUCbjl7nrhdTIGb0qpz3NDQR/8M
 eV2XuSjmdcXb+EHRGJTaJwOlpIQPvr2Uy5+yffzx+6X9wTEypxD84XizeuvKb1LDBxdJ
 N5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mTQPBz30cCLuWgIJk7/NZCaC5miWia1gCjLQnZteLLo=;
 b=XnzJl7Gu13gPX5Uihipx8QlmlGVIeUjBsDPPkAVXYKLhBjlXvh4cIbU4JkUHU+6vTk
 LNQ8wXcpfBtISXbwIjijFnblEgmee0Xv+mBQ+1I7hzABaLTdS+YVTblC1C0VxG5ClS+0
 x9COAXdI3mctMmNlEPwySUFPhBJYeRaesHhiVYvNr3IVedYpj9KZ0gbzIKSIuI2XGGO/
 IAJsPHKAOfvfYOu59y7Y3llNJMpz/R7Md81ax2Z1OEzT+L0jd3qaHVLuPPxrehtqgY8r
 meyk8azYwqet/vyHSS1Yn83Wwp+laHwbQ6wHQ2+Vm6agKmJ4EEFaUGORFFUEFgJnfqX3
 gzqQ==
X-Gm-Message-State: AOAM531T1J8JChyq6uqGANGWkLzO5MH7xj/fuxmYunAPIfLBoiwNac7/
 OIZ+0Wc+to5hcfYhNtww7jn0Xg==
X-Google-Smtp-Source: ABdhPJwXd3TWdB6hMve0fv2uJKyMa4NDpLkzRHAgkIR+esBN7x+bTCEeukkPdDda8xWohPhizuEaAw==
X-Received: by 2002:a5d:624c:0:b0:20c:d8f3:71b8 with SMTP id
 m12-20020a5d624c000000b0020cd8f371b8mr2897239wrv.670.1652429752615; 
 Fri, 13 May 2022 01:15:52 -0700 (PDT)
Received: from [192.168.0.168] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o19-20020a1c7513000000b003942a244f57sm4708291wmc.48.2022.05.13.01.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 01:15:52 -0700 (PDT)
Message-ID: <30978e5a-18ef-3ea2-8df3-3ced50f44bfc@linaro.org>
Date: Fri, 13 May 2022 10:15:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 1/2] dt-bindings: remoteproc: mediatek: Make l1tcm reg
 exclusive to mt819x
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>, Tzung-Bi Shih
 <tzungbi@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20220511195452.871897-1-nfraprado@collabora.com>
 <20220511195452.871897-2-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220511195452.871897-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_011555_597812_50D24E97 
X-CRM114-Status: UNSURE (   8.14  )
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

T24gMTEvMDUvMjAyMiAyMTo1NCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6CgpUaGFu
ayB5b3UgZm9yIHlvdXIgcGF0Y2guIFRoZXJlIGlzIHNvbWV0aGluZyB0byBkaXNjdXNzL2ltcHJv
dmUuCgo+ICAKPiAtaWY6Cj4gLSAgcHJvcGVydGllczoKPiAtICAgIGNvbXBhdGlibGU6Cj4gLSAg
ICAgIGVudW06Cj4gLSAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtc2NwCj4gLSAgICAgICAgLSBt
ZWRpYXRlayxtdDgxOTItc2NwCj4gLXRoZW46Cj4gLSAgcmVxdWlyZWQ6Cj4gLSAgICAtIGNsb2Nr
cwo+IC0gICAgLSBjbG9jay1uYW1lcwo+ICthbGxPZjoKPiArICAtIGlmOgo+ICsgICAgICBwcm9w
ZXJ0aWVzOgo+ICsgICAgICAgIGNvbXBhdGlibGU6Cj4gKyAgICAgICAgICBlbnVtOgo+ICsgICAg
ICAgICAgICAtIG1lZGlhdGVrLG10ODE4My1zY3AKPiArICAgICAgICAgICAgLSBtZWRpYXRlayxt
dDgxOTItc2NwCj4gKyAgICB0aGVuOgo+ICsgICAgICByZXF1aXJlZDoKPiArICAgICAgICAtIGNs
b2Nrcwo+ICsgICAgICAgIC0gY2xvY2stbmFtZXMKPiArCj4gKyAgLSBpZjoKPiArICAgICAgcHJv
cGVydGllczoKPiArICAgICAgICBjb21wYXRpYmxlOgo+ICsgICAgICAgICAgZW51bToKPiArICAg
ICAgICAgICAgLSBtZWRpYXRlayxtdDgxODMtc2NwCj4gKyAgICAgICAgICAgIC0gbWVkaWF0ZWss
bXQ4MTg2LXNjcAo+ICsgICAgdGhlbjoKPiArICAgICAgcHJvcGVydGllczoKPiArICAgICAgICBy
ZWc6Cj4gKyAgICAgICAgICBtYXhJdGVtczogMgo+ICsgICAgICAgIHJlZy1uYW1lczoKPiArICAg
ICAgICAgIG1heEl0ZW1zOiAyCgpJc24ndCBsMXRjbSByZXF1aXJlZCBvbiBtdDgxOXg/IE5vdyBp
dCBpcyBsZWZ0IG9wdGlvbmFsLgoKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
