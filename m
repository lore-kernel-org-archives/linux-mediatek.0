Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3889BC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 23:22:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029DD2073A
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 23:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gXwP0ed/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="djoyGjse"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 029DD2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5D/3fAQG0AWRlV1tE0c1lWDmt7HjVkQUgq2uDhudxvA=; b=gXwP0ed/9Jibinth1SfTVaeVF
	m+GPPTFRt40win9MgQTubAR234KzAEDuDZPW2soHC2R/VMJkZiVd4Lf5lC48COB9alrGZF8/RO5aQ
	o3COpgbUwBK6AlPgysydnDicYt0dytWf0yMnVxrRa1YARUWSJdTmpGHqxQRpdIPvm3glL4HPNBITp
	WgoIEykRsNMkGSy2jFwwkZu0eJLJxriKY1hOecZpMBhF5uL2eGIIO+8AorEdQv9POloghAmmsJhtb
	MYE0y/ZeAAJGdliK3SD8drJ8iy0UA6Js2uelzBS5aKi0pV2Yw9bN8T6r+aN0PMkv5oXEGjLRCrxwc
	ia9td/qcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy1a7-00080f-5v; Tue, 21 Jul 2020 23:21:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy1a3-0007zT-24; Tue, 21 Jul 2020 23:21:51 +0000
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C32520771;
 Tue, 21 Jul 2020 23:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595373709;
 bh=wTtpSu1n6XAQfccXsXj/yy7BEmnVf2cxowLIgXfPQa4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=djoyGjsek9zMyt+FdnK+r8Y+Y8cE0QjaJAoFygr9S3udNk1aNJSn3lr74jFf5KJyu
 tg8mPdg5E5OYS3dphKNMC5RAnzA2UeSmPG64dn12GcDwmnxFONm6KNtlXosq/uf84A
 BBAVo1jrC1P8LjZHeGqFxI5/no69+m2Sstbl8PbM=
Received: by mail-ed1-f44.google.com with SMTP id n2so269948edr.5;
 Tue, 21 Jul 2020 16:21:49 -0700 (PDT)
X-Gm-Message-State: AOAM532X9PDy7f6CkWAtAmgepJQ4p3dazYK1c132ybWYdzMCUBNAUaxu
 eUmN6+8HLDBbXttLeh4Y83j4yUyqO51t5Ul0ew==
X-Google-Smtp-Source: ABdhPJyyEjrBpd1nx1mUcLsn4M9oTcaAX99uq6R42dxNbGcxMzW6I48C2eM3ctFpN3ScOSRXnd6gohvyg/yKTe1Y26k=
X-Received: by 2002:a05:6402:16c7:: with SMTP id
 r7mr28579038edx.288.1595373707856; 
 Tue, 21 Jul 2020 16:21:47 -0700 (PDT)
MIME-Version: 1.0
References: <1595303971-8793-1-git-send-email-neal.liu@mediatek.com>
 <1595303971-8793-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1595303971-8793-3-git-send-email-neal.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 22 Jul 2020 07:21:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8T=DCntU8x5YEo+Pcs2J0Y4YvDaHUBdGiqEFRxghOd_Q@mail.gmail.com>
