Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E25CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 14:56:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45E9F60F6B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 14:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45E9F60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2k9I6wJcWCQEWW4xMzjRDNDY0Fdn2cV5l3a0tC1rqM=; b=PpEnqpneQk2c5i
	42dAaLywGPukGCvOcWwdt3k7pflBaXt+NjJZvBmPOi3o7baapPlITiXypQlCCF8oA9ObSHIoMwTaT
	YvHgm0G/hoW1IX2sbyOmPK0CBXNBvl7Q0IHwhaeNUhCxstdRQxm51a5dkhuhg8mFUSEHJTtUwufeT
	w4A1UdAM0iDenY6W7q1L3MCdXPUqFR0y9CYgpoSzrfMClflry0hWSiTAK7oVHRqvMDqC7Os+M9NNT
	7Lsgq88LLU36BMlPsJ+b69rw8atbHLn757csHH3yMAOK6Om+aCq5esdxPXwKxwuxBLwPkFd0f4J4c
	vyz7aLpZMzzLVhISCFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYrIN-003AWW-8m; Fri, 08 Oct 2021 14:56:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYrIA-003AU8-PP; Fri, 08 Oct 2021 14:56:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F53961040;
 Fri,  8 Oct 2021 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633704970;
 bh=xujWQTXjYOhyZ2RyQwPqWI29++CG8GP7k2MyQXlnTRA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AH2dzPs4VbqHv0fMfMl1wjfvhNO/Splqr4Roc8wIHYvAODqYrwqSUaxX5yV6kjri6
 XAvYQ0CDeWUGPB1THI3VagKKG9/Dgh5fPkNMxuY6V3ka56g+MernznEz8lTWV6Vddr
 DKQw0yBdfhrKgJMjQqT+7PnFl1/V/iYLLOLa9n7MA9eCoAinbEFu6WYdn/zqeZmH7k
 0RZhITQ+WFuJK5gvnCOkwrzvE34p8jbWCjbSUU/GgHeAgU6OvHUWnUZyrBRRvzv0gO
 TPvRQPbdaBmSyTOUwZJFGzBiwl+0wRHEDKnraWAfWlr7mUGBC3VNYO2YDYHWatVhoz
 erlqgYHBGH5eg==
Received: by mail-ed1-f41.google.com with SMTP id i20so21235079edj.10;
 Fri, 08 Oct 2021 07:56:10 -0700 (PDT)
X-Gm-Message-State: AOAM532oY5/NAqWOmCKnX1u/sT4mkGhxwv2OsKIKdzbAqpoYBKBAExpV
 p509un17SX6cUeKsY3bntD7FjD92wDwGyTx5Hg==
X-Google-Smtp-Source: ABdhPJx3Y34GgHtBFp/5Jw7IJqKuehz0xBb3j7mhVfZO4jfZeudpUPDTGLYxF4PGpxhhTFHTvDVGL3iKsa0QZCK7oFA=
X-Received: by 2002:a05:6402:143b:: with SMTP id
 c27mr16161354edx.224.1633704968209; 
 Fri, 08 Oct 2021 07:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210930131850.21202-1-yongqiang.niu@mediatek.com>
 <20210930131850.21202-2-yongqiang.niu@mediatek.com>
 <CAAOTY_82OaLAz0o6BUcogQ=xgYTsFJSov=J72UzMwwq3YtkPdg@mail.gmail.com>
 <ffe2d4aaf4f884c4de2d2a157d08087cef3e6a0f.camel@mediatek.com>
In-Reply-To: <ffe2d4aaf4f884c4de2d2a157d08087cef3e6a0f.camel@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 8 Oct 2021 22:55:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9xhga5yP7OVB6npPesTHc8UR3WydwOvY=Fvo-CCawxLg@mail.gmail.com>
Message-ID: <CAAOTY_9xhga5yP7OVB6npPesTHc8UR3WydwOvY=Fvo-CCawxLg@mail.gmail.com>
Subject: Re: [PATCH v2,
 1/1] mailbox: cmdq: add instruction time-out interrupt support
To: "yongqiang.niu" <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_075610_885079_34320909 
X-CRM114-Status: GOOD (  30.37  )
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

