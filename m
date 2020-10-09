Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21CAC433E7
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 03:20:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A062722248
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 03:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yqxzMpcv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="U52YSWzk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A062722248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hiYf2Jiv2eIP2fmr+3JsK2h11TpgDG0kb8qOWCfr6n4=; b=yqxzMpcvidBiuNQPk5r6jnf/W
	APWwPVMagPMzPVPD/UpXP/VfAOxJIer4xmhbCsK/iaYBknUaNIpqihJDXlXd2nqkKOmtR6FUj+scd
	8gaDYGaOM25DQZ9WyPam/Vu0hBUtbO8vwIUG9yrYhtGVj3eiSFg3AhSYfgvYd0v3Ce1yuEkjOHCJB
	x/HdJ7eC7lGvHb364J8DaGUxL3fLrOHIuoljyWjTaX8ZxxiFhCqHErJ7LbE8CzFy8418FWEudJJbI
	/QDKGF2ICaNh+ehY/Z5du8lDhLC5IV7CQgW04CyZgtF9WQBq1HQPcXPFap9Q/NIbVrx3fVDIqtE1+
	q4apqks8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQixa-0003OL-Ot; Fri, 09 Oct 2020 03:20:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQixU-0003NM-CR; Fri, 09 Oct 2020 03:20:42 +0000
X-UUID: a80977a1d63042888b50b2bf46e1a63e-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8x82X3U41FRr0ndtEJggoVTK3rtF9FH609MgK5Y3YKI=; 
 b=U52YSWzkhyeKs8nPPcLjb1IvMNzUALNqhWRu7cBg1BUlLiK2ZiTFIfMRocTcwuELGJwhLdegvTuSDjVPmjfG2neZ1e5EG80KOEghl5rBOd7k5LB3eeU5CtufDxL1MZ4SPlkSxyBL7v9Dby2CAb5//sW4pQ4DsDGr/4q3zZ6B2/s=;
X-UUID: a80977a1d63042888b50b2bf46e1a63e-20201008
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1640618643; Thu, 08 Oct 2020 19:20:33 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 20:20:31 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 9 Oct 2020 11:20:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Oct 2020 11:20:22 +0800
Message-ID: <1602213621.14806.43.camel@mhfsdcap03>
Subject: Re: [v5,0/4] watchdog: mt8192: add wdt support
From: Crystal Guo <crystal.guo@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Fri, 9 Oct 2020 11:20:21 +0800
In-Reply-To: <9d493ec4-6b3e-12a1-01f3-34c09a826290@roeck-us.net>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
 <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
 <20201001151639.GC64648@roeck-us.net>
 <89835d94-7f26-bdc3-4760-af00978aba44@gmail.com>
 <9d493ec4-6b3e-12a1-01f3-34c09a826290@roeck-us.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_232040_867831_18376779 
X-CRM114-Status: GOOD (  36.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wim
 Van Sebroeck <wim@linux-watchdog.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-02 at 22:41 +0800, Guenter Roeck wrote:
> On 10/2/20 2:51 AM, Matthias Brugger wrote:
> > 
> > 
> > On 01/10/2020 17:16, Guenter Roeck wrote:
> >> On Thu, Oct 01, 2020 at 04:23:02PM +0200, Matthias Brugger wrote:
> >>> Hi Crystal,
> >>>
> >>> It seems you forgot to send the email to one of the maintainers, Wim.
> >>> Please make sure you add all the maintainers from get_maintainers.pl when
> >>> you send a series.
> >>>
> >>> Regards,
> >>> Matthias
> >>>
> >>> On 29/09/2020 05:20, Crystal Guo wrote:
> >>>> v5 changes:
> >>>> fix typos on:
> >>>> https://patchwork.kernel.org/patch/11697493/
> >>>>
> >>>> v4 changes:
> >>>> revise commit messages.
> >>>>
> >>>> v3 changes:
> >>>> https://patchwork.kernel.org/patch/11692731/
> >>>> https://patchwork.kernel.org/patch/11692767/
> >>>> https://patchwork.kernel.org/patch/11692729/
> >>>> https://patchwork.kernel.org/patch/11692771/
> >>>> https://patchwork.kernel.org/patch/11692733/
> >>
> >> This is less than helpful. It doesn't tell me anything. It expects me to
> >> go back to the earlier versions, download them, and run a diff, to figure
> >> out what changed. That means the patch or patch series ends at the bottom
> >> of my pile of patches to review. Which, as it happens, is quite deep.
> >>
> >> I will review this and similar patches without change log after (and only
> >> after) I have reviewed all other patches in my queue.
> >>
> > 
> > I understand your comments on hard to understand change log. But I think you acted to quick to put this series to the end of your queue. I'll try to explain:
> > 
> > In v4 you gave your Acked-by and Reviewed-by for the patches that in this series are 3/4 [1] and 4/4 [2] respectively. You also gave your Reviewed-by for 1/4 [3].
> > 
> > In v4 you stated that you wanted to wait for a review from Rob for the binding changes. Obviously it's up to you to handle that the way you want. From my point of view these are rather trivial changes.
> > 
> 
> That may be correct, but I am not a DT expert, and it happened often enough
> that I approved a DT change and Rob later raised concerns that I don't do it
> anymore.
> 
> > In 1/4 are deleting compatible fallbacks in the bindings, as the driver provides SoC specific platform data, which you reviewed.
> > 
> > One can argue that this will break older devicetree bindings because the driver using the fallback would work except for the topgru reset controller. But I think this is the job of the maintainer of the driver as Rob won't be able to look into all the driver code to decide if any change to the bindings is backward compatible. With your Reviewed-by I understand that you are OK with this change. As SoC maintainer I'm fine with the change. MT2701 is a SoC that's not available to the general public. MT8183 is available, but only on chromebooks and I don't expect anybody to use an older kernel without watchdog driver support for mt8183 (enablement is still ongoing). Actually I took the DTS counter part already through my tree, which was an error, as we now have a DTS which does not hold to the binding description (until and if you accept 1/4).
> > 
> > The only patch missing patch is now 2/4, where Crystal added your Reviewed-by which you never gave. But it just adds the compatible to the binding for a driver you already gave your Reviewed-by. So I think this the series actually just fall through the cracks.
> > 
> > Sorry for the long mail, but if you got until here, I hope I was able to convince you to just merge the series :)
> > 
> 
> If my Reviewed-by is indeed in all patches, as you state, even if I didn't give it
> to some of those and the submitter just added it (is that acceptable nowadays ?),
> there should be no problem and Wim should pick up the series. And if the submitter
> had bothered to write a proper change log instead of expecting me to do the work
> I would have noticed right away.
> 
> No, this was very appropriately put to the end of my review queue.
> 
> Guenter

Sorry to cause you trouble, I will pay attention to these points in the
future. 

Crystal

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
