Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2D3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBFtS18Sr1l8etGH0ZL09vl06n/NKqkFpP9NB1heLYU=; b=KzYGdIG5qXPO6v
	FXJoV+Vi5HMWAeMDdvN0vIzN4lprZBGchFiK7dHE5kIULJSGSRCAQkmclTrrnpz5sSobFoh7Ryu1I
	oCDCctuFjhffB9WRtRJ5kJaPbW3tQADLj8srYDfc+pZN5Y7xry4oAb57mToi91+AYrB/LQaa59nb0
	S+n9PgJjyxIYsApb/5N/sVLR/JXOFEbPiRUeFwdISnPvo2yvugPMum1q0yJD7dSHK4wJDgBSW+PB+
	JDbDW83f1Y9ks1+i4/QgdLry/HoMDHAPvexvklT99eXa4KgHKoCF/31ug2ujQY8AGp2g1+jMSDlB4
	3kskhCWNkO5l+uC54Btw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrgw-00EV16-Bm; Wed, 23 Feb 2022 13:28:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMrgi-00EUwb-Ke; Wed, 23 Feb 2022 13:28:14 +0000
X-UUID: 0afd1228671a487bab3c350ba33db9df-20220223
X-UUID: 0afd1228671a487bab3c350ba33db9df-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 33690730; Wed, 23 Feb 2022 06:28:06 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 05:28:04 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Feb 2022 21:27:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 21:27:50 +0800
Message-ID: <57134fc2b9405d88e04a9e4c12be7c2f1d2998c4.camel@mediatek.com>
Subject: Re: [PATCH v2 07/23] arm64: dts: mt8192: Add xhci node
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Date: Wed, 23 Feb 2022 21:27:50 +0800
In-Reply-To: <20220222202803.7mkskda3nsjrunpx@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-8-allen-kh.cheng@mediatek.com>
 <20220222202803.7mkskda3nsjrunpx@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_052812_955400_15DD3BB3 
X-CRM114-Status: GOOD (  19.78  )
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

