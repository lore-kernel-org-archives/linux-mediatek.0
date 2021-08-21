Return-Path: <SRS0=N9OQ=NM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D126FC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Aug 2021 23:14:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73D3E61278
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Aug 2021 23:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73D3E61278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5HcECUp9P0HKWVZviQ7hPZiWPq8Y4mMBOjSiXQZCDc=; b=MJxBCxu4iA+k4u
	HR9Sz2/dAAPNoiYFhO5vVuV3yhXd9Cmx452CK1P0oL8yJc4ON7cL9ol5FOx/gTXiqjtSUKCe/rB7v
	GCErRD1j+pOjA7GbPF5oigFCc8akLbHaZ60Fm5b5NKGehAcbBRXg+sw3bDvScFqgutSs9t+NKbc0a
	RWVNh+Ir3+qqiANOMikLlglyIoRtYB+IgN8SiyH9s9NybkKnasptoQS0Lzb2r64Ex12UToKo0XHgP
	UUi5li3+jCjT3OXwFp8L1HxeH5EbTWE+KdXLp+9mRrhFkixvx2RhJ/tH6Ot2zC4Dp0xZycUkJzsok
	tjgQiZzkVStET+o6gVdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHaC5-00DGWF-Qs; Sat, 21 Aug 2021 23:14:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHaBq-00DGUr-3U; Sat, 21 Aug 2021 23:14:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1FB06128E;
 Sat, 21 Aug 2021 23:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629587652;
 bh=tdGAnKxM6kcsoZk3AJYnO2VXuyN1lhYFWXouYEoZxx8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RVI+ysbAJjBVl8En6Vs6QLGPSDp6AF0fy0i7mrmaMSSjeQpz5Pf+r0dc0wQhRI7TV
 Kwvrkg+yiFOhgR4iCbVQOo7tKeD4yasJQl6UTs6ErZdFrr0+uR2VrGY7QUNxDzH6+w
 9iH8RVxmt+kqUpV0zJs4jF8hwCVbOyPJqrZkcRLTarM1NqycsWOMv6tMTgh7pwbd+n
 rj5hf9VhejMa/2NxaC5/3DtAZF80309hB0zAUPeOvYpyFZDCSuDkH/fbdE3nG5kOCc
 3lkT4RZ6V+vrqBJ94Bp92JJ/0fdZy6A1HR6zxEgWlomfN1/Yn8LQG9cGsqywL0Y39u
 bkpGgl9NeBvaA==
Received: by mail-ej1-f53.google.com with SMTP id mf2so9570230ejb.9;
 Sat, 21 Aug 2021 16:14:12 -0700 (PDT)
X-Gm-Message-State: AOAM530JT/R14mR/cYoxthRc0d4ntIS01G9VwnjvjH/ElYqTHmReMtAe
 ZVFH+0xCpBrYQ1+eCHO3g1C/5GyZwb78/0kTdg==
X-Google-Smtp-Source: ABdhPJwTRztprBtYY7QES1iZ4ScD8mkXMBE/wRVHlguKZVJ/TxTvzU9+aJ8opXWxfoCtbK7Nd3DULgP8hMTBvn6pcmo=
X-Received: by 2002:a17:906:f43:: with SMTP id
 h3mr29009091ejj.267.1629587651408; 
 Sat, 21 Aug 2021 16:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20210819022327.13040-4-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Aug 2021 07:14:00 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9BUZ3x01FXY=UKmcrqGxmP7bfpqyz7zCJXK=+2xUhrYA@mail.gmail.com>
