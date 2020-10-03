Return-Path: <SRS0=+yJE=DK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188A5C4363C
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2020 03:26:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5887206E3
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2020 03:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pxZvDvaR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYzuV6Al"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5887206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=muv57i0+yu2t0c3UMnCsNbEmhxa7Mg+n6X+oRII8AiE=; b=pxZvDvaRU08rxqGYmQ77fznzp
	8D0ptBTsO1db0z9sq/K3H3gRaubrX9uJ+ivC8jJ8a1kbhslUhdJqALG2oS2X7r5BsKXvuBpIVKKna
	s4d7u36Qta5N5aE3IE3NcCRzAOLs44NdCJP/5RoCF/vvEoU5u8RKOgWL4ElKptOd4gGg/ePOq60Me
	zRsBTGJxFANEdeqHxFUDAI1u3SrMI5cCSPM+aOLTUOr9E6Z7ECAconDx2Z1snUhdN78FPbK86DYMs
	TJUtaYj6HupGP2LR4nyfnMyH27yT98X3/isMwnFLQAd9MUKgOyqS6mE+Opeh4DcNo2ofg/3tVfBSD
	QZolm8ahw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOYBi-0000sq-TI; Sat, 03 Oct 2020 03:26:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOYBe-0000s2-NB; Sat, 03 Oct 2020 03:26:19 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 46AE1206FA;
 Sat,  3 Oct 2020 03:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601695577;
 bh=CBE60R04Ssh2X4r5oUkkDdZCifZI6pr2boyjVftGq04=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JYzuV6AlipFT9jR0QccHNBWhs+sWE/CY4+1YHGm7YJQy2byk5AdKePh9hbM7BKIcL
 LADPIBysqb2spD9KAib5bcNy0WE5/M8TeeJssN17ryj3IRqT/BwilY6iUdl/aStxY/
 BxsjjhPhX/t/cjHRDe7YLp1TD1VxFdxqyfSwvVFU=
Received: by mail-ej1-f54.google.com with SMTP id i26so4410201ejb.12;
 Fri, 02 Oct 2020 20:26:17 -0700 (PDT)
X-Gm-Message-State: AOAM531sZTJtdDokxi9paZlIBjhuIABGPmp1ttSoSjzAFQsEPXOeNdkZ
 F5ypyGZvkKFrSNWDS9Mw5x6c4bpd1qCmrg0VnA==
X-Google-Smtp-Source: ABdhPJyVT37Ny80mPGlIZPTaykVZw3A0gTf5M2DLK3vsvTWIDBjG6hSjhM5Hie0HqnCRjpNoKC1wpuzkQUpYZezZs38=
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr187553ejd.310.1601695575882; 
 Fri, 02 Oct 2020 20:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200827182507.4938-1-krzk@kernel.org>
In-Reply-To: <20200827182507.4938-1-krzk@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 3 Oct 2020 11:26:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9jC2CMws-xoRgLmcHY=4f1EbLaFRkjAPsC18rrWn12jQ@mail.gmail.com>
Message-ID: <CAAOTY_9jC2CMws-xoRgLmcHY=4f1EbLaFRkjAPsC18rrWn12jQ@mail.gmail.com>
Subject: Re: [PATCH v3] mailbox: mediatek: Fix handling of platform_get_irq()
 error
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_232618_881119_CAEE1104 
X-CRM114-Status: GOOD (  20.33  )
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
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDjmnIgyOOaX
pSDpgLHkupQg5LiK5Y2IMjoyNeWvq+mBk++8mgo+Cj4gcGxhdGZvcm1fZ2V0X2lycSgpIHJldHVy
bnMgLUVSUk5PIG9uIGVycm9yLiAgSW4gc3VjaCBjYXNlIGNhc3RpbmcgdG8gdTMyCj4gYW5kIGNv
bXBhcmluZyB0byAwIHdvdWxkIHBhc3MgdGhlIGNoZWNrLgo+CgpSZXZpZXdlZC1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IEZpeGVzOiA2MjNhNjE0M2E4NDUg
KCJtYWlsYm94OiBtZWRpYXRlazogQWRkIE1lZGlhdGVrIENNRFEgZHJpdmVyIikKPiBTaWduZWQt
b2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+Cj4KPiAtLS0KPgo+
IENoYW5nZXMgc2luY2UgdjI6Cj4gMS4gRml4IHN1YmplY3QuCj4KPiBDaGFuZ2VzIHNpbmNlIHYx
Ogo+IDEuIENvcnJlY3QgdTMyLT5pbnQsCj4gMi4gRml4IGxlZnQtb3ZlciAnIScuCj4gLS0tCj4g
IGRyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgfCA4ICsrKy0tLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyBiL2RyaXZlcnMvbWFpbGJveC9t
dGstY21kcS1tYWlsYm94LmMKPiBpbmRleCA0ODRkNDQzOGNkODMuLjU2NjViNmVhODExOSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gKysrIGIvZHJp
dmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYwo+IEBAIC02OSw3ICs2OSw3IEBAIHN0cnVj
dCBjbWRxX3Rhc2sgewo+ICBzdHJ1Y3QgY21kcSB7Cj4gICAgICAgICBzdHJ1Y3QgbWJveF9jb250
cm9sbGVyICBtYm94Owo+ICAgICAgICAgdm9pZCBfX2lvbWVtICAgICAgICAgICAgKmJhc2U7Cj4g
LSAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICBpcnE7Cj4gKyAgICAgICBpbnQgICAgICAg
ICAgICAgICAgICAgICBpcnE7Cj4gICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICB0aHJl
YWRfbnI7Cj4gICAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICBpcnFfbWFzazsKPiAgICAg
ICAgIHN0cnVjdCBjbWRxX3RocmVhZCAgICAgICp0aHJlYWQ7Cj4gQEAgLTUyNSwxMCArNTI1LDgg
QEAgc3RhdGljIGludCBjbWRxX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
ICAgICAgICB9Cj4KPiAgICAgICAgIGNtZHEtPmlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwg
MCk7Cj4gLSAgICAgICBpZiAoIWNtZHEtPmlycSkgewo+IC0gICAgICAgICAgICAgICBkZXZfZXJy
KGRldiwgImZhaWxlZCB0byBnZXQgaXJxXG4iKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4gLSAgICAgICB9Cj4gKyAgICAgICBpZiAoY21kcS0+aXJxIDwgMCkKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIGNtZHEtPmlycTsKPgo+ICAgICAgICAgcGxhdF9kYXRhID0gKHN0cnVj
dCBnY2VfcGxhdCAqKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwo+ICAgICAgICAgaWYg
KCFwbGF0X2RhdGEpIHsKPiAtLQo+IDIuMTcuMQo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+
IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
