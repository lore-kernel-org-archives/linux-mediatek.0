Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7631C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 09:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98AlRpYtSisL43RHLx8HS84KCc3Ej45v1snLBseHxQM=; b=29dms5An/nmEsv
	Man18M3Jjo+wdsaaR9qH21bopbmuRDOtNtdkaNp3UDHIjo6RA+wgk2zEehUHuqPaSnET4g532/MvR
	IZuH2+WK1JIa7wP/q41cdjX6AaO5NjDrwQXHu7eA+TvF988YZ/rpjWaC3uECA6qN+r7xTDj9NiO7P
	Id8G5V86T1dRXGwk9Jq6Mx5M4+zDrccV6MLd2YJPC0v2Ix83/2RrRfoM/5L7jihekX7Gjj2uVAyKR
	QQBh+JefIY+ueeDERT/PRJOxuQrZEq8ycG8aEaKfn6//8PVST8H+c/tgZBmoV/f0ZSD/y851D5blo
	a50wfz8vzO60awmnQfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nivRE-0090cS-6F; Mon, 25 Apr 2022 09:55:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nivR9-0090ZS-LO
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 09:55:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivQo-0000BN-KW; Mon, 25 Apr 2022 11:54:58 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivQm-0057X6-An; Mon, 25 Apr 2022 11:54:54 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivQj-000548-UV; Mon, 25 Apr 2022 11:54:53 +0200
Message-ID: <b699a15ae2e810e20d7c388bc347f57d0a951513.camel@pengutronix.de>
Subject: Re: [PATCH v17 03/21] dt-bindings: mediatek: add ethdr definition
 for mt8195
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, wim@linux-watchdog.org,  AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, 
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Mon, 25 Apr 2022 11:54:53 +0200
In-Reply-To: <20220416020749.29010-4-nancy.lin@mediatek.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-4-nancy.lin@mediatek.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_025519_775881_F92C91C5 
X-CRM114-Status: GOOD (  15.81  )
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

