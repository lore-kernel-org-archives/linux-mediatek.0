Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D301C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 03:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSRrIEDCGNz9N78CdPTbrAR8/26ExFP8ZJxSS91aiIc=; b=h5aBCseHlnicxS
	a3407zK9V3micm10JJS/gvqNQFSETBr5FuqUg5wg9iONpmFJ2Z0wnsYs7vTQIxzS2tuOMk9SccTIK
	VYIkvbSOrXwrGiX/BZcAs5FAByzq4ASygMluR3W+cMjlefLHHp4l5ioVv+aMaFpVhULdbGyjZqkZy
	wh3K+2jW8U1kt/QXrggSIQ7MD2/jxwYPxaimKXFV4GgpGpkoV9SHVIeZcPiAYS+F1CJyxeNYctLMz
	Teg2LA/7vB9zRhWm1/DaW5cU6DGWXzICpDcZsYbgJWMUrYfghKXD9tetQXYqE/HVCcO+PR7KsWqyi
	+7VADPfLy/1ysX6G6STg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh0p2-00787E-FU; Wed, 20 Apr 2022 03:16:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh0or-00786D-5a; Wed, 20 Apr 2022 03:15:55 +0000
X-UUID: f86176e5e96246479f1410ea62830c65-20220419
X-UUID: f86176e5e96246479f1410ea62830c65-20220419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1417410819; Tue, 19 Apr 2022 20:15:47 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Apr 2022 20:15:45 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 11:15:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Apr 2022 11:15:30 +0800
Message-ID: <0b85798f63deb0c943ed1803aaa06cde6437e7bd.camel@mediatek.com>
Subject: Re: [PATCH 3/5] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Jason-JH Lin
 =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?= <Jason-JH.Lin@mediatek.com>,
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?=
 <Nancy.Lin@mediatek.com>, DTML <devicetree@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 20 Apr 2022 11:15:30 +0800
In-Reply-To: <CAAOTY__u3q1YcNwGpyEUpRbThsg6U1-gYtaqtGgy2J4jMwSOUg@mail.gmail.com>
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-4-rex-bc.chen@mediatek.com>
 <74b3f0e3-1d9f-de9e-ccf0-1f2174ba7c25@gmail.com>
 <CAAOTY__u3q1YcNwGpyEUpRbThsg6U1-gYtaqtGgy2J4jMwSOUg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_201553_245989_C31F3F9E 
X-CRM114-Status: GOOD (  31.42  )
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

