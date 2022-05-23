Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EDBC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzDfkXw8K2CMjMdSyWiubG6QtBXa4txvUPwfaUTfkto=; b=fL6S3YSbiz4hou
	+yRca6QTCkH7AmjW2fyu66uYsED69BloO9WEz36vwIJXhS6SNknto83WKi4VwKdQJNdqBppPro2XM
	GQH+Ek7R6WNxefCKXb7HrbcsUqtS87T4H4HgQyz0ZwamxkrB1RaL8Dqv9NFx57JYtHlJ8EnYbSPrz
	oktIjGvy72SL9nHcc1r4WRhuXTzloOAvN+pj4lXn5xaarfXN+YEhHZg/Fz0JFNvRX+8rf9OXGZxiG
	wFf8F3dDJe38hKFyHGZuSP49o1U+GsJaDZ7/HeNQNNcvYnF9grKKx24SvSzdtxm1cLTyUUvOo3ob8
	UyHipQ8Ymn9cGF7QAdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3xP-002f23-5C; Mon, 23 May 2022 09:02:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2px-002AAA-Pr; Mon, 23 May 2022 07:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=hy8yhtIpfjE64d1UeN10Nloigmw6dqFW5YU3+QfTrAg=; b=XSU39n0hj2eC16lKopJyGztpIT
 TC+gYmQHaGB7MkigkKNUcfKC3nqYyFoUUJKcO3iYejyhsFh4kxjS4JUbhSRmVenWNUc+LQSrslMhg
 kBiBf/mQXAn5wPAHlxLTKEBEUx0JQkMgV9/KfGvncl0Fu7xQXwlsTshQeTciMsyyvtDYUksIrNZZh
 JMAc0fa9yRkYIHtshOSV0796DG3rUiwz2MSFnNLeUf0TBOa+U104etcFZGSplIR5IFGTBPuFo530k
 U0SoDlUIR+d/bcZgY/auq3k4Vbyh8/Z5fJi2vLUPPSXCWxzdwx7MwhzLtnLoeMyExPrdcskvzTjB/
 H9/1Oymg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt0OR-000qio-N0; Mon, 23 May 2022 05:14:15 +0000
X-UUID: f99cafd9c6cf434ba265682fc18874b3-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:258e1702-417c-4154-b0a7-ef08127753b9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:53952ce3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: f99cafd9c6cf434ba265682fc18874b3-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 428055459; Sun, 22 May 2022 22:13:48 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 22:09:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 13:09:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 13:09:53 +0800
Message-ID: <cdfe094579737473b8d97cd584c1b157aaa54fc7.camel@mediatek.com>
Subject: Re: [PATCH v7 05/19] clk: mediatek: reset: Merge and revise reset
 register function
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 23 May 2022 13:09:53 +0800
In-Reply-To: <20220520151212.rrrtekst7uhnojds@notapiano>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-6-rex-bc.chen@mediatek.com>
 <20220520151212.rrrtekst7uhnojds@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_061412_407839_F362A4FE 
X-CRM114-Status: GOOD (  28.08  )
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

