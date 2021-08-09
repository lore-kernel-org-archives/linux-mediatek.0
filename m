Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4930C4320A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 14:06:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A38860F93
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 14:06:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A38860F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MWhQKotBIxF0JXYUM62xWM9em9v/TIiSrBX0qcpBVdg=; b=lL7J5fmpibMXqL
	9XYQuRjcX5giZ2E1Kuy7kVZ7S4DLVwIgyRWr7oo3AKZAKdUOK2j3mzR6SpiBTvSTq5p82Axbn2CxO
	t7PNeIQ6leDKsXs8dLteSbuZgXRqaM2qCHe/udUbjOBMw6Dmj/a6bFNd0iGqNvIDO15qIu5xsacPo
	ipvsKFj/2xnyESsTvDWH04JrNE/SLJFS9sQsyn4ZeDi7U9YOxbeNoWgsDiLOs57dgUnOsPOczvdux
	07/xqKbbmxiafvsPa7zQGrfrWIId2BrmOl8uF2kW/RacR+CUG1bEykI1fGsM+rVLqqk9ryO6SETVl
	OGh48fP5+eqFXQNqrY+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD5vC-000sGJ-V0; Mon, 09 Aug 2021 14:06:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD5uw-000s9d-Bb; Mon, 09 Aug 2021 14:06:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF34561052;
 Mon,  9 Aug 2021 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628517974;
 bh=KK7jjN23raVktev4HSd9TJQBS5GWAZQ4yGJxFG4+9Iw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gapdlvZdDjM7nAfH4De8Tp/fNVqYGRPOQEEDAY22tpQ28YQ4Eq25cjIIjIYJrFIIA
 WamRLl1S+d5Aa8qWLS99G+z8dOw6HF6CQr9QYeAvG6DfVqJa6PJXFvZOQsm/DkSGrT
 tbWkn5d7HcrbV7kFOjsKNzrVp+i585sPACJwPR6+I6DCZOg4Rk2YFJo/WglPyJZ7n/
 qoJkv+OhhUr1xOlRl7pcDyF0eETDB4ffepz6EAo/IGgeVWwJyXVyp9DigqrF8nUKMz
 Es2UKL0Tspm5pOLOHra4Yb34pPy+QIGnKPadslbyGqJ3FtoJC/jUe0RfLpJ7LuuwrB
 PemyGUyWCi41g==
Received: by mail-ed1-f42.google.com with SMTP id bo19so5445249edb.9;
 Mon, 09 Aug 2021 07:06:13 -0700 (PDT)
X-Gm-Message-State: AOAM5305qEy2zyYqdkrwdyTesuKvH+jbPDDu1ancZvCsH346rXH1KNau
 L2DZdGnEcMtbNXslDiwJVPlNwszxOMv4Dj+MXA==
X-Google-Smtp-Source: ABdhPJy8JViocynBWXM9L3xsiyYJiSRcSybIkGik7L3z/aNO5GB4LmezUH2JyaLyyG+6uSQVvQ4XXt4q4R0gt+0l8RM=
X-Received: by 2002:a05:6402:718:: with SMTP id
 w24mr29623490edx.49.1628517972496; 
 Mon, 09 Aug 2021 07:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-3-fparent@baylibre.com>
In-Reply-To: <20201023133130.194140-3-fparent@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 22:06:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__-E19JJiw=0X=Kdm9afWSTCeoYFKJAVJObrikfhV=BVA@mail.gmail.com>
Message-ID: <CAAOTY__-E19JJiw=0X=Kdm9afWSTCeoYFKJAVJObrikfhV=BVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: display: mediatek: dsi: add
 documentation for MT8167 SoC
To: Fabien Parent <fparent@baylibre.com>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_070614_460259_D2988E55 
X-CRM114-Status: GOOD (  16.73  )
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

SGksIEZhYmllbjoKCkZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MOW5tDEw5pyIMjPml6Ug6YCx5LqUIOS4i+WNiDk6MzHlr6vpgZPvvJoKPgo+IEFkZCBiaW5kaW5n
IGRvY3VtZW50YXRpb24gZm9yIHRoZSBNVDgxNjcgU29DLgoKQXBwbGllZCB0byBtZWRpYXRlay1k
cm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1k
cm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4g
UGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAtLS0KPgo+IENoYW5nZWxvZzoKPgo+IFYy
OiByZW1vdmVkIHBhcnQgdGhhdCBhZGRlZCBhIG5ldyBjbG9jawo+Cj4gIC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dCAgICAgfCA0ICsrLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxkc2kudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNpLnR4dAo+IGluZGV4IGYwNmYyNGQ0MDVhNS4u
NmExMGRlODEyMTU4IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzaS50eHQKPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2kudHh0
Cj4gQEAgLTcsNyArNyw3IEBAIGNoYW5uZWwgb3V0cHV0Lgo+Cj4gIFJlcXVpcmVkIHByb3BlcnRp
ZXM6Cj4gIC0gY29tcGF0aWJsZTogIm1lZGlhdGVrLDxjaGlwPi1kc2kiCj4gLS0gdGhlIHN1cHBv
cnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10ODE3MyBhbmQgbXQ4MTgzLgo+ICstIHRo
ZSBzdXBwb3J0ZWQgY2hpcHMgYXJlIG10MjcwMSwgbXQ3NjIzLCBtdDgxNjcsIG10ODE3MyBhbmQg
bXQ4MTgzLgo+ICAtIHJlZzogUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhl
IGNvbnRyb2xsZXIncyByZWdpc3RlcnMKPiAgLSBpbnRlcnJ1cHRzOiBUaGUgaW50ZXJydXB0IHNp
Z25hbCBmcm9tIHRoZSBmdW5jdGlvbiBibG9jay4KPiAgLSBjbG9ja3M6IGRldmljZSBjbG9ja3MK
PiBAQCAtMjYsNyArMjYsNyBAQCBUaGUgTUlQSSBUWCBjb25maWd1cmF0aW9uIG1vZHVsZSBjb250
cm9scyB0aGUgTUlQSSBELVBIWS4KPgo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICAtIGNvbXBh
dGlibGU6ICJtZWRpYXRlayw8Y2hpcD4tbWlwaS10eCIKPiAtLSB0aGUgc3VwcG9ydGVkIGNoaXBz
IGFyZSBtdDI3MDEsIDc2MjMsIG10ODE3MyBhbmQgbXQ4MTgzLgo+ICstIHRoZSBzdXBwb3J0ZWQg
Y2hpcHMgYXJlIG10MjcwMSwgNzYyMywgbXQ4MTY3LCBtdDgxNzMgYW5kIG10ODE4My4KPiAgLSBy
ZWc6IFBoeXNpY2FsIGJhc2UgYWRkcmVzcyBhbmQgbGVuZ3RoIG9mIHRoZSBjb250cm9sbGVyJ3Mg
cmVnaXN0ZXJzCj4gIC0gY2xvY2tzOiBQTEwgcmVmZXJlbmNlIGNsb2NrCj4gIC0gY2xvY2stb3V0
cHV0LW5hbWVzOiBuYW1lIG9mIHRoZSBvdXRwdXQgY2xvY2sgbGluZSB0byB0aGUgRFNJIGVuY29k
ZXIKPiAtLQo+IDIuMjguMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