Message-ID: <CAAOTY_8T=DCntU8x5YEo+Pcs2J0Y4YvDaHUBdGiqEFRxghOd_Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_192151_244841_59F502B7 
X-CRM114-Status: GOOD (  18.58  )
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
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIgyMeaXpSDpgLHkuowg5LiL5Y2IMTI6MDDlr6vpgZPvvJoKPgo+IE1lZGlhVGVrIGJ1cyBmYWJy
aWMgcHJvdmlkZXMgVHJ1c3Rab25lIHNlY3VyaXR5IHN1cHBvcnQgYW5kIGRhdGEKPiBwcm90ZWN0
aW9uIHRvIHByZXZlbnQgc2xhdmVzIGZyb20gYmVpbmcgYWNjZXNzZWQgYnkgdW5leHBlY3RlZAo+
IG1hc3RlcnMuCj4gVGhlIHNlY3VyaXR5IHZpb2xhdGlvbiBpcyBsb2dnZWQgYW5kIHNlbnQgdG8g
dGhlIHByb2Nlc3NvciBmb3IKPiBmdXJ0aGVyIGFuYWx5c2lzIG9yIGNvdW50ZXJtZWFzdXJlcy4K
Pgo+IEFueSBvY2N1cnJlbmNlIG9mIHNlY3VyaXR5IHZpb2xhdGlvbiB3b3VsZCByYWlzZSBhbiBp
bnRlcnJ1cHQsIGFuZAo+IGl0IHdpbGwgYmUgaGFuZGxlZCBieSBtdGstZGV2YXBjIGRyaXZlci4g
VGhlIHZpb2xhdGlvbgo+IGluZm9ybWF0aW9uIGlzIHByaW50ZWQgaW4gb3JkZXIgdG8gZmluZCB0
aGUgbXVyZGVyZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0
ZWsuY29tPgo+IC0tLQoKW3NuaXBdCgo+ICsKPiArc3RhdGljIHUzMiBnZXRfc2hpZnRfZ3JvdXAo
c3RydWN0IG10a19kZXZhcGNfY29udGV4dCAqY3R4LCB1MzIgdmlvX2lkeCkKCnZpb19pZHggaXMg
dXNlbGVzcywgc28gcmVtb3ZlIGl0LgoKPiArewo+ICsgICAgICAgdTMyIHZpb19zaGlmdF9zdGE7
Cj4gKyAgICAgICB2b2lkIF9faW9tZW0gKnJlZzsKPiArCj4gKyAgICAgICByZWcgPSBjdHgtPmRl
dmFwY19wZF9iYXNlICsgY3R4LT5vZmZzZXQtPnZpb19zaGlmdF9zdGE7Cj4gKyAgICAgICB2aW9f
c2hpZnRfc3RhID0gcmVhZGwocmVnKTsKPiArCj4gKyAgICAgICBpZiAodmlvX3NoaWZ0X3N0YSkK
PiArICAgICAgICAgICAgICAgcmV0dXJuIF9fZmZzKHZpb19zaGlmdF9zdGEpOwo+ICsKPiArICAg
ICAgIHJldHVybiAzMTsKPiArfQo+ICsKCltzbmlwXQoKPiArCj4gKy8qCj4gKyAqIG10a19kZXZh
cGNfZHVtcF92aW9fZGJnIC0gZ2V0IHRoZSB2aW9sYXRpb24gaW5kZXggYW5kIGR1bXAgdGhlIGZ1
bGwgdmlvbGF0aW9uCj4gKyAqICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVidWcgaW5mb3Jt
YXRpb24uCj4gKyAqLwo+ICtzdGF0aWMgYm9vbCBtdGtfZGV2YXBjX2R1bXBfdmlvX2RiZyhzdHJ1
Y3QgbXRrX2RldmFwY19jb250ZXh0ICpjdHgsIHUzMiB2aW9faWR4KQo+ICt7Cj4gKyAgICAgICB1
MzIgc2hpZnRfYml0Owo+ICsKPiArICAgICAgIGlmIChjaGVja192aW9fbWFzayhjdHgsIHZpb19p
ZHgpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAgICAgaWYgKCFj
aGVja192aW9fc3RhdHVzKGN0eCwgdmlvX2lkeCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBm
YWxzZTsKPiArCj4gKyAgICAgICBzaGlmdF9iaXQgPSBnZXRfc2hpZnRfZ3JvdXAoY3R4LCB2aW9f
aWR4KTsKPiArCj4gKyAgICAgICBpZiAoc3luY192aW9fZGJnKGN0eCwgc2hpZnRfYml0KSkKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsKPiArICAgICAgIGRldmFwY19leHRyYWN0
X3Zpb19kYmcoY3R4KTsKCkkgdGhpbmsgZ2V0X3NoaWZ0X2dyb3VwKCksIHN5bmNfdmlvX2RiZygp
LCBhbmQKZGV2YXBjX2V4dHJhY3RfdmlvX2RiZygpIHNob3VsZCBiZSBtb3ZlZCBvdXQgb2Ygdmlv
X2lkeCBmb3ItbG9vcCAodGhlCmxvb3AgaW4gZGV2YXBjX3Zpb2xhdGlvbl9pcnEoKSkgYmVjYXVz
ZSB0aGVzZSB0aHJlZSBmdW5jdGlvbiBpcyBub3QKcmVsYXRlZCB0byB2aW9faWR4LgpBbm90aGVy
IHF1ZXN0aW9uOiB3aGVuIG11bHRpcGxlIHZpb19pZHggdmlvbGF0aW9uIG9jY3VyLCB2aW9fYWRk
ciBpcwpyZWxhdGVkIHRvIHdoaWNoIG9uZSB2aW9faWR4PyBUaGUgbGF0ZXN0IGhhcHBlbmVkIG9u
ZT8KCj4gKwo+ICsgICAgICAgcmV0dXJuIHRydWU7Cj4gK30KPiArCj4gKy8qCj4gKyAqIGRldmFw
Y192aW9sYXRpb25faXJxIC0gdGhlIGRldmFwYyBJbnRlcnJ1cHQgU2VydmljZSBSb3V0aW5lIChJ
U1IpIHdpbGwgZHVtcAo+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgIHZpb2xhdGlvbiBpbmZv
cm1hdGlvbiBpbmNsdWRpbmcgd2hpY2ggbWFzdGVyIHZpb2xhdGVzCj4gKyAqICAgICAgICAgICAg
ICAgICAgICAgICAgYWNjZXNzIHNsYXZlLgo+ICsgKi8KPiArc3RhdGljIGlycXJldHVybl90IGRl
dmFwY192aW9sYXRpb25faXJxKGludCBpcnFfbnVtYmVyLAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0ICpjdHgpCj4gK3sK
PiArICAgICAgIHUzMiB2aW9faWR4Owo+ICsKPiArICAgICAgIGZvciAodmlvX2lkeCA9IDA7IHZp
b19pZHggPCBjdHgtPnZpb19pZHhfbnVtOyB2aW9faWR4KyspIHsKPiArICAgICAgICAgICAgICAg
aWYgKCFtdGtfZGV2YXBjX2R1bXBfdmlvX2RiZyhjdHgsIHZpb19pZHgpKQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgLyogRW5zdXJlIHRo
YXQgdmlvbGF0aW9uIGluZm8gYXJlIHdyaXR0ZW4gYmVmb3JlCj4gKyAgICAgICAgICAgICAgICAq
IGZ1cnRoZXIgb3BlcmF0aW9ucwo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAg
ICAgc21wX21iKCk7Cj4gKwo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAg
KiBNYXNrIHNsYXZlJ3MgaXJxIGJlZm9yZSBjbGVhcmluZyB2aW8gc3RhdHVzLgo+ICsgICAgICAg
ICAgICAgICAgKiBNdXN0IGRvIGl0IHRvIGF2b2lkIG5lc3RlZCBpbnRlcnJ1cHQgYW5kIHByZXZl
bnQKPiArICAgICAgICAgICAgICAgICogdW5leHBlY3RlZCBiZWhhdmlvci4KPiArICAgICAgICAg
ICAgICAgICovCj4gKyAgICAgICAgICAgICAgIG1hc2tfbW9kdWxlX2lycShjdHgsIHZpb19pZHgs
IHRydWUpOwo+ICsKPiArICAgICAgICAgICAgICAgY2xlYXJfdmlvX3N0YXR1cyhjdHgsIHZpb19p
ZHgpOwo+ICsKPiArICAgICAgICAgICAgICAgbWFza19tb2R1bGVfaXJxKGN0eCwgdmlvX2lkeCwg
ZmFsc2UpOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBJUlFfSEFORExFRDsKPiAr
fQo+ICsKPiArLyoKPiArICogc3RhcnRfZGV2YXBjIC0gaW5pdGlhbGl6ZSBkZXZhcGMgc3RhdHVz
IGFuZCBzdGFydCByZWNlaXZpbmcgaW50ZXJydXB0Cj4gKyAqICAgICAgICAgICAgICAgIHdoaWxl
IGRldmFwYyB2aW9sYXRpb24gaXMgdHJpZ2dlcmVkLgo+ICsgKi8KPiArc3RhdGljIGludCBzdGFy
dF9kZXZhcGMoc3RydWN0IG10a19kZXZhcGNfY29udGV4dCAqY3R4KQo+ICt7Cj4gKyAgICAgICB2
b2lkIF9faW9tZW0gKnBkX3Zpb19zaGlmdF9zdGFfcmVnOwo+ICsgICAgICAgdm9pZCBfX2lvbWVt
ICpwZF9hcGNfY29uX3JlZzsKPiArICAgICAgIHUzMiB2aW9fc2hpZnRfc3RhOwo+ICsgICAgICAg
dTMyIHZpb19pZHg7Cj4gKwo+ICsgICAgICAgcGRfYXBjX2Nvbl9yZWcgPSBjdHgtPmRldmFwY19w
ZF9iYXNlICsgY3R4LT5vZmZzZXQtPmFwY19jb247Cj4gKyAgICAgICBwZF92aW9fc2hpZnRfc3Rh
X3JlZyA9IGN0eC0+ZGV2YXBjX3BkX2Jhc2UgKyBjdHgtPm9mZnNldC0+dmlvX3NoaWZ0X3N0YTsK
PiArICAgICAgIGlmICghcGRfYXBjX2Nvbl9yZWcgfHwgIXBkX3Zpb19zaGlmdF9zdGFfcmVnKQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICAgICAvKiBDbGVhciBk
ZXZhcGMgdmlvbGF0aW9uIHN0YXR1cyAqLwo+ICsgICAgICAgd3JpdGVsKEJJVCgzMSksIHBkX2Fw
Y19jb25fcmVnKTsKPiArCj4gKyAgICAgICAvKiBDbGVhciB2aW9sYXRpb24gc2hpZnQgc3RhdHVz
ICovCj4gKyAgICAgICB2aW9fc2hpZnRfc3RhID0gcmVhZGwocGRfdmlvX3NoaWZ0X3N0YV9yZWcp
Owo+ICsgICAgICAgaWYgKHZpb19zaGlmdF9zdGEpCj4gKyAgICAgICAgICAgICAgIHdyaXRlbCh2
aW9fc2hpZnRfc3RhLCBwZF92aW9fc2hpZnRfc3RhX3JlZyk7Cj4gKwo+ICsgICAgICAgLyogQ2xl
YXIgc2xhdmUgdmlvbGF0aW9uIHN0YXR1cyAqLwo+ICsgICAgICAgZm9yICh2aW9faWR4ID0gMDsg
dmlvX2lkeCA8IGN0eC0+dmlvX2lkeF9udW07IHZpb19pZHgrKykgewo+ICsgICAgICAgICAgICAg
ICBjbGVhcl92aW9fc3RhdHVzKGN0eCwgdmlvX2lkeCk7Cj4gKyAgICAgICAgICAgICAgIG1hc2tf
bW9kdWxlX2lycShjdHgsIHZpb19pZHgsIGZhbHNlKTsKPiArICAgICAgIH0KPiArCgpXaHkgZG8g
eW91IGNsZWFyIHRoZXNlPyBBZnRlciBwb3dlciBvbiBoYXJkd2FyZSwgSSB0aGluayB0aGVzZQpy
ZWdpc3RlciBzdGF0dXMgYXJlIGNvcnJlY3QuIElmIHRoZSBkZWZhdWx0IHZhbHVlIG9mIHRoZXNl
IHJlZ2lzdGVyCmFyZSBub3QgY29ycmVjdCwgYWRkIGEgY29tbWVudCBmb3IgdGhpcy4KClJlZ2Fy
ZHMsCkNodW4tS3VhbmcuCgo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
