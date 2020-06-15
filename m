Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912C7C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 06:57:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60FF72067B
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 06:57:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k8R5j4Fb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH17I2he"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60FF72067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lOD/WVYg5Cm3Mj1V96OfcwsCR1XU/ARd/8vfiBtsJUg=; b=k8R5j4FbpcgbPp
	p92GYwtqfpHvxEC/aWThqnkTrQeoUBJ2e8mAT4lpEQbLdc4Fo77KyOEjAzW8/7Hggi04VE+frkx3G
	nafE1W/rAbM/cJUvnvqX25pnpGMJPjZ+U4y6fAQE8qeYjCHY+LOiUJEWB1DMvgK/Yk4iYqztk6LDe
	LmH5hVZC01DcNC//yQ5yWoOo2P9c/z1BOPj+JC2n2TKNWtcJffDtkAqx+FAFa4zpuIGfYu1C/0rbO
	AMDTYN+EEuT0MvZ/xWXQlLy+JgZ4RE1VN40CyS+RPBwDo1GP8kYNs4ix82+cJJNsNXz8oMc64G8xJ
	FBhnwqT/eq26pFW1hEqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkj3w-0001X6-4W; Mon, 15 Jun 2020 06:57:44 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkj3k-0001Nv-Cq; Mon, 15 Jun 2020 06:57:33 +0000
Received: by mail-io1-xd41.google.com with SMTP id o5so16620847iow.8;
 Sun, 14 Jun 2020 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=prTw8COlP0YawtaeVf0HJDCuQeY7haR6XjvMZVeDwlQ=;
 b=gH17I2hedonyS691+W+6fep+3TY2IXaj+WglcDlC4uQCnGNqbuuK/7lyqoLAnsWn3g
 x2Ah5LgH+8DHm7Pne9IQxpIpOXRgBdtuZ70LctwowboPEGiRtKl7X0CXO9/0c52j0t3z
 AlhBaH7/hfN1Rluumj9XQNvR6H4dLCTgI8wN3t6LOXKmu6//ZWxLRGWsIQKybkGqEits
 ymTOoXUd+zMG7KP80pm6qMiKu11Nz2Fqb7mTQ4c1eRj04F0IdpI7b4Pj4FDVjs8gDKEB
 X1PQ4tyOMcC4e/C7KpZnTdCzqyf+EJRozJmNbrhCqN2SMCCejsQfW1l0r0kS94GVokzH
 bLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=prTw8COlP0YawtaeVf0HJDCuQeY7haR6XjvMZVeDwlQ=;
 b=Z0wH4bECK5yj5Smz7ivW/pc1KPWA0gNVYah2i10GWDrFun5J0kyWB9OEW8tcWXROFk
 FCpuCZbYcJ/LscGAo95HlfMLM/qareA15hI0b7k6kok+vcILa41OSC9FMoCo40m/992x
 4UANdGNqEc5tniijWKHR1F6mC93om4GsQ3lXBF+oQgH1PgMBY5FOzIofcVS7z1QxvTaR
 izWTon47dN88mNzJDN3W078cGRhtif1ayZD2EtidCNnN5Q0NI9KawbNYojamZ/JvThsa
 py0/HpP/fijeHauOaSbXBodCQtFT44s0L73CKHnpD9Ueji6ko4HnQllhpHDEVV0l6+J3
 ZSBg==
X-Gm-Message-State: AOAM533nVDonOH19069unn8t1R0ZKIj7f+lxsAjcPmIsOoJ6HfVzxYVH
 jGZAF2SHQldmxzwvwfzlasI2O661Fad0A18cPO8=