SGkgTmFuY3ksCgpPbiBTYSwgMjAyMi0wNC0xNiBhdCAxMDowNyArMDgwMCwgTmFuY3kuTGluIHdy
b3RlOgo+IEFkZCB2ZG9zeXMxIEVUSERSIGRlZmluaXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTog
TmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lv
YWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNv
bT4KPiAtLS0KPiDCoC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV0aGRyLnlhbWwgICAg
ICB8IDE1OCArKysrKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNTggaW5zZXJ0
aW9ucygrKQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV0aGRyLnlhbWwKPiAKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsv
bWVkaWF0ZWssZXRoZHIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV0aGRyLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTgzMDNjMjhhMzYxCj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGV0aGRyLnlhbWwKPiBAQCAtMCwwICsxLDE1OCBAQAo+ICsjIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4g
Ky0tLQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvbWVkaWF0
ZWsvbWVkaWF0ZWssZXRoZHIueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogTWVkaWF0ZWsgRXRoZHIgRGV2
aWNlIFRyZWUgQmluZGluZ3MKPiArCj4gK21haW50YWluZXJzOgo+ICsgIC0gQ2h1bi1LdWFuZyBI
dSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gKyAgLSBQaGlsaXBwIFphYmVsIDxwLnphYmVs
QHBlbmd1dHJvbml4LmRlPgo+ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBFVEhEUiBpcyBkZXNp
Z25lZCBmb3IgSERSIHZpZGVvIGFuZCBncmFwaGljcyBjb252ZXJzaW9uIGluIHRoZSBleHRlcm5h
bCBkaXNwbGF5IHBhdGguCj4gKyAgSXQgaGFuZGxlcyBtdWx0aXBsZSBIRFIgaW5wdXQgdHlwZXMg
YW5kIHBlcmZvcm1zIHRvbmUgbWFwcGluZywgY29sb3Igc3BhY2UvY29sb3IKPiArICBmb3JtYXQg
Y29udmVyc2lvbiwgYW5kIHRoZW4gY29tYmluZSBkaWZmZXJlbnQgbGF5ZXJzLCBvdXRwdXQgdGhl
IHJlcXVpcmVkIEhEUiBvcgo+ICsgIFNEUiBzaWduYWwgdG8gdGhlIHN1YnNlcXVlbnQgZGlzcGxh
eSBwYXRoLiBUaGlzIGVuZ2luZSBpcyBjb21wb3NlZCBvZiB0d28gdmlkZW8KPiArICBmcm9udGVu
ZHMsIHR3byBncmFwaGljIGZyb250ZW5kcywgb25lIHZpZGVvIGJhY2tlbmQgYW5kIGEgbWl4ZXIu
IEVUSERSIGhhcyB0d28KPiArICBETUEgZnVuY3Rpb24gYmxvY2tzLCBEUyBhbmQgQURMLiBUaGVz
ZSB0d28gZnVuY3Rpb24gYmxvY2tzIHJlYWQgdGhlIHByZS1wcm9ncmFtbWVkCj4gKyAgcmVnaXN0
ZXJzIGZyb20gRFJBTSBhbmQgc2V0IHRoZW0gdG8gSFcgaW4gdGhlIHYtYmxhbmtpbmcgcGVyaW9k
Lgo+ICsKPiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgaXRlbXM6Cj4gKyAg
ICAgIC0gY29uc3Q6IG1lZGlhdGVrLG10ODE5NS1kaXNwLWV0aGRyCj4gKyAgcmVnOgo+ICsgICAg
bWF4SXRlbXM6IDcKPiArICByZWctbmFtZXM6Cj4gKyAgICBpdGVtczoKPiArICAgICAgLSBjb25z
dDogbWl4ZXIKPiArICAgICAgLSBjb25zdDogdmRvX2ZlMAo+ICsgICAgICAtIGNvbnN0OiB2ZG9f
ZmUxCj4gKyAgICAgIC0gY29uc3Q6IGdmeF9mZTAKPiArICAgICAgLSBjb25zdDogZ2Z4X2ZlMQo+
ICsgICAgICAtIGNvbnN0OiB2ZG9fYmUKPiArICAgICAgLSBjb25zdDogYWRsX2RzCj4gKyAgaW50
ZXJydXB0czoKPiArICAgIG1pbkl0ZW1zOiAxCj4gKyAgaW9tbXVzOgo+ICsgICAgZGVzY3JpcHRp
b246IFRoZSBjb21wYXRpYmxlIHByb3BlcnR5IGlzIERNQSBmdW5jdGlvbiBibG9ja3MuCj4gKyAg
ICAgIFNob3VsZCBwb2ludCB0byB0aGUgcmVzcGVjdGl2ZSBJT01NVSBibG9jayB3aXRoIG1hc3Rl
ciBwb3J0IGFzIGFyZ3VtZW50LAo+ICsgICAgICBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnlhbWwgZm9yCj4gKyAgICAgIGRldGFpbHMu
Cj4gKyAgICBtaW5JdGVtczogMQo+ICsgICAgbWF4SXRlbXM6IDIKPiArICBjbG9ja3M6Cj4gKyAg
ICBpdGVtczoKPiArICAgICAgLSBkZXNjcmlwdGlvbjogbWl4ZXIgY2xvY2sKPiArICAgICAgLSBk
ZXNjcmlwdGlvbjogdmlkZW8gZnJvbnRlbmQgMCBjbG9jawo+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiB2aWRlbyBmcm9udGVuZCAxIGNsb2NrCj4gKyAgICAgIC0gZGVzY3JpcHRpb246IGdyYXBoaWMg
ZnJvbnRlbmQgMCBjbG9jawo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBncmFwaGljIGZyb250ZW5k
IDEgY2xvY2sKPiArICAgICAgLSBkZXNjcmlwdGlvbjogdmlkZW8gYmFja2VuZCBjbG9jawo+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBhdXRvZG93bmxvYWQgYW5kIG1lbnVsb2FkIGNsb2NrCj4gKyAg
ICAgIC0gZGVzY3JpcHRpb246IHZpZGVvIGZyb250ZW5kIDAgYXN5bmMgY2xvY2sKPiArICAgICAg
LSBkZXNjcmlwdGlvbjogdmlkZW8gZnJvbnRlbmQgMSBhc3luYyBjbG9jawo+ICsgICAgICAtIGRl
c2NyaXB0aW9uOiBncmFwaGljIGZyb250ZW5kIDAgYXN5bmMgY2xvY2sKPiArICAgICAgLSBkZXNj
cmlwdGlvbjogZ3JhcGhpYyBmcm9udGVuZCAxIGFzeW5jIGNsb2NrCj4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IHZpZGVvIGJhY2tlbmQgYXN5bmMgY2xvY2sKPiArICAgICAgLSBkZXNjcmlwdGlvbjog
ZXRoZHIgdG9wIGNsb2NrCj4gKyAgY2xvY2stbmFtZXM6Cj4gKyAgICBpdGVtczoKPiArICAgICAg
LSBjb25zdDogbWl4ZXIKPiArICAgICAgLSBjb25zdDogdmRvX2ZlMAo+ICsgICAgICAtIGNvbnN0
OiB2ZG9fZmUxCj4gKyAgICAgIC0gY29uc3Q6IGdmeF9mZTAKPiArICAgICAgLSBjb25zdDogZ2Z4
X2ZlMQo+ICsgICAgICAtIGNvbnN0OiB2ZG9fYmUKPiArICAgICAgLSBjb25zdDogYWRsX2RzCj4g
KyAgICAgIC0gY29uc3Q6IHZkb19mZTBfYXN5bmMKPiArICAgICAgLSBjb25zdDogdmRvX2ZlMV9h
c3luYwo+ICsgICAgICAtIGNvbnN0OiBnZnhfZmUwX2FzeW5jCj4gKyAgICAgIC0gY29uc3Q6IGdm
eF9mZTFfYXN5bmMKPiArICAgICAgLSBjb25zdDogdmRvX2JlX2FzeW5jCj4gKyAgICAgIC0gY29u
c3Q6IGV0aGRyX3RvcAo+ICsgIHBvd2VyLWRvbWFpbnM6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsg
IHJlc2V0czoKPiArICAgIG1heEl0ZW1zOiA1CgpQbGVhc2UgYWRkIGEgcmVzZXQtbmFtZXMgcHJv
cGVydHkgYW5kIG5hbWUgdGhlc2UgcmVzZXRzLgoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
