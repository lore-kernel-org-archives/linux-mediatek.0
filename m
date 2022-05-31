Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C210C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 22:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZ6eLbhPZPAfidB5rD9+Q1xz8+jW9LS8d56JUDnx1f8=; b=N9L5YMxEISgnL5
	LWW4ELqykEbcFF+8yqdZeLcEv2FCXTbI8MFWezTXR62rnyZHZ0AJvq3M43B0XzIxkVp4PR1eAsRRv
	yQ6KtLupR8LORJr+HBCiluxnAsZjO1S2Ocb+obmJ9JiLjh+eUDHwhHarfpmGuWloLp0IrA4+PIa8y
	/rmM/zo6kWOTte5q3/1/A7XcbpyaRU54HAHhSezc2TljuR/6uFtDThm562RP3lV6CecE1UN5px77M
	gBpII/0qcaAQbBB4lkegFToVwyXOV3dOBYhmI8Oe0Kz4MjFghBfekJSmLpZrHQgZOPDzhkdQ5rGBs
	6Xd4zSD1M16KCrwY+xZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwADx-00CpbR-Jl; Tue, 31 May 2022 22:20:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwADb-00CpWS-VU; Tue, 31 May 2022 22:20:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id 5F16E1F43F21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654035602;
	bh=L1LFzcY2SS+Xz1rYP87W08WXZ151oxr1ApyX6lLzl/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IAn59devWIMazgWA7WDdvX0I0LbRSMtm0nt30y1Udmz5jAZFslhBo9e5n7YK7fr4W
	 IggvPxKYDtv/URk7XK+WQAN4SqG4qSi25nc7+qGTMaj++sWApmbJg1su2ka8Sjpn3m
	 OG6eJnctPu5ooxqe+axl14PPOjy0vt7vd9JTOeJjo5mSV8gSyexL0yRWNnX/Xds+2M
	 krTSzkWItWuGBkyIicZAvO+trl/anG7Wp/mJtZg9t9X/GC3/kHlhX08jFhhV6tBwqJ
	 rGgb3SsajXHC1uAJvTXPGzsaBfDtCbB8OaUf5jBuxeeStzOzDno/l3e+z9Ql+GbHNt
	 NxsgkrV/mPEpQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: mt8192: Use generic bias instead of pull-*-adv
Date: Tue, 31 May 2022 18:19:54 -0400
Message-Id: <20220531221954.160036-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531221954.160036-1-nfraprado@collabora.com>
References: <20220531221954.160036-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_152004_205194_FBDAEF32 
X-CRM114-Status: GOOD (  12.82  )
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

