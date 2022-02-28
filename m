Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30399C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 12:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qM8rMRaiSXlGOfC7x+JufaA0a/BqJWHuSHWxUmcXmm4=; b=d/o319DgqRiuia
	TbHMdrvkCf59IDbJa7rO4t7RBzaHCnzNo74HuHzdCUuV37O4Nh4kh49TBkaTAtYFl32EhtmQUguFw
	PIAhCunzlIkyzFkN/ARDWOh/rmi3Nhe6m1NCZIm7bJJ6oIdXI1LwxE2QMm9kL6ypcuRzd/xjEuSm+
	opuB1MGaogc1b/K+4XBBX71WK3NYzEZSbCBK6rSxEbkPscrvEegemYAh7OQHUJd/7olgZ3jw5RlST
	ffMeKDcrPNVfcfteVEBqJ+fKDwdLzBOC+lVhy4tvr0yuVZs2FoJi8k92t9m+NYClqJvEr1E5rQRaj
	vftU66sxyuIpUSlGlhaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOenB-00C4Jc-F8; Mon, 28 Feb 2022 12:06:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOe8D-00Bpu2-Ud; Mon, 28 Feb 2022 11:23:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id x15so14868246wrg.8;
 Mon, 28 Feb 2022 03:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6Xad/Cm1Xa8M0hODEJ4dnGwbaNUheLGcG/djLON/KIs=;
 b=DM0SjBIp2rOGaNtM39pEiIUszAfjIHUZMKGIcQjO3F+1g8JNd6oucb2caysFVNecr2
 880kyAJYSq5XZxOuIqZVlZi1Vw8TL0FbK47XSiPDz5KswKn0nyFHW7kBKAmwBmyKd3j5
 NGes1i6mVKRX6OjYj4nzZp36qCA3OOORYpQWLweWomp8mqdxkF6d7VR3jG5f9nU1wdJX
 ronv6A3YVSIbPwdcWvlojPcE3AmUu/RFvNEZ6I5BZqU0843QctZrYqbQ3jQYeh4L6LfX
 4p1h57jTGbcLfXpqYm/dmP1bT/oaYCkKOLVX7fBcovmV0389jDwOgTL6MgGimH1kevSJ
 4pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Xad/Cm1Xa8M0hODEJ4dnGwbaNUheLGcG/djLON/KIs=;
 b=jkdZjqeB8PeucBM9I72NB19j04FG7e8ZqgewtZzX26w2sB6VbhtmpQy2EUbuLecWjB
 h2qJvhkonyvlvIDky6anpoYlKetZvx9Ego9a6cTiquuOBgQ0vzTj6Glv3YuK4unyOTQu
 iIDv3UvdsaXVY6OsQBgdQcfKH3hQpURWGM6UVnO5T2/PAYHxG4+lOl7Ytc4cLWjjc/Gv
 OLv5Mr9GFyiU+hVzZMzO8rpjSGGQcCDtZAYvFhFYOyvsjGGddkn/bPC6ULK52PqFllW4
 OzG68GNLRInnU3Y9iF7DpN6nbaWyxjL7eKRXxTwJlRW2gE7dmqlLomDL6I1r+BFikk4Q
 zeyw==
X-Gm-Message-State: AOAM533NdvcKKQoT+sY3XTcxmCEILJ24Xu0K6RGU8MDwOobLllpmKHX1
 YbyQzKnwH7v8T3p1cqsAivU=
X-Google-Smtp-Source: ABdhPJzP+xqwrYyWQvMzSTg/Q1fH/gj9WcdWurTxPtGzl7RjAQC95IedNOQ1iLc69P0VmDAsZQferw==
X-Received: by 2002:a5d:6148:0:b0:1ed:b74e:508a with SMTP id
 y8-20020a5d6148000000b001edb74e508amr14871735wrt.90.1646047430977; 
 Mon, 28 Feb 2022 03:23:50 -0800 (PST)
Received: from [192.168.0.14] (static-63-182-85-188.ipcom.comunitel.net.
 [188.85.182.63]) by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b00380e3225af9sm11015593wms.0.2022.02.28.03.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 03:23:50 -0800 (PST)
Message-ID: <4df2ddd0-2114-f874-d661-bb7020f56f72@gmail.com>
Date: Mon, 28 Feb 2022 12:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] arm64: dts: mt8183: jacuzzi: Fix bus properties in
 anx's DSI endpoint
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220214200507.2500693-1-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220214200507.2500693-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_032358_011172_14F1F070 
X-CRM114-Status: GOOD (  19.99  )
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

