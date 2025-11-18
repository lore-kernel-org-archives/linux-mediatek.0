Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28847CEBF92
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Nov 2025 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftxHiNrtC+ti7V8R2Zi43QPvXWdUXaFm0pDBk/+vdC8=; b=BP6ba35PceuICph6uhq5cPmv9V
	NkKMU/2vmwdM5Pu3vY/7QAg7F7gfKYbngH8IcdcAr95FHS3ijZCiY4jcC0dAL7J1WkD6EtRyD91KZ
	YCYAnM9wZN5t5IwlU5ZYFJKfRek54jE8FOt9JI1i+rMB0zLnmINR3+xL+WkP5XJnzSPkIxN6t3HNe
	jxzM0o0kspNA9+H/GnMKoQCL3xJvivV6NrUqLGEHKet/v06vH//BHQnq85WXj+UZCAxcXVICwW5pr
	r3pjxchCrphsCNR+QUPGNAnEvNKtxdQAGvvwKp0akOFmMIAeGM/ec7RrCjGfq6EvHag9VsAfI7oLT
	mSbUFiPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLH7X-000000003j9-2IAZ;
	Tue, 18 Nov 2025 08:31:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLH7M-000000003hf-1ouY
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Nov 2025 08:31:26 +0000
X-UUID: f03afb2ec45811f09f706fa2197c6ceb-20251118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ftxHiNrtC+ti7V8R2Zi43QPvXWdUXaFm0pDBk/+vdC8=;
	b=Uq3h2piFTZHcXCAfnM/BRZGrgCHSPP+I75AEPPf4LGUQOx/AhhA7vYwcAsCNHjRi1T/U80xysI5ZmGCcVWl/ArUFry5CdIGyr8ZmJn3MxMz3cbTWefeX3f17xhZIacl+B5l22/3FX1nGtSNhhKdV6P8MHijsLMIhTVa7y2zv1+0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:fedc1c1d-ae27-4f7d-b342-02f85a0d2c4d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:ccab0558-17e4-43d2-bf73-55337eed999a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|836|888|898,TC:-5,Co
	ntent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f03afb2ec45811f09f706fa2197c6ceb-20251118
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ya-jou.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1852644839; Tue, 18 Nov 2025 01:31:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 18 Nov 2025 16:31:09 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Tue, 18 Nov 2025 16:31:09 +0800
Message-ID: <119e2410ca32a0d55fa6febf93c7a3164b391db0.camel@mediatek.com>
Subject: Re: [PATCH v1] PM: sleep: core: Fix runtime PM enabling in
 device_resume_early()
From: Rose Wu <ya-jou.wu@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, <linux-pm@vger.kernel.org>
CC: <rafael.j.wysocki@intel.com>, <regressions@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, artis.chiu <artis.chiu@mediatek.com>,
	Johnny-cc.Kao <Johnny-cc.Kao@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 16:31:08 +0800
In-Reply-To: <5940388.DvuYhMxLoT@rafael.j.wysocki>
References: <70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com>
	 <CAJZ5v0jjQgoa8eRyQ-MVQW=FeOEVQP6YTsY7o49LV2wnO=xEDw@mail.gmail.com>
	 <5940388.DvuYhMxLoT@rafael.j.wysocki>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_003116_924027_F5975720 
X-CRM114-Status: GOOD (  11.17  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksDQoNCk9uIE1vbiwgMjAyNS0xMS0xNyBhdCAxOTo1NyArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6DQo+IA0KPiBNYWtlIHR3byBjaGFuZ2VzIHRvIGFkZHJlc3MgdGhpcyBwcm9ibGVt
Lg0KPiANCj4gRmlyc3QsIHJlb3JkZXIgZGV2aWNlX3N1c3BlbmRfbGF0ZSgpIHRvIG9ubHkgZGlz
YWJsZSBydW50aW1lIFBNIGZvciBhDQo+IGRldmljZSBpZiB0aGUgcG93ZXIuaXNfbGF0ZV9zdXNw
ZW5kZWQgZmxhZyBpcyBnb2luZyB0byBiZSBzZXQgZm9yIGl0Lg0KPiBJbiBhbGwgb2YgdGhlIG90
aGVyIGNhc2VzLCBkaXNhYmxpbmcgcnVudGltZSBQTSBmb3IgdGhlIGRldmljZSBpcyBub3QNCj4g
aW4gZmFjdCBuZWNlc3NhcnkuDQo+IA0KPiBTZWNvbmQsIG1ha2UgZGV2aWNlX3Jlc3VtZV9lYXJs
eSgpIG9ubHkgZW5hYmxlIHJ1bnRpbWUgUE0gZm9yIHRoZQ0KPiBkZXZpY2VzIHdpdGggdGhlIHBv
d2VyLmlzX2xhdGVfc3VzcGVuZGVkIGZsYWcgc2V0Lg0KPiANCg0KTXkgY29uY2VybiBpcyB3aXRo
IHRoZSBlcnJvciBwYXRoIGluIGRldmljZV9zdXNwZW5kX2xhdGUoKS4NCklmIGEgZGV2aWNlIGZh
aWxzIGl0cyBkcG1fcnVuX2NhbGxiYWNrKCksIGl0IGFwcGVhcnMgdGhhdCBpdHMNCnBvd2VyLmlz
X2xhdGVfc3VzcGVuZGVkIGZsYWcgaXMgbm90IHNldCwgcG90ZW50aWFsbHkgbGVhdmluZyBpdHMg
cnVudGltZQ0KUE0gZGlzYWJsZWQgZHVyaW5nIHRoZSByZXN1bWUgc2VxdWVuY2UuDQoNClJlZ2Fy
ZHMsDQpSb3Nl


