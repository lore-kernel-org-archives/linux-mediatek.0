Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E88C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 02:18:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021FE6139B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 02:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 021FE6139B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ld8wnJB11mW0p9rKL51RodGbelUtsW5qSqrUFvclmlw=; b=peJBgTJ6KaEb9uT6VJHQaaPxt
	BSMLeQ3yplu0Xiavr31sZwshOJ7otUTGsfjgzuQ29M12XbUIMCUbfA2cFPZTdXRxtjTXbo93RzJ2a
	u56o8YftdE8gUJ+f1uVo1cmsFEeV0UA6eKQShKSaeZm5KrzQzzzgPxa/aeQU93tc4UQQG+PD1KEoj
	4ayWU4fDKKeuJldrLHWZljTAN9tSPNQY9CBwXZo4DD76a+b/PKJRbbUlGG+ZTN+w4VROlWUB/A8/f
	nDNfgUkRhsY8mUS56gaHo2rw8zgjE2NG2SE2AYPQnKcFHk8gd5TOzg72Sn4abZGwmEqonnvp7ugD4
	hl0Vweu6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTbIe-001FUU-Ox; Tue, 06 Apr 2021 02:18:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTbIS-001FTJ-4M; Tue, 06 Apr 2021 02:18:31 +0000
X-UUID: 8affccedc2e94673a668223b8d610fb7-20210405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Gum8DmPKyJ1oZDVQaFVj6BihhQF1RHFD6805mHWOT9s=; 
 b=rlcrzLAJBK/n9wRRHdh9o93Z8ea1czFDyxkhqyEvkZRCov2RH1EGc/r58AliqoRvsrFEB+Npv0CR70ZjC1Uq4rEM+2qwXB1kZA1IYeOK3RiA7TCKdSn1aSyB2nNfji3jzxagZQ18npiaLuSGNGYCqWoAEV0lPv4fSzWuEqJegaw=;
X-UUID: 8affccedc2e94673a668223b8d610fb7-20210405
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 171040203; Mon, 05 Apr 2021 19:18:20 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 19:18:18 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 6 Apr 2021 10:18:12 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Apr 2021 10:18:12 +0800
Message-ID: <1617675492.22435.4.camel@mhfsdcap03>
Subject: Re: [PATCH 1/2] usb: xhci-mtk: remove unnecessary assignments in
 periodic TT scheduler
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Ikjoon Jang <ikjn@chromium.org>, Yaqii Wu <Yaqii.Wu@mediatek.com>,
 <linux-usb@vger.kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Tue, 6 Apr 2021 10:18:12 +0800
In-Reply-To: <YGq2YfURFApdJLxb@kroah.com>
References: <20210330080617.3746932-1-ikjn@chromium.org>
 <20210330160508.1.I797d214790033d0402d19ff6b47a34aff60d3062@changeid>
 <1617179455.2752.1.camel@mhfsdcap03> <YGq2YfURFApdJLxb@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 79BB5D152F61C279504AE40E61C8FA02534BFF7A22CD66A437832A019CFDCF482000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_031828_782705_2C78503D 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

On Mon, 2021-04-05 at 09:04 +0200, Greg Kroah-Hartman wrote:
> On Wed, Mar 31, 2021 at 04:30:55PM +0800, Chunfeng Yun wrote:
> > cc Yaqii Wu <Yaqii.Wu@mediatek.com>
> > 
> > I'll test it , thanks
> 
> Did you test this series and find any problems?  If not, I'll go queue
> these up...
Yes, found an issue on the start-split transaction, but not found the
root cause yet :(

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