T24gVHVlLCAyMDIyLTAyLTIyIGF0IDE1OjI4IC0wNTAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBGcmksIEZlYiAxOCwgMjAyMiBhdCAwNToxNjoxN1BNICswODAwLCBBbGxl
bi1LSCBDaGVuZyB3cm90ZToKPiA+IEFkZCB4aGNpIG5vZGUgZm9yIG10ODE5MiBTb0MuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxhbGxlbi1raC5jaGVuZ0BtZWRpYXRl
ay5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5k
dHNpIHwgMjUKPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAyNSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTkyLmR0c2kKPiA+IGluZGV4IGNlMThkNjkyMTc1Zi4uMDhjN2MxYzc3MmY1IDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4g
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+ID4gQEAgLTEw
LDYgKzEwLDcgQEAKPiA+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xs
ZXIvYXJtLWdpYy5oPgo+ID4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9pcnEuaD4KPiA+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9tdDgxOTItcGlu
ZnVuYy5oPgo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waHkvcGh5Lmg+Cj4gPiAgI2luY2x1
ZGUgPGR0LWJpbmRpbmdzL3Bvd2VyL210ODE5Mi1wb3dlci5oPgo+ID4gIAo+ID4gIC8gewo+ID4g
QEAgLTcxOCw2ICs3MTksMzAgQEAKPiA+ICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gIAkJ
fTsKPiA+ICAKPiA+ICsJCXhoY2k6IHhoY2lAMTEyMDAwMDAgewo+IAo+IEFjY29yZGluZyB0byBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10ay0KPiB4aGNp
LnlhbWwsIHRoaXMKPiBub2RlIHNob3VsZCBiZSBjYWxsZWQgdXNiIChidXQgdGhlIGxhYmVsIGNh
biBiZSBrZXB0IGFzIHhoY2kpLgoKSGkgTsOtY29sYXMsCgpvaywgSSB3aWxsIGZpeCB0aGlzLiBU
aGFua3MgZm9yIHN1Z2dlc3Rpb24uCgo+ID4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTkyLXhoY2kiLAo+ID4gKwkJCQkgICAgICJtZWRpYXRlayxtdGsteGhjaSI7Cj4gPiArCQkJcmVn
ID0gPDAgMHgxMTIwMDAwMCAwIDB4MTAwMD4sCj4gPiArCQkJICAgICAgPDAgMHgxMTIwM2UwMCAw
IDB4MDEwMD47Cj4gPiArCQkJcmVnLW5hbWVzID0gIm1hYyIsICJpcHBjIjsKPiA+ICsJCQlpbnRl
cnJ1cHRzLWV4dGVuZGVkID0gPCZnaWMgR0lDX1NQSSA5Nwo+ID4gSVJRX1RZUEVfTEVWRUxfSElH
SCAwPjsKPiA+ICsJCQlpbnRlcnJ1cHQtbmFtZXMgPSAiaG9zdCI7Cj4gPiArCQkJcGh5cyA9IDwm
dTJwb3J0MCBQSFlfVFlQRV9VU0IyPiwKPiA+ICsJCQkgICAgICAgPCZ1M3BvcnQwIFBIWV9UWVBF
X1VTQjM+Owo+ID4gKwkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4KPiA+IENMS19UT1Bf
VVNCX1RPUF9TRUw+LAo+ID4gKwkJCQkJICA8JnRvcGNrZ2VuCj4gPiBDTEtfVE9QX1NTVVNCX1hI
Q0lfU0VMPjsKPiA+ICsJCQlhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZ0b3Bja2dlbgo+ID4g
Q0xLX1RPUF9VTklWUExMX0Q1X0Q0PiwKPiA+ICsJCQkJCQkgPCZ0b3Bja2dlbgo+ID4gQ0xLX1RP
UF9VTklWUExMX0Q1X0Q0PjsKPiA+ICsJCQljbG9ja3MgPSA8JmluZnJhY2ZnIENMS19JTkZSQV9T
U1VTQj4sCj4gPiArCQkJCSA8JmluZnJhY2ZnIENMS19JTkZSQV9TU1VTQl9YSENJPiwKPiA+ICsJ
CQkJIDwmYXBtaXhlZHN5cyBDTEtfQVBNSVhFRF9VU0JQTEw+Owo+ID4gKwkJCWNsb2NrLW5hbWVz
ID0gInN5c19jayIsICJ4aGNpX2NrIiwgInJlZl9jayI7Cj4gPiArCQkJd2FrZXVwLXNvdXJjZTsK
PiA+ICsJCQltZWRpYXRlayxzeXNjb24td2FrZXVwID0gPCZwZXJpY2ZnIDB4NDIwIDEwMj47Cj4g
PiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gPiArCQkJI3NpemUtY2VsbHMgPSA8Mj47Cj4g
Cj4gVGhpcyBub2RlIGRvZXNuJ3QgaGF2ZSBhbnkgY2hpbGRyZW4sIHNvIG5vIG5lZWQgZm9yICNh
ZGRyZXNzLWNlbGxzCj4gYW5kCj4gI3NpemUtY2VsbHMsIGp1c3QgZHJvcCB0aGVtLgo+IAo+IEFs
c28sIGxldCdzIGtlZXAgdGhpcyBub2RlIGRpc2FibGVkIGJ5IGRlZmF1bHQ6Cj4gCj4gCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsKPiAKCnN1cmUsIHRoYW5rcy4KCj4gPiArCQl9Owo+ID4gKwo+ID4g
IAkJbm9yX2ZsYXNoOiBzcGlAMTEyMzQwMDAgewo+ID4gIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTkyLW5vciI7Cj4gPiAgCQkJcmVnID0gPDAgMHgxMTIzNDAwMCAwIDB4ZTA+Owo+ID4g
LS0gCj4gPiAyLjE4LjAKPiA+IAo+ID4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
