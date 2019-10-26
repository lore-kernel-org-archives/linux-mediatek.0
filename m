Return-Path: <SRS0=+r2U=YT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002B1CA9EB9
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Oct 2019 19:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4D9D20679
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Oct 2019 19:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qh87lG+T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hi2r2tM6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4D9D20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5WAdqB84tVEn0MJWIhkZRuPITIyrm7f480eSDsPKLI=; b=qh87lG+Tee5JIf
	L57V3KpzK64xNTPVCYbQTbixLGHlX06h7oqTGiT5lMGC8Ucane8Vi6k38XFJLsC41d9FtFmShXoCS
	yw3PtPtrgN1rcrezf0FOtvgPFTCxsR9XmeahBfoyHz/2zJ9aoJN0fDz0U8WuzdEUQcQsYfM0kLw3f
	oMbH7cBDTBpETgvCvA5Yjp8EXrWrSr++Ay4fx2B9rmVbVZdJxo52I9tUUJ6n9x5gaHmURGaYRibg0
	qYO0esbwr5yWwfKJ5VlHMRgrig+LAi0WeCNSbszw3DA4cYWuiQRy1eJwFJIx5ZYtcowlgqDxRjB3a
	OPcc3Yh1YW7H0H55UqLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iORll-000177-H9; Sat, 26 Oct 2019 19:30:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iORlW-0000zL-Ra; Sat, 26 Oct 2019 19:30:24 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9081D20863;
 Sat, 26 Oct 2019 19:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572118221;
 bh=1vWJNlJ9nmxdq2/TYTJ8H4g9od0RudmBwjhdidF/U3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hi2r2tM6TywiRAJPIiqblSIrVQlGBlYTNlHn/wq31sE5yhsBzHjW7cjrmAnMCq5AX
 amDA7DsHIXtCXm0xWGwyuIDNV/ta6Tivu3T9wVbhYe7ou371SsYBOGPq0tR7qgzHM6
 paQ0mVgIjrcv6ecZPQNeoZaEYDzKQRQIoq55wABA=
Date: Sat, 26 Oct 2019 21:30:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: your mail
Message-ID: <20191026193018.GA812200@kroah.com>
References: <20191026192359.27687-1-frank-w@public-files.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191026192359.27687-1-frank-w@public-files.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191026_123022_925685_3D657AAC 
X-CRM114-Status: UNSURE (   6.24  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 26, 2019 at 09:23:59PM +0200, Frank Wunderlich wrote:
> Date: Sat, 26 Oct 2019 20:53:28 +0200
> Subject: [PATCH] serial: 8250-mtk: Ask for IRQ-count before request one

Odd email with no subject line :(

Plaese fix up and resend.

thanks,

greg k-h-

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
