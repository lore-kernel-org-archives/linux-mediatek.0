Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2DEC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 00:11:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2EAE6109D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 00:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2EAE6109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdCXeG8H7AbWU03QGddojuh0qA0i/OCJynyjA2E87kQ=; b=z59/L8LxBl0tnX
	ACiS6WPFT90rc3XxzIiiYD8S4CYaXmpM1T8r5dUsxh6+orZK9HxdbPpCqC+h4xbS9mskNRwf+fDZ1
	XvV6FrSdbh24Jooyez3GC7J3hH+/QcINdTQPnkYLe9lRna8vDxunB9pzPU0rqlBRH2QpWLjmIXOAa
	O+nD1Rv0M+AIxqkniLqCu/ZQEqfteNqJql1vzxNZ4fEaP2+ev1NE0kaSN6/ernQhVm+y5lGmDDM2x
	UY8CxrMdgpCYRsoMqTukCBOPr8+GB3Tq+p0N72//ocPBHC6KTexW+mj8bK+dc/JbR3Q1XoFRfckDL
	CQa+1jssUeVA52pMG7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNOiC-0027uA-3S; Tue, 07 Sep 2021 00:11:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNOhx-0027rE-K7; Tue, 07 Sep 2021 00:11:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4B49610E8;
 Tue,  7 Sep 2021 00:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630973484;
 bh=ifuFv3gkwVp/7X92auvTBV/kMkrnWgnIGVHcpN8lm0I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AM3AUOWWKR28dFKWdTcf/89GeoJVjrNAtBqiyFOtqiB409ug0JnZmbUcPvJ7xhYUd
 QZDE4EudShOca7/OYAMpDzIt9lGCn21USSPAPsP6DSvZxIl3C2d4x0AJMDe3+1AZKk
 Zl7ywAr3Yi89qXKFezX/+6uoKa7btOLQfU0UPeFqmkYo0mXvL3jXb8Csu3lPiHtRjp
 AcJWCTCqASGDC1KiBIScIbP4jtggGOZaCLPc8t3bHsE5GwttxhYAFzIxT1htE77Ezv
 lwIUIy7uAjcc2kei2CKz5n2k6zNh0J+ib+kn2U/FTfyVfqYWrLkWZPh9MxAkB2CCBT
 y3lKhC9ZXZTXQ==
Received: by mail-ej1-f47.google.com with SMTP id u14so16164892ejf.13;
 Mon, 06 Sep 2021 17:11:24 -0700 (PDT)
X-Gm-Message-State: AOAM532DJTCii39K93U4so2ZrWueJfUlXEY8fmyZqLmgYStdkFs3ZO6/
 0ZX9n8OiUT87s15qmZuqR4t7IrF5n/Ycb7S5BA==
X-Google-Smtp-Source: ABdhPJxU1SiAb4YPZCljleFW/HiLB8RDcADm34x/la6BDgQKmR7J0vZffdCpPHyLfu1ItECgjPKdWvfhwUZmzYWI37M=
X-Received: by 2002:a17:906:26c4:: with SMTP id
 u4mr15571504ejc.511.1630973483408; 
 Mon, 06 Sep 2021 17:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210824100027.25989-1-moudy.ho@mediatek.com>
 <20210824100027.25989-4-moudy.ho@mediatek.com>
In-Reply-To: <20210824100027.25989-4-moudy.ho@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 7 Sep 2021 08:11:12 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8GFP0utAVSw1JY6=y9hsJTbf8mtiKCnUmTcG2e9Zwdxg@mail.gmail.com>
Message-ID: <CAAOTY_8GFP0utAVSw1JY6=y9hsJTbf8mtiKCnUmTcG2e9Zwdxg@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] dt-binding: mt8183: Add Mediatek MDP3 dt-bindings
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maoguang Meng <maoguang.meng@mediatek.com>, 
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>, 
 Nicolas Boichat <drinkcat@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Pi-Hsun Shih <pihsun@chromium.org>, menghui.lin@mediatek.com, 
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>, 
 ben.lok@mediatek.com, randy.wu@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>, Hsin-Yi Wang <hsinyi@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_171125_762172_F1D86215 
X-CRM114-Status: GOOD (  18.81  )
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

