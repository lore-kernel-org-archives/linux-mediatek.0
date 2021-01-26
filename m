Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DD7C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 06:02:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F2522B3B
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 06:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F2522B3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lJGnJlTLQru9ItOXYMn7WuktpepM9iaDlJ2t66Rzmrc=; b=NsVafxXILGOfd7WRi0XLTSJtu
	OPDSn0fZHMF3cMeMeQjezoMXKU0u3pabpgS3rBZ0hmnxN/0Dth99ZOBYNuRJ+icRboaTDlu9fkmjI
	s1iKOdVl0RkTpQMc771bli3Fga1OH55s3AXiGb8zAFn0oiEhDT5l8+WQOTgQXAVjhQ+TePYlxD/k7
	SmuER3gbDIc/WTmaFJ3gV5AAzPNiu8r9fgQrEPZUMjdXuleid5JdE/XWhLN065rDPv/rRCUG/+uuA
	cdmaQTtwXxOFcVzJGK5SbcUf5tF54ctJ1XRBsWFXR29wbud4CPLABP2o2JyW64qJx0hG9O8MawW9M
	WrdWYan+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4HQu-0002Jo-SM; Tue, 26 Jan 2021 06:02:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4HQn-0002Ib-9P; Tue, 26 Jan 2021 06:02:27 +0000
X-UUID: 9d55e230e2b341adb41990b495a29374-20210125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dKXUzd4QfWfdXhez2qIYlgB4VKFnh57HVcDONeqjh1g=; 
 b=frM8hjZBsrZ10CLL+EnQlDSn6WLH3YYPJmmn8Zym5xcs5r1MSaws01f7dTivFe1IBUNRm7/dZ/28VKmE1cknoiBDxisZGXy1dMWnCDqOPHL5P+0iq4mQZ3h2wW5xKQJkUy+LC4JvarUE0st9pZ54XhUvch4TVupWvk4GAgRtSLU=;
X-UUID: 9d55e230e2b341adb41990b495a29374-20210125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1367467929; Mon, 25 Jan 2021 22:02:19 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Jan 2021 22:02:10 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 26 Jan 2021 14:02:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jan 2021 14:02:00 +0800
Message-ID: <1611640920.3905.13.camel@mhfsdcap03>
Subject: Re: [PATCH v6] usb: xhci-mtk: fix unreleased bandwidth data
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 26 Jan 2021 14:02:00 +0800
In-Reply-To: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
References: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5D3DE7CE5C32552355CF39D9DCA8F35668EC69EFD0B94DE935E059906A1B7EA92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_010226_298198_69EAC196 
X-CRM114-Status: GOOD (  19.02  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Ikjoon,

Can I put this patch into my patch series about bandwidth scheduler?
the series also include "[RFC PATCH v3 1/5] usb: xhci-mtk: improve
bandwidth scheduling with multi-TT", put them together will help to fix
dependence issue, meanwhile I try to build xhci-mtk-sch.c into
xhci-mtk.ko instead of xhci-hcd.ko.

Thanks a lot


On Wed, 2021-01-13 at 18:05 +0800, Ikjoon Jang wrote:
> xhci-mtk needs XHCI_MTK_HOST quirk functions in add_endpoint() and
> drop_endpoint() to handle its own sw bandwidth management.
> 
> It stores bandwidth data into an internal table every time
> add_endpoint() is called, and drops those in drop_endpoint().
> But when bandwidth allocation fails at one endpoint, all earlier
> allocation from the same interface could still remain at the table.
> 
> This patch moves bandwidth management codes to check_bandwidth() and
> reset_bandwidth() path. To do so, this patch also adds those functions
> to xhci_driver_overrides and lets mtk-xhci to release all failed
> endpoints in reset_bandwidth() path.
> 
> Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> 
> ---
> 
> Changes in v6:
> - use xhci overrides instead of quirk functions for
>   {check|reset}_bandwidth().
> 
> Changes in v5:
> - Fix a wrong commit id in Fixes tag
> 
> Changes in v4:
> - bugfix in v3, check_bandwidth() return uninitialized value
>   when no new endpoints were added.
> - change Fixes tag to keep dependency
> 
> Changes in v3:
> - drop unrelated code cleanups
> - change Fixes tag to keep dependency
> 
> Changes in v2:
> - fix a 0-day warning from unused variable
> - split one big patch into three patches
> - fix wrong offset in mediatek hw flags
> 
>  drivers/usb/host/xhci-mtk-sch.c | 123 ++++++++++++++++++++++----------
>  drivers/usb/host/xhci-mtk.c     |   2 +
>  drivers/usb/host/xhci-mtk.h     |  13 ++++
>  drivers/usb/host/xhci.c         |   8 ++-
>  drivers/usb/host/xhci.h         |   4 ++
>  5 files changed, 111 insertions(+), 39 deletions(-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
