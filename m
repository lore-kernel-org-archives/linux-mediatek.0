Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1123C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 16:13:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 962EA61168
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 16:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 962EA61168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyrwISfuhBlmXHFr5mo7++EsMzHY7lVFLEQxI2KULhY=; b=xrVnVmN4VaFWkw
	142WTpfGm2U/HY+acmgWCqMZ4v8/j0p07Mb/OdOPuxxCUBSM24IAgTj0zVlOVr7GkhSmbzSYY/CwK
	iqBfQPfT3cwWLiI3JHwuuoOEBUO0+66t7Z3rQ8Z/Q7nY0BnUQ5KttvDX4VspNfAUKlCSvKM9GyRH+
	D+w0e41GtQ++5AkoTKovWOgJO+YuCWVZBcZYgEPfqBFqQm9iHYUIfQwX8boE2sbYq4gIjoEJY5lVK
	/diSoMBh2OnGm/9yUre2Bjvd9maEM/c+mEq5XMQuKlvnyg33FvC7psYJXyi7pypp1Gy6OpdXeXHl4
	lq/tbP+qqdIr492V53Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT4sP-00950s-EY; Wed, 22 Sep 2021 16:13:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT4sA-0094wQ-Di; Wed, 22 Sep 2021 16:13:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F6C96120F;
 Wed, 22 Sep 2021 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632327205;
 bh=k2Pj+TuZexZ6ukjV1H0j47mTKTEdHbsKE38t9ELGnwg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ss/t7YRtW4/pQQEQUBPntkIYXMZJu1oNsMVRHoU7WVsfEvF/Bin3so4Jur818nglt
 spUunv61xYEGWmqSfbZWff9/3nAjsjTGzjnjHtwyqpoztZPDdwTygO2P0a/76J8sMw
 eQyvGTIcefsJE1QATzbNab7J7wJc2GOi6FP9ClcuKbM05KTAoof7OJ3onnCnUKjTGW
 Zuc5BnTzCNN7ftVuY8R7khqroCJuET4/xQAdylFoeWEPHdqJwPKG218b2HoUPkSPZy
 bkZBDyX00TXR8EqIjjwsi+TUo9AmHHyP2UK/zmP994TvDvXpuIhaVv3fdfj/vzcVHt
 2ZoLgB7FPewWQ==
Received: by mail-ed1-f50.google.com with SMTP id eg28so12109889edb.1;
 Wed, 22 Sep 2021 09:13:25 -0700 (PDT)
X-Gm-Message-State: AOAM531jiAWGTdB7Je5keXY2sxDeb7EwECCQOGQyM0oyy8shdtI001jB
 KBfEOwg6Nh+bIPKD4b2llw9KSb797QVjjPljDw==
X-Google-Smtp-Source: ABdhPJz0EFOiG8RAy7xNyqTHM9kZtLsTE6kn0uXnl1IvG1FgKwEubeYEUB8kZr/WOB+y08WZzwtJ8r8/AvNNj4hXTTI=
X-Received: by 2002:a17:907:995a:: with SMTP id
 kl26mr454695ejc.6.1632327204098; 
 Wed, 22 Sep 2021 09:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210907083723.7725-1-granquet@baylibre.com>
 <20210907083723.7725-4-granquet@baylibre.com>
In-Reply-To: <20210907083723.7725-4-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 23 Sep 2021 00:13:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8FC-sP0PP0Fv6G-2cwUDp6mDLx_3JmmSc144NSCyULXw@mail.gmail.com>
Message-ID: <CAAOTY_8FC-sP0PP0Fv6G-2cwUDp6mDLx_3JmmSc144NSCyULXw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: phy: Add binding for Mediatek MT8195
 HDMI PHY
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-phy@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_091326_550921_DB9C4A34 
X-CRM114-Status: GOOD (  16.89  )
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

