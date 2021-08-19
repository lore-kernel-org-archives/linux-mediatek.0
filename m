Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CADC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:00:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6B461131
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A6B461131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqlKwjswy6BXEnbEoU+3Ve8Y/RFwnn/Yh+LVkha9luU=; b=EdG4wloDvJtEbJ
	JLQ2DG47NMYlurVnEeqkOL9rWotaOnvs16prj18JPld0y5/9oVjxRYV01jf8MtvhxPxMBXpPVxenU
	eYk3w0m5DQdr4xsl4Ak5UW1YeGATY8ugTcbmT4HqDrchX24FospY3+yp/YmXJ2dZ+4IvuFzs2MlnR
	EIi5AX7pLp59Od+IWs5mrTvrZvNklKEsywr6La7s+BFpzEYHXD/o9PKXtBfXztpRyYAxPG0YSI3nD
	SdnRGy95FzCnWYGV9VKqiWLZI5GJ3Ype3Qu2GA7wAdu1Gp0IWfbGFy3VSf+4/K3JuheYGk7MsmMnX
	ROXUrTAr2LUkGFhMH4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGjWv-008iU2-Cs; Thu, 19 Aug 2021 15:00:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGjWh-008iMQ-C9; Thu, 19 Aug 2021 15:00:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDED361165;
 Thu, 19 Aug 2021 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629385215;
 bh=aZJbgY0dYPtD/UwLcyqp1tm6QeXuUNB0SoluXhrFRYk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i+LSnZtTwtysJWxuhDZw3d9mLByOTctc0IRpFBGeMV7AilsjX/uqIzbZrgmQOIx+U
 gaIWmHFCQlH1MC43SlpZWLb3HkXHKzaaWnXKfQg1N8dShgxkPh7zWGpt8Jejyj+LmA
 KHSKzowAvj3cCdsGBEh9CTt7dtUpNTLBtB4ZhiuyUQJI0R0K1zHuO1i9/psY/lB3E1
 dgDVjIiyRro/+mx37cVURd1a/FX1cYAimTn0h1icl42RDTo+dZU9IAMuw9nQ7UkgC8
 2sX96i2LEGgE7pSlfQUxpdjJWNX7GTNtCgS8LHlIm58w2p5cAwmTJBI7+uN1QdBYkV
 UHBbHudIoU0cw==
Received: by mail-ed1-f49.google.com with SMTP id by4so9402162edb.0;
 Thu, 19 Aug 2021 08:00:14 -0700 (PDT)
X-Gm-Message-State: AOAM530DjnTiLP/7d7mA72JF06kQemisZOXImzSJZ6xL/WAD3SNADrLX
 5fhyHB3lMu8qAc4DwBVas4XzzG2Vdwwl08iDLA==
X-Google-Smtp-Source: ABdhPJywGAFcZyeFfHGvm2H/Zdii8mlwORsTkptePeQu2y+i3nkMQ+zjBa4vUPMxNQYtZNzH4FvakVszXQcwdaXQiUE=
X-Received: by 2002:a05:6402:b64:: with SMTP id
 cb4mr16678817edb.49.1629385213446; 
 Thu, 19 Aug 2021 08:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20210819022327.13040-2-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 19 Aug 2021 23:00:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Yug-9S4uBkNLTJH+TU8dHCeOjLuwXdNMJ+R89qJyJ9Q@mail.gmail.com>
