Return-Path: <SRS0=iNWv=42=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F4AC10DCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 01:54:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E0B20675
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 01:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fvQsYd30";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aWYnmvWG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E0B20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b3Sf2INTVlwA2sFa/+6hZwF9XBoTlLoS9A/R+ztzv2Y=; b=fvQsYd30PU4/GE
	5/b7LhLyba5/J3VY7qNL5R504slZfXkEVm5ggGMJS/vP2nh1Gq1vi5IunArCjNTAcpwpIOf8qgUOD
	Mq1zcSSO6G7Vu752GN0XLLBo6X2yrNZTGdJj0DFVjo+KbjygWLcG9G/8Pzuw3ZKazlqxeReLVyxr7
	ZL14Bu+Xgo8qioDSkeACIaEhXF9gr+XATCZFZdy4r4lkLXlXgI1Tsqxa+Yg6G/ircQ5ynXF1lIlRZ
	2Y9IYYcuCtezGKArnHNiM0gV8tTFJuPVq6EZ7LoeAibaCF95oViAxRn4Vja3A6hCQMzi/fRu1vLJB
	+d6OMgMWzkkiFbkkki4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jB7c7-0002XI-JX; Mon, 09 Mar 2020 01:53:51 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jB7c4-0002WX-GZ
 for linux-mediatek@lists.infradead.org; Mon, 09 Mar 2020 01:53:50 +0000
Received: by mail-vs1-xe43.google.com with SMTP id z125so1145668vsb.13
 for <linux-mediatek@lists.infradead.org>; Sun, 08 Mar 2020 18:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QImbxmTkHKil1pvHr+BDxiJL2XLBZLzoyGW6wsTn3oQ=;
 b=aWYnmvWGdbntSuhyucIIAMxrZHkM4G5/Q9vbOmCQsekZAYHvr4Eog74dsXDkMYl2xD
 KvL1zeXKamlcuQTyyvQgkSKnT1gNRPF5uTVUa4a4fHcg/kx4VnHTixsNdroZ764sU1Uy
 +tKikHrHiZuRBXkYz+/Z8bBjwf8qxvraCz7gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QImbxmTkHKil1pvHr+BDxiJL2XLBZLzoyGW6wsTn3oQ=;
 b=SA8vANQfIECPsXUooF091uQCINLwShp4Q1bvtZdkDJLcdwA2RdJNCsj9VQu/psRFRk
 uomZ37niIZhhGjDoFfxr9CJyNb2MRk6iHu3ub8bF9TmdbW0zzPhXMIFgXKuETQv/o2Sp
 X7eRD5z5NfQOgWh+9nsscVyQlOUEwTgkhaieXNYKjlCZ2RF79YyHDGbaj5l5xRb2H8vB
 qxwpuVJ0bCQUga4uw/Wf2aC6RWP7C7diTcamKGu3cmaEKgll9xLJgPgAP4d0oM+zaYff
 27mIprLtJGgE7AZDQkaDXB4cQnI6c2EAIfZcXd+oWHSravZKBH6PdFc1+lDvttUUsZo6
 3Jpg==
X-Gm-Message-State: ANhLgQ0QPqRaMowyKU271B1Nz6E/swdQIcLsZfXapwSttEtgrG+5Exaq
 1h/sdblBepTkSBGGYDzwxg6ShOpHlzKAhtvBBQrNPQ==
X-Google-Smtp-Source: ADFU+vvYsFjqtY5zn3zCc01nvvuQjne4/YR7CEb/r3521XiWmW+BqevLE59/BQHtNHTJV1ro52aTXPZEfqp1TtQdFWA=
X-Received: by 2002:a05:6102:9c7:: with SMTP id
 g7mr8614280vsi.186.1583718826912; 
 Sun, 08 Mar 2020 18:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-8-drinkcat@chromium.org>
 <CANMq1KBL-S2DVKbCB2h_XNpfUro+pZ96-C5ft0p-8GX_tbXELQ@mail.gmail.com>
 <CAL_JsqLuo+2G2MjiwS9cwNhMV2pGBojXFGNqEfLv3fP-Y04mfA@mail.gmail.com>
 <CANMq1KCn5rrOrv2GjFh5Aau5Los4VVk=NMWAsvZiNuwoxyMVHA@mail.gmail.com>
 <e4e95aa7713344e8b43fe5fad05de3ee@mtkmbs01n1.mediatek.inc>
