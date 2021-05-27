Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF71DC4707F
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA0C261059
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA0C261059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0NEv7Ob57ckRVqLJMUsX6UxFNL7LhW7HAo1U0DAOgw=; b=GlfjshESzIJMyr
	VtgS9gZBh3/9I37O5eJ+TxlhToIyrd86SojvHmVJ1IAYb69FwYbJEZ3yM5fUiHs7iej/nBp4RtLB8
	ik8xZRC4+1sboYsfKvdBtHYw9Q9EOZmBtK7IiS+c1MHmsrNpvUwjhYVZ6huYL41WO4Yxqz3cLCf1U
	4f1yJNy8Rqn40bkfDNBKqJtJllxvaj1+cZ6iN/ItZYhEQP/k1VnWe7x5DC5RTK9vB/rx9oBPaB2FY
	S+1/4W0RHzhsf3c9G4PPInbcLq9NZC7ddnLg5300qL0/wOsClynvXkZh4836Witd5k4CoCZEKmWNk
	d6VscSd3HDRcZIN08gbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmASM-003Mli-0f; Thu, 27 May 2021 07:29:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmAS3-003MdI-KY; Thu, 27 May 2021 07:29:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD59561028;
 Thu, 27 May 2021 07:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1622100547;
 bh=EtJ2JUcfUOkFr5UadD1b4YEvQnUE0JPMElirSd0F8Ww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KQTgmshGXUdT3I5R7qgkBf69No4YVt46S5yk/6UG5HRI+erSHYl8uq8gwvjG7foOK
 vOd7DuXvdcd7NmTFD+Tsgov87AE+xJhnrQVgT+HulWJV/YH27HQX6G/DbHamD3fgB8
 Hz0YSRBxc8GohxvSgi6Lo+azuYvCl/5Mktjq8QZw=
Date: Thu, 27 May 2021 09:29:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <balbi@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] usb: common: move usb_get_dr_mode() kerneldoc next
 to its definition
Message-ID: <YK9KQBKRIqZsPcyQ@kroah.com>
References: <1621933165-9661-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621933165-9661-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_002907_729422_CECA59FB 
X-CRM114-Status: UNSURE (   9.87  )
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

On Tue, May 25, 2021 at 04:59:23PM +0800, Chunfeng Yun wrote:
> Following a general rule, add the kerneldoc for a function next
> to it's definition, but not next to its declaration in a header
> file, meanwhile fix typo 'correspondig'
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/usb/common/common.c | 7 +++++++
>  include/linux/usb/otg.h     | 7 -------
>  2 files changed, 7 insertions(+), 7 deletions(-)

Does not apply to my usb-next branch :(

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
