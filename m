Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79FFC07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:07:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79104611AC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79104611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s2ZE5gTSam24WgD9ZNYKk3MvaMQ6+7g7mrvx+kD0dXk=; b=pq++dlUs/kPcSN
	FBCLKGyIcHxcWhu5zsUjfzlu6Tw+ahkafyBUXuLZAPwQzsgi+Pwk9teKIG4rmgnk4qG4HcZAchjSu
	+AJS+zvGgVHaRWCCEOOtXgr7z7YrADe35nNiwQjT6lKDeLSWTw53lf5RYgcX9S25x2FYK3i08cwcK
	xiFR1ocRiy07DP5ZoXx8b4BTuNIRs6ll3MEiXG5GdTwYut9QXVy37XB4qjBFvnIZ6P7vZLPv3ECtJ
	7GKpCwDSzJWKWegxm+iOag8Ea+eqSoIaY2ZSVzRij0y3xTieR1peZ4HsnTuitUU1UEnr7iv5bCD/r
	76LoY0XAsyLdl7ueo+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4IsY-003df1-7r; Fri, 16 Jul 2021 08:07:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4IsT-003de3-PD; Fri, 16 Jul 2021 08:07:24 +0000
X-UUID: 9257359266b04c56b077a1f09baf5577-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ycgkqi41ryYYvXCErvduEcHjhMqTW1StJxcM00pk22I=; 
 b=An/Ciqt6ekI2/8RQufdS9JbfCouMCkRn6I71rpNHmHU9RTVeaDXaZcjF2BcZS70qVOS+ubdIyyL1TNbbgpwSMLfho6qK+p5KVMgPvw3pmg47O09mHoGMQGGtmhEub1rIBqz+x/PRc/q/vMpJaT80S+pRIYYW/2EbnjHrxxk1j+8=;
X-UUID: 9257359266b04c56b077a1f09baf5577-20210716
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 585170103; Fri, 16 Jul 2021 01:07:20 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:07:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 16:07:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 16:07:16 +0800
Message-ID: <7016862f2f35386445d68f0c3f5f35ed2b105d82.camel@mediatek.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: mediatek: add definition for mt8195
 display
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 Nancy Lin <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Fri, 16 Jul 2021 16:07:16 +0800
In-Reply-To: <CAAOTY_-FS_wWgyo7gZu_qPxqhNOQsp+q172Y=d=dttEi_LVT9Q@mail.gmail.com>
References: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
 <20210710113819.5170-2-jason-jh.lin@mediatek.com>
 <CAAOTY_-FS_wWgyo7gZu_qPxqhNOQsp+q172Y=d=dttEi_LVT9Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_010721_873482_E74F50B7 
X-CRM114-Status: GOOD (  23.23  )
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

