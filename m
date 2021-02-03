Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D07C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 16:14:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FD5164F74
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 16:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FD5164F74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ih1GkY5D1Za2wLzp2QfSdv8/kjxPkz2x4+Ixr2R3a3s=; b=AVAUHZnsxg8XFOxsoI3/kKUQu
	nZIRLskIJpWXdQzhLFw18OVHagixN0yylGrLEFCXMv4oHzPOXLiGNk6nzVQRtC/XE3i0G2PfI+xm7
	H1HE4oJjixFbppE5t8JRiaJh4llVpE/F1oXtC309XW/oqQsVczZoChyZctQyoXBN9SVAtNmyKo/WD
	kKiEHz8YhFSeqcqN48zAF9C90lJRUy/RhK8IVPi7hDSIQOJlRU+/KTFiu2BwtRzuOfmRCJog+GV/0
	uJntd+3bTvmR+/BvP0FQb2hkcg3O9MW8ABVGR9lve/1Rly3UmjO26LoRAbenp3b6wH6qr/geg72pw
	4kh0WOx4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7KnX-0000Bn-An; Wed, 03 Feb 2021 16:14:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7KnP-000086-5V; Wed, 03 Feb 2021 16:14:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0702964FA0;
 Wed,  3 Feb 2021 16:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612368862;
 bh=2j6xZSHse5/vWFXEbPe4Tom1Lq44aH5uvDph6suuG9Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=l5eB50zhryrOtBzXUW4scEBTe3aL/wjCcAr3ZHeix2pDpBwHvyIdhKzAHYqizqW/f
 cZZlF+21YEl11theaYsOla92ULA6yJaldSFRJXnouRkR9ELCAIye+bpA+IZhMZSYzl
 AFrXy8OoCBCoytoRagyXbcBK3m6Z07Ixok+byyHFWipc/LUoCv6XIGsWnPi/yzVuvP
 KrmhjwyFCDahkNgsU8XpBuM7MZvc9WiAq6zeICb88KPSI9AF9CVn3cMNuQttJOEeVv
 IIQAGuoDKh6oYi60+ZvZqrexCklSHSHqsNUS7du+rjc7gUYTQioqxxT+Ln0CUXGCWb
 XqMvIut628ojA==
Received: by mail-ej1-f47.google.com with SMTP id bl23so36680158ejb.5;
 Wed, 03 Feb 2021 08:14:21 -0800 (PST)
X-Gm-Message-State: AOAM531BgoWPfWjgv2T5TkToJwPZYWKCGxedTvsRk8lHt489vkAWK54J
 U4S310DPVbwt4lfh+YETzPVQ226wyZOFTY8few==
X-Google-Smtp-Source: ABdhPJzUxapZjf0CiPgsCzLt+/mcXdK/9Nl57HTN8izsI5mwQlW+19VCPpmaJdV//kMXcO7RI7pnsxaDbEcORWo4gG0=
X-Received: by 2002:a17:906:a106:: with SMTP id
 t6mr3931340ejy.63.1612368860432; 
 Wed, 03 Feb 2021 08:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20210202081237.774442-1-hsinyi@chromium.org>
 <20210202081237.774442-7-hsinyi@chromium.org>
