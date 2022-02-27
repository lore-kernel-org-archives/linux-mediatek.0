Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4744EC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Feb 2022 17:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPpSjRgqQldHOPB/3heV76IgiO+m2N2Su5G1Kzv3qsc=; b=jsmiDsH9pR8ueh
	louxxUsAL1quLyJjGvMgYE8yRaOK4WrvsG10Z94wcbOIYZmgSXQMKTVK83gPKbikFWIRaRAedIjc2
	8/GGhDeCqFgE2TxOW8jeI7Hao1sBbaKNZXT5msL8nem84uI59K79uAL72uODsNRPYDEyB0cEHrELQ
	xs4lQDjODurgFOYmACIqQwSjvd34y/uByZ9O+fNT9fxLZ3CwIcaUv7OovWwRdaWcdz6He52HhK77e
	O13Y1VmzM9eKFh2g/JuwCcQMZ1ZZqVE9YvTGKmSO2TE0MIC3ENrB7kl/rrdqgif1rZsmmCz5tFCqQ
	tIKbKHHjRXw8I/46pi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nONgT-009sq7-LI; Sun, 27 Feb 2022 17:50:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nONgH-009soE-SV; Sun, 27 Feb 2022 17:50:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 532FE60FFA;
 Sun, 27 Feb 2022 17:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92D4C340EF;
 Sun, 27 Feb 2022 17:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645984199;
 bh=bqyY3XQdRlzIGOWzFJrkb/oKUh63XEB+VuO9HJ3geNk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Bu65S8Mdj6BE/d7Ux8sTDXYbJA3pBAHP/NTA8ktur3Dh2CZ6bJ0/8notLz7rKRLl9
 U5Z8jUXayPRS7V3IM2Rro+U1wlRp9Ao/J/b1cWghUyvF/qXsZzHjvXI58td34kNaw2
 GsgyAJNF/fS0X8UbYEUull970geXbaLOeqvrdSNLrb1vS9B7V2jT47A6UMmXDPit5D
 0vfwYauN6FHKvnp8LH/cXSofUnv69teeUAQtXgpBJoTF6SRaOiScLCH81qAwomAeYY
 h29MjzjtZ6ir1gsav7TNvNJS7FhwEFjyKvogxEInTf93L1oufN3WWfujToo4to9o4v
 3K6xp/Y5DGwGw==
Date: Sun, 27 Feb 2022 17:57:01 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: lars@metafoo.de, matthias.bgg@gmail.com, nathan@kernel.org,
 ndesaulniers@google.com, linus.walleij@linaro.org, ardeleanalex@gmail.com,
 Tom Rix <trix@redhat.com>, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] iio: adc: mt6360: strengthen return check of
 mt6360_adc_read_channel
Message-ID: <20220227175701.4cacbe3d@jic23-huawei>
In-Reply-To: <5477fb05-d72f-ccc0-1c07-8f2f40d9dde0@wanadoo.fr>
References: <20220227164357.84742-1-trix@redhat.com>
 <5477fb05-d72f-ccc0-1c07-8f2f40d9dde0@wanadoo.fr>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_095002_107538_81BBDA9A 
X-CRM114-Status: GOOD (  28.89  )
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

