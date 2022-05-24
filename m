Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B6CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 05:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aV2xXizKvK7x3aIiDJgS7FC4xxfZRww4JJMutiCu1JY=; b=iaBnv7HOa52oJF
	7TkyJNFlWyGcoRyQj5t6ssSivuzdB+QCbIbO0oCZabEud+bGF2gU5CCbXYdpHnn6/H6AA0f5/75zl
	sYUTtiQgh28jKHpgjaCaGaMPsWyLZgbgRKDg3Omq54SagWkjEEkr+zVVzlKJaZW8Ru4h+aTBxZM4W
	k258KXOUSzNiL9wY77zpH592et75GtwuCmQs6csZmx4nmqlG/QsO8HFFwd6ZyibSqcd3whRrcWgDE
	Ju3a40yM1QNDY3W7tVBIrSeB+yrTxjG1lHxH1rh5XyL9cA9gG9A5DmBinXY9Q8t4w/ZEhJLu55chX
	7SxEWIvn4d9bRsjpS65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntN5i-006rZn-VN; Tue, 24 May 2022 05:28:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntN5f-006rZG-OH; Tue, 24 May 2022 05:28:21 +0000
X-UUID: ee761186444b4b77809276ba799443c9-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:41c1fc82-fe85-4e0d-bc04-3cdb0a0a18b7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:b5e755e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
 l,QS:0,BEC:nil
X-UUID: ee761186444b4b77809276ba799443c9-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1595217876; Mon, 23 May 2022 22:28:11 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 22:28:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 13:28:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 24 May 2022 13:28:08 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chun-jie.chen@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
 <wenst@chromium.org>
Subject: Re: [PATCH 1/8] clk: mediatek export mtk_clk_simple_probe and
 mtk_clk_simple_remove
Date: Tue, 24 May 2022 13:28:08 +0800
Message-ID: <20220524052808.7073-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <9bb62269-986b-180e-ce5f-ac8cf7d667ff@collabora.com>
References: <9bb62269-986b-180e-ce5f-ac8cf7d667ff@collabora.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_222819_835260_14F6EBBA 
X-CRM114-Status: UNSURE (   8.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>> Export mtk_clk_simple_probe and mtk_clk_simple_remove because we need
>> them for MediaTek tristate clk drivers.
>> 
>> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
>
>Hello Miles,
>
>the changes in this patch are exactly the same as what I've pushed in my
>MT6795 clocks series, so you should simply advertise a dependency on my
>patch [6/7] for this series.

hi Angelo,

No problem, I will add this to the coverletter and drop patch 1/8 in v2.

cheers,
Miles
>
>https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/
>
>Regards,
>Angelo
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
