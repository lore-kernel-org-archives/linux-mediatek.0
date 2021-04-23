Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5ADC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 03:36:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63B7860724
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 03:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63B7860724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gsid2jhysfk2WRqaeazagvMpfeT3gybBLBco6lqOh7o=; b=BiqMJ/TqVyrjst9CEuLH/D39l
	luLa8E4IhDlSPff/2oZVCqiYxSlAn+xufEQEosWL/ERzhDkPgDs3qpCmA19lShyw1VwJ/WtS5Cvev
	1ChhVTrdhb/xpbTICjWniEDzc1zJPzUO8RvHDeUrSMRGOQIMmiIsNjuNoy2G2hjY93tcOfq2lGv25
	q/vifIxAbVfa77F2pKtHao8WJ2PzE/iM3ljyWoYOjhyFEANLWIaJVKAl73tK7D1g0+uNd+IuRFiYr
	jk78dd9nJLO04p9NZckiOhOrddfAGjZmryldbPatAZE25Auxy73ttgwLsjdnglqRNZuR0/TghA8FC
	NuKB5Ud+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmc2-000UF7-1W; Fri, 23 Apr 2021 03:36:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZman-000U1r-OB; Fri, 23 Apr 2021 03:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=a8s8o3QmfKXtnGeUcw7iC6xSARqbgnnv/EVHI3BDnSE=; b=ea7k8Ym26P6cOk4Nq0xNNjIru7
 Vaf/ZgjKGViI0zCQScaK7E215gDqdikeqBMnO6WE2T5mO2YhBA9t9W5iEngE8szNBC9b57F/SToSF
 Q60YFJprg8twZ+Jl4yKxnBDLj2UKKzJc9y3YgxwhZ9EINaSo0kG3fLy+Y5LLBqnzaMK+AfYUllShP
 /uoNvJXLKLr/gkWxsOLT+o5zUJ6tffIcYHBj7/Bdcc5eb3Cebq6Qb6ZfdER5jVbVcIlxEZvky1IGf
 A5rA6eoT+vdCdP3tLltALm5lfR4kh89qqY3aQM08UUA+V11RrWsuQTsTN167x+5lBJ7Do88G8mDZS
 kazsIOnw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmag-00E7Po-Ln; Fri, 23 Apr 2021 03:34:54 +0000
X-UUID: dc727b507c6e478d8f200f52ce98d60e-20210422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a8s8o3QmfKXtnGeUcw7iC6xSARqbgnnv/EVHI3BDnSE=; 
 b=YtGTyDGyIRXk4vdnsGGUJj4Vv4CBw6MATwFvqj1EGReQUwF+Ts7s0WyLlb0AxhX8R/wkxjWJg+Glk6Jakvp/+PDX0sK3VIf+mShZYtamgsB7S180BU+4ZbbnqGIbrV7afUqC+UKKY7OTcMY52duwg3inA2vOxg6ZtJLG01Q96Oo=;
X-UUID: dc727b507c6e478d8f200f52ce98d60e-20210422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 909474665; Thu, 22 Apr 2021 20:34:44 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 20:26:34 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 23 Apr 2021 11:26:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Apr 2021 11:26:31 +0800
Message-ID: <1619148391.4048.6.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] usb: xhci-mtk: remove unnecessary assignments in
 periodic TT scheduler
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Ikjoon Jang <ikjn@chromium.org>, Yaqii Wu <Yaqii.Wu@mediatek.com>,
 <linux-usb@vger.kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Fri, 23 Apr 2021 11:26:31 +0800
In-Reply-To: <YIE3z7qYNtk7G/VB@kroah.com>
References: <20210330080617.3746932-1-ikjn@chromium.org>
 <20210330160508.1.I797d214790033d0402d19ff6b47a34aff60d3062@changeid>
 <1617179455.2752.1.camel@mhfsdcap03> <YGq2YfURFApdJLxb@kroah.com>
 <1617675492.22435.4.camel@mhfsdcap03> <YIE3z7qYNtk7G/VB@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FF15610A808A1ABA467C7CCB2094D285B754C1D6C4AAC46A6E4B9CB772A635982000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_203450_743338_C5907102 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, 2021-04-22 at 10:46 +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 06, 2021 at 10:18:12AM +0800, Chunfeng Yun wrote:
> > On Mon, 2021-04-05 at 09:04 +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Mar 31, 2021 at 04:30:55PM +0800, Chunfeng Yun wrote:
> > > > cc Yaqii Wu <Yaqii.Wu@mediatek.com>
> > > > 
> > > > I'll test it , thanks
> > > 
> > > Did you test this series and find any problems?  If not, I'll go queue
> > > these up...
> > Yes, found an issue on the start-split transaction, but not found the
> > root cause yet :(
> 
> So you are objecting to these being merged at this point in time? 
Yes

>  Can
> you provide feedback to the author about what is wrong?
Already provided feedback add discussed on issue tracker in private

Thanks a lot

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
