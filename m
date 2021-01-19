Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E79C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 02:56:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1106D206C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 02:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1106D206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vCkQ626fttSiXjrD3G+QpUxrMWvl69Vluoz/6tG4IRM=; b=bYAtfl/pv2AdZhHnwKe+R51SW
	mDFrSnAkHEO/j+7Ua7H8Ea+5cRf1UAo85ilCqf3wMjcdxyXesg5Tsv6HokapUJzBJIb4InPFt/Uu/
	RdR9HYq4/rU1+3fwreqMvhzMcVGoYLJKqYU1L0X2PtpkEvxbcv4LJYz5Pl0+X3V/qEu6wOMSzgdeX
	A/u7xKSRVAGttu1l0ccx9rLrUFUcoamh1Dcg4+CUOoPZS/vDvTX/Q5JrNVBayZ6gJnms6jUVJok8u
	snHi9xDtigssp2tBu/WKrrDtl2ik3AzjA+ojIPacSAFtBz474B2mtW6K4Bqz1nJIitmWffyvqF0MU
	Zo7gL5USQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1hCI-0005sG-Ox; Tue, 19 Jan 2021 02:56:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1hCG-0005rU-PD; Tue, 19 Jan 2021 02:56:45 +0000
X-UUID: 3bf93c0cdb784f27bd000cd1ab33cb2f-20210118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kxFyn1AZxhKqZ1SIYi6HYqKFC/zDiZFn6yPxE4yDwMk=; 
 b=q8fdSLHWp7oxoB+hml8Rh7xLFU/ZoLq3mona/InyqrCAdfx2LO2ItCrWLUfKyM9olbqUvpb6jBR8B1SkhMlQNnDhtWkiW00BTrGj8Ly7X7r7bxTmvI79TbBq+Rz87eWRQ6FtXuKH/o11OnvGHmbgYFMOxJrRiUhQxPmOSFJDEgM=;
X-UUID: 3bf93c0cdb784f27bd000cd1ab33cb2f-20210118
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2078375887; Mon, 18 Jan 2021 18:56:42 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Jan 2021 18:56:37 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Jan 2021 10:56:29 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jan 2021 10:56:22 +0800
Message-ID: <1611024980.11995.19.camel@mhfsdcap03>
Subject: Re: [PATCH next 03/15] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 19 Jan 2021 10:56:20 +0800
In-Reply-To: <CAAOTY_8FV87MTSi_Mc2MA3uWzCUBcpCC5Sne2Wc6X1R57EiCkw@mail.gmail.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-3-chunfeng.yun@mediatek.com>
 <CAAOTY_8FV87MTSi_Mc2MA3uWzCUBcpCC5Sne2Wc6X1R57EiCkw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E96D8BDB3A35A03C4C66CD2581F0D687AFBC8D69C347B6286F3A25F273C2236E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_215644_945264_DBBE9072 
X-CRM114-Status: GOOD (  18.49  )
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
Cc: DTML <devicetree@vger.kernel.org>, Min Guo <min.guo@mediatek.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIxLTAxLTE4IGF0IDIyOjU2ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgQ2h1bmZlbmc6DQo+IA0KPiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRl
ay5jb20+IOaWvCAyMDIx5bm0MeaciDE25pelIOmAseWFrSDkuIvljYg1OjA35a+r6YGT77yaDQo+
ID4NCj4gPiBUaGUgY29tcGF0aWxiZSAibWVkaWF0ZWssbXQ3NjIzLW1pcGktdHgiIGlzIG5vdCBz
dXBwb3J0ZWQgaW4gZHJpdmVyLA0KPiA+IGFuZCBpbiBmYWN0IHVzZXMgIm1lZGlhdGVrLG10Mjcw
MS1taXBpLXR4IiBpbnN0ZWFkIG9uIE1UNzYyMywgc28gY2hhbmdlcw0KPiA+IHRoZSBjb21wYXRp
YmxlIGl0ZW1zIHRvIG1ha2UgZGVwZW5kZW5jZSBjbGVhci4NCj4gPg0KPiA+IEFuZCBhZGQgYW4g
b3B0aW9uYWwgImNsb2NrLW5hbWVzIiBwcm9wZXJ0eSwgaXQncyBub3QgdXNlZCB0byBnZXQgdGhl
IGNsb2NrLA0KPiA+IGJ1dCBzb21lIERUUyBmaWxlcyBwcm92aWRlIGl0Lg0KPiANCj4gU2VwYXJh
dGUgdGhlIGNsb2NrIHBhcnQgdG8gYW5vdGhlciBwYXRjaC4NCk9rLCB3aWxsIGRvIGl0Lg0KDQo+
IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCj4gPg0KPiA+IENjOiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4NCj4gPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56
YWJlbEBwZW5ndXRyb25peC5kZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNo
dW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9waHkv
bWVkaWF0ZWssZHNpLXBoeS55YW1sICAgICAgICAgIHwgMTcgKysrKysrKysrKysrLS0tLS0NCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9t
ZWRpYXRlayxkc2ktcGh5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGh5L21lZGlhdGVrLGRzaS1waHkueWFtbA0KPiA+IGluZGV4IDcxZDRhY2VhMWY2Ni4uYWY2ZTU1
NGM1YjY5IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwNCj4gPiBAQCAtMTksMTEg
KzE5LDE0IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgICBwYXR0ZXJuOiAiXmRzaS1waHlAWzAtOWEt
Zl0rJCINCj4gPg0KPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4gLSAgICBlbnVtOg0KPiA+IC0gICAg
ICAtIG1lZGlhdGVrLG10MjcwMS1taXBpLXR4DQo+ID4gLSAgICAgIC0gbWVkaWF0ZWssbXQ3NjIz
LW1pcGktdHgNCj4gPiAtICAgICAgLSBtZWRpYXRlayxtdDgxNzMtbWlwaS10eA0KPiA+IC0gICAg
ICAtIG1lZGlhdGVrLG10ODE4My1taXBpLXR4DQo+ID4gKyAgICBvbmVPZjoNCj4gPiArICAgICAg
LSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAtIG1l
ZGlhdGVrLG10NzYyMy1taXBpLXR4DQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxt
dDI3MDEtbWlwaS10eA0KPiA+ICsgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDI3MDEtbWlwaS10
eA0KPiA+ICsgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxNzMtbWlwaS10eA0KPiA+ICsgICAg
ICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxODMtbWlwaS10eA0KPiA+DQo+ID4gICAgcmVnOg0KPiA+
ICAgICAgbWF4SXRlbXM6IDENCj4gPiBAQCAtMzIsNiArMzUsMTAgQEAgcHJvcGVydGllczoNCj4g
PiAgICAgIGl0ZW1zOg0KPiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiBQTEwgcmVmZXJlbmNlIGNs
b2NrDQo+ID4NCj4gPiArICBjbG9jay1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAg
ICAtIGNvbnN0OiByZWYNCj4gPiArDQo+ID4gICAgY2xvY2stb3V0cHV0LW5hbWVzOg0KPiA+ICAg
ICAgbWF4SXRlbXM6IDENCj4gPg0KPiA+IC0tDQo+ID4gMi4xOC4wDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
