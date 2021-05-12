Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96533C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 02:04:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77D2610EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 02:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77D2610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NkCQy2fAA7KzLs7kJoHhZhpgG3hCLV8TCBL+iVdBJrw=; b=Ih6tgdD4jr+XgtCC5gmLTSWaU
	UAr1D7zpfeH6mxaYyFTO4AExId+FMGTa2SGd6Ptx8EiA6OFz0Fgib9nun38hb7VWRtW2qkIKa8Ct1
	rYR4umrOe7lvlTlJKvGTEyO6N1sQn5VVeZshVltWNphJWuuFFmz+CWTfhwij0EoVY/csXGCe7+cT4
	7oM6zrQhf6pM/dNI2c1ZN19h8VEYaYP2LOQKDLbrCe0Ehjts4oIR+/O7aRtVaWJPajlyenPCYUvYk
	g2M4hDBo8lBaoXsZOrKoZV9tfVm1DuTvh0brX0BIQFjaqegayKXrG2/fkfZazsNwu+AR9cU3pheok
	EC94dF3fw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgeE4-001kXM-VZ; Wed, 12 May 2021 02:03:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgeE3-001kX1-0d; Wed, 12 May 2021 02:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=PwJHRqwBEarNjfAVmhlQxjauvjjxcaY8dzl8Reekzso=; b=NWpWdftbFYQiBDCfkma2rE78ml
 noDA6jXqzkLqBHv9vp/D2vdMo6rictdKWZMPmjxRQA0T0tGyWDnEAIuySDw1YJOctZR5SpWZp+lI6
 NtgIGPkEJO2kdg2iVfwUgxcbO6JCqRBe3UdwRS0eFUQoqRUGUkm+h8mjyHlYEDtRSSfLxhy5XRfL/
 BpR0oocOECZJr9MIpsmo9ACJFN172uP3Jiyn1540lO2m0zYK5KfAU90Q0gblIw16aamsdvqrWuAAy
 StAkxvrU/FOu3beuvbRagDqzpdxeGvQo3QOqNXnDheNTTYZdYHImJIYmb8z86/l4EcfVTMB/eTF7S
 wpI0Ngcw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgeE0-00A2tF-HL; Wed, 12 May 2021 02:03:49 +0000
X-UUID: 2ffc7445c91c4177a691bf43d92ccbc5-20210511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PwJHRqwBEarNjfAVmhlQxjauvjjxcaY8dzl8Reekzso=; 
 b=vB5g4fRZQ4PbTxHiJHYtXh+S1GmKBXVr9jd5nSY/D3K7vOIggfXkbDmIiBm90798Oo0rIZH06BoYIu30gcKCxnWeRtnOTE+wH4jKTR8QQxLatzupYLeI6Q7Z+tvbCKkr1qoHMMuQcT/O5KiQlAUERnwEryrAFFPcclVl2/uBWoM=;
X-UUID: 2ffc7445c91c4177a691bf43d92ccbc5-20210511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 477226510; Tue, 11 May 2021 19:03:42 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 19:03:40 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 May 2021 10:03:38 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 May 2021 10:03:37 +0800
Message-ID: <1620785017.25159.5.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: core: hub: fix race condition about TRSMRCY of resume
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "Gustavo
 A . R . Silva" <gustavoars@kernel.org>, Bixuan Cui <cuibixuan@huawei.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Oliver Neukum <oneukum@suse.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Tianping Fang <tianping.fang@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 12 May 2021 10:03:37 +0800
In-Reply-To: <20210511163907.GB901897@rowland.harvard.edu>
References: <20210511101522.34193-1-chunfeng.yun@mediatek.com>
 <20210511163907.GB901897@rowland.harvard.edu>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E3079C5BB8EAEF3DC9471B8695BAD55DD3FA211E210FA2A8C5F3E4DBC356237E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_190348_599322_5BCE3B76 
X-CRM114-Status: GOOD (  18.90  )
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

On Tue, 2021-05-11 at 12:39 -0400, Alan Stern wrote:
> On Tue, May 11, 2021 at 06:15:22PM +0800, Chunfeng Yun wrote:
> > This may happen if the port becomes resume status exactly
> > when usb_port_resume() gets port status, it still need provide
> > a TRSMCRY time before access the device.
> > 
> > Reported-by: Tianping Fang <tianping.fang@mediatek.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> This should also say:
> 
> CC: <stable@vger.kernel.org>

OK, thanks

> 
> > ---
> >  drivers/usb/core/hub.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index b2bc4b7c4289..fc7d6cdacf16 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -3642,9 +3642,6 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
> >  		 * sequence.
> >  		 */
> >  		status = hub_port_status(hub, port1, &portstatus, &portchange);
> > -
> > -		/* TRSMRCY = 10 msec */
> > -		msleep(10);
> >  	}
> >  
> >   SuspendCleared:
> > @@ -3659,6 +3656,9 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
> >  				usb_clear_port_feature(hub->hdev, port1,
> >  						USB_PORT_FEAT_C_SUSPEND);
> >  		}
> > +
> > +		/* TRSMRCY = 10 msec */
> > +		msleep(10);
> >  	}
> >  
> >  	if (udev->persist_enabled)
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