SGksIFlvbmdxaWFuZzoKCnlvbmdxaWFuZy5uaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDEw5pyIOOaXpSDpgLHkupQg5LiK5Y2IOTo0OeWvq+mBk++8mgo+Cj4gT24g
VHVlLCAyMDIxLTEwLTA1IGF0IDA3OjQxICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4g
SGksIFlvbmdxaWFuZzoKPiA+Cj4gPiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlh
dGVrLmNvbT4g5pa8IDIwMjHlubQ55pyIMzDml6Ug6YCx5ZubIOS4i+WNiDk6MTjlr6vpgZPvvJoK
PiA+ID4KPiA+ID4gYWRkIHRpbWUtb3V0IGN5Y2xlIHNldHRpbmcgdG8gbWFrZSBzdXJlIHRpbWUt
b3V0IGludGVycnVwdCBpcnEKPiA+ID4gd2lsbCBoYXBwZW5lZCB3aGVuIGluc3RydWN0aW9uIHRp
bWUtb3V0IGZvciB3YWl0IGFuZCBwb2xsCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdx
aWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRy
aXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgfCAxMSArKysrKysrKysrKwo+ID4gPiAg
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiA+ID4gYi9kcml2ZXJzL21haWxi
b3gvbXRrLWNtZHEtbWFpbGJveC5jCj4gPiA+IGluZGV4IDY0MTc1YTg5MzMxMi4uMTk3YjAzMjIy
Zjk0IDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5j
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiA+ID4gQEAg
LTM2LDYgKzM2LDcgQEAKPiA+ID4gICNkZWZpbmUgQ01EUV9USFJfRU5EX0FERFIgICAgICAgICAg
ICAgIDB4MjQKPiA+ID4gICNkZWZpbmUgQ01EUV9USFJfV0FJVF9UT0tFTiAgICAgICAgICAgIDB4
MzAKPiA+ID4gICNkZWZpbmUgQ01EUV9USFJfUFJJT1JJVFkgICAgICAgICAgICAgIDB4NDAKPiA+
ID4gKyNkZWZpbmUgQ01EUV9USFJfSU5TVE5fVElNRU9VVF9DWUNMRVMgIDB4NTAKPiA+ID4KPiA+
ID4gICNkZWZpbmUgR0NFX0dDVExfVkFMVUUgICAgICAgICAgICAgICAgIDB4NDgKPiA+ID4KPiA+
ID4gQEAgLTU0LDYgKzU1LDE1IEBACj4gPiA+ICAjZGVmaW5lIENNRFFfSlVNUF9CWV9PRkZTRVQg
ICAgICAgICAgICAweDEwMDAwMDAwCj4gPiA+ICAjZGVmaW5lIENNRFFfSlVNUF9CWV9QQSAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MTAwMDAwMDEKPiA+ID4KPiA+ID4gKy8qCj4gPiA+ICsgKiBp
bnN0cnVjdGlvbiB0aW1lLW91dAo+ID4gPiArICogY3ljbGVzIHRvIGlzc3VlIGluc3RydWN0aW9u
IHRpbWUtb3V0IGludGVycnVwdCBmb3Igd2FpdCBhbmQKPiA+ID4gcG9sbCBpbnN0cnVjdGlvbnMK
PiA+ID4gKyAqIEdDRSBheGlfY2xvY2sgMTU2TUh6Cj4gPiA+ICsgKiAxIGN5Y2xlID0gNi40MW5z
Cj4gPiA+ICsgKiBpbnN0cnVjdGlvbiB0aW1lIG91dCAyXjIyKjIqNi40MW5zID0gNTNtcwo+ID4K
PiA+IEZvciBkaWZmZXJlbnQgY2xpZW50cywgdGhlIHRpbWVvdXQgdmFsdWUgd291bGQgYmUgZGlm
ZmVyZW50LCBhbmQgZWFjaAo+ID4gY2xpZW50IGNvdWxkIHVzZSB0aW1lciB0byBkZXRlY3QgdGlt
ZW91dCwgc28gaXQncyBub3QgbmVjZXNzYXJ5IHRvCj4gPiBlbmFibGUgdGltZW91dCBpbiBjbWRx
IGRyaXZlci4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQ2h1bi1LdWFuZy4KPgo+IGlmIHdlIGRvIG5v
dCBzZXQgY21kcSBoYXJkd2FyZSB0aW1lb3V0LCB0aGlzIGNvbmRpdGlvbiB3aWxsIG5ldmVyCj4g
aGFwcGVuCj4gY21kcV90aHJlYWRfaXJxX2hhbmRsZXIKPiBpZiAoaXJxX2ZsYWcgJiBDTURRX1RI
Ul9JUlFfRVJST1IpCj4gICAgICAgICAgICAgICAgIGVyciA9IHRydWU7Cj4KPiBhbmQgbm8gZXJy
b3IgY2FsbGJhY2sKPiBlbHNlIGlmIChlcnIpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBj
bWRxX3Rhc2tfZXhlY19kb25lKHRhc2ssIC1FTk9FWEVDKTsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBjbWRxX3Rhc2tfaGFuZGxlX2Vycm9yKGN1cnJfdGFzayk7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAga2ZyZWUodGFzayk7Cj4gICAgICAgICAgICAgICAgIH0KPiB0aGUgY2xpZW50IHdp
bGwgbmV2ZXIgcmVjZWl2ZWQgdGhlIGVycm9yIGNhbGxiYWNrLCBjbWRxIGhhcmR3YXJlIHdpbGwK
PiBwb2xsIHRoZSBldmVudCBmb3IgZXZlciBhbmQgbm8gcmVwb3J0IHRpbWVvdXQKCkkgdGhpbmsg
dGhlcmUgYXJlIHR3byB3YXkgdG8gaW1wbGVtZW50IHRoZSB0aW1lb3V0IG1lY2hhbmlzbS4gVGhl
CmZpcnN0IHdheSBpcyB0byB1c2UgdGhlIEdDRSBoYXJkd2FyZSB0byBkZXRlY3QgdGltZW91dC4g
VGhlIHNlY29uZCB3YXkKaXMgdGhhdCBjbGllbnQgZHJpdmVyIHVzZSB0aW1lciB0byBkZXRlY3Qg
dGltZW91dCwgd2hlbiBpdCdzIHRpbWVvdXQsCnVzZSBtYm94X2ZsdXNoKCkgdG8gY2xlYW4gdXAg
dGhlIHBhY2tldHMgaW4gbXRrIGNtZHEgZHJpdmVyLCBhbmQKcmVtb3ZlIHRoZSBlcnJvciBoYW5k
bGUgaW4gaXJxIGhhbmRsZXIuCklmIHlvdSB0aGluayB0aGUgZmlyc3Qgd2F5IGlzIGJldHRlciwg
SSB0aGluayB5b3Ugc2hvdWxkIHBhc3MgdGhlCnRpbWVvdXQgdmFsdWUgZnJvbSBjbGllbnQgZHJp
dmVyIHRvIGNtZHEgZHJpdmVyIGJlY2F1c2UgZWFjaCBjbGllbnQKZHJpdmVyIGhhcyBkaWZmZXJl
bnQgdGltZW91dCB2YWx1ZS4gQW5kIHRoZSBHQ0UgY2xvY2sgbWF5IGJlIGRpZmZlcmVudAppbiBl
YWNoIFNvQywgc28gdXNlIGNsa19nZXRfcmF0ZSgpIHRvIGdldCB0aGUgY2xvY2sgZnJlcXVlbmN5
IGZvcgpkaWZmZXJlbnQgU29DLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gPgo+ID4gPiArICov
Cj4gPiA+ICsjZGVmaW5lIENNRFFfSU5TVE5fVElNRU9VVF9DWUNMRVMgICAgICAyMgo+ID4gPiAr
Cj4gPiA+ICBzdHJ1Y3QgY21kcV90aHJlYWQgewo+ID4gPiAgICAgICAgIHN0cnVjdCBtYm94X2No
YW4gICAgICAgICpjaGFuOwo+ID4gPiAgICAgICAgIHZvaWQgX19pb21lbSAgICAgICAgICAgICpi
YXNlOwo+ID4gPiBAQCAtMzc2LDYgKzM4Niw3IEBAIHN0YXRpYyBpbnQgY21kcV9tYm94X3NlbmRf
ZGF0YShzdHJ1Y3QgbWJveF9jaGFuCj4gPiA+ICpjaGFuLCB2b2lkICpkYXRhKQo+ID4gPiAgICAg
ICAgICAgICAgICAgd3JpdGVsKCh0YXNrLT5wYV9iYXNlICsgcGt0LT5jbWRfYnVmX3NpemUpID4+
IGNtZHEtCj4gPiA+ID5zaGlmdF9wYSwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICB0aHJl
YWQtPmJhc2UgKyBDTURRX1RIUl9FTkRfQUREUik7Cj4gPiA+Cj4gPiA+ICsgICAgICAgICAgICAg
ICB3cml0ZWwoQ01EUV9JTlNUTl9USU1FT1VUX0NZQ0xFUywgdGhyZWFkLT5iYXNlICsKPiA+ID4g
Q01EUV9USFJfSU5TVE5fVElNRU9VVF9DWUNMRVMpOwo+ID4gPiAgICAgICAgICAgICAgICAgd3Jp
dGVsKHRocmVhZC0+cHJpb3JpdHksIHRocmVhZC0+YmFzZSArCj4gPiA+IENNRFFfVEhSX1BSSU9S
SVRZKTsKPiA+ID4gICAgICAgICAgICAgICAgIHdyaXRlbChDTURRX1RIUl9JUlFfRU4sIHRocmVh
ZC0+YmFzZSArCj4gPiA+IENNRFFfVEhSX0lSUV9FTkFCTEUpOwo+ID4gPiAgICAgICAgICAgICAg
ICAgd3JpdGVsKENNRFFfVEhSX0VOQUJMRUQsIHRocmVhZC0+YmFzZSArCj4gPiA+IENNRFFfVEhS
X0VOQUJMRV9UQVNLKTsKPiA+ID4gLS0KPiA+ID4gMi4yNS4xCj4gPiA+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
