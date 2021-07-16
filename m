Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EEEC07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75580610C7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75580610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ao0ti7JCHAtOxW/8/zIhnQI9MMcS/o8S/Sbuo5YBGO8=; b=fp3UUyA/7GBsBW
	i3Y/00YDSa6fVnY4oGxDeQMh/WPAxndxTE0e1ssH0HcULjgcupSOAlV/XWWjf5SHH+ZuLVmAzFm5h
	kAmRADN2BljL1TlxboBX/Yhr6sMmHEXugUhzdLYepZG3q456Bd3hge8h3cLUoCOqTVu+cxirD/r4m
	MK11wVy96M419Ef0Vt+khsJ1PjCWxuflZnTiGYt6JDChlUBc+mRTSADEhBqRNj5Gq0QWZZdpV3GGW
	ALhd4B+10IdDq6GAcD61hGFjBInE9ddSjDNjq/rO+3yyjbIOTTj7WDI/cuZh6KnEKIx5VkqJklmIM
	2sDMqjEOzghpYxoj2TlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4JUw-003qG3-4M; Fri, 16 Jul 2021 08:47:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4JUt-003qEs-6r; Fri, 16 Jul 2021 08:47:04 +0000
X-UUID: c36540e52fc64e889945cf01bf77a3dc-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HAtMITVfO6Me2ipLnloxqV38ZLex0RwEgEL/1zH8yT8=; 
 b=KuXjdEyah93fWLPcItkeka87S0AXH3fZpCTHOtrEI/aQr4MfHWRhVXio29Sc4eL876qrLDqzdQVcpPDET70A/fGdAYtHeYzsZkSNcTIil3/5L9F3LIjSch+dc0JKo7fdzQ5EFjYsaffe7utwwSCMlUVssTcUq+j3die0Ml3xm00=;
X-UUID: c36540e52fc64e889945cf01bf77a3dc-20210716
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2583297; Fri, 16 Jul 2021 01:47:01 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:46:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 16:46:58 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 16:46:58 +0800
Message-ID: <2f2cf6aa5bbf3052e5cc78fdebf32844677b5063.camel@mediatek.com>
Subject: Re: [PATCH v2 0/9] Add MediaTek SoC DRM (vdosys0) support for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 Nancy Lin <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Fri, 16 Jul 2021 16:46:57 +0800
In-Reply-To: <CAAOTY_9wvVJ6zZDmOt-8zJK2BkLtEO-h6QQRVkbc8q5QXtns3g@mail.gmail.com>
References: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
 <CAAOTY_9wvVJ6zZDmOt-8zJK2BkLtEO-h6QQRVkbc8q5QXtns3g@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_014703_303550_F302B5FE 
X-CRM114-Status: GOOD (  18.01  )
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

