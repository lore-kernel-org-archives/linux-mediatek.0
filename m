Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2496BC47087
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD8336101B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD8336101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbxnH/glsZdKwk6b9HX1lzsxsWpejmtkpfG3OpuSsUg=; b=nCjP+dEIVPxICn
	qsHR4vAcyWyIqldh7Qy8VKu6dmuy3whC44Ylu7i0euxv63EgnTPn+zK+AowckDlhNcQnGap4PWSDn
	3XP4Qaqx1vLLVY3xLlHVobMqzvZEo0W6Ntb71wubsjRXFGkr2GPGtRUJnOeAkHVUCXDI3/Iz+zpwg
	9TqcxlG3d6iHHZ0hGBlm3jXuaSa7iUUvl5OZJnIw0iTW5d2YE045H+mxwEAegkxLktHQ19AoDMsvR
	cO5ft+HAHa7/YSTHzrhmwh/OoLXxkin65ht+Y511g3LGahSmNC4le51t35JhbOt9vPodVFHlsyPI3
	MY8wf2G0Er9CXXqetHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llirW-009yTR-8y; Wed, 26 May 2021 02:01:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llirT-009yRe-0C; Wed, 26 May 2021 02:01:32 +0000
X-UUID: 006bfea14aef4c0ea1f59be08277621e-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=80CTOwchKT3ybAOjvFyMtlA2Ol/KbxvnM85zEMOaPiA=; 
 b=XqYalZCrojkzfGvIDHyFOTu41pLEvBIjfGPAhAfcLDhrbPXCmNyMokMhUl3deX6h0DbhR+SPv0gJItYwzjuSqx4p5etqaNH5rbZCp3C7sG3CH4WInXPR0iaKKYo0UnMhIUlS0UHioeLpJcRslbFCuTSySxGg+txY7d5GwsLAMH8=;
X-UUID: 006bfea14aef4c0ea1f59be08277621e-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1267496152; Tue, 25 May 2021 19:01:29 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 18:51:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 09:51:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 May 2021 09:51:20 +0800
Message-ID: <c90629c915bc1c0d2e6b1070939a443ce5f8644c.camel@mediatek.com>
Subject: Re: [v4,PATCH 1/3] drm/mediatek: dpi dual edge sample mode support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, DTML
 <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Date: Wed, 26 May 2021 09:51:19 +0800
In-Reply-To: <CAAOTY__aasihVxC72f7b_R-=UcR85Z1G9M8TxUS9dBrad-aRxQ@mail.gmail.com>
References: <20210525121448.30075-1-rex-bc.chen@mediatek.com>
 <20210525121448.30075-2-rex-bc.chen@mediatek.com>
 <CAAOTY__aasihVxC72f7b_R-=UcR85Z1G9M8TxUS9dBrad-aRxQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 42D93AED34D03117334ABA24E227DA569F06D743CF4AF9909680C31FFE21AE7A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_190131_091639_6B6E6551 
X-CRM114-Status: GOOD (  25.91  )
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

