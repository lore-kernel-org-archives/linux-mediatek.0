Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C220CC433E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 23:25:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D2A1206EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 23:25:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uk0AwS77";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIZBc67K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D2A1206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9zYUL0nAz3Eu+cDUvDA0fpDn/WXGpcs3ujo7uDonqeY=; b=Uk0AwS77VdRTqoqCHs8V1KEcB
	TfR37zhKt70404kow55ydBPYolgB9yQEqMECT4KVT5r5WdyD24+AOyprXfPX9CeqCI2ZD4uK0rKNi
	hCs4dxKHKTxVjCo4mk/kv8rYNSugEv+Ob57d7otz+MNtrAvz4Jpek+x/FYlNGXyIVdvBmaC29hRFz
	+lekqcqx/A7KNVfDmeG0NVs0bICgG8mtkIyMn3ZZFcUPdCI29AKDaOVacNwr7QzNQnWxMO0Mj5yhp
	/i3rlYNzTjEsTHo5ONbO7hluniUcDPoXTBAXbCtwEBn3WgF3h2DI15EpQRkSuQA8nmPg4fURK/y9w
	raRQcV4ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jz73d-0006An-GC; Fri, 24 Jul 2020 23:24:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jz73Z-00069Q-BZ; Fri, 24 Jul 2020 23:24:50 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6029F2070E;
 Fri, 24 Jul 2020 23:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595633087;
 bh=Xq0D/3Ahn9nc9K3oRf4KbLNgsT57WhGyF47ymke7J1I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MIZBc67KRjS8ZLworVZFG+SYVi3xl9mvfo5oYUoKFTMujoPdru9o7MwwdmH77Hz6A
 r5pXZ/CLYwX8cvPrWZWN7lvyEwy0pySxMxvV9jZ2MNAxDpeEp8dePxAQPFfKvZpyXI
 UqJ0ZiKUFF37FOK8uWzT5urNtwDON1Im4IGLQKVs=
Received: by mail-ej1-f50.google.com with SMTP id c10so3389901ejs.5;
 Fri, 24 Jul 2020 16:24:47 -0700 (PDT)
X-Gm-Message-State: AOAM533WW3A2LACGL8lDpz3TNVP7hpUOWxt8rvnniutwMlF5f2CyVzY9
 naK8wG8/6F/R6K31Ln8HsOft8oOO01ed8tYqTA==
X-Google-Smtp-Source: ABdhPJwfhfPDr4sa3JCxhKDCTo0pXvPswGrmNiVpCVyLZxB4s1571M0BK+9I9DpZATfRGeAEvIM+EI8OA/dtKifFn2Q=
X-Received: by 2002:a17:906:b888:: with SMTP id
 hb8mr11401027ejb.124.1595633085797; 
 Fri, 24 Jul 2020 16:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-8-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1595469798-3824-8-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 25 Jul 2020 07:24:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9hdvw7htuOkJmmmGR9SAev4O+kWuMopfP_F=8Vg=_U+A@mail.gmail.com>
