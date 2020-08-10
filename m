Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8547C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 23:35:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94CD220748
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 23:35:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pbO3LRMY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBW9u2ml"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94CD220748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m21HQ2IqxUj91qCbfNqLneqLuiy0D1iJl+df+ehjeRw=; b=pbO3LRMYHyM6gLWhJXuS7ikTC
	cwstP77bBknObaZdNFwIZveZvg4kZ6pKTMvPX6jcZM/b2WWukFJLmxIYcMvFrZD9bgjZd4jY3DQQi
	C4vm3T/JDuTgRZUnM/PrjOAe9uCjmlCFZHaDdXwrG14toVC6XQUxgYLplgoNAyhA6HcN7oxQEvw4a
	2BAo8Rd7ZaGejCPrnBNnCPFrxQXr8vxNcMUw2K8z9y+byyShrRKV3W5fNKaKTG49K0P6nae5z8IrS
	w/Z73I+FQoQu/8JdrbJzV6o7qeHMflDtdI5H7rln5nAfMSa/orFNIoreWzW2RV1QVI5R3KUZTLh17
	LqfJ6jNTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5HKD-0005F1-RG; Mon, 10 Aug 2020 23:35:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5HK9-0005Dh-MG; Mon, 10 Aug 2020 23:35:26 +0000
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7937420748;
 Mon, 10 Aug 2020 23:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597102524;
 bh=mUFFmkou94l0+oI7TalaQjtTqBSFTvrCHtwnmz6LL0A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vBW9u2mlbk5HoC5arbS7XOKaq/n3mNVP07JZtF9T6scT1DVVIeBJqU1VYp5xuk/Yn
 4FBVO3aOU5SVhzZLb1x+ovVr9CuYnZuaAJAbppWuHOUphiM+H4QnI3UuYWb5JrcMPm
 L/7l50z+giBwjQtpb4bayVeukl18kzJK9afq3cWY=
Received: by mail-ej1-f53.google.com with SMTP id g19so11106601ejc.9;
 Mon, 10 Aug 2020 16:35:24 -0700 (PDT)
X-Gm-Message-State: AOAM530zolN5iOXDd42AVr+oJrQ5kegreM8oh0wUTmdpJQdRrH57w70M
 ZykjwdCzdqbNiao5WjSIGiqwAF04ceo7nf8i7g==
X-Google-Smtp-Source: ABdhPJwBk2x2WfFrL8VJcib6l0+cEkseFLtLxcww+LQRp8tRkSoMlZaGe/disJzE6QbWTXApPzJSvByWzdkYXp0Lx7g=
X-Received: by 2002:a17:906:2356:: with SMTP id
 m22mr23377263eja.124.1597102523075; 
 Mon, 10 Aug 2020 16:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-4-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-4-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 11 Aug 2020 07:35:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY____7Yd1Gh-22oiOxsvftBjOHQ0T9CmKtGw6XLjw11gcQ@mail.gmail.com>
