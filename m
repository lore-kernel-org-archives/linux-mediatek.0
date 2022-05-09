Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6430C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+47WPBwlvQHrzgATBp55lJaZWWyUmk0PVrpCrIPe6Y=; b=KjwLOhZ5YJlroK
	AxPhT397nz1k0RukaA2wWW1NcQXKFCr5VQ0hdjTTmAAGMSXAkq3xxPgQeEdaeBcWuAlV9rYXnNhjZ
	9UC+hSFaKSjbBTi/Jca/96kiAlvEAC0H4+eCIj0w0sObyiVoTr5FoGmes9fqULuCX/1a1YWpGoBuK
	8pBesjT1rT8aR3GEzHtkRFpji1UJHEzfuH/MR4IziR4Li58vzVhgKGe9oBkRDJG6dWckkT0AG6f0i
	aq62HtJ+dPAr3LKBuMPAk1BZ+2wjfm33rbUNAp63y1rxTwLvTUmuZbrxkWjSUUdZHJq/jDmFhdnBl
	cCtP8ZIFwI7pTr13UI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no71D-00FYQf-AO; Mon, 09 May 2022 17:17:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no712-00FYN3-10; Mon, 09 May 2022 17:17:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 675B6B81160;
 Mon,  9 May 2022 17:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4641CC385B2;
 Mon,  9 May 2022 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652116665;
 bh=/vK4hUOw5XVzRCz9/q9BHaDHH7etX4k7UQOvk8DgWS8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gCsrO0C+bYZ/fHs1oJCf4AMGfTrJSzwOMuhCfjt/XmGRTrgzPIR+B6p9NmeMLZLCD
 4LudReQE+eKCtnC9S7sQ3LZ3xJwwh9xwHEUCqWGLixZsWJR/WwX9nfkEjBGwSQ4Cx4
 Wwo3bqP0R3R45UaLPOeLY4um28DSZm8LC7AA2kU3pPnxayOW3zvdRnXQGWLW5Rjrm2
 PwLjzvdU67ApymHm6qL8R0fes/Bhkw73qWkujPLE0gIVrVfxA6XYzo/ZfE02zriWpa
 vMKnO8zadPBp46V5WSXYRGii3ty1lYnyuehqGWxEcWlbY/YAZ1tRRR4RxaSYWHkVUY
 IcChFz6cpW/mw==
From: Mark Brown <broonie@kernel.org>
To: nfraprado@collabora.com
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jiaxin.yu@mediatek.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 shane.chien@mediatek.com, linux-mediatek@lists.infradead.org,
 lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, kernel@collabora.com,
 tzungbi@google.com
In-Reply-To: <20220429203039.2207848-1-nfraprado@collabora.com>
References: <20220429203039.2207848-1-nfraprado@collabora.com>
Subject: Re: [PATCH 0/3] Add missing dt-binding properties for audio
 components on mt8192-asurada
Message-Id: <165211666198.1065748.1151009730882312510.b4-ty@kernel.org>
Date: Mon, 09 May 2022 18:17:41 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_101748_246192_124B76B0 
X-CRM114-Status: GOOD (  13.81  )
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

T24gRnJpLCAyOSBBcHIgMjAyMiAxNjozMDozNiAtMDQwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gd3JvdGU6Cj4gVGhlc2UgcGF0Y2hlcyBhZGQgcHJvcGVydGllcyB0aGF0IHdlcmUgbWlzc2lu
ZyBvbiB0aGUgZHQtYmluZGluZ3Mgb2YgdGhlCj4gYXVkaW8gY29tcG9uZW50cyB1c2VkIGJ5IG10
ODE5Mi1hc3VyYWRhLiBOYW1lbHkgdGhlIGkycy1zaGFyZQo+IHByb3BlcnRpZXMgZm9yIHRoZSBz
b3VuZCBwbGF0Zm9ybSBhbmQgdGhlICNzb3VuZC1kYWktY2VsbHMgb24gdGhlCj4gcnQxMDE1cCBh
bmQgcnQ1NjgyIGNvZGVjcyB3aGVuIHRoZXkncmUgcmVmZXJlbmNlZCBieSB0aGUgbWFjaGluZSBz
b3VuZAo+IG5vZGUuCj4gCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8KCiAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc291bmQuZ2l0IGZvci1u
ZXh0CgpUaGFua3MhCgpbMS8zXSBBU29DOiBkdC1iaW5kaW5nczogbWVkaWF0ZWs6IG10ODE5Mjog
QWRkIGkycy1zaGFyZSBwcm9wZXJ0aWVzCiAgICAgIGNvbW1pdDogZTA1NmNmNDM0MWFlM2Y4NTZm
MWUzOGRhMDJiMjdjYjA0ZGU0YzY5YgpbMi8zXSBBU29DOiBkdC1iaW5kaW5nczogcnQxMDE1cDog
QWRkICNzb3VuZC1kYWktY2VsbHMKICAgICAgY29tbWl0OiAyZjQ1NTM2NTg3ZTUzYTdhMjIwMjRl
MTJmYmU5N2VmMTM1OThlNjIzClszLzNdIEFTb0M6IGR0LWJpbmRpbmdzOiBydDU2ODI6IEFkZCAj
c291bmQtZGFpLWNlbGxzCiAgICAgIGNvbW1pdDogMGFkY2NhZjFlYWM5MWEyYzJlZTZhNTRhNmRl
MDQyYWZmZTk4NjBmNAoKQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwgYmUg
aW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0CnRyZWUgKHVzdWFsbHkgc29tZXRpbWUgaW4g
dGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZwp0aGUgbmV4dCBtZXJn
ZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dldmVyIGlmCnByb2Js
ZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJldmVy
dGVkLgoKWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBmcm9tIGF1dG9tYXRl
ZCBvciBtYW51YWwgdGVzdGluZwphbmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5nYWdl
IHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQKc2VuZCBmb2xsb3d1cCBwYXRjaGVz
IGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuCgpJZiBh
bnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIgY2hh
bmdlcyB0aGV5CnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdhaW5zdCBj
dXJyZW50IGdpdCwgZXhpc3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBsYWNlZC4KClBsZWFz
ZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUgQ0NzIHdoZW4g
cmVwbHlpbmcKdG8gdGhpcyBtYWlsLgoKVGhhbmtzLApNYXJrCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
