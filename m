Return-Path: <SRS0=9Csx=C4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269D8C43464
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2020 13:20:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 938CF206A2
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Sep 2020 13:20:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MKhO0cjU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fi0OaGoo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 938CF206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7KF/v1sOelwX/eZMXM8f3mzd0HwljU3OexSCcTOKa+M=; b=MKhO0cjUoZUaz72htOJDcp5K3
	HHPxoRsZik/A/q7qs6Envm50wX0PrHvJzXXCuOrAJLobLYsIBElpijb0D8zXSOEIDKGaUjm4FD/cp
	imDSnek+mUBr4CGHojTuHoV9QW+8nTD8DjfLasl+7CPxqZR/VgKrmLvtasRJO3nHgcZodY/XvXneJ
	z/VrWu1/BzRPgRD/uWnhu6Kil6AEX2zr5hH7aIl5kAA9fzcgQ2/N3k104yXTcHhEVGdv6Px+QCsln
	O4fCDt0A6fqb4W3uAETboOE7RAhsGIAyHzLNji5Lduy3dza9wjmVggiZ79A3NvA6RZpMH8Anv7RVA
	C6VaY+sgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJcmq-0000Gz-1R; Sat, 19 Sep 2020 13:20:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJcmm-0000GR-0L; Sat, 19 Sep 2020 13:20:16 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2586F20888;
 Sat, 19 Sep 2020 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600521612;
 bh=q/fkPTtdtq6+N4dWIZ5fZ9ppXQrwFCRgHeFnseOeSFk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fi0OaGoo265xy3RkkDaSUTKULWCQgAVYFvbsX74VsyNjcnnahpkIU1oFN9v0mAuOF
 BbldgEgSK5OleM5j2Tt6vX7qFKoshPp0oAIocf50elwS/bNJHubcI3LC7E5S2e5AVK
 Us0sm1oTStQ86YUuTbNuRsJViQmAXKmar6yuXyUM=
Date: Sat, 19 Sep 2020 14:20:05 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 3/3] iio: adc: mt6360: Add ADC driver for MT6360
Message-ID: <20200919142005.18e3e11f@archlinux>
In-Reply-To: <CAE+NS35RkbHOqrFoEE2MS109hTKowZO3jmT_oTpSmCRnY-87Lg@mail.gmail.com>
References: <1600191369-28040-1-git-send-email-gene.chen.richtek@gmail.com>
 <1600191369-28040-4-git-send-email-gene.chen.richtek@gmail.com>
 <20200917185327.761f7e5a@archlinux>
 <CAE+NS35RkbHOqrFoEE2MS109hTKowZO3jmT_oTpSmCRnY-87Lg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_092016_256997_921AF5D2 
X-CRM114-Status: GOOD (  31.67  )
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
Cc: Gene Chen <gene_chen@richtek.com>, lars@metafoo.de,
 linux-iio@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 pmeerw@pmeerw.net, knaack.h@gmx.de, Matthias Brugger <matthias.bgg@gmail.com>,
 Wilma.Wu@mediatek.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxOCBTZXAgMjAyMCAxNjowNDo0MyArMDgwMApHZW5lIENoZW4gPGdlbmUuY2hlbi5y
aWNodGVrQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEpvbmF0aGFuIENhbWVyb24gPGppYzIzQGtlcm5l
bC5vcmc+IOaWvCAyMDIw5bm0OeaciDE45pelIOmAseS6lCDkuIrljYgxOjUz5a+r6YGT77yaCj4g
Pgo+ID4gT24gV2VkLCAxNiBTZXAgMjAyMCAwMTozNjowOSArMDgwMAo+ID4gR2VuZSBDaGVuIDxn
ZW5lLmNoZW4ucmljaHRla0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gIAo+ID4gPiBGcm9tOiBHZW5l
IENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ID4KPiA+ID4gQWRkIE1UNjM2MCBBREMg
ZHJpdmVyIGluY2x1ZGUgQ2hhcmdlciBDdXJyZW50LCBWb2x0YWdlLCBhbmQKPiA+ID4gVGVtcGVy
YXR1cmUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJp
Y2h0ZWsuY29tPiAgCj4gPiBDb21tZW50cyBpbmxpbmUuCgouLi4KCj4gPiA+ICsgICAgIGlmIChy
ZXQpCj4gPiA+ICsgICAgICAgICAgICAgZ290byBvdXRfYWRjX2xvY2s7Cj4gPiA+ICsKPiA+ID4g
KyAgICAgc3RhcnRfdCA9IGt0aW1lX2dldCgpOwo+ID4gPiArICAgICBwcmVkaWN0X2VuZF90ID0g
a3RpbWVfYWRkX21zKG1hZC0+bGFzdF9vZmZfdGltZXN0YW1wc1tjaGFubmVsXSwgMiAqIEFEQ19X
QUlUX1RJTUVfTVMpOwo+ID4gPiArCj4gPiA+ICsgICAgIGlmIChrdGltZV9hZnRlcihzdGFydF90
LCBwcmVkaWN0X2VuZF90KSkKPiA+ID4gKyAgICAgICAgICAgICBwcmVfd2FpdF90aW1lID0gQURD
X1dBSVRfVElNRV9NUzsKPiA+ID4gKyAgICAgZWxzZQo+ID4gPiArICAgICAgICAgICAgIHByZV93
YWl0X3RpbWUgPSAzICogQURDX1dBSVRfVElNRV9NUzsKPiA+ID4gKwo+ID4gPiArICAgICBtc2xl
ZXAocHJlX3dhaXRfdGltZSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgd2hpbGUgKHRydWUpIHsKPiA+
ID4gKyAgICAgICAgICAgICByZXQgPSByZWdtYXBfcmF3X3JlYWQobWFkLT5yZWdtYXAsIE1UNjM2
MF9SRUdfUE1VQURDUlBUMSwgcnB0LCBzaXplb2YocnB0KSk7Cj4gPiA+ICsgICAgICAgICAgICAg
aWYgKHJldCkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2FkY19jb252Owo+
ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgLyoKPiA+ID4gKyAgICAgICAgICAgICAgKiBUaGVy
ZSBhcmUgdHdvIGZ1bmN0aW9ucywgWkNWIGFuZCBUeXBlQyBPVFAsIHJ1bm5pbmcgQURDIFZCQVQg
YW5kIFRTIGluCj4gPiA+ICsgICAgICAgICAgICAgICogYmFja2dyb3VuZCwgYW5kIEFEQyBzYW1w
bGVzIGFyZSB0YWtlbiBvbiBhIGZpeGVkIGZyZXF1ZW5jeSBubyBtYXR0ZXIgcmVhZCB0aGUKPiA+
ID4gKyAgICAgICAgICAgICAgKiBwcmV2aW91cyBvbmUgb3Igbm90Lgo+ID4gPiArICAgICAgICAg
ICAgICAqIFRvIGF2b2lkIGNvbmZsaWN0LCBXZSBzZXQgbWluaW11bSB0aW1lIHRocmVzaG9sZCBh
ZnRlciBlbmFibGUgQURDIGFuZAo+ID4gPiArICAgICAgICAgICAgICAqIGNoZWNrIHJlcG9ydCBj
aGFubmVsIGlzIHRoZSBzYW1lLgo+ID4gPiArICAgICAgICAgICAgICAqIFRoZSB3b3JzdCBjYXNl
IGlzIHJ1biB0aGUgc2FtZSBBREMgdHdpY2UgYW5kIGJhY2tncm91bmQgZnVuY3Rpb24gaXMgYWxz
byBydW5uaW5nLAo+ID4gPiArICAgICAgICAgICAgICAqIEFEQyBjb252ZXJzaW9uIHNlcXVlbmNl
IGlzIGRlc2lyZSBjaGFubmVsIGJlZm9yZSBzdGFydCBBREMsIGJhY2tncm91bmQgQURDLAo+ID4g
PiArICAgICAgICAgICAgICAqIGRlc2lyZSBjaGFubmVsIGFmdGVyIHN0YXJ0IEFEQy4KPiA+ID4g
KyAgICAgICAgICAgICAgKiBTbyB0aGUgbWluaW11bSBjb3JyZWN0IGRhdGEgaXMgdGhyZWUgdGlt
ZXMgb2YgdHlwaWNhbCBjb252ZXJzaW9uIHRpbWUuCj4gPiA+ICsgICAgICAgICAgICAgICovCj4g
PiA+ICsgICAgICAgICAgICAgaWYgKChycHRbMF0gJiBNVDYzNjBfUlBUQ0hfTUFTSykgPT0gY2hh
bm5lbCkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiArCj4gPiA+ICsg
ICAgICAgICAgICAgbXNsZWVwKEFEQ19XQUlUX1RJTUVfTVMpOwo+ID4gPiArICAgICB9Cj4gPiA+
ICsKPiA+ID4gKyAgICAgLyogcnB0WzFdOiBBRENfSElfQllURSwgcnB0WzJdOiBBRENfTE9XX0JZ
VEUgKi8KPiA+ID4gKyAgICAgKnZhbCA9IGJlMTZfdG9fY3B1cCgoX19iZTE2ICopKHJwdCArIDEp
KTsgIAo+ID4KPiA+IFRvIGJlIGVudGlyZWx5IHNhZmUsIHByb2JhYmx5IG5lZWQgdGhhdCB0byBi
ZSBhbiB1bmFsaWduZWQgcmVhZD8KPiA+ICAKPiAKPiBNYXliZSBJIGNhbiBjaGFuZ2UgdG8gIip2
YWwgPSBycHRbMV0gPDwgOCB8IHJwdFsyXTsiLgo+IEl0J3MgbW9yZSBhYnZpb3VzLgoKVGhhdCB3
b3VsZCBkZWZpbml0ZWx5IGJlIHNhZmUgc28gZG8gdGhhdC4KCj4gCj4gPiA+ICsgICAgIHJldCA9
IElJT19WQUxfSU5UOwo+ID4gPiArCj4gPiA+ICtvdXRfYWRjX2NvbnY6Cj4gPiA+ICsgICAgIC8q
IE9ubHkga2VlcCBBREMgZW5hYmxlICovCj4gPiA+ICsgICAgIGFkY19lbmFibGUgPSBjcHVfdG9f
YmUxNihNVDYzNjBfQURDRU5fTUFTSyk7Cj4gPiA+ICsgICAgIHJlZ21hcF9yYXdfd3JpdGUobWFk
LT5yZWdtYXAsIE1UNjM2MF9SRUdfUE1VQURDQ0ZHLCAodm9pZCAqKSZhZGNfZW5hYmxlLCBzaXpl
b2YoX19iZTE2KSk7ICAKPiA+Cj4gPiBzaXplb2YoYWRjX2VuYWJsZSkKPiA+ICAKPiAKPiBBQ0sK
PiAKPiA+ID4gKyAgICAgbWFkLT5sYXN0X29mZl90aW1lc3RhbXBzW2NoYW5uZWxdID0ga3RpbWVf
Z2V0KCk7Cj4gPiA+ICsgICAgIC8qIENvbmZpZyBwcmVmZXIgY2hhbm5lbCB0byBOT19QUkVGRVIg
Ki8KPiA+ID4gKyAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKG1hZC0+cmVnbWFwLCBNVDYzNjBfUkVH
X1BNVUFEQ1JQVDEsIE1UNjM2MF9QUkVGRVJDSF9NQVNLLAo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgTVQ2MzYwX05PX1BSRUZFUiA8PCBNVDYzNjBfUFJFRkVSQ0hfU0hGVCk7Cj4gPiA+
ICtvdXRfYWRjX2xvY2s6Cj4gPiA+ICsgICAgIG11dGV4X3VubG9jaygmbWFkLT5hZGNfbG9jayk7
Cj4gPiA+ICsKPiA+ID4gKyAgICAgcmV0dXJuIHJldDsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAr
c3RhdGljIGludCBtdDYzNjBfYWRjX3JlYWRfc2NhbGUoc3RydWN0IG10NjM2MF9hZGNfZGF0YSAq
bWFkLCBpbnQgY2hhbm5lbCwgaW50ICp2YWwsIGludCAqdmFsMikKPiA+ID4gK3sKPiA+ID4gKyAg
ICAgdW5zaWduZWQgaW50IHJlZ3ZhbDsKPiA+ID4gKyAgICAgaW50IHJldDsKPiA+ID4gKwo+ID4g
PiArICAgICBzd2l0Y2ggKGNoYW5uZWwpIHsKPiA+ID4gKyAgICAgY2FzZSBNVDYzNjBfQ0hBTl9V
U0JJRDoKPiA+ID4gKyAgICAgICAgICAgICBmYWxsdGhyb3VnaDsgIAo+ID4KPiA+IEkgZG9uJ3Qg
dGhpbmsgd2UgbmVlZCBmYWxsdGhyb3VnaCBmb3IgY2FzZXMKPiA+IHdpdGggbm90aGluZyBpbiB0
aGVtLgo+ID4gIAo+IAo+IEV2ZXJ5IGNoYW5uZWwgbmVlZHMgc2V0ICIgKnZhbCA9IDI1MDAiIGZv
ciBzY2FsZS4KPiBEbyB5b3UgbWVhbiBjaGFuZ2UgYXMgYmVsb3c/Cj4gCj4gICAgICAgICBzd2l0
Y2ggKGNoYW5uZWwpIHsKPiAgICAgICAgIGNhc2UgTVQ2MzYwX0NIQU5fVVNCSUQ6Cj4gICAgICAg
ICBjYXNlIE1UNjM2MF9DSEFOX1ZTWVM6Cj4gICAgICAgICBjYXNlIE1UNjM2MF9DSEFOX1ZCQVQ6
Cj4gICAgICAgICBjYXNlIE1UNjM2MF9DSEFOX0NIR19WRERQOgo+ICAgICAgICAgY2FzZSBNVDYz
NjBfQ0hBTl9WUkVGX1RTOgo+ICAgICAgICAgICAgICAgICBmYWxsdGhyb3VnaDsKRG9uJ3QgbmVl
ZCB0aGlzIGZhbGx0aHJvdWdoLgoKZmFsbHRocm91Z2ggaXMgb25seSBuZWVkZWQgaWYgc29tZXRo
aW5nIGlzIGRvbmUgaW4gdGhlCmNhc2Ugc3RhdGVtZW50LiAgSSBiZWxpZXZlIHRoZSBjaGVja2Vy
IGlzIGNsZXZlciBlbm91Z2ggdG8KYXNzdW1lIHRoYXQgYSBzZXQgb2YgY2FzZSBzdGF0ZW1lbnRz
IHdpdGggbm90aGluZyBpbmJldHdlZW4KdGhlbSBhcmUgZGVsaWJlcmF0ZS4KCj4gICAgICAgICBj
YXNlIE1UNjM2MF9DSEFOX1RTOgo+ICAgICAgICAgICAgICAgICAqdmFsID0gMTI1MDsKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIElJT19WQUxfSU5UOwo+IAoKLi4uCgo+ID4gPiArCj4gPiA+ICtz
dGF0aWMgaXJxcmV0dXJuX3QgbXQ2MzYwX2FkY190cmlnZ2VyX2hhbmRsZXIoaW50IGlycSwgdm9p
ZCAqcCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgc3RydWN0IGlpb19wb2xsX2Z1bmMgKnBmID0gcDsK
PiA+ID4gKyAgICAgc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiA9IHBmLT5pbmRpb19kZXY7Cj4g
PiA+ICsgICAgIHN0cnVjdCBtdDYzNjBfYWRjX2RhdGEgKm1hZCA9IGlpb19wcml2KGluZGlvX2Rl
dik7Cj4gPiA+ICsgICAgIHN0cnVjdCB7Cj4gPiA+ICsgICAgICAgICAgICAgdTE2IHZhbHVlc1tN
VDYzNjBfQ0hBTl9NQVhdOyAgCj4gPgo+ID4gVGhlcmUgaXMgYSBob2xlIGluIGhlcmUgSSB0aGlu
az8gKE1UNjM2MF9DSEFOX01BWCBpcyAxMT8pCj4gPiBJZiBzbyB3ZSBuZWVkIHRvIGV4cGxpY2l0
bHkgbWVtc2V0IHRoZSBzdHJ1Y3R1cmUgdG8gYXZvaWQgYW55Cj4gPiByaXNrIG9mIGtlcm5lbCBk
YXRhIGxlYWthZ2UgdG8gdXNlcnNwYWNlLgoKTWFrZSBzdXJlIHlvdSBkZWFsIHdpdGggdGhpcyBp
biB2NSEKCj4gPiAgCj4gPiA+ICsgICAgICAgICAgICAgaW50NjRfdCB0aW1lc3RhbXA7Cj4gPiA+
ICsgICAgIH0gZGF0YTsgIAo+ID4KPiA+IEkgZ3Vlc3Mgd2Uga25vdyB0aGlzIGlzIG9uIGEgcGxh
dGZvcm0gd2l0aCA2NGJpdCBhbGlnbm1lbnQgZm9yIGludDY0X3Qncwo+ID4gKHVubGlrZSB4ODZf
NjQgZm9yIGV4YW1wbGUpCj4gPiAgCj4gCj4gRG8geW91IG1lYW4gY2hhbmdlIGFzIGJlbG93Pwo+
IHN0cnVjdCB7Cj4gICAgIHUxNiB2YWx1ZXNbTVQ2MzYwX0NIQU5fTUFYXTsKPiAgICAgaW50NjRf
dCB0aW1lc3RhbXA7IF9fYWxpZ25lZCg4KQo+IH0gZGF0YTsKCllvdSBjYW4gZG8gdGhhdCwgb3Ig
d2UgY2FuIHJlbHkgb24gdGhlIGZhY3QgdGhpcyBwYXJ0IGlzIG5ldmVyIHVzZWQKb24gYSBwbGF0
Zm9ybSB3aGVyZSB0aGF0IGlzbid0IGd1YXJhbnRlZWQgYW55d2F5LgoKPiAKPiA+ID4gKyAgICAg
aW50IGkgPSAwLCBiaXQsIHZhbCwgcmV0OwouLi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
