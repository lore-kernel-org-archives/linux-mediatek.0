Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39551C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 02:03:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7C9D610EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 02:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7C9D610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zjob8yYzalb8TxbjE7G2/iENIo6GuLtcoRi+63+wa5A=; b=V76TQiECKxQsKKJEot9l57aYI
	YKl/E7+U55DX8qIzr2xAZfMvNMTng8ew+9/Sn9D1O/0T2GxekXJOQ+O0mOSHbZVbWSZ8wSnpyvhC+
	zp5uiezvcwNxyNMWRFz3tOkjOwWwU/b1+HDNtXzrY3mZ0v2smvuVrLSvnuJ8Ofcq6vsNzGefRptE4
	aUJlrBtBDHd2KEcDzjBK1DXCnImHka5UrIs0ANCG/5s2y5V+VHuLA4NpWCQ9zluTHE1HAL/seelY3
	QM1yLFJxMU1Z0Jb4S9JxrpAALK3ZIwUUpWVmdZKpqjHBvNgSEBrT8sE9K2marU7s+zBRWQGesOTvo
	SDr+vdong==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgeDV-001kV6-Fp; Wed, 12 May 2021 02:03:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgeDT-001kUv-Jt; Wed, 12 May 2021 02:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=T8K9jXRssUMgZPyRniiOWW1kVzpxyI3Fg5ZYopeSdmA=; b=xsO7/h0sxi8bfWL91wGQc/y+3y
 xvbkq19iqUIwhTLOhhPlo5ts5q+7pGvzZfVaSJPE91pPWdxRBWB0AiwLaMhwpjbZj7TXvagjG3SM1
 QEOg5jaGjbcOLCmoaC0wz1ms6TQjbTnlI9QH76E2FmHBBiMi/VhEoKRfWgyw1d5THYyZohWXXTtcv
 wRaD79jsoWcLoffTMeckkOhN3woWbsKs5T4vOJS9Laq9d5UTex0aW+3dVLlMQ8oBc+RvDRPRINQGP
 FkRbLEZH4jhFTF6ZDBd+vI+YseW4B6FiXvZCAmJ4QUBr9BdeJMfftXyZ50O1IyPD/t1pl/l5QE90O
 LEDoV1Ng==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgeDQ-00A2sF-9d; Wed, 12 May 2021 02:03:13 +0000
X-UUID: f7aa69e12e0141648ca9f5ff19f4026f-20210511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=T8K9jXRssUMgZPyRniiOWW1kVzpxyI3Fg5ZYopeSdmA=; 
 b=Nb33roV1WaFkIZNt5b1qAlZN1TPrti7gyGaF+EsEdiqKwXIGrkMGCuNBTuhRCf4kYaohpx9SZmP8s08RREHruGqIyIgFJLTdRj4dKcctbPLdEGFJYmSy+53eaUdNdj/+evZGscg035PSiPaRVS0riBnlCgPWQT4nc/cFZFm9nSg=;
X-UUID: f7aa69e12e0141648ca9f5ff19f4026f-20210511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 850390920; Tue, 11 May 2021 19:03:09 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 May 2021 19:03:07 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 May 2021 10:02:59 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 May 2021 10:02:58 +0800
Message-ID: <1620784978.25159.4.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: core: hub: fix race condition about TRSMRCY of resume
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Alan Stern <stern@rowland.harvard.edu>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "Gustavo
 A . R . Silva" <gustavoars@kernel.org>, Bixuan Cui <cuibixuan@huawei.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>, Oliver Neukum <oneukum@suse.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Tianping Fang <tianping.fang@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 12 May 2021 10:02:58 +0800
In-Reply-To: <YJpqJr/3XEIYrtko@kroah.com>
References: <20210511101522.34193-1-chunfeng.yun@mediatek.com>
 <YJpqJr/3XEIYrtko@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BB3D69465F189431B6CB5B8CFC24F1B67DD4789539F36897903386BFD931EB7C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_190312_362400_848B790F 
X-CRM114-Status: GOOD (  15.22  )
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

On Tue, 2021-05-11 at 13:27 +0200, Greg Kroah-Hartman wrote:
> On Tue, May 11, 2021 at 06:15:22PM +0800, Chunfeng Yun wrote:
> > This may happen if the port becomes resume status exactly
> > when usb_port_resume() gets port status, it still need provide
> > a TRSMCRY time before access the device.
> > 
> > Reported-by: Tianping Fang <tianping.fang@mediatek.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >  drivers/usb/core/hub.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Does this need to go to any older/stable kernels?  If so, how far back?

The flow is changed by 
"b01b03f3ad82 USB: add new routine for checking port-resume type", but
it will cause conflict with
"ad493e5e5805 usb: add usb port auto power off mechanism"
 
> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
