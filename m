Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8F0C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 23:43:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7361261052
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 23:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7361261052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tiz7fVEaU9vzMabPb9sQGJ9f0gAwZAS+qwn+VofE90o=; b=edmZ5o498DX/2w
	dpiBT8ndOLSnfP55HhSYqyATZjgZAfIty/mYcP1t9Oj7M+j05aaVMRaf85HNrc97axtCULBNDoLR3
	idGg/KZZTmG/kzi2U9HiVVF8YosvSDzfLJKpWkUhIFS+V4hKFchp6LqrgmpNMWKGoFZv+w68id3Aa
	/JMpQ5JYiYLCnEso+MmS5S2q3wrU3BGo5Ns89w3lRlVnkYJXFhLSSz65Moolqt6Lf9meOfIn8UKKC
	lzffBBzfYICcfuYO2ApwMf9uts/f0U8zJYRjc9KXcsGPGOPa0ZnLbvl5UaJa1zhQfdH6MY++448bk
	T+vus/6PLCyK397ON/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNOGH-0025RH-IP; Mon, 06 Sep 2021 23:42:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNOG4-0025Pm-66; Mon, 06 Sep 2021 23:42:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4332E610C8;
 Mon,  6 Sep 2021 23:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630971755;
 bh=cuA40y3WCNTC7CV2ya4Ol9astWJ3BZ/R1zc7YsJ6DPA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hpN7vQakMSneLWTFVH6kZZKK4AhSVRO7Ecnkyzi22rWZMdDaDmCfJGp/sGAJx/5As
 GgAx4SCnLhHUB6dkNnyfIeWiwzOpnnxSB+yfhC/rjf+eNWmNjjZUgTiqsHr0XkE9XJ
 jD1j6RtWUqfaj+e8PjnF9aO1SQyq58+mz0jAAgk3hrdU/scVgiUQXVvOK9lRITTFkw
 k6tRK8Fbc77Ea5I3UyrpIQhTfkar5lY9WhIXwjly72Qb6J9djnmFESFJWIl45tiA0j
 QmiMLSWfdh0BcIeGw41pCHaZ5lEGu+jZ/m2ZAn2p2y0y6WzPxko0VPwV78xk1BkLNk
 9xiptRB80UHvw==
Received: by mail-ed1-f54.google.com with SMTP id dm15so11343122edb.10;
 Mon, 06 Sep 2021 16:42:35 -0700 (PDT)
X-Gm-Message-State: AOAM531f6N9ry5ubK87aog9nJAshYj2GFBdjg8CiR0lT62cJ2Zte+YSA
 SBHgNyJq1Z2nlUfiBxFX8qlVwtAmprz+iU6FGg==
X-Google-Smtp-Source: ABdhPJw32cZWysU/gUon/jwslWOIEpz6VH6QFcrMYANk7op3saADxfLqzXBlOA7lAnpQU/NU929WdYzUfwR6UAj9wSE=
X-Received: by 2002:a05:6402:51c9:: with SMTP id
 r9mr15862686edd.65.1630971753787; 
 Mon, 06 Sep 2021 16:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-2-nancy.lin@mediatek.com>
In-Reply-To: <20210906071539.12953-2-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 7 Sep 2021 07:42:22 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-rVhh4_m39JPRnE-zwW38k-OPArVv6GqOmORaD=qStVQ@mail.gmail.com>
Message-ID: <CAAOTY_-rVhh4_m39JPRnE-zwW38k-OPArVv6GqOmORaD=qStVQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/16] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_164236_302692_2BABE801 
X-CRM114-Status: GOOD (  19.64  )
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