T24gVHVlLCAyMDIyLTA0LTE5IGF0IDIzOjUxICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+
IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+IOaWvCAyMDIy5bm0NOac
iDE55pelIOmAseS6jCDkuIvljYgxMDo1N+Wvq+mBk++8mgo+ID4gCj4gPiAKPiA+IAo+ID4gT24g
MTkvMDQvMjAyMiAwNTozMiwgUmV4LUJDIENoZW4gd3JvdGU6Cj4gPiA+IEZyb206ICJOYW5jeS5M
aW4iIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPgo+ID4gPiAKPiA+ID4gQWRkIHZkb3N5czEgUkRN
QSBkZWZpbml0aW9uLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogTmFuY3kuTGluIDxuYW5j
eS5saW5AbWVkaWF0ZWsuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBE
ZWwgUmVnbm8gPAo+ID4gPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+
Cj4gPiA+IC0tLQo+ID4gPiAgIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC1yZG1h
LnlhbWwgICB8IDg2Cj4gPiA+ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gICAxIGZpbGUgY2hh
bmdlZCwgODYgaW5zZXJ0aW9ucygrKQo+ID4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gPiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxtZHAtCj4gPiA+IHJkbWEueWFtbAo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdAo+ID4gPiBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LG1kcAo+ID4gPiAtcmRtYS55YW1sCj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwCj4gPiA+IC1yZG1hLnlhbWwKPiA+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi42YWI3NzM1
Njk0NjIKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiArKysKPiA+ID4gYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtZHAKPiA+ID4g
LXJkbWEueWFtbAo+ID4gPiBAQCAtMCwwICsxLDg2IEBACj4gPiA+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ID4gKyVZQU1MIDEu
Mgo+ID4gPiArLS0tCj4gPiA+ICskaWQ6IAo+ID4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1k
cC1yZG1hLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyEySWc0bGxSY2FtMjUzcWd2VDk5dHkz
VFdDNFlvNkQ2RHkxRGdGaU51QV9mTWh0dTFsSkhFUlMxZjRwek9CRUxzcUlsX19GQWlIbDViSkNB
SnFOYzdGQVdHVHckCj4gPiA+ICAKPiA+ID4gKyRzY2hlbWE6IAo+ID4gPiBodHRwczovL3VybGRl
ZmVuc2UuY29tL3YzL19faHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlh
bWwqX187SXchIUNUUk5LQTl3TWcwQVJidyEySWc0bGxSY2FtMjUzcWd2VDk5dHkzVFdDNFlvNkQ2
RHkxRGdGaU51QV9mTWh0dTFsSkhFUlMxZjRwek9CRUxzcUlsX19GQWlIbDViSkNBSnFOZFU5c2dz
dmckCj4gPiA+ICAKPiA+ID4gKwo+ID4gPiArdGl0bGU6IE1lZGlhVGVrIE1EUCBSRE1BCj4gPiA+
ICsKPiA+ID4gK21haW50YWluZXJzOgo+ID4gPiArICAtIE1hdHRoaWFzIEJydWdnZXIgPG1hdHRo
aWFzLmJnZ0BnbWFpbC5jb20+Cj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsgSSB3b3VsZCBiZSB0aGUg
Y29ycmVjdCBwZXJzb24gdG8gbWFpbnRhaW4gdGhpcy4gVGhpcwo+ID4gc2hvdWxkIGJlIHRoZQo+
ID4gcGVyc29uIHRoYXQgaXMgbWFpbnRhaW5pbmcgdGhlIGRyaXZlci4KPiAKPiBBZ3JlZS4gVGhp
cyBzaG91bGQgYmUKPiAKPiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4K
PiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IAo+IFJlZ2FyZHMsCj4g
Q2h1bi1LdWFuZy4KPiAKPiA+IAo+ID4gUmVnYXJkcywKPiA+IE1hdHRoaWFzCj4gPiAKCkhlbGxv
IENodW4tS3VhbmcgYW5kIE1hdHRoaWFzLAoKT0ssIEkgd2lsbCB1cGRhdGUgdGhlIGxpc3QgaW4g
bmV4dCB2ZXJzaW9uLgoKQlJzLApSZXgKCj4gPiA+ICsKPiA+ID4gK2Rlc2NyaXB0aW9uOiB8Cj4g
PiA+ICsgIFRoZSBtZWRpYXRlayBNRFAgUkRNQSBzdGFuZHMgZm9yIFJlYWQgRGlyZWN0IE1lbW9y
eSBBY2Nlc3MuCj4gPiA+ICsgIEl0IHByb3ZpZGVzIHJlYWwgdGltZSBkYXRhIHRvIHRoZSBiYWNr
LWVuZCBwYW5lbCBkcml2ZXIsIHN1Y2gKPiA+ID4gYXMgRFNJLAo+ID4gPiArICBEUEkgYW5kIERQ
X0lOVEYuCj4gPiA+ICsgIEl0IGNvbnRhaW5zIG9uZSBsaW5lIGJ1ZmZlciB0byBzdG9yZSB0aGUg
c3VmZmljaWVudCBwaXhlbAo+ID4gPiBkYXRhLgo+ID4gPiArICBSRE1BIGRldmljZSBub2RlIG11
c3QgYmUgc2libGluZ3MgdG8gdGhlIGNlbnRyYWwgTU1TWVNfQ09ORklHCj4gPiA+IG5vZGUuCj4g
PiA+ICsgIEZvciBhIGRlc2NyaXB0aW9uIG9mIHRoZSBNTVNZU19DT05GSUcgYmluZGluZywgc2Vl
Cj4gPiA+ICsgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsv
bWVkaWF0ZWssbW1zeXMuCj4gPiA+IHlhbWwgZm9yIGRldGFpbHMuCj4gPiA+ICsKPiA+ID4gK3By
b3BlcnRpZXM6Cj4gPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiA+ICsgICAgb25lT2Y6Cj4gPiA+ICsg
ICAgICAtIGl0ZW1zOgo+ID4gPiArICAgICAgICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS12
ZG8xLXJkbWEKPiA+ID4gKwo+ID4gPiArICByZWc6Cj4gPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+
ID4gKwo+ID4gPiArICBpbnRlcnJ1cHRzOgo+ID4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiA+ICsK
PiA+ID4gKyAgcG93ZXItZG9tYWluczoKPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogQSBwaGFuZGxl
IGFuZCBQTSBkb21haW4gc3BlY2lmaWVyIGFzIGRlZmluZWQgYnkKPiA+ID4gYmluZGluZ3Mgb2YK
PiA+ID4gKyAgICAgIHRoZSBwb3dlciBjb250cm9sbGVyIHNwZWNpZmllZCBieSBwaGFuZGxlLiBT
ZWUKPiA+ID4gKyAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9w
b3dlci1kb21haW4ueWFtbAo+ID4gPiBmb3IgZGV0YWlscy4KPiA+ID4gKwo+ID4gPiArICBjbG9j
a3M6Cj4gPiA+ICsgICAgaXRlbXM6Cj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBSRE1BIENs
b2NrCj4gPiA+ICsKPiA+ID4gKyAgaW9tbXVzOgo+ID4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4g
PiArICAgICAgVGhpcyBwcm9wZXJ0eSBzaG91bGQgcG9pbnQgdG8gdGhlIHJlc3BlY3RpdmUgSU9N
TVUgYmxvY2sKPiA+ID4gd2l0aCBtYXN0ZXIgcG9ydCBhcyBhcmd1bWVudCwKPiA+ID4gKyAgICAg
IHNlZQo+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvbWVkaWF0
ZWssaW9tbXUueWFtbCBmb3IKPiA+ID4gZGV0YWlscy4KPiA+ID4gKwo+ID4gPiArICBtZWRpYXRl
ayxnY2UtY2xpZW50LXJlZzoKPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ID4gKyAgICAgIFRo
ZSByZWdpc3RlciBvZiBkaXNwbGF5IGZ1bmN0aW9uIGJsb2NrIHRvIGJlIHNldCBieSBnY2UuCj4g
PiA+IFRoZXJlIGFyZSA0IGFyZ3VtZW50cywKPiA+ID4gKyAgICAgIHN1Y2ggYXMgZ2NlIG5vZGUs
IHN1YnN5cyBpZCwgb2Zmc2V0IGFuZCByZWdpc3RlciBzaXplLiBUaGUKPiA+ID4gc3Vic3lzIGlk
IHRoYXQgaXMKPiA+ID4gKyAgICAgIG1hcHBpbmcgdG8gdGhlIHJlZ2lzdGVyIG9mIGRpc3BsYXkg
ZnVuY3Rpb24gYmxvY2tzIGlzCj4gPiA+IGRlZmluZWQgaW4gdGhlIGdjZSBoZWFkZXIKPiA+ID4g
KyAgICAgIGluY2x1ZGUvaW5jbHVkZS9kdC1iaW5kaW5ncy9nY2UvPGNoaXA+LWdjZS5oIG9mIGVh
Y2gKPiA+ID4gY2hpcHMuCj4gPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+ID4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiA+ICsKPiA+
ID4gK3JlcXVpcmVkOgo+ID4gPiArICAtIGNvbXBhdGlibGUKPiA+ID4gKyAgLSByZWcKPiA+ID4g
KyAgLSBwb3dlci1kb21haW5zCj4gPiA+ICsgIC0gY2xvY2tzCj4gPiA+ICsgIC0gaW9tbXVzCj4g
PiA+ICsKPiA+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4gPiArCj4gPiA+ICtl
eGFtcGxlczoKPiA+ID4gKyAgLSB8Cj4gPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmlu
ZGluZ3MvY2xvY2svbXQ4MTk1LWNsay5oPgo+ID4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9wb3dlci9tdDgxOTUtcG93ZXIuaD4KPiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Z2NlL210ODE5NS1nY2UuaD4KPiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvbWVtb3J5
L210ODE5NS1tZW1vcnktcG9ydC5oPgo+ID4gPiArCj4gPiA+ICsgICAgc29jIHsKPiA+ID4gKyAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gPiA+ICsgICAgICAgICNzaXplLWNlbGxzID0g
PDI+Owo+ID4gPiArCj4gPiA+ICsgICAgICAgIHZkbzFfcmRtYTA6IG1kcC1yZG1hQDFjMTA0MDAw
IHsKPiA+ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LXZkbzEt
cmRtYSI7Cj4gPiA+ICsgICAgICAgICAgICByZWcgPSA8MCAweDFjMTA0MDAwIDAgMHgxMDAwPjsK
PiA+ID4gKyAgICAgICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA0OTUgSVJRX1RZUEVfTEVW
RUxfSElHSCAwPjsKPiA+ID4gKyAgICAgICAgICAgIGNsb2NrcyA9IDwmdmRvc3lzMSBDTEtfVkRP
MV9NRFBfUkRNQTA+Owo+ID4gPiArICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3BtIE1U
ODE5NV9QT1dFUl9ET01BSU5fVkRPU1lTMT47Cj4gPiA+ICsgICAgICAgICAgICBpb21tdXMgPSA8
JmlvbW11X3ZkbyBNNFVfUE9SVF9MMl9NRFBfUkRNQTA+Owo+ID4gPiArICAgICAgICAgICAgbWVk
aWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZTAgU1VCU1lTXzFjMTBYWFhYCj4gPiA+IDB4NDAw
MCAweDEwMDA+Owo+ID4gPiArICAgICAgICB9Owo+ID4gPiArICAgIH07CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
