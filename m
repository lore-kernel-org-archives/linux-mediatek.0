Return-Path: <SRS0=BNI/=IS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E26C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Mar 2021 07:07:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06346199B
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Mar 2021 07:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06346199B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o5aGJs9+jyF7FN3QPzr5fJVAx27cS1BnVGpj7+SMh4I=; b=GP9iWdaiBlTRRIEFW5KO19OAx
	98wpKPVBeHkXthXI1p+KDg3UMaQ0jzOeHGoro+mxs3+AdbeKVLhn1qvuwOqwn2DpAFgKbgMek+zNn
	FNTXazlrLvvCAuRRB8ROxJE6xXbg6GfVZONbu+OSBYry6ehGJbVX8eSExTcNW2jckH8siRAs9L3Ag
	kodNlNipgFKeYr0skiNTVK/U686WxUuNrdRDK64T+g+UY+tbzWHsukkLFPBAu09rj0eQdLkDDPEzh
	7Si/2tK9Poh3+ligbJ3yxy++wnCGmOx6yimK5GKWn6bFuiApwlaKAOQyKyhCApt3VE0wZVWvyAE2F
	e9++CETFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNVhB-008bpH-G0; Sat, 20 Mar 2021 07:06:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNVgy-008bo1-P0; Sat, 20 Mar 2021 07:06:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A359561998;
 Sat, 20 Mar 2021 07:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616223987;
 bh=JN7rk5whuNrffpk2EuJ5Ntk74ce7HEE/syfRYOG7JDE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p9J+TixYXCbmMzVgV1xyU4FU5Psvt5j6i5wBNlJEWeObcLJwHegdY0E9SBxjpPEgx
 b2XdrIqYX+jYREHZ4lr7H6UwRO90TLMqSMCPTRpL5uKdzeHk+W1hwGzXQBChAYlEnC
 2eP9TYeFVaWtOfqcJx7Xw+Q8XmN5FP7MCEwumqR6r48qJaajDviLxuvrhmi+/fT3Py
 +II7PC/RWhTeWNJDFzY/ivFvkvG+sRCfBDWjRNS5jajKw58LNjigvkKdL4aR0XSCe4
 luX8tgjP+5Q+tsYeW4x4//yBq1U2Ri7CgvCS17j9Arn1ne/3i4n5Q5JMSH14eeUXjC
 F+HIK5f6w0sig==
Received: by mail-wr1-f45.google.com with SMTP id v4so11277996wrp.13;
 Sat, 20 Mar 2021 00:06:27 -0700 (PDT)
X-Gm-Message-State: AOAM5301/GavklpMLeuK5pfvqKfap5/iQGfKwVtLaAt+VHeJhGPu5Wzg
 77gdtJsQNbpoHb4GXgihMir0JMDLQ7b87MLx6A==
X-Google-Smtp-Source: ABdhPJzXUrqVy5h4sptnKXZVkSNgwo3z2RQgkTfp9fR4QtfZMZ8R2akBBZGTFtFYE3KwRyAbN9hhk2+W2QTOaLxW65Q=
X-Received: by 2002:a5d:664e:: with SMTP id f14mr1233975wrw.382.1616223986312; 
 Sat, 20 Mar 2021 00:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <1616046056-29068-1-git-send-email-rex-bc.chen@mediatek.com>
 <1616046056-29068-2-git-send-email-rex-bc.chen@mediatek.com>
 <CAFqH_51qkjtRRS8yjiRXQhN7Hvn-rG34ieKxKnKmreJrOJVUow@mail.gmail.com>
