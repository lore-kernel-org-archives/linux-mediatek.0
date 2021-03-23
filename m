Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B332C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 10:34:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B041619B7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 10:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B041619B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h87azTyIpTlAQuMwL277NU5Z+wkhThZ9FPXowQtEvzs=; b=R+MjwJMxc4IrcUTMuC3YR6096
	lg7RHSwjTjgHDbsaVbpZ7klerGwAbLIo9kW8O/C6xAdjagRiCehRSdh6LEZTPg6YWvD1iA4Y32+P8
	s+961dtupWj6lWSNkiovuKk2g8Z/gq0g/UjtEl1F42aO9wPWlmmqYf8ZrAYUnD4hRLmZkvOM/J+hg
	Cp4tRIQNaNsKhpPpY9FrBp51+GlHUjc+eZYl2/YFcD3IvqOkJYv+vkkrseZUM25AVu99mvDpp/HoX
	OsZqJeKpwYvkVdC3NZh5N0snp0g57+iYZCKulh5YlnDZL0wN/fLsQ4Qx/fazvLQYAhKncEx12JW7+
	LazknSfgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOeM9-00Ecsv-33; Tue, 23 Mar 2021 10:33:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOeLx-00EcqQ-Sr; Tue, 23 Mar 2021 10:33:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08CCA60C3E;
 Tue, 23 Mar 2021 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616495615;
 bh=Sl+Ct1QgMB9NjlBuAueKeUHN451/+jE3cb62MlWU48s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TWS0/lWBKJgcxO4/hpRX9x2ra4uTeGjfro9YRA4Sj2Yr7RAn6AB239mQCJqMQ1d4V
 L8V0Ad91CIO6NpIY32+IWNVKfMrg0sRRpxQtFWyEx2g20FOwaalQX+S77DG1C6MNAV
 hlekcprjg9h2W5SzIe75Cr/wTpBlRfFmrEx0RJno=
Date: Tue, 23 Mar 2021 11:33:32 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: caizhichao <tomstomsczc@163.com>
Cc: matthias.bgg@gmail.com, jirislaby@kernel.org,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 zhichao Cai <caizhichao@yulong.com>
Subject: Re: [PATCH resend]  tty:serial: fix spelling typo of values
Message-ID: <YFnD/EhzcHg1TWH6@kroah.com>
References: <20210323102556.1136-1-tomstomsczc@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323102556.1136-1-tomstomsczc@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_103338_282032_5B584CFC 
X-CRM114-Status: UNSURE (   9.15  )
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

On Tue, Mar 23, 2021 at 06:25:56PM +0800, caizhichao wrote:
> From: zhichao Cai <caizhichao@yulong.com>
> 
> vaules -> values
> 
> Signed-off-by: zhichao Cai <caizhichao@yulong.com>

Please capitalize your name.

> ---
>  drivers/tty/serial/8250/8250_mtk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What changed from the first version?

Please always list that below the -- line.

v3?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
