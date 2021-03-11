Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4267CC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 01:51:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4299E64D99
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 01:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4299E64D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JpumK4vCvZdIX8EN9jgkjAc4dFeVCqkuZuiaDUHw6oQ=; b=H+FArWQqUtuE5HQVSi+QmXWAg
	9ziUqj9UBx461JqbwtasQEwUPs/DwXlNMZfqLLjmX15lhZ9nyEd7nXiLnS8WV+JrAi4DE5QmP0N33
	GS2Xq6iXW1vY4xD/cSBMqvLaklmlMj5cJ/4bnlaLd5a+lc+xgLJGInCF+rkCWw7Gbbb0GTf1PowZ4
	x83rT+cfGelNkI9ay999v0MkjFCYhyL9Q3pQ+1ZtyKt9r8XMqEPaKB0DIlZ/fd0+QcBjE3fSppgTq
	7EPyAB0YVtVvQWZnsWmOcQsUjZJBMX9yDWQfGPKhaR1pcwTvHrVNEAkZB5uiE8MBSsVTS/RHZ6KCR
	RLXmoCY0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKAU0-008D9r-CU; Thu, 11 Mar 2021 01:51:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKATu-008D9P-V0; Thu, 11 Mar 2021 01:51:22 +0000
X-UUID: b8408823b7534f9bb6d7da2265ef68b9-20210310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MyXaycwMY+zGNWOh2kpZh2m5IO5LDfniUPRstEyFC2o=; 
 b=nxQwklIMmZ14ITRW+pt5xNSsAI9r1soTlXxLzsJM6J+UdqatiBUVGzdz9M9vUhTy4DQ/thad6tuzVj1PxQrOYMDDvG7Ov70sJxbd7JvMM5MsUTk8UL6dDDLYjSeB0DsWLUDH2kL2/ZUn5NSbFmi6EAoF/2IfJ3z/4rTWfl2aJZc=;
X-UUID: b8408823b7534f9bb6d7da2265ef68b9-20210310
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1213639775; Wed, 10 Mar 2021 17:51:12 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 17:51:11 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 11 Mar 2021 09:51:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 11 Mar 2021 09:51:08 +0800
Message-ID: <1615427467.26498.6.camel@mhfsdcap03>
Subject: Re: [PATCH v4 01/12] dt-bindings: usb: fix yamllint check warning
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
Date: Thu, 11 Mar 2021 09:51:07 +0800
In-Reply-To: <YEiJS0fPCOPOdlIq@kroah.com>
References: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
 <20210310022811.GA1612587@robh.at.kernel.org>
 <1615346469.26498.1.camel@mhfsdcap03> <YEiJS0fPCOPOdlIq@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 70009717DE06A89F05E205A0054F956C3D78377B9B4219CCCC6C498156C87FC12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_015119_518227_6B2AB529 
X-CRM114-Status: GOOD (  14.05  )
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

On Wed, 2021-03-10 at 09:54 +0100, Greg Kroah-Hartman wrote:
> On Wed, Mar 10, 2021 at 11:21:09AM +0800, Chunfeng Yun wrote:
> > On Tue, 2021-03-09 at 19:28 -0700, Rob Herring wrote:
> > > On Mon, Mar 08, 2021 at 01:37:34PM +0800, Chunfeng Yun wrote:
> > > > Fix warning: "missing starting space in comment"
> > > 
> > > What tree is this in because I don't see it.
> > The patch is based kernel 5.12-rc1, also happens on
> > git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
> 
> My branches are now rebased to not be on 5.12-rc1 because of the
> problems with it, so please refresh and provide a "Fixes: " tag in your
> updated patch.
Still reproduced on 5.12-rc2

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
