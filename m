Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33853C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 03:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVJ+MOKpfbG3MQ+icsHJ+2fAEsTjRFnL15ooEJk+oSc=; b=MCr8hTjyAUj4lrU0Ykf4D7ZnTq
	iZOhQsMEtiCjHvqIJuNEabOX0gmWb/GcfYnQf5Z4XLSSfbEdDZhrHosOyXvrKIpLzCJoO7hSZ6oEj
	PGWL649h170wwWvak0lfplbwrKJB0VCFmmAkPzrb0/VUGa3AEIDdbxSVKuqqiOA3Ai03uUy+YR4iW
	zEWlTvy7ZBqWWn0s/Nn4EuYpjhtH2X0h4UZzpHCPdm9N9djGU4eDaC/lnHtAtCywErCmi2Mpo/vlN
	hvU2BgzFzVSoLrj3m3MaWe1PTRcDoGpEAQUO10lfgv66emYOxU03yFNRrsHBj4d6IzsMVn8wXWxQ0
	7uU35HGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUgGe-00Af34-RF; Wed, 22 Feb 2023 03:58:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUgGb-00Af1x-B4; Wed, 22 Feb 2023 03:58:06 +0000
X-UUID: 175cf67ab26511edbbe3f76fe852e059-20230221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LVJ+MOKpfbG3MQ+icsHJ+2fAEsTjRFnL15ooEJk+oSc=;
	b=Flkq7wFKRBw3RR6mMBONH++2h5HYoVHWMb+TR+b+5NlPNDlvwrUfKJMwMoSFG1EU5Wa6jsY/akrWxjOqNZb5A6PrshSzJDgKWp4y7hfupfQZz7NPXpe5J6dJXOX4Qo0ygkXqfK5oD+deur9HpXpaSj9rrsCzP5oUSCHp+yb4SjE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:d9283d2e-46eb-40ff-8195-df1e167c0e31,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:2c4431b1-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 1,FCT
X-UUID: 175cf67ab26511edbbe3f76fe852e059-20230221
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 645428225; Tue, 21 Feb 2023 20:57:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 22 Feb 2023 11:37:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 22 Feb 2023 11:37:53 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chen.zhong@mediatek.com>, <chun-jie.chen@mediatek.com>,
	<daniel@makrotopia.org>, <edward-jw.yang@mediatek.com>,
	<fparent@baylibre.com>, <granquet@baylibre.com>, <johnson.wang@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <msp@baylibre.com>,
	<mturquette@baylibre.com>, <nfraprado@collabora.com>,
	<pablo.sun@mediatek.com>, <rex-bc.chen@mediatek.com>,
	<sam.shih@mediatek.com>, <sboyd@kernel.org>, <sean.wang@mediatek.com>,
	<wenst@chromium.org>, <yangyingliang@huawei.com>, <zhaojh329@gmail.com>
Subject: Re: [PATCH v4 00/54] MediaTek clocks: full module build and cleanups
Date: Wed, 22 Feb 2023 11:37:53 +0800
Message-ID: <20230222033753.4128-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
References: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_195805_411742_18A1ACDD 
X-CRM114-Status: UNSURE (   9.30  )
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

Hi Algele,

>Changes in v4:
> - Rebased over clk-next branch as of 21/02/2023
> - MT8135: Squashed removal of __initconst annotation with conversion
>   to platform drivers as suggested by Chen-Yu
> - MT8135: Added mention of the introduction of the dummy clock in
>   the commit description of patch [54/54]
> - Fixed Kconfig ordering issue for MT8195 IMGSYS dependant option
>
...snip
>
>NOTE: Applies on top of [1] and [2].
>
>
...snip
>This series was build-tested for all (both module and built-in build)
>and was manually tested on MT6795, MT8173, MT8192, MT8195.
>
>[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=719067
>[2]: https://patchwork.kernel.org/project/linux-mediatek/patch/20230207014800.7619-2-moudy.ho@mediatek.com/

I tested this series with linux-next and only [1] on MT6779 and MT8192.

For this series:
Tested-by: Miles Chen <miles.chen@mediatek.com> 

thanks,
Miles

