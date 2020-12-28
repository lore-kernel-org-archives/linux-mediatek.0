Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49981C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 16:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 072E7223E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 16:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 072E7223E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kIFM08/uQ0WSYD3oYJqvAdLKUH4UzDI6sTMNSQBnSLg=; b=tt5dqEvbuUxPbVs85Z+/CCvWd
	YZGh+FyyPJRygCBngmcicOuMXqtKY8rZ2+ntfW639DhmVZqKPTsgDc7FjXAMQNKMWrEDAE+hW5zJi
	5pjO4Y8Mt8f3vAnoQiyMA5kiPc9+MI9/fg+gT1sAFztNL0nnfTUnfrQ8y65ZSpbxrBIbCRdAxPp+Z
	415qDgOMAJp81ZHTJPm9HLfsWsM9nPEFH8Hho1uUwVHwq1h0e/o63rv1OH0zNrhES+uy1yotOCi6v
	Kd10xiDgcggUecRWQs80SGPgqyZhRkpvRKVx+u+XqgDqX8AZkzUZo73VFILnvCRI7FzavdZ/V89Zm
	AH9IyCgFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktvXM-0007Lb-6z; Mon, 28 Dec 2020 16:38:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktvXI-0007KM-6V; Mon, 28 Dec 2020 16:38:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B9F9224D2;
 Mon, 28 Dec 2020 16:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609173498;
 bh=YV/sRyX1UmvG3GgdJ2m2ftk6FRFQv84QER2+PC7WNP0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UK5kKQ8TFRZmctDcMCpNwJwPKX+GfRJDqejqbHjLqlfEGLwBX3n8bZVw06xsMmJwR
 JjKvIRcN6I2rcNK9gh7+SV29hg+EgYWBPEJavUuG0h6Ra0F37O29wffn2NdMjKzj/s
 rh1frW8ZlXyOSbvX9wbPxFjkpT/f6IlwfQrNVs/KNGhUPwS99KMnLHk+0AWVBPx43i
 pt0Y7fdU1Q25Fn4Un7lOvEIwUHgNTQkdFEjgigz5z9SQ2xtTP3Xlss94yRHSBm4VEm
 7tAvCyq6ElkWLMiXTcmGas+bUNAxqzmhn6OPA0tKNyqGvqDeg8ZanAQsu+WtK+gAyv
 i7agiC8kfw8cw==
Received: by mail-wr1-f44.google.com with SMTP id y17so11767647wrr.10;
 Mon, 28 Dec 2020 08:38:18 -0800 (PST)
X-Gm-Message-State: AOAM53303ymDVENUv0lkqqLiJvoNA+nlNJ4k2anmUyVypl7Kkx4XsaBo
 OhfaDqVJ3ssdL+NjDTijJ2kkzg4gPOPhQgIUxw==
X-Google-Smtp-Source: ABdhPJyH9luqvq7mDBrXfC//wmYqhVyPNCFSGbrh2c9nlDMvIXGLGHRAotR70G+rGeb+bseslPiYL4Rabit/Z+t8IxA=
X-Received: by 2002:adf:e84c:: with SMTP id d12mr53775611wrn.382.1609173497206; 
 Mon, 28 Dec 2020 08:38:17 -0800 (PST)