X-Google-Smtp-Source: ABdhPJx+23o2l20XfKG7SyHZUNrf9US3cZjYRnOb+N5AUOux9SiMesGnHU/4N6bPSWQvtmT67O+1T8aFvEYB+jPDyas=
X-Received: by 2002:a02:9a03:: with SMTP id b3mr19918046jal.76.1592204250795; 
 Sun, 14 Jun 2020 23:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <1591609125-3761-1-git-send-email-gene.chen.richtek@gmail.com>
 <20200608192829.GG4106@dell>
 <CAE+NS36mxw-FpQhJ4qV=_+r2CXVi_PaGaZo2m3jXAGFuOO252Q@mail.gmail.com>
 <20200609125305.GL4106@dell>
 <CAE+NS36b8fV2JnSEJpky+0ES3KTYmQzC0MRTfRUf8yRsJh_bpQ@mail.gmail.com>
 <20200612111717.GA2311694@dell>
In-Reply-To: <20200612111717.GA2311694@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 15 Jun 2020 14:57:19 +0800
Message-ID: <CAE+NS34gf+my16b8dGCBWy0rXjT-5ObcvQiMVWHqsGehb_yR4Q@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6360: Fix register driver NULL pointer by add
 driver name
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200614_235732_438813_1BBF3595 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ25pyIMTLml6Ug6YCx
5LqUIOS4i+WNiDc6MTflr6vpgZPvvJoKPgo+IE9uIEZyaSwgMTIgSnVuIDIwMjAsIEdlbmUgQ2hl
biB3cm90ZToKPgo+ID4gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDl
ubQ25pyIOeaXpSDpgLHkuowg5LiL5Y2IODo1M+Wvq+mBk++8mgo+ID4gPgo+ID4gPiBPbiBUdWUs
IDA5IEp1biAyMDIwLCBHZW5lIENoZW4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ25pyIOeaXpSDpgLHkuowg5LiK5Y2IMzoy
OOWvq+mBk++8mgo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIE1vbiwgMDggSnVuIDIwMjAsIEdlbmUg
Q2hlbiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9j
aGVuQHJpY2h0ZWsuY29tPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBhY2NpZGVudGFsbHkgcmVt
b3ZlIGRyaXZlciBuYW1lIHdoZW4KPiA+ID4gPiA+ID4gcmVwbGFjZSBwcm9iZSBieSBwcm9iZV9u
ZXcgaW4gYWRkIG10NjM2MCBtZmQgZHJpdmVyIHBhdGNoIHY0Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IFsgIDEyMS4yNDMwMTJdIEVBWDogYzJhOGJjNjQgRUJYOiAwMDAwMDAwMCBFQ1g6IDAwMDAw
MDAwIEVEWDogMDAwMDAwMDAKPiA+ID4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gRVNJOiBjMmE4YmM3
OSBFREk6IDAwMDAwMDAwIEVCUDogZTU0YmRlYTggRVNQOiBlNTRiZGVhMAo+ID4gPiA+ID4gPiBb
ICAxMjEuMjQzMDEyXSBEUzogMDA3YiBFUzogMDA3YiBGUzogMDAwMCBHUzogMDAwMCBTUzogMDA2
OCBFRkxBR1M6IDAwMDEwMjg2Cj4gPiA+ID4gPiA+IFsgIDEyMS4yNDMwMTJdIENSMDogODAwNTAw
MzMgQ1IyOiAwMDAwMDAwMCBDUjM6IDAyZWMzMDAwIENSNDogMDAwMDA2YjAKPiA+ID4gPiA+ID4g
WyAgMTIxLjI0MzAxMl0gQ2FsbCBUcmFjZToKPiA+ID4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gIGtz
ZXRfZmluZF9vYmorMHgzZC8weGMwCj4gPiA+ID4gPiA+IFsgIDEyMS4yNDMwMTJdICBkcml2ZXJf
ZmluZCsweDE2LzB4NDAKPiA+ID4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gIGRyaXZlcl9yZWdpc3Rl
cisweDQ5LzB4MTAwCj4gPiA+ID4gPiA+IFsgIDEyMS4yNDMwMTJdICA/IGkyY19mb3JfZWFjaF9k
ZXYrMHgzOS8weDUwCj4gPiA+ID4gPiA+IFsgIDEyMS4yNDMwMTJdICA/IF9fcHJvY2Vzc19uZXdf
YWRhcHRlcisweDIwLzB4MjAKPiA+ID4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gID8gY2h0X3djX2Ry
aXZlcl9pbml0KzB4MTEvMHgxMQo+ID4gPiA+ID4gPiBbICAxMjEuMjQzMDEyXSAgaTJjX3JlZ2lz
dGVyX2RyaXZlcisweDMwLzB4ODAKPiA+ID4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gID8gaW50ZWxf
bHBzc19wY2lfZHJpdmVyX2luaXQrMHgxNi8weDE2Cj4gPiA+ID4gPiA+IFsgIDEyMS4yNDMwMTJd
ICBtdDYzNjBfcG11X2RyaXZlcl9pbml0KzB4Zi8weDExCj4gPiA+ID4gPiA+IFsgIDEyMS4yNDMw
MTJdICBkb19vbmVfaW5pdGNhbGwrMHgzMy8weDFhMAo+ID4gPiA+ID4gPiBbICAxMjEuMjQzMDEy
XSAgPyBwYXJzZV9hcmdzKzB4MWViLzB4M2QwCj4gPiA+ID4gPiA+IFsgIDEyMS4yNDMwMTJdICA/
IF9fbWlnaHRfc2xlZXArMHgzMS8weDkwCj4gPiA+ID4gPiA+IFsgIDEyMS4yNDMwMTJdICA/IGtl
cm5lbF9pbml0X2ZyZWVhYmxlKzB4MTBhLzB4MTdmCj4gPiA+ID4gPiA+IFsgIDEyMS4yNDMwMTJd
ICBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDEyYy8weDE3Zgo+ID4gPiA+ID4gPiBbICAxMjEuMjQz
MDEyXSAgPyByZXN0X2luaXQrMHgxMTAvMHgxMTAKPiA+ID4gPiA+ID4gWyAgMTIxLjI0MzAxMl0g
IGtlcm5lbF9pbml0KzB4Yi8weDEwMAo+ID4gPiA+ID4gPiBbICAxMjEuMjQzMDEyXSAgPyBzY2hl
ZHVsZV90YWlsX3dyYXBwZXIrMHg5LzB4Ywo+ID4gPiA+ID4gPiBbICAxMjEuMjQzMDEyXSAgcmV0
X2Zyb21fZm9yaysweDE5LzB4MjQKPiA+ID4gPiA+ID4gWyAgMTIxLjI0MzAxMl0gTW9kdWxlcyBs
aW5rZWQgaW46Cj4gPiA+ID4gPiA+IFsgIDEyMS4yNDMwMTJdIENSMjogMDAwMDAwMDAwMDAwMDAw
MAo+ID4gPiA+ID4gPiBbICAxMjEuMjQzMDEyXSByYW5kb206IGdldF9yYW5kb21fYnl0ZXMgY2Fs
bGVkIGZyb20gaW5pdF9vb3BzX2lkKzB4M2EvMHg0MCB3aXRoIGNybmdfaW5pdD0wCj4gPiA+ID4g
PiA+IFsgIDEyMS4yNDMwMTJdIC0tLVsgZW5kIHRyYWNlIDM4YTgwMzQwMGYxYTJiZWUgXS0tLQo+
ID4gPiA+ID4gPiBbICAxMjEuMjQzMDEyXSBFSVA6IHN0cmNtcCsweDExLzB4MzAKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBIb3cgZGlkIHRoaXMgZHJpdmVyIGV2ZXIgd29yayBmb3IgeW91Pwo+ID4gPiA+
Cj4gPiA+ID4gaSBhc2sgbXkgY293b3JrZXIgaGVscCBtZSB2ZXJpZnkuCj4gPiA+ID4gaSB3aWxs
IGNoZWNrIHRoZSBwYXRjaCBteXNlbGYsIHNpbmNlcmVseSBhcG9sb2dpZXMgZm9yIHRoaXMuCj4g
PiA+Cj4gPiA+IFdoYXQgZG9lcyB0aGlzIG1lYW4/Cj4gPiA+Cj4gPiA+IEFyZSB5b3Ugc2F5aW5n
IHRoYXQgZm9yIGFsbCAxMCB2ZXJzaW9ucyBvZiB0aGlzIHBhdGNoIHN1Ym1pc3Npb24sIGl0Cj4g
PiA+IGhhcyBuZXZlciBiZWVuIHRlc3RlZD8gIEFuZCBkZXNwaXRlIGJlaW5nIGF1dGhvcmVkIGJ5
IHlvdSBhbmQKPiA+ID4gc3VibWl0dGVkIGJ5IHlvdSwgeW91IGhhdmUgbmV2ZXIgYWN0dWFsbHkg
Ym9vdCB0ZXN0ZWQgdGhlIGRyaXZlcgo+ID4gPiB5b3Vyc2VsZj8gIFJlbHlpbmcgaW5zdGVhZCBv
biB5b3VyIGNvLXdvcmtlciB0byBjb25kdWN0IHRoZSB0ZXN0aW5nLAo+ID4gPiB3aG8gZmFpbGVk
IHRvIGRvIHNvLiAgSXMgdGhhdCByZWFsbHkgY29ycmVjdD8KPiA+ID4KPiA+Cj4gPiBPbiBjYXJl
ZnVsbHkgcmVhZGluZyB0byB0aGUgZG9jdW1lbnQgaG93IHRvIHVwc3RyZWFtLCBJIGZpbmQgdGhh
dCBJCj4gPiBoYWQgZnVsbCBkdXR5IGZvciB2ZXJpZnkgcGF0Y2ggaSBzZW50Lgo+ID4gVGhlIGZh
dWx0IGlzIGVudGlyZWx5IG1pbmUgYW5kIEkgZGVlcGx5IHJlZ3JldCB0aGF0IGl0IHNob3VsZCBo
YXZlIG9jY3VycmVkLgo+ID4gSSB3aWxsIGFsd2F5cyB2ZXJpZnkgcGF0Y2ggYnkgbWVzZWxmIGJl
Zm9yZSBzZW5kaW5nIGl0Lgo+ID4gSSBoYXZlIGFscmVhZHkgdmVyZmllZCBzdWItZGV2aWNlIGFk
Yy9sZWQvcmVndWxhdG9yIGRvbmUgaW4gTWVkaWF0ZWsKPiA+IHBob25lIGFuZCBIaWtleTk2MCBk
ZXZlbG9wbWVudCBib2FyZAo+Cj4gSSdtIG5vdCBsb29raW5nIGZvciBzb21lb25lIHRvIGJsYW1l
LiAgSW5zdGVhZCwgSSB3b3VsZCBsaWtlIHRvCj4gYXNjZXJ0YWluIGhvdyB0aGlzIGhhcHBlbmVk
LiAgSG93IHdhcyB0aGlzIGRyaXZlciBldmVyCj4gdGVzdGVkL3ZlcmlmaWVkPyAgSWYgeW91J3Jl
IG5vdCBnb2luZyB0byBydW4vdXNlIGl0LCBkb2VzIGl0IGV2ZW4gbmVlZAo+IHRvIGV4aXN0Pwo+
CgpUaGVyZSBpcyBkaWZmZXJlbmNlIGJldHdlZW4gdXBzdHJlYW0gYW5kIGNvbW1lcmljYWwgZHJp
dmVyLgpXZSB3aWxsIHN5bmMgdXBzdHJlYW0gdmVyc2lvbiBhZnRlciB1cHN0cmVhbSBkb25lLCBp
biBvcmRlciB0byBiZWNvbWUKY29tbW9uIGRyaXZlciBldmVyeW9uZSBjYW4gZWFzeSB0byB1c2UK
Cj4gLS0KPiBMZWUgSm9uZXMgW+adjueQvOaWr10KPiBTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBE
ZXZlbG9wZXIgU2VydmljZXMKPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBm
b3IgQXJtIFNvQ3MKPiBGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
