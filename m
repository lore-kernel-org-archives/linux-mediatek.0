Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A103C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 23:17:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE71C610A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 23:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE71C610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yyr0RLLzDQte6HMyTVu6ZxRmF3t/NvJV9x6kO5w2oRU=; b=AHl1qksRPlgtDZ
	bsKAL4vpDlfQR5cFneWmDEouM/5+zWycb5I2KDJ8HaejFp58wU1WeC8TYJwUP3ekgQuDp5g7M/cHe
	En1cUHV1Stc+PRKJOFQpZBKGjzSrQRR0S9HhyXKfUNwu+9ZgfGzTjCtnP2r4ju/PjC1U/u18sRZ8J
	NSiuy9NzeG0PwkyBamtk+3mwwsDvyU2+lX1mTRBug3PNFYK2nedCAWXravxXl427pJvaUqdEfHXc8
	yfIUD9o7wNyT6U53ZbKypwRuKNdUfzv9pjRtQE7Ta1Iwsukf+IapODhH2+yWqjIuxYe6okidlpzT9
	tyNKDKxmdeNF3CbtrC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGrHM-009iYK-G1; Thu, 19 Aug 2021 23:16:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGrH9-009iW6-4k; Thu, 19 Aug 2021 23:16:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6545610F9;
 Thu, 19 Aug 2021 23:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629415002;
 bh=2Lj244WKGUB4MSdJLJfXazrcUCUjjSVPIDLHmUWcpz0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fUISZGzZm1OrNaJebCpyYQrsGrK2/UbC8CkeAP7guZCmBDAvGpswTPfrzSRNsLCjb
 SBIfctSBuQfhEUGf/1UKh+1Eyd1zBfy5/UdfV6wbODaqrW29g4nW86WlFkl+jZ514H
 /dVE49IqO0F2oik9pMZsCszK78zLh1hmaUKmMMYy85Uwa1kANPTuhuQ6ZCj+tI60Zp
 QN2B66nNDAhEjaqGIUqx3t4udtcDUjnWzKT1QTco9h0t5SUyv7ephz4YwFnqHOmRGl
 /kEKNxWdIljlzRNxWYK42vgEMqALpmSLl5FvzT+n6AeF8dQHAtHD5OjwXRQoy/Samt
 cCFu8YczWiMxg==
Received: by mail-ed1-f49.google.com with SMTP id i22so11151135edq.11;
 Thu, 19 Aug 2021 16:16:42 -0700 (PDT)
X-Gm-Message-State: AOAM531ry81lB7nRWAvtO/Tk6DBF6/tUEgJBkJCf6Z/lV+8GZnS40Ir+
 Me6okqmOPiQqi64uDSfDJJI5IGLXu22K339CUQ==
X-Google-Smtp-Source: ABdhPJzNYtXo0ULhFJoiUEj/oNDxJJ3Fug01+MKAXpf6Dyomm5yC11RaaXt5vx+T2Q2toxTwvqiUn37Ln4HDwYSceew=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr19104557edt.219.1629415001407; 
 Thu, 19 Aug 2021 16:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-12-jason-jh.lin@mediatek.com>
