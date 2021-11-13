Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A1EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 14:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2EF960F51
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 14:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2EF960F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDmsg3rNZEL3uMBbhrYv3KUrPr4XZrLSy7/NGmQCyag=; b=iJv/vah3o6LLPK
	aK/WciiTzYZ2Kq9+QSO6y/jqWZvVSTad52jwWaPo8MyvUfN4pL1oU+ITy8Essz+4EGfH7i29pygdH
	bY6vsIA1Y1/GkbqYTm50TF4/RkMpCC1Cuxmm+3D0ULDIa6zwA2uNiHBlUkAn5dAqgOA0HZXY3gQka
	91CG26YXgFGzf3hSl0ROvPYIDs5AVmmbiKtoeeXBO0H8/q/bB1fRyWPqwhFF4f9sdwdPbOQgg9e21
	DfpwwhLrIIVaEsnS0wX5nXCnr1SpXVypWlbzpX4Km5120ypl8Fymv1YR/fz7bRCVqGAA66seeAdWc
	0ClQcsQDIRYLLxR8u44w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mltkf-00CkDd-6B; Sat, 13 Nov 2021 14:11:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mltkS-00CkCX-Ri; Sat, 13 Nov 2021 14:11:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C153460F51;
 Sat, 13 Nov 2021 14:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636812676;
 bh=t9CShlrauEAsztx26mv4Lvg2o8CuZu2WW6wTb8AXz3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D6coJK3qOSEpAJVLfCmIWRKcIws9pFpiWpIc46Kb16AnBUH7uUcyXodHlykJXvyJC
 8T2egcJDjF+uPOzkQlLBgkv9yzw5dWN/JXW0pdNHNBhYL3Tmwkx1hJhOq30cDVaKs1
 68Im7ohvYMj/h5aZ4wOrwjJbqdi2m4aQqNpOwWJ4=
Date: Sat, 13 Nov 2021 15:11:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Junqi <liujunqi@pku.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: mt7621-dma: reindent to avoid '(' at the end
 of line
Message-ID: <YY/HgcL/iF09sNcQ@kroah.com>
References: <20211113135952.365607-1-liujunqi@pku.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211113135952.365607-1-liujunqi@pku.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_061116_954313_8949EA94 
X-CRM114-Status: GOOD (  12.93  )
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

On Sat, Nov 13, 2021 at 09:59:52PM +0800, Liu Junqi wrote:
> A change to make the code more like typical coding style.
> 
> Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
> ---
> I'm a kernel newbie and it's my first time to send a patch following the "Write and Submit your first Linux kernel Patch" video on youtube.
> The first version was rejected because of putting a '*' at the beginning of a line, and this version is exactly what Joe Perches advised in the reply to the original patch email.
> Please let me know if I got anything wrong ^_^

Take a look at the link that my patch-bot told youto read.  It will show
you how to write a "this changed in this version" type of text below the
--- line.

Please do that and try again.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
