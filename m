Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1921C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 07:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWrb7A/0vgS+OVlzB79lUDORFpO8ol/uq+Drk2KcSYM=; b=c0CaGetwjJeqebW4sD2kv60tR+
	wkMUnf1hYttwr0yFil4vLSdhqf9sMaW8464rg661C1ZFBw2hvts7RuPBLozyFBtUsE9rDeIJh33P4
	0JMBJtgRoKL0DLktF8jcs2PQBhTuNDjoCr+1B4BwgoCeFpz0PYv4UmxL53YjQckBHe5TmWQVJ2nt6
	CPsTZ3gqbeU3tU7vIF85L7bIbRCIEQSnDpsRqiHBlmwJvNb5Ful1aEfGhG72QJT2U7Rc5K9amA6J/
	8YclJeqKjZfkTmBuqxsxVTKaFeKVMqHBGTKC1ChlGXebIFDSM8qzpbu7US7qYTY6lQsW/8y9NyJ2o
	ztfppZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGy7g-005TLf-5a; Thu, 28 Jul 2022 07:39:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGy7S-005TG3-E0; Thu, 28 Jul 2022 07:39:45 +0000
X-UUID: a78ab32afc9f460895c83317e79d2eab-20220728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=IWrb7A/0vgS+OVlzB79lUDORFpO8ol/uq+Drk2KcSYM=;
	b=kyfvGoanRVQdh6Url0OSu8gKqG5KCFm2rSxokcl6Kj3Wq5a+6xmxVnAB0BGY/lgHtxcB6UTG57tx7Jbvb0LAQZTt823XmUpLE0Ta3AaeGqkHUTZmLEXHisUX4cnRyF/BdOoL0D0cKF/mENqfMOunlFiihj8P4DPgV77jC3GhjeA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:8dfbcf1c-dc50-4485-ae1b-c24cc82c1e95,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:24,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:24
X-CID-META: VersionHash:0f94e32,CLOUDID:26a38fd0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:3,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a78ab32afc9f460895c83317e79d2eab-20220728
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1007618682; Thu, 28 Jul 2022 00:39:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 28 Jul 2022 14:59:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 14:59:00 +0800
Message-ID: <cf9c5b0cfdcf9f7f26906f263d2fe4e871c94d7a.camel@mediatek.com>
Subject: Re: [PATCH v3 3/3] memory: mtk-smi: mt8188: Add SMI Support
From: Yong Wu <yong.wu@mediatek.com>
To: Chengci.Xu <chengci.xu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 28 Jul 2022 14:59:00 +0800
In-Reply-To: <20220727104541.7309-4-chengci.xu@mediatek.com>
References: <20220727104541.7309-1-chengci.xu@mediatek.com>
	 <20220727104541.7309-4-chengci.xu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_003942_498121_0625380F 
X-CRM114-Status: UNSURE (   8.00  )
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

T24gV2VkLCAyMDIyLTA3LTI3IGF0IDE4OjQ1ICswODAwLCBDaGVuZ2NpLlh1IHdyb3RlOg0KPiBB
ZGQgbXQ4MTg4IHNtaSBjb21tb24gJiBsYXJiIHN1cHBvcnQNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IENoZW5nY2kuWHUgPGNoZW5nY2kueHVAbWVkaWF0ZWsuY29tPg0KDQpSZXZpZXdlZC1ieTogWW9u
ZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL21lbW9yeS9t
dGstc21pLmMgfCA3MQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKQ0K


