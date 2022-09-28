Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8B7C07E9D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 02:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+fSEED8koFMBB0jhsQvQ1pjxAX/BH3bjI3pxMvhkOY=; b=Iu5LRq8dUB4Uimqq9odHfawPP6
	EKYlDvYrHal/QmIyqswz1YW87rK8tPX8z1Zv9bbZVeOt6c5gFVTwfnmP1KN1NIyOTf3eDk6DKGMqu
	9Xt77qZUSdPel//FiGlgZoO/Vt9OBqKVSX2I7rXoIeqdtgYJV+EXmI23Bv9BRic6EqC993kGMykbL
	cJuRHNEv19+8NPpcFiip4FmdOw9YSkv0GeXmELTaPhq3wpS7EU67ZZZz+VtIzKVwsDbYKAYzfcSWY
	B23slOP9feQ3aGg6RnQ6ugD7F0ZPfQFuLK/rZQfdiSM8+oV5i8bPPdZSftq6aD+jnFJF725FEguX/
	tOeiY3kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odMc6-00DWyX-Pw; Wed, 28 Sep 2022 02:15:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odMc2-00DWuh-IA; Wed, 28 Sep 2022 02:15:52 +0000
X-UUID: 83a49cb4943b46aa9bee4a6a6cef69ee-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Q+fSEED8koFMBB0jhsQvQ1pjxAX/BH3bjI3pxMvhkOY=;
	b=kvqbjCwTZkhD8fLHDJ89Tpy1GezdmvKZ0bsJr8r5aZVfWFaPWsSOHsX5g6Uzs905e8Z2HgSoICMeaGdOjqXOSU8qVDBOGfPXSR5Caf9DdrxTCH//LiJqvnnLxxhutySTL3WnVVWAAb/lRnrkynBwxVqhGLsx3S3hAvt/vhYgd4o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:112ff860-a95a-4db8-8c96-5e732e34218f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:cf283e07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:-5,EDM:-3,IP:nil,
	URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 83a49cb4943b46aa9bee4a6a6cef69ee-20220927
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1032914646; Tue, 27 Sep 2022 19:15:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 09:55:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Sep 2022 09:55:06 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <wenst@chromium.org>
Subject: Re: [PATCH 3/6] clk: mediatek: mt8192: Do not re-register top_early_divs in probe function
Date: Wed, 28 Sep 2022 09:55:07 +0800
Message-ID: <20220928015507.17206-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <0a1618c4-b808-56bd-e89f-560b0423191d@collabora.com>
References: <0a1618c4-b808-56bd-e89f-560b0423191d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_191550_669514_4AB7B942 
X-CRM114-Status: GOOD (  13.85  )
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

>> top_early_divs are registered in the CLK_OF_DECLARE_DRIVER() half of the
>> topckgen clk driver. Don't try to register it again in the actual probe
>> function. This gets rid of the "Trying to register duplicate clock ..."
>> warning.
>> 
>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
>Can't we simply remove the CLK_OF_DECLARE_DRIVER() and top_init_early entirely,
>and transfer TOP_CSW_F26M_D2 to top_divs[] instead?
>I get that systimer concern and we have something similar in MT8195, where the
>TOP_CLK26M_D2 is registered "late".

Another reason for this:
Removing the CLK_OF_DECLARE_DRIVER() is good when we want to build our driver as
kernel modules because it does not work with kernel modules.

thanks,
Miles
>
>Getting back to MT8192, TOP_CSW_F26M_D2 seems to be used only for:
>1. systimer
>2. SPMI MST (registered "late").
>
>Being it a fixed factor clock, parented to another fixed clock, it doesn't
>even have any ON/OFF switch, so I think it would be actually possible to go
>for the proposed removal... which would further improve this cleanup.
>
>Regards,
>Angelo
>