SGksIE1vdWR5OgoKTW91ZHkgSG8gPG1vdWR5LmhvQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHlubQ4
5pyIMjTml6Ug6YCx5LqMIOS4i+WNiDY6MDLlr6vpgZPvvJoKPgo+IFRoaXMgcGF0Y2ggYWRkcyBE
VCBiaW5kaW5nIGRvY3VtZW50IGZvciBNZWRpYSBEYXRhIFBhdGggMyAoTURQMykKPiBhIHVuaXQg
aW4gbXVsdGltZWRpYSBzeXN0ZW0gdXNlZCBmb3Igc2NhbGluZyBhbmQgY29sb3IgZm9ybWF0IGNv
bnZlcnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNb3VkeSBIbyA8bW91ZHkuaG9AbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1jY29yci55YW1sICAg
fCAgNTcgKysrKysKPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtcmRtYS55YW1s
ICAgIHwgMjA3ICsrKysrKysrKysrKysrKysrKwo+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0
ZWssbWRwMy1yc3oueWFtbCAgICAgfCAgNjUgKysrKysrCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlayxtZHAzLXdkbWEueWFtbCAgICB8ICA3MSArKysrKysKPiAgLi4uL2JpbmRpbmdzL21l
ZGlhL21lZGlhdGVrLG1kcDMtd3JvdC55YW1sICAgIHwgIDcxICsrKysrKwo+ICA1IGZpbGVzIGNo
YW5nZWQsIDQ3MSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssbWRwMy1jY29yci55YW1sCgpJ
J3ZlIGNvbXBhcmVkIGNjb3JyIGRyaXZlciBpbiBkaXNwbGF5IFsxXSBhbmQgY2NvcnIgaW4gbWRw
IFsyXSwgYm90aAphcmUgc2ltaWxhci4gU28gSSB3b3VsZCBsaWtlIGJvdGggYmluZGluZyBkb2N1
bWVudCBhcmUgcGxhY2VkCnRvZ2V0aGVyLiBJbiBkaXNwbGF5IGZvbGRlcj8gSW4gbWRwIGZvbGRl
cj8gSW4gU29DIGZvbGRlcj8gSSd2ZSBubwppZGVhIHdoaWNoIG9uZSBpcyBiZXR0ZXIuIEF0IGxl
YXNlIHB1dCB0b2dldGhlci4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfY2NvcnIuYz9oPXY1LjE0ClsyXSBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA4MjQxMDAwMjcuMjU5ODkt
Ni1tb3VkeS5ob0BtZWRpYXRlay5jb20vCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRp
YXRlayxtZHAzLXJkbWEueWFtbAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtcnN6LnlhbWwKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRp
YXRlayxtZHAzLXdkbWEueWFtbAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG1kcDMtd3JvdC55YW1sCj4KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVr
LG1kcDMtY2NvcnIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlayxtZHAzLWNjb3JyLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAwMC4uNTlmZDY4YjQ2MDIyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtZHAzLWNjb3JyLnlh
bWwKPiBAQCAtMCwwICsxLDU3IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvbWVkaWF0ZWssbWRwMy1jY29yci55YW1s
Iwo+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKPiArCj4gK3RpdGxlOiBNZWRpYXRlayBNZWRpYSBEYXRhIFBhdGggMyBDQ09SUiBEZXZpY2Ug
VHJlZSBCaW5kaW5ncwo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBEYW95dWFuIEh1YW5nIDxk
YW95dWFuLmh1YW5nQG1lZGlhdGVrLmNvbT4KPiArICAtIE1vdWR5IEhvIDxtb3VkeS5ob0BtZWRp
YXRlay5jb20+Cj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIE9uZSBvZiBNZWRpYSBEYXRhIFBh
dGggMyAoTURQMykgY29tcG9uZW50cyB1c2VkIHRvIGRvIGNvbG9yIGNvcnJlY3Rpb24gd2l0aCAz
WDMgbWF0cml4Lgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgaXRl
bXM6Cj4gKyAgICAgIC0gZW51bToKPiArICAgICAgICAtIG1lZGlhdGVrLG10ODE4My1tZHAzLWNj
b3JyCj4gKwo+ICsgIG1lZGlhdGVrLG1kcDMtaWQ6Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiArICAgIG1heEl0ZW1zOiAxCj4gKyAgICBkZXNj
cmlwdGlvbjogfAo+ICsgICAgICBIVyBpbmRleCB0byBkaXN0aW5ndWlzaCBzYW1lIGZ1bmN0aW9u
YWxpdHkgbW9kdWxlcy4KPiArCj4gKyAgcmVnOgo+ICsgICAgZGVzY3JpcHRpb246IHwKPiArICAg
ICAgUGh5c2ljYWwgYmFzZSBhZGRyZXNzIGFuZCBsZW5ndGggb2YgdGhlIGZ1bmN0aW9uIGJsb2Nr
Cj4gKyAgICAgIHJlZ2lzdGVyIHNwYWNlLCB0aGUgbnVtYmVyIGFsaWducyB3aXRoIHRoZSBjb21w
b25lbnQKPiArICAgICAgYW5kIGl0cyBvd24gc3ViY29tcG9uZW50Lgo+ICsKPiArICBtZWRpYXRl
ayxnY2UtY2xpZW50LXJlZzoKPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3BoYW5kbGUtYXJyYXkKPiArICAgIGRlc2NyaXB0aW9uOiB8Cj4gKyAgICAgIHN1Yi1z
eXN0ZW0gaWQgY29ycmVzcG9uZGluZyB0byB0aGUgZ2xvYmFsIGNvbW1hbmQgZW5naW5lIChHQ0Up
Cj4gKyAgICAgIHJlZ2lzdGVyIGFkZHJlc3MuCj4gKyAgICAgICRyZWY6IC9zY2hlbWFzL21haWxi
b3gvbXRrLWdjZS50eHQKPiArCj4gKyAgY2xvY2tzOgo+ICsgICAgbWluSXRlbXM6IDEKPiArCj4g
K2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4g
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTgzLWNsay5oPgo+ICsgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2djZS9tdDgxODMtZ2NlLmg+Cj4gKwo+ICsgICAgbWRwM19jY29y
cjogbWRwM19jY29yckAxNDAxYzAwMCB7Cj4gKyAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ4MTgzLW1kcDMtY2NvcnIiOwo+ICsgICAgICBtZWRpYXRlayxtZHAzLWlkID0gPDA+Owo+ICsg
ICAgICByZWcgPSA8MHgxNDAxYzAwMCAweDEwMDA+Owo+ICsgICAgICBtZWRpYXRlayxnY2UtY2xp
ZW50LXJlZyA9IDwmZ2NlIFNVQlNZU18xNDAxWFhYWCAweGMwMDAgMHgxMDAwPjsKPiArICAgICAg
Y2xvY2tzID0gPCZtbXN5cyBDTEtfTU1fTURQX0NDT1JSPjsKPiArICAgIH07CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
