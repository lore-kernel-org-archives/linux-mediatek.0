Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D65CC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:45:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C29356192E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C29356192E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KV68zC4t9A42djvYvSucGhxtXabSUynpiBPmHEQ+fIs=; b=ionDEz8neVxDvyVbSoGw2nWXL
	xixZ5SHnAZX7bZ0JJKhF2VuFkDidyqws2owzW7k44nOYpK4ehlW/NENQ/puLwu18yc4fcZ4p3rhyW
	wK/D8r3wJLDCsqMCeJ1JLqZznJAXbTotolwy25I0f3Q+oPE+zHOg6d4KCEBUHGkmMA/xd/6SA79So
	zDHxthUiYg+ItIcKWySocNSb6En+V20tRz0PL6tVKE0f5Q2RaOqUCAc+bfV50un1HShBSlOn9x0Ba
	kD+sT0cuM2Jj2TBQKS3zA+Wbbx9Oa85TUIo+9osgHBiqqiDz0CXqCwmTYPLDAyEmTbqfNp7OWVSG7
	F6PvYs1Aw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0dC-001kRC-Fg; Mon, 29 Mar 2021 22:45:10 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsdS-000htX-Rp; Mon, 29 Mar 2021 14:12:57 +0000
Received: by mail-oi1-x231.google.com with SMTP id f9so13192595oiw.5;
 Mon, 29 Mar 2021 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6x8zAt8lnCziyXsdjiT/x+IMPqWACGtewRIKnLgJ5DM=;
 b=ep/MmVDiI62WwC0kfB6zr1ciUzNXIHklI9r7jbqki8dCE7fJLiOn4f5yZuJAAC3Qdu
 DQDDQdDtz1DXj0fcsA0KSbz6JKPHSnP8Lj/rR8gFmPWAkm5SV0xDLc46JNVbC/XfbnFF
 TfuJlEMB1rEwVrj/Ff7saAG4FyI/OXJ9SiAkKj1pOjnaaFNbiY5dZJOwsnJCxbQcGQE9
 RcBCPmrzViUik5W8gsKVvW6A3h6S1fJpMeG+DCrUrl+9EnOx+0xIVyvkVsF5yrGJKs46
 SaGtDG/KamZaeZWeI0IhoRvh3bnrvZElwafBZV+5o6ZaowAW/V5WGSZ2wPkyzGmVRd4K
 GnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6x8zAt8lnCziyXsdjiT/x+IMPqWACGtewRIKnLgJ5DM=;
 b=Qvv1UEeAam9+AZMOjyiSSpOAoIHe2NT5ngGgIMyRyt2i067W6d2uHAkg6DttA+q47T
 s+7SDUHZSmAktld0pY1WqgTTuWhjHYc+p5inNNiEP1jcvjUiHTCz4Wr1DAJjFdXwogoX
 sMmxKJK1tBUm+KRqjVQZz9j3lCX3zxMbXgDrHvxWCtjbeJ7Pzfw8YLhM4F4m8VuV52eX
 /l57KGW8IWwrVFf6DNIysAwNSyFsQS+m+trn2WOkLR3V3zfFoDFR1R5GPYgmPINka9UD
 stO8XM5QBmdDXz6ZHjL4kFd8Ubgwf/Oh6ORiDCslGdzXXqw4bHsjHMibBmavN6qTPLP6
 c65g==
X-Gm-Message-State: AOAM533+OYUg6Bp/8Uy/kSWIfa/cOLTRVT/3spw8jVoNcXrFlZxhkMYZ
 ONwQndfxYy/YdQolkJzlvloOq/AXhtcF8kOTOE0=
X-Google-Smtp-Source: ABdhPJx/j3y4Qh2rl6er04OVmrJwmrKdoXYya3VLSKn3yF6ACR4jSBDD4hKXJ5fiZGTjxx4t/fYTv4ernKXdjGLaEHI=
X-Received: by 2002:aca:f084:: with SMTP id o126mr17882705oih.95.1617027170000; 
 Mon, 29 Mar 2021 07:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
 <3a4a88a9-f0e3-2b65-9df4-6c1d4e3f1c14@roeck-us.net>
 <CADiBU38g_E+iH4jTwQfPvJh4=WRH4vzQ12oubGg47gj+CpTU0A@mail.gmail.com>
 <1611041874.12761.13.camel@mhfsdcap03>
 <CADiBU39fAa30pK5uNCN=sBVZ2pC-ACFqCoY8vKr3+6e+n828tw@mail.gmail.com>
