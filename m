Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBB4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0S+QRzFQvwZ5J/GohC9TGGDLgx4zvXHJaFl7fEJfag=; b=oSP+jqIPcm0cZjIgzEFlX0qQBy
	+afeQK2oNsuRI4GvpA9/mlUmaorrPAdZE1zQQ6A+RSgcqqSsLVNM43JSdQsCLtX69NjPCdOqF4FqI
	iVzzlP/F0wsmmwX9Oq8ZaEXCs7j9Oc8gwQpV1N9iH9/MSy55/+VohDIZRcfkQE9hW+iJPEJL6Vatb
	CloOEdXPFq813tX7rrrOWEUS+XKhqufwsMvtige8o9rK9DIq8Y09kDSin/jbMQTVPJdkv/wIQwrBW
	S53HXTrd86sZKoOa0bPHfkfskAUVWqjeyDjwOxpeQqbQueZll0gqocTfQZtBiSGTCD9Foy665vsio
	deAxW2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzZ9-00F3Uk-6R; Thu, 14 Jul 2022 14:11:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzYp-00F3IS-9W; Thu, 14 Jul 2022 14:11:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C97DA608CD;
	Thu, 14 Jul 2022 14:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6715C34114;
	Thu, 14 Jul 2022 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657807882;
	bh=oV0HfPV+oLBFC/7w2dJ1yBuUozJRizaEnJ7X4QOFYhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlTUGnwAa8QoDjs/0dDvNQV8Fm2WdAVyjQZJCdExvH2URmOytLrt0PpN4Rw67/p5O
	 kUTbSxeF1yRVWcyvZL8ul4a84Zy4db4kU4jAnyUZOMXjyo9JLSoMUSmrLNaSJ2YV7p
	 2KGp33OzSEsoyKvBvRHv3oP5qWduAF2nmwMx8rG4=
Date: Thu, 14 Jul 2022 15:45:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 08/13 v2] USB: mtu3: tracing: Use the new __vstring()
 helper
Message-ID: <YtAd7DUt2V4vYrYm@kroah.com>
References: <20220705224453.120955146@goodmis.org>
 <20220705224750.354926535@goodmis.org>
 <20220714093857.1135e95a@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714093857.1135e95a@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_071123_399042_210AC6AF 
X-CRM114-Status: GOOD (  14.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 14, 2022 at 09:38:57AM -0400, Steven Rostedt wrote:
> >From d6485fe54bd4f04256a8500156a7c05cb3fb9592 Mon Sep 17 00:00:00 2001
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> Date: Tue, 5 Jul 2022 18:45:01 -0400
> Subject: [PATCH] USB: mtu3: tracing: Use the new __vstring() helper
> 
> Instead of open coding a __dynamic_array() with a fixed length (which
> defeats the purpose of the dynamic array in the first place). Use the new
> __vstring() helper that will use a va_list and only write enough of the
> string into the ring buffer that is needed.
> 
> Link: https://lkml.kernel.org/r/20220705224750.354926535@goodmis.org
> 
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
> 
> Changes since v1: remove ',' that fails the build.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


