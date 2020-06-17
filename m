Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8C5C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 05:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FEAF2082F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 05:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l3wVlGro";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YErZksz0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FEAF2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rerd0FsdG5+/F9PzOmkHxOsqC1ZIgNYjXuw9eUC4IRA=; b=l3wVlGrogZqf+2
	7KzjYl3hUv50sYabkS+3kvBP7OpRtt1TssXfqR6O45NYVEOz0AdHK8/oyRZUQCkhiM3u1foDUFUCF
	lSLQPY6El7ks+Pqhkz0OSz+ULNwgw3DdyXr6v5SFfVfiBD77eD6C5kx5Mt1DdqJbsdiRSVG0PvPWR
	jP0Vbbaew+VsFKUYBCBAZjxBExSgy/yBzr6PKuhRq/2sM4VFFx1kPQrosN847OzrAe3OSE4wLbDmS
	5huli89eP9nJbEOhWDjWsYY7cGAzt0gL2IAC/d5nncf8yjncsAy4T/J7igTfJf27iEr1C/b87sqhG
	WKM28PfrJXSxDKAFl4Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlQPI-0005Eo-12; Wed, 17 Jun 2020 05:14:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlQP9-00058H-NA; Wed, 17 Jun 2020 05:14:32 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 106092082F;
 Wed, 17 Jun 2020 05:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592370870;
 bh=4RC/DvxLHx87nlYMECwxb5uBAMKIO7v3A/WfAL5PBCs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YErZksz0VYampTxWJdKuowSC+ReHO1RudkP9FrchHYS6Yh9N3LGVdZvflUqj8fNVz
 Koo7nEAU92bNrPGW3HRg+wuttpu8rfAwIkXXN2tgFNO1ZoNezk+eUfGYXqKeaSpett
 ezmBuDCFceFPfl5n9MgqcOj6K4hXh5r3k9hkXwXw=
Date: Wed, 17 Jun 2020 07:14:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v2] usb: gadget: u_serial: improve performance for large
 data
Message-ID: <20200617051422.GA1331778@kroah.com>
References: <1592310884-4307-1-git-send-email-macpaul.lin@mediatek.com>
 <1592362007-7120-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592362007-7120-1-git-send-email-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_221431_775688_784852BC 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Sergey Organov <sorganov@gmail.com>,
 Macpaul Lin <macpaul.lin@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 17, 2020 at 10:46:47AM +0800, Macpaul Lin wrote:
> Nowadays some embedded systems use VCOM to transfer large log and data.
> Take LTE MODEM as an example, during the long debugging stage, large
> log and data were transfer through VCOM when doing field try or in
> operator's lab. Here we suggest slightly increase the transfer buffer
> in u_serial.c for performance improving.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/usb/gadget/function/u_serial.c |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

What changed from v1?  Always put that below the --- line as the
documentation asks for.

v3?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
