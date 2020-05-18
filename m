Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18298C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 15:31:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCCD7207ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 15:31:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S2mwJw99";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lstul7dk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCCD7207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2dTinFz9p98EI+LdyxpFzfli3TuLp7NcgHJK30EvuI=; b=S2mwJw99E68wvI
	cBNJRClwZsgysG0tciUT42yFLyOTDBsG/CeXe6iH1pvsTPBD4l/Ij4SV/3bWMLmrQ5+Q4k6WwgruH
	uD0USd+zspoR7lTXaxkNxikw7DnOEUoGCqfC9kuDDv7gMpTNr0N5zD9Ka4zBMfo1eiSTt+H+73cTt
	+mtZ7Hq97uPUf0DT24JNR2wCULMRydS02YpOoQLQl71uKRM2MRCmICG45HrjMrwac+9whtYLCrTwH
	q+ScGGJdtUJ3aYG1YDqMZ4d1hWL8Y/yrkZoa6edLeQEqbrCUCBcaryKpIjkUqP4HZ/Erqnf40+53V
	MgWt03wF2OPGiGJmjxvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jahjY-0000Ek-Rb; Mon, 18 May 2020 15:31:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jahjF-0008V0-PH; Mon, 18 May 2020 15:30:59 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CF242086A;
 Mon, 18 May 2020 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589815857;
 bh=mOGRIgATXCaoYLlPjTGM7OxQp7Rn0K8nGLavhwaGw/g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Lstul7dk5bmGsfDbFN8VWwMAuyU3oipItF/LaWXkWfhnn9aYwUES/qtRsj25CdqbI
 HTyXMB/Edmia6M4okNtn4PIxXoPD3p3c6188gvqPnuOcYm539BpYxKW5MB++zFE53X
 OoYgntGRVmBfRWI4aXOAGlzahVx5guUvw/de1fyU=
Received: by mail-ej1-f54.google.com with SMTP id s21so9175297ejd.2;
 Mon, 18 May 2020 08:30:56 -0700 (PDT)
X-Gm-Message-State: AOAM533ug9d39PsKvEHdcv/dFp+TfvhaGR9RS9mJ+T2qCtOhIwYYN2/r
 1hCRgWEpLVx17+Z4NxNE9AFhamKIEpSZFUSMCw==
X-Google-Smtp-Source: ABdhPJycD95owhAarHRJ4FN02oHjKHI+oZIVAI4p7qeyibBNsTqdoru9JEcc0l+4TBtcPYB7VuZi4PHySGlFopHwhms=
X-Received: by 2002:a17:906:2503:: with SMTP id
 i3mr14587876ejb.293.1589815855340; 
 Mon, 18 May 2020 08:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200518113156.25009-1-matthias.bgg@kernel.org>
In-Reply-To: <20200518113156.25009-1-matthias.bgg@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 18 May 2020 23:30:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9-_fy4oGTBLPsXkWJ2ihL7k2hzfwiTorit+YkNi_SeMw@mail.gmail.com>
Message-ID: <CAAOTY_9-_fy4oGTBLPsXkWJ2ihL7k2hzfwiTorit+YkNi_SeMw@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk/soc: mediatek: mt8183: Bind clock driver from
 platform device