Message-ID: <CAAOTY_9hdvw7htuOkJmmmGR9SAev4O+kWuMopfP_F=8Vg=_U+A@mail.gmail.com>
Subject: Re: [v7, PATCH 7/7] drm/mediatek: add support for mediatek SOC MT8183
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_192449_534518_518F4505 
X-CRM114-Status: GOOD (  19.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgWW9uZ3FpYW5nOgoKWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+
IOaWvCAyMDIw5bm0N+aciDIz5pelIOmAseWbmyDkuIrljYgxMDoxNeWvq+mBk++8mgo+Cj4gVGhp
cyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgbWVkaWF0ZWsgU09DIE1UODE4Mwo+IDEub3ZsXzJsIHNo
YXJlIGRyaXZlciB3aXRoIG92bAoKSSB0aGluayB0aGlzIGlzIGRvbmUgaW4gWzFdLCBbMl0sIFsz
XSwgdGhpcyBwYXRjaCBqdXN0IGFkZCB0aGUgc3VwcG9ydApvZiBtdDgxODMtb3ZsIGFuZCBtdDgx
ODMtb3ZsLTJsLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
P2g9djUuOC1yYzYmaWQ9MTMyYzZlMjUwZWQ3NDU0NDM5NzNjYWRhOGRiMTdjZGJhZWJkZjU1MQpb
Ml0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFs
ZHMvbGludXguZ2l0L2NvbW1pdC9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWs/aD12NS44LXJjNiZp
ZD0zMTg0NjJkMWE1Njg2MzRiYTA5MjYzY2M3MzBjYjBmYjFkNTZjMmIzClszXSBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
Y29tbWl0L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlaz9oPXY1LjgtcmM2JmlkPTU3MTQ4YmFhYzhi
Nzg0NjFlMzk0OTUzY2ZkNTMxN2JkZThmNzk1YWIKCj4gMi5yZG1hMSBzaGFyZSBkcml2ZSB3aXRo
IHJkbWEwLCBidXQgZmlmbyBzaXplIGlzIGRpZmZlcmVudAoKSSB0aGluayB0aGlzIGlzIGRvbmUg
aW4gWzRdLCB0aGlzIHBhdGNoIGp1c3QgYWRkIHRoZSBzdXBwb3J0IG9mIG10ODE4My1yZG1hLgoK
WzRdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE2Nzk1NDkvCgo+IDMuYWRk
IG10ODE4MyBtdXRleCBwcml2YXRlIGRhdGEsIGFuZCBtbXN5cyBwcml2YXRlIGRhdGEKPiA0LmFk
ZCBtdDgxODMgbWFpbiBhbmQgZXh0ZXJuYWwgcGF0aCBtb2R1bGUgZm9yIGNydGMgY3JlYXRlCgpU
aGUgZm91cnRoIGl0ZW0gaXMgdGhlIG1tc3lzIHByaXZhdGUgZGF0YSBpbiB0aGlyZCBpdGVtLCBz
byB5b3UgbmVlZApub3QgdG8gcmVwZWF0IGl0LgoKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFu
ZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgIHwgMTggKysrKysrKysrKysrCj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgfCAgNiArKysrCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jICAgfCA0NyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyAgIHwg
NDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxMTQg
aW5zZXJ0aW9ucygrKQo+Cgpbc25pcF0KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwLmMKPiBpbmRleCAwMTRjMWJiLi42MDc4OGMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZGRwLmMKPiBAQCAtMTUsNiArMTUsOCBAQAo+Cj4gICNkZWZpbmUgTVQyNzAx
X0RJU1BfTVVURVgwX01PRDAgICAgICAgICAgICAgICAgICAgICAgICAweDJjCj4gICNkZWZpbmUg
TVQyNzAxX0RJU1BfTVVURVgwX1NPRjAgICAgICAgICAgICAgICAgICAgICAgICAweDMwCj4gKyNk
ZWZpbmUgTVQ4MTgzX0RJU1BfTVVURVgwX01PRDAgICAgICAgICAgICAgICAgICAgICAgICAweDMw
Cj4gKyNkZWZpbmUgTVQ4MTgzX0RJU1BfTVVURVgwX1NPRjAgICAgICAgICAgICAgICAgICAgICAg
ICAweDJjCj4KPiAgI2RlZmluZSBESVNQX1JFR19NVVRFWF9FTihuKSAgICAgICAgICAgICAgICAg
ICAoMHgyMCArIDB4MjAgKiAobikpCj4gICNkZWZpbmUgRElTUF9SRUdfTVVURVgobikgICAgICAg
ICAgICAgICAgICAgICAgKDB4MjQgKyAweDIwICogKG4pKQo+IEBAIC0yNSw2ICsyNywxOCBAQAo+
Cj4gICNkZWZpbmUgSU5UX01VVEVYICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDEp
Cj4KPiArI2RlZmluZSBNVDgxODNfTVVURVhfTU9EX0RJU1BfUkRNQTAgICAgICAgICAgICAwCj4g
KyNkZWZpbmUgTVQ4MTgzX01VVEVYX01PRF9ESVNQX1JETUExICAgICAgICAgICAgMQo+ICsjZGVm
aW5lIE1UODE4M19NVVRFWF9NT0RfRElTUF9PVkwwICAgICAgICAgICAgIDkKPiArI2RlZmluZSBN
VDgxODNfTVVURVhfTU9EX0RJU1BfT1ZMMF8yTCAgICAgICAgICAxMAo+ICsjZGVmaW5lIE1UODE4
M19NVVRFWF9NT0RfRElTUF9PVkwxXzJMICAgICAgICAgIDExCj4gKyNkZWZpbmUgTVQ4MTgzX01V
VEVYX01PRF9ESVNQX1dETUEwICAgICAgICAgICAgMTIKPiArI2RlZmluZSBNVDgxODNfTVVURVhf
TU9EX0RJU1BfQ09MT1IwICAgICAgICAgICAxMwo+ICsjZGVmaW5lIE1UODE4M19NVVRFWF9NT0Rf
RElTUF9DQ09SUjAgICAgICAgICAgIDE0Cj4gKyNkZWZpbmUgTVQ4MTgzX01VVEVYX01PRF9ESVNQ
X0FBTDAgICAgICAgICAgICAgMTUKPiArI2RlZmluZSBNVDgxODNfTVVURVhfTU9EX0RJU1BfR0FN
TUEwICAgICAgICAgICAxNgo+ICsjZGVmaW5lIE1UODE4M19NVVRFWF9NT0RfRElTUF9ESVRIRVIw
ICAgICAgICAgIDE3Cj4gKwo+ICAjZGVmaW5lIE1UODE3M19NVVRFWF9NT0RfRElTUF9PVkwwICAg
ICAgICAgICAgIDExCj4gICNkZWZpbmUgTVQ4MTczX01VVEVYX01PRF9ESVNQX09WTDEgICAgICAg
ICAgICAgMTIKPiAgI2RlZmluZSBNVDgxNzNfTVVURVhfTU9EX0RJU1BfUkRNQTAgICAgICAgICAg
ICAxMwo+IEBAIC03NCw2ICs4OCwxMCBAQAo+ICAjZGVmaW5lIE1VVEVYX1NPRl9EU0kyICAgICAg
ICAgICAgICAgICA1Cj4gICNkZWZpbmUgTVVURVhfU09GX0RTSTMgICAgICAgICAgICAgICAgIDYK
Pgo+ICsjZGVmaW5lIE1UODE4M19NVVRFWF9TT0ZfRFBJMCAgICAgICAgICAgICAgICAgIDIKPiAr
I2RlZmluZSBNVDgxODNfTVVURVhfRU9GX0RTSTAgICAgICAgICAgICAgICAgICAoTVVURVhfU09G
X0RTSTAgPDwgNikKPiArI2RlZmluZSBNVDgxODNfTVVURVhfRU9GX0RQSTAgICAgICAgICAgICAg
ICAgICAoTVQ4MTgzX01VVEVYX1NPRl9EUEkwIDw8IDYpCj4gKwo+Cj4gIHN0cnVjdCBtdGtfZGlz
cF9tdXRleCB7Cj4gICAgICAgICBpbnQgaWQ7Cj4gQEAgLTE1Myw2ICsxNzEsMjAgQEAgc3RydWN0
IG10a19kZHAgewo+ICAgICAgICAgW0REUF9DT01QT05FTlRfV0RNQTFdID0gTVQ4MTczX01VVEVY
X01PRF9ESVNQX1dETUExLAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgbXQ4
MTgzX211dGV4X21vZFtERFBfQ09NUE9ORU5UX0lEX01BWF0gPSB7Cj4gKyAgICAgICBbRERQX0NP
TVBPTkVOVF9BQUwwXSA9IE1UODE4M19NVVRFWF9NT0RfRElTUF9BQUwwLAo+ICsgICAgICAgW0RE
UF9DT01QT05FTlRfQ0NPUlJdID0gTVQ4MTgzX01VVEVYX01PRF9ESVNQX0NDT1JSMCwKPiArICAg
ICAgIFtERFBfQ09NUE9ORU5UX0NPTE9SMF0gPSBNVDgxODNfTVVURVhfTU9EX0RJU1BfQ09MT1Iw
LAo+ICsgICAgICAgW0REUF9DT01QT05FTlRfRElUSEVSXSA9IE1UODE4M19NVVRFWF9NT0RfRElT
UF9ESVRIRVIwLAo+ICsgICAgICAgW0REUF9DT01QT05FTlRfR0FNTUFdID0gTVQ4MTgzX01VVEVY
X01PRF9ESVNQX0dBTU1BMCwKPiArICAgICAgIFtERFBfQ09NUE9ORU5UX09WTDBdID0gTVQ4MTgz
X01VVEVYX01PRF9ESVNQX09WTDAsCj4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9PVkxfMkwwXSA9
IE1UODE4M19NVVRFWF9NT0RfRElTUF9PVkwwXzJMLAo+ICsgICAgICAgW0REUF9DT01QT05FTlRf
T1ZMXzJMMV0gPSBNVDgxODNfTVVURVhfTU9EX0RJU1BfT1ZMMV8yTCwKPiArICAgICAgIFtERFBf
Q09NUE9ORU5UX1JETUEwXSA9IE1UODE4M19NVVRFWF9NT0RfRElTUF9SRE1BMCwKPiArICAgICAg
IFtERFBfQ09NUE9ORU5UX1JETUExXSA9IE1UODE4M19NVVRFWF9NT0RfRElTUF9SRE1BMSwKPiAr
ICAgICAgIFtERFBfQ09NUE9ORU5UX1dETUEwXSA9IE1UODE4M19NVVRFWF9NT0RfRElTUF9XRE1B
MCwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgbXQyNzEyX211dGV4X3Nv
ZltERFBfTVVURVhfU09GX0RTSTMgKyAxXSA9IHsKPiAgICAgICAgIFtERFBfTVVURVhfU09GX1NJ
TkdMRV9NT0RFXSA9IE1VVEVYX1NPRl9TSU5HTEVfTU9ERSwKPiAgICAgICAgIFtERFBfTVVURVhf
U09GX0RTSTBdID0gTVVURVhfU09GX0RTSTAsCj4gQEAgLTE2Myw2ICsxOTUsMTIgQEAgc3RydWN0
IG10a19kZHAgewo+ICAgICAgICAgW0REUF9NVVRFWF9TT0ZfRFNJM10gPSBNVVRFWF9TT0ZfRFNJ
MywKPiAgfTsKPgo+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IG10ODE4M19tdXRleF9zb2Zb
RERQX01VVEVYX1NPRl9EU0kzICsgMV0gPSB7Cj4gKyAgICAgICBbRERQX01VVEVYX1NPRl9TSU5H
TEVfTU9ERV0gPSBNVVRFWF9TT0ZfU0lOR0xFX01PREUsCj4gKyAgICAgICBbRERQX01VVEVYX1NP
Rl9EU0kwXSA9IE1VVEVYX1NPRl9EU0kwIHwgTVQ4MTgzX01VVEVYX0VPRl9EU0kwLAoKSSB0aGlu
ayB0aGlzIGFycmF5IGlzIGZvciAnc29mJywgc28geW91IHNob3VsZCBkcm9wIE1UODE4M19NVVRF
WF9FT0ZfRFNJMC4KCj4gKyAgICAgICBbRERQX01VVEVYX1NPRl9EUEkwXSA9IE1UODE4M19NVVRF
WF9TT0ZfRFBJMCB8IE1UODE4M19NVVRFWF9FT0ZfRFBJMCwKCkRpdHRvLgoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gK307Cj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZHBfZGF0YSBt
dDI3MDFfZGRwX2RyaXZlcl9kYXRhID0gewo+ICAgICAgICAgLm11dGV4X21vZCA9IG10MjcwMV9t
dXRleF9tb2QsCj4gICAgICAgICAubXV0ZXhfc29mID0gbXQyNzEyX211dGV4X3NvZiwKPiBAQCAt
MTg0LDYgKzIyMiwxMyBAQCBzdHJ1Y3QgbXRrX2RkcCB7Cj4gICAgICAgICAubXV0ZXhfc29mX3Jl
ZyA9IE1UMjcwMV9ESVNQX01VVEVYMF9TT0YwLAo+ICB9Owo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