In-Reply-To: <e4e95aa7713344e8b43fe5fad05de3ee@mtkmbs01n1.mediatek.inc>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 9 Mar 2020 09:53:35 +0800
Message-ID: <CANMq1KDmvxQdKHgyvQb6xChFX5UkBqPyQKXxuxGV70=p1=ezKw@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
To: =?UTF-8?B?TmljayBGYW4gKOiMg+WTsue2rSk=?= <Nick.Fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200308_185348_578891_5276FF1E 
X-CRM114-Status: GOOD (  23.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?B?V2VpeWkgTHUgKOWRguWogeWEgCk=?= <Weiyi.Lu@mediatek.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TG9vcGluZyBiYWNrIG9uIHRoaXMsIGFmdGVyIGRpZ2dpbmcgYSBiaXQgZGVlcGVyLi4uCgpPbiBG
cmksIEZlYiAxNCwgMjAyMCBhdCA5OjM4IEFNIE5pY2sgRmFuICjojIPlk7Lntq0pIDxOaWNrLkZh
bkBtZWRpYXRlay5jb20+IHdyb3RlOgo+IFtzbmlwXQo+ID4gPiBBbm90aGVyIHRoaW5nIHRoYXQg
SSdtIG5vdCBpbXBsZW1lbnRpbmcgaXMgdGhlIGRhbmNlIHRoYXQgTWVkaWF0ZWsKPiA+ID4gZG9l
cyBpbiB0aGVpciBrYmFzZSBkcml2ZXIgd2hlbiBjaGFuZ2luZyB0aGUgY2xvY2sgKGRlc2NyaWJl
ZCBpbgo+ID4gPiBwYXRjaAo+ID4gPiAyLzcpOgo+ID4gPiAiIgo+ID4gPiBUaGUgYmluZGluZyB3
ZSB1c2Ugd2l0aCBvdXQtb2YtdHJlZSBNYWxpIGRyaXZlcnMgaW5jbHVkZXMgbW9yZQo+ID4gPiBj
bG9ja3MsIHRoaXMgaXMgdXNlZCBmb3IgZGV2ZnJlcTogdGhlIG91dC1vZi10cmVlIGRyaXZlciBz
d2l0Y2hlcwo+ID4gPiBjbGtfbXV4IHRvIGNsa19zdWJfcGFyZW50ICgyNk1oeiksIGFkanVzdHMg
Y2xrX21haW5fcGFyZW50LCB0aGVuCj4gPiA+IHN3aXRjaGVzIGNsa19tdXggYmFjayB0byBjbGtf
bWFpbl9wYXJlbnQ6Cj4gPiA+IChzZWUKPiA+ID4gaHR0cHM6Ly9jaHJvbWl1bS5nb29nbGVzb3Vy
Y2UuY29tL2Nocm9taXVtb3MvdGhpcmRfcGFydHkva2VybmVsLysvY2gKPiA+ID4gcm9tZW9zLTQu
MTkvZHJpdmVycy9ncHUvYXJtL21pZGdhcmQvcGxhdGZvcm0vbWVkaWF0ZWsvbWFsaV9rYmFzZV9y
dW4KPiA+ID4gdGltZV9wbS5jIzQyMykKPiA+ID4gY2xvY2tzID0KPiA+ID4gICAgICAgICA8JnRv
cGNrZ2VuIENMS19UT1BfTUZHUExMX0NLPiwKPiA+ID4gICAgICAgICA8JnRvcGNrZ2VuIENMS19U
T1BfTVVYX01GRz4sCj4gPiA+ICAgICAgICAgPCZjbGsyNm0+LAo+ID4gPiAgICAgICAgIDwmbWZn
Y2ZnIENMS19NRkdfQkczRD47Cj4gPiA+IGNsb2NrLW5hbWVzID0KPiA+ID4gICAgICAgICAiY2xr
X21haW5fcGFyZW50IiwKPiA+ID4gICAgICAgICAiY2xrX211eCIsCj4gPiA+ICAgICAgICAgImNs
a19zdWJfcGFyZW50IiwKPiA+ID4gICAgICAgICAic3Vic3lzX21mZ19jZyI7Cj4gPiA+ICIiCj4g
PiA+IElzIHRoZXJlIGEgY2xlYW4vc2ltcGxlIHdheSB0byBpbXBsZW1lbnQgdGhpcyBpbiB0aGUg
Y2xvY2sKPiA+ID4gZnJhbWV3b3JrL2RldmljZSB0cmVlPyBPciBzaG91bGQgd2UgaW1wbGVtZW50
IHNvbWV0aGluZyBpbiB0aGUKPiA+ID4gcGFuZnJvc3QgZHJpdmVyPwo+ID4KPiA+IFB1dHRpbmcg
cGFyZW50IGNsb2NrcyBpbnRvICdjbG9ja3MnIGZvciBhIGRldmljZSBpcyBhIHByZXR0eSBjb21t
b24KPiA+IGFidXNlLiBUaGUgJ2Fzc2lnbmVkLWNsb2NrcycgYmluZGluZyBpcyB3aGF0J3MgdXNl
ZCBmb3IgcGFyZW50IGNsb2NrCj4gPiBzZXR1cC4gTm90IHN1cmUgdGhhdCdzIGdvaW5nIHRvIGhl
bHAgaGVyZSB0aG91Z2guIElzIHRoaXMgZGFuY2UKPiA+IGJlY2F1c2UgdGhlIHBhcmVudCBjbG9j
ayBmcmVxdWVuY3kgY2FuJ3QgYmUgY2hhbmdlZCBjbGVhbmx5Pwo+Cj4gTmljay9XZWl5aSwgYW55
IGlkZWEgd2h5IHdlIGRvIHRoYXQgZGFuY2UgaW4gdGhlIGZpcnN0IHBsYWNlPyAobWF5YmUgdGhl
IFBMTCBjbG9jayBpcyB1bnN0YWJsZSB3aGlsZSBpdCdzIGJlaW5nIGNoYW5nZWQ/KQo+Cj4gQ2xv
Y2sgc291cmNlIG1heSBiZWNvbWUgdW5zdGFibGUgZHVyaW5nIGNsb2NrIGZyZXF1ZW5jeSBjaGFu
Z2VzLCBzbyBpdCBpcyBhbHdheXMgc2FmZXIgdG8gc3dpdGNoIHRvIGEgbW9yZSByZWxpYWJsZSBj
bG9jayBzb3VyY2UuCj4gT3RoZXJ3aXNlLCBpdCBtYXkgY2F1c2Ugc29tZSBwcm9ibGVtIGluIHNv
bWUgY29ybmVyIGNhc2UuCj4gSSB3b3VsZCBzdWdnZXN0IHRvIGtlZXAgaXQuCgpUaGUgTWVkaWF0
ZWsgQ1BVZnJlcSBkcml2ZXIgYWN0dWFsbHkgZG9lcyBhIHZlcnkgc2ltaWxhciBkYW5jZToKaHR0
cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2RyaXZlcnMvY3B1ZnJl
cS9tZWRpYXRlay1jcHVmcmVxLmMjTDI0OQoKV2hhdCB0aGV5IGhhdmUgaW4gdGhlIGRldmljZSB0
cmVlIGlzIHRoZSBtYWluIGNsb2NrLCBhbmQgdGhlCiJpbnRlcm1lZGlhdGUiIGNsb2NrIHRoYXQg
aXMgcmVxdWlyZWQgZHVyaW5nIHN3aXRjaGluZzoKY2xvY2tzID0gPCZtY3VjZmcgQ0xLX01DVV9N
UDBfU0VMPiwgPCZ0b3Bja2dlbiBDTEtfVE9QX0FSTVBMTF9ESVZfUExMMT47CmNsb2NrLW5hbWVz
ID0gImNwdSIsICJpbnRlcm1lZGlhdGUiOwoKVGhlIHRvcG9sb2d5IGxvb2tzIGxpa2UgdGhpczoK
IGNsazI2bSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDE1ICAgICAgIDE1ICAgICAgICAx
ICAgIDI2MDAwMDAwCiAgICAgICAgMCAgICAgMCAgNTAwMDAKICAgIGFybXBsbF9sbCAgICAgICAg
ICAgICAgICAgICAgICAgICAxICAgICAgICAxICAgICAgICAwICAxNDE3MDAwMDAwCiAgICAgICAg
MCAgICAgMCAgNTAwMDAKICAgICAgIG1jdV9tcDBfc2VsICAgICAgICAgICAgICAgICAgICAwICAg
ICAgICAwICAgICAgICAwICAxNDE3MDAwMDAwCiAgICAgICAgMCAgICAgMCAgNTAwMDAKCkFuZCBk
ZXZpY2UgdHJlZSBwcm92aWRlcyBtY3VfbXAwX3NlbCBhcyAiY3B1IiwgYW5kIHRoZSBhcm1wbGxf
ZGl2X3BsbDEKYXMgImludGVybWVkaWF0ZSIuCgpUaGUgZHJpdmVyIGxvb2tzIHVwIGFybXBsbF9s
bCBieSBjYWxsaW5nIGdldF9wYXJlbnQsIHRoZW46CiAtIHNldF9wYXJlbnQobWN1X21wMF9zZWws
IGFybXBsbF9kaXZfcGxsMSkKIC0gc2V0X3JhdGUoYXJtcGxsX2xsLCBuZXdfcmF0ZSkKIC0gc2V0
X3BhcmVudChtY3VfbXAwX3NlbCwgYXJtcGxsX2xsKQoKT24gTVQ4MTgzJ3MgR1BVLCB0aGUgdG9w
b2xvZ3kgaXMgYSBsaXR0bGUgYml0IG1vcmUgY29tcGxpY2F0ZWQgKGJ1dCBJCnRoaW5rIHRoZXJl
IHNob3VsZCBiZSBhIHdheSB0byBtZXJnZSBtZmdfYmczZCBhbiBtZmdfc2VsIGluIHRoZSBjbG9j
awpjb3JlKQogY2xrMjZtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTUgICAgICAgMTUg
ICAgICAgIDEgICAgMjYwMDAwMDAKICAgICAgICAwICAgICAwICA1MDAwMAogICAgbWZncGxsICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICA0MTk5OTk4MTcK
ICAgICAgICAwICAgICAwICA1MDAwMAogICAgICAgbWZncGxsX2NrICAgICAgICAgICAgICAgICAg
ICAgIDIgICAgICAgIDIgICAgICAgIDAgICA0MTk5OTk4MTcKICAgICAgICAwICAgICAwICA1MDAw
MAogICAgICAgICAgbWZnX3NlbCAgICAgICAgICAgICAgICAgICAgIDMgICAgICAgIDMgICAgICAg
IDAgICA0MTk5OTk4MTcKICAgICAgICAwICAgICAwICA1MDAwMAogICAgICAgICAgICAgbWZnX2Jn
M2QgICAgICAgICAgICAgICAgIDEgICAgICAgIDEgICAgICAgIDAgICA0MTk5OTk4MTcKICAgICAg
ICAwICAgICAwICA1MDAwMAoKV2UncmUgZ29pbmcgdG8gbmVlZCBhIHNwZWNpYWwgcGFuZnJvc3Qg
ZGV2ZnJlcSBkcml2ZXIgZm9yIG10ODE4Mwphbnl3YXkgKHRvIGhhbmRsZSB0aGUgMiByZWd1bGF0
b3JzKSwgc28gaXQgd291bGQgYmUgZWFzeSB0byB0YWtlIGEKc2ltaWxhciBhcHByb2FjaDoKIC0g
QWRkICJpbnRlcm1lZGlhdGUiIGNsb2NrIGluIHRoZSBkZXZpY2UgdHJlZSAoY2xrMjZtKQogLSBG
aW5kIG1mZ19zZWwvbWZncGxsX2NrIHVzaW5nIDEvMiBjbGtfZ2V0X3BhcmVudCBjYWxscy4KIC0g
U3dpdGNoIG1mZ19zZWwgdG8gY2xrMjZtLCBzZXQgbWZncGxsX2NrIHJhdGUsIHN3aXRjaCBtZmdf
c2VsIGJhY2sKdG8gbWZncGxsX2NrLgoKKEJUVywgSSB0cmllZCB0byBsb29rLCBhbmQgY291bGRu
J3QgZmluZCBleGFtcGxlcyBvciByZXBhcmVudGluZwpkdXJpbmcgY2xvY2sgY2hhbmdlcyBpbiBk
cml2ZXJzL2NsaywgYXJlIHRoZXJlIGV4aXN0aW5nIGRyaXZlcnMgZG9pbmcKc2ltaWxhciB0aGlu
Z3M/IE9yIHRoaXMgd291bGQgYmUgbmV3PykuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
