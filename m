Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33C2C4363C
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 16:24:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52124206FA
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 16:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2KWd73ck";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYOFhNcF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52124206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1+6l+2yDqg0afJfYB+CiICNHDEEWMy+FofD4Ktzxlr0=; b=2KWd73ckMP7VFM/MB7sZ7aPh2
	qHAOQAbWy4EOh0tf++/kAn11lzAjBPnYcxarnoGqENfwsYvgL5I9tSW/JY/rbFxuC6D7G8U5SYW+2
	PK0TQj7SHeo+gvJ8O86fw/FFEETDopz1u7N0eOc2hVqoSxYGPevd+Fl/3TbjSVQNELF7/9LeVyeX8
	hfuFpFVsQoiWE/Y4OxL51ary1kfjUDnk6D2xzln6kU4ZhhhJ35fwQ33lmaU50Slu5zlBW+g+qkZuB
	r0B6sTDPgT4JTXkJezjcxy6NsxxLSETJaqSSusWf1tzqCkN2QtVgOYNdDgBxDvQ6l53fmO7xDplqh
	3bLIUoN1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kONrC-0003fU-Bx; Fri, 02 Oct 2020 16:24:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kONr7-0003dG-9q; Fri, 02 Oct 2020 16:24:26 +0000
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E130E20758;
 Fri,  2 Oct 2020 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601655864;
 bh=XtQ41aWaPx5+LCDrh/lKMRy5xvIsR4YWuY5PCakwRNQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZYOFhNcFXvip8lefRJnbyFaI5/HwfeDCEj0Me6o8cW0aZDd1ptML2xpAHO5wN2Fzt
 gANDZaMG7TxBKVsxxs+eHw7SJRzbJeKapSno5Me62+RcoIAs49KXqkdaKPpP8ZwDp2
 BkhRqVcJ+A80+E7ygmaqaZ0jcoi1zB63H5w75pag=
Received: by mail-ed1-f48.google.com with SMTP id g4so2272703edk.0;
 Fri, 02 Oct 2020 09:24:23 -0700 (PDT)
X-Gm-Message-State: AOAM532j/fiOisrRLjTUd2hsvzvcDTxgeYRJxUH6eGMejFnqsWNoWxgn
 bYHRi/FLulCTJIBUpb9A0DcvU4byYMoDiGLfXg==
X-Google-Smtp-Source: ABdhPJyN//4Cvislw//mSBvfQZBNuVjL4cllDiY+cszv6mSEUbslgvX+YzhtpkT4+KNZyrMAfQjtD7p7+MGd7rEHeu0=
X-Received: by 2002:aa7:cd56:: with SMTP id v22mr393465edw.49.1601655862471;
 Fri, 02 Oct 2020 09:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1598497593-15781-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1598497593-15781-3-git-send-email-neal.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 3 Oct 2020 00:24:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-KTs6-5ZpzAWs0Yn-R3AJc8tRhDyKbp8bx60EJtfu-_Q@mail.gmail.com>
