Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42225C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 10:51:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B895E23103
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 10:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B895E23103
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IBR0ZHrFDLzCDG+shl638hxi8juoys/yMVIEZL1tBBA=; b=fnRzv30NL7xh+ncMVXpkxRiCM
	VSf54kj247WgExMr1QO7uvvUoe7MA5uVuohfPiIWoZsQIqvcz5Hv0j6igFwRsSf3RzW18Ulv23ehe
	9neOaB1nqTJpmTe5yz9QchXzKbXUumiQldOPbyqHpiDW1da8joGNq2X1NW8wKBZV4+w84Dp3GlNl3
	wOt0hyDUPI4l/U3qVT81o2l76lraACn51ZaJjoEXCYddEKjSjpNe+CvYqF+2ix6RvoKUVUbNRiHYc
	6ICFgvtKn0S6qQ+SvbZoYBZz3Frr+n/StPG4HlZRGLyGWNfD7COfysY+V2Mna/SiL0mihYv45oNfs
	FgFsWnZCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krfG0-00007U-TL; Tue, 22 Dec 2020 10:51:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krfFt-00005q-Dx; Tue, 22 Dec 2020 10:51:04 +0000
X-UUID: 8a435671efd44e13aabd6b6337976cd8-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rZA2GXxZH7t4kaVt16HKlqffGV0gmjkPmS1PjrXZIqM=; 
 b=AkczCm031GdoJJ8+1BnqVdmS8Q0GkeOINdY362ugedv/Hr8D/GGi9oZyFKs/nX6F7SFnEIAy3Y2MD1Qbhj4Alsi6pR4miKccKlJBJ8YrS4cxAQ5bMAm0wbQ/t58YGPbEt/o7majwNP05QJw6QHrlax4Mm0/ofb6YPPlbEE7pOfw=;
X-UUID: 8a435671efd44e13aabd6b6337976cd8-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 555710248; Tue, 22 Dec 2020 02:50:55 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 02:50:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 18:50:49 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Dec 2020 18:50:49 +0800
Message-ID: <1608634252.32765.3.camel@mtksdaap41>
Subject: Re: [PATCH v2] clk: mediatek: Remove MT8192 unused clock
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 22 Dec 2020 18:50:52 +0800
In-Reply-To: <160819533548.1580929.12545650149091991895@swboyd.mtv.corp.google.com>
References: <20201209083921.879-1-tinghan.shen@mediatek.com>
 <160819533548.1580929.12545650149091991895@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_055102_253898_4C77D833 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com, erin.lo@mediatek.com,
 Tinghan Shen <tinghan.shen@mediatek.com>, ryan-jh.yu@mediatek.com,
 linux-mediatek@lists.infradead.org, nathan.chung@mediatek.com,
 matthias.bgg@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-17 at 00:55 -0800, Stephen Boyd wrote:
> Quoting Tinghan Shen (2020-12-09 00:39:21)
> > From: "Tinghan Shen" <tinghan.shen@mediatek.com>
> > 
> > Remove MT8192 sspm clock
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> > v2: resend patch to linux-mediatek because blocked by wrong mail setting.  
> > 
> > This patch depends on series "Mediatek MT8192 clock support"[1].
> > 
> > [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=379955 
> 
> Can this be rolled into that series?

Hi Tinghan,
Thank you. I'll roll this patch in my next version v6 of 8192 clocks
series.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