In-Reply-To: <CADiBU39fAa30pK5uNCN=sBVZ2pC-ACFqCoY8vKr3+6e+n828tw@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 29 Mar 2021 22:12:38 +0800
Message-ID: <CADiBU3_==CobcGVoLBF35Hp5+5c3kNuWu4MZBxjk0ZkK-L1-bw@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb typec: tcpci: mt6360: Add vsafe0v support and
 external vbus supply control
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 matthias.bgg@gmail.com, Rob Herring <robh+dt@kernel.org>, 
 Greg KH <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 lkml <linux-kernel@vger.kernel.org>, cy_huang <cy_huang@richtek.com>, 
 gene_chen@richtek.com, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_151255_032780_4F9B6A4C 
X-CRM114-Status: GOOD (  45.71  )
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

SEksIHJldmlld3M6CgpDaGlZdWFuIEh1YW5nIDx1MDA4NDUwMEBnbWFpbC5jb20+IOaWvCAyMDIx
5bm0MeaciDE55pelIOmAseS6jCDkuIvljYg0OjIz5a+r6YGT77yaCj4KPiBDaHVuZmVuZyBZdW4g
PGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+IOaWvCAyMDIx5bm0MeaciDE55pelIOmAseS6jCDk
uIvljYgzOjM45a+r6YGT77yaCj4gPgo+ID4gT24gTW9uLCAyMDIxLTAxLTE4IGF0IDE2OjI4ICsw
ODAwLCBDaGlZdWFuIEh1YW5nIHdyb3RlOgo+ID4gPiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vj
ay11cy5uZXQ+IOaWvCAyMDIx5bm0MeaciDE45pelIOmAseS4gCDkuIrljYgxOjQz5a+r6YGT77ya
Cj4gPiA+ID4KPiA+ID4gPiBPbiAxLzE1LzIxIDY6MTMgQU0sIGN5X2h1YW5nIHdyb3RlOgo+ID4g
PiA+ID4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gTVQ2MzYwIG5vdCBzdXBwb3J0IGZvciBUQ1BDIGNvbW1hbmQgdG8gY29udHJv
bCBzb3VyY2UgYW5kIHNpbmsuCj4gPiA+ID4KPiA+ID4gPiBkb2VzIG5vdAo+ID4gPiA+Cj4gPiA+
IEFjawo+ID4gPiA+ID4gVXNlcyBleHRlcm5hbCA1ViB2YnVzIHJlZ3VsYXRvciBhcyB0aGUgdmJ1
cyBzb3VyY2UgY29udHJvbC4KPiA+ID4gPiA+Cj4gPiA+ID4gVXNlCj4gPiA+ID4KPiA+ID4gQWNr
Cj4gPiA+ID4gPiBBbHNvIGFkZHMgdGhlIGNhcGFiaWxpdHkgdG8gcmVwb3J0IHZzYWZlMHYuCj4g
PiA+ID4gPgo+ID4gPiA+IGFkZAo+ID4gPiA+Cj4gPiA+IEFjawo+ID4gPiA+IFNvIGZhciB0aGlz
IGRyaXZlciB3b3JrcyB3aXRob3V0IHJlZ3VsYXRvci4gVW5sZXNzIEkgYW0gbWlzc2luZyBzb21l
dGhpbmcsCj4gPiA+ID4gdGhpcyBwYXRjaCBtYWtlcyByZWd1bGF0b3Igc3VwcG9ydCBtYW5kYXRv
cnksIG1lYW5pbmcgZXhpc3RpbmcgY29kZSB3aWxsIGZhaWwuCj4gPiA+ID4gSSBhbSBub3Qgc3Vy
ZSBpZiB0aGF0IGlzIGFwcHJvcHJpYXRlL2FjY2VwdGFibGUuIENhbiB3ZSBiZSBzdXJlIHRoYXQg
dGhpcyB3aWxsCj4gPiA+ID4gd29yayBmb3IgZXhpc3RpbmcgdXNlcnMgb2YgdGhpcyBkcml2ZXIg
Pwo+ID4gPiA+Cj4gPiA+IFllcywgSSBhbHJlYWR5IGNoZWNrZWQgYWxsIHRoZSBzcmMvc25rIGZ1
bmN0aW9uYWxpdHkgYmFzZWQgb24gIHRoZQo+ID4gPiBsYXRlc3QgdHlwZWMgY29kZS4KPiA+ID4g
SXQnbGwgYmUgY29tbW9uIGZvciBvdXIgVENQQy4gSXQgZGlkbid0IHN1cHBvcnQgZm9yIFRDUEMg
Y29tbWFuZC4KPiA+ID4gRnJvbSB0aGUgcmVjZW50IHBhdGNoZXMsIGFjdHVhbGx5LCBJIGhhdmUg
dGhlIGxvY2FsIGNoYW5nZSB0byB0ZXN0IHRoZQo+ID4gPiBzcmMgY2FwYWJpbGl0eS4KPiA+ID4g
QnV0IEkgZGlkbid0IHN1Ym1pdCBpdC4gSXQncyBhbG1vc3QgdGhlIHNhbWUgdG8gYWRkIHNldF92
YnVzIGNhbGxiYWNrLgo+ID4gPiBUaGF0J3Mgd2h5IEkgc3VibWl0IHRoaXMgY2hhbmdlIGFmdGVy
IHRjcGNpICdzZXRfdmJ1cyBjYWxsYmFjaycgaXMgYWRkZWQuCj4gPiA+Cj4gPiA+ID4gVGhhbmtz
LAo+ID4gPiA+IEd1ZW50ZXIKPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hpWXVh
biBIdWFuZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBk
cml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcGNpX210NjM2MC5jIHwgMjkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygr
KQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi90eXBlYy90Y3Bt
L3RjcGNpX210NjM2MC5jIGIvZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaV9tdDYzNjAuYwo+
ID4gPiA+ID4gaW5kZXggZjFiZDllMC4uMGVkZjRiNiAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lfbXQ2MzYwLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZl
cnMvdXNiL3R5cGVjL3RjcG0vdGNwY2lfbXQ2MzYwLmMKPiA+ID4gPiA+IEBAIC0xMSw2ICsxMSw3
IEBACj4gPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gPiA+ID4gPiAgI2luY2x1ZGUg
PGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9yZWdt
YXAuaD4KPiA+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvcmVndWxhdG9yL2NvbnN1bWVyLmg+Cj4g
PiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3VzYi90Y3BtLmg+Cj4gPiA+ID4gPgo+ID4gPiA+ID4g
ICNpbmNsdWRlICJ0Y3BjaS5oIgo+ID4gPiA+ID4gQEAgLTM2LDYgKzM3LDcgQEAgc3RydWN0IG10
NjM2MF90Y3BjX2luZm8gewo+ID4gPiA+ID4gICAgICAgc3RydWN0IHRjcGNpX2RhdGEgdGRhdGE7
Cj4gPiA+ID4gPiAgICAgICBzdHJ1Y3QgdGNwY2kgKnRjcGNpOwo+ID4gPiA+ID4gICAgICAgc3Ry
dWN0IGRldmljZSAqZGV2Owo+ID4gPiA+ID4gKyAgICAgc3RydWN0IHJlZ3VsYXRvciAqdmJ1czsK
PiA+ID4gPiA+ICAgICAgIGludCBpcnE7Cj4gPiA+ID4gPiAgfTsKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBAQCAtNTEsNiArNTMsMjcgQEAgc3RhdGljIGlubGluZSBpbnQgbXQ2MzYwX3RjcGNfd3JpdGUx
NihzdHJ1Y3QgcmVnbWFwICpyZWdtYXAsCj4gPiA+ID4gPiAgICAgICByZXR1cm4gcmVnbWFwX3Jh
d193cml0ZShyZWdtYXAsIHJlZywgJnZhbCwgc2l6ZW9mKHUxNikpOwo+ID4gPiA+ID4gIH0KPiA+
ID4gPiA+Cj4gPiA+ID4gPiArc3RhdGljIGludCBtdDYzNjBfdGNwY19zZXRfdmJ1cyhzdHJ1Y3Qg
dGNwY2kgKnRjcGNpLCBzdHJ1Y3QgdGNwY2lfZGF0YSAqZGF0YSwgYm9vbCBzcmMsIGJvb2wgc25r
KQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsgICAgIHN0cnVjdCBtdDYzNjBfdGNwY19pbmZvICpt
dGkgPSBjb250YWluZXJfb2YoZGF0YSwgc3RydWN0IG10NjM2MF90Y3BjX2luZm8sIHRkYXRhKTsK
PiA+ID4gPiA+ICsgICAgIGludCByZXQ7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAvKiBU
byBjb3JyZWN0bHkgaGFuZGxlIHRoZSBhbHJlYWR5IGVuYWJsZWQgdmJ1cyBhbmQgZGlzYWJsZSBp
dHMgc3VwcGx5IGZpcnN0ICovCj4gPiA+ID4gPiArICAgICBpZiAocmVndWxhdG9yX2lzX2VuYWJs
ZWQobXRpLT52YnVzKSkgewo+ID4gPiA+ID4gKyAgICAgICAgICAgICByZXQgPSByZWd1bGF0b3Jf
ZGlzYWJsZShtdGktPnZidXMpOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICBpZiAocmV0KQo+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gPiArICAgICB9
Cj4gPiA+ID4KPiA+ID4gPiBJcyBpdCByZWFsbHkgYSBnb29kIGlkZWEgdG8gZGlzYWJsZSB2YnVz
IGlmIGl0IGhhcHBlbnMgdG8gYmUgYWxyZWFkeSBlbmFibGVkCj4gPiA+ID4gYW5kIHRoZXJlIGlz
IChhbm90aGVyID8pIHJlcXVlc3QgdG8gZW5hYmxlIGl0ID8KPiA+ID4gPgo+ID4gPiBZZXMsIGZv
ciAgdGhlIHN0YXRlIGNoYW5nZSBmcm9tIHNyY19hdHRhY2hfd2FpdCB0byBzcmNfYXR0YWNoLAo+
ID4gPiBJdCBuZWVkIHRvIG1lZXQgdGhlIHJlcXVpcmVtZW50IHRoYXQgIHRoZSB2YnVzIGlzIGF0
IHZzYWZlMHYuCj4gPiA+IFNvIHRvIGRpc2FibGUgaXQgZmlyc3QgaXMgbmVlZGVkLgo+ID4gPiBB
bmQgdG8gcHJldmVudCBvdGhlciB1c2VycyBmcm9tIGVuYWJsaW5nL2Rpc2FibGluZyBleHRlcm5h
bCB2YnVzCj4gPiA+IHJlZ3VsYXRvciBpbiBhbnkgY2FzZS4KPiA+ID4gSSB0aGluayB3ZSBtYXkg
Y2hhbmdlIHJlZ3VsYXRvcl9nZXQgIHRvICdyZWd1bGF0b3JfZ2V0X2V4Y2x1c2l2ZScuCj4gPiA+
IEZyb20gdGhlIGRlc2lnbiwgNXYgcmVndWxhdG9yIG9ubHkgY2FuIGJlIGNvbnRyb2xsZWQgdmlh
IHR5cGVjIGZyYW1ld29yay4KPiA+ID4gSWYgb3RoZXIgdXNlciB0b3VjaCBpdCwgaXQnbGwgYWZm
ZWN0IHRoZSB0eXBlYyBzdGF0ZSB0cmFuc2l0aW9uLgo+ID4gSG93IGFib3V0IHRvIHByb2Nlc3Mg
dGhlIGNhc2UgdGhhdCBldmVuIHN3aXRjaCB1c2IgY29udHJvbGxlciB0byBkZXZpY2UKPiA+IG1v
ZGUsIHBsYXRmb3JtIGFsc28gbmVlZCB0byBrZWVwIHZidXMgb24/IGUuZy4gSXBob25lIENhcnBs
YXkKPiA+Cj4gPgo+IEl0IG11c3QgYmUgcHJvY2Vzc2VkIGJ5IFVTQlBEIGRhdGEgcm9sZSBzd2Fw
Lgo+Cj4gVHlwZSBDIG9ubHkgZGVjaWRlIHRoZSBpbml0aWFsIHJvbGUgKFNOSzogcG93ZXIgc25r
IGFuZCB1ZnA7IFNSQzoKPiBwb3dlciBzcmMgYW5kIERGUCkuCj4gT25seSBVU0JQRCBjYW4gY2hh
bmdlIHRoZSBwb3dlci9kYXRhL3Zjb25uIHJvbGUgaW5kaXZpZHVhbGx5Lgo+CkknbSAgbm90IHN1
cmUgdGhlIHN0YXR1cyBhYm91dCB0aGlzIHBhdGNoLgpCdXQgSSdtIHRyeWluZyB0byBmaWd1cmUg
b3V0IHRoZSBwcm9ibGVtcyBhYm91dCBzb21lIFRDUENzLgoKTm90IGFsbCBUQ1BDcyBjYW4gc3Vw
cG9ydCB0aGUgc291cmNlX3ZidXMvc2lua192YnVzIGNvbW1hbmQuCkknbSB0cnlpbmcgdG8gYWRk
IHRoaXMgcGF0Y2ggbWFrZSBvdXIgbXQ2MzYwIHRjcGMgd29yay4KCk9yaWdpbmFsbHksIEkgYWRk
IHNvbWUgcHJvcHJpZXRhcnkgY29kZSBpbiB1c2IgdG8gbWFrZSB0aGUgb3RnIHZidXMKb3V0cHV0
IGR1ZSB0byBubyBzZXRfdmJ1cyBjYWxsYmFjayBoYW5kbGVkIGJ5IHZlbmRvciBvcHMuCgpFdmVu
dHVhbGx5LCBJIGZvdW5kIHRoZSBwYXRjaApiOTM1OGEwNjg0OTAgdXNiOiB0eXBlYzogdGNwY2k6
IEFkZCBzZXRfdmJ1cyB0Y3BjaSBjYWxsYmFjawoKSG9wZSB0byBnZXQgYW55IHJlc3BvbnNlIGZy
b20geW91Lgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgaWYgKHNyYykgewo+ID4gPiA+ID4g
KyAgICAgICAgICAgICByZXQgPSByZWd1bGF0b3JfZW5hYmxlKG10aS0+dmJ1cyk7Cj4gPiA+ID4g
PiArICAgICAgICAgICAgIGlmIChyZXQpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsKPiA+ID4gPiA+ICsgICAgIH0KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAg
IHJldHVybiAwOwo+ID4gPiA+ID4gK30KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICBzdGF0aWMgaW50
IG10NjM2MF90Y3BjX2luaXQoc3RydWN0IHRjcGNpICp0Y3BjaSwgc3RydWN0IHRjcGNpX2RhdGEg
KnRkYXRhKQo+ID4gPiA+ID4gIHsKPiA+ID4gPiA+ICAgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21h
cCA9IHRkYXRhLT5yZWdtYXA7Cj4gPiA+ID4gPiBAQCAtMTM4LDcgKzE2MSwxMyBAQCBzdGF0aWMg
aW50IG10NjM2MF90Y3BjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+
ID4gPiAgICAgICBpZiAobXRpLT5pcnEgPCAwKQo+ID4gPiA+ID4gICAgICAgICAgICAgICByZXR1
cm4gbXRpLT5pcnE7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gKyAgICAgbXRpLT52YnVzID0gZGV2bV9y
ZWd1bGF0b3JfZ2V0KCZwZGV2LT5kZXYsICJ2YnVzIik7Cj4gPiA+ID4gPiArICAgICBpZiAoSVNf
RVJSKG10aS0+dmJ1cykpCj4gPiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKG10
aS0+dmJ1cyk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgICAgICBtdGktPnRkYXRhLmluaXQgPSBt
dDYzNjBfdGNwY19pbml0Owo+ID4gPiA+ID4gKyAgICAgbXRpLT50ZGF0YS5zZXRfdmJ1cyA9IG10
NjM2MF90Y3BjX3NldF92YnVzOwo+ID4gPiA+ID4gKyAgICAgbXRpLT50ZGF0YS52YnVzX3ZzYWZl
MHYgPSAxOwo+ID4gPiA+ID4gICAgICAgbXRpLT50Y3BjaSA9IHRjcGNpX3JlZ2lzdGVyX3BvcnQo
JnBkZXYtPmRldiwgJm10aS0+dGRhdGEpOwo+ID4gPiA+ID4gICAgICAgaWYgKElTX0VSUihtdGkt
PnRjcGNpKSkgewo+ID4gPiA+ID4gICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJG
YWlsZWQgdG8gcmVnaXN0ZXIgdGNwY2kgcG9ydFxuIik7Cj4gPiA+ID4gPgo+ID4gPiA+Cj4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
