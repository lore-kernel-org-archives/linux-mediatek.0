Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 05:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idH2eID/uXMLV92chKy0/8Ko1ggkVaaltUbeuhSE1IA=; b=mPRF6jdBH27vZG
	8XygyUUHkfg98CXp1ZzGxemjJMLfU2vraBlsBrqHNiw1oZvZU1ZGXvfQmctszoJTqMZQAulRNoiWr
	s7iVEm5E6Fe52V8mwzrzyTYXEB2Cg4dLGKumK2M2BJ2K9+zuoTMcrzBjQC1fB6LTiX2YowCCYTwKT
	uNgmtExdfNTgwnNz1Ca8gE7XvP5OoR+XaK6wNgXaKyCl9XqVYBryvSp0NuOzusz9fL+0FI5Rz55WE
	Ptt1xWQaHjNgvjiRSCtzvq533uK4woMq6uAxlemUNymAMsM1Jz+dKvPHB4LSr4WuAyQ6zKBu1EBDf
	0etc2l3C8maKTyxnmWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nggd3-001bvG-SN; Tue, 19 Apr 2022 05:42:21 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nggcr-001bs4-L3; Tue, 19 Apr 2022 05:42:11 +0000
Received: by mail-qk1-x72d.google.com with SMTP id s70so5968226qke.8;
 Mon, 18 Apr 2022 22:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y4WqiyPBrPuq3t0GzG/KyMaIv9tuXpL8sDYJ09oaLlc=;
 b=b3g0keK+mJDMBV75bc1md4gO+XLUzYDcKtwNdefPSiZa1uEPauzb7UUpnC5UOrRAgU
 yj4s4c6cB/PnbUD5k8trcbR99/91u3tmwfL1LsrfvoRQGAmerDe1uZV9JSZXy0xjacpZ
 nMSgEEZOgtzh6udr1hAZrKthALYqZmXW7wPyEnD8IumG+B0XGNNjYRE8xeIlBXX+1nFc
 LRCNVEKccJhj0fW3wGkeyCPUMUFOv/wnrpQA1oI/AHUNVgtCbYH61hHYzRbUQeV2HLPy
 zgtJ1jAXvt1T8rCZ6K1VBGtTr/bx9Eifo/OUTjeFkgNAyfn5AR8H47zEdlTj+2jj1hVq
 TCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y4WqiyPBrPuq3t0GzG/KyMaIv9tuXpL8sDYJ09oaLlc=;
 b=nSagGVqPq/XGl8r5cwe8dYugEgdsbCiyf4w1Vi3PAsrGlMGEieL41OB6pZ6ZMQFAVz
 5WObZv5DJ9y62X3MJdmq+POgiRtRnW6er2JevEYiSxvtuvALXptv6qGJA2yDyV1hcUy6
 m1ptAId4wR7+kr6079N/DSG0SlolN4Z7yuryX5evs7ydic2HUqtgry3An+HyaUVSWGQe
 lxhjbBH+PCm/4/Go6HTBbMHhXfTY1YbueRx8JPaP9wgqs3Ost8RaisKQL8uDjIuXLfwo
 +jbHwGfGiLtN16CyHGcWn4Q9f+flZLhYwdyixLj7uLZs1f7bjwZ25Y732AZoHsV+tymg
 lKOQ==
X-Gm-Message-State: AOAM532fi/YvadbUsxwxBbHDf3WcdqLxzdZ/cnQzOhfpIiPBg0gFYcZG
 fOBQxul0rAlgpmHhaMA66PSXn8n+dOcPlh9WiDs=
X-Google-Smtp-Source: ABdhPJzDm6c7z7Z8nfJx8bLY6Q65M8wsTvC2SNRYrmONjssNXsMgNlxplno3NUOkHvtNiBmyKAF1Rv/3nxQYp13A5Uo=
X-Received: by 2002:a05:620a:4308:b0:67b:487e:e02a with SMTP id
 u8-20020a05620a430800b0067b487ee02amr8723387qko.696.1650346925402; Mon, 18
 Apr 2022 22:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
In-Reply-To: <20220414173916.5552-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 19 Apr 2022 07:41:54 +0200
Message-ID: <CAMhs-H9sdyEEmauW=Wx__+ydj46HTftjjzmJ8D3SwBkvWi_YMg@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Refactor Ralink Pinctrl and Add Documentation
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Joe Perches <joe@perches.com>, erkin.bozoglu@xeront.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_224209_751769_879AF919 
X-CRM114-Status: GOOD (  22.66  )
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

