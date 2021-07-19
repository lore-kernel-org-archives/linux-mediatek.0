Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEB8C12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 07:42:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E3B6109E
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 07:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10E3B6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+L8/3Sn8+bpam8EROEz1yVgugdr/cR7k4sRBWb0Msps=; b=lC2VT4q/ycVijL
	loXUZGokqtvj9CUdseKkNltqIYYA2J5Pq2Vn0w8j06J0lj++eTm1B7J9pSGdjzvlm+vSsFNnhOfMk
	A10n1glEkGPqvA1mq/g7tV4gnRP/MkwCV1K4OLynwfjfzwm+ZGNk1AWD+fzngHLATpIYn55LQqpIZ
	/vQbAUjeD3hxRzwmCDL8RHLVX5uYm/9RYGEuB59jBMNhwUDbsOCrbgK4X/Zzbeg6vBvfpIiiRSnLd
	f7gPPZKJwhvfB1iMWEU7qIVOZUApm6NkmGH9FmWz/hFsUXOYYl3oPlvJMncvVXGE1P5LGFcdyVPuD
	uSxUxvK3/7FXh+mtut/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5NvI-008d3P-0A; Mon, 19 Jul 2021 07:42:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Nv5-008d0c-Fl; Mon, 19 Jul 2021 07:42:32 +0000
X-UUID: 09c6ee3bcaca4636a24c4da04575001b-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kcrLE2gk3RE5/35eAA/MRhhmrBDDAk4xwCCFzcoaOFM=; 
 b=bPvvABPPDT5d5f/16JFYGbW1YAXh0QMpWOtrJC1oR+L++TQJVHW1rYhjKn2+ORO6+N0zxtlMTqsWGiS+PHsO//IssZzmLrIRcVcCgnJac11eI7CARuPhklNHKx1EHCNCmHFBI9OM2lgWU5+PVTIUiMiAE3ZrF8L6eKe4JplgFFk=;
X-UUID: 09c6ee3bcaca4636a24c4da04575001b-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1822285076; Mon, 19 Jul 2021 00:42:28 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 00:33:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 15:17:55 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Jul 2021 15:17:54 +0800
Message-ID: <1626678127.10522.2.camel@mbjsdccf07>
Subject: Re: [PATCH v4 1/1] arm64: dts: mediatek: add MT6779 spi master dts
 node
From: Mason Zhang <mason.zhang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>
Date: Mon, 19 Jul 2021 15:02:07 +0800
In-Reply-To: <1624501564.30242.7.camel@mbjsdccf07>
References: <20210624021137.11513-1-mason.zhang@mediatek.com>
 <1624501564.30242.7.camel@mbjsdccf07>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_004231_573645_96ED1C81 
X-CRM114-Status: GOOD (  11.00  )
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

On Thu, 2021-06-24 at 10:26 +0800, Mason Zhang wrote:
> 
> Dear Matthias:
> 
> 	I'm sorry to disturb you again, My company mailbox has a little bug, it
> caused my comments always appearing in the commit message...
> 	I have update commit message now, so do you have any other concern
> about this patch? Can you help me gentle ping on this patch?
> 
> Thanks
> Mason


Dear Matthias:

	Could you please gentle ping on this patch?

Thanks
Mason

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