In-Reply-To: <20210202081237.774442-7-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 4 Feb 2021 00:14:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9pHX7nGc6hNjtoVcsjnzRbxF0eFPfBUXKrtxZ=A0HVtQ@mail.gmail.com>
Message-ID: <CAAOTY_9pHX7nGc6hNjtoVcsjnzRbxF0eFPfBUXKrtxZ=A0HVtQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/8] drm/mediatek: add matrix_bits private data for
 ccorr
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_111423_377311_25D7C087 
X-CRM114-Status: GOOD (  23.56  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0MuaciDLml6Ug6YCx5LqMIOS4i+WNiDQ6MTTlr6vpgZPvvJoKPgo+IEZyb206IFlvbmdxaWFu
ZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+Cj4gQWRkIG1hdHJpeF9iaXRzIGFu
ZCBjb2VmZnNfcHJlY2lzaW9uIHRvIGNjb3JyIHByaXZhdGUgZGF0YToKPiAtIG1hdHJpeCBiaXRz
IG9mIG10ODE4MyBpcyAxMAo+IC0gbWF0cml4IGJpdHMgb2YgbXQ4MTkyIGlzIDExCgpBcHBsaWVk
IHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9n
Lz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFNpZ25lZC1v
ZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Njb3JyLmMgfCAyNyArKysrKysrKysrKysr
Ky0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNw
X2Njb3JyLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYwo+IGlu
ZGV4IDZjODY2NzNhODM1YzMuLjE0MWNiMzZiOWMwN2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kaXNwX2Njb3JyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYwo+IEBAIC0zMCw3ICszMCw3IEBACj4gICNkZWZpbmUg
RElTUF9DQ09SUl9DT0VGXzQgICAgICAgICAgICAgICAgICAgICAgMHgwMDkwCj4KPiAgc3RydWN0
IG10a19kaXNwX2Njb3JyX2RhdGEgewo+IC0gICAgICAgdTMyIHJlc2VydmVkOwo+ICsgICAgICAg
dTMyIG1hdHJpeF9iaXRzOwo+ICB9Owo+Cj4gIC8qKgo+IEBAIC04NSwyMSArODUsMjIgQEAgdm9p
ZCBtdGtfY2NvcnJfc3RvcChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gICAgICAgICB3cml0ZWxfcmVs
YXhlZCgweDAsIGNjb3JyLT5yZWdzICsgRElTUF9DQ09SUl9FTik7Cj4gIH0KPgo+IC0vKiBDb252
ZXJ0cyBhIERSTSBTMzEuMzIgdmFsdWUgdG8gdGhlIEhXIFMxLjEwIGZvcm1hdC4gKi8KPiAtc3Rh
dGljIHUxNiBtdGtfY3RtX3MzMV8zMl90b19zMV8xMCh1NjQgaW4pCj4gKy8qIENvbnZlcnRzIGEg
RFJNIFMzMS4zMiB2YWx1ZSB0byB0aGUgSFcgUzEubiBmb3JtYXQuICovCj4gK3N0YXRpYyB1MTYg
bXRrX2N0bV9zMzFfMzJfdG9fczFfbih1NjQgaW4sIHUzMiBuKQo+ICB7Cj4gICAgICAgICB1MTYg
cjsKPgo+ICAgICAgICAgLyogU2lnbiBiaXQuICovCj4gLSAgICAgICByID0gaW4gJiBCSVRfVUxM
KDYzKSA/IEJJVCgxMSkgOiAwOwo+ICsgICAgICAgciA9IGluICYgQklUX1VMTCg2MykgPyBCSVQo
biArIDEpIDogMDsKPgo+ICAgICAgICAgaWYgKChpbiAmIEdFTk1BU0tfVUxMKDYyLCAzMykpID4g
MCkgewo+IC0gICAgICAgICAgICAgICAvKiBpZGVudGl0eSB2YWx1ZSAweDEwMDAwMDAwMCAtPiAw
eDQwMCwgKi8KPiArICAgICAgICAgICAgICAgLyogaWRlbnRpdHkgdmFsdWUgMHgxMDAwMDAwMDAg
LT4gMHg0MDAobXQ4MTgzKSwgKi8KPiArICAgICAgICAgICAgICAgLyogaWRlbnRpdHkgdmFsdWUg
MHgxMDAwMDAwMDAgLT4gMHg4MDAobXQ4MTkyKSwgKi8KPiAgICAgICAgICAgICAgICAgLyogaWYg
YmlnZ2VyIHRoaXMsIHNldCBpdCB0byBtYXggMHg3ZmYuICovCj4gLSAgICAgICAgICAgICAgIHIg
fD0gR0VOTUFTSygxMCwgMCk7Cj4gKyAgICAgICAgICAgICAgIHIgfD0gR0VOTUFTSyhuLCAwKTsK
PiAgICAgICAgIH0gZWxzZSB7Cj4gLSAgICAgICAgICAgICAgIC8qIHRha2UgdGhlIDExIG1vc3Qg
aW1wb3J0YW50IGJpdHMuICovCj4gLSAgICAgICAgICAgICAgIHIgfD0gKGluID4+IDIyKSAmIEdF
Tk1BU0soMTAsIDApOwo+ICsgICAgICAgICAgICAgICAvKiB0YWtlIHRoZSBuKzEgbW9zdCBpbXBv
cnRhbnQgYml0cy4gKi8KPiArICAgICAgICAgICAgICAgciB8PSAoaW4gPj4gKDMyIC0gbikpICYg
R0VOTUFTSyhuLCAwKTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0dXJuIHI7Cj4gQEAgLTEx
NCw2ICsxMTUsNyBAQCB2b2lkIG10a19jY29ycl9jdG1fc2V0KHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRybV9jcnRjX3N0YXRlICpzdGF0ZSkKPiAgICAgICAgIHVpbnQxNl90IGNvZWZmc1s5
XSA9IHsgMCB9Owo+ICAgICAgICAgaW50IGk7Cj4gICAgICAgICBzdHJ1Y3QgY21kcV9wa3QgKmNt
ZHFfcGt0ID0gTlVMTDsKPiArICAgICAgIHUzMiBtYXRyaXhfYml0cyA9IGNjb3JyLT5kYXRhLT5t
YXRyaXhfYml0czsKPgo+ICAgICAgICAgaWYgKCFibG9iKQo+ICAgICAgICAgICAgICAgICByZXR1
cm47Cj4gQEAgLTEyMiw3ICsxMjQsNyBAQCB2b2lkIG10a19jY29ycl9jdG1fc2V0KHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGRybV9jcnRjX3N0YXRlICpzdGF0ZSkKPiAgICAgICAgIGlucHV0
ID0gY3RtLT5tYXRyaXg7Cj4KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGNv
ZWZmcyk7IGkrKykKPiAtICAgICAgICAgICAgICAgY29lZmZzW2ldID0gbXRrX2N0bV9zMzFfMzJf
dG9fczFfMTAoaW5wdXRbaV0pOwo+ICsgICAgICAgICAgICAgICBjb2VmZnNbaV0gPSBtdGtfY3Rt
X3MzMV8zMl90b19zMV9uKGlucHV0W2ldLCBtYXRyaXhfYml0cyk7Cj4KPiAgICAgICAgIG10a19k
ZHBfd3JpdGUoY21kcV9wa3QsIGNvZWZmc1swXSA8PCAxNiB8IGNvZWZmc1sxXSwKPiAgICAgICAg
ICAgICAgICAgICAgICAgJmNjb3JyLT5jbWRxX3JlZywgY2NvcnItPnJlZ3MsIERJU1BfQ0NPUlJf
Q09FRl8wKTsKPiBAQCAtMTk5LDggKzIwMSwxMyBAQCBzdGF0aWMgaW50IG10a19kaXNwX2Njb3Jy
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgcmV0dXJuIDA7
Cj4gIH0KPgo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kaXNwX2Njb3JyX2RhdGEgbXQ4MTgz
X2Njb3JyX2RyaXZlcl9kYXRhID0gewo+ICsgICAgICAgLm1hdHJpeF9iaXRzID0gMTAsCj4gK307
Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfZGlzcF9jY29ycl9k
cml2ZXJfZHRfbWF0Y2hbXSA9IHsKPiAtICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ4MTgzLWRpc3AtY2NvcnIifSwKPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ4MTgzLWRpc3AtY2NvcnIiLAo+ICsgICAgICAgICAuZGF0YSA9ICZtdDgxODNfY2NvcnJfZHJp
dmVyX2RhdGF9LAo+ICAgICAgICAge30sCj4gIH07Cj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2Ys
IG10a19kaXNwX2Njb3JyX2RyaXZlcl9kdF9tYXRjaCk7Cj4gLS0KPiAyLjMwLjAuMzY1LmcwMmJj
NjkzNzg5LWdvb2cKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
