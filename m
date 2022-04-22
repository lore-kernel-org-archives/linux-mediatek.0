Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97593C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 15:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6TsLKjRN0Pfee5yvlQfWk/i/Gm6RXPx2E5todQmQJk=; b=yGTAl2vejPSSze
	Mti7iIM5kGROQJgFy0XAA80fqbSvX66BS3zdmrNW8HbhidlR6axk6p0kBN1U4W0pq+LpMGq75MKp8
	nvh9Hq3vWwjYwhUxW1koU3ScXa4H93LrRM+QwaOy2KN3MyIs6vxJD/Chc5f6TqbNGnFkLG5c2durR
	eN13vifJ657sJ+LoMy/lfOV0Pe19Nb1sAA0FNXy/PwvXVJbrYat7Ibf7XNVZEW3gX16Rq4h0Y6daQ
	THg1WVdO4zYD7NCmDcvST2YXYpDHZUQV9MXcunSlG5Hxtxu/pVGYnCAtNDiXjCuQm3OqmbD6IKybm
	Ms5ip6GldsEtWW28YlPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhvOn-001AFl-FN; Fri, 22 Apr 2022 15:40:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhvOa-001A8q-Ag; Fri, 22 Apr 2022 15:40:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so5590192wmn.1; 
 Fri, 22 Apr 2022 08:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ES0l6S93mE+Wb+3kqpTJgwQ5QqgD39UykyyH0mPFa1A=;
 b=eAJDeSA5ES65uo2n7FwOPrhjMXpb1/30wYGIYDKU1AzFS1Oqvazunp1Lgruo6FULJd
 N1IB7K2+Ifwa9kYQkwb3cmGFVMpYNerQIo6Xf5XWsYkCezu38OlPmhnwNMBTL/W5oCn2
 L75ox71Pu3LZ/UYtIbm1TWt+gVsRU+MzQneRGct7i/4SWy81zHrPejYrVdeI/YMaPpPx
 HmXn74qleRfqwuZZ2MVnbuefcR2uqjqw5yZFHI09alDi/A25qW1nE0me6ZBWB4tJciqf
 3h4tTceozSY5WFT6wJ/px99wf0HGPFeQ2Mvngrekpv9MRQunqTkTNZxTeL/FkV9IMbNe
 XHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ES0l6S93mE+Wb+3kqpTJgwQ5QqgD39UykyyH0mPFa1A=;
 b=RjAZHashVbRvjJPCxnMWRdU2U0hgPaW7KyaFH0hLDbCakVXvma5mfCz3N20OAVkgvV
 hcrfXJORXxFvltYcK+WR15DiYnN1bfTqVndUY++hGfHoXG7/1lW0K2VqKkrAlXyUKabp
 D4D1nkv6KfOx9ZFRT7Rl/JVmqBT2DVRINkoQOa/zYpdLJ3bPWZTJ2OKFbLhVaEfUwVHu
 RMIb45KZ2QetRKX7tLr5T7H4t+kOk0z+qX7kXbASu9B+GNVVbpf9+Q89Ow/62jjtT8ki
 NoA/VnpeUYWn3kJ8mCJdLRH6WXttAc1hOOKq4FzFCU1wxv0z71E/+VtXkA4qJgpB3NdU
 dQlA==
X-Gm-Message-State: AOAM531hgRf9NEsLLnOv2hn/uEV46UmqH17rXpt3MPisvyxuIhuyOf07
 4Ac72c/IOUkt25+QAdd9bcs=
X-Google-Smtp-Source: ABdhPJyTYQRjuZT+Ec8SM434CWQGeFUn2UkQ3zQWg/RiYa7Z+9pAMLI2nF/jZpTCnEOzRThwH++fmg==
X-Received: by 2002:a05:600c:1e1e:b0:38e:baaa:aae0 with SMTP id
 ay30-20020a05600c1e1e00b0038ebaaaaae0mr4563460wmb.157.1650642029069; 
 Fri, 22 Apr 2022 08:40:29 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056000168b00b0020a919422ccsm2434199wrd.109.2022.04.22.08.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:40:28 -0700 (PDT)
Message-ID: <9a766c52-f085-0ce4-5072-5a602e533740@gmail.com>
Date: Fri, 22 Apr 2022 17:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/3] Fixes for Mediatek dt-bindings
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 "N?colas F. R. A. Prado" <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
References: <20220225225854.81038-1-nfraprado@collabora.com>
 <20220404152256.mkksr4oqjt65ytlf@notapiano> <YmLGyIOStJJAGSJG@builder.lan>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <YmLGyIOStJJAGSJG@builder.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_084032_414968_63407743 
