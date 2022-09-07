Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CE6C38145
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 23:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVN2su0W6cfg/UUYRpHd6lSdOO4U2GGb7/TQBMhg9MY=; b=encWQnPvHcow5KA0ftmviFvDD6
	0fnzU48wsGqyNQqkSTYmbs8c62ansINzyk19P4twBRhbXrvbDf61S8QEI+LkkvgeDUqpFeszucpe0
	yPzgWUFDAXcFA3cflse0S4kFDDftHwhYXfs7B6u/jqXzKx7TUVMpeGvLuSea/qi6GT9vUopoDRq2w
	1Uxa32Ld1Bwd/vrnLk2TJ7Quy02jFcF6kubEQSkHLRHOtblNpOUviMrbcjSl7mGKjz5SSU9rlA27/
	4SRmOphUJw9aInlGn/ebolckDtD3ga3c8GGOUnHAtaSdTIa58pBCQBSinsd7jAZdLzU24cvd6XAtB
	kzx0PlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW4V5-00BbT2-PK; Wed, 07 Sep 2022 23:30:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW4Ul-00Ba96-R4; Wed, 07 Sep 2022 23:30:13 +0000
X-UUID: fc5d7649f5a0422d818b794ddc77403c-20220907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WVN2su0W6cfg/UUYRpHd6lSdOO4U2GGb7/TQBMhg9MY=;
	b=q3+BhORkSzOMfYpwhwdq/eeCPCIxaLa4AvXvrmYVEHTfaeRUwhFdPwHVzcs5T+6mydDcVJJX8KJEW6f0sMvWorBL5DtE8qkqGg45SnN3VlkvahsnC96WJRkoz9YtB7Dpyd6sJ0X1UMboiPRDn/w2wFr307xlyq0tTHzdlTbmYoQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:5609b26c-4f18-4853-aad9-7f5bd1a080a1,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:76708d21-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
	l,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: fc5d7649f5a0422d818b794ddc77403c-20220907
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1084114680; Wed, 07 Sep 2022 16:30:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Sep 2022 06:59:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 8 Sep 2022 06:59:57 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
	<drinkcat@chromium.org>, <jose.exposito89@gmail.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<miles.chen@mediatek.com>, <mturquette@baylibre.com>,
	<nfraprado@collabora.com>, <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
	<sboyd@kernel.org>, <weiyi.lu@mediatek.com>, <wenst@chromium.org>
Subject: Re: [PATCH 03/10] clk: mediatek: mux: add clk notifier functions
Date: Thu, 8 Sep 2022 06:59:57 +0800
Message-ID: <20220907225957.10541-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220905100416.42421-4-angelogioacchino.delregno@collabora.com>
References: <20220905100416.42421-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_163011_908794_5B77F52A 
X-CRM114-Status: GOOD (  13.38  )
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

> From: Chen-Yu Tsai <wenst@chromium.org>
> 
> With device frequency scaling, the mux clock that (indirectly) feeds the
> device selects between a dedicated PLL, and some other stable clocks.
> 
> When a clk rate change is requested, the (normally) upstream PLL is
> reconfigured. It's possible for the clock output of the PLL to become
> unstable during this process.
> 
> To avoid causing the device to glitch, the mux should temporarily be
> switched over to another "stable" clock during the PLL rate change.
> This is done with clk notifiers.
> 
> This patch adds common functions for notifiers to temporarily and
> transparently reparent mux clocks.
> 
> This was loosely based on commit 8adfb08605a9 ("clk: sunxi-ng: mux: Add
> clk notifier functions").
>

Reviewed-by: Miles Chen <miles.chen@mediatek.com>


