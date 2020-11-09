Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88FBC388F9
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:55:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8078C206D8
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 02:55:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qA/gyDPF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AYBo7ISD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8078C206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sxhyTxAn98WRwwS+PtUZPY0PhtG2jMApFXUzg8XzvkA=; b=qA/gyDPFov3vWd1HnJL00nJ6b
	Ggyy4zKEmYNjiznRbAQMajl2VqzsIQN1+i9UiUQBsVx+/Et3SJKfnuzDEailZbvHc5ZikH57SjfEz
	askMSEKQmx1xeLorswGzznYVEW3lQdcK/dkAJeSq3uiW+PbWp/0mFfIG+24ltkuJC7rA0AsymaoBj
	9aSSVf3PO9B9G/+6XI8qgpGFCLpNS1DJV2PLW56vkaSLoyoyMl+Iblnx3hR/JJjlGHOJRRRte118I
	WXGSQxdMYkT+dInoJ2Tx/OJhNg1GOC8MIFk7ivnh0kMcglTUKH571PjquSWKXHHzcnApUqbZ7IvVp
	pmPhWEMGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbxKm-0006nQ-JC; Mon, 09 Nov 2020 02:55:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbxKb-0006ju-F8; Mon, 09 Nov 2020 02:54:58 +0000
X-UUID: e1373822733246549f98814b47203c6a-20201108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SY3O4g5cCnAFIOujxdLpsvPadx+zid90DRWrx8369CE=; 
 b=AYBo7ISD44pylgaNwuLLM5jc9lMOwEQ0JicHVfyRvRYfByF5PqdhbXYY5WDhVOKBSGzYd0lbrcPJ5SyOZATQvfCXXYpWjAlEU5qCksSwwKBZREWqXhtNEqINZ5cBgImllf6VQ/MO7VbiRNZ4+zOtqbABsKsJDqBulwDs/YkaXJ8=;
X-UUID: e1373822733246549f98814b47203c6a-20201108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 910106053; Sun, 08 Nov 2020 18:54:54 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Nov 2020 18:44:52 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 9 Nov 2020 10:44:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 10:44:49 +0800
Message-ID: <1604889888.8050.2.camel@mhfsdcap03>
Subject: Re: [PATCH v7 1/4] dt-bindings: pci: mediatek: Modified the Device
 tree bindings
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 9 Nov 2020 10:44:48 +0800
In-Reply-To: <20201029153404.GB1911637@bogus>
References: <20201029081513.10562-1-chuanjia.liu@mediatek.com>
 <20201029081513.10562-2-chuanjia.liu@mediatek.com>
 <20201029153404.GB1911637@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0B8DC20FA256E306737C32FE0F5BB9A804E6154DDD2C851826D6720B0E6762F92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201108_215457_698543_CD528F56 
X-CRM114-Status: GOOD (  18.15  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, yong.wu@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIwLTEwLTI5IGF0IDEwOjM0IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gVGh1LCAyOSBPY3QgMjAyMCAxNjoxNToxMCArMDgwMCwgQ2h1YW5qaWEgTGl1IHdyb3RlOg0K
PiA+IFNwbGl0IHRoZSBQQ0llIG5vZGUgYW5kIGFkZCBwY2llY2ZnIG5vZGUgdG8gZml4IE1TSSBp
c3N1ZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVhbmppYSBMaXUgPGNodWFuamlhLmxp
dUBtZWRpYXRlay5jb20+DQo+ID4gQWNrZWQtYnk6IFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlh
dGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3BjaS9tZWRpYXRlay1wY2llLWNm
Zy55YW1sICAgICAgIHwgIDM5ICsrKysrKw0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9w
Y2kvbWVkaWF0ZWstcGNpZS50eHQgfCAxMjkgKysrKysrKysrKystLS0tLS0tDQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMTE4IGluc2VydGlvbnMoKyksIDUwIGRlbGV0aW9ucygtKQ0KPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9tZWRp
YXRlay1wY2llLWNmZy55YW1sDQo+ID4gDQo+IA0KPiANCj4gTXkgYm90IGZvdW5kIGVycm9ycyBy
dW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6DQo+IA0KPiB5YW1s
bGludCB3YXJuaW5ncy9lcnJvcnM6DQo+IC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BjaS9tZWRpYXRlay1wY2llLWNmZy55YW1sOjE5Ojc6IFt3YXJuaW5nXSB3cm9uZyBpbmRl
bnRhdGlvbjogZXhwZWN0ZWQgNCBidXQgZm91bmQgNiAoaW5kZW50YXRpb24pDQo+IA0KPiBkdHNj
aGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOg0KPiANCj4gDQo+IFNlZSBodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3BhdGNoLzEzODk5NDANCj4gDQo+IFRoZSBiYXNlIGZvciB0aGUgcGF0Y2gg
aXMgZ2VuZXJhbGx5IHRoZSBsYXN0IHJjMS4gQW55IGRlcGVuZGVuY2llcw0KPiBzaG91bGQgYmUg
bm90ZWQuDQo+IA0KPiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycg
YW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlDQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFt
bGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvDQo+IGRhdGU6DQo+IA0K
PiBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hlY2sgYW5k
IHJlLXN1Ym1pdC4NCj4gDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudO+8jEFmdGVyIGluc3RhbGwg
4oCYeWFtbGxpbnTigJkg77yMSSBjYW4gc2VlIHRoaXMNCndhcm5pbmcg77yMSSB3aWxsIGZpeCBp
dCBhbmQgcmViYXNlIHRvIDUuMTAtcmMxIGluIG5leHQgdmVyc2lvbi4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
