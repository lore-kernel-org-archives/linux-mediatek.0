Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB67C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfIZ8eq+j3Gh9hP9C827U+sdjbvAAO1vgo3RR0cOEJg=; b=WGC+pgrR8GJoZw1Rjxl3y5Lx+w
	u1oXGLRvGfd8/hrrUYCYW9ak/eQUuxP48cyu85SZwJLrrqUo0xyBPMRZNyrpIaYDKly0SIR69IZKN
	CNz55DbgfYBhUoXKMpSM0J011cCzfgPtfh8KrmeJXo+Wf6/pvQVZeUkSuKBPdKMaieVbF399osoNP
	YfYjktl8CU819/m8EL69zVvtLuNhBsvVWiyg/wqGACilR4JvmcoFz0Lr3w8zLNvDceTstL5a6ZZga
	8AOLW46MQQQpakolgmZY+KckXhQ4S15HD/1Dv9I1ISQ3RKLbPXxrJT/V+IigP4nAjRfVLmqwD53/q
	0xvDoR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZ0j-00GuP9-1a; Wed, 28 Sep 2022 15:30:09 +0000
Received: from netrider.rowland.org ([192.131.102.5])
	by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZ0g-00GuNU-2d
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 15:30:07 +0000
Received: (qmail 490088 invoked by uid 1000); 28 Sep 2022 11:30:05 -0400
Date: Wed, 28 Sep 2022 11:30:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
  linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
  Min Guo <min.guo@mediatek.com>, Tianping Fang <tianping.fang@mediatek.com>,
  Stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: mtu3: fix ep0's stall of out data stage
Message-ID: <YzRofTAx+3pPCbrL@rowland.harvard.edu>
References: <20220928091721.26112-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928091721.26112-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_083006_276325_A315413F 
X-CRM114-Status: GOOD (  11.65  )
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

On Wed, Sep 28, 2022 at 05:17:20PM +0800, Chunfeng Yun wrote:
> It happens when enable uvc function, the flow as below:
> the controller switch to data stage, then call
>     -> foward_to_driver() -> composite_setup() -> uvc_function_setup(),
> it send out an event to user layer to notify it call
>     -> ioctl() -> uvc_send_response() -> usb_ep_queue(),
> but before the user call ioctl to queue ep0's buffer, the host already send
> out data, but the controller find that no buffer is queued to receive data,
> it send out STALL handshake.
> 
> To fix the issue, don't send out ACK of setup stage to switch to out data
> stage until the buffer is available.

You might find it is better to use the delayed_status routines already 
present in the Gadget core.  Instead of delaying the response to the 
Setup packet of the second control transfer, delay the status response 
to the first control transfer.

This approach has the advantage of working even when the second transfer 
is not control but something else, such as bulk.

Also it agrees better with the way the USB spec intends control 
transfers to work.  The UDC is not supposed to complete the status stage 
of a control transfer until the gadget has fully processed the 
transfer's information and is ready to go forward.

Alan Stern