SGksIE5hbmN5OgoKTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDnmnIg25pelIOmAseS4gCDkuIvljYgzOjE15a+r6YGT77yaCj4KPiBBZGQgdmRvc3lzMSBSRE1B
IGRlZmluaXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBOYW5jeS5MaW4gPG5hbmN5LmxpbkBtZWRp
YXRlay5jb20+Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC1yZG1h
LnlhbWwgICB8IDc3ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDc3IGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC1yZG1hLnlhbWwKPgo+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRp
YXRlay9tZWRpYXRlayxtZHAtcmRtYS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwLXJkbWEueWFtbAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4zNjEwMDkzODQ4ZTEKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssbWRwLXJkbWEueWFtbAoKSSd2ZSBjb21wYXJlZCB0aGUgcmRtYSBk
cml2ZXIgaW4gbWRwIFsxXSB3aXRoIHRoZSByZG1hIGRyaXZlciBpbgpkaXNwbGF5IFsyXSwgYm90
aCBhcmUgc2ltaWxhci4gVGhlIGRpZmZlcmVuY2UgYXJlIGxpa2UgbWVyZ2UwIHZlcnN1cwptZXJn
ZTUuIFNvIEkgd291bGQgbGlrZSBib3RoIGJpbmRpbmcgZG9jdW1lbnQgYXJlIHBsYWNlZCB0b2dl
dGhlci4gSW4KZGlzcGxheSBmb2xkZXI/IEluIG1lZGlhIGZvbGRlcj8gSW4gU29DIGZvbGRlcj8g
SSd2ZSBubyBpZGVhIHdoaWNoIG9uZQppcyBiZXR0ZXIsIGJ1dCBhdCBsZWFzZSBwdXQgdG9nZXRo
ZXIuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlh
dGVrL3BhdGNoLzIwMjEwODI0MTAwMDI3LjI1OTg5LTYtbW91ZHkuaG9AbWVkaWF0ZWsuY29tLwpb
Ml0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3Bh
dGNoLzIwMjEwOTA2MDcxNTM5LjEyOTUzLTEyLW5hbmN5LmxpbkBtZWRpYXRlay5jb20vCgpSZWdh
cmRzLApDaHVuLUt1YW5nLgoKPiBAQCAtMCwwICsxLDc3IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ICslWUFNTCAxLjIKPiAr
LS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxtZHAtcmRtYS55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBtZWRpYXRlayBkaXNwbGF5
IE1EUCBSRE1BCj4gKwo+ICttYWludGFpbmVyczoKPiArICAtIENLIEh1IDxjay5odUBtZWRpYXRl
ay5jb20+Cj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFRoZSBtZWRpYXRlayBkaXNwbGF5IE1E
UCBSRE1BIHN0YW5kcyBmb3IgUmVhZCBEaXJlY3QgTWVtb3J5IEFjY2Vzcy4KPiArICBJdCBwcm92
aWRlcyByZWFsIHRpbWUgZGF0YSB0byB0aGUgYmFjay1lbmQgcGFuZWwgZHJpdmVyLCBzdWNoIGFz
IERTSSwKPiArICBEUEkgYW5kIERQX0lOVEYuCj4gKyAgSXQgY29udGFpbnMgb25lIGxpbmUgYnVm
ZmVyIHRvIHN0b3JlIHRoZSBzdWZmaWNpZW50IHBpeGVsIGRhdGEuCj4gKyAgUkRNQSBkZXZpY2Ug
bm9kZSBtdXN0IGJlIHNpYmxpbmdzIHRvIHRoZSBjZW50cmFsIE1NU1lTX0NPTkZJRyBub2RlLgo+
ICsgIEZvciBhIGRlc2NyaXB0aW9uIG9mIHRoZSBNTVNZU19DT05GSUcgYmluZGluZywgc2VlCj4g
KyAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRl
ayxtbXN5cy55YW1sIGZvciBkZXRhaWxzLgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRp
YmxlOgo+ICsgICAgb25lT2Y6Cj4gKyAgICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgICAtIGNvbnN0
OiBtZWRpYXRlayxtdDgxOTUtdmRvMS1yZG1hCj4gKwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1z
OiAxCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBwb3dl
ci1kb21haW5zOgo+ICsgICAgZGVzY3JpcHRpb246IEEgcGhhbmRsZSBhbmQgUE0gZG9tYWluIHNw
ZWNpZmllciBhcyBkZWZpbmVkIGJ5IGJpbmRpbmdzIG9mCj4gKyAgICAgIHRoZSBwb3dlciBjb250
cm9sbGVyIHNwZWNpZmllZCBieSBwaGFuZGxlLiBTZWUKPiArICAgICAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3Bvd2VyLWRvbWFpbi55YW1sIGZvciBkZXRhaWxzLgo+
ICsKPiArICBjbG9ja3M6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogUkRN
QSBDbG9jawo+ICsKPiArICBpb21tdXM6Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhp
cyBwcm9wZXJ0eSBzaG91bGQgcG9pbnQgdG8gdGhlIHJlc3BlY3RpdmUgSU9NTVUgYmxvY2sgd2l0
aCBtYXN0ZXIgcG9ydCBhcyBhcmd1bWVudCwKPiArICAgICAgc2VlIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pb21tdS9tZWRpYXRlayxpb21tdS55YW1sIGZvciBkZXRhaWxzLgo+
ICsKPiArICBtZWRpYXRlayxnY2UtY2xpZW50LXJlZzoKPiArICAgIGRlc2NyaXB0aW9uOgo+ICsg
ICAgICBUaGUgcmVnaXN0ZXIgb2YgZGlzcGxheSBmdW5jdGlvbiBibG9jayB0byBiZSBzZXQgYnkg
Z2NlLiBUaGVyZSBhcmUgNCBhcmd1bWVudHMsCj4gKyAgICAgIHN1Y2ggYXMgZ2NlIG5vZGUsIHN1
YnN5cyBpZCwgb2Zmc2V0IGFuZCByZWdpc3RlciBzaXplLiBUaGUgc3Vic3lzIGlkIHRoYXQgaXMK
PiArICAgICAgbWFwcGluZyB0byB0aGUgcmVnaXN0ZXIgb2YgZGlzcGxheSBmdW5jdGlvbiBibG9j
a3MgaXMgZGVmaW5lZCBpbiB0aGUgZ2NlIGhlYWRlcgo+ICsgICAgICBpbmNsdWRlL2luY2x1ZGUv
ZHQtYmluZGluZ3MvZ2NlLzxjaGlwPi1nY2UuaCBvZiBlYWNoIGNoaXBzLgo+ICsgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+ICsgICAgbWF4
SXRlbXM6IDEKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0gcmVnCj4g
KyAgLSBwb3dlci1kb21haW5zCj4gKyAgLSBjbG9ja3MKPiArICAtIGlvbW11cwo+ICsKPiArYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArCj4g
KyAgICB2ZG8xX3JkbWEwOiB2ZG8xX3JkbWFAMWMxMDQwMDAgewo+ICsgICAgICAgIGNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQ4MTk1LXZkbzEtcmRtYSI7Cj4gKyAgICAgICAgcmVnID0gPDAgMHgx
YzEwNDAwMCAwIDB4MTAwMD47Cj4gKyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDQ5NSBJ
UlFfVFlQRV9MRVZFTF9ISUdIIDA+Owo+ICsgICAgICAgIGNsb2NrcyA9IDwmdmRvc3lzMSBDTEtf
VkRPMV9NRFBfUkRNQTA+Owo+ICsgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnNwbSBNVDgxOTVf
UE9XRVJfRE9NQUlOX1ZET1NZUzE+Owo+ICsgICAgICAgIGlvbW11cyA9IDwmaW9tbXVfdmRvIE00
VV9QT1JUX0wyX01EUF9SRE1BMD47Cj4gKyAgICAgICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcg
PSA8JmdjZTEgU1VCU1lTXzFjMTBYWFhYIDB4NDAwMCAweDEwMDA+Owo+ICsgICAgfTsKPiArCj4g
LS0KPiAyLjE4LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
