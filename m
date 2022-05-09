Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE00C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 23:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6+OosjlTwVl3LBVhD7TPb0YXWo2TjQ96qMxDP3l+3I=; b=wYNs7Fomq8u2/P
	aLYc69n3xtwk6+5KJTqZNHL4J3W/kpHvi1yrmeCJy2pabce+3J74jOe/lOjy/Br+jFdhvY7HN4gEW
	qlOJ82K4ysEz+7yqf7p1IDbMfaeixFYMe45kN82260yLmMWZyGYYJo91qXEjbKjnJi6rThfsFSESU
	NbgnQHjo+cH/ZmD8i4dxex2TwGJOShIVo7LjxDH3ljH5shF92/TtPNGYkzmlRigb6LSUXHGTJi1IM
	QJNFsnaoCWPdeCs27NqzILyXQbMffWa6BPYVUoB1i5pSVAljoK6H91k1FR2i23nQ2s2Uiagh6sVv0
	Go6sB6A7rvfwMpy42Mgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noCoA-00GiaA-9W; Mon, 09 May 2022 23:28:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noCnx-00GiMj-NJ; Mon, 09 May 2022 23:28:44 +0000
X-UUID: 4f3a8186dae94161ac608d42526d06d7-20220509
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c95cbf6a-92ed-4824-b162-7d97c8d75fc4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:586dcb16-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4f3a8186dae94161ac608d42526d06d7-20220509
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1745187795; Mon, 09 May 2022 16:28:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 May 2022 16:18:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 10 May 2022 07:18:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 10 May 2022 07:18:08 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <robh@kernel.org>
CC: <allen-kh.cheng@mediatek.com>, <angelogioacchino.delregno@collabora.com>, 
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <ikjn@chromium.org>, <krzk+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <matthias.bgg@kernel.org>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding of
 mt8192 clock
Date: Tue, 10 May 2022 07:18:08 +0800
Message-ID: <20220509231808.7657-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YnmXX0DldjhmbjY3@robh.at.kernel.org>
References: <YnmXX0DldjhmbjY3@robh.at.kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_162841_788152_0C590500 
X-CRM114-Status: GOOD (  15.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

>On Thu, May 05, 2022 at 01:31:11PM +0800, Miles Chen wrote:
>> Hi Rob,
>> 
>> >> From: Matthias Brugger <matthias.bgg@gmail.com>
>> >> 
>> >> The msdc gate is part of the MMC driver. Delete the binding description
>> >> of this node.
>> > 
>> >An ABI break is okay because ...?
>> 
>> Sorry for that, 
>> 
>> If the mediatek,mt8192-msdc part is removed from the driver, 
>
>That's an ABI break too. You just need to explain why as Matthias did in 
>the commit message if the ABI break is okay.

Thanks for your explanation.

I would like to learn more about this. In this case
If there was a user (say xxx.c) but the user was removed, can I remove mediatek,mt8192-msdc?

thanks,
Miles

>
>> Is it ok to keep "mediatek,mt8192-msdc" in the binding document? or 
>> we should add '# deprecated' to "mediatek,mt8192-msdc" and keep the example.
>
>We do that sometimes, but depends on the situation.
>
>Rob


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
