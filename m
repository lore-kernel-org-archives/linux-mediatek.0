Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3518C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C320613F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C320613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=07jqge7tTI4DNrw9wZuIvsRn9S8nP+GPk3NCchVwLoM=; b=XsnrqnBCD4aKbDbSSTCdrP7Fb
	YAYg2V/iBKRmohgbvwv1kvk05U2PnTtm53uZJ0WXfXExPKag3w/EtI139bR5T/xy/rkJVlj8S2BFq
	yAoDugJvH4u0PIpMx/EMPkdUAvmuEI64C7WnsR/dOI/KzXYoIyvkEL47S/VzuuIJQYYzZ1jtZ/gl6
	DCpcGFIwSAfUJXBkgGUfZZ4S24sPCOCzjIMMULUS4oA52mmPU9/wyKvop+jE8ZRObqtT6J81SEmui
	uyvbNdvwyW19fp7V90LFFxgS/O9k7plEER4ybdeVC1fdcoyewyToIQMIWy5rXwxTQQGGG+4Aucx6l
	PlAcFFfMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoPp-000hjr-8Z; Fri, 23 Apr 2021 05:31:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoI8-000fex-Tl; Fri, 23 Apr 2021 05:24:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79047611AC;
 Fri, 23 Apr 2021 05:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1619155394;
 bh=EHiyqkXyAYkMEFatPdUnpNaU4lxiIe2WnwL3Z9I4alw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PMstjOsfOLByJZmoC6x1NS1DsBXwMJMi3HnflLCvI+H8IVzbqI7OfCiWPcPdssFSU
 TA+9mIQaI4WFNWELX4ceEGVbJrk17m4XxGhQRAJnKuSwAJ5p8lxueB9FlB4oJIyIFZ
 TfRqz3mDSttFbH3RAfrmoNRKffCijtVJQJQBznDs=
Date: Fri, 23 Apr 2021 07:23:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Ikjoon Jang <ikjn@chromium.org>, Yaqii Wu <Yaqii.Wu@mediatek.com>,
 linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] usb: xhci-mtk: remove unnecessary assignments in
 periodic TT scheduler
Message-ID: <YIJZvN8py7s+Zq6I@kroah.com>
References: <20210330080617.3746932-1-ikjn@chromium.org>
 <20210330160508.1.I797d214790033d0402d19ff6b47a34aff60d3062@changeid>
 <1617179455.2752.1.camel@mhfsdcap03> <YGq2YfURFApdJLxb@kroah.com>
 <1617675492.22435.4.camel@mhfsdcap03> <YIE3z7qYNtk7G/VB@kroah.com>
 <1619148391.4048.6.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619148391.4048.6.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062436_360169_821B0036 
X-CRM114-Status: GOOD (  15.70  )
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

On Fri, Apr 23, 2021 at 11:26:31AM +0800, Chunfeng Yun wrote:
> On Thu, 2021-04-22 at 10:46 +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 06, 2021 at 10:18:12AM +0800, Chunfeng Yun wrote:
> > > On Mon, 2021-04-05 at 09:04 +0200, Greg Kroah-Hartman wrote:
> > > > On Wed, Mar 31, 2021 at 04:30:55PM +0800, Chunfeng Yun wrote:
> > > > > cc Yaqii Wu <Yaqii.Wu@mediatek.com>
> > > > > 
> > > > > I'll test it , thanks
> > > > 
> > > > Did you test this series and find any problems?  If not, I'll go queue
> > > > these up...
> > > Yes, found an issue on the start-split transaction, but not found the
> > > root cause yet :(
> > 
> > So you are objecting to these being merged at this point in time? 
> Yes
> 
> >  Can
> > you provide feedback to the author about what is wrong?
> Already provided feedback add discussed on issue tracker in private

That doesn't help us much as we can't see that :(

Please always keep us informed as to what is going on with publically
posted changes, otherwise you could find them being picked up and merged
into trees without an objection.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