SGksIEd1aWxsYXVtZToKCkd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+
IOaWvCAyMDIx5bm0OeaciDfml6Ug6YCx5LqMIOS4i+WNiDQ6Mznlr6vpgZPvvJoKPgo+IEFkZCBi
aW5kaW5ncyB0byBkZXNjcmliZSBNZWRpYXRlayBNVDgxOTUgSERNSSBQSFkKCk1vdmUgdGhpcyBw
YXRjaCBiZWZvcmUgdGhlIGRyaXZlciBwYXRjaCB3aGljaCByZWZlcmVuY2UgdGhpcyBwYXRjaC4K
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBHdWlsbGF1bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUu
Y29tPgo+IC0tLQo+ICAuLi4vcGh5L21lZGlhdGVrLG10azgxOTUtaGRtaS1waHkueWFtbCAgICAg
ICAgfCA3MSArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L21lZGlhdGVrLG10azgxOTUtaGRtaS1waHkueWFtbAoKSSB0aGluayB0aGlzIGZp
bGUgc2hvdWxkIGJlIG1lcmdlZCBpbnRvIG1lZGlhdGVrLGhkbWktcGh5LnlhbWwgWzFdLgoKWzFd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVk
aWF0ZWssaGRtaS1waHkueWFtbD9oPXY1LjE1LXJjMgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4K
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRp
YXRlayxtdGs4MTk1LWhkbWktcGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcGh5L21lZGlhdGVrLG10azgxOTUtaGRtaS1waHkueWFtbAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5mMDNiZDNhZjdmZDgKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxt
dGs4MTk1LWhkbWktcGh5LnlhbWwKPiBAQCAtMCwwICsxLDcxIEBACj4gKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ICsjIENvcHlyaWdo
dCAoYykgMjAyMCBNZWRpYVRlawo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvcGh5L21lZGlhdGVrLGhkbWktcGh5LnlhbWwjCj4gKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiAr
dGl0bGU6IE1lZGlhVGVrIEhpZ2ggRGVmaW5pdGlvbiBNdWx0aW1lZGlhIEludGVyZmFjZSAoSERN
SSkgUEhZIGJpbmRpbmcgZm9yIG10ODE5NQo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBDaHVu
LUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiArICAtIFBoaWxpcHAgWmFiZWwg
PHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gKyAgLSBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1
bkBtZWRpYXRlay5jb20+Cj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFRoZSBIRE1JIFBIWSBz
ZXJpYWxpemVzIHRoZSBIRE1JIGVuY29kZXIncyB0aHJlZSBjaGFubmVsIDEwLWJpdCBwYXJhbGxl
bAo+ICsgIG91dHB1dCBhbmQgZHJpdmVzIHRoZSBIRE1JIHBhZHMuCj4gKwo+ICtwcm9wZXJ0aWVz
Ogo+ICsgICRub2RlbmFtZToKPiArICAgIHBhdHRlcm46ICJeaGRtaS1waHlAWzAtOWEtZl0rJCIK
PiArCj4gKyAgY29tcGF0aWJsZToKPiArICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1oZG1p
LXBoeQo+ICsKPiArICByZWc6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBjbG9ja3M6Cj4g
KyAgICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogUExMIHJlZmVyZW5jZSBjbG9jawo+
ICsKPiArICBjbG9jay1uYW1lczoKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNvbnN0OiBoZG1p
X3h0YWxfc2VsCj4gKwo+ICsgIGNsb2NrLW91dHB1dC1uYW1lczoKPiArICAgIGl0ZW1zOgo+ICsg
ICAgICAtIGNvbnN0OiBoZG1pX3R4cGxsCj4gKwo+ICsgICIjcGh5LWNlbGxzIjoKPiArICAgIGNv
bnN0OiAwCj4gKwo+ICsgICIjY2xvY2stY2VsbHMiOgo+ICsgICAgY29uc3Q6IDAKPiArCj4gK3Jl
cXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0gcmVnCj4gKyAgLSBjbG9ja3MKPiArICAt
IGNsb2NrLW5hbWVzCj4gKyAgLSBjbG9jay1vdXRwdXQtbmFtZXMKPiArICAtICIjcGh5LWNlbGxz
Igo+ICsgIC0gIiNjbG9jay1jZWxscyIKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZQo+ICsKPiArZXhhbXBsZXM6Cj4gKyAgLSB8Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svbXQ4MTk1LWNsay5oPgo+ICsgICAgaGRtaV9waHk6IGhkbWktcGh5QDExZDVmMDAwIHsK
PiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS1oZG1pLXBoeSI7Cj4gKyAg
ICAgICAgcmVnID0gPDAgMHgxMWQ1ZjAwMCAwIDB4MTAwPjsKPiArICAgICAgICBjbG9ja3MgPSA8
JnRvcGNrZ2VuIENMS19UT1BfSERNSV9YVEFMPjsKPiArICAgICAgICBjbG9jay1uYW1lcyA9ICJo
ZG1pX3h0YWxfc2VsIjsKPiArICAgICAgICBjbG9jay1vdXRwdXQtbmFtZXMgPSAiaGRtaV90eHBs
bCI7Cj4gKyAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICsgICAgICAgICNwaHktY2VsbHMg
PSA8MD47Cj4gKyAgICB9Owo+ICsKPiArLi4uCj4gLS0KPiAyLjMxLjEKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
