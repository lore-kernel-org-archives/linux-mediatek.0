Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C9BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 03:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4cf8sNZ7AOe2WaMs/PL9cPQ3PVjbf+wyzATexGAlVo=; b=m8a/8E0fBnfadf
	Zo0PRaOtg/1rr3JyxWC4hB5SA8pOqLontF72gTdG7lUlLrHpbv8fYLWnhLoK0V4lGaec2sodqOIoH
	yxa9XQ14ADlX5Mu8AQx19xESR0YFnX8/eJWA9jO7EYKrGO6pallc2/hDXKK3T8ohIu3NEluprf7ET
	8gbrQnJzPQnMf3Mzt80EAP4HTk2Yl0s1rrfbGwxrC4DcBoSO9Ez1MFQYAtGmWrFgclGzcu56LOclF
	zWEWAN1QN7LiMk5QSFx21x0WvHMCg0U7Rx/RvDWQWhpOYLBfGR9o+9s0NoVNrTmrh+6Kz88kmRUW5
	TRmHl/aLFvnU+TdccBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1munHI-00Ar4b-AM; Wed, 08 Dec 2021 03:05:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mun4b-00AmDd-IC; Wed, 08 Dec 2021 02:52:51 +0000
X-UUID: 146cbfe18fde4bc7b257a07d4a321b44-20211207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4JAxauduVQ8yA1sTjjPd8IjqzkeB2Li6o0fP33s9P3Q=; 
 b=SOxo7LLXXjX9l6dCzZpK+gNdLBkX5cxmNd05ygg4Hq0Za2vgH3pak/7Hk3OJ7NK9FJgkmj/9CELmgwxVle2/wJHNV5LGoI0Z1zw3V2QCA65L5irbwiWByeZo2Z7d2C53wO7vlUPjqr04Xu2FnlESfIyrzydnOlcciij7+zd+170=;
X-UUID: 146cbfe18fde4bc7b257a07d4a321b44-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1006956740; Tue, 07 Dec 2021 19:52:46 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 18:42:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 8 Dec 2021 10:42:42 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Dec 2021 10:42:41 +0800
Message-ID: <581d847ede5ce917762e2c5734e23dcd693fef32.camel@mediatek.com>
Subject: Re: [PATCH 3/4] memory: mtk-smi: Add sleep ctrl function
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <lc.kan@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Wed, 8 Dec 2021 10:42:36 +0800
In-Reply-To: <85ef182a-8ebe-7dbb-aa95-35e77cbb072c@collabora.com>
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-4-yong.wu@mediatek.com>
 <f2ffd08a-44c3-9458-1bd8-68e3c0755611@collabora.com>
 <ebc8e4c0b0519043c5a82c6c967ac6d524e8869a.camel@mediatek.com>
 <47c30f6f-ce9d-9ea7-283c-9026ae9ed1c0@collabora.com>
 <e1d72db69f424b9ee8987b7bafa7423c672ceef1.camel@mediatek.com>
 <85ef182a-8ebe-7dbb-aa95-35e77cbb072c@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_185249_663266_5F44F1BB 
X-CRM114-Status: GOOD (  64.57  )
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

