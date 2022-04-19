Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912D8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 06:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rFldNYojPaMq+GJuVdxuGnqNkcV2KRrcEU3XjZflDg=; b=yoBCrd2dOUgB9V
	9F99LFhjiebEHXqla+yPdolPzkiQxgwTX8bHU9joEqkH2VZzrmi3yUx/sQqCcE1iScCQA1nAVFWxv
	m6hhvyeXgRKjvs4h4rrND4GdRp/jMmYZgCOorkMARm9b2LOXJMlKJ3+I5fdK/pl+a3NkFPkn3NeaX
	uSlKEFb5xhdGxVogBy0+1OQf7R5owDLSn+OO5VVL8E0rSXjJoW1EAfDzqPS5l9Nymc2tludRHzWjh
	1Pe6YzEP3jP0JkcQcaZT/LMD86IIx2uZph7IYPWV4ycVZpfenh4L3w/T1/OU1N5Ci171Ah5SIgUTx
	6ryW8pbxH9L2LNaGKSOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nghUs-001jGb-2i; Tue, 19 Apr 2022 06:37:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nghUi-001jBA-KQ; Tue, 19 Apr 2022 06:37:50 +0000
X-UUID: 0e5058d2bf854b00aaa440b2d3be08b3-20220418
X-UUID: 0e5058d2bf854b00aaa440b2d3be08b3-20220418
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1668934320; Mon, 18 Apr 2022 23:37:44 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 23:37:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Apr 2022 14:37:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Apr 2022 14:37:40 +0800
Message-ID: <a5da87dbed150b8de4495da4a7f9b98d88e176a8.camel@mediatek.com>
Subject: Re: [PATCH 2/7] clk: mediatek: reset: Rename reset function
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <yong.liang@mediatek.com>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <allen-kh.cheng@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 19 Apr 2022 14:37:40 +0800
In-Reply-To: <CAGXv+5F027EsJCG4zQarcoqCR8S4tew1n1DjeqU7_+HOzmZs2Q@mail.gmail.com>
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
 <20220418132154.7401-3-rex-bc.chen@mediatek.com>
 <CAGXv+5F027EsJCG4zQarcoqCR8S4tew1n1DjeqU7_+HOzmZs2Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_233748_743625_C5976776 
X-CRM114-Status: GOOD (  22.63  )
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

On Tue, 2022-04-19 at 13:57 +0800, Chen-Yu Tsai wrote:
> On Mon, Apr 18, 2022 at 9:22 PM Rex-BC Chen <rex-bc.chen@mediatek.com
> > wrote:
> > 
> > There are two version for clock reset register control of MediaTek
> > SoCs.
> > Since MT8183, the version 2 is adopted.
> > 
> > To make the driver more readable,
> > - Rename them to v2 for MT8183 and v1 for previous SoCs.
> > - Adjust the fuinction order in reset.c.
> 
> I'm not sure that the renaming actually helps, since it is not given
> that
> people outside of MediaTek would know which chip use which version.
> The
> original name of "_set_clr" at least relays how the hardware works,
> which
> coupled with the register naming in the datasheets make it quite
> obvious
> if the hardware is using the "set/clr" variant.
> 
> On a different note, the v1 hardware, where a hardware bit represents
> the
> state, is quite common, and there is a common reset driver that
> handles it.
> Perhaps that could be reused instead of code duplicated?
> See drivers/reset/reset-simple.c.
> 
> 
> Thanks
> ChenYu

Hello ChenYu,

Thanks for your review.
I will use reset_simple_ops to replace v1 in next version.

What do you think the proper name of v2?
Or I just use mtk_reset_assert for v2?

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
