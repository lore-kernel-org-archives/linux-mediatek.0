Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D51BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsg8SlBW4owAEbvckoVuWyxzCs2P4j+O1NyGMe8wsNY=; b=tq8SPT3sLLocV7LWXvLP1RjyQY
	WK4olkU4GeouYFkGQYKHhCmDwvt3TO+lmVNbPrHI0DvjPtGkjZbYo5GojHgaqu5jzm9N+JCwX5FoJ
	j1z/gfEVhJ0ZHrTbl1ZMI5atJALqPk92TLUApmy3WeuRI1/Hm4BVL6diFsg78CObef52uFszT2oCk
	y+pB6tXS6tP84JHRAQWp5wEFzbd/+aoPHHt5fRfq0Jl5/hwI1/RHfo47r5+rUs76l4vqDY+76A9JJ
	krsEQJgm4U4TyqGhaNFal2WJAoy//UhWjDtpM0TBMKNcXo8hDgZwcSq/3yuOsnfKIsMiTy8qhQerH
	g6/TkIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeAwU-007xCY-O8; Fri, 30 Sep 2022 08:00:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeAwR-007xA4-3X; Fri, 30 Sep 2022 08:00:17 +0000
X-UUID: b02333da951049d48bba7dfecb029f9e-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nsg8SlBW4owAEbvckoVuWyxzCs2P4j+O1NyGMe8wsNY=;
	b=ay1Efn+HaoaIKi2pNAwYvSzCsVz7I9chgS4kpXi6AVpLAV4lbkn2O0i88S4wtCm37Y5nZnilX1SeePMkrV6cn7moKUsbjD+k++FbgZURo1TRi2hOpvZj18gLrGgIe96OtWWFmp+KP4BNqWB42ZuN+AwKvNqhFnGe6BIPGLuMLvs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:5af1530d-008a-47f4-b645-d3e94983f9b8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:43dec2e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:-5,EDM:-3,IP:nil,
	URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b02333da951049d48bba7dfecb029f9e-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 123001023; Fri, 30 Sep 2022 01:00:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 15:09:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Sep 2022 15:09:24 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <wenst@chromium.org>
CC: <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>
Subject: Re: [PATCH 3/6] clk: mediatek: mt8192: Do not re-register top_early_divs in probe function
Date: Fri, 30 Sep 2022 15:09:24 +0800
Message-ID: <20220930070924.5020-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAGXv+5FLwrE-kiZ_opjB3NA=e2_tDoNUs6hKE-o9m_DXcQmcGA@mail.gmail.com>
References: <CAGXv+5FLwrE-kiZ_opjB3NA=e2_tDoNUs6hKE-o9m_DXcQmcGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_010015_174656_6949541C 
X-CRM114-Status: GOOD (  14.22  )
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

>On Wed, Sep 28, 2022 at 9:55 AM Miles Chen <miles.chen@mediatek.com> wrote:
>>
>> >> top_early_divs are registered in the CLK_OF_DECLARE_DRIVER() half of the
>> >> topckgen clk driver. Don't try to register it again in the actual probe
>> >> function. This gets rid of the "Trying to register duplicate clock ..."
>> >> warning.
>> >>
>> >> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>> >
>> >Can't we simply remove the CLK_OF_DECLARE_DRIVER() and top_init_early entirely,
>> >and transfer TOP_CSW_F26M_D2 to top_divs[] instead?
>> >I get that systimer concern and we have something similar in MT8195, where the
>> >TOP_CLK26M_D2 is registered "late".
>>
>> Another reason for this:
>> Removing the CLK_OF_DECLARE_DRIVER() is good when we want to build our driver as
>> kernel modules because it does not work with kernel modules.
>
>I agree. But as I mentioned in my other reply, we need to fix the clock
>user first before dropping that clock. And there's also the matter of
>DT backward compatibility. So we need to do it incrementally.
>
>
>ChenYu

Got it. thanks for doing this.

thanks,
Miles

