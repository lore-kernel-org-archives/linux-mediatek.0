Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC07C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 11:44:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3B842064C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 11:44:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g8oZQIwb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caEOUEWg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3B842064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsxZ9djCKzELOD1vW5S/bj95+xDlF57Mow0J5jWe+B8=; b=g8oZQIwb5dqRem
	l/PVdgDWF1V4zsKKkab/GykXd8h31JYyHa7wg+mcdSpGmZAAYw5oxziH/xCSudD1O7OO3CxT65BCm
	mY+NGudYU+TqMcp4r2qeyN9ZBpARQaljadhb1XgWRedewS49JCKtQO2FYL7i7b3t2CKgTZdac4Rie
	/vQMA3yAsDI/AvpFMhz+2dcd58Zy4TIRnWlGKyozH6xC2d6su1tc8hsNBKcOnKkYxAAeFvHx6wFtw
	wyEluICvNdIlSslIzPkwVMeHfGYK2KJwAhFsBs4dHckW1on3wqzz+jArNs+3pPoARhWqWqT8srAkY
	19cYcph/ecgt9I0aa1Kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jicff-0003I5-CP; Tue, 09 Jun 2020 11:43:59 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jicfW-00039Q-Oa; Tue, 09 Jun 2020 11:43:52 +0000
Received: by mail-il1-x141.google.com with SMTP id h3so19938537ilh.13;
 Tue, 09 Jun 2020 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hIZcde/O0lhQt+tclxIsnIomOUROmtIJB8oligd0v60=;
 b=caEOUEWgCiTp1X9TY7aGflhD7i0tcXSAIXQwLHWDNIT8wViqQCEMUwbMUZN79zv0Yy
 GJ6L25DJhiobGcDXStzcaGBSBL7JjhRMq8VVf7UG0TKdnN3kMiwm9OEH6SumeYuSIL4b
 8IKyshulsfGdrx1DanUewpue+NbzNnbFBMbc+B1EMkcnD7vA0M53fTmZTYzTvRKo5Fa4
 XPRj83VkH75J/rhe8g6B5u7D/k7bhYedqyWVvgy/X3qCFH/Lv6tC3SMYzQxfjZ/0+PMf
 YffhKelf7OXkZsUmub9VENBfP7LO6CmhJnegxzmRfWg7wl7i6ZdbeRufsclRhfSzLf3r
 Ay0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hIZcde/O0lhQt+tclxIsnIomOUROmtIJB8oligd0v60=;
 b=f64CxymHX8NDwaeqXMu/zdc4TaPZxdShbWHZTn+hqgv6UaU8Ldmu9kjfaftQjJILw0
 VJRdnG4mzOkEgVMxBWug6OGvSgaEyvx0uweXeIL5JL1a96EOCJgWfzViwbC/AEtLnehJ
 oBt1+s+JqThIS1D2mihRNFy2dbVqi/3DO7gpqOp7RhKTBlWHiVUEWdxjX5Ufh2hlnCmL
 G/2mN1MXBL0HeqnLQYAj22p8gcyqALVZqpE8y0ni77VhoNPurZAgL48m1CzGEXxvD+NA
 6+r0Wn8DeI16/aGxf9nSt2eFCX3UD0wfVORM3zMLh291VRUPPx5zhX9gzKrbteUx7NIf
 umdQ==
X-Gm-Message-State: AOAM531J7B55pjzS5SP3FnDrxmYfpNISa+79D6BLz+FrKwbSwOsRXAu7
 kwDJpnYkp/hBQK+KkwOzfFOTExlVr8vj7iH1yM0Ihw0L
X-Google-Smtp-Source: ABdhPJzFYa1v7Pfs5GXW2MgOgJ+zvbsMZxjpmoT6A8GN/KqiUr3V0+OQQnD6tP1yjfm9+DD7zgMyU4xq8IyQ1U0x9Ug=
X-Received: by 2002:a92:1904:: with SMTP id 4mr13037156ilz.212.1591703029556; 
 Tue, 09 Jun 2020 04:43:49 -0700 (PDT)
