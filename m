Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50310C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 01:30:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AFA960724
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 01:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AFA960724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YBhqFlCnvD7L9M6Q8pLM9zKwz4NDibVvRdYqrZAwsls=; b=U8U9Z9n0sIF3wd5NkUYVWKix2
	fx5vl0vQEClig35QC8q/zuIeKqe678nqYYkf6us4TfeZwfDIu7U4xCxayofrvB7hxaNS0u34onoeh
	NX9kfaTsCP+YnGuI54P4zSPIwZdM0ELCd6uBg6syXUvG/hAetLwRD73psfj7VBD+xpa4fUh/4xHM5
	dK2mS4zkjok37A3LVKbFop1Dql75PP8sfd7XWhYhFDUSzgRdaaLZz4g+/oiYtNtuN6iX7D30BBbvW
	CniVaemCifGQq8hWDEbPxnd/tW/VmGg6c+kBHUpVIJHT+ZQ107nJPil/7ZZra4oWVSMvpaL5bMQCz
	DtYjKv3uQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lepJv-005lS3-9X; Fri, 07 May 2021 01:30:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lepJm-005lQ1-9n; Fri, 07 May 2021 01:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=iiFfXmQYkdmmOra4wpVCQ2JoiJmpXgudiKiRfa7anYw=; b=KiPsKh9M+2Aq0JQJHhgYJhzpAg
 TMtcmv1zyk0TqwhrX6W9PkZMIoN7tX1ab4k88EM4oT7SJHhIDQVfqaX7egvKb/XxseOUwep2XEoul
 Xxzi22ZKDTs7LXQXfoxlH6etwRTb09USDasRqFlmfPcciBNAlifVN7Aak6LTdzBfJTd68a808QxYf
 XxkuNML/JHpO/GhzwGXiXqcjunt7r5V2RY+5CxeTN627iRU+MNJr6B0jzuglhmLY29KYdqFZAuheA
 B8Guj7gCDXOL8L93R0WTUuk4Qr/vmMMFuEE8q7LTHOEom8T5c6TLkTNIneiPH52YRIfeRN62OCc7e
 AixD5D8Q==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lepJe-006VPN-Qo; Fri, 07 May 2021 01:30:09 +0000
X-UUID: 777b620e4b08409e80ab8eec9482755d-20210506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iiFfXmQYkdmmOra4wpVCQ2JoiJmpXgudiKiRfa7anYw=; 
 b=AtS/J5qJJ9vh8+28zslcbSJirF14gTvDZtnl5SiXvGpA5aPSM6zAowHW2XCbyxhBnlgjQeznpVfKnkrCndmGWbivYmS3vsJNpRkC0Zuw+YJUA2qRoSY+7u/99H3vdJEXbhZnZLAtInjubcfzb4/1iNJgnbSfhZX35EGCnDwav+k=;
X-UUID: 777b620e4b08409e80ab8eec9482755d-20210506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 710464828; Thu, 06 May 2021 18:30:02 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 18:27:38 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs06n1.mediatek.inc
 (172.21.101.129) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 May 2021 09:27:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 May 2021 09:27:35 +0800
Message-ID: <1620350855.10796.3.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/3] usb: xhci-mtk: use bitfield instead of bool
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Ikjoon Jang <ikjn@chromium.org>, Eddie Hung
 <eddie.hung@mediatek.com>
Date: Fri, 7 May 2021 09:27:35 +0800
In-Reply-To: <YJOcq+Pq5omZz3p1@kroah.com>
References: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
 <YJOcq+Pq5omZz3p1@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_183006_891131_BFFE30F4 
X-CRM114-Status: GOOD (  13.23  )
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

On Thu, 2021-05-06 at 09:37 +0200, Greg Kroah-Hartman wrote:
> On Thu, May 06, 2021 at 02:31:14PM +0800, Chunfeng Yun wrote:
> > Use bitfield instead of bool in struct
> > 
> > Refer to coding-style.rst 17) Using bool:
> > "If a structure has many true/false values, consider consolidating
> > them into a bitfield with 1 bit members, or using an appropriate
> > fixed width type, such as u8."
> > 
> > Due to @has_ippc's default vaule is 0, no need set it again if fail
> > to get ippc base address
> 
> Please split this change out into a separate patch, as it has nothing to
> do with the "change to bitfield" change.
Ok, thanks

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