SGVsbG8gQ0ssDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCk9uIFdlZCwgMjAyMS0wNS0y
NiBhdCAwODowMSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToNCj4gSGksIFJleDoNCj4gDQo+
IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+IOaWvCAyMDIx5bm0NeaciDI1
5pelIOmAseS6jCDkuIvljYg4OjE15a+r6YGT77yaDQo+ID4gDQo+ID4gRFBJIGNhbiBzYW1wbGUg
b24gZmFsbGluZywgcmlzaW5nIG9yIGJvdGggZWRnZS4NCj4gPiBXaGVuIERQSSBzYW1wbGUgdGhl
IGRhdGEgYm90aCByaXNpbmcgYW5kIGZhbGxpbmcgZWRnZS4NCj4gPiBJdCBjYW4gcmVkdWNlIGhh
bGYgZGF0YSBpbyBwaW5zLg0KPiA+IFVzZSBudW1fb3V0cHV0X2ZtdHMgdG8gZGV0ZXJtaW5lIHdo
ZXRoZXIgaXQgaXMgZHVhbCBlZGdlIG1vZGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSml0
YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFJleC1C
QyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAxNyArKysrKysrKysrKysrKysrLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jDQo+ID4gaW5kZXggYmVhOTFjODE2MjZl
Li5kM2I4ODNjOTdhYWYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcGkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMN
Cj4gPiBAQCAtODMsNiArODMsNyBAQCBzdHJ1Y3QgbXRrX2RwaSB7DQo+ID4gICAgICAgICBzdHJ1
Y3QgcGluY3RybCAqcGluY3RybDsNCj4gPiAgICAgICAgIHN0cnVjdCBwaW5jdHJsX3N0YXRlICpw
aW5zX2dwaW87DQo+ID4gICAgICAgICBzdHJ1Y3QgcGluY3RybF9zdGF0ZSAqcGluc19kcGk7DQo+
ID4gKyAgICAgICBib29sIGRkcl9lZGdlX3NlbDsNCj4gDQo+IEkgd291bGQgbGlrZSB0byBrZWVw
IG91dHB1dF9mbXQgaW5zdGVhZCBvZiBkZHJfZWRnZV9zZWwuDQo+IEluaXRpYWxpemUgb3V0cHV0
X2ZtdCB0byBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0IGluIHRoaXMgcGF0Y2guDQo+IA0KSXQg
bWVhbnMgdGhhdCBJIG1heSBpbml0aWFsaXplIG91dHB1dF9mbXQgaW4gcHJvYmUgYW5kIHNldCB2
YWx1ZSBpbg0KbXRrX2RwaV9icmlkZ2VfYXRvbWljX2NoZWNrKCkgb2YgcGF0Y2hbMy8zXT8NCj4g
PiAgICAgICAgIGludCByZWZjb3VudDsNCj4gPiAgfTsNCj4gPiANCj4gPiBAQCAtMTIyLDYgKzEy
Myw4IEBAIHN0cnVjdCBtdGtfZHBpX2NvbmYgew0KPiA+ICAgICAgICAgdTMyIHJlZ19oX2ZyZV9j
b247DQo+ID4gICAgICAgICB1MzIgbWF4X2Nsb2NrX2toejsNCj4gPiAgICAgICAgIGJvb2wgZWRn
ZV9zZWxfZW47DQo+ID4gKyAgICAgICBjb25zdCB1MzIgKm91dHB1dF9mbXRzOw0KPiA+ICsgICAg
ICAgdTMyIG51bV9vdXRwdXRfZm10czsNCj4gDQo+IE1vdmUgdGhlc2UgdG8gbmV4dCBwYXRjaC4N
Cj4gDQpJIHdpbGwgZG8gdGhpcyBpbiBuZXh0IHZlcnNpb24uDQo+ID4gIH07DQo+ID4gDQo+ID4g
IHN0YXRpYyB2b2lkIG10a19kcGlfbWFzayhzdHJ1Y3QgbXRrX2RwaSAqZHBpLCB1MzIgb2Zmc2V0
LCB1MzIgdmFsLA0KPiA+IHUzMiBtYXNrKQ0KPiA+IEBAIC0zODEsNiArMzg0LDE2IEBAIHN0YXRp
YyB2b2lkIG10a19kcGlfY29uZmlnX2NvbG9yX2Zvcm1hdChzdHJ1Y3QNCj4gPiBtdGtfZHBpICpk
cGksDQo+ID4gICAgICAgICB9DQo+ID4gIH0NCj4gPiANCj4gPiArc3RhdGljIHZvaWQgbXRrX2Rw
aV9kdWFsX2VkZ2Uoc3RydWN0IG10a19kcGkgKmRwaSkNCj4gPiArew0KPiA+ICsgICAgICAgaWYg
KGRwaS0+Y29uZi0+bnVtX291dHB1dF9mbXRzID4gMSkgew0KPiA+ICsgICAgICAgICAgICAgICBt
dGtfZHBpX21hc2soZHBpLCBEUElfRERSX1NFVFRJTkcsIEREUl9FTiB8DQo+ID4gRERSXzRQSEFT
RSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIEREUl9FTiB8IEREUl80UEhBU0Up
Ow0KPiA+ICsgICAgICAgICAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfT1VUUFVUX1NFVFRJ
TkcsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcGktPmRkcl9lZGdlX3NlbCA/
IEVER0VfU0VMIDogMCwNCj4gPiBFREdFX1NFTCk7DQo+ID4gKyAgICAgICB9DQo+IA0KPiBpZiAo
ZHBpLT5vdXRwdXRfZm10ID09IE1FRElBX0JVU19GTVRfUkdCODg4XzJYMTJfTEUpIHx8DQo+ICAg
IChkcGktPm91dHB1dF9mbXQgPT0gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9CRSkgew0KPiAg
ICAgbXRrX2RwaV9tYXNrKGRwaSwgRFBJX0REUl9TRVRUSU5HLCBERFJfRU4gfCBERFJfNFBIQVNF
LCBERFJfRU4gfA0KPiBERFJfNFBIQVNFKTsNCj4gICAgIG10a19kcGlfbWFzayhkcGksIERQSV9P
VVRQVVRfU0VUVElORywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcGktPm91dHB1
dF9mbXQgPT0NCj4gTUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9MRSA/IEVER0VfU0VMIDogMCwg
RURHRV9TRUwpOw0KPiB9IGVsc2Ugew0KPiAgICAgbXRrX2RwaV9tYXNrKGRwaSwgRFBJX0REUl9T
RVRUSU5HLCBERFJfRU4gfCBERFJfNFBIQVNFLCAwKTsNCj4gfQ0KPiANCkkgd2lsbCBtb2RpZnkg
dGhpcyBjb2RlIGluIG5leHQgdmVyc2lvbi4NCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHZv
aWQgbXRrX2RwaV9wb3dlcl9vZmYoc3RydWN0IG10a19kcGkgKmRwaSkNCj4gPiAgew0KPiA+ICAg
ICAgICAgaWYgKFdBUk5fT04oZHBpLT5yZWZjb3VudCA9PSAwKSkNCj4gPiBAQCAtNDU1LDcgKzQ2
OCw4IEBAIHN0YXRpYyBpbnQgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2RlKHN0cnVjdA0KPiA+IG10
a19kcGkgKmRwaSwNCj4gPiAgICAgICAgIHBsbF9yYXRlID0gY2xrX2dldF9yYXRlKGRwaS0+dHZk
X2Nsayk7DQo+ID4gDQo+ID4gICAgICAgICB2bS5waXhlbGNsb2NrID0gcGxsX3JhdGUgLyBmYWN0
b3I7DQo+ID4gLSAgICAgICBjbGtfc2V0X3JhdGUoZHBpLT5waXhlbF9jbGssIHZtLnBpeGVsY2xv
Y2spOw0KPiA+ICsgICAgICAgY2xrX3NldF9yYXRlKGRwaS0+cGl4ZWxfY2xrLA0KPiA+ICsgICAg
ICAgICAgICAgICAgICAgIHZtLnBpeGVsY2xvY2sgKiAoKGRwaS0+Y29uZi0+bnVtX291dHB1dF9m
bXRzID4NCj4gPiAxKSA/IDIgOiAxKSk7DQo+IA0KPiBpZiAoZHBpLT5vdXRwdXRfZm10ID09IE1F
RElBX0JVU19GTVRfUkdCODg4XzJYMTJfTEUpIHx8DQo+ICAgIChkcGktPm91dHB1dF9mbXQgPT0g
TUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgxMl9CRSkNCj4gICAgIGNsa19zZXRfcmF0ZShkcGktPnBp
eGVsX2Nsaywgdm0ucGl4ZWxjbG9jayAqIDIpOw0KPiBlbHNlDQo+ICAgICBjbGtfc2V0X3JhdGUo
ZHBpLT5waXhlbF9jbGssIHZtLnBpeGVsY2xvY2spOw0KPiANCkkgd2lsbCBtb2RpZnkgdGhpcyBj
b2RlIGluIG5leHQgdmVyc2lvbi4NCj4gPiAgICAgICAgIHZtLnBpeGVsY2xvY2sgPSBjbGtfZ2V0
X3JhdGUoZHBpLT5waXhlbF9jbGspOw0KPiA+IA0KPiA+ICAgICAgICAgZGV2X2RiZyhkcGktPmRl
diwgIkdvdCAgUExMICVsdSBIeiwgcGl4ZWwgY2xvY2sgJWx1IEh6XG4iLA0KPiA+IEBAIC01MTks
NiArNTMzLDcgQEAgc3RhdGljIGludCBtdGtfZHBpX3NldF9kaXNwbGF5X21vZGUoc3RydWN0DQo+
ID4gbXRrX2RwaSAqZHBpLA0KPiA+ICAgICAgICAgbXRrX2RwaV9jb25maWdfeWNfbWFwKGRwaSwg
ZHBpLT55Y19tYXApOw0KPiA+ICAgICAgICAgbXRrX2RwaV9jb25maWdfY29sb3JfZm9ybWF0KGRw
aSwgZHBpLT5jb2xvcl9mb3JtYXQpOw0KPiA+ICAgICAgICAgbXRrX2RwaV9jb25maWdfMm5faF9m
cmUoZHBpKTsNCj4gPiArICAgICAgIG10a19kcGlfZHVhbF9lZGdlKGRwaSk7DQo+ID4gICAgICAg
ICBtdGtfZHBpX2NvbmZpZ19kaXNhYmxlX2VkZ2UoZHBpKTsNCj4gPiAgICAgICAgIG10a19kcGlf
c3dfcmVzZXQoZHBpLCBmYWxzZSk7DQo+ID4gDQo+ID4gLS0NCj4gPiAyLjE4LjANCg0KQlJzLA0K
UmV4LUJDIENoZW4NCj4gPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