X-CRM114-Status: GOOD (  17.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAyMi8wNC8yMDIyIDE3OjE2LCBCam9ybiBBbmRlcnNzb24gd3JvdGU6Cj4gT24gTW9uIDA0
IEFwciAxMDoyMiBDRFQgMjAyMiwgTj9jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90ZToKPiAKPj4g
SGkgTWF0dGhpYXMsCj4+Cj4+IE1heWJlIHlvdSBjb3VsZCBwaWNrIHRoaXMgc2VyaWVzIHRocm91
Z2ggeW91ciB0cmVlPyBJdCBhZGRyZXNzZXMgc29tZSBkdGMKPj4gd2FybmluZ3MgdGhhdCBhcmUg
aW50cm9kdWNlZCB3aXRoIHRoZSBuZXcgbm9kZXMgaW4gbXQ4MTkyLmR0c2kgdGhhdCB5b3UganVz
dAo+PiBwaWNrZWQgdXAgb24geW91ciB2NS4xOC1uZXh0L2R0czY0IGJyYW5jaC4KPj4KPiAKPiBJ
IGRvbid0IHNlZSBhIHJlcGx5IGZyb20gTWF0dGhpYXMsIHNvIEkndmUgcGlja2VkIHVwIHRoaXMg
KHRoZQo+IHJlbW90ZXByb2MpIGZpeCBpbiBvdXIgdHJlZS4KPiAKClRoYXQncyB0b3RhbGx5IGZp
bmUuIEknbSByZWx1Y3RhbnQgdG8gdGFrZSByYW5kb20gZHQtYmluZGluZyBwYXRjaGVzIGFzIGl0
IGNhbiAKcHJvdm9rZSBtZXJnZSBjb25mbGljdHMgd2hlbiB0aGVyZSBhcmUgb3RoZXIgcGF0Y2hl
cyBvbiB0aGUgc2FtZSBiaW5kaW5nIHRha2VuIApieSB0aGUgZHJpdmVyIG1haW50YWluZXIuIE5v
cm1hbGx5IEkgbGVhdmUgaXQgdG8gdGhlIGRyaXZlciBtYWludGFpbmVyIHRvIHRha2UgCnN1Y2gg
a2luZCBvZiBwYXRjaGVzLgoKUmVnYXJkcywKTWF0dGhpYXMKCj4gVGhhbmtzLAo+IEJqb3JuCj4g
Cj4+IFRoYW5rcywKPj4gTsOtY29sYXMKPj4KPj4gT24gRnJpLCBGZWIgMjUsIDIwMjIgYXQgMDU6
NTg6NTFQTSAtMDUwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4+Pgo+Pj4gVGhp
cyBzZXJpZXMgaGFzIHNvbWUgZml4ZXMgZm9yIE1lZGlhdGVrIGR0LWJpbmRpbmdzLiBJdCBzb2x2
ZXMgc29tZQo+Pj4gd2FybmluZ3MgcHJpbnRlZCBieSBkdGJzX2NoZWNrLCBib3RoIGZvciBhbHJl
YWR5IG1lcmdlZCBEZXZpY2V0cmVlcywgYXMKPj4+IHdlbGwgYXMgc29tZSB0aGF0IHdvdWxkIGJl
IGludHJvZHVjZWQgYnkgdGhlIGNoYW5nZXMgdG8gbXQ4MTkyLmR0c2kgaW4KPj4+IFsxXS4KPj4+
Cj4+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwMjE4MDkxNjMzLjkzNjgt
MS1hbGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20vCj4+Pgo+Pj4KPj4+IE7DrWNvbGFzIEYuIFIu
IEEuIFByYWRvICgzKToKPj4+ICAgIGR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazog
QWRkIGludGVycnVwdHMgcHJvcGVydHkgdG8gbXRrLHNjcAo+Pj4gICAgZHQtYmluZGluZ3M6IHVz
YjogbXRrLXhoY2k6IEFsbG93IHdha2V1cCBpbnRlcnJ1cHQtbmFtZXMgdG8gYmUKPj4+ICAgICAg
b3B0aW9uYWwKPj4+ICAgIG1lZGlhOiBkdC1iaW5kaW5nczogbXRrLXZjb2RlYy1lbmNvZGVyOiBB
ZGQgcG93ZXItZG9tYWlucyBwcm9wZXJ0eQo+Pj4KPj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLWVuY29kZXIueWFtbCAgICAgfCAzICsrKwo+Pj4gICBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwg
ICAgICB8IDMgKysrCj4+PiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Iv
bWVkaWF0ZWssbXRrLXhoY2kueWFtbCAgIHwgMSArCj4+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCj4+Pgo+Pj4gLS0gCj4+PiAyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