T24gU3VuLCAyNyBGZWIgMjAyMiAxODowMTo0NyArMDEwMApDaHJpc3RvcGhlIEpBSUxMRVQgPGNo
cmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPiB3cm90ZToKCj4gTGUgMjcvMDIvMjAyMiDDoCAx
Nzo0MywgdHJpeC1IK3dYYUh4ZjdhTFFUMGRaUitBbGZBQHB1YmxpYy5nbWFuZS5vcmcgYSAKPiDD
qWNyaXTCoDoKPiA+IEZyb206IFRvbSBSaXggPHRyaXgtSCt3WGFIeGY3YUxRVDBkWlIrQWxmQUBw
dWJsaWMuZ21hbmUub3JnPgo+ID4gCj4gPiBDbGFuZyBzdGF0aWMgYW5hbHlzaXMgcmVwb3J0cyB0
aGlzIGlzc3VlCj4gPiBtdDYzNjAtYWRjLmM6Mjc3OjIwOiB3YXJuaW5nOiBBc3NpZ25lZCB2YWx1
ZSBpcwo+ID4gICAgZ2FyYmFnZSBvciB1bmRlZmluZWQKPiA+ICAgIGRhdGEudmFsdWVzW2krK10g
PSB2YWw7Cj4gPiAgICAgICAgICAgICAgICAgICAgIF4gfn5+Cj4gPiAKPiA+IHZhbCBpcyBzZXQg
YnkgYSBzdWNjZXNzZnVsIGNhbGwgdG8gbTYzNjBfYWRjX3JlYWRfY2hhbm5lbCgpLgo+ID4gQSBu
ZWdhdGl2ZSByZXR1cm4gaXMgY2hlY2tlZCBidXQgd2l0aGluIG02MzYwX2FkY19yZWFkX2NoYW5u
ZWwsCj4gPiBhIG5vbiB6ZXJvIGNoZWNrIGlzIGRvbmUuCj4gPiBTdHJlbmd0aGVuIHRoZSBjaGVj
ayB0byBub24gemVyby4gIAo+IAo+IEhpLCBteSB1bmRlcnN0YW5kaW5nIG9mIG02MzYwX2FkY19y
ZWFkX2NoYW5uZWwoKSBpcyB0aGF0IG9uIHN1Y2Nlc3MsIGl0IAo+IHJldHVybnMgSUlPX1ZBTF9J
TlQgKGkuZS4gMSkuCj4gCj4gU28sIEkgdGhpbmsgdGhhdCB3aXRoIHlvdXIgcGF0Y2gsIHdlIHdp
bGwgbm93IGFsd2F5cyBmYWlsIGJlY2F1c2UgJ3JldCcgCj4gaXMgbmV2ZXIgMCBhdCB0aGlzIHBv
aW50LgoKRmlyc3RseSBJJ20gZ2xhZCB5b3Ugd2VyZSBtb3JlIGF3YWtlIHRoYW4gbWUgQ2hyaXN0
b3BoZSBhcyBJIG1pc3NlZCB0aGF0CmVudGlyZWx5LiA6KAoKU28gdHdvIHdheXMgd2UgY291bGQg
ZGVhbCB3aXRoIHRoZSB3YXJuaW5nICh3aGljaCBpcyB2YWxpZCBnaXZlbiB0aGVyZQppcyBubyB3
YXkgY2xhbmcgY291bGQgc2Vuc2libHkgdGVsbCB0aGF0IGFsbCB0aG9zZSBpZiAocmV0KSBhY3R1
YWxseQptZWFuIGlmIChyZXQgPCAwKS4KCkkgZG9uJ3QgbGlrZSBjaGFuZ2luZyB0aGVtIHRvIGlm
IChyZXQgPCAwKSBpbnNpZGUgX2FkY19yZWFkX2NoYW5uZWwoKQpiZWNhdXNlIGdlbmVyYWxseSBp
dCBlbmRzIHVwIGNsZWFuZXIgdG8ganVzdCBkbyBpZiAocmV0KSBiYXNlZCBoYW5kbGluZwpmb3Ig
cmVnbWFwIGNhbGxzLiAgU28gd2UgY291bGQganVzdCBhc3NpZ24gYSBkZWZhdWx0IHRvIHZhbCB0
aGF0IGlzIG5ldmVyCnVzZWQgb3Igd2UgY291bGQgY2hhbmdlIHRoYXQgZnVuY3Rpb24gdG8gcmV0
dXJuIDAgb24gc3VjY2VzcyBhbmQgYWRqdXN0CnRoZSBvdGhlciBjYWxsIHNpdGUgdG8gcmV0dXJu
IElJT19WQUxfSU5UIGlmIHRoZXJlIGlzbid0IGFuIGVycm9yLgoKVGhlIHNlY29uZCBvbmUgd291
bGQgbWFrZSB0aGUgb3RoZXIgY2FsbGVyIHJhdGhlciBtZXNzaWVyIHNvIEknZCBzdWdnZXN0Cmp1
c3QgZ2l2aW5nIHZhbCBhIGRlZmF1bHQgYW5kIGFkZGluZyBhIGNvbW1lbnQgc2F5aW5nIGl0J3Mg
Zm9yIHdhcm5pbmcKc3VwcHJlc3Npb24gcHVycG9zZXMuLi4KCkpvbmF0aGFuCgoKPiAKPiBDSgo+
IAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBUb20gUml4IDx0cml4LUgrd1hhSHhmN2FMUVQwZFpS
K0FsZkFAcHVibGljLmdtYW5lLm9yZz4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2lpby9hZGMvbXQ2
MzYwLWFkYy5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9tdDYzNjAt
YWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvbXQ2MzYwLWFkYy5jCj4gPiBpbmRleCAwN2MwZTY3Njgz
OTEwLi45ZmI2ZGMzMDVhMzkyIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9paW8vYWRjL210NjM2
MC1hZGMuYwo+ID4gKysrIGIvZHJpdmVycy9paW8vYWRjL210NjM2MC1hZGMuYwo+ID4gQEAgLTI2
OSw3ICsyNjksNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbXQ2MzYwX2FkY190cmlnZ2VyX2hhbmRs
ZXIoaW50IGlycSwgdm9pZCAqcCkKPiA+ICAgCW1lbXNldCgmZGF0YSwgMCwgc2l6ZW9mKGRhdGEp
KTsKPiA+ICAgCWZvcl9lYWNoX3NldF9iaXQoYml0LCBpbmRpb19kZXYtPmFjdGl2ZV9zY2FuX21h
c2ssIGluZGlvX2Rldi0+bWFza2xlbmd0aCkgewo+ID4gICAJCXJldCA9IG10NjM2MF9hZGNfcmVh
ZF9jaGFubmVsKG1hZCwgYml0LCAmdmFsKTsKPiA+IC0JCWlmIChyZXQgPCAwKSB7Cj4gPiArCQlp
ZiAocmV0KSB7Cj4gPiAgIAkJCWRldl93YXJuKCZpbmRpb19kZXYtPmRldiwgIkZhaWxlZCB0byBn
ZXQgY2hhbm5lbCAlZCBjb252ZXJzaW9uIHZhbFxuIiwgYml0KTsKPiA+ICAgCQkJZ290byBvdXQ7
Cj4gPiAgIAkJfSAgCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
