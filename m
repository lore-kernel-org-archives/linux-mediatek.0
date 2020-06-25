Return-Path: <SRS0=1s7f=AG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE088C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 06:19:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ADAB206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2020 06:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kiiISlh5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yZZ1VTEy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ADAB206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p5IZBowbGkp868GMUpl6QR7VdC2XCArPh0VORDeNpU4=; b=kiiISlh5kPiUcFPFi2u5DeJ59
	M8vhwQ8qeK9P2Rak/O0kornkV2FjT9afrJbqJr+zo3+a2OmRWu0yu9dFvO8fQjARds011n4vFu+Sp
	JbjFVYShgaNj5QJc2aWzel/xww2ZfCkF8zvUbdmXj3A5ephFsk9aeM3Fuxb3o5ERlBigOXI4DuDza
	LGf37yifDpfvdVUHwV8ZIe1c0zogBGvvvLpbehMt19OgqqU+7I8rEla7MV0riyiZUvPhAQiy7iD2O
	93Sk01bZnvEX4oBxbFcFTt86sTJ/l8HnWOFiN+VTd9fT2IRdBBd78O7BTYv8cMeliTM5q2xpl3984
	SETE2qJAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1joLEF-0003XA-Sp; Thu, 25 Jun 2020 06:19:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joLEC-0003WZ-PU; Thu, 25 Jun 2020 06:19:17 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B4222081A;
 Thu, 25 Jun 2020 06:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593065955;
 bh=YbHGP11pHUX7giQDfbZQIvNPcOxAKEPuTaMFvWI1/mI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yZZ1VTEyTafiT2YXaenbvvrLdDlo6nFFtivq2bXBWSj94Ii9nNCaabS/k/Xi9yKMm
 bXTyiyj2+7xgLAopMan2JLxV7MFY0KFkYmFCuPHveByBaBPRIp21WH48T3z1TWAOEh
 3tV3DmTnBlzIa94uLY8ifxSrlGuF5vHpiTgjqs9s=
Received: by mail-ej1-f49.google.com with SMTP id rk21so4790334ejb.2;
 Wed, 24 Jun 2020 23:19:15 -0700 (PDT)
X-Gm-Message-State: AOAM532ezD5Ez9RFFzweNQb6WJQpE/Oqrkn7RAwuF/3Hf318iolhT7PM
 /7MX7DDCYY5WTlK9D5HCYpB3FVyQGBOH9iC+Tw==
X-Google-Smtp-Source: ABdhPJyi7O/XYnvtXHx6vhbw1CBavl9kSew93qwynQ4pKthExCyrXGBoxEehFW4NkW5yOppX2nLWouhaN+4dRcFwtPU=
X-Received: by 2002:a17:906:856:: with SMTP id
 f22mr18224560ejd.245.1593065953692; 
 Wed, 24 Jun 2020 23:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <1592559720-8482-1-git-send-email-neal.liu@mediatek.com>
 <1592559720-8482-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1592559720-8482-3-git-send-email-neal.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 25 Jun 2020 14:19:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-hfQFL_CRHTC7RxOLSe0BYzWf_f-QUvjBp4JjaAcX1PA@mail.gmail.com>