T24gRnJpLCAyMDIyLTA1LTIwIGF0IDExOjEyIC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBIaSBSZXgsCj4gCj4gT24gVGh1LCBNYXkgMTksIDIwMjIgYXQgMDg6NTU6MTNQ
TSArMDgwMCwgUmV4LUJDIENoZW4gd3JvdGU6Cj4gPiBUaGVyZSBhcmUgdHdvIHZlcnNpb25zIGZv
ciBjbG9jayByZXNldCByZWdpc3RlciBjb250cm9sIGZvcgo+ID4gTWVkaWFUZWsKPiA+IFNvQ3Mu
IFRoZSBvbGQgaGFyZHdhcmUgaXMgb25lIGJpdCBwZXIgcmVzZXQgY29udHJvbCwgYW5kIGRvZXMg
bm90Cj4gPiBoYXZlIHNlcGFyYXRlIHJlZ2lzdGVycyBmb3IgYml0IHNldCwgY2xlYXIgYW5kIHJl
YWQtYmFjawo+ID4gb3BlcmF0aW9ucy4KPiA+IFRoaXMgbWF0Y2hlcyB0aGUgc2NoZW1lIHN1cHBv
cnRlZCBieSB0aGUgc2ltcGxlIHJlc2V0IGRyaXZlci4KPiA+IAo+ID4gSG93ZXZlciwgYmVjYXVz
ZSB3ZSBuZWVkIHRvIHVzZSBkaWZmZXJlbnQgZGF0YSBzdHJ1Y3R1cmUgZnJvbQo+ID4gcmVzZXRf
c2ltcGxlX2RhdGEsIHdlIGNhbiBub3QgdXNlIHRoZSBvcGVyYXRpb24gb2Ygc2ltcGxlIHJlc2V0
Cj4gPiBkcml2ZXIuCj4gPiBGb3IgdGhpcyByZWFzb24sIHdlIGtlZXAgdGhlIG9yaWdpbmFsIGZ1
bmN0aW9ucyBhbmQgbmFtZSB0aGlzCj4gPiB2ZXJzaW9uCj4gPiBhcyAiTVRLX1JTVF9TSU1QTEUi
Lgo+ID4gCj4gPiBJbiB0aGlzIHBhdGNoOgo+ID4gLSBBZGQgYSB2ZXJzaW9uIGVudW1lcmF0aW9u
IHRvIHNlcGFyYXRlIGRpZmZlcmVudCByZXNldCBoYXJkd2FyZS4KPiA+IC0gTWVyZ2UgdGhlIHJl
c2V0IHJlZ2lzdGVyIGZ1bmN0aW9uIG9mIHNpbXBsZSBhbmQgc2V0X2NsciBpbnRvIG9uZQo+ID4g
ICBmdW5jdGlvbiAibXRrX3JlZ2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXIiLgo+ID4gLSBSZW5hbWUg
aW5wdXQgdmFyaWFibGUgIm51bV9yZWdzIiB0byAicnN0X2JhbmtfbnIiIHRvIGF2b2lkCj4gPiAg
IGNvbmZ1c2lvbi4gVGhpcyB2YXJpYWJsZSBpcyB1c2VkIHRvIGRlZmluZSB0aGUgcXVhbnRpdHkg
b2YgcmVzZXQKPiA+IGJhbmsuCj4gPiAtIERvY3VtZW50IG10a19yZXNldF92ZXJzaW9uIGFuZCBt
dGtfcmVnaXN0ZXJfcmVzZXRfY29udHJvbGxlci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUmV4
LUJDIENoZW4gPHJleC1iYy5jaGVuQG1lZGlhdGVrLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8Cj4gPiBhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNv
bGxhYm9yYS5jb20+Cj4gPiAtLS0KPiAKPiA8c25pcD4KPiAKPiA+IGluZGV4IDc2NGE4YWZmZTIw
Ni4uMmEzOWVlYzljZmY3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVz
ZXQuaAo+ID4gKysrIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuaAo+ID4gQEAgLTksMTYg
KzksMzIgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQtY29udHJvbGxlci5oPgo+ID4gICNp
bmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ID4gIAo+ID4gKy8qKgo+ID4gKyAqIGVudW0gbXRrX3Jl
c2V0X3ZlcnNpb24gLSBWZXJzaW9uIG9mIE1lZGlhVGVrIGNsb2NrIHJlc2V0Cj4gPiBjb250cm9s
bGVyLgo+ID4gKyAqIEBNVEtfUlNUX1NJTVBMRTogVXNlIHRoZSBzYW1lIHJlZ2lzdGVycyBmb3Ig
Yml0IHNldCBhbmQgY2xlYXIuCj4gPiArICogQE1US19SU1RfU0VUX0NMUjogVXNlIHNlcGFyYXRl
IHJlZ2lzdGVycyBmb3IgYml0IHNldCBhbmQgY2xlYXIuCj4gPiArICogQE1US19SU1RfTUFYOiBU
b3RhbCBxdWFudGl0eSBvZiB2ZXJzaW9uIGZvciBNZWRpYVRlayBjbG9jawo+ID4gcmVzZXQgY29u
dHJvbGxlci4KPiA+ICsgKi8KPiA+ICtlbnVtIG10a19yZXNldF92ZXJzaW9uIHsKPiA+ICsJTVRL
X1JTVF9TSU1QTEUgPSAwLAo+ID4gKwlNVEtfUlNUX1NFVF9DTFIsCj4gPiArCU1US19SU1RfTUFY
LAo+ID4gK307Cj4gPiArCj4gPiAgc3RydWN0IG10a19yZXNldCB7Cj4gPiAgCXN0cnVjdCByZWdt
YXAgKnJlZ21hcDsKPiA+ICAJaW50IHJlZ29mczsKPiA+ICAJc3RydWN0IHJlc2V0X2NvbnRyb2xs
ZXJfZGV2IHJjZGV2Owo+ID4gIH07Cj4gPiAgCj4gPiArLyoqCj4gPiArICogbXRrX3JlZ2lzdGVy
X3Jlc2V0X2NvbnRyb2xsZXIgLSBSZWdpc3RlciBNZWRpYVRlayBjbG9jayByZXNldAo+ID4gY29u
dHJvbGxlcgo+ID4gKyAqIEBucDogUG9pbnRlciB0byBkZXZpY2Ugbm9kZS4KPiA+ICsgKiBAcnN0
X2JhbmtfbnI6IFF1YW50aXR5IG9mIHJlc2V0IGJhbmsuCj4gPiArICogQHJlZ19vZnM6IEJhc2Ug
b2Zmc2V0IG9mIHRoZSByZXNldCByZWdpc3Rlci4KPiA+ICsgKiBAdmVyc2lvbjogVmVyc2lvbiBv
ZiBNZWRpYVRlayBjbG9jayByZXNldCBjb250cm9sbGVyLgo+ID4gKyAqLwo+ID4gIHZvaWQgbXRr
X3JlZ2lzdGVyX3Jlc2V0X2NvbnRyb2xsZXIoc3RydWN0IGRldmljZV9ub2RlICpucCwKPiA+IC0J
CQkJICAgdW5zaWduZWQgaW50IG51bV9yZWdzLCBpbnQgcmVnb2ZzKTsKPiA+IC0KPiA+IC12b2lk
IG10a19yZWdpc3Rlcl9yZXNldF9jb250cm9sbGVyX3NldF9jbHIoc3RydWN0IGRldmljZV9ub2Rl
ICpucCwKPiA+IC0JCQkJCSAgIHVuc2lnbmVkIGludCBudW1fcmVncywgaW50Cj4gPiByZWdvZnMp
Owo+ID4gKwkJCQkgICB1MzIgcnN0X2JhbmtfbnIsIHUxNiByZWdfb2ZzLCB1OAo+ID4gdmVyc2lv
bik7Cj4gCj4gV2h5IG5vdCB1c2UgJ2VudW0gbXRrX3Jlc2V0X3ZlcnNpb24nIGluc3RlYWQgb2Yg
YSBnZW5lcmljIHU4PyBTYW1lCj4gdGhpbmcgd2hlbgo+IHlvdSBtb3ZlIGl0IHRvIGEgc3RydWN0
IGluIHBhdGNoIDYuCj4gCj4gVGhhbmtzLAo+IE7DrWNvbGFzCgpIRWxsbyBOw61jb2xhcywKClRo
YW5rcyBmb3IgdGhlIHJldmlldy4KSSB3aWxsIG1vZGlmeSBmb3IgYm90aCBwYXRjaCA1IGFuZCA2
IGZvciB0aGlzIGluIG5leHQgdmVyc2lvbi4KCkJScywKUmV4CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