MIME-Version: 1.0
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-8-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609144630-14721-8-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 00:38:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ObwPwKt6nRc_qSu9JE3WbqeRDEpKObnxsfhENbkT+iw@mail.gmail.com>
Message-ID: <CAAOTY_9ObwPwKt6nRc_qSu9JE3WbqeRDEpKObnxsfhENbkT+iw@mail.gmail.com>
Subject: Re: [PATCH v3, 7/8] soc: mediatek: mmsys: Use function call for
 setting mmsys ovl mout register
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_113820_359715_2013B360 
X-CRM114-Status: GOOD (  19.01  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMjjml6Ug6YCx5LiAIOS4i+WNiDQ6Mzjlr6vpgZPvvJoKPgo+IFVz
ZSBmdW5jdGlvbiBjYWxsIGZvciBzZXR0aW5nIG1tc3lzIG92bCBtb3V0IHJlZ2lzdGVyCj4KPiBT
aWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXRrLW1tc3lzLmMgfCAyMCArKysr
KysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMu
aCB8ICAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5cy9tdGstbW1zeXMuYyBiL2RyaXZlcnMv
c29jL21lZGlhdGVrL21tc3lzL210ay1tbXN5cy5jCj4gaW5kZXggZGFlNjY1Yi4uZWEzNmExMSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5cy9tdGstbW1zeXMuYwo+ICsr
KyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL21tc3lzL210ay1tbXN5cy5jCj4gQEAgLTc0LDYgKzc0
LDE3IEBAIHZvaWQgbXRrX21tc3lzX2RkcF9jb25uZWN0KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAg
ICAgICAgICAgICAgICAgcmVnID0gcmVhZGxfcmVsYXhlZChtbXN5cy0+cmVncyArIGFkZHIpIHwg
dmFsdWU7Cj4gICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgbW1zeXMtPnJlZ3Mg
KyBhZGRyKTsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAoIWZ1bmNzLT5vdmxfbW91dF9l
bikKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIGlmIChmdW5jcy0+b3Zs
X21vdXRfZW4pIHsKPiArICAgICAgICAgICAgICAgdmFsdWUgPSBmdW5jcy0+b3ZsX21vdXRfZW4o
Y3VyLCBuZXh0LCAmYWRkcik7Cj4gKyAgICAgICAgICAgICAgIGlmICh2YWx1ZSkgewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3MgKyBhZGRy
KSB8IHZhbHVlOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywg
bW1zeXMtPnJlZ3MgKyBhZGRyKTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQoKbXRr
X21tc3lzX2RkcF9tb3V0X2VuKCkgY291bGQgd3JpdGUgcmVnaXN0ZXIgaW5zaWRlIGl0IHJhdGhl
ciB0aGFuCnJldHVybiB2YWx1ZSBhbmQgd3JpdGUgcmVnaXN0ZXIgaW4gbXRrX21tc3lzX2RkcF9j
b25uZWN0KCkuIFNvIHlvdQpjb3VsZCBkbyBvdmxfbW91dF9lbigpIGluIG10a19tbXN5c19kZHBf
bW91dF9lbigpLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9H
UEwobXRrX21tc3lzX2RkcF9jb25uZWN0KTsKPgo+IEBAIC05OSw2ICsxMTAsMTUgQEAgdm9pZCBt
dGtfbW1zeXNfZGRwX2Rpc2Nvbm5lY3Qoc3RydWN0IGRldmljZSAqZGV2LAo+ICAgICAgICAgICAg
ICAgICByZWcgPSByZWFkbF9yZWxheGVkKG1tc3lzLT5yZWdzICsgYWRkcikgJiB+dmFsdWU7Cj4g
ICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgbW1zeXMtPnJlZ3MgKyBhZGRyKTsK
PiAgICAgICAgIH0KPiArCj4gKyAgICAgICBpZiAoIWZ1bmNzLT5vdmxfbW91dF9lbikKPiArICAg
ICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIHZhbHVlID0gZnVuY3MtPm92bF9tb3V0
X2VuKGN1ciwgbmV4dCwgJmFkZHIpOwo+ICsgICAgICAgaWYgKHZhbHVlKSB7Cj4gKyAgICAgICAg
ICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3MgKyBhZGRyKSAmIH52YWx1ZTsK
PiArICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVncyArIGFkZHIp
Owo+ICsgICAgICAgfQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKG10a19tbXN5c19kZHBfZGlz
Y29ubmVjdCk7Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmggYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaAo+IGluZGV4
IGFhNGY2MGUuLjIyMDIwM2QgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0
ZWsvbXRrLW1tc3lzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1z
eXMuaAo+IEBAIC00OSw2ICs0OSw5IEBAIHN0cnVjdCBtdGtfbW1zeXNfY29ubl9mdW5jcyB7Cj4g
ICAgICAgICB1MzIgKCptb3V0X2VuKShlbnVtIG10a19kZHBfY29tcF9pZCBjdXIsCj4gICAgICAg
ICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0LAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50ICphZGRyKTsKPiArICAgICAgIHUzMiAoKm92bF9tb3V0
X2VuKShlbnVtIG10a19kZHBfY29tcF9pZCBjdXIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgbmV4dCwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgKmFkZHIpOwo+ICAgICAgICAgdTMyICgqc2VsX2luKShlbnVtIG10a19k
ZHBfY29tcF9pZCBjdXIsCj4gICAgICAgICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21w
X2lkIG5leHQsCj4gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqYWRkcik7Cj4g
LS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
