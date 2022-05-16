Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F093C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mf/DlSgXhKobMgzH4iqgfvPlgl5zeaIzrQqtGqdCJgg=; b=sv2EJDVWDO/seq
	ZWzLVv4G+ZDIsz4UuTidniqasuvTtHlgr65JMakX7O6D8U8mYw1KBHWAnTxWtbdBs2Pywd22mDNpt
	cI3bITMBjgciO3zOGJIXXEi2VSp6fWBWFvZpEGA8GhQFsLsB12sgyjkHHrS8pjf3krlvUGVKrYNSB
	c2IU+Jz9ihLEuJnx+GDCIJSZt6Nqp475vKorktaBq/p1Ky30oyOlfIb+yiBHiAccmjD3k6moUHOMD
	myDaWm+83dl1Gyr2d7EglhmDx2T/LDI0Pkekm5ZqEkLf6BrKyDP9Uw1rvTorgHTiojePtuhuCB3Ht
	XWkwgmlETgTsOC2yVszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqc1h-008Rnv-Cw; Mon, 16 May 2022 14:48:49 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqc1V-008Rjp-77
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 14:48:38 +0000
Received: by mail-ej1-x62d.google.com with SMTP id ch13so29096011ejb.12
 for <linux-mediatek@lists.infradead.org>; Mon, 16 May 2022 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pFiYrDI2KIk/lu+aID8s/T/vZWJ+Pf0jeglf1Qmti9o=;
 b=VZeFthn0/+Mkzq95FEWhHGeRBLt9ztigE/j/mkGPyMCgjj2hS3+s0bPTWUhaUMSowz
 +Y4SA+s45rp/kkwNngSt5sE+MtI48OukedYMYYlS5THImNtpFopQ/pw7es4dNn8zT+fy
 +ElPBay/aVvcfgCjyEX3cuTM5A8Lik1hLDyzUTmOTDGUN+ir1qyXB69T9psUqx7Ahx+M
 YOUEbuLttrp3s7fVSgeT1wrO2lKZ9llsuaGi1beg4ZEfAs71W72ow4W2l5jtLHPAcBRP
 Jx7IMw+CSsHfQjd4fhsHYYjMFqQ998LB1sKM2jcO43xcVnddEWmHxTMm09WtRnUgECzy
 2d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pFiYrDI2KIk/lu+aID8s/T/vZWJ+Pf0jeglf1Qmti9o=;
 b=wwqKvc9ejtmWb2JAxG3m3HQ0yPeORHijIN17GIheR6OTY0sdonzkc6PgkHdMTeZeIn
 kGVcxdtEtvxeVm77EyrAOYeoTl/Tke6OA+Nt279rDfNuqwnE8UaFVTF2zzJRKoGHD4Nn
 mBFSslCm/q4SmHwi7bomfy81SZtt9h6McSFBx9iGQYKlK7zs6U3fW2/kvnjHmW14lFWY
 VyIFB9h+vc6EyIjw/taXLhnDXSEaq19QvLADGgl+XYkYlyGhcdr5jCHEp8bkmuqxanZI
 Ogtmdas/ib6SRIogd1sevfgMZOr3QmCiJmRVf2vuR9s3x1fnqBCs0TjVr4XaXgRazhfv
 WR9g==
X-Gm-Message-State: AOAM532gAfCpj0w+ocnVHuDCbDoNZzw4AmofiYBGeHoPU5MgWqc7Rgc/
 pIHZFxSpngYCM4gYDw3rFHzXaA==
X-Google-Smtp-Source: ABdhPJw+z3a4IS51Rh/2SPddsW0nZC5uDNxcK5FVTvU3AbHCQxPKbc9PunOYp96fOKe4UpFZaSKAnA==
X-Received: by 2002:a17:907:e90:b0:6f4:cbc8:41bc with SMTP id
 ho16-20020a1709070e9000b006f4cbc841bcmr16005231ejc.536.1652712512721; 
 Mon, 16 May 2022 07:48:32 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 en8-20020a17090728c800b006f3ef214e0bsm3787988ejc.113.2022.05.16.07.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 07:48:32 -0700 (PDT)
Message-ID: <4b58f725-3bc6-d537-ca02-cb2a753227c0@linaro.org>
Date: Mon, 16 May 2022 16:48:31 +0200
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
X-CRM114-CacheID: sfid-20220516_074837_346115_27D12195 
X-CRM114-Status: GOOD (  12.41  )
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

T24gMTEvMDUvMjAyMiAyMTo1NCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gQ29t
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
aW5kaW5nIHNvIHRoYXQgdGhlIGwxdGNtIHJlZyBjYW4gYmUgcHJlc2VudCBvbmx5IG9uIHRoZQo+
IHN1cHBvcnRlZCBwbGF0Zm9ybXM6IG10ODE5MiBhbmQgbXQ4MTk1Lgo+IAo+IEZpeGVzOiA1MDNj
NjRjYzQyZjEgKCJkdC1iaW5kaW5nczogcmVtb3RlcHJvYzogbWVkaWF0ZWs6IGFkZCBMMVRDTSBt
ZW1vcnkgcmVnaW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8
bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2NToKPiAt
IE1hZGUgbDF0Y20gb3B0aW9uYWwgZm9yIG10ODE5Mi9tdDgxOTUKPiAtIEdyZWF0bHkgc2ltcGxp
ZmllZCB0aGUgY29uc3RyYWludHMgb3ZlcnJpZGUgaW4gdGhlIGlmOnRoZW46Cj4gLSBVcGRhdGVk
IGNvbW1pdCBtZXNzYWdlCj4gCgoKUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
