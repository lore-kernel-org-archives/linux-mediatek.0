Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13263C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 22:05:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB5DD61053
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 22:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB5DD61053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aA6PYkLjeMvfpR0lH6TDScY8f5SMCTL2S7xIhfbj2ok=; b=kbF2WiVjYTuXUx
	ou0YH3lCW4Is5rAxZzxz+vmCdUDaqcDR+H0NoiDlGp4VVrwTAxf+4aegGqq6avD4gJt0erCPxALj6
	ucW06sd7YPYZRWOHhrRhi3sZyqKikOjCzJshWRj6aWg5H84sQnA4Iz+I7IhheIJr/Q1WWts7Mo7ot
	1T8xDCBuhvGNNJI/6wMF2lWrfZIy/3PcNpCsB1hDA2v0QfnmWcsNHmWdsc6K7n4bfeEFBQfablEJT
	dzTT924RE0ykF/ujkmYGJB7rb4XqT9iJlS51nY6Djs6mASxXlqbuoj+ObnnSCVwfNnZpbrKlDsqmY
	GsF3TN3xVb7SvdZRjDQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLYLd-007cH7-8M; Wed, 01 Sep 2021 22:04:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLYLL-007cDz-3E; Wed, 01 Sep 2021 22:04:32 +0000
X-UUID: ffc5d225adbc4529865c002818a4b317-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dechZ3xSa+k6eciQYNq2w2jcJKlpQJ63PvPD4NTpepM=; 
 b=SQU1gIwhzcwrNYRwtiDrAsJ6ax2tYANm3kmm6W3ubEsDz1H9CQNhg4olDUjOPH+id3ekEyb88srRJ/+rzOQ4elzNt46XGCGeS6eQxGct5K/c0EK903nOzphlZFo7QUEG8PNLNK7zltSLNcudFsVEI4xZFWE+BhRC1yF2ikvk88E=;
X-UUID: ffc5d225adbc4529865c002818a4b317-20210901
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1652480735; Wed, 01 Sep 2021 15:04:19 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 15:04:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 06:04:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 06:04:16 +0800
Message-ID: <67a7d4bccfc56c5960ca370bcbfb5ca6c9693f21.camel@mediatek.com>
Subject: Re: [RESEND PATCH 3/4] clk: mediatek: support COMMON_CLK_MT6779
 module build
From: Miles Chen <miles.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Wendell Lin <wendell.lin@mediatek.com>, "Hanks
 Chen" <hanks.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Lee Jones
 <lee.jones@linaro.org>
Date: Thu, 2 Sep 2021 06:04:16 +0800
In-Reply-To: <163047434049.42057.5688419707288938766@swboyd.mtv.corp.google.com>
References: <20210813032429.14715-1-miles.chen@mediatek.com>
 <20210813032429.14715-4-miles.chen@mediatek.com>
 <163021049667.2676726.10138202396240942833@swboyd.mtv.corp.google.com>
 <1630348984.24981.2.camel@mtkswgap22>
 <163047434049.42057.5688419707288938766@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_150428_615413_FCB24BB3 
X-CRM114-Status: GOOD (  13.43  )
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

On Tue, 2021-08-31 at 22:32 -0700, Stephen Boyd wrote:
> Quoting Miles Chen (2021-08-30 11:43:04)
> > 
> > sorry for my late response. 
> > 
> > Thanks for pointing this out. I have the same question when I was
> > building this patch. That time I found some examples where
> > they are using builtin_platform_driver and can be built as 
> > kernel modules:
> > 
> > config CLK_IMX8QXP (tristate) && drivers/clk/imx/clk-imx8qxp-lpcg.c
> > config CLK_RK3399 (tristate) && drivers/clk/rockchip/clk-rk3399.c
> 
> We should fix those drivers. Care to send a patch?

No problem. I will check drviers/clk and submit fix patches.

Miles
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