Q29tbWl0IGNhZmUxOWRiNzc1MSAoInBpbmN0cmw6IG1lZGlhdGVrOiBCYWNrd2FyZCBjb21wYXRp
YmxlIHRvIHByZXZpb3VzCk1lZGlhdGVrJ3MgYmlhcy1wdWxsIHVzYWdlIikgYWxsb3dlZCB0aGUg
Ymlhcy1wdWxsLXVwIGFuZCBiaWFzLXB1bGwtZG93bgpwcm9wZXJ0aWVzIHRvIGJlIHVzZWQgZm9y
IHNldHRpbmcgUFVQRC9SMS9SMCB0eXBlIGJpYXMgb24gbXRrLXBhcmlzCmJhc2VkIFNvQydzLCB3
aGljaCB3YXMgcHJldmlvdXNseSBvbmx5IHN1cHBvcnRlZCBieSB0aGUgY3VzdG9tCm1lZGlhdGVr
LHB1bGwtdXAtYWR2IGFuZCBtZWRpYXRlayxwdWxsLWRvd24tYWR2IHByb3BlcnRpZXMuCgpTaW5j
ZSB0aGUgYmlhcy1wdWxsLXt1cCxkb3dufSBwcm9wZXJ0aWVzIGFscmVhZHkgaGF2ZSBkZWZpbmVz
IGFzc29jaWF0ZWQKdGh1cyBiZWluZyBtb3JlIGRlc2NyaXB0aXZlIGFuZCBpcyBtb3JlIHVuaXZl
cnNhbCBvbiBNZWRpYVRlayBwbGF0Zm9ybXMsCmFuZCBnaXZlbiB0aGF0IHRoZXJlIGFyZSBubyBt
ZWRpYXRlayxwdWxsLXt1cCxkb3dufS1hZHYgdXNlcnMgb24gbXQ4MTkyCnlldCwgcmVtb3ZlIHRo
ZSBjdXN0b20gYWR2IHByb3BlcnRpZXMgaW4gZmF2b3Igb2YgdGhlIGdlbmVyaWMgb25lcy4KCk5v
dGUgdGhhdCBvbmx5IG1lZGlhdGVrLHB1bGwtdXAtYWR2IHdhcyBtZXJnZWQgaW4gdGhlIGJpbmRp
bmcsIGJ1dCBub3QKaXRzIGRvd24gY291bnRlcnBhcnQuCgpXaGlsZSBhdCBpdCwgYWxzbyBhZGQg
J2lmJyBibG9ja3MgdG8gcHJldmVudCBiaWFzLWRpc2FibGUsIGJpYXMtcHVsbC11cAphbmQgYmlh
cy1wdWxsLWRvd24gdG8gYmUgdXNlZCB0b2dldGhlciwgc2luY2UgdGhleSdyZSBtdXR1YWxseQpl
eGNsdXNpdmUuCgpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXBy
YWRvQGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2Nj
aGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgoKLS0tCgpDaGFuZ2VzIGluIHYyOgotIERyb3Bw
ZWQgRml4ZXMgdGFnCi0gQWRkZWQgJ2lmJyBibG9ja3MgdG8gbWFrZSBiaWFzLWRpc2FibGUsIGJp
YXMtcHVsbC11cCBhbmQKICBiaWFzLXB1bGwtZG93biBtdXR1YWxseSBleGNsdXNpdmUKCiAuLi4v
YmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sICAgICAgfCA0NCArKysrKysrKysr
KysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0
cmwvcGluY3RybC1tdDgxOTIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwKaW5kZXggYzgwOTJiMjE4ZjJmLi42Y2U3ZTQ1
OGQ2ZmUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5j
dHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbApAQCAtODMsMjAgKzgzLDIxIEBAIHBh
dHRlcm5Qcm9wZXJ0aWVzOgogICAgICAgICAgIGRyaXZlLXN0cmVuZ3RoLW1pY3JvYW1wOgogICAg
ICAgICAgICAgZW51bTogWzEyNSwgMjUwLCA1MDAsIDEwMDBdCiAKLSAgICAgICAgICBtZWRpYXRl
ayxwdWxsLXVwLWFkdjoKLSAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Ci0gICAgICAgICAgICAg
IFB1bGwgdXAgc2V0dGluZ3MgZm9yIDIgcHVsbCByZXNpc3RvcnMsIFIwIGFuZCBSMS4gVXNlciBj
YW4KLSAgICAgICAgICAgICAgY29uZmlndXJlIHRob3NlIHNwZWNpYWwgcGlucy4gVmFsaWQgYXJn
dW1lbnRzIGFyZSBkZXNjcmliZWQgYXMgYmVsb3c6Ci0gICAgICAgICAgICAgIDA6IChSMSwgUjAp
ID0gKDAsIDApIHdoaWNoIG1lYW5zIFIxIGRpc2FibGVkIGFuZCBSMCBkaXNhYmxlZC4KLSAgICAg
ICAgICAgICAgMTogKFIxLCBSMCkgPSAoMCwgMSkgd2hpY2ggbWVhbnMgUjEgZGlzYWJsZWQgYW5k
IFIwIGVuYWJsZWQuCi0gICAgICAgICAgICAgIDI6IChSMSwgUjApID0gKDEsIDApIHdoaWNoIG1l
YW5zIFIxIGVuYWJsZWQgYW5kIFIwIGRpc2FibGVkLgotICAgICAgICAgICAgICAzOiAoUjEsIFIw
KSA9ICgxLCAxKSB3aGljaCBtZWFucyBSMSBlbmFibGVkIGFuZCBSMCBlbmFibGVkLgotICAgICAg
ICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCi0gICAg
ICAgICAgICBlbnVtOiBbMCwgMSwgMiwgM10KLQotICAgICAgICAgIGJpYXMtcHVsbC1kb3duOiB0
cnVlCi0KLSAgICAgICAgICBiaWFzLXB1bGwtdXA6IHRydWUKKyAgICAgICAgICBiaWFzLXB1bGwt
ZG93bjoKKyAgICAgICAgICAgIG9uZU9mOgorICAgICAgICAgICAgICAtIHR5cGU6IGJvb2xlYW4K
KyAgICAgICAgICAgICAgICBkZXNjcmlwdGlvbjogbm9ybWFsIHB1bGwgZG93bi4KKyAgICAgICAg
ICAgICAgLSBlbnVtOiBbMTAwLCAxMDEsIDEwMiwgMTAzXQorICAgICAgICAgICAgICAgIGRlc2Ny
aXB0aW9uOiBQVVBEL1IxL1IwIHB1bGwgZG93biB0eXBlLiBTZWUgTVRLX1BVUERfU0VUX1IxUjBf
CisgICAgICAgICAgICAgICAgICBkZWZpbmVzIGluIGR0LWJpbmRpbmdzL3BpbmN0cmwvbXQ2NXh4
LmguCisKKyAgICAgICAgICBiaWFzLXB1bGwtdXA6CisgICAgICAgICAgICBvbmVPZjoKKyAgICAg
ICAgICAgICAgLSB0eXBlOiBib29sZWFuCisgICAgICAgICAgICAgICAgZGVzY3JpcHRpb246IG5v
cm1hbCBwdWxsIHVwLgorICAgICAgICAgICAgICAtIGVudW06IFsxMDAsIDEwMSwgMTAyLCAxMDNd
CisgICAgICAgICAgICAgICAgZGVzY3JpcHRpb246IFBVUEQvUjEvUjAgcHVsbCB1cCB0eXBlLiBT
ZWUgTVRLX1BVUERfU0VUX1IxUjBfCisgICAgICAgICAgICAgICAgICBkZWZpbmVzIGluIGR0LWJp
bmRpbmdzL3BpbmN0cmwvbXQ2NXh4LmguCiAKICAgICAgICAgICBiaWFzLWRpc2FibGU6IHRydWUK
IApAQCAtMTIzLDYgKzEyNCwyMSBAQCBwYXR0ZXJuUHJvcGVydGllczoKICAgICAgICAgICAgICAg
cHJvcGVydGllczoKICAgICAgICAgICAgICAgICBkcml2ZS1zdHJlbmd0aDogZmFsc2UKIAorICAg
ICAgICAgIC0gaWY6CisgICAgICAgICAgICAgIHJlcXVpcmVkOgorICAgICAgICAgICAgICAgIC0g
Ymlhcy1kaXNhYmxlCisgICAgICAgICAgICB0aGVuOgorICAgICAgICAgICAgICBwcm9wZXJ0aWVz
OgorICAgICAgICAgICAgICAgIGJpYXMtcHVsbC11cDogZmFsc2UKKyAgICAgICAgICAgICAgICBi
aWFzLXB1bGwtZG93bjogZmFsc2UKKworICAgICAgICAgIC0gaWY6CisgICAgICAgICAgICAgIHJl
cXVpcmVkOgorICAgICAgICAgICAgICAgIC0gYmlhcy1wdWxsLXVwCisgICAgICAgICAgICB0aGVu
OgorICAgICAgICAgICAgICBwcm9wZXJ0aWVzOgorICAgICAgICAgICAgICAgIGJpYXMtcHVsbC1k
b3duOiBmYWxzZQorCiAgICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQogCiBhbGxP
ZjoKLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