T24gU3VuLCAyMDIxLTA3LTExIGF0IDA5OjIxICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgSmFzb246DQo+IA0KPiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5j
b20+IOaWvCAyMDIx5bm0N+aciDEw5pelIOmAseWFrSDkuIvljYg3OjM45a+r6YGT77yaDQo+ID4g
DQo+ID4gQWRkIGRlZmluaXRpb24gZm9yIG10ODE5NSBkaXNwbGF5Lg0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCj4gPiAt
LS0NCj4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQg
ICAgICAgICAgfCA5DQo+ID4gKysrKysrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWss
ZGlzcC4NCj4gPiB0eHQNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AuDQo+ID4gdHh0DQo+ID4gaW5kZXggZmJiNTlj
OWRkZGE2Li5kZTYyMjZkNGJjYTMgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLg0KPiA+
IHR4dA0KPiA+ICsrKw0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC4NCj4gPiB0eHQNCj4gPiBAQCAtMzcsNiArMzcs
NyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChhbGwgZnVuY3Rpb24gYmxvY2tzKToNCj4gPiAgICAg
ICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1hYWwiICAgICAgICAgICAgICAtIGFkYXB0aXZlIGFt
YmllbnQNCj4gPiBsaWdodCBjb250cm9sbGVyDQo+ID4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+
LWRpc3AtZ2FtbWEiICAgICAgICAgICAgLSBnYW1tYSBjb3JyZWN0aW9uDQo+ID4gICAgICAgICAi
bWVkaWF0ZWssPGNoaXA+LWRpc3AtbWVyZ2UiICAgICAgICAgICAgLSBtZXJnZSBzdHJlYW1zDQo+
ID4gZnJvbSB0d28gUkRNQSBzb3VyY2VzDQo+ID4gKyAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRp
c3AtZHNjIiAgICAgICAgICAgICAgLSBEU0MgY29udHJvbGxlciwNCj4gPiBzZWUgbWVkaWF0ZWss
ZHNjLnlhbWwNCj4gDQo+IFlvdSBhZGQgZHNjIGJpbmRpbmcgZG9jdW1lbnQgaW4geWFtbCBmb3Jt
YXQsIHNvIEkgd291bGQgbGlrZSB5b3UgdG8NCj4gY2hhbmdlIHRoaXMgYmluZGluZyBkb2N1bWVu
dCB0byB5YW1sIGZvcm1hdC4NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KSGkg
Q0ssDQoNCk9LLCBJIHdpbGwgY2hhbmdlIHRoaXMgYmluZGluZyBkb2N1bWVudCB0byB5YW1sIGZv
cm1hdCBhdCB0aGUgbmV4dA0KdmVyc2lvbi4NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KPiA+
ICAgICAgICAgIm1lZGlhdGVrLDxjaGlwPi1kaXNwLXBvc3RtYXNrIiAgICAgICAgIC0gY29udHJv
bCByb3VuZA0KPiA+IGNvcm5lciBmb3IgZGlzcGxheSBmcmFtZQ0KPiA+ICAgICAgICAgIm1lZGlh
dGVrLDxjaGlwPi1kaXNwLXNwbGl0IiAgICAgICAgICAgIC0gc3BsaXQgc3RyZWFtIHRvDQo+ID4g
dHdvIGVuY29kZXJzDQo+ID4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZvZSIgICAg
ICAgICAgICAgLSBkYXRhIGNvbXByZXNzaW9uDQo+ID4gZW5naW5lDQo+ID4gQEAgLTQ0LDcgKzQ1
LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllcyAoYWxsIGZ1bmN0aW9uIGJsb2Nrcyk6DQo+ID4gICAg
ICAgICAibWVkaWF0ZWssPGNoaXA+LWRwaSIgICAgICAgICAgICAgICAgICAgLSBEUEkgY29udHJv
bGxlciwNCj4gPiBzZWUgbWVkaWF0ZWssZHBpLnR4dA0KPiA+ICAgICAgICAgIm1lZGlhdGVrLDxj
aGlwPi1kaXNwLW11dGV4IiAgICAgICAgICAgIC0gZGlzcGxheSBtdXRleA0KPiA+ICAgICAgICAg
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLW9kIiAgICAgICAgICAgICAgIC0gb3ZlcmRyaXZlDQo+ID4g
LSAgdGhlIHN1cHBvcnRlZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10MjcxMiwgbXQ4MTY3
LCBtdDgxNzMsDQo+ID4gbXQ4MTgzIGFuZCBtdDgxOTIuDQo+ID4gKyAgdGhlIHN1cHBvcnRlZCBj
aGlwcyBhcmUgbXQyNzAxLCBtdDc2MjMsIG10MjcxMiwgbXQ4MTY3LCBtdDgxNzMsDQo+ID4gbXQ4
MTgzLCBtdDgxOTIgYW5kIG10ODE5NS4NCj4gPiAgLSByZWc6IFBoeXNpY2FsIGJhc2UgYWRkcmVz
cyBhbmQgbGVuZ3RoIG9mIHRoZSBmdW5jdGlvbiBibG9jaw0KPiA+IHJlZ2lzdGVyIHNwYWNlDQo+
ID4gIC0gaW50ZXJydXB0czogVGhlIGludGVycnVwdCBzaWduYWwgZnJvbSB0aGUgZnVuY3Rpb24g
YmxvY2sNCj4gPiAocmVxdWlyZWQsIGV4Y2VwdCBmb3INCj4gPiAgICBtZXJnZSBhbmQgc3BsaXQg
ZnVuY3Rpb24gYmxvY2tzKS4NCj4gPiBAQCAtNjAsNyArNjEsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0
aWVzIChETUEgZnVuY3Rpb24gYmxvY2tzKToNCj4gPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4t
ZGlzcC1vdmwiDQo+ID4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtcmRtYSINCj4gPiAg
ICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC13ZG1hIg0KPiA+IC0gIHRoZSBzdXBwb3J0ZWQg
Y2hpcHMgYXJlIG10MjcwMSwgbXQ4MTY3IGFuZCBtdDgxNzMuDQo+ID4gKyAgdGhlIHN1cHBvcnRl
ZCBjaGlwcyBhcmUgbXQyNzAxLCBtdDgxNjcsIG10ODE3MyBhbmQgbXQ4MTk1Lg0KPiA+ICAtIGxh
cmI6IFNob3VsZCBjb250YWluIGEgcGhhbmRsZSBwb2ludGluZyB0byB0aGUgbG9jYWwgYXJiaXRl
cg0KPiA+IGRldmljZSBhcyBkZWZpbmVkDQo+ID4gICAgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lbW9yeS0NCj4gPiBjb250cm9sbGVycy9tZWRpYXRlayxzbWktbGFyYi55
YW1sDQo+ID4gIC0gaW9tbXVzOiBTaG91bGQgcG9pbnQgdG8gdGhlIHJlc3BlY3RpdmUgSU9NTVUg
YmxvY2sgd2l0aCBtYXN0ZXINCj4gPiBwb3J0IGFzDQo+ID4gQEAgLTIxNywzICsyMTgsNyBAQCBv
ZEAxNDAyMzAwMCB7DQo+ID4gICAgICAgICBwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQ4MTcz
X1BPV0VSX0RPTUFJTl9NTT47DQo+ID4gICAgICAgICBjbG9ja3MgPSA8Jm1tc3lzIENMS19NTV9E
SVNQX09EPjsNCj4gPiAgfTsNCj4gPiArDQo+ID4gK2RzYzA6IGRpc3BfZHNjX3dyYXBAMWMwMDkw
MDAgew0KPiA+ICsgICAgICAgLyogU2VlIG1lZGlhdGVrLGRzYy55YW1sIGZvciBkZXRhaWxzICov
DQo+ID4gK307DQo+ID4gLS0NCj4gPiAyLjE4LjANCj4gPiANCi0tIA0KSmFzb24tSkggTGluIDxq
YXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
