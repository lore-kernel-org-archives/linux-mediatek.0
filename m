Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41632C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 11:06:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11BFC60F3A
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 11:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11BFC60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0GYpJib3eiN7k6u1PARg5oQOv8XX8cMuYiVjcYqJ6Q=; b=m5ds1ov1izBc+g
	2ljwXbCJFTgmxaiSR8ApRDdx30gvYIrLIP54CLIpY4i+GB0w8UlbG5kFIEjAxlG04eTDhjcEvtj/x
	rsYq/2Er4oCPSlE6z506WIiUQwBKDGxps4P8mk6v7k1z/+zSoClSPlXj2X6eocXU1qoviFKaufrQ6
	UDh/wVI7B6O8WFWY0R7YqRzFviyUwAhrq/4X6ZLVT1WrKCC0NXQKKeQFmCjAWvYEqw7CJupgyT6vo
	2vxSJdxwWUx6rM/7BQ3pgrf2xTtftcP/qBei/VfXEn2VO0RTbn5hktFkBbrrgH2xA7bM7sPVUPkSe
	pdcT9Ys7Hc9w4IJB7tDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLO4p-005Rqd-No; Wed, 01 Sep 2021 11:06:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLMnh-004ykJ-Bs; Wed, 01 Sep 2021 09:45:01 +0000
X-UUID: 1fbdad40e24b421bbff1b3d10e153152-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dfh2IRW0A/mFGk8MNdDMTFcvdeRY8+5m/pyHarFWllU=; 
 b=UTfSc3w/oO3DgWqnZ8wJ0ZRPL7qMx3ebVOfw2gGUT5LAJHS/s6YipgNClu1/vhHF/xcGeqOqEBK6Wt5lwvCKafH/MOLXMUvxKLfaB+jvZIyyAR56yNM0M8VQO7yBid2gOyn2Rc3m9I28p6bjxPe2NCHhhD5P8XlZ4bWLuIIML3Q=;
X-UUID: 1fbdad40e24b421bbff1b3d10e153152-20210901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 321716798; Wed, 01 Sep 2021 02:44:53 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 02:34:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 17:34:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 17:34:48 +0800
Message-ID: <1630488888.11251.7.camel@mhfsdcap03>
Subject: Re: [PATCH v6 6/7] i2c: mediatek: Isolate speed setting via dts for
 special devices
From: Qii Wang <qii.wang@mediatek.com>
To: Kewei Xu <kewei.xu@mediatek.com>
CC: <wsa@the-dreams.de>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <liguo.zhang@mediatek.com>,
 <caiyu.chen@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
 <yuhan.wei@mediatek.com>
Date: Wed, 1 Sep 2021 17:34:48 +0800
In-Reply-To: <1630147859-17031-7-git-send-email-kewei.xu@mediatek.com>
References: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
 <1630147859-17031-7-git-send-email-kewei.xu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_024457_470438_E8D4031A 
X-CRM114-Status: GOOD (  11.79  )
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

On Sat, 2021-08-28 at 18:50 +0800, Kewei Xu wrote:
> In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
> support"), the I2C timing calculation has been revised to support
> ac-timing adjustment, however that will break on some I2C components.
> As a result we want to introduce a new setting "default-adjust-timing"
> so those components can choose to use the old (default) timing algorithm.
> 
> Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 77 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 73 insertions(+), 4 deletions(-)
> 

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
