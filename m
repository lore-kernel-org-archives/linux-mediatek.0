Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CFFC04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 06:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kRxtmHTsdu+ZgQ5hqeQQZoJ5CfeIzgNxRzM6lCvc2I=; b=IZ8nSEC/9fuzJC9PNUBjIMuqrh
	fHFFEDOHrcOHBTyIYDPMk3f06uMYD/Fj9p+A5nQ6Pa7zFcJuwgqS0HxK7+//wDvA9aKAxys/dUfLE
	1VbzG2hXhycE1RdMkdghGf93HXUG54KsUk3+lyMGO+bhu5etSVMkClNqxTau5Hi7EAoCkIpmt6ysu
	PFvczqcWuSR2dUosTwf11bgzgN3qFNAuh/SuIyaVICaLmjjwBnHw2iPxuJSz/44CqdO49qksQjQa2
	PYOL/YOCBZqwdkUCGNsnqtUdja6y2QDKHHn1nTDW5QORQLRRwUoQU4nEzqdU6W6DVeOMzHnG6cwSe
	EXUUXnZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odn6Z-001Q1x-Ok; Thu, 29 Sep 2022 06:33:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odn6X-001Q0f-J0; Thu, 29 Sep 2022 06:33:06 +0000
X-UUID: 31552d5829bc46a8b951048c48fa1e3d-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=6kRxtmHTsdu+ZgQ5hqeQQZoJ5CfeIzgNxRzM6lCvc2I=;
	b=oW907LWcPNEBpq4DeYfhe61SEQKBfIkZxYrueh9Diw/uKu5gXvXZ8QKRu5ReYPJA5WQdcgau2cAQrr9L6aAA6OS42sHI1siwmuIp0CDnbROaoJgzVORTIf319k6eAsEx802ZXPoyV7Ndboug5qfKyx/8p7Y204DHTXIrJRPmbhQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:699c92db-5999-4196-a451-33cf1069f36c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:036b9de4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 31552d5829bc46a8b951048c48fa1e3d-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1020628525; Wed, 28 Sep 2022 23:31:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 29 Sep 2022 14:30:46 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Sep 2022 14:30:45 +0800
Message-ID: <cfd35493a293cf6f7ddd68fe3cc665989ea36015.camel@mediatek.com>
Subject: Re: [PATCH 1/2] usb: mtu3: fix ep0's stall of out data stage
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, Min Guo
	<min.guo@mediatek.com>, Tianping Fang <tianping.fang@mediatek.com>,
	<Stable@vger.kernel.org>
Date: Thu, 29 Sep 2022 14:30:45 +0800
In-Reply-To: <YzRofTAx+3pPCbrL@rowland.harvard.edu>
References: <20220928091721.26112-1-chunfeng.yun@mediatek.com>
	 <YzRofTAx+3pPCbrL@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_233305_702838_430793FA 
X-CRM114-Status: GOOD (  21.12  )
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

On Wed, 2022-09-28 at 11:30 -0400, Alan Stern wrote:
> On Wed, Sep 28, 2022 at 05:17:20PM +0800, Chunfeng Yun wrote:
> > It happens when enable uvc function, the flow as below:
> > the controller switch to data stage, then call
> >     -> foward_to_driver() -> composite_setup() ->
> > uvc_function_setup(),
> > it send out an event to user layer to notify it call
> >     -> ioctl() -> uvc_send_response() -> usb_ep_queue(),
> > but before the user call ioctl to queue ep0's buffer, the host
> > already send
> > out data, but the controller find that no buffer is queued to
> > receive data,
> > it send out STALL handshake.
> > 
> > To fix the issue, don't send out ACK of setup stage to switch to
> > out data
> > stage until the buffer is available.
> 
> You might find it is better to use the delayed_status routines
> already 
> present in the Gadget core.  Instead of delaying the response to the 
> Setup packet of the second control transfer, delay the status
> response 
> to the first control transfer.
Ok, I'll try to use delayed_status to handle this issue.

Thanks a lot.

> 
> This approach has the advantage of working even when the second
> transfer 
> is not control but something else, such as bulk.
> 
> Also it agrees better with the way the USB spec intends control 
> transfers to work.  The UDC is not supposed to complete the status
> stage 
> of a control transfer until the gadget has fully processed the 
> transfer's information and is ready to go forward.
> 
> Alan Stern