MIME-Version: 1.0
References: <1591609125-3761-1-git-send-email-gene.chen.richtek@gmail.com>
 <20200608192829.GG4106@dell>
In-Reply-To: <20200608192829.GG4106@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 9 Jun 2020 19:43:38 +0800
Message-ID: <CAE+NS36mxw-FpQhJ4qV=_+r2CXVi_PaGaZo2m3jXAGFuOO252Q@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6360: Fix register driver NULL pointer by add
 driver name
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_044350_812584_3081106F 
X-CRM114-Status: GOOD (  14.57  )
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

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ25pyIOeaXpSDpgLHk
uowg5LiK5Y2IMzoyOOWvq+mBk++8mgo+Cj4gT24gTW9uLCAwOCBKdW4gMjAyMCwgR2VuZSBDaGVu
IHdyb3RlOgo+Cj4gPiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+
Cj4gPiBhY2NpZGVudGFsbHkgcmVtb3ZlIGRyaXZlciBuYW1lIHdoZW4KPiA+IHJlcGxhY2UgcHJv
YmUgYnkgcHJvYmVfbmV3IGluIGFkZCBtdDYzNjAgbWZkIGRyaXZlciBwYXRjaCB2NAo+ID4KPiA+
IFsgIDEyMS4yNDMwMTJdIEVBWDogYzJhOGJjNjQgRUJYOiAwMDAwMDAwMCBFQ1g6IDAwMDAwMDAw
IEVEWDogMDAwMDAwMDAKPiA+IFsgIDEyMS4yNDMwMTJdIEVTSTogYzJhOGJjNzkgRURJOiAwMDAw
MDAwMCBFQlA6IGU1NGJkZWE4IEVTUDogZTU0YmRlYTAKPiA+IFsgIDEyMS4yNDMwMTJdIERTOiAw
MDdiIEVTOiAwMDdiIEZTOiAwMDAwIEdTOiAwMDAwIFNTOiAwMDY4IEVGTEFHUzogMDAwMTAyODYK
PiA+IFsgIDEyMS4yNDMwMTJdIENSMDogODAwNTAwMzMgQ1IyOiAwMDAwMDAwMCBDUjM6IDAyZWMz
MDAwIENSNDogMDAwMDA2YjAKPiA+IFsgIDEyMS4yNDMwMTJdIENhbGwgVHJhY2U6Cj4gPiBbICAx
MjEuMjQzMDEyXSAga3NldF9maW5kX29iaisweDNkLzB4YzAKPiA+IFsgIDEyMS4yNDMwMTJdICBk
cml2ZXJfZmluZCsweDE2LzB4NDAKPiA+IFsgIDEyMS4yNDMwMTJdICBkcml2ZXJfcmVnaXN0ZXIr
MHg0OS8weDEwMAo+ID4gWyAgMTIxLjI0MzAxMl0gID8gaTJjX2Zvcl9lYWNoX2RldisweDM5LzB4
NTAKPiA+IFsgIDEyMS4yNDMwMTJdICA/IF9fcHJvY2Vzc19uZXdfYWRhcHRlcisweDIwLzB4MjAK
PiA+IFsgIDEyMS4yNDMwMTJdICA/IGNodF93Y19kcml2ZXJfaW5pdCsweDExLzB4MTEKPiA+IFsg
IDEyMS4yNDMwMTJdICBpMmNfcmVnaXN0ZXJfZHJpdmVyKzB4MzAvMHg4MAo+ID4gWyAgMTIxLjI0
MzAxMl0gID8gaW50ZWxfbHBzc19wY2lfZHJpdmVyX2luaXQrMHgxNi8weDE2Cj4gPiBbICAxMjEu
MjQzMDEyXSAgbXQ2MzYwX3BtdV9kcml2ZXJfaW5pdCsweGYvMHgxMQo+ID4gWyAgMTIxLjI0MzAx
Ml0gIGRvX29uZV9pbml0Y2FsbCsweDMzLzB4MWEwCj4gPiBbICAxMjEuMjQzMDEyXSAgPyBwYXJz
ZV9hcmdzKzB4MWViLzB4M2QwCj4gPiBbICAxMjEuMjQzMDEyXSAgPyBfX21pZ2h0X3NsZWVwKzB4
MzEvMHg5MAo+ID4gWyAgMTIxLjI0MzAxMl0gID8ga2VybmVsX2luaXRfZnJlZWFibGUrMHgxMGEv
MHgxN2YKPiA+IFsgIDEyMS4yNDMwMTJdICBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDEyYy8weDE3
Zgo+ID4gWyAgMTIxLjI0MzAxMl0gID8gcmVzdF9pbml0KzB4MTEwLzB4MTEwCj4gPiBbICAxMjEu
MjQzMDEyXSAga2VybmVsX2luaXQrMHhiLzB4MTAwCj4gPiBbICAxMjEuMjQzMDEyXSAgPyBzY2hl
ZHVsZV90YWlsX3dyYXBwZXIrMHg5LzB4Ywo+ID4gWyAgMTIxLjI0MzAxMl0gIHJldF9mcm9tX2Zv
cmsrMHgxOS8weDI0Cj4gPiBbICAxMjEuMjQzMDEyXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiA+IFsg
IDEyMS4yNDMwMTJdIENSMjogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgMTIxLjI0MzAxMl0gcmFu
ZG9tOiBnZXRfcmFuZG9tX2J5dGVzIGNhbGxlZCBmcm9tIGluaXRfb29wc19pZCsweDNhLzB4NDAg
d2l0aCBjcm5nX2luaXQ9MAo+ID4gWyAgMTIxLjI0MzAxMl0gLS0tWyBlbmQgdHJhY2UgMzhhODAz
NDAwZjFhMmJlZSBdLS0tCj4gPiBbICAxMjEuMjQzMDEyXSBFSVA6IHN0cmNtcCsweDExLzB4MzAK
Pgo+IEhvdyBkaWQgdGhpcyBkcml2ZXIgZXZlciB3b3JrIGZvciB5b3U/Cj4KCmkgYXNrIG15IGNv
d29ya2VyIGhlbHAgbWUgdmVyaWZ5LgppIHdpbGwgY2hlY2sgdGhlIHBhdGNoIG15c2VsZiwgc2lu
Y2VyZWx5IGFwb2xvZ2llcyBmb3IgdGhpcy4KCj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvbWZkL210NjM2MC1j
b3JlLmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyBiL2RyaXZlcnMvbWZkL210NjM2
MC1jb3JlLmMKPiA+IGluZGV4IGRiOGNkZjUuLmU5Y2FjYzIgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiArKysgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5j
Cj4gPiBAQCAtNDEyLDYgKzQxMiw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10NjM2MF9w
bXVfb2ZfaWQpOwo+ID4KPiA+ICBzdGF0aWMgc3RydWN0IGkyY19kcml2ZXIgbXQ2MzYwX3BtdV9k
cml2ZXIgPSB7Cj4gPiAgICAgICAuZHJpdmVyID0gewo+ID4gKyAgICAgICAgICAgICAubmFtZSA9
ICJtdDYzNjBfcG11IiwKPiA+ICAgICAgICAgICAgICAgLnBtID0gJm10NjM2MF9wbXVfcG1fb3Bz
LAo+ID4gICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIobXQ2MzYw
X3BtdV9vZl9pZCksCj4gPiAgICAgICB9LAo+Cj4gLS0KPiBMZWUgSm9uZXMgW+adjueQvOaWr10K
PiBTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKPiBMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKPiBGb2xsb3cgTGluYXJvOiBG
YWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
