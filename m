Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9E7C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 15:14:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABBA205CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 15:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CoDr5BPD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sj4XnJIE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABBA205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yfAjfQdwpZajsUO6QWI5OhhpZuwDRrJXjhjUQ7MqmJM=; b=CoDr5BPDKlxSh6uNNfZgzn5uH
	ZGTH5Z+F36l0072tl3hGskcFYd3WIOswzbrNbR3uoIp9KgBoKbyT53wEa6Qrdb/QQhB9xLtW432U5
	8ipJM4DXy+u7DsEpEkRbVw9A3057iqTjq/rY6efwWFYpd5wdItUQ/R+aceBicQ4y1rdhXnxz5snNi
	oRZfJ2P1w04GJUL279jsP0eJhD1N3pZGZYUPpQIpZMhgxBCuNFv8AoOn6109B2sxDvjpRWm6P6JPQ
	R6sVVSr8WuRc4axuWThbOSS0VzGvmXLIXBMyFNHjXT+DdblbhpOPDRvOhianc+fUKjtJeItmtcIeg
	Q9BJebRPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7gq1-0003uT-1n; Mon, 17 Aug 2020 15:14:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7gpv-0003sn-EO; Mon, 17 Aug 2020 15:14:12 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0484B2054F;
 Mon, 17 Aug 2020 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597677250;
 bh=hqEMfNYoKv2H/A9NzWzm3pq6Ot1n4/y/J+WGuaOxqMY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Sj4XnJIEDsVqpYNelJN42gpLdtuvPyZFo+ro80ps5X1fNlN/EEWNnpxGm92khy4Lx
 maruxkU2rTx7p++FLm8BfGzV8SdWIqHqPg3QRh0+IMhm1z9xBygMGnywg8GxrBQgC+
 JPiQrofIkFExUoSg+dk7StvMEvdHJ0n3Dwi/NZ7o=
Received: by mail-ej1-f54.google.com with SMTP id kq25so18181992ejb.3;
 Mon, 17 Aug 2020 08:14:09 -0700 (PDT)
X-Gm-Message-State: AOAM531CGhIRwygtlv0K3yYgr9mpSgTeoE/KTAbVm5y+eUEG6UMkUpE5
 TjGWT96lm6MNAdZA5bJGbatBjaNMOTXZGeSQ9w==
X-Google-Smtp-Source: ABdhPJwbE2nEYvLa7dwJUU9IVHpeywzEtAxNOSighTuc9Ly6OaPt76S0xzF2xY1xirFF+T46DK/F0HVQWCkErsPlpOg=
X-Received: by 2002:a17:906:2356:: with SMTP id
 m22mr15233703eja.124.1597677248601; 
 Mon, 17 Aug 2020 08:14:08 -0700 (PDT)
MIME-Version: 1.0
References: <1597289564-17030-1-git-send-email-neal.liu@mediatek.com>
 <1597289564-17030-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_88YSHOvDEHm+rM1=fTv_y25nUh1tuLUH8YSxH5UD1bug@mail.gmail.com>
 <1597636953.3394.7.camel@mtkswgap22>
In-Reply-To: <1597636953.3394.7.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 17 Aug 2020 23:13:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY__7gmvp+U+xD12KJkxuya=CkD8xV67S3pfC60gyfajQiA@mail.gmail.com>
Message-ID: <CAAOTY__7gmvp+U+xD12KJkxuya=CkD8xV67S3pfC60gyfajQiA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] soc: mediatek: add mt6779 devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_111411_632884_E60F2730 
X-CRM114-Status: GOOD (  32.52  )
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
 wsd_upstream <wsd_upstream@mediatek.com>, devicetree@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDjm
