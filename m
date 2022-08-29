Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCADECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 06:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhK6lBBOqVRT4kKbaoyybEn8XZO56uWakDHEHA5gZEY=; b=gdzjb3fpjAMMq8xKB6Knb+Bg1p
	Ec+zmpwxAa5JCXaBTMVDkME+6msXUywC7cimFdTzShN6cZyYodZQx3i8dORV+3i97emPpi/MqzQfN
	CXtALdKtmRtM7ctmgc50XiHoTFuZwVnw145HfIwXmlo3nkgWbc5zUfr9+63urvrUCBMWiBBtKzFnH
	19K6WFJTVBenXmXi20ykkYc6KreAqbCDxdX9Jr/Y8opyzunMwXp20H1G7+GYAbs2JdNjolCyhWWa+
	WLKbhpNkBLZsA5lNNTC6pMzjevJnad+qEPzC2o0foucxVJgMp5BYqpU5zjlrdrXIsGY4LY/3R3Y8V
	+8ELRXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYIW-005I9F-DB; Mon, 29 Aug 2022 06:31:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSYIR-005I5I-Od; Mon, 29 Aug 2022 06:30:57 +0000
X-UUID: e45d5f7ec6d84d04a72d4eae33501f43-20220828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=JhK6lBBOqVRT4kKbaoyybEn8XZO56uWakDHEHA5gZEY=;
	b=tlvp4EdRygJ8nib9eAkt+X7PZnGMMb5FHXot/ZrrnCVtTvWGLR/sdt7TOR3hb1I5zk+5BRV3KtK1g8QOTeIwciohXiQ/6dJk1R+E8foIYsBhRxw33d6mWlAG6yDvz25dCLLZXc1BM6aJgKAz84ApROT8Fu+p2Kbf/YDWiGp0HpM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:8106a99c-da16-4ed3-b628-b1b7edc87344,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:8207dc55-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e45d5f7ec6d84d04a72d4eae33501f43-20220828
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1742371385; Sun, 28 Aug 2022 23:30:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 14:30:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 29 Aug 2022 14:30:12 +0800
Message-ID: <a95c06a3f40683cd6a645d7a064de6d4e53c9182.camel@mediatek.com>
Subject: Re: [PATCH 1/7] dt-bindings: phy: mediatek,tphy: add support type
 of SGMII
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>
Date: Mon, 29 Aug 2022 14:30:12 +0800
In-Reply-To: <20220823204432.ugfs7k3dn4ibbcky@notapiano>
References: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
	 <20220823204432.ugfs7k3dn4ibbcky@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_233056_438829_7D5C64AC 
X-CRM114-Status: GOOD (  13.89  )
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

On Tue, 2022-08-23 at 16:44 -0400, Nícolas F. R. A. Prado wrote:
> On Fri, Aug 19, 2022 at 05:13:38PM +0800, Chunfeng Yun wrote:
> > Add support ethernet SGMII, forgot to update type supported.
> > 
> > Fixes: c01608b3b46b ("dt-bindings: phy: mediatek: tphy: support
> > type switch by pericfg")
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> Hi Chunfeng,
> 
> when sending a patch series of more than 1 patch, please add a cover
> letter
> describing a higher level overview of the changes done in the
> patches. Example:
> [1]
For these small and independent changes, it's difficult to give a brief
description on a higher level overview, I prefer to add a cover letter
when the series are associated or dependent.

Thanks a lot

> 
> Thanks,
> Nícolas
> 
> [1] 
> https://lore.kernel.org/all/20220629155956.1138955-1-nfraprado@collabora.com/


