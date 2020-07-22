Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA9AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:06:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C24620709
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P9UXzWba";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DxlOfR0D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C24620709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TUuORZi2fA76fSttv4Bk0JbZDnh40mv9m4rmQ9im+4I=; b=P9UXzWba1gko9kEaam7A/iWVd
	t8/j8+lHHWqM7ns1TaDLqlo4G79nLoDmC/YGEHrOdlsB03UPpFi6uHYbKfHaU5F9SbWS3mb/TLC1M
	Q1vJNbZrIZcpMZ7t/svFx6rLQLcCe4ay/zdchbYOs3Eje1RdNVJH8Ex9bMBk3BJPmKl87fQa36gWB
	WnnXiHRa0A5fbG2EBu4Gvdmh4gu4pMJZz1H0h/+dUSirgUaJSIjOw5021DP4J588Y1eFSxnmJRu7x
	gwOiuzA+BhPYdiaue/Zh1+NGycyyOYMmPAEqfvkwe6vGf4D3sppsMDJVHXLeiC3GB4WAiBH7Kx1vZ
	qaZ0NSUeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy8ps-00023S-4Z; Wed, 22 Jul 2020 07:06:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy8pp-000226-FJ; Wed, 22 Jul 2020 07:06:38 +0000
X-UUID: 197c2dac704549efaec52387b87265bf-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=08ahtnmNrBBtT3nmOzdLNlR4diPbsxUTXv6y1fIw5lQ=; 
 b=DxlOfR0DATwm7KW+V3JQs6BlXKER5IXKFJXqBncoNHqIz3zu/bnemjfSZlAg6ELgz00IirHatbbHWE+6eqs3UTgSKZgnYvCDI/IcwIC7MG3QJPum8Ue9R13sygJrxAqrj0oXgYNPNNSn71MbPzWRdQodfPqtJL6atg04iOEL2KA=;
X-UUID: 197c2dac704549efaec52387b87265bf-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 414003898; Tue, 21 Jul 2020 23:00:20 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 23:52:28 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 22 Jul 2020 14:52:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 14:52:24 +0800
Message-ID: <1595400680.23885.59.camel@mhfsdcap03>
Subject: Re: [v3 PATCH] usb: gadget: bdc: use readl_poll_timeout() to
 simplify code
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Date: Wed, 22 Jul 2020 14:51:20 +0800
In-Reply-To: <87eep5p5jz.fsf@kernel.org>
References: <1594622881-6563-1-git-send-email-chunfeng.yun@mediatek.com>
 <87eep5p5jz.fsf@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6934C1A160E6292ED1B6B2C90BF72BF7A76190B4B58533C98A2BEDF22A9AD80C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_030637_758372_43D999DB 
X-CRM114-Status: GOOD (  11.84  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-21 at 12:42 +0300, Felipe Balbi wrote:
> Hi,
> 
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> > Use readl_poll_timeout() to poll register status
> >
> > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> I had a lot of trouble to apply this patch, could you avoid base64
> encoding on the patch body next time?
Sorry for inconvenience.


I usually use Source Insight 3.5 or Vim to edit the code, sometimes use
Beyond Compare to compare patches, their default encoding is UTF-8 or
ANSI. Not sure which tool would use base64 encoding, maybe introduced
when I copy email address from Win7 with Chinese (used to receive email)
into Win10 with English (used to sent email/patch). 


Can you tell me which lines are base64 encoding in this patch?


The patch's encoding is ANSI, I'll convert it into UTF-8 and resend it,
please try it again.

> 
> Thanks
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