nIgxN+aXpSDpgLHkuIAg5LiL5Y2IMTI6MDLlr6vpgZPvvJoKPgo+IEhpIENodW4tS3VhbmcsCj4K
PiBPbiBTYXQsIDIwMjAtMDgtMTUgYXQgMTE6MDMgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6
Cj4gPiBIaSwgTmVhbDoKPiA+Cj4gPiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMOW5tDjmnIgxM+aXpSDpgLHlm5sg5LiK5Y2IMTE6MzPlr6vpgZPvvJoKPiA+ID4KPiA+
ID4gTWVkaWFUZWsgYnVzIGZhYnJpYyBwcm92aWRlcyBUcnVzdFpvbmUgc2VjdXJpdHkgc3VwcG9y
dCBhbmQgZGF0YQo+ID4gPiBwcm90ZWN0aW9uIHRvIHByZXZlbnQgc2xhdmVzIGZyb20gYmVpbmcg
YWNjZXNzZWQgYnkgdW5leHBlY3RlZAo+ID4gPiBtYXN0ZXJzLgo+ID4gPiBUaGUgc2VjdXJpdHkg
dmlvbGF0aW9uIGlzIGxvZ2dlZCBhbmQgc2VudCB0byB0aGUgcHJvY2Vzc29yIGZvcgo+ID4gPiBm
dXJ0aGVyIGFuYWx5c2lzIG9yIGNvdW50ZXJtZWFzdXJlcy4KPiA+ID4KPiA+ID4gQW55IG9jY3Vy
cmVuY2Ugb2Ygc2VjdXJpdHkgdmlvbGF0aW9uIHdvdWxkIHJhaXNlIGFuIGludGVycnVwdCwgYW5k
Cj4gPiA+IGl0IHdpbGwgYmUgaGFuZGxlZCBieSBtdGstZGV2YXBjIGRyaXZlci4gVGhlIHZpb2xh
dGlvbgo+ID4gPiBpbmZvcm1hdGlvbiBpcyBwcmludGVkIGluIG9yZGVyIHRvIGZpbmQgdGhlIG11
cmRlcmVyLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExpdSA8bmVhbC5saXVAbWVk
aWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+Cj4gPiBbc25pcF0KPiA+Cj4gPiA+ICsvKgo+ID4gPiAr
ICogZGV2YXBjX3Zpb2xhdGlvbl9pcnEgLSB0aGUgZGV2YXBjIEludGVycnVwdCBTZXJ2aWNlIFJv
dXRpbmUgKElTUikgd2lsbCBkdW1wCj4gPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgIHZp
b2xhdGlvbiBpbmZvcm1hdGlvbiBpbmNsdWRpbmcgd2hpY2ggbWFzdGVyIHZpb2xhdGVzCj4gPiA+
ICsgKiAgICAgICAgICAgICAgICAgICAgICAgIGFjY2VzcyBzbGF2ZS4KPiA+ID4gKyAqLwo+ID4g
PiArc3RhdGljIGlycXJldHVybl90IGRldmFwY192aW9sYXRpb25faXJxKGludCBpcnFfbnVtYmVy
LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG10
a19kZXZhcGNfY29udGV4dCAqY3R4KQo+ID4gPiArewo+ID4gPiArICAgICAgIC8qCj4gPiA+ICsg
ICAgICAgICogTWFzayBzbGF2ZSdzIGlycSBiZWZvcmUgY2xlYXJpbmcgdmlvIHN0YXR1cy4KPiA+
ID4gKyAgICAgICAgKiBNdXN0IGRvIGl0IHRvIGF2b2lkIG5lc3RlZCBpbnRlcnJ1cHQgYW5kIHBy
ZXZlbnQKPiA+ID4gKyAgICAgICAgKiB1bmV4cGVjdGVkIGJlaGF2aW9yLgo+ID4gPiArICAgICAg
ICAqLwo+ID4gPiArICAgICAgIG1hc2tfbW9kdWxlX2lycShjdHgsIHRydWUpOwo+ID4KPiA+IEkg
c3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgbmVzdGVkIGludGVycnVwdCBoYXBwZW4uIElmIHR3
byBDUFUKPiA+IHByb2Nlc3MgZGlmZmVyZW50IGRldmFwYyBpbnRlcnJ1cHQgYXQgdGhlIHNhbWUg
dGltZSwgbWFzayBpbnRlcnJ1cHQKPiA+IGNvdWxkIG5vdCBwcmV2ZW50IHRoZXNlIHR3byBDUFUg
dG8gc3luYyB2aW8gZGJnIGF0IHRoZSBzYW1lIHRpbWUuIEFzIEkKPiA+IGtub3csIGluIEFSTSBD
UFUsIG9ubHkgQ1BVMCBwcm9jZXNzIGlycSBoYW5kbGVyLCBhbmQgYWxsIGRldmFwYwo+ID4gaW50
ZXJydXB0IGhhcyB0aGUgc2FtZSBwcmlvcml0eSwgc28gd2h5IG5lc3RlZCBpbnRlcnJ1cHQgaGFw
cGVuPyBDb3VsZAo+ID4geW91IGV4cGxhaW4gbW9yZSBkZXRhaWwgYWJvdXQgaG93IG5lc3RlZCBp
bnRlcnJ1cHQgaGFwcGVuPwo+Cj4gSWYgdGhlcmUgaXMgYW5vdGhlciB2aW9sYXRpb24gaGFwcGVu
ZWQgYmVmb3JlIHByZXZpb3VzIHZpb2xhdGlvbiBpcwo+IGZ1bGx5IGhhbmRsZWQsIG5lc3RlZCBp
bnRlcnJ1cHQgd291bGQgaGFwcGVuLgo+Cj4gTGV0J3MgbWUgdGFrZSBhbiBleGFtcGxlOgo+IHZp
byBBIGhhcHBlbgo+IGVudGVyIEEgSVNSCj4gLi4uICAgICAgICAgICAgIHZpbyBCIGhhcHBlbgo+
IGZpbmlzaCBBIElTUiAgICBlbnRlciBCIElTUgo+ICAgICAgICAgICAgICAgICAuLi4KPiAgICAg
ICAgICAgICAgICAgZmluaXNoIEIgSVNSCj4KPiBXZSBtYXNrIGFsbCBtb2R1bGUncyBpcnEgdG8g
YXZvaWQgbmVzdGVkIGludGVycnVwdC4KClRoaXMgaXMgbm90ICduZXN0ZWQnIGludGVycnVwdC4g
QWZ0ZXIgQSBJU1IgaXMgZmluaXNoZWQsIEIgSVNSIGhhcHBlbi4KU28gQSBJU1IgYW5kIEIgSVNS
IGFyZSBjb25zZWN1dGl2ZSBpbnRlcnJ1cHQsIG5vdCBuZXN0ZWQgaW50ZXJydXB0LgpUbyBjb21w
YXJlIG1hc2sgaXJxIGFuZCBubyBtYXNrIGlycSwgTGV0J3MgY29uc2lkZXIgdGhpcyBzaXR1YXRp
b246CgoxLiAxMDAwIGNvbnNlY3V0aXZlIHZpb2xhdGlvbiBoYXBwZW4sIHRoZSB0aW1lIHBlcmlv
ZCBiZXR3ZWVuIHR3bwp2aW9sYXRpb24gaXMgMC4wMSBtcywgc28gdGhlIHRvdGFsIHRpbWUgaXMg
MTBtcy4gKEluIDEwbXMsIDEwMDAKdmlvbGF0aW9uIGhhcHBlbikKMi4gT25lIElTUiBoYW5kbGUg
dGltZSBpcyAxIG1zLCBzbyBpbiBvbmUgSVNSIGhhbmRsZXIsIDEwMCB2aW9sYXRpb24gaGFwcGVu
LgoKRm9yIG1hc2sgaXJxIHNvbHV0aW9uLCAxMCBJU1IgaGFuZGxlciBpcyB0cmlnZ2VyLiBGb3Ig
bm8gbWFzayBpcnEKc29sdXRpb24sIDExIElTUiBoYW5kbGVyIGlzIHRyaWdnZXIuCkkgdGhpbmsg
dGhlc2UgdHdvIHNvbHV0aW9uIGhhdmUgc2ltaWxhciByZXN1bHQsIGFuZCBubyBtYXNrIGlycQpz
b2x1dGlvbiBwcmludCBtb3JlIGluZm9ybWF0aW9uIChJZiB0aGVzZSAxMDAwIHZpb2xhdGlvbiBp
cyB0cmlnZ2VyIGJ5CjIwIGRpZmZlcmVudCBkcml2ZXIsIG5vIG1hc2sgc29sdXRpb24gbWF5IHNo
b3cgb25lIG1vcmUgZHJpdmVyIHRoYW4KbWFzayBzb2x1dGlvbikKU28gSSB0aGluayBpdCdzIG5v
dCBuZWNlc3NhcnkgdG8gbWFzayBpcnEgaW4gaXJxIGhhbmRsZXIuCgo+Cj4gPgo+ID4gPiArCj4g
PiA+ICsgICAgICAgd2hpbGUgKGRldmFwY19zeW5jX3Zpb19kYmcoY3R4KSkKPiA+ID4gKyAgICAg
ICAgICAgICAgIGRldmFwY19leHRyYWN0X3Zpb19kYmcoY3R4KTsKPiA+ID4gKwo+ID4gPiArICAg
ICAgIC8qCj4gPiA+ICsgICAgICAgICogRW5zdXJlIHRoYXQgdmlvbGF0aW9uIGluZm8gYXJlIHdy
aXR0ZW4KPiA+ID4gKyAgICAgICAgKiBiZWZvcmUgZnVydGhlciBvcGVyYXRpb25zCj4gPiA+ICsg
ICAgICAgICovCj4gPiA+ICsgICAgICAgc21wX21iKCk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBj
bGVhcl92aW9fc3RhdHVzKGN0eCk7Cj4gPiA+ICsgICAgICAgbWFza19tb2R1bGVfaXJxKGN0eCwg
ZmFsc2UpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+ID4gPiAr
fQo+ID4gPiArCj4gPgo+ID4gW3NuaXBdCj4gPgo+ID4gPiArCj4gPiA+ICtzdGF0aWMgaW50IG10
a19kZXZhcGNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ICt7Cj4g
PiA+ICsgICAgICAgc3RydWN0IG10a19kZXZhcGNfY29udGV4dCAqY3R4ID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEocGRldik7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBzdG9wX2RldmFwYyhjdHgpOwo+
ID4gPiArCj4gPiA+ICsgICAgICAgaWYgKGN0eC0+aW5mcmFfY2xrKQo+ID4KPiA+IFRoaXMgYWx3
YXlzIHRydWUuCj4KPiBEb2VzIGl0IG1lYW4gdGhhdCByZW1vdmUgZnVuY3Rpb24gd291bGQgYmUg
Y2FsbGVkIG9ubHkgaWYgcHJvYmUgZnVuY3Rpb24KPiBpcyByZXR1cm5lZCBzdWNjZXNzZnVsbHk/
CgpZZXMuCgo+IElzIHRoZXJlIGFueSBjaGFuY2UgdGhpcyBmdW5jdGlvbiB3b3VsZCBiZSBjYWxs
ZWQgZGlyZWN0bHk/CgpOby4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gPgo+ID4gUmVnYXJk
cywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4gPiArICAgICAgICAgICAgICAgY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKGN0eC0+aW5mcmFfY2xrKTsKPiA+ID4gKwo+ID4gPiArICAgICAgIHJldHVybiAw
Owo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBt
dGtfZGV2YXBjX2RyaXZlciA9IHsKPiA+ID4gKyAgICAgICAucHJvYmUgPSBtdGtfZGV2YXBjX3By
b2JlLAo+ID4gPiArICAgICAgIC5yZW1vdmUgPSBtdGtfZGV2YXBjX3JlbW92ZSwKPiA+ID4gKyAg
ICAgICAuZHJpdmVyID0gewo+ID4gPiArICAgICAgICAgICAgICAgLm5hbWUgPSBLQlVJTERfTU9E
TkFNRSwKPiA+ID4gKyAgICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IG10a19kZXZhcGNf
ZHRfbWF0Y2gsCj4gPiA+ICsgICAgICAgfSwKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK21vZHVs
ZV9wbGF0Zm9ybV9kcml2ZXIobXRrX2RldmFwY19kcml2ZXIpOwo+ID4gPiArCj4gPiA+ICtNT0RV
TEVfREVTQ1JJUFRJT04oIk1lZGlhdGVrIERldmljZSBBUEMgRHJpdmVyIik7Cj4gPiA+ICtNT0RV
TEVfQVVUSE9SKCJOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiIpOwo+ID4gPiArTU9E
VUxFX0xJQ0VOU0UoIkdQTCIpOwo+ID4gPiAtLQo+ID4gPiAxLjcuOS41Cj4gPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IExpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdAo+ID4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
