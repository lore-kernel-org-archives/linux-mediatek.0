Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F23CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvrZcbTAvGVI2BJsbns1prR/9/OB0jVtD+hUNrBXqhQ=; b=wMj1JFrnO3Jo+d
	iyuLk5BcqehNz6R+hnfw18XLZRonbUfpXTD14HZYDLsIDU2+UTWGo3c9xsNHslgT21IxPlfMqp2c5
	sIJ56sZuv8+P6YEUym/vijAj0xLxAo8jmDfsiRiq2ccMCBQKuKX03A+TRqVdBGroQfb5HKbtutOsr
	tVsDr/GE/nzbh4N0FeKAGydPplQc10JRDw18kw/2om0tSD+nUadxi8vRWdzZj0I4mnGPMNhzeqxzK
	zIBE/mJjsAdPHcDtXCCp3oBFggfbvOBgdU0HrNCUlO40+lw8guDn6JjOMxR2h9eoyZXUXbvBrvGH6
	t1wK0oM1vt4Ew74QUAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhlZB-00GB5Z-4K; Fri, 22 Apr 2022 05:10:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhlZ8-00GB3h-CJ; Fri, 22 Apr 2022 05:10:47 +0000
X-UUID: 8e7176c05d52456d83e127870fd99ae0-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:be52f208-7fb6-48d4-bc74-e98dad0ee241, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:faefae9, CLOUDID:dbd190f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 8e7176c05d52456d83e127870fd99ae0-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1436455691; Thu, 21 Apr 2022 22:10:42 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 22:03:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 13:02:45 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 13:02:45 +0800
Message-ID: <f1ce2b0f1215548da3b1b1d2fc6f1ad67d7b1e48.camel@mediatek.com>
Subject: Re: [PATCH V2 05/12] clk: mediatek: reset: Add reset.h
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <allen-kh.cheng@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Apr 2022 13:02:45 +0800
In-Reply-To: <90ad46a5-8b67-e9ca-25df-2a7cc6110bff@collabora.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-6-rex-bc.chen@mediatek.com>
 <90ad46a5-8b67-e9ca-25df-2a7cc6110bff@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_221046_448622_EAD80A6E 
X-CRM114-Status: GOOD (  17.12  )
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

On Thu, 2022-04-21 at 11:07 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> > Add a new file "reset.h" to place some definitions for clock reset.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Right now, you're adding the enum mtk_reset_version and *then* you're
> moving it to the new reset.h header, but does that really make sense?
> 
> I think that this series would be cleaner if you add this header from
> the start, so that you place the aforementioned enumeration directly
> in here...
> 
> ...so we would have a commit that moves the
> mtk_clk_register_rst_ctrl()
> function from clk-mtk.h to a newly created reset.h, mentioning in the
> commit description that it's all about preparing for a coming
> cleanup,
> then the addition of enum mtk_reset_version would be in
> `clk: mediatek: reset: Merge and revise reset register function`
> directly
> into reset.h.
> 
> Does that sound right to you?
> 
> Cheers,
> Angelo
> 

Hello Angelo,

yes, I think it's more reasonable to move this modification to the
first order of this series.
I will do this in next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
