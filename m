Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A57C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 22:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7122F61075
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 22:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7122F61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lu8Cf27ugMFf4+y92QQxuFPNqc4rSGJ9lBrBqjO/LTw=; b=pmC1uFzlENpswx
	K1HvWisWZ8OX0jHOr/hQ6vyVCVQhCmBVvUMAozWxj1/lbHiy5mbtDqB814/yLLsqcGdL++hcR+S3h
	DwrohaagUxrmxOzk+Csxf5u7gkiHfWqxTVfBS8uVebhB8qDNIJMWxkQLk3Xfj9S5qnhXfaehEKUYS
	UZyW3HVpSbjFVvsEIKMENbcbi8JiPEZzxsMmYfZVx3YDYQg88DIedm2gwascedXtORpyXdydKbkC7
	DMAdHaos/crZTRXlH1ufa9F0Dm1rVQDS5m9GP35D6gRy4iVFyly+mTtPJe0Ra9IH+LxLgIHwq0OL4
	W0FTxox9R3ScDqcIHOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLYPB-007dHo-9B; Wed, 01 Sep 2021 22:08:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLYOu-007dD2-Kd; Wed, 01 Sep 2021 22:08:12 +0000
X-UUID: 96dd90c18041446f8477fa501a8cf84d-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Vxm8OfcPv3Z1bZ9jCgt5GQ0yi2tsrN7IlwlS189zzpM=; 
 b=HKm92zW0so/0QyMn1t98skmQMeVOfm5Nfuu0pMu9LNz2yCgomMDI1ZvhEYwy1+N2/N5SYw1SmMD8YqieLIiUrQ4LRn7pH+3my0c+kY78oZNfLl4BFQ3d0zlG4PbwW1Qtvm4gY81md61G9nVrX17rulXD3adcIteDfWV/POuOndQ=;
X-UUID: 96dd90c18041446f8477fa501a8cf84d-20210901
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1706414249; Wed, 01 Sep 2021 15:08:03 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 15:07:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 06:07:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 06:07:54 +0800
Message-ID: <8f5193d84f40f400255577d5035c9e2f5f016057.camel@mediatek.com>
Subject: Re: [PATCH v2 4/4] clk: mediatek: use tristate for
 COMMON_CLK_MEDAITEK and COMMON_CLK_MT6779
From: Miles Chen <miles.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>
CC: Wendell Lin <wendell.lin@mediatek.com>, Hanks Chen
 <hanks.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Lee Jones
 <lee.jones@linaro.org>
Date: Thu, 2 Sep 2021 06:07:54 +0800
In-Reply-To: <163047482135.42057.4815394359554916322@swboyd.mtv.corp.google.com>
References: <20210831164210.15455-1-miles.chen@mediatek.com>
 <20210831164210.15455-5-miles.chen@mediatek.com>
 <163047482135.42057.4815394359554916322@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_150808_755094_BBC4F75B 
X-CRM114-Status: GOOD (  11.70  )
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

On Tue, 2021-08-31 at 22:40 -0700, Stephen Boyd wrote:
> Quoting Miles Chen (2021-08-31 09:42:10)
> > Now we have all necessary exported symbols, change
> > COMMON_CLK_MEDAITEK and COMMON_CLK_MT6779* to tristate.
> > 
> 
> Please squash this with the patch that makes them into modular
> drivers.

No problem.
> 
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Hanks Chen <hanks.chen@mediatek.com>
> > Cc: Wendell Lin <wendell.lin@mediatek.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