Message-ID: <CAAOTY_9Yug-9S4uBkNLTJH+TU8dHCeOjLuwXdNMJ+R89qJyJ9Q@mail.gmail.com>
Subject: Re: [PATCH v8 01/13] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
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
X-CRM114-CacheID: sfid-20210819_080015_507201_C55FA709 
X-CRM114-Status: GOOD (  17.52  )
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
MjAyMeW5tDjmnIgxOeaXpSDpgLHlm5sg5LiK5Y2IMTA6MjPlr6vpgZPvvJoKPgo+IDEuIFRoZXJl
IGFyZSAyIG1tc3lzLCBuYW1lbHkgdmRvc3lzMCBhbmQgdmRvc3lzMSBpbiBtdDgxOTUuCj4gICAg
RWFjaCBvZiB0aGVtIGlzIGJvdW5kIHRvIGEgZGlzcGxheSBwaXBlbGluZSwgc28gYWRkIHRoZWly
Cj4gICAgZGVmaW5pdGlvbiBpbiBtdGstbW1zeXMgZG9jdW1lbnRhdGlvbiB3aXRoIDIgY29tcGF0
aWJsZXMuCj4KPiAyLiBBZGQgZGVzY3JpcHRpb24gZm9yIHBvd2VyLWRvbWFpbiBwcm9wZXJ0eS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNv
bT4KPiAtLS0KPiB0aGlzIHBhdGNoIGlzIGJhc2Ugb24gWzFdWzJdCj4KPiBbMV0gZHQtYmluZGlu
Z3M6IGFybTogbWVkaWF0ZWs6IG1tc3lzOiBjb252ZXJ0IHRvIFlBTUwgZm9ybWF0Cj4gLSBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAy
MTA1MTkxNjE4NDcuMzc0NzM1Mi0xLWZwYXJlbnRAYmF5bGlicmUuY29tLwo+IFsyXSBkdC1iaW5k
aW5nczogYXJtOiBtZWRpYXRlazogbW1zeXM6IGFkZCBNVDgzNjUgU29DIGJpbmRpbmcKPiAtIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8y
MDIxMDUxOTE2MTg0Ny4zNzQ3MzUyLTItZnBhcmVudEBiYXlsaWJyZS5jb20vCj4gLS0tCj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy55YW1sICB8
IDggKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVk
aWF0ZWssbW1zeXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
bWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtbAo+IGluZGV4IDJkNGZmMGNlMzg3Yi4uNjhjYjMz
MGQ3NTk1IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtbAo+IEBAIC0z
MCw2ICszMCw4IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgx
NzMtbW1zeXMKPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4My1tbXN5cwo+ICAgICAg
ICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MzY1LW1tc3lzCj4gKyAgICAgICAgICAgICAgLSBtZWRp
YXRlayxtdDgxOTUtdmRvc3lzMAo+ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTk1LXZk
b3N5czEKPiAgICAgICAgICAgIC0gY29uc3Q6IHN5c2Nvbgo+ICAgICAgICAtIGl0ZW1zOgo+ICAg
ICAgICAgICAgLSBjb25zdDogbWVkaWF0ZWssbXQ3NjIzLW1tc3lzCj4gQEAgLTM5LDYgKzQxLDEy
IEBAIHByb3BlcnRpZXM6Cj4gICAgcmVnOgo+ICAgICAgbWF4SXRlbXM6IDEKPgo+ICsgIHBvd2Vy
LWRvbWFpbnM6Cj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgQSBwaGFuZGxlIGFuZCBQTSBk
b21haW4gc3BlY2lmaWVyIGFzIGRlZmluZWQgYnkgYmluZGluZ3MKPiArICAgICAgb2YgdGhlIHBv
d2VyIGNvbnRyb2xsZXIgc3BlY2lmaWVkIGJ5IHBoYW5kbGUuIFNlZQo+ICsgICAgICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwgZm9yIGRl
dGFpbHMuCj4gKwoKVGhpcyBwYXRjaCBpcyBhYm91dCBtdDgxOTUsIGJ1dCBtdDgxNzMgbW1zeXMg
YWxzbyBoYXMgcG93ZXIgZG9tYWluLiBTbwptb3ZlIHRoaXMgcGFydCB0byBhbm90aGVyIHBhdGNo
LgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCgo+ICAgICIjY2xvY2stY2VsbHMiOgo+ICAgICAgY29u
c3Q6IDEKPgo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