To: matthias.bgg@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_083057_866393_D3B2007B 
X-CRM114-Status: GOOD (  18.72  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Allison Randal <allison@lohutok.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDXmnIgx
OOaXpSDpgLHkuIAg5LiL5Y2INzozMuWvq+mBk++8mgo+Cj4gRnJvbTogTWF0dGhpYXMgQnJ1Z2dl
ciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPgo+IFRoZSBtbXN5cyBkcml2ZXIgaXMgbm93IHRo
ZSB0b3AgbGV2ZWwgZW50cnkgcG9pbnQgZm9yIHRoZSBtdWx0aW1lZGlhCj4gc3lzdGVtIChtbXN5
cyksIHdlIGJpbmQgdGhlIGNsb2NrIGRyaXZlciBieSBjcmVhdGluZyBhIHBsYXRmb3JtIGRldmlj
ZS4KPiBXZSBhbHNvIGJpbmQgdGhlIE1lZGlhVGVrIERSTSBkcml2ZXIgd2hpY2ggaXMgbm90IHll
dCBpbXBsZW1lbnQgYW5kCj4gdGhlcmVmb3Igd2lsbCBlcnJyb3Igb3V0IGZvciBub3cuCgpZb3Ug
bWF5IG5lZWQgdG8gbGV0IENPTkZJR19NVEtfTU1TWVMgZGVwZW5kcyBvbgpDT05GSUdfQ09NTU9O
X0NMS19NVDgxNzNfTU1TWVMgfHwgQ09ORklHX0NPTU1PTl9DTEtfTVQ4MTgzX01NU1lTCgpSZWdh
cmRzLApDaHVuLUt1YW5nLgoKPgo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1h
dHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gLS0tCj4KPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xr
LW10ODE4My1tbS5jIHwgOSArKy0tLS0tLS0KPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1t
c3lzLmMgICAgIHwgOCArKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsv
Y2xrLW10ODE4My1tbS5jIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE4My1tbS5jCj4g
aW5kZXggNzIwYzY5NmI1MDZkLi45ZDYwZTA5NjE5YzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9j
bGsvbWVkaWF0ZWsvY2xrLW10ODE4My1tbS5jCj4gKysrIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsv
Y2xrLW10ODE4My1tbS5jCj4gQEAgLTg0LDggKzg0LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfZ2F0ZSBtbV9jbGtzW10gPSB7Cj4KPiAgc3RhdGljIGludCBjbGtfbXQ4MTgzX21tX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiArICAgICAgIHN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUg
PSBkZXYtPnBhcmVudC0+b2Zfbm9kZTsKPiAgICAgICAgIHN0cnVjdCBjbGtfb25lY2VsbF9kYXRh
ICpjbGtfZGF0YTsKPiAtICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSA9IHBkZXYtPmRl
di5vZl9ub2RlOwo+Cj4gICAgICAgICBjbGtfZGF0YSA9IG10a19hbGxvY19jbGtfZGF0YShDTEtf
TU1fTlJfQ0xLKTsKPgo+IEBAIC05NSwxNiArOTYsMTAgQEAgc3RhdGljIGludCBjbGtfbXQ4MTgz
X21tX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICByZXR1cm4g
b2ZfY2xrX2FkZF9wcm92aWRlcihub2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0LCBjbGtfZGF0
YSk7Cj4gIH0KPgo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvZl9tYXRjaF9j
bGtfbXQ4MTgzX21tW10gPSB7Cj4gLSAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE4My1tbXN5cyIsIH0sCj4gLSAgICAgICB7fQo+IC19Owo+IC0KPiAgc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgY2xrX210ODE4M19tbV9kcnYgPSB7Cj4gICAgICAgICAucHJvYmUgPSBj
bGtfbXQ4MTgzX21tX3Byb2JlLAo+ICAgICAgICAgLmRyaXZlciA9IHsKPiAgICAgICAgICAgICAg
ICAgLm5hbWUgPSAiY2xrLW10ODE4My1tbSIsCj4gLSAgICAgICAgICAgICAgIC5vZl9tYXRjaF90
YWJsZSA9IG9mX21hdGNoX2Nsa19tdDgxODNfbW0sCj4gICAgICAgICB9LAo+ICB9Owo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jIGIvZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLW1tc3lzLmMKPiBpbmRleCBjYWNhZmUyM2M4MjMuLjc4M2MzZGQwMDhiMiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYwo+ICsrKyBiL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gQEAgLTkyLDYgKzkyLDEwIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10ODE3M19tbXN5c19kcml2ZXJf
ZGF0YSA9IHsKPiAgICAgICAgIC5jbGtfZHJpdmVyID0gImNsay1tdDgxNzMtbW0iLAo+ICB9Owo+
Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10ODE4M19tbXN5
c19kcml2ZXJfZGF0YSA9IHsKPiArICAgICAgIC5jbGtfZHJpdmVyID0gImNsay1tdDgxODMtbW0i
LAo+ICt9Owo+ICsKPiAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtfbW1zeXNfZGRwX21vdXRfZW4o
ZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX2lkIG5leHQsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICphZGRyKQo+IEBAIC0zMzks
NiArMzQzLDEwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX21hdGNoX210
a19tbXN5c1tdID0gewo+ICAgICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxt
dDgxNzMtbW1zeXMiLAo+ICAgICAgICAgICAgICAgICAuZGF0YSA9ICZtdDgxNzNfbW1zeXNfZHJp
dmVyX2RhdGEsCj4gICAgICAgICB9LAo+ICsgICAgICAgewo+ICsgICAgICAgICAgICAgICAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtbW1zeXMiLAo+ICsgICAgICAgICAgICAgICAuZGF0
YSA9ICZtdDgxODNfbW1zeXNfZHJpdmVyX2RhdGEsCj4gKyAgICAgICB9LAo+ICAgICAgICAgeyB9
Cj4gIH07Cj4KPiAtLQo+IDIuMjYuMgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