In-Reply-To: <CAFqH_51qkjtRRS8yjiRXQhN7Hvn-rG34ieKxKnKmreJrOJVUow@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 20 Mar 2021 15:06:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9aXzjgvrafdrGDESNBtpjGGJoefBTSpX_0irP4sXyTLg@mail.gmail.com>
Message-ID: <CAAOTY_9aXzjgvrafdrGDESNBtpjGGJoefBTSpX_0irP4sXyTLg@mail.gmail.com>
Subject: Re: [v5, 1/2] drm/mediatek: mtk_dpi: Add check for max clock rate in
 mode_valid
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Pi-Hsun Shih <pihsun@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210320_070637_358039_577C7322 
X-CRM114-Status: GOOD (  21.09  )
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

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gU2VycmEgPGViYWxsZXRib0BnbWFpbC5jb20+IOaW
vCAyMDIx5bm0M+aciDE45pelIOmAseWbmyDkuIvljYgxMDoyNeWvq+mBk++8mgo+Cj4gSGkgUmV4
LUJDIENoZW4sCj4KPiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guCj4KPiBNaXNzYXRnZSBkZSBS
ZXgtQkMgQ2hlbiA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsuY29tPiBkZWwgZGlhIGRqLiwgMTggZGUK
PiBtYXLDpyAyMDIxIGEgbGVzIDY6NDI6Cj4gPgo+ID4gQWRkIHBlci1wbGF0Zm9ybSBtYXggY2xv
Y2sgcmF0ZSBjaGVjayBpbiBtdGtfZHBpX2JyaWRnZV9tb2RlX3ZhbGlkLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBpLUhzdW4gU2hpaCA8cGloc3VuQGNocm9taXVtLm9yZz4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgMTggKysrKysrKysrKysrKysrKysr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMKPiA+IGluZGV4IGIwNWY5MDBkOTMyMi4uMGI0MjdhZDBjZDliIDEw
MDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ID4gQEAgLTEyMCw2ICsxMjAs
NyBAQCBzdHJ1Y3QgbXRrX2RwaV95Y19saW1pdCB7Cj4gPiAgc3RydWN0IG10a19kcGlfY29uZiB7
Cj4gPiAgICAgICAgIHVuc2lnbmVkIGludCAoKmNhbF9mYWN0b3IpKGludCBjbG9jayk7Cj4gPiAg
ICAgICAgIHUzMiByZWdfaF9mcmVfY29uOwo+ID4gKyAgICAgICB1MzIgbWF4X2Nsb2NrX2toejsK
PiA+ICAgICAgICAgYm9vbCBlZGdlX3NlbF9lbjsKPiA+ICB9Owo+ID4KPiA+IEBAIC01NTcsOSAr
NTU4LDIzIEBAIHN0YXRpYyB2b2lkIG10a19kcGlfYnJpZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2Jy
aWRnZSAqYnJpZGdlKQo+ID4gICAgICAgICBtdGtfZHBpX3NldF9kaXNwbGF5X21vZGUoZHBpLCAm
ZHBpLT5tb2RlKTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBlbnVtIGRybV9tb2RlX3N0YXR1cwo+
ID4gK210a19kcGlfYnJpZGdlX21vZGVfdmFsaWQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X2lu
Zm8gKmluZm8sCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlKQo+ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IG10a19kcGkgKmRw
aSA9IGJyaWRnZV90b19kcGkoYnJpZGdlKTsKPiA+ICsKPiA+ICsgICAgICAgaWYgKGRwaS0+Y29u
Zi0+bWF4X2Nsb2NrX2toeiAmJiBtb2RlLT5jbG9jayA+IGRwaS0+Y29uZi0+bWF4X2Nsb2NrX2to
eikKPgo+IE1heWJlIEkgcmVhZCB0aGlzIHBhdGNoIHRvbyBmYXN0LCBidXQgd2h5IHRoZSAmJj8g
U2hvdWxkbid0IGJlIG1vcmUKPiBzaW1wbGUgYW5kIHJlYWRhYmxlCj4KPiAgICAgICAgICAgaWYg
KG1vZGUtPmNsb2NrID4gbWF4X2Nsb2NrKQo+CgpBZ3JlZS4gU28gSSBtb2RpZnkgaW4gbWVkaWF0
ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0
ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IFRoYW5rcywKPiAgIEVucmljCj4K
Pgo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0NMT0NLX0hJR0g7Cj4gPiArCj4gPiAr
ICAgICAgIHJldHVybiBNT0RFX09LOwo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9icmlkZ2VfZnVuY3MgbXRrX2RwaV9icmlkZ2VfZnVuY3MgPSB7Cj4gPiAgICAgICAg
IC5hdHRhY2ggPSBtdGtfZHBpX2JyaWRnZV9hdHRhY2gsCj4gPiAgICAgICAgIC5tb2RlX3NldCA9
IG10a19kcGlfYnJpZGdlX21vZGVfc2V0LAo+ID4gKyAgICAgICAubW9kZV92YWxpZCA9IG10a19k
cGlfYnJpZGdlX21vZGVfdmFsaWQsCj4gPiAgICAgICAgIC5kaXNhYmxlID0gbXRrX2RwaV9icmlk
Z2VfZGlzYWJsZSwKPiA+ICAgICAgICAgLmVuYWJsZSA9IG10a19kcGlfYnJpZGdlX2VuYWJsZSwK
PiA+ICB9Owo+ID4gQEAgLTY2OCwxNyArNjgzLDIwIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXQ4
MTgzX2NhbGN1bGF0ZV9mYWN0b3IoaW50IGNsb2NrKQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXRrX2RwaV9jb25mIG10ODE3M19jb25mID0gewo+ID4gICAgICAgICAuY2FsX2ZhY3RvciA9IG10
ODE3M19jYWxjdWxhdGVfZmFjdG9yLAo+ID4gICAgICAgICAucmVnX2hfZnJlX2NvbiA9IDB4ZTAs
Cj4gPiArICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMzAwMDAwLAo+ID4gIH07Cj4gPgo+ID4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10MjcwMV9jb25mID0gewo+ID4gICAgICAg
ICAuY2FsX2ZhY3RvciA9IG10MjcwMV9jYWxjdWxhdGVfZmFjdG9yLAo+ID4gICAgICAgICAucmVn
X2hfZnJlX2NvbiA9IDB4YjAsCj4gPiAgICAgICAgIC5lZGdlX3NlbF9lbiA9IHRydWUsCj4gPiAr
ICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTUwMDAwLAo+ID4gIH07Cj4gPgo+ID4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE4M19jb25mID0gewo+ID4gICAgICAgICAuY2Fs
X2ZhY3RvciA9IG10ODE4M19jYWxjdWxhdGVfZmFjdG9yLAo+ID4gICAgICAgICAucmVnX2hfZnJl
X2NvbiA9IDB4ZTAsCj4gPiArICAgICAgIC5tYXhfY2xvY2tfa2h6ID0gMTAwMDAwLAo+ID4gIH07
Cj4gPgo+ID4gIHN0YXRpYyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+ID4gLS0KPiA+IDIuMTguMAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+ID4g
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
