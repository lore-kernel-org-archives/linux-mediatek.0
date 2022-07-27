Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76552C00144
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 02:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJIYOzq8p4/NMIHxEWW4PzbgiKugO9XSLYlrMaOm1lw=; b=CBBpuVBlEP69nZpecYrIp/shfk
	Ne5bC8sLv/OrQm0JcIFcS181GgEOBEJ3cSWZx4at2gKzA40+aim/cEsbyr1TlICXs/cudwp5poI7T
	PzbYhPkPNq8W9Pgbm6QUwFdXbO6itwdmuXjwzA3STvDDN3a2NgkBHe6gLgzIUSP69DAVX37+CEt/i
	r2Pza7XsK8/Nlt/WvBPzyjmQMkkjSi7030bfo38uQKtM5pM6eD5NbIHu+kgzlYWGTZY8qpN1UT3z4
	IXNMWbv0lFrv7SP0Edv5oX/J9RyNUDVYvXHHKyXuXfHAYoS8KpmzW2nEW8Zyi0XipefYUOaOzsjAd
	W31cowJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGXCt-0082t5-0h; Wed, 27 Jul 2022 02:55:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGXCp-0082o4-RV
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 02:55:29 +0000
X-UUID: 51c5ac00f1ab4101a0a2d6c200192247-20220726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject; bh=pJIYOzq8p4/NMIHxEWW4PzbgiKugO9XSLYlrMaOm1lw=;
	b=uhU4R8sFx4dS/YtlZbLJpKusno/G2zYDJiJXiTM5NytfSgfOzZGF5WpxYk/1rl0Bv1VMhfp6kpUZ3apycAmL5ak8A0OqHgJBRvu8V568k1fZBdVoMG01qzfuiEHK7QQ3va1WaukZMeZkEpHRnMJz9pbTsSjoP2Ob1D1u3vTWjaE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5ecacec3-5748-4319-be6d-8d41a1fb1f76,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:70790ad4-912a-458b-a623-74f605a77e93,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 51c5ac00f1ab4101a0a2d6c200192247-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 894001957; Tue, 26 Jul 2022 19:55:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 27 Jul 2022 10:34:47 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 27 Jul 2022 10:34:47 +0800
Subject: Re: [SPAM]Re: [PATCH v4] ufs: core: correct ufshcd_shutdown flow
To: Bart Van Assche <bvanassche@acm.org>, <stanley.chu@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <stable@vger.kernel.org>
References: <20220726113653.25024-1-peter.wang@mediatek.com>
 <99a93de2-70ee-da5f-4e94-676c0666acc2@acm.org>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <bdadfefb-b0e7-f7f8-bdab-4ca042e0ac5b@mediatek.com>
Date: Wed, 27 Jul 2022 10:34:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <99a93de2-70ee-da5f-4e94-676c0666acc2@acm.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_195527_918351_B4523322 
X-CRM114-Status: GOOD (  12.53  )
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

DQpPbiA3LzI3LzIyIDI6MzQgQU0sIEJhcnQgVmFuIEFzc2NoZSB3cm90ZToNCj4gT24gNy8yNi8y
MiAwNDozNiwgcGV0ZXIud2FuZ0BtZWRpYXRlay5jb20gd3JvdGU6DQo+PiBJbiBub3JtYWwgY2Fz
ZTogdWZzaGNkX3dsX3NodXRkb3duIC0+IHVmc2hjZF9zaHRkb3duDQo+PiB1ZnNoY2Rfc2h0ZG93
biBzaG91bGQgdHVybiBvZmYgY2xvY2svcG93ZXIgYWZ0ZXIgdWZzaGNkX3dsX3NodXRkb3duDQo+
PiB3aGljaCBzZXQgZGV2aWNlIHBvd2VyIG9mZiBhbmQgbGluayBvZmYuDQo+DQo+IFRoZSBhYm92
ZSBzZW50ZW5jZSBpcyBjb25mdXNpbmc6IGl0IG1lbnRpb25zICJub3JtYWwgY2FzZSIgd2hpY2gg
DQo+IHN1Z2dlc3RzIHRoZXJlIGlzIGFsc28gYW4gYWJub3JtYWwgY2FzZS4gSXNuJ3QgdGhlIG9y
ZGVyIGluIHdoaWNoIA0KPiB1ZnNoY2Rfd2xfc2h1dGRvd24oKSBhbmQgdWZzaGNkX3NodXRkb3du
KCkgYXJlIGNhbGxlZCBhbHdheXMgdGhlIHNhbWU/DQo+DQo+IE90aGVyd2lzZSB0aGlzIHBhdGNo
IGxvb2tzIGdvb2QgdG8gbWUuDQo+DQo+IFRoYW5rcywNCj4NCj4gQmFydC4NCg0KDQpIaSBCYXJ0
LA0KDQpZZXMsIFlvdSBhcmUgcmlnaHQsDQoNCkknIGxsIG1ha2UgcGF0Y2ggZGVzY3JpcHRpb24g
bW9yZSBjbGVhci4NCg0KDQpUaGFua3MNCg0KUGV0ZXINCg==