In-Reply-To: <20210819022327.13040-12-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 20 Aug 2021 07:16:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY__jThQhfAyvTxwF16fsS4CHmsuqY0GmdBBESNxhvpDzRg@mail.gmail.com>
Message-ID: <CAAOTY__jThQhfAyvTxwF16fsS4CHmsuqY0GmdBBESNxhvpDzRg@mail.gmail.com>
Subject: Re: [PATCH v8 11/13] drm/mediatek: add DSC support for mediatek-drm
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 singo.chang@mediatek.com, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_161643_267508_734F6F55 
X-CRM114-Status: GOOD (  19.04  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDjmnIgxOeaXpSDpgLHlm5sg5LiK5Y2IMTA6MjPlr6vpgZPvvJoKPgo+IERTQyBpcyBk
ZXNpZ25lZCBmb3IgcmVhbC10aW1lIHN5c3RlbXMgd2l0aCByZWFsLXRpbWUgY29tcHJlc3Npb24s
Cj4gdHJhbnNtaXNzaW9uLCBkZWNvbXByZXNzaW9uIGFuZCBkaXNwbGF5Lgo+IFRoZSBEU0Mgc3Rh
bmRhcmQgaXMgYSBzcGVjaWZpY2F0aW9uIG9mIHRoZSBhbGdvcml0aG1zIHVzZWQgZm9yCj4gY29t
cHJlc3NpbmcgYW5kIGRlY29tcHJlc3NpbmcgaW1hZ2UgZGlzcGxheSBzdHJlYW1zLCBpbmNsdWRp
bmcKPiB0aGUgc3BlY2lmaWNhdGlvbiBvZiB0aGUgc3ludGF4IGFuZCBzZW1hbnRpY3Mgb2YgdGhl
IGNvbXByZXNzZWQKPiB2aWRlbyBiaXQgc3RyZWFtLgo+CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpo
LmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKwo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5oIHwgIDEgKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IGluZGV4IDI4YmM0MmZkMGI4YS4uOTI5NjMwYTZk
ODMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5j
Cj4gQEAgLTQ1LDYgKzQ1LDEyIEBACj4gICNkZWZpbmUgRElUSEVSX0xTQl9FUlJfU0hJRlRfRyh4
KSAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDEyKQo+ICAjZGVmaW5lIERJVEhFUl9BRERf
TFNISUZUX0coeCkgICAgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCA0KQo+Cj4gKyNkZWZp
bmUgRElTUF9SRUdfRFNDX0NPTiAgICAgICAgICAgICAgICAgICAgICAgMHgwMDAwCj4gKyNkZWZp
bmUgRFNDX0VOICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDApCj4gKyNkZWZp
bmUgRFNDX0RVQUxfSU5PVVQgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDIpCj4gKyNkZWZp
bmUgRFNDX0JZUEFTUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDQpCj4gKyNkZWZp
bmUgRFNDX1VGT0VfU0VMICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDE2KQo+ICsKPiAg
I2RlZmluZSBESVNQX1JFR19PRF9FTiAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMDAKPiAg
I2RlZmluZSBESVNQX1JFR19PRF9DRkcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4
MDAyMAo+ICAjZGVmaW5lIE9EX1JFTEFZTU9ERSAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJ
VCgwKQo+IEBAIC0yMTEsNiArMjE3LDM1IEBAIHN0YXRpYyB2b2lkIG10a19kaXRoZXJfc2V0KHN0
cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQgaW50IGJwYywKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBESVNQX0RJVEhFUklORywgY21kcV9wa3QpOwo+ICB9Cj4KPiArc3RhdGljIHZv
aWQgbXRrX2RzY19jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgdywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50IHZy
ZWZyZXNoLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBicGMsIHN0
cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpCj4gK3sKPiArICAgICAgIHN0cnVjdCBtdGtfZGRwX2Nv
bXBfZGV2ICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gKwo+ICsgICAgICAgLyogZHNj
IGJ5cGFzcyBtb2RlICovCj4gKyAgICAgICBtdGtfZGRwX3dyaXRlX21hc2soY21kcV9wa3QsIERT
Q19CWVBBU1MsICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICBESVNQX1JFR19EU0NfQ09OLCBEU0NfQllQQVNTKTsKPiArICAgICAgIG10a19k
ZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgRFNDX1VGT0VfU0VMLCAmcHJpdi0+Y21kcV9yZWcsIHBy
aXYtPnJlZ3MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgRElTUF9SRUdfRFNDX0NPTiwg
RFNDX1VGT0VfU0VMKTsKPiArICAgICAgIG10a19kZHBfd3JpdGVfbWFzayhjbWRxX3BrdCwgRFND
X0RVQUxfSU5PVVQsICZwcml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICBESVNQX1JFR19EU0NfQ09OLCBEU0NfRFVBTF9JTk9VVCk7Cj4gK30KPiAr
Cj4gK3N0YXRpYyB2b2lkIG10a19kc2Nfc3RhcnQoc3RydWN0IGRldmljZSAqZGV2KQo+ICt7Cj4g
KyAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wX2RldiAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOwo+ICsKPiArICAgICAgIHdyaXRlbF9yZWxheGVkKERTQ19FTiwgJnByaXYtPnJlZ3MgKyBE
SVNQX1JFR19EU0NfQ09OKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbXRrX2RzY19zdG9wKHN0
cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsgICAgICAgc3RydWN0IG10a19kZHBfY29tcF9kZXYg
KnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiArCj4gKyAgICAgICB3cml0ZWxfcmVsYXhl
ZCgweDAsIHByaXYtPnJlZ3MgKyBESVNQX1JFR19EU0NfQ09OKTsKPiArfQo+ICsKPiAgc3RhdGlj
IHZvaWQgbXRrX29kX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCB3LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGgsIHVuc2lnbmVkIGludCB2
cmVmcmVzaCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBicGMsIHN0
cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpCj4gQEAgLTI3NCw2ICszMDksMTQgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3MgZGRwX2RwaSA9IHsKPiAgICAgICAgIC5zdG9w
ID0gbXRrX2RwaV9zdG9wLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RkcF9j
b21wX2Z1bmNzIGRkcF9kc2MgPSB7Cj4gKyAgICAgICAuY2xrX2VuYWJsZSA9IG10a19kZHBfY2xr
X2VuYWJsZSwKPiArICAgICAgIC5jbGtfZGlzYWJsZSA9IG10a19kZHBfY2xrX2Rpc2FibGUsCj4g
KyAgICAgICAuY29uZmlnID0gbXRrX2RzY19jb25maWcsCj4gKyAgICAgICAuc3RhcnQgPSBtdGtf
ZHNjX3N0YXJ0LAo+ICsgICAgICAgLnN0b3AgPSBtdGtfZHNjX3N0b3AsCj4gK307Cj4gKwo+ICBz
dGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyBkZHBfZHNpID0gewo+ICAgICAg
ICAgLnN0YXJ0ID0gbXRrX2RzaV9kZHBfc3RhcnQsCj4gICAgICAgICAuc3RvcCA9IG10a19kc2lf
ZGRwX3N0b3AsCj4gQEAgLTMzNSw2ICszNzgsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0
IG10a19kZHBfY29tcF9zdGVtW01US19ERFBfQ09NUF9UWVBFX01BWF0gPSB7Cj4gICAgICAgICBb
TVRLX0RJU1BfQ0NPUlJdID0gImNjb3JyIiwKPiAgICAgICAgIFtNVEtfRElTUF9DT0xPUl0gPSAi
Y29sb3IiLAo+ICAgICAgICAgW01US19ESVNQX0RJVEhFUl0gPSAiZGl0aGVyIiwKPiArICAgICAg
IFtNVEtfRElTUF9EU0NdID0gImRzYyIsCj4gICAgICAgICBbTVRLX0RJU1BfR0FNTUFdID0gImdh
bW1hIiwKPiAgICAgICAgIFtNVEtfRElTUF9NVVRFWF0gPSAibXV0ZXgiLAo+ICAgICAgICAgW01U
S19ESVNQX09EXSA9ICJvZCIsCj4gQEAgLTM2NCw2ICs0MDgsOCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG10a19kZHBfY29tcF9tYXRjaCBtdGtfZGRwX21hdGNoZXNbRERQX0NPTVBPTkVOVF9JRF9N
QVhdID0gewo+ICAgICAgICAgW0REUF9DT01QT05FTlRfRElUSEVSXSAgPSB7IE1US19ESVNQX0RJ
VEhFUiwgICAgMCwgJmRkcF9kaXRoZXIgfSwKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX0RQSTBd
ICAgID0geyBNVEtfRFBJLCAgICAgICAgICAgIDAsICZkZHBfZHBpIH0sCj4gICAgICAgICBbRERQ
X0NPTVBPTkVOVF9EUEkxXSAgICA9IHsgTVRLX0RQSSwgICAgICAgICAgICAxLCAmZGRwX2RwaSB9
LAo+ICsgICAgICAgW0REUF9DT01QT05FTlRfRFNDMF0gICAgPSB7IE1US19ESVNQX0RTQywgICAg
ICAgMCwgJmRkcF9kc2MgfSwKPiArICAgICAgIFtERFBfQ09NUE9ORU5UX0RTQzFdICAgID0geyBN
VEtfRElTUF9EU0MsICAgICAgIDEsICZkZHBfZHNjIH0sCj4gICAgICAgICBbRERQX0NPTVBPTkVO
VF9EU0kwXSAgICA9IHsgTVRLX0RTSSwgICAgICAgICAgICAwLCAmZGRwX2RzaSB9LAo+ICAgICAg
ICAgW0REUF9DT01QT05FTlRfRFNJMV0gICAgPSB7IE1US19EU0ksICAgICAgICAgICAgMSwgJmRk
cF9kc2kgfSwKPiAgICAgICAgIFtERFBfQ09NUE9ORU5UX0RTSTJdICAgID0geyBNVEtfRFNJLCAg
ICAgICAgICAgIDIsICZkZHBfZHNpIH0sCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmggYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5oCj4gaW5kZXggZDMxN2I5NDRkZjY2Li41NjBiZTZiYzlkMGUgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgKPiBAQCAtMjMs
NiArMjMsNyBAQCBlbnVtIG10a19kZHBfY29tcF90eXBlIHsKPiAgICAgICAgIE1US19ESVNQX0ND
T1JSLAo+ICAgICAgICAgTVRLX0RJU1BfQ09MT1IsCj4gICAgICAgICBNVEtfRElTUF9ESVRIRVIs
Cj4gKyAgICAgICBNVEtfRElTUF9EU0MsCj4gICAgICAgICBNVEtfRElTUF9HQU1NQSwKPiAgICAg
ICAgIE1US19ESVNQX01VVEVYLAo+ICAgICAgICAgTVRLX0RJU1BfT0QsCj4gLS0KPiAyLjE4LjAK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
