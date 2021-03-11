Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B47C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 09:50:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE14964E04
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 09:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE14964E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EGQBS0gnpEi2wNxW5AGVCL/UPc5ctAtzi2o4KHtrm6g=; b=K/fvsLoIg24qniajvdDHmEmTU
	9gBf3g6rB1mkbweBti+QWbQh32S5W2Dc1R80Xywwjv2KK94SQS9IfacrZrpUYx6zQx0YSmkKz38dJ
	tSsYp316/VAwiQZJKtmI4UarAdk9w1xbDS/aS8RL72mr8DQBML3Mrl+Oo6iP+CiOCcA3wlJ4koaxR
	9WhQAhMz0hwxFDZDmL8HKSTUPtz76pOhvKn2MnP6oATsEmgt+7w8rJXrCYKPPk3hU8X4hwPtw6IBj
	hcd/gU49BUcitp/4W3IpPRo8B3LlMgA34lpcARo41WI/kMosBepXYBWfwjdduuKwbidwHzTqwEVyU
	3HdcC6K9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKHxc-008mcC-G3; Thu, 11 Mar 2021 09:50:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKHxZ-008maq-4V; Thu, 11 Mar 2021 09:50:27 +0000
X-UUID: 1bc6547081dc44429cf8a81bca977b77-20210311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a9ej59heEilQzTKWC4HbE25Ht5GD9Ct0059vCNX/I/s=; 
 b=b/fiesXnCh7ySSCfvoHnSxpK/D4VYjfKySMm1KzuavvUqrRLcZl0zuryJ9ZuWVp0dbATFvwLXEC1/GFGdB7hg5cijeMlJ38lux1g+R/ZkJgyHWNftPczFTIyhV4czctrYw9SvggcuJEMSXuoCIhSlnMBZiGNIhg9W1/aXCLoFV4=;
X-UUID: 1bc6547081dc44429cf8a81bca977b77-20210311
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 37611026; Thu, 11 Mar 2021 01:50:19 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Mar 2021 01:50:18 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 11 Mar 2021 17:50:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Mar 2021 17:50:14 +0800
Message-ID: <1615456214.25662.62.camel@mhfsdcap03>
Subject: Re: [v8,5/7] PCI: mediatek-gen3: Add MSI support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Marc Zyngier <maz@kernel.org>, Pali =?ISO-8859-1?Q?Roh=E1r?=
 <pali@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Sj
 Huang" <sj.huang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, <anson.chuang@mediatek.com>
Date: Thu, 11 Mar 2021 17:50:14 +0800
In-Reply-To: <e6c53aa3863c3f5b0560ed65282fc5e2@kernel.org>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-6-jianjun.wang@mediatek.com>
 <20210311000555.epypouwxdbql2aqx@pali>
 <e6c53aa3863c3f5b0560ed65282fc5e2@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F9A112B6DED8DAAFAF6E68A112F27E84405F5EF3E9F86C2A91FF46CE880EBB382000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_095025_533122_5B03D618 
X-CRM114-Status: GOOD (  16.90  )
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