On Tue, 2021-12-07 at 13:16 +0100, AngeloGioacchino Del Regno wrote:
> Il 07/12/21 13:10, Yong Wu ha scritto:
> > On Tue, 2021-12-07 at 09:56 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Il 07/12/21 07:24, Yong Wu ha scritto:
> > > > Hi AngeloGioacchino,
> > > > 
> > > > Thanks for your review.
> > > > 
> > > > On Mon, 2021-12-06 at 16:08 +0100, AngeloGioacchino Del Regno
> > > > wrote:
> > > > > Il 03/12/21 07:40, Yong Wu ha scritto:
> > > > > > sleep control means that when the larb go to sleep, we
> > > > > > should
> > > > > > wait
> > > > > > a bit
> > > > > > until all the current commands are finished. thus, when the
> > > > > > larb
> > > > > > runtime
> > > > > > suspend, we need enable this function to wait until all the
> > > > > > existed
> > > > > > command are finished. when the larb resume, just disable
> > > > > > this
> > > > > > function.
> > > > > > This function only improve the safe of bus. Add a new flag
> > > > > > for
> > > > > > this
> > > > > > function. Prepare for mt8186.
> > > > > > 
> > > > > > Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> > > > > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > > > > ---
> > > > > >     drivers/memory/mtk-smi.c | 39
> > > > > > +++++++++++++++++++++++++++++++++++----
> > > > > >     1 file changed, 35 insertions(+), 4 deletions(-)
> > > > 
> > > > [snip]
> > > > 
> > > > > >     static int __maybe_unused mtk_smi_larb_suspend(struct
> > > > > > device
> > > > > > *dev)
> > > > > >     {
> > > > > >     	struct mtk_smi_larb *larb =
> > > > > > dev_get_drvdata(dev);
> > > > > > +	int ret = 0;
> > > > > > +
> > > > > > +	if (MTK_SMI_CAPS(larb->larb_gen->flags_general,
> > > > > > MTK_SMI_FLAG_SLEEP_CTL))
> > > > > > +		ret = mtk_smi_larb_sleep_ctrl(dev, true);
> > > > > 
> > > > > Sorry but what happens if SLP_PROT_RDY is not getting set
> > > > > properly?
> > > > >    From what I can understand in the commit description that
> > > > > you
> > > > > wrote,
> > > > > if we reach
> > > > > the timeout, then the LARB transactions are not over....
> > > > > 
> > > > > I see that you are indeed returning a failure here, but you
> > > > > are
> > > > > also
> > > > > turning off
> > > > > the clocks regardless of whether we get a failure or a
> > > > > success;
> > > > > I'm
> > > > > not sure that
> > > > > this is right, as this may leave the hardware in an
> > > > > unpredictable
> > > > > state (since
> > > > > there were some more LARB transactions that didn't go
> > > > > through),
> > > > > leading to crashes
> > > > > at system resume (or when retyring to suspend).
> > > > 
> > > > Thanks for this question. In theory you are right. In this
> > > > case,
> > > > the
> > > > bus already hang.
> > > > 
> > > > We only printed a fail log in this patch. If this fail happens,
> > > > we
> > > > should request the master to check which case cause the larb
> > > > hang.
> > > > 
> > > > If the master has a good reason or limitation, the hang is
> > > > expected, I
> > > > think we have to add larb reset in this fail case: Reset the
> > > > larb
> > > > when
> > > > the larb runtime resume.
> > > > 
> > > 
> > > Think about the case in which the system gets resumed only
> > > partially
> > > due to a
> > > 
> > > failure during resume of some driver, or due to a RTC or arch
> > > timer
> > > resume and
> > > suspend right after... or perhaps during runtime suspend/resume
> > > of
> > > some devices.
> > > In that case, we definitely want to avoid any kind of failure
> > > point
> > > that would
> > > lead to a system crash, or any kind of user noticeable (or UX
> > > disrupting) "strange
> > > behavior".
> > > 
> > > I think that we should make sure that the system suspends
> > > cleanly,
> > > instead of
> > > patching up any possible leftover issue at resume time: if this
> > > is
> > > doable with
> > > a LARB reset in suspend error case, that looks like being a good
> > > option indeed.
> > > 
> > > As a side note, thinking about UX, losing a little more time
> > > during
> > > suspend is
> > > nothing really noticeable for the user... on the other hand,
> > > spending
> > > more time
> > > during resume may be something noticeable to the user.
> > > For this reason, I think that guaranteeing that the system
> > > resumes as
> > > fast as
> > > possible is very important, which adds up to the need of
> > > suspending
> > > cleanly.
> > 
> > Thanks for this comment. I will put it in the suspend when adding
> > the
> > reset. But I have no plan to add it in this version since I don't
> > see
> > the need for this right now. Maybe I should add a comment in the
> > code
> > for this.
> > 
> 
> What I understand from your reply is that the reset is not trivial
> work

Yes. the reset bit is in different register regions, like mmsys,
vdecsys. But the main problem is that I don't see why we need that. We
never that problem.

The sleep ctrl function is just for the safety of the bus. If we have
not it, It also should be ok...If not, the question is: why does the
larb master device call pm_runtime_put before his HW finish the job?

> and needs quite some time to be done properly; in that case: yes,
> please
> add a TODO comment that explains the situation and the discussed
> solution.
> 
> Also, since this SLP_PROT_RDY flag seems to be very nice, just a
> simple question: is this a new feature in the SMI IP of MT8186, or is
> there anything similar that we may use on other SoCs, like 8183,
> 8192, 8195, as a follow-up of this series?

All the three SoC support this function. I expect the later SoC will
support this. but the previous SoC has already MP... If someone has
already tested ok after adding it for the previous SoC, I'm ok of
course.

> 
> > > 
> > > > Fortunately, we have never got this issue. We could add this
> > > > reset
> > > > when
> > > > necessary. Is this OK for you?
> > > > 
> > > > Thanks.
> > > > 
> > > > > 
> > > > > >     
> > > > > >     	clk_bulk_disable_unprepare(larb->smi.clk_num,
> > > > > > larb-
> > > > > > > smi.clks);
> > > > > > 
> > > > > > -	return 0;
> > > > > > +	return ret;
> > > > > >     }
> > > > > >     
> > > > > >     static const struct dev_pm_ops smi_larb_pm_ops = {
> > > > > > 
> > > > > 
> > > > > 
> > > 
> > > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