Message-ID: <CAAOTY_-hfQFL_CRHTC7RxOLSe0BYzWf_f-QUvjBp4JjaAcX1PA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: mediatek: devapc: add devapc-mt6873 driver
To: Neal Liu <neal.liu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDbm
nIgxOeaXpSDpgLHkupQg5LiL5Y2INjowMeWvq+mBk++8mgo+Cj4gTVQ2ODczIGJ1cyBmcmFicmlj
IHByb3ZpZGVzIFRydXN0Wm9uZSBzZWN1cml0eSBzdXBwb3J0IGFuZCBkYXRhCj4gcHJvdGVjdGlv
biB0byBwcmV2ZW50IHNsYXZlcyBmcm9tIGJlaW5nIGFjY2Vzc2VkIGJ5IHVuZXhwZWN0ZWQKPiBt
YXN0ZXJzLgo+IFRoZSBzZWN1cml0eSB2aW9sYXRpb25zIGFyZSBsb2dnZWQgYW5kIHNlbnQgdG8g
dGhlIHByb2Nlc3NvciBmb3IKPiBmdXJ0aGVyIGFuYWx5c2lzIG9yIGNvdW50ZXJtZWFzdXJlcy4K
Pgo+IEFueSBvY2N1cnJlbmNlIG9mIHNlY3VyaXR5IHZpb2xhdGlvbiB3b3VsZCByYWlzZSBhbiBp
bnRlcnJ1cHQsIGFuZAo+IGl0IHdpbGwgYmUgaGFuZGxlZCBieSBkZXZhcGMtbXQ2ODczIGRyaXZl
ci4gVGhlIHZpb2xhdGlvbgo+IGluZm9ybWF0aW9uIGlzIHByaW50ZWQgaW4gb3JkZXIgdG8gZmlu
ZCB0aGUgbXVyZGVyZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExpdSA8bmVhbC5saXVAbWVk
aWF0ZWsuY29tPgo+IC0tLQoKW3NuaXBdCgo+ICsKPiArLyoKPiArICogc3JhbXJvbV92aW9faGFu
ZGxlciAtIGNsZWFuIHNyYW1yb20gdmlvbGF0aW9uICYgcHJpbnQgdmlvbGF0aW9uIGluZm9ybWF0
aW9uCj4gKyAqICAgICAgICAgICAgICAgICAgICAgIGZvciBkZWJ1Z2dpbmcuCj4gKyAqLwo+ICtz
dGF0aWMgdm9pZCBzcmFtcm9tX3Zpb19oYW5kbGVyKHN0cnVjdCBtdGtfZGV2YXBjX2NvbnRleHQg
KmRldmFwY19jdHgpCj4gK3sKPiArICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfc3JhbXJvbV9zZWNf
dmlvX2Rlc2MgKnNyYW1yb21fdmlvczsKPiArICAgICAgIHN0cnVjdCBtdGtfZGV2YXBjX3Zpb19p
bmZvICp2aW9faW5mbzsKPiArICAgICAgIHN0cnVjdCBhcm1fc21jY2NfcmVzIHJlczsKPiArICAg
ICAgIHNpemVfdCBzcmFtcm9tX3Zpb19zdGE7Cj4gKyAgICAgICBpbnQgc3JhbXJvbV92aW87Cj4g
KyAgICAgICB1MzIgcnc7Cj4gKwo+ICsgICAgICAgc3JhbXJvbV92aW9zID0gZGV2YXBjX2N0eC0+
c29jLT5zcmFtcm9tX3NlY192aW9zOwo+ICsgICAgICAgdmlvX2luZm8gPSBkZXZhcGNfY3R4LT5z
b2MtPnZpb19pbmZvOwo+ICsKPiArICAgICAgIGFybV9zbWNjY19zbWMoTVRLX1NJUF9LRVJORUxf
Q0xSX1NSQU1ST01fVklPLAo+ICsgICAgICAgICAgICAgICAgICAgICAwLCAwLCAwLCAwLCAwLCAw
LCAwLCAmcmVzKTsKPiArCgpUaGlzIGlycSBoYW5kbGVyIGNhbGwgYXJtX3NtY2NjX3NtYygpIHRv
IGdldCBpbnRvIFRydXN0Wm9uZSwgd2h5IG5vdApsZXQgdGhlIHdob2xlIGlycSBoYW5kbGVyIGlu
IFRydXN0Wm9uZT8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsgICAgICAgc3JhbXJvbV92aW8g
PSByZXMuYTA7Cj4gKyAgICAgICBzcmFtcm9tX3Zpb19zdGEgPSByZXMuYTE7Cj4gKyAgICAgICB2
aW9faW5mby0+dmlvX2FkZHIgPSByZXMuYTI7Cj4gKwo+ICsgICAgICAgaWYgKHNyYW1yb21fdmlv
ID09IFNSQU1fVklPTEFUSU9OKQo+ICsgICAgICAgICAgICAgICBwcl9pbmZvKFBGWCAiU1JBTSB2
aW9sYXRpb24gaXMgdHJpZ2dlcmVkXG4iKTsKPiArICAgICAgIGVsc2UgaWYgKHNyYW1yb21fdmlv
ID09IFJPTV9WSU9MQVRJT04pCj4gKyAgICAgICAgICAgICAgIHByX2luZm8oUEZYICJST00gdmlv
bGF0aW9uIGlzIHRyaWdnZXJlZFxuIik7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAg
IHJldHVybjsKPiArCj4gKyAgICAgICB2aW9faW5mby0+bWFzdGVyX2lkID0gKHNyYW1yb21fdmlv
X3N0YSAmIHNyYW1yb21fdmlvcy0+dmlvX2lkX21hc2spCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgPj4gc3JhbXJvbV92aW9zLT52aW9faWRfc2hpZnQ7Cj4gKyAgICAgICB2aW9faW5mby0+ZG9t
YWluX2lkID0gKHNyYW1yb21fdmlvX3N0YSAmIHNyYW1yb21fdmlvcy0+dmlvX2RvbWFpbl9tYXNr
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgID4+IHNyYW1yb21fdmlvcy0+dmlvX2RvbWFpbl9z
aGlmdDsKPiArICAgICAgIHJ3ID0gKHNyYW1yb21fdmlvX3N0YSAmIHNyYW1yb21fdmlvcy0+dmlv
X3J3X21hc2spID4+Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3JhbXJvbV92aW9zLT52aW9f
cndfc2hpZnQ7Cj4gKwo+ICsgICAgICAgaWYgKHJ3KQo+ICsgICAgICAgICAgICAgICB2aW9faW5m
by0+d3JpdGUgPSAxOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICB2aW9faW5mby0+
cmVhZCA9IDE7Cj4gKwo+ICsgICAgICAgcHJfaW5mbyhQRlggIiVzOiBtYXN0ZXJfaWQ6MHgleCwg
ZG9tYWluX2lkOjB4JXgsIHJ3OiVzLCB2aW9fYWRkcjoweCV4XG4iLAo+ICsgICAgICAgICAgICAg
ICBfX2Z1bmNfXywgdmlvX2luZm8tPm1hc3Rlcl9pZCwgdmlvX2luZm8tPmRvbWFpbl9pZCwKPiAr
ICAgICAgICAgICAgICAgcncgPyAiV3JpdGUiIDogIlJlYWQiLCB2aW9faW5mby0+dmlvX2FkZHIp
Owo+ICt9Cj4gKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
