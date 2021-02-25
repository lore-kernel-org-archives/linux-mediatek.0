Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18735C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 03:10:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B631164EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 03:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B631164EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H/L3m03EOf/bS11FrGHX3JiusTgQmHh1Gt0sScKB4wg=; b=TjSwEM8BjXrdXQgP22TczUz4f
	5+1LprRvkSLwlU0jNI7kR7hTDqt7pM/1RPYwObqvRfjtWqz3RreouB3kvMvbH2aTR8Ve8+tRcXbyP
	yqrIxOwm2AR2XKPmwhJtuuj9wxf4Nt+mL4TbdU4ewPrwgyQ/RtLDgxiD1vC8vOAD8LaLLAGWkJ/xY
	DTuUqc1du79N0dCUYFLehFY/fFytkr7viH+x6csPJ7NmiL8spsR4RigliwAf6e1PVADrMdJkecuvL
	bS/Iw41QR8KtgAsYLs7oe4oP5hLpGvekh3ikgQaMNrkRQvSIc7h+VHiQTH+h/vc/gK/8e9cA9kCJA
	6LUI5PdgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF72U-000588-Aj; Thu, 25 Feb 2021 03:10:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF72S-000578-G3; Thu, 25 Feb 2021 03:10:05 +0000
X-UUID: 20ced85e770c4986b61c619b1de837d1-20210224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1zp0U8dsDetgT6kM22d52xIB+sQkmxl4ezqgzrOyb3g=; 
 b=ebADRC50u0ypJeSXBODAjtlV7jOilV1qHFGC4wYUMh3cbC7lKTA7uyoPl+AuYMe0iGX562DTh5ei+cl3TFqEB1lKSzpmy2pnzPfWI0PGWbdAeZi5aM9WH6gI9lsmNULIqSZ592tDoCmF16Ek8BOz8ah3GsByQS+BPl8k1ZQDdRw=;
X-UUID: 20ced85e770c4986b61c619b1de837d1-20210224
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 269727773; Wed, 24 Feb 2021 19:09:55 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Feb 2021 19:09:54 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 25 Feb 2021 11:09:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Feb 2021 11:09:46 +0800
Message-ID: <1614222586.25750.7.camel@mhfsdcap03>
Subject: Re: [v8,5/7] PCI: mediatek-gen3: Add MSI support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Date: Thu, 25 Feb 2021 11:09:46 +0800
In-Reply-To: <YDZjOHKmks9ChFQI@rocinante>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-6-jianjun.wang@mediatek.com>
 <YDZjOHKmks9ChFQI@rocinante>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EAE103E295B37CA6894E09C61D96B779CBA43719D8E25FE9B54B3F4A000DA6162000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_221004_772989_7662E3E8 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rex-BC.Chen@mediatek.com,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com, maz@kernel.org,
 drinkcat@chromium.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, sin_jieyang@mediatek.com, Sj
 Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 anson.chuang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LCBJIHdpbGwgZml4IGl0IGF0
IG5leHQgdmVyc2lvbi4NCg0KT24gV2VkLCAyMDIxLTAyLTI0IGF0IDE1OjMxICswMTAwLCBLcnp5
c3p0b2YgV2lsY3p5xYRza2kgd3JvdGU6DQo+IEhpIEppYW5qdW4sDQo+IA0KPiBbLi4uXQ0KPiA+
ICtzdGF0aWMgc3RydWN0IGlycV9jaGlwIG10a19tc2lfaXJxX2NoaXAgPSB7DQo+ID4gKwkubmFt
ZSA9ICJNU0kiLA0KPiA+ICsJLmlycV9lbmFibGUgPSBtdGtfcGNpZV9pcnFfdW5tYXNrLA0KPiA+
ICsJLmlycV9kaXNhYmxlID0gbXRrX3BjaWVfaXJxX21hc2ssDQo+ID4gKwkuaXJxX2FjayA9IGly
cV9jaGlwX2Fja19wYXJlbnQsDQo+ID4gKwkuaXJxX21hc2sgPSBtdGtfcGNpZV9pcnFfbWFzaywN
Cj4gPiArCS5pcnFfdW5tYXNrID0gbXRrX3BjaWVfaXJxX3VubWFzaywNCj4gPiArfTsNCj4gDQo+
IEZvciBjb25zaXN0ZW5jeSBzYWtlLCB3aGF0IGFib3V0IGFsaWduaW5nIHRoaXMgbGlrZSB0aGUN
Cj4gc3RydWN0IG10a19tc2lfYm90dG9tX2lycV9jaGlwIGhhcyBiZWVuPyAgU2VlIGltbWVkaWF0
ZWx5IGJlbG93Lg0KPiANCj4gWy4uLl0NCj4gPiArc3RhdGljIHN0cnVjdCBpcnFfY2hpcCBtdGtf
bXNpX2JvdHRvbV9pcnFfY2hpcCA9IHsNCj4gPiArCS5pcnFfYWNrCQk9IG10a19tc2lfYm90dG9t
X2lycV9hY2ssDQo+ID4gKwkuaXJxX21hc2sJCT0gbXRrX21zaV9ib3R0b21faXJxX21hc2ssDQo+
ID4gKwkuaXJxX3VubWFzawkJPSBtdGtfbXNpX2JvdHRvbV9pcnFfdW5tYXNrLA0KPiA+ICsJLmly
cV9jb21wb3NlX21zaV9tc2cJPSBtdGtfY29tcG9zZV9tc2lfbXNnLA0KPiA+ICsJLmlycV9zZXRf
YWZmaW5pdHkJPSBtdGtfcGNpZV9zZXRfYWZmaW5pdHksDQo+ID4gKwkubmFtZQkJCT0gIk1TSSIs
DQo+ID4gK307DQo+IA0KPiBLcnp5c3p0b2YNCg0KVGhhbmtzLg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
