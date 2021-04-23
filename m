Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4F0C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 06:16:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAA5B613D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 06:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAA5B613D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4yknxxLGFGwtImh6HzfkwSxRBEnvj2pTBJ2rEsrdqL0=; b=X32uef4fBBU9kzlnIjgSBENSB
	oNUkQ7kOxHbuUAEFxr7nvYV5IsoRkP1SkuowWWfxJe/sc0lScfjme1cx9sM+zccNxAOEgKiwIaPkw
	kiofdqMzvmqglV/gwnyXaXP6xNYXWWQg3Domq2ZLhTIRSt/HgytR8bpNxmtNY1uoMVdFlgF9inQ6Z
	G2Lb0s47oVvsLgR876KYDxfNYG81It6gW+tbUBuEUtfFIcnYNi1T5J62kw4P6+k+HB1ToD3+KNx6U
	SxBkHrDPDfAENZSQDhbDb1+1Z0cHJYHaMNu9MWTDCJoNSOWZrtIVybhp3ibqk7IA9zVsx6ACYCl5B
	qv9X4qYdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZp6i-000pz8-MZ; Fri, 23 Apr 2021 06:16:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZp6I-000ptt-C2; Fri, 23 Apr 2021 06:15:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=qKNRpZ4EQ+9jotaNrjrSFEj6kXwJTJJ5QGpQogNsh2I=; b=vbma+bqelcRQUDd/wcFWPqXVnw
 87O4joZtKZHoL7+NMUJn7pv6MW2eE6jpnqIBjsbwc5TBCRIQs02F4GSEtn0yeN7AZ6wQn6uBIia6h
 Li/Rp1uBcfsbPKK6CPBdzUnvsserZVCtWSE5eWm1Jw1t/jU/9FbdIwY1QhamfgTkipGG88T4zQNdt
 FvV7msPlru3UZC0iZMkTcooie08rDhh8N93h/aHFtv92HESUMie2n1gkLzjrSwgtkb7fGuC0oggt4
 NjaZBECSed/tJ4ihCAZGITMLqIRpOkTgpPio9fSDcosJZhUNaCWezfOB+Qk+7Iec9TiMmTvqUcCc0
 1SzFzd/Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZp6F-00EBFi-Gy; Fri, 23 Apr 2021 06:15:36 +0000
X-UUID: 11096acdd82d42ba899872a54e744e4a-20210422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qKNRpZ4EQ+9jotaNrjrSFEj6kXwJTJJ5QGpQogNsh2I=; 
 b=boRMQ6X63mW9Unsu6RN8B/XyaRt6w4sFEq9vPV7Ic8yLNFNB17F1AJ8Utc3Gr5/EgyWgfV4Srd6Ll1WREKbcI7gwZBEoBw8OClJ1yRrwSDCShLjGTyOqJyPRf7BttOkCYzfOWk5Pd2ohaMA3potJme7Vi946aEH8nVArxbRk6cY=;
X-UUID: 11096acdd82d42ba899872a54e744e4a-20210422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2053430794; Thu, 22 Apr 2021 23:15:32 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 23:06:56 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 23 Apr 2021 14:06:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Apr 2021 14:06:48 +0800
Message-ID: <1619158008.4048.10.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] usb: xhci-mtk: remove unnecessary assignments in
 periodic TT scheduler
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Ikjoon Jang <ikjn@chromium.org>, Yaqii Wu <Yaqii.Wu@mediatek.com>,
 <linux-usb@vger.kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Fri, 23 Apr 2021 14:06:48 +0800
In-Reply-To: <YIJZvN8py7s+Zq6I@kroah.com>
References: <20210330080617.3746932-1-ikjn@chromium.org>
 <20210330160508.1.I797d214790033d0402d19ff6b47a34aff60d3062@changeid>
 <1617179455.2752.1.camel@mhfsdcap03> <YGq2YfURFApdJLxb@kroah.com>
 <1617675492.22435.4.camel@mhfsdcap03> <YIE3z7qYNtk7G/VB@kroah.com>
 <1619148391.4048.6.camel@mhfsdcap03> <YIJZvN8py7s+Zq6I@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1B667E5A54943B80BF95B365D7D390CBCA4920A8D3A472FCE67460DA8E430A4E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_231535_592574_2C57DD61 
X-CRM114-Status: GOOD (  18.75  )
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

On Fri, 2021-04-23 at 07:23 +0200, Greg Kroah-Hartman wrote:
> On Fri, Apr 23, 2021 at 11:26:31AM +0800, Chunfeng Yun wrote:
> > On Thu, 2021-04-22 at 10:46 +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Apr 06, 2021 at 10:18:12AM +0800, Chunfeng Yun wrote:
> > > > On Mon, 2021-04-05 at 09:04 +0200, Greg Kroah-Hartman wrote:
> > > > > On Wed, Mar 31, 2021 at 04:30:55PM +0800, Chunfeng Yun wrote:
> > > > > > cc Yaqii Wu <Yaqii.Wu@mediatek.com>
> > > > > > 
> > > > > > I'll test it , thanks
> > > > > 
> > > > > Did you test this series and find any problems?  If not, I'll go queue
> > > > > these up...
> > > > Yes, found an issue on the start-split transaction, but not found the
> > > > root cause yet :(
> > > 
> > > So you are objecting to these being merged at this point in time? 
> > Yes
> > 
> > >  Can
> > > you provide feedback to the author about what is wrong?
> > Already provided feedback add discussed on issue tracker in private
> 
> That doesn't help us much as we can't see that :(
> 
> Please always keep us informed as to what is going on with publically
> posted changes, otherwise you could find them being picked up and merged
> into trees without an objection.
Got it.
I'll update status when find the root cause of SS transaction issue,
thanks a lot.

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
