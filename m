Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0E2C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 09:44:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73EC619A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 09:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73EC619A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kt+wvB9OKkGr0eyEmylP05ExM34Sv+qRujzDs1JNlug=; b=pYttRz/YAlnCnVH46DzSkypUL
	p4HRVv9dCO4Ji8aTs4PgMOaBCZaroCExf1p7aGgPlfSil9rwu18Z7Kmdj7SpPzIYfakSM81W7zdFB
	li2Dlb0xXDK5DVhHfZVyfo1oxTCzQLGoERSDwezFzs/NexxM0NJheCY2a2oeWxRyrYr6ykxT4nOzG
	43l5ii5OmBa1Pu65kc8hJ8X235w3z/uAaS9IJMthVV2iWZ9QpKfke612aSoJ6OXUhcJ29ZeGU3GJo
	IhYzNGBh+E/EQcySuUWT6EydezzJG0PO0fZgHl//RELZaIusTxCQMWW5t35y1dbmB1u4jGC15jhfA
	ZqUyLy+8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOdZn-00EV1k-8E; Tue, 23 Mar 2021 09:43:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOdZY-00EUyW-3b; Tue, 23 Mar 2021 09:43:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEB2B619B8;
 Tue, 23 Mar 2021 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616492614;
 bh=YCyCLhznKcFVXwLxds7wttaB7Svnmw1PkwCziewsozM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o2a9VUsupjNzqfsw3gmEkUo8Ktg/EgoJh4OX9VPreLt85XTrfJz6lYTReB0FZrzC7
 lKOJZbT+5z5DxcLOmteBGgfo6uFYAhx3/djEawNMAx1Q1lwR2O+shpuE77MbPONZYl
 o6jbvqKTMJnh6BciUk3m2SN0sw2K2NpZDiwKSCtg=
Date: Tue, 23 Mar 2021 10:43:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: caizhichao <tomstomsczc@163.com>
Cc: matthias.bgg@gmail.com, jirislaby@kernel.org,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 caizhichao <caizhichao@yulong.com>
Subject: Re: [PATCH] tty:serial: fix spelling typo of values
Message-ID: <YFm4Q4vej4nlg9Ab@kroah.com>
References: <20210323092846.819-1-tomstomsczc@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323092846.819-1-tomstomsczc@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_094336_727283_186A2A2C 
X-CRM114-Status: UNSURE (   6.14  )
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

On Tue, Mar 23, 2021 at 05:28:46PM +0800, caizhichao wrote:
> From: caizhichao <caizhichao@yulong.com>
> 
> vaules -> values
> 
> Signed-off-by: caizhichao <caizhichao@yulong.com>

Please use your "full" name here.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
