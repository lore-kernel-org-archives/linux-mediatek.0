Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE9CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 03:17:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26EB8611C8
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 03:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26EB8611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yv++Aph8vFtlCUwDCkTQjlviRjMZKUhTHEX7fNIqcB4=; b=FUtFtgdSPVvv2v
	+IDIoaN02X1tG/uUIcPL16EfMx9xtNoTNoxN6m5kkyqo3q9rUJ2E1dKEt0yyfYKY7myCgPUWKq2ka
	0iU7ezobpXVOoVwAT4zfKWPDLJzYVKi54x6U0D5xUWS3HkFdCB5MGGfNih+uHbQ/WMWJ5Sojn4T/k
	/GwiZcuWSoD2qrU1nKVrHnavq1qGVBMV8ZGa86+kdLWnke5TMUUG4SuP3yv4xXKbvFJ9UgG/HEpTe
	/stsI6hjbL2lvE1KG9+12aKEi/0Zl0wgyOynunxD3yOhdNu5qNzrG3SICyqaRFOL5INDCDpcUMLjk
	a8Mm5Fj6BWmRY0kOAysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQhtl-00AFmI-T1; Thu, 16 Sep 2021 03:17:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQhtj-00AFls-81; Thu, 16 Sep 2021 03:17:16 +0000
X-UUID: 61e08d5d82194bdcb0e3aa9ca814dc4b-20210915
X-UUID: 61e08d5d82194bdcb0e3aa9ca814dc4b-20210915
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1759418243; Wed, 15 Sep 2021 20:17:10 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Sep 2021 20:07:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 11:07:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Sep 2021 11:07:07 +0800
Message-ID: <f67fd64ba276177d1590829b83dd2fae43334495.camel@mediatek.com>
Subject: Re: [PATCH v5 08/16] soc: mediatek: add cmdq support of mtk-mmsys
 config API for mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Thu, 16 Sep 2021 11:07:06 +0800
In-Reply-To: <CAAOTY_8aQkx55C=mqK-4bULpG_biHkq4brBF2SDdtbpnhP3Rvw@mail.gmail.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-9-nancy.lin@mediatek.com>
 <CAAOTY_8aQkx55C=mqK-4bULpG_biHkq4brBF2SDdtbpnhP3Rvw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_201715_326334_99B0BDA3 
X-CRM114-Status: GOOD (  30.24  )
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