Message-ID: <CAAOTY_-KTs6-5ZpzAWs0Yn-R3AJc8tRhDyKbp8bx60EJtfu-_Q@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] soc: mediatek: add mt6779 devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_122425_485985_D301A750 
X-CRM114-Status: GOOD (  18.52  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, DTML <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDjm
nIgyN+aXpSDpgLHlm5sg5LiK5Y2IMTE6MDflr6vpgZPvvJoKPgo+IE1lZGlhVGVrIGJ1cyBmYWJy
aWMgcHJvdmlkZXMgVHJ1c3Rab25lIHNlY3VyaXR5IHN1cHBvcnQgYW5kIGRhdGEKPiBwcm90ZWN0
aW9uIHRvIHByZXZlbnQgc2xhdmVzIGZyb20gYmVpbmcgYWNjZXNzZWQgYnkgdW5leHBlY3RlZAo+
IG1hc3RlcnMuCj4gVGhlIHNlY3VyaXR5IHZpb2xhdGlvbiBpcyBsb2dnZWQgYW5kIHNlbnQgdG8g
dGhlIHByb2Nlc3NvciBmb3IKPiBmdXJ0aGVyIGFuYWx5c2lzIG9yIGNvdW50ZXJtZWFzdXJlcy4K
Pgo+IEFueSBvY2N1cnJlbmNlIG9mIHNlY3VyaXR5IHZpb2xhdGlvbiB3b3VsZCByYWlzZSBhbiBp
bnRlcnJ1cHQsIGFuZAo+IGl0IHdpbGwgYmUgaGFuZGxlZCBieSBtdGstZGV2YXBjIGRyaXZlci4g
VGhlIHZpb2xhdGlvbgo+IGluZm9ybWF0aW9uIGlzIHByaW50ZWQgaW4gb3JkZXIgdG8gZmluZCB0
aGUgbXVyZGVyZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0
ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9LY29uZmlnICAgICAgfCAgICA5
ICsrCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL01ha2VmaWxlICAgICB8ICAgIDEgKwo+ICBkcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstZGV2YXBjLmMgfCAgMzA1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzMTUgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWRldmFwYy5jCj4K
CltzbmlwXQoKPiArCj4gK3N0YXRpYyBpbnQgbXRrX2RldmFwY19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUg
PSBwZGV2LT5kZXYub2Zfbm9kZTsKPiArICAgICAgIHN0cnVjdCBtdGtfZGV2YXBjX2NvbnRleHQg
KmN0eDsKPiArICAgICAgIHUzMiBkZXZhcGNfaXJxOwo+ICsgICAgICAgaW50IHJldDsKPiArCj4g
KyAgICAgICBpZiAoSVNfRVJSKG5vZGUpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RF
VjsKPiArCj4gKyAgICAgICBjdHggPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpj
dHgpLCBHRlBfS0VSTkVMKTsKPiArICAgICAgIGlmICghY3R4KQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gLUVOT01FTTsKPiArCj4gKyAgICAgICBjdHgtPmRhdGEgPSBvZl9kZXZpY2VfZ2V0X21h
dGNoX2RhdGEoJnBkZXYtPmRldik7Cj4gKyAgICAgICBjdHgtPmRldiA9ICZwZGV2LT5kZXY7Cj4g
Kwo+ICsgICAgICAgY3R4LT5pbmZyYV9iYXNlID0gb2ZfaW9tYXAobm9kZSwgMCk7Cj4gKyAgICAg
ICBpZiAoIWN0eC0+aW5mcmFfYmFzZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gKwo+ICsgICAgICAgZGV2YXBjX2lycSA9IGlycV9vZl9wYXJzZV9hbmRfbWFwKG5vZGUsIDAp
Owo+ICsgICAgICAgaWYgKCFkZXZhcGNfaXJxKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiArCj4gKyAgICAgICBjdHgtPmluZnJhX2NsayA9IGRldm1fY2xrX2dldCgmcGRldi0+
ZGV2LCAiZGV2YXBjLWluZnJhLWNsb2NrIik7Cj4gKyAgICAgICBpZiAoSVNfRVJSKGN0eC0+aW5m
cmFfY2xrKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAgICAg
aWYgKGNsa19wcmVwYXJlX2VuYWJsZShjdHgtPmluZnJhX2NsaykpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwoKV2hhdCB3b3VsZCBoYXBwZW4gaWYgeW91IGRvIG5vdCBlbmFibGUg
dGhpcyBjbG9jaz8gSSB0aGluayB0aGlzCmhhcmR3YXJlIGlzIGFscmVhZHkgaW5pdGlhbGl6ZWQg
aW4gdHJ1c3Qgem9uZS4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsKPiArICAgICAgIHJldCA9
IGRldm1fcmVxdWVzdF9pcnEoJnBkZXYtPmRldiwgZGV2YXBjX2lycSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKGlycV9oYW5kbGVyX3QpZGV2YXBjX3Zpb2xhdGlvbl9pcnEsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElSUUZfVFJJR0dFUl9OT05FLCAiZGV2YXBj
IiwgY3R4KTsKPiArICAgICAgIGlmIChyZXQpIHsKPiArICAgICAgICAgICAgICAgY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKGN0eC0+aW5mcmFfY2xrKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIHJl
dDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBj
dHgpOwo+ICsKPiArICAgICAgIHN0YXJ0X2RldmFwYyhjdHgpOwo+ICsKPiArICAgICAgIHJldHVy
biAwOwo+ICt9Cj4gKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
