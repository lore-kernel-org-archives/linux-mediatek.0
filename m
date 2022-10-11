Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DBEC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 02:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzZMTZnWRT6Z2eNvdPaZmSr5b+GMs7+C7GPXCnnqRyo=; b=jJpcIY7O2KR0pTpK6K18wrw7gZ
	4Dllqd8QTcdddJza4rx1EevkZuhhde9/FQ2f2tViJrVAla8xLrbmGgjdMhKnLK7ee2BiRGLVa7Doz
	d9Z3UPJuLTH2Rx1W8CQ4LhyyK5v7b8ASxy1JRDKWbaB/bcoQgYpXzVHKuo5rm9WwRhSfMxKOzHM0S
	iv+suSf/Wm0t4pFItK1KDf2LhoyHL0fcP3Z2lGbkJuTXDygdjDV2OXzYzVfEjZ9fALCYZAMfk7zZ4
	TkTUYoGIm0oG96jelBPTUOtNkZ175ZPOu4X8ivnp7BLRLN7XQA4DrOLrMzRAICa8K+aNAMMHkG0Pm
	pyB5iR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi5Ez-0032WK-0b; Tue, 11 Oct 2022 02:43:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi5Ew-0032VP-EA
	for linux-mediatek@lists.infradead.org; Tue, 11 Oct 2022 02:43:31 +0000
X-UUID: dbf6d42cbf3b42f78a3ff21bd444a849-20221010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=yzZMTZnWRT6Z2eNvdPaZmSr5b+GMs7+C7GPXCnnqRyo=;
	b=frgcPBDtR4Eu5FOVXYULoALR1Wyy5QkEmNbkSX3hdJ1xrsw7qEo4DH1Pz66076g0x3ewb2Rx162duWNSIgx/7hyv2IFSwK8rLDtqKUh2CP5kGIGNSpiZy8LiLwWSOwGZIfl9SZG8d6WVQTgvl8LRP+mZjVw3bo4BEyzfv4ykT+g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:49ae7150-530f-4635-89e0-0675036fd067,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:c5047de1-2948-402a-a6e4-b5d31fe11eb7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: dbf6d42cbf3b42f78a3ff21bd444a849-20221010
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 512599918; Mon, 10 Oct 2022 19:43:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 11 Oct 2022 10:02:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 11 Oct 2022 10:02:44 +0800
Message-ID: <1da5fa8c9b22dcc8ada4e4e32a910dd552cc17d4.camel@mediatek.com>
Subject: Re: [PATCH v1 1/6] media: platform: mtk-mdp3: add chip
 configuration header file
From: moudy ho <moudy.ho@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 11 Oct 2022 10:02:43 +0800
In-Reply-To: <9e14ae09-6100-a55f-7aa7-6ed9edb49e09@collabora.com>
References: <20221007031737.5125-1-moudy.ho@mediatek.com>
	 <20221007031737.5125-2-moudy.ho@mediatek.com>
	 <9e14ae09-6100-a55f-7aa7-6ed9edb49e09@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_194330_514035_542A013D 
X-CRM114-Status: GOOD (  20.46  )
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

On Fri, 2022-10-07 at 11:07 +0200, AngeloGioacchino Del Regno wrote:
> Il 07/10/22 05:17, Moudy Ho ha scritto:
> > In order to be compatible with more MDP3 chip settings in the
> > future,
> > move the chip-related configuration to a separate header file.
> > 
> > Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> > ---
> >   .../media/platform/mediatek/mdp3/mt8183_mdp.h | 35
> > +++++++++++++++++++
> 
> What if we choose a better name format for the chip header?
> Would mdp3-plat-mt8183.h work for you?
> 
> Aside from that, the changes look good... but anyway, what this
> driver
> really needs is an abstraction of `mtk-img-ipi.h` since, as you know,
> new
> SoCs are using a different firmware and even a different architecture
> for
> the MCU.
> 
> Is that planned?
> 
> I think that such change would perfectly fit inside of this series.
> 
> Regards,
> Angelo
> 

Hi Angelo,

Thanks for all your advice, I will add another patch for SCP shared
memory header separation by chip, and integrate the following series
with the same purpose here.
[1] 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=683671

Sincerely,
Moudy
> >   .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 27 ++------------
> >   2 files changed, 37 insertions(+), 25 deletions(-)
> >   create mode 100644
> > drivers/media/platform/mediatek/mdp3/mt8183_mdp.h
> > 
> 
> 