T24gVGh1LCAyMDIxLTAzLTExIGF0IDA4OjE5ICswMDAwLCBNYXJjIFp5bmdpZXIgd3JvdGU6DQo+
IE9uIDIwMjEtMDMtMTEgMDA6MDUsIFBhbGkgUm9ow6FyIHdyb3RlOg0KPiA+IE9uIFdlZG5lc2Rh
eSAyNCBGZWJydWFyeSAyMDIxIDE0OjExOjMwIEppYW5qdW4gV2FuZyB3cm90ZToNCj4gPj4gK3N0
YXRpYyBpbnQgbXRrX21zaV9ib3R0b21fZG9tYWluX2FsbG9jKHN0cnVjdCBpcnFfZG9tYWluICpk
b21haW4sDQo+ID4+ICsJCQkJICAgICAgIHVuc2lnbmVkIGludCB2aXJxLCB1bnNpZ25lZCBpbnQg
bnJfaXJxcywNCj4gPj4gKwkJCQkgICAgICAgdm9pZCAqYXJnKQ0KPiA+PiArew0KPiA+PiArCXN0
cnVjdCBtdGtfcGNpZV9wb3J0ICpwb3J0ID0gZG9tYWluLT5ob3N0X2RhdGE7DQo+ID4+ICsJc3Ry
dWN0IG10a19tc2lfc2V0ICptc2lfc2V0Ow0KPiA+PiArCWludCBpLCBod2lycSwgc2V0X2lkeDsN
Cj4gPj4gKw0KPiA+PiArCW11dGV4X2xvY2soJnBvcnQtPmxvY2spOw0KPiA+PiArDQo+ID4+ICsJ
aHdpcnEgPSBiaXRtYXBfZmluZF9mcmVlX3JlZ2lvbihwb3J0LT5tc2lfaXJxX2luX3VzZSwgDQo+
ID4+IFBDSUVfTVNJX0lSUVNfTlVNLA0KPiA+PiArCQkJCQlvcmRlcl9iYXNlXzIobnJfaXJxcykp
Ow0KPiA+PiArDQo+ID4+ICsJbXV0ZXhfdW5sb2NrKCZwb3J0LT5sb2NrKTsNCj4gPj4gKw0KPiA+
PiArCWlmIChod2lycSA8IDApDQo+ID4+ICsJCXJldHVybiAtRU5PU1BDOw0KPiA+PiArDQo+ID4+
ICsJc2V0X2lkeCA9IGh3aXJxIC8gUENJRV9NU0lfSVJRU19QRVJfU0VUOw0KPiA+PiArCW1zaV9z
ZXQgPSAmcG9ydC0+bXNpX3NldHNbc2V0X2lkeF07DQo+ID4+ICsNCj4gPj4gKwlmb3IgKGkgPSAw
OyBpIDwgbnJfaXJxczsgaSsrKQ0KPiA+PiArCQlpcnFfZG9tYWluX3NldF9pbmZvKGRvbWFpbiwg
dmlycSArIGksIGh3aXJxICsgaSwNCj4gPj4gKwkJCQkgICAgJm10a19tc2lfYm90dG9tX2lycV9j
aGlwLCBtc2lfc2V0LA0KPiA+PiArCQkJCSAgICBoYW5kbGVfZWRnZV9pcnEsIE5VTEwsIE5VTEwp
Ow0KPiA+PiArDQo+ID4+ICsJcmV0dXJuIDA7DQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4gK3N0YXRp
YyB2b2lkIG10a19tc2lfYm90dG9tX2RvbWFpbl9mcmVlKHN0cnVjdCBpcnFfZG9tYWluICpkb21h
aW4sDQo+ID4+ICsJCQkJICAgICAgIHVuc2lnbmVkIGludCB2aXJxLCB1bnNpZ25lZCBpbnQgbnJf
aXJxcykNCj4gPj4gK3sNCj4gPj4gKwlzdHJ1Y3QgbXRrX3BjaWVfcG9ydCAqcG9ydCA9IGRvbWFp
bi0+aG9zdF9kYXRhOw0KPiA+PiArCXN0cnVjdCBpcnFfZGF0YSAqZGF0YSA9IGlycV9kb21haW5f
Z2V0X2lycV9kYXRhKGRvbWFpbiwgdmlycSk7DQo+ID4+ICsNCj4gPj4gKwltdXRleF9sb2NrKCZw
b3J0LT5sb2NrKTsNCj4gPj4gKw0KPiA+PiArCWJpdG1hcF9jbGVhcihwb3J0LT5tc2lfaXJxX2lu
X3VzZSwgZGF0YS0+aHdpcnEsIG5yX2lycXMpOw0KPiA+IA0KPiA+IE1hcmMsIHNob3VsZCBub3Qg
YmUgdGhlcmUgYml0bWFwX3JlbGVhc2VfcmVnaW9uKCkgd2l0aCBvcmRlcl9iYXNlXzIoKT8NCj4g
PiANCj4gPiBiaXRtYXBfcmVsZWFzZV9yZWdpb24ocG9ydC0+bXNpX2lycV9pbl91c2UsIGRhdGEt
Pmh3aXJxLCANCj4gPiBvcmRlcl9iYXNlXzIobnJfaXJxcykpOw0KPiA+IA0KPiA+IEJlY2F1c2Ug
bXRrX21zaV9ib3R0b21fZG9tYWluX2FsbG9jKCkgaXMgYWxsb2NhdGluZw0KPiA+IG9yZGVyX2Jh
c2VfMihucl9pcnFzKSBpbnRlcnJ1cHRzLCBub3Qgb25seSBucl9pcnFzLg0KPiANCj4gSW5kZWVk
LCBnb29kIGNhdGNoLg0KDQpJIHdpbGwgZml4IGl0IGluIHRoZSBuZXh0IHZlcnNpb24sIHRoYW5r
cyBmb3IgeW91ciByZXZpZXcuDQoNCj4gDQo+IFRoYW5rcywNCj4gDQo+ICAgICAgICAgIE0uDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