SGkgQXJpbsOnLAoKT24gVGh1LCBBcHIgMTQsIDIwMjIgYXQgNzo0MCBQTSBBcsSxbsOnIMOcTkFM
IDxhcmluYy51bmFsQGFyaW5jOS5jb20+IHdyb3RlOgo+Cj4gSGV5IGV2ZXJ5b25lLgo+Cj4gVGhp
cyBwYXRjaCBzZXJpZXMgYnJpbmdzIGNvbXBsZXRlIHJlZmFjdG9yaW5nIHRvIHRoZSBSYWxpbmsg
cGluY3RybCBkcml2ZXIKPiBhbmQgaXRzIHN1YmRyaXZlcnMuCj4KPiBUaGUgbXQ3NjIwIHBpbmN0
cmwgc3ViZHJpdmVyIHN1cHBvcnRzIE1UNzYyOCBhbmQgTVQ3Njg4IFNvQ3MgYWxvbmcgd2l0aAo+
IE1UNzYyMC4gVGhlc2UgdHdvIHNoYXJlIHRoZSBzYW1lIHBpbiBsYXlvdXQuIFRoZSBjb2RlIHVz
ZWQgZm9yIE1UNzYyOCBhbmQKPiBNVDc2ODggaXMgcmVuYW1lZCBmcm9tIE1UNzYyOC9tdDc2Mjhh
biB0byBNVDc2WDguCj4KPiBSYWxpbmsgcGluY3RybCBkcml2ZXIgaXMgY2FsbGVkIHJ0Mjg4MCB3
aGljaCBpcyB0aGUgbmFtZSBvZiB0aGUgUmFsaW5rCj4gUlQyODgwIFNvQy4gQSBzdWJkcml2ZXIg
Zm9yIHRoZSBSYWxpbmsgUlQyODgwIFNvQyBpcyBjYWxsZWQgcnQyODh4LiBSZW5hbWUKPiBydDI4
ODAgdG8gcmFsaW5rLgo+Cj4gUmVuYW1lIGNvZGUgZnJvbSBwaW5tdXggdG8gcGluY3RybCBmb3Ig
d2hlcmUgdGhlIG9wZXJhdGlvbiBpcyBub3QgYWJvdXQgdGhlCj4gbXV4aW5nIG9mIHBpbnMuCj4K
PiBSZW5hbWUgcnQyODh4IHBpbmN0cmwgc3ViZHJpdmVyIGZvciB0aGUgUlQyODgwIFNvQyB0byBy
dDI4ODAuCj4KPiBWYXJpYWJsZXMgZm9yIGZ1bmN0aW9ucyBpbmNsdWRlICJncnAiIG9uIHRoZSBS
YWxpbmsgTVQ3NjIwIGFuZCBNVDc2MjEKPiBzdWJkcml2ZXJzLiBSZW5hbWUgdGhlbSB0byAiZnVu
YyIgaW5zdGVhZCBhcyB0aGV5IGRlZmluZSB0aGUgZnVuY3Rpb25zIGZvcgo+IHRoZSBwaW4gZ3Jv
dXBzLiBUaGlzIGlzIGFscmVhZHkgdGhlIGNhc2UgZm9yIHRoZSBvdGhlciAzIHN1YmRyaXZlcnM7
Cj4gUlQyODgwLCBSVDMwNXgsIFJUMzg4My4KPgo+IEZpeCBLY29uZmlnIHRvIGNhbGwgdGhlIHN1
YmRyaXZlcnMsIHdlbGwsIHN1YmRyaXZlcnMuCj4KPiBBZGQgbmV3IGNvbXBhdGlibGUgc3RyaW5n
cyBmb3IgZWFjaCBzdWJkcml2ZXIgYW5kIHVwZGF0ZSBEVCBiaW5kaW5nCj4gYWNjb3JkaW5nbHku
Cj4KPiBBZGQgUmFsaW5rIHBpbmN0cmwgZHJpdmVyIHRvIE1BSU5UQUlORVJTIGFuZCBhZGQgbWUg
YW5kIFNlcmdpbyBhcyB0aGUKPiBtYWludGFpbmVycy4KPgo+IEZpbmFsbHksIGZpeCB0aGUgY3Vy
cmVudCBydDI4ODAgZG9jdW1lbnRhdGlvbiBhbmQgYWRkIGJpbmRpbmcgZm9yIGFsbCBvZgo+IHRo
ZSBzdWJkcml2ZXJzLgo+Cj4gSSBoYXZlIHRoZSBwYXRjaGVzIGhlcmUgc2hvdWxkIGFueW9uZSBw
cmVmZXIgdG8gcmVhZCB0aGVtIHRoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hcmluYzkvbGlu
dXgvY29tbWl0cy9yYWxpbmstcGluY3RybC1yZWZhY3Rvcgo+Cj4gUmFsaW5rIHBpbmN0cmwgZHJp
dmVyIGFuZCB0aGUgc3ViZHJpdmVycyB3ZXJlIGNvbXBpbGUgdGVzdGVkLgo+IE1UNzYyMSBwaW5j
dHJsIHN1YmRyaXZlciB3YXMgdGVzdGVkIG9uIGEgcHJpdmF0ZSBtdDc2MjEgYm9hcmQuCj4gWUFN
TCBiaW5kaW5ncyBjaGVja2VkIHdpdGg6Cj4gQVJDSD1taXBzIENST1NTX0NPTVBJTEU9bWlwcy1s
aW51eC1nbnUtIG1ha2UgZHRfYmluZGluZ19jaGVjayBEVF9TQ0hFTUFfRklMRVM9RG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvIC1qJChucHJvYykKPgo+IHYyOgo+IC0g
QWRkIFNlcmdpb+KAmXMgUmV2aWV3ZWQtYnk6IHRhZyB0byB3aGVyZSBpdCdzIGdpdmVuLgo+IC0g
UHJvcGVybHkgZXhwbGFpbiB0aGUgYWRkaXRpb24gb2YgdGhlIG5ldyBjb21wYXRpYmxlIHN0cmlu
Z3MuCj4gLSBSZW1vdmUgYXN0ZXJpc2sgb24gTUFJTlRBSU5FUlMgY29tbWl0Lgo+IC0gUHJvcGVy
bHkgZXhwbGFpbiB0aGUgY29tcGF0aWJsZSBzdHJpbmcgY2hhbmdlIGZvciB0aGUgcnQyODgwIGJp
bmRpbmcuCj4gLSBNZW50aW9uIGFkZGluZyBteXNlbGYgYXMgYSBtYWludGFpbmVyIHRvIHJ0Mjg4
MCBiaW5kaW5nLgo+IC0gRml4IHR5cG8gImluZGl2aXVhbCIgb24gWUFNTCBiaW5kaW5ncy4gTGlt
aXQgbGluZXMgdG8gODAgY2hhcmFjdGVycy4KPgo+IEFyxLFuw6cgw5xOQUwgKDE0KToKPiAgIHBp
bmN0cmw6IHJhbGluazogcmVuYW1lIE1UNzYyOChhbikgZnVuY3Rpb25zIHRvIE1UNzZYOAo+ICAg
cGluY3RybDogcmFsaW5rOiByZW5hbWUgcGluY3RybC1ydDI4ODAgdG8gcGluY3RybC1yYWxpbmsK
PiAgIHBpbmN0cmw6IHJhbGluazogcmVuYW1lIHBpbm11eCBmdW5jdGlvbnMgdG8gcGluY3RybAo+
ICAgcGluY3RybDogcmFsaW5rOiByZW5hbWUgcGluY3RybC1ydDI4OHggdG8gcGluY3RybC1ydDI4
ODAKPiAgIHBpbmN0cmw6IHJhbGluazogcmVuYW1lIHZhcmlhYmxlIG5hbWVzIGZvciBmdW5jdGlv
bnMgb24gTVQ3NjIwIGFuZCBNVDc2MjEKPiAgIHBpbmN0cmw6IHJhbGluazogcmVuYW1lIGRyaXZl
ciBuYW1lcyB0byBzdWJkcml2ZXJzCj4gICBwaW5jdHJsOiByYWxpbms6IGFkZCBuZXcgY29tcGF0
aWJsZSBzdHJpbmdzIGZvciBlYWNoIHBpbmN0cmwgc3ViZHJpdmVyCj4gICBNQUlOVEFJTkVSUzog
YWRkIFJhbGluayBwaW5jdHJsIGRyaXZlcgo+ICAgbWlwczogZHRzOiByYWxpbms6IG10NzYyMTog
dXNlIHRoZSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgZm9yIE1UNzYyMSBwaW5jdHJsCj4gICBkdC1i
aW5kaW5nczogcGluY3RybDogcnQyODgwOiBmaXggYmluZGluZyBuYW1lLCBwaW4gZ3JvdXBzIGFu
ZCBmdW5jdGlvbnMKPiAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBhZGQgYmluZGluZyBmb3IgUmFs
aW5rIE1UNzYyMCBwaW5jdHJsCj4gICBkdC1iaW5kaW5nczogcGluY3RybDogYWRkIGJpbmRpbmcg
Zm9yIFJhbGluayBNVDc2MjEgcGluY3RybAo+ICAgZHQtYmluZGluZ3M6IHBpbmN0cmw6IGFkZCBi
aW5kaW5nIGZvciBSYWxpbmsgUlQzMDVYIHBpbmN0cmwKPiAgIGR0LWJpbmRpbmdzOiBwaW5jdHJs
OiBhZGQgYmluZGluZyBmb3IgUmFsaW5rIFJUMzg4MyBwaW5jdHJsCgpJIGFtIG9rIHdpdGggaGF2
aW5nIGRpZmZlcmVudCBiaW5kaW5ncyBmb3IgZWFjaCBzaW5nbGUgU29DIGlmIGZpbmFsbHkKaXMg
dGhlIGNvcnJlY3Qgd2F5IHRvIGdvLiBJIGFtIGFsc28gb2sgaW4gYmVpbmcgbGlzdGVkIGFzIGEg
bWFpbnRhaW5lcgppbiBhbGwgb2YgdGhlbS4gU28sIGZvciB0aGUgd2hvbGUgc2VyaWVzOgoKQWNr
ZWQtYnk6IFNlcmdpbyBQYXJhY3VlbGxvcyA8c2VyZ2lvLnBhcmFjdWVsbG9zQGdtYWlsLmNvbT4K
ClRoYW5rcywKICAgIFNlcmdpbyBQYXJhY3VlbGxvcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