Message-ID: <CAAOTY_9BUZ3x01FXY=UKmcrqGxmP7bfpqyz7zCJXK=+2xUhrYA@mail.gmail.com>
Subject: Re: [PATCH v8 03/13] dt-bindings: mediatek: add mediatek, dsc.yaml for
 mt8195 SoC binding
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
X-CRM114-CacheID: sfid-20210821_161414_226628_AA94CFDA 
X-CRM114-Status: GOOD (  19.43  )
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
MjAyMeW5tDjmnIgxOeaXpSDpgLHlm5sg5LiK5Y2IMTA6MjPlr6vpgZPvvJoKPgo+IDEuIEFkZCBt
ZWRpYXRlayxkc2MueWFtbCB0byBkZXNjcmliZSBEU0MgbW9kdWxlIGluIGRldGFpbHMuCj4gMi4g
QWRkIG10ODE5NSBTb0MgYmluZGluZyB0byBtZWRpYXRlayxkc2MueWFtbC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
Li4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwgICAgICAgIHwgNjkgKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbWwKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2MueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlh
dGVrLGRzYy55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmY5NGE5NWM2YTFjNQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkc2MueWFtbAo+IEBAIC0w
LDAgKzEsNjkgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sIwo+ICsk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiAr
Cj4gK3RpdGxlOiBtZWRpYXRlayBkaXNwbGF5IERTQyBjb250cm9sbGVyCj4gKwo+ICttYWludGFp
bmVyczoKPiArICAtIENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+CgpBY2NvcmRpbmcgdG8gWzFd
LCB0aGUgbWFpbnRhaW5lciBzaG91bGQgYmUKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBr
ZXJuZWwub3JnPiwgUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KClsxXSBo
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9jZXNzL21haW50YWluZXJz
Lmh0bWwKCj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFRoZSBEU0Mgc3RhbmRhcmQgaXMgYSBz
cGVjaWZpY2F0aW9uIG9mIHRoZSBhbGdvcml0aG1zIHVzZWQgZm9yCj4gKyAgY29tcHJlc3Npbmcg
YW5kIGRlY29tcHJlc3NpbmcgaW1hZ2UgZGlzcGxheSBzdHJlYW1zLCBpbmNsdWRpbmcKPiArICB0
aGUgc3BlY2lmaWNhdGlvbiBvZiB0aGUgc3ludGF4IGFuZCBzZW1hbnRpY3Mgb2YgdGhlIGNvbXBy
ZXNzZWQKPiArICB2aWRlbyBiaXQgc3RyZWFtLiBEU0MgaXMgZGVzaWduZWQgZm9yIHJlYWwtdGlt
ZSBzeXN0ZW1zIHdpdGgKPiArICByZWFsLXRpbWUgY29tcHJlc3Npb24sIHRyYW5zbWlzc2lvbiwg
ZGVjb21wcmVzc2lvbiBhbmQgRGlzcGxheS4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0
aWJsZToKPiArICAgIG9uZU9mOgo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBjb25z
dDogbWVkaWF0ZWssbXQ4MTk1LWRpc3AtZHNjCj4gKwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1z
OiAxCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9j
a3M6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogRFNDIFdyYXBwZXIgQ2xv
Y2sKPiArCj4gKyAgcG93ZXItZG9tYWluczoKPiArICAgIGRlc2NyaXB0aW9uOiBBIHBoYW5kbGUg
YW5kIFBNIGRvbWFpbiBzcGVjaWZpZXIgYXMgZGVmaW5lZCBieSBiaW5kaW5ncyBvZgo+ICsgICAg
ICB0aGUgcG93ZXIgY29udHJvbGxlciBzcGVjaWZpZWQgYnkgcGhhbmRsZS4gU2VlCj4gKyAgICAg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlci1kb21haW4ueWFt
bCBmb3IgZGV0YWlscy4KPiArCj4gKyAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWc6Cj4gKyAgICAg
IGRlc2NyaXB0aW9uOgo+ICsgICAgICAgIFRoZSByZWdpc3RlciBvZiBkaXNwbGF5IGZ1bmN0aW9u
IGJsb2NrIHRvIGJlIHNldCBieSBnY2UuIFRoZXJlIGFyZSA0IGFyZ3VtZW50cywKPiArICAgICAg
ICBzdWNoIGFzIGdjZSBub2RlLCBzdWJzeXMgaWQsIG9mZnNldCBhbmQgcmVnaXN0ZXIgc2l6ZS4g
VGhlIHN1YnN5cyBpZCB0aGF0IGlzCj4gKyAgICAgICAgbWFwcGluZyB0byB0aGUgcmVnaXN0ZXIg
b2YgZGlzcGxheSBmdW5jdGlvbiBibG9ja3MgaXMgZGVmaW5lZCBpbiB0aGUgZ2NlIGhlYWRlcgo+
ICsgICAgICAgIGluY2x1ZGUvaW5jbHVkZS9kdC1iaW5kaW5ncy9nY2UvPGNoaXA+LWdjZS5oIG9m
IGVhY2ggY2hpcHMuCj4gKyAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3BoYW5kbGUtYXJyYXkKPiArICAgICAgbWF4SXRlbXM6IDEKPiArCj4gK3JlcXVpcmVkOgo+
ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0gcmVnCj4gKyAgLSBpbnRlcnJ1cHRzCj4gKyAgLSBwb3dl
ci1kb21haW5zCj4gKyAgLSBjbG9ja3MKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZQo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKwo+ICsgICAgZHNjMDogZGlzcF9kc2Nfd3Jh
cEAxYzAwOTAwMCB7Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZGlz
cC1kc2MiOwo+ICsgICAgICAgIHJlZyA9IDwwIDB4MWMwMDkwMDAgMCAweDEwMDA+Owo+ICsgICAg
ICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA2NDUgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKPiAr
ICAgICAgICBwb3dlci1kb21haW5zID0gPCZzcG0gTVQ4MTk1X1BPV0VSX0RPTUFJTl9WRE9TWVMw
PjsKPiArICAgICAgICBjbG9ja3MgPSA8JnZkb3N5czAgQ0xLX1ZETzBfRFNDX1dSQVAwPjsKPiAr
ICAgICAgICBtZWRpYXRlayxnY2UtY2xpZW50LXJlZyA9IDwmZ2NlMSBTVUJTWVNfMWMwMFhYWFgg
MHg5MDAwIDB4MTAwMD47Cj4gKyAgICB9Owo+ICsKPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