T24gU3VuLCAyMDIxLTA3LTExIGF0IDA5OjI0ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgSmFzb246DQo+IA0KPiBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5j
b20+IOaWvCAyMDIx5bm0N+aciDEw5pelIOmAseWFrSDkuIvljYg3OjM45a+r6YGT77yaDQo+ID4g
DQo+ID4gVGhlIGhhcmR3YXJlIHBhdGggb2YgdmRvc3lzMCB3aXRoIGVEUCBwYW5lbCBvdXRwdXQg
bmVlZCB0byBnbw0KPiA+IHRocm91Z2gNCj4gPiBieSBzZXZlcmFsIG1vZHVsZXMsIHN1Y2ggYXMs
IE9WTCwgUkRNQSwgQ09MT1IsIENDT1JSLCBBQUwsIEdBTU1BLA0KPiA+IERJVEhFUiwgRFNDIGFu
ZCBNRVJHRS4NCj4gDQo+IFlvdSBzaG91bGQgYWRkIHRoZSBkaWZmZXJlbmNlIGluIGVhY2ggdmVy
c2lvbi4gWzFdIGlzIGFuIGV4YW1wbGUgZm9yDQo+IHRoaXMuDQo+IA0KPiBbMV0gDQo+IGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtbWVkaWF0ZWsvY292ZXIvMjAyMTA3MDkwMjIzMjQuMTYwNzg4NC0xLWVpemFuQGNo
cm9taXVtLm9yZy9fXzshIUNUUk5LQTl3TWcwQVJidyExRXdqd3JOQml4SFZad21nVTR3SVJ5VlVZ
aUw0MHhQYzY0b1VSZjZtVmVpSjVqX19zTy1rTU5MeWFMQmZSYzUzdTlxWCQNCj4gIA0KPiANCj4g
UmVnYXJkcywNCj4gQ2h1bi1LdWFuZy4NCj4gDQpIaSBDSywNCg0KSSdsbCBhZGQgdGhpcyBhdCB0
aGUgbmV4dCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQo+ID4gDQo+ID4gQWRk
IERSTSBhbmQgdGhlc2UgbW9kdWxlcyBzdXBwb3J0IGJ5IHRoZSBwYXRjaGVzIGJlbG93Og0KPiA+
IA0KPiA+IGphc29uLWpoLmxpbiAoOSk6DQo+ID4gICBkdC1iaW5kaW5nczogbWVkaWF0ZWs6IGFk
ZCBkZWZpbml0aW9uIGZvciBtdDgxOTUgZGlzcGxheQ0KPiA+ICAgZHQtYmluZGluZ3M6IG1lZGlh
dGVrOiBhZGQgRFNDIGRlZmluaXRpb24gZm9yIG10ODE5NQ0KPiA+ICAgZHQtYmluZGluZ3M6IGFy
bTogbWVkaWF0ZWs6IGFkZCBkZWZpbml0aW9uIGZvciBtdDgxOTUgbW1zeXMNCj4gPiAgIGFybTY0
OiBkdHM6IG10ODE5NTogYWRkIGRpc3BsYXkgbm9kZSBmb3IgdmRvc3lzMA0KPiA+ICAgc29jOiBt
ZWRpYXRlazogYWRkIG10ay1tbXN5cyBzdXBwb3J0IGZvciBtdDgxOTUgdmRvc3lzMA0KPiA+ICAg
c29jOiBtZWRpYXRlazogYWRkIG10ay1tdXRleCBzdXBwb3J0IGZvciBtdDgxOTUgdmRvc3lzMA0K
PiA+ICAgZHJtL21lZGlhdGVrOiBhZGQgbWVkaWF0ZWstZHJtIG9mIHZkb3N5czAgc3VwcG9ydCBm
b3IgTVQ4MTk1DQo+ID4gICBkcm0vbWVkaWF0ZWs6IGFkZCBEU0Mgc3VwcG9ydCBmb3IgTVQ4MTk1
DQo+ID4gICBkcm0vbWVkaWF0ZWs6IGFkZCBNRVJHRSBzdXBwb3J0IGZvciBNVDgxOTUNCj4gPiAN
Cj4gPiAgLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5cy50eHQgIHwgIDE1
ICsNCj4gPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgICAgIHwg
ICA5ICstDQo+ID4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRzYy55YW1sICAgICAg
ICB8ICA1NyArKw0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5NS5kdHNp
ICAgICAgfCAxMTEgKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvTWFrZWZpbGUg
ICAgICAgICAgICAgfCAgIDIgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3BfZHJ2LmggICAgICAgfCAgMTYgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3BfZHNjLmMgICAgICAgfCAyMDUgKysrKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfbWVyZ2UuYyAgICAgfCA1MjUNCj4gPiArKysrKysrKysrKysrKysrKysN
Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyAgICAgIHwgICA2
ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oICAgICAgIHwg
IDE0ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyAg
IHwgIDI5ICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAu
aCAgIHwgICAyICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMg
ICAgICAgIHwgIDMyICsrDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5oICAgICAgICB8ICAgMiArDQo+ID4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ODE5NS1tbXN5
cy5oICAgICAgICAgICB8IDE5MSArKysrKysrDQo+ID4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210
ay1tbXN5cy5jICAgICAgICAgICAgICB8ICAxMSArDQo+ID4gIGRyaXZlcnMvc29jL21lZGlhdGVr
L210ay1tdXRleC5jICAgICAgICAgICAgICB8IDEwNyArKystDQo+ID4gIGluY2x1ZGUvbGludXgv
c29jL21lZGlhdGVrL210ay1tbXN5cy5oICAgICAgICB8ICAxMCArDQo+ID4gIDE4IGZpbGVzIGNo
YW5nZWQsIDEzMzcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
bWVkaWF0ZWsvbWVkaWF0ZWssZHNjLnlhbQ0KPiA+IGwNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kc2MuYw0KPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX21lcmdlLmMNCj4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21lZGlhdGVrL210ODE5NS1tbXN5cy5oDQo+
ID4gDQo+ID4gLS0NCj4gPiAyLjE4LjANCj4gPiANCi0tIA0KSmFzb24tSkggTGluIDxqYXNvbi1q
aC5saW5AbWVkaWF0ZWsuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