Message-ID: <CAAOTY____7Yd1Gh-22oiOxsvftBjOHQ0T9CmKtGw6XLjw11gcQ@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 3/7] mtk-mmsys: add mmsys private data
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_193525_846786_E673687B 
X-CRM114-Status: GOOD (  21.15  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDjmnIg45pelIOmAseWFrSDkuIrljYgxMDo1NuWvq+mBk++8mgo+Cj4gdGhl
IHJlYXNvbiB3aHkgc3BsaXQgb3V0IGRpc3BsYXkgY29ubmVjdGlvbiBmdW5jdGlvbjoKPiAxLiB0
aGVyZSB3aWxsIG1vcmUgYW5kIG1vcmUgTWVkaWF0ZWsgU29jIHVwc3RyZWFtLCBhbmQgdGhlIGRp
c3BsYXkgcGF0aAo+IGNvbm5lY3Rpb24gZnVuY3Rpb24gbXRrX21tc3lzX2RkcF9tb3V0X2VuLCBt
dGtfbW1zeXNfZGRwX3NlbF9pbiBhbmQKPiBtdGtfbW1zeXNfZGRwX3NvdXRfc2VsIHdpbGwgY29t
cGxpY2F0ZWQgbW9yZSBhbmQgbW9yZQo+IDIuIG1hbnkgb2YgdGhlIGNvbm5lY3Rpb24gYXJlIG9u
bHkgdXNlZCBpbiBzb21lIFNvQywgYW5kIHVzZWxlc3MgZm9yCj4gb3RoZXIgU29DIGFuZCBub3Qg
cmVhZGFibGUsCj4gMy4gaWYgd2UgYWRkIGEgbmV3IFNvQyBjb25uZWN0aW9uLCB3ZSBuZWVkIGNo
ZWNrIGlzIHRoaXMgYWZmZWN0IG90aGVyCj4gU29jCj4KPiB0aGUgcmVhc29uIHdoeSBub3QgYXBw
bHkgdGhlIHByZXZpb3VzIHNlcmllcyBtZXRob2Q6Cj4gdGhpcyB2ZXJzaW9uIGlzIG1vcmUgcmVh
ZGFibGUgYW5kIGNsZWFyCj4gaWYgZ28gb24gdXNlIHY2LCBleGNlcHQgbXQyNzAxL210ODE3My9t
dDI3MTIsIHdlIG5lZWQgYWRkIHR3byBtb3JlCj4gcHJpdmF0ZSBkYXRhIGFycmF5IGZvciBtdDY3
NzkgYW5kIG10Njc5NywgYW5kIHRoZSBjb25uZWN0IGZ1bmN0aW9uCj4gd2lsbCBhZGQgbW9yZSBp
Zi9lbHNlIHVzZWNhc2UKPgo+IG1vdmUgY3VycmVudCBkaXNwbGF5IGNvbm5lY3Rpb24gZnVuY3Rp
b24gaW50byBtdDI3MDEtbW1zeXMuYwo+IGtlZXAgbXQyNzAxL210ODE3My9tdDI3MTIvbXQ2Nzc5
L210Njc5NyB3aXRoIG9yaWdpbmFsIHZlcnNpb24KPiBjb25uZWN0aW9uIGZ1bmN0aW9uCj4gdGhl
IGNvcnJlc3BvbmRlZCBTb0MgdXBzdHJlYW0gbWVtYmVyIHdpbGwgY29kaW5nIHRoZXNlIGFuZCB0
ZXN0IGl0Cj4gb24gdGhlIFNvQyBpZiBpdCBpcyBuZWVkLgo+CgpGb3IgdGhpcyBwYXRjaCwgSSBw
cmVmZXIgWzFdJ3MgaW1wbGVtZW50YXRpb24uIEluIFsxXSwgZm9yIGVhY2ggU29DLAp0aGUgb25s
eSBkaWZmZXJlbmNlIGlzIGFuIGFycmF5IGZvciByb3V0aW5nIHJlZ2lzdGVyIHNldHRpbmcuIElu
IHRoaXMKcGF0Y2gsIHRoZSBkaWZmZXJlbmNlIGFyZSB0aHJlZSBmdW5jdGlvbiB3aGljaCBpcyBt
b3JlIGNvbXBsaWNhdGVkCnRoYW4gWzFdLiBJZiB5b3UgbGlrZSwgeW91IGNvdWxkIHBpY2sgWzFd
IHRvIHVwc3RyZWFtLgoKWzFdIGh0dHBzOi8vY2hyb21pdW0tcmV2aWV3Lmdvb2dsZXNvdXJjZS5j
b20vYy9jaHJvbWl1bW9zL3RoaXJkX3BhcnR5L2tlcm5lbC8rLzIzNDUxODYKClJlZ2FyZHMsCkNo
dW4tS3VhbmcuCgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVA
bWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9NYWtlZmlsZSAgICAg
ICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL21tc3lzL01ha2VmaWxlICAg
ICAgIHwgICAyICsKPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXQyNzAxLW1tc3lzLmMg
fCAyNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvc29jL21lZGlhdGVr
L210ay1tbXN5cy5jICAgICAgICAgIHwgMjcxICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICBpbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaCAgICB8ICAxNSArKwo+
ICA1IGZpbGVzIGNoYW5nZWQsIDMxNCBpbnNlcnRpb25zKCspLCAyMjUgZGVsZXRpb25zKC0pCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5cy9NYWtlZmlsZQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXQyNzAxLW1t
c3lzLmMKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