CgpPbiAxNC8wMi8yMDIyIDIxOjA1LCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90ZToKPiBt
dDgxODMta3VrdWktamFjdXp6aSBoYXMgYW4gYW54NzYyNSBicmlkZ2UgY29ubmVjdGVkIHRvIHRo
ZSBvdXRwdXQgb2YKPiBpdHMgRFNJIGhvc3QuIEhvd2V2ZXIsIGFmdGVyIGNvbW1pdCBmZDAzMTBi
NmZlN2QgKCJkcm0vYnJpZGdlOiBhbng3NjI1Ogo+IGFkZCBNSVBJIERQSSBpbnB1dCBmZWF0dXJl
IiksIGEgYnVzLXR5cGUgcHJvcGVydHkgc3RhcnRlZCBiZWluZyByZXF1aXJlZAo+IGluIHRoZSBl
bmRwb2ludCBub2RlIGJ5IHRoZSBkcml2ZXIgdG8gaW5kaWNhdGUgd2hldGhlciBpdCBpcyBEU0kg
b3IgRFBJLgo+IAo+IEFkZCB0aGUgbWlzc2luZyBidXMtdHlwZSBwcm9wZXJ0eSBhbmQgc2V0IGl0
IHRvIDUKPiAoVjRMMl9GV05PREVfQlVTX1RZUEVfUEFSQUxMRUwpIHNvIHRoYXQgdGhlIGRyaXZl
ciBoYXMgaXRzIGlucHV0Cj4gY29uZmlndXJlZCB0byBEU0kgYW5kIHRoZSBkaXNwbGF5IHBpcGVs
aW5lIGNhbiBwcm9iZSBjb3JyZWN0bHkuCj4gCj4gV2hpbGUgYXQgaXQsIGFsc28gc2V0IHRoZSBk
YXRhLWxhbmVzIHByb3BlcnR5IHRoYXQgd2FzIGFsc28gaW50cm9kdWNlZAo+IGluIHRoYXQgc2Ft
ZSBjb21taXQsIHNvIHRoYXQgd2UgZG9uJ3QgcmVseSBvbiB0aGUgZGVmYXVsdCB2YWx1ZS4KPiAK
PiBGaXhlczogZmQwMzEwYjZmZTdkICgiZHJtL2JyaWRnZTogYW54NzYyNTogYWRkIE1JUEkgRFBJ
IGlucHV0IGZlYXR1cmUiKQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdu
byA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPiAK
CmFwcGxpZWQgdG8gdG8gdHJlZSB2NS4xNy1maXhlcwoKVGhhbmtzCk1hdHRoaWFzCgo+IC0tLQo+
IHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjAyMDExNzQ2NDMuODQzMTAyLTEt
bmZyYXByYWRvQGNvbGxhYm9yYS5jb20KPiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjIwMTIwMjI0MjA0Ljc3MzExNy0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tCj4gCj4gQ2hh
bmdlcyBpbiB2MzoKPiAtIEFkZGVkIG1pc3NpbmcgUmV2aWV3ZWQtYnkKPiAKPiBDaGFuZ2VzIGlu
IHYyOgo+IC0gKHRoYW5rcyBSb2IpIFVzZSBwcm9wZXIgZm9ybWF0IHdoZW4gcmVmZXJpbmcgdG8g
Y29tbWl0IGluIGNvbW1pdAo+ICAgIG1lc3NhZ2UgYXMgcG9pbnRlZCBvdXQgYnkgY2hlY2twYXRj
aAo+IAo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6
aS5kdHNpIHwgMiArKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1rdWt1aS1qYWN1
enppLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1rdWt1aS1qYWN1
enppLmR0c2kKPiBpbmRleCA4ZjdiZjMzZjYwN2QuLmU4ZjEzM2RjOTZiOSAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1rdWt1aS1qYWN1enppLmR0c2kK
PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1rdWt1aS1qYWN1enpp
LmR0c2kKPiBAQCAtMTcxLDYgKzE3MSw4IEBAIHBvcnRAMCB7Cj4gICAKPiAgIAkJCWFueDc2MjVf
aW46IGVuZHBvaW50IHsKPiAgIAkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRzaV9vdXQ+Owo+ICsJ
CQkJYnVzLXR5cGUgPSA8NT47Cj4gKwkJCQlkYXRhLWxhbmVzID0gPDAgMSAyIDM+Owo+ICAgCQkJ
fTsKPiAgIAkJfTsKPiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