SGkgQ2h1bi1LdWFuZywKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCk9uIFdlZCwgMjAyMS0wOS0w
OCBhdCAwMDoyOSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiBIaSwgTmFuY3k6Cj4gCj4g
TmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDnmnIg25pelIOmA
seS4gCDkuIvljYgzOjE15a+r6YGT77yaCj4gPiAKPiA+IEFkZCBjbWRxIHN1cHBvcnQgZm9yIG10
ay1tbXN5cyBjb25maWcgQVBJLgo+ID4gVGhlIG1tc3lzIGNvbmZpZyByZWdpc3RlciBzZXR0aW5n
cyBuZWVkIHRvIHRha2UgZWZmZWN0IHdpdGggdGhlCj4gPiBvdGhlcgo+ID4gSFcgc2V0dGluZ3Mo
bGlrZSBPVkxfQURBUFRPUi4uLikgYXQgdGhlIHNhbWUgdmJsYW5raW5nIHRpbWUuCj4gPiAKPiA+
IElmIHdlIHVzZSBDUFUgdG8gd3JpdGUgdGhlIG1tc3lzIHJlZywgd2UgY2FuJ3QgZ3VhcmFudGVl
IGFsbCB0aGUKPiA+IHNldHRpbmdzIGNhbiBiZSB3cml0dGVuIGluIHRoZSBzYW1lIHZibGFua2lu
ZyB0aW1lLgo+ID4gQ21kcSBpcyB1c2VkIGZvciB0aGlzIHB1cnBvc2UuIFdlIHByZXBhcmUgYWxs
IHRoZSByZWxhdGVkIEhXCj4gPiBzZXR0aW5ncwo+ID4gaW4gb25lIGNtZHEgcGFja2V0LiBUaGUg
Zmlyc3QgY29tbWFuZCBpbiB0aGUgcGFja2V0IGlzICJ3YWl0IHN0cmVhbQo+ID4gZG9uZSIsCj4g
PiBhbmQgdGhlbiBmb2xsb3dpbmcgd2l0aCBhbGwgdGhlIEhXIHNldHRpbmdzLiBBZnRlciB0aGUg
Y21kcSBwYWNrZXQKPiA+IGlzCj4gPiBmbHVzaCB0byBHQ0UgSFcuIFRoZSBHQ0Ugd2FpdHMgZm9y
IHRoZSAic3RyZWFtIGRvbmUgZXZlbnQiIHRvCj4gPiBjb21pbmcKPiA+IGFuZCB0aGVuIHN0YXJ0
cyBmbHVzaGluZyBhbGwgdGhlIEhXIHNldHRpbmdzLiBUaGlzIGNhbiBndWFyYW50ZWUKPiA+IGFs
bAo+ID4gdGhlIHNldHRpbmdzIGZsdXNoIGluIHRoZSBzYW1lIHZibGFua2luZy4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPgo+ID4gLS0t
Cj4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMgICAgICAgfCAyOCArKysrKysr
KysrKysrKysrKysrKystCj4gPiAtLS0tCj4gPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsv
bXRrLW1tc3lzLmggfCAgNiArKysrKy0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9t
ZWRpYXRlay9tdGstbW1zeXMuYwo+ID4gYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMu
Ywo+ID4gaW5kZXggM2EzOGI4MjY5YzcxLi4wNjAwNjU1MDFiOGEgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYwo+ID4gKysrIGIvZHJpdmVycy9zb2MvbWVk
aWF0ZWsvbXRrLW1tc3lzLmMKPiA+IEBAIC04MSw2ICs4MSw3IEBAIHN0cnVjdCBtdGtfbW1zeXMg
ewo+ID4gICAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhICpkYXRhOwo+
ID4gICAgICAgICBzcGlubG9ja190IGxvY2s7IC8qIHByb3RlY3RzIG1tc3lzX3N3X3JzdF9iIHJl
ZyAqLwo+ID4gICAgICAgICBzdHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgcmNkZXY7Cj4gPiAr
ICAgICAgIHN0cnVjdCBjbWRxX2NsaWVudF9yZWcgY21kcV9iYXNlOwo+ID4gIH07Cj4gPiAKPiA+
ICB2b2lkIG10a19tbXN5c19kZHBfY29ubmVjdChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiBAQCAt
MTc0LDcgKzE3NSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzZXRfY29udHJvbF9vcHMKPiA+
IG10a19tbXN5c19yZXNldF9vcHMgPSB7Cj4gPiAgfTsKPiA+IAo+ID4gIHZvaWQgbXRrX21tc3lz
X2RkcF9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCBlbnVtCj4gPiBtdGtfbW1zeXNfY29uZmln
X3R5cGUgY29uZmlnLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgaWQsIHUzMiB2
YWwpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBpZCwgdTMyIHZhbCwgc3RydWN0
IGNtZHFfcGt0Cj4gPiAqY21kcV9wa3QpCj4gPiAgewo+ID4gICAgICAgICBzdHJ1Y3QgbXRrX21t
c3lzICptbXN5cyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4gICAgICAgICBjb25zdCBzdHJ1
Y3QgbXRrX21tc3lzX2NvbmZpZyAqbW1zeXNfY29uZmlnID0gbW1zeXMtPmRhdGEtCj4gPiA+Y29u
ZmlnOwo+ID4gQEAgLTE5NywxMCArMTk4LDIwIEBAIHZvaWQgbXRrX21tc3lzX2RkcF9jb25maWco
c3RydWN0IGRldmljZSAqZGV2LAo+ID4gZW51bSBtdGtfbW1zeXNfY29uZmlnX3R5cGUgY29uZmln
LAo+ID4gICAgICAgICBtYXNrID0gbW1zeXNfY29uZmlnW2ldLm1hc2s7Cj4gPiAgICAgICAgIHJl
Z192YWwgPSB2YWwgPDwgbW1zeXNfY29uZmlnW2ldLnNoaWZ0Owo+ID4gCj4gPiAtICAgICAgIHUz
MiB0bXAgPSByZWFkbChtbXN5cy0+cmVncyArIG9mZnNldCk7Cj4gPiAtCj4gPiAtICAgICAgIHRt
cCA9ICh0bXAgJiB+bWFzaykgfCByZWdfdmFsOwo+ID4gLSAgICAgICB3cml0ZWwodG1wLCBtbXN5
cy0+cmVncyArIG9mZnNldCk7Cj4gPiArI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEp
Cj4gPiArICAgICAgIGlmIChjbWRxX3BrdCAmJiBtbXN5cy0+Y21kcV9iYXNlLnNpemUpIHsKPiA+
ICsgICAgICAgICAgICAgICBjbWRxX3BrdF93cml0ZV9tYXNrKGNtZHFfcGt0LCBtbXN5cy0KPiA+
ID5jbWRxX2Jhc2Uuc3Vic3lzLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbW1zeXMtPmNtZHFfYmFzZS5vZmZzZXQgKwo+ID4gb2Zmc2V0LCByZWdfdmFsLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFzayk7Cj4gPiArICAgICAgIH0gZWxz
ZSB7Cj4gPiArI2VuZGlmCj4gPiArICAgICAgICAgICAgICAgdTMyIHRtcCA9IHJlYWRsKG1tc3lz
LT5yZWdzICsgb2Zmc2V0KTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICB0bXAgPSAodG1wICYg
fm1hc2spIHwgcmVnX3ZhbDsKPiA+ICsgICAgICAgICAgICAgICB3cml0ZWwodG1wLCBtbXN5cy0+
cmVncyArIG9mZnNldCk7Cj4gPiArI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4g
PiArICAgICAgIH0KPiA+ICsjZW5kaWYKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwobXRr
X21tc3lzX2RkcF9jb25maWcpOwo+ID4gCj4gPiBAQCAtMjM2LDYgKzI0NywxMyBAQCBzdGF0aWMg
aW50IG10a19tbXN5c19wcm9iZShzdHJ1Y3QKPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+
ICAgICAgICAgfQo+ID4gCj4gPiAgICAgICAgIG1tc3lzLT5kYXRhID0gb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+ID4gKwo+ID4gKyNpZiBJU19SRUFDSEFCTEUoQ09ORklH
X01US19DTURRKQo+ID4gKyAgICAgICByZXQgPSBjbWRxX2Rldl9nZXRfY2xpZW50X3JlZyhkZXYs
ICZtbXN5cy0+Y21kcV9iYXNlLCAwKTsKPiAKPiBEZWZpbmUgbWVkaWF0ZWssZ2NlLWNsaWVudC1y
ZWcgaW4gYmluZGluZyBkb2N1bWVudCBmaXJzdC4KPiAKPiBSZWdhcmRzLAo+IENodW4tS3Vhbmcu
Cj4gCk9LLCBJIHdpbGwgYWRkIGJpbmRpbmcgZG9jdW1lbnQgaW4gdGhlIG5leHQgcmV2aXNpb24u
CgpSZWdhcmRzLApOYW5jeSBMaW4KCj4gPiArICAgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAg
ICAgICAgZGV2X2RiZyhkZXYsICJObyBtZWRpYXRlayxnY2UtY2xpZW50LXJlZyFcbiIpOwo+ID4g
KyNlbmRpZgo+ID4gKwo+ID4gICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBtbXN5
cyk7Cj4gPiAKPiA+ICAgICAgICAgY2xrcyA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9kYXRh
KCZwZGV2LT5kZXYsIG1tc3lzLQo+ID4gPmRhdGEtPmNsa19kcml2ZXIsCj4gPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiA+IGIvaW5jbHVkZS9s
aW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiA+IGluZGV4IGVmMmE2ZDlhODM0Yi4uOTcw
NWQyNDI4NDlhIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5o
Cj4gPiBAQCAtNiw2ICs2LDEwIEBACj4gPiAgI2lmbmRlZiBfX01US19NTVNZU19ICj4gPiAgI2Rl
ZmluZSBfX01US19NTVNZU19ICj4gPiAKPiA+ICsjaW5jbHVkZSA8bGludXgvbWFpbGJveF9jb250
cm9sbGVyLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5o
Pgo+ID4gKyNpbmNsdWRlIDxsaW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaD4KPiA+ICsKPiA+
ICBlbnVtIG10a19kZHBfY29tcF9pZDsKPiA+ICBzdHJ1Y3QgZGV2aWNlOwo+ID4gCj4gPiBAQCAt
NzUsNiArNzksNiBAQCB2b2lkIG10a19tbXN5c19kZHBfZGlzY29ubmVjdChzdHJ1Y3QgZGV2aWNl
ICpkZXYsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29t
cF9pZCBuZXh0KTsKPiA+IAo+ID4gIHZvaWQgbXRrX21tc3lzX2RkcF9jb25maWcoc3RydWN0IGRl
dmljZSAqZGV2LCBlbnVtCj4gPiBtdGtfbW1zeXNfY29uZmlnX3R5cGUgY29uZmlnLAo+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICB1MzIgaWQsIHUzMiB2YWwpOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICB1MzIgaWQsIHUzMiB2YWwsIHN0cnVjdCBjbWRxX3BrdAo+ID4gKmNtZHFf
cGt0KTsKPiA+IAo+ID4gICNlbmRpZiAvKiBfX01US19NTVNZU19IICovCj4gPiAtLQo+ID4gMi4x
OC4wCj4gPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
