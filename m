Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782C7C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 08:13:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CDA561077
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 08:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CDA561077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJB0CfpwEo3YK1Kl8+1Yb/fge+f+ed5hkTjwLM7bi30=; b=XG8np0nXiWeDUi
	DlGBTvey3iHauuowTKUxmPUMDG3Uw46jxbR3lMJt0NUOraz7M7IIOf/V1+o4tP9e25tU9r9vzCK85
	f6qQGvVMdWH0p3LdLInmAZ3Ox/j/lG0VVimltoQ5wWrixt/CyvWS2vQK1j6DabTxMcv5nlCXPcY29
	V1cDR3KB3noMJVF9vUtZVO7GRAQpndiXF4bFeQeOCpJsVrk30IiQzvasFsg4skz6yyHV1KcRIypY2
	4afB7yF4E1fM+9evxfCGo1FHfKANOHyzG6FFQbt1EcRytkDRvKZOkIdTyjsG2SQHzPoIsAhFHeeuV
	iPjW/K4DVsOwcHIIBqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m91Ab-003V8U-Fd; Thu, 29 Jul 2021 08:13:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m91AX-003V77-GM; Thu, 29 Jul 2021 08:13:31 +0000
X-UUID: d1356926a4894414bc519397b6ad294b-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CfGxGAjdzdCsCKdVxId1TpVgUCd693e2+HRJsL1iWII=; 
 b=O8DA77BfTwZASIse0R1QQ+2LGFL3j+346bsZyUGWxeialHYqZijGVdKpeO7yqjymT15IHe7uUAYdQRpq07ZXixykw6mAqD8MBf+8qr64IMkD/X9YsW8Vd1R22HS3bQZuy6xexLgv6CHGOHjmd1POnFm35ROnWnfaM2lVnPBDLWo=;
X-UUID: d1356926a4894414bc519397b6ad294b-20210729
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1475921122; Thu, 29 Jul 2021 01:13:27 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 01:13:25 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 16:13:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Jul 2021 16:13:21 +0800
Message-ID: <c9cbff988d4b79e4bdbe4715213ccea3c56c12c8.camel@mediatek.com>
Subject: Re: [PATCH v1 0/1] Mediatek uart patch
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Greg KH <greg@kroah.com>
CC: <timur@kernel.org>, <linux@armlinux.org.uk>, <alcooperx@gmail.com>,
 <tklauser@distanz.ch>, <sean.wang@kernel.org>, <srv_heupstream@mediatek.com>, 
 <hui.liu@mediatek.com>, <yuchen.huang@mediatek.com>,
 <huihui.wang@mediatek.com>, <eddie.huang@mediatek.com>,
 <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>
Date: Thu, 29 Jul 2021 16:13:20 +0800
In-Reply-To: <YQJEzlb2NyxD1EpD@kroah.com>
References: <20210729014817.11879-1-zhiyong.tao@mediatek.com>
 <YQJEzlb2NyxD1EpD@kroah.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_011329_589329_48C42218 
X-CRM114-Status: GOOD (  21.64  )
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

On Thu, 2021-07-29 at 08:03 +0200, Greg KH wrote:
> On Thu, Jul 29, 2021 at 09:48:16AM +0800, Zhiyong Tao wrote:
> > This series includes 1 patches:
> > 1.fix uart corruption issue when rx power off
> > 
> > when uart is used as a communication port with external
> > device(GPS).
> > when external device(GPS) power off, the power of rx pin is also
> > from
> > 1.8v to 0v. Even if there is not any data in rx. But uart rx pin
> > can
> > capture the data "0".
> > If uart don't receive any data in specified cycle, uart will
> > generates
> > BI(Break interrupt) interrupt.
> > If external device(GPS) power off, we found that BI interrupt
> > appeared
> > continuously and very frequently.
> > When uart interrupt type is BI, uart IRQ handler(8250 framwork
> > API:serial8250_handle_irq) will push data to tty buffer.
> > The code path:
> > 
https://elixir.bootlin.com/linux/latest/source/drivers/tty/serial/8250/8250_port.c#L1917
> > mtk8250_dma_rx_complete is a task of mtk_uart_apdma_rx_handler.
> > mtk8250_dma_rx_complete priority is lower than uart irq
> > handler(serial8250_handle_irq).
> > if we are in process of mtk8250_dma_rx_complete, uart appear BI
> > interrupt:1)serial8250_handle_irq will priority execution.2)it may
> > cause
> > write tty buffer conflict in mtk8250_dma_rx_complete.
> > So the spin lock protect the rx receive data process is not break.
> 
> All of this information should be in the changelog for the patch
> itself.
> There is no need for a "cover letter" for a single patch like this.
> 
> Can you redo your 1/1 patch and add the above information to the
> changelog text and resend it as a v2?
> 
> thanks,
> 
> greg k-h

Dear greg,

Thanks for your suggestion. we will move it to patch 1/1 in v2.

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
