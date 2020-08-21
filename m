Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F7CC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 01:44:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 386B6208E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 01:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cZmKUoe1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="d+PzrZd1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 386B6208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=54ZzQSuiDsyT97GEBuvtpHeoFZeM6Wdh5t/ItuKe1CE=; b=cZmKUoe1SfnooX6K9MNM/SocV
	RXOU4M6s7gbr+CcjC3beMezsQdr1Axrtcyd/9Li0GS7QxiCx3xy9jp032PcFnJpCR9hypK12aANAi
	TsZpN9OI+pm9MGwv2KLSesvu6wSQGHA7SMjjXsdpr1sBnn3KOYrFGCmdP59fSdMvhdFWciPGNwBLA
	YIfePE0gV+yeFQKcBmNlUSKJPnNiDG2021LldTeUpP37kC8cRuWU8q/MyYZikANrj8SOpBvoc42yB
	tAqvO5nTesIQd+zXHqAdyXPqITaFvZ98KuU5N/CfIwqrNUHvyfaS+a4Zu3fALuJ6jM88MY00R1Fr9
	6MTkzeqBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8w6g-00084E-Uz; Fri, 21 Aug 2020 01:44:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8w6c-00082w-N3; Fri, 21 Aug 2020 01:44:37 +0000
X-UUID: 99a6ca3dbbbd4d95b036860b5f099559-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=myVsjwfmsGiFqleY7utMNLzdKyLv2kTDb2x08UFOPCQ=; 
 b=d+PzrZd1if0v4MPLIPVPJTCzaR6PoZlzt5yEfmGQiNXZVO7Zr7bD+Cm65fG0N19zwhpAUGiToIjgmd8/8tDBjiB1FUFtITBtBQcWv/Orz+mtTlVuwDOJIhcpNhvcPazmqEIjtrp1DNke3XUNlYElB01B2BjHlOL+bsrP2AvE4vs=;
X-UUID: 99a6ca3dbbbd4d95b036860b5f099559-20200820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 786592515; Thu, 20 Aug 2020 17:44:28 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 18:44:27 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 21 Aug 2020 09:44:24 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 Aug 2020 09:44:23 +0800
Message-ID: <1597974192.21253.1.camel@mhfsdcap03>
Subject: Re: [PATCH v2 11/11] iopoll: update kerneldoc of
 read_poll_timeout_atomic()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Date: Fri, 21 Aug 2020 09:43:12 +0800
In-Reply-To: <49de5eaf-9870-522c-b1f2-037ecb122237@gmail.com>
References: <1597902349-8998-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597902349-8998-11-git-send-email-chunfeng.yun@mediatek.com>
 <49de5eaf-9870-522c-b1f2-037ecb122237@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 442D63025AC8AD7A9DE72A802969C476581D10A5A37734827091AB339203CB192000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_214434_887564_1F9C41D3 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-08-20 at 13:14 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 20.08.2020 8:45, Chunfeng Yun wrote:
> 
> > Arguments description of read_poll_timeout_atomic() if out of date,
> 
>     s/if/is/?
Will fix it, thanks

> 
> > update it.
> > 
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> [...]
> 
> MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
