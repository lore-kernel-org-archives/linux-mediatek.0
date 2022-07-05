Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBF9C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 01:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGGUbbdc7XQsocKf3G/x2L9ysliPj17c694+S9fJBTg=; b=GfQC9NF0Sgnny82syab5nZaDZf
	T/bel3oY3skSe1NhcoyUToln/OIPNR+gNsBO40FYVVM7BB7DbLn8j7DVEetbJyn5Urhnd0BPfUKVN
	3PURuYdMYw4LX9H/Zl83i7xWm7FEG1VyICShdQQpbf2JbLZnF2heEiczDCSyHy8nkkv2oOWWgkst0
	A96fEHjgqAjv6rYP/D/Nt/iEY/tt3Wm/haWB7zmDf24+sZw/YWbw8mloIUEGUn8t+AjPzTez4ffF1
	zsEyp2UOk1yDYlV9SN+lazmyCWtyvoVCgWDVc2mSFXiI8HXS/g8gjLBJFqOqj04MCFQkMk6vBhrZQ
	GxHWUD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Xgr-00Dqek-Rg; Tue, 05 Jul 2022 01:49:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Xgp-00Dqaj-3o; Tue, 05 Jul 2022 01:49:24 +0000
X-UUID: 5d4f4f1c86554b60b391bab7d2b2ca23-20220704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=IGGUbbdc7XQsocKf3G/x2L9ysliPj17c694+S9fJBTg=;
	b=o92dSns2H5OOTJcwTgw1AitQqMG0n7aQto7ARyE6MVnNAntwH4Ow5nGkSa14hNDjfgGpCjcFfLBvnUXdfwypMjIarBIFPVlV3gbQ1GTQbtDjnut8XZMHDW26bbkDphV7LaoQPPpmWWNVC9AtgLR5qg0RfayHba1lvlnjlSESQRY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e6d9bd81-9e38-4422-9498-ad581a33adbc,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:10,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:15
X-CID-META: VersionHash:0f94e32,CLOUDID:b9ba99d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5d4f4f1c86554b60b391bab7d2b2ca23-20220704
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1453103970; Mon, 04 Jul 2022 18:49:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 5 Jul 2022 09:38:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 5 Jul 2022 09:38:37 +0800
Message-ID: <25f13cd960f786a1f39b9675c82ea37e1a16b5c3.camel@mediatek.com>
Subject: Re: [PATCH v12 2/2] iommu/mediatek: Allow page table PA up to 35bit
From: Yong Wu <yong.wu@mediatek.com>
To: <yf.wang@mediatek.com>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Miles Chen
	<miles.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, Libo Kang <Libo.Kang@mediatek.com>, Ning Li
	<ning.li@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Date: Tue, 5 Jul 2022 09:38:37 +0800
In-Reply-To: <20220630092927.24925-3-yf.wang@mediatek.com>
References: <20220630092927.24925-1-yf.wang@mediatek.com>
	 <20220630092927.24925-3-yf.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_184923_365376_74C9A15F 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCAyMDIyLTA2LTMwIGF0IDE3OjI5ICswODAwLCB5Zi53YW5nQG1lZGlhdGVrLmNvbSB3
cm90ZToNCj4gRnJvbTogWXVuZmVpIFdhbmcgPHlmLndhbmdAbWVkaWF0ZWsuY29tPg0KPiANCj4g
U2luZ2xlIG1lbW9yeSB6b25lIGZlYXR1cmUgd2lsbCByZW1vdmUgWk9ORV9ETUEzMiBhbmQgWk9O
RV9ETUEuIFNvDQo+IGFkZA0KPiB0aGUgcXVpcmsgSU9fUEdUQUJMRV9RVUlSS19BUk1fTVRLX1RU
QlJfRVhUIHRvIGxldCBsZXZlbCAxIGFuZCBsZXZlbA0KPiAyDQo+IHBndGFibGUgc3VwcG9ydCBh
dCBtb3N0IDM1Yml0IFBBLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmluZyBMaSA8bmluZy5saUBt
ZWRpYXRlay5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFl1bmZlaSBXYW5nIDx5Zi53YW5nQG1lZGlh
dGVrLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFlvbmcgV3UgPHlvbmcud3VAbWVkaWF0ZWsuY29tPg0K


