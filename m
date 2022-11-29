Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90D4C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pApn4qCCRR4myxRZicgNT3gB5Un11uVMzKMNfa1etJs=; b=i6gFepavv3T6hiVlk10YNykD9Y
	TZUrkgN9pYNShFW3hFyOtUm8L45kzOM0Zic+2gpdxz+9fkznPK+WnAWO0aB6B2+AdnGXEdbli8V9j
	Xy3sIXZCbBfSRqk8G6nHF+2NxA/7LtLQGluksrHhcWm9o6qXcV66naZ+7cyKpSYJ6cLAgMObrUvBo
	boTbHAxLDb3fT1ZAdPnr7e+K2BY2zOB4uikhXMb9dC17elp35+CEz85tZ7jFY9Tpyqfh8zOa8X5tD
	eFbrOpdfzLgMu0f2W1lnpWUq+66XIJQ7DwBgnI7paTobarjgd4zqJDGydKOPe2DR/tJVIIDSFqQPU
	RMHhefBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p022M-009UsP-2D; Tue, 29 Nov 2022 14:56:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0228-009UmS-2K; Tue, 29 Nov 2022 14:56:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 657C1B8167C;
	Tue, 29 Nov 2022 14:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55648C433C1;
	Tue, 29 Nov 2022 14:56:24 +0000 (UTC)
Date: Tue, 29 Nov 2022 09:56:20 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Andrew Yang <andrew.yang@mediatek.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Casper Li <casper.li@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mm/writeback: fix dereferencing NULL mapping->host
Message-ID: <20221129095620.4c1a8056@gandalf.local.home>
In-Reply-To: <20221129033304.4465-1-andrew.yang@mediatek.com>
References: <20221129033304.4465-1-andrew.yang@mediatek.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_065628_313167_CCD72118 
X-CRM114-Status: GOOD (  17.49  )
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

On Tue, 29 Nov 2022 11:32:59 +0800
Andrew Yang <andrew.yang@mediatek.com> wrote:

> From: "andrew.yang" <andrew.yang@mediatek.com>
> 
> Check before dereferencing mapping->host
> 
> Signed-off-by: andrew.yang <andrew.yang@mediatek.com>
> ---
>  include/trace/events/writeback.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/trace/events/writeback.h b/include/trace/events/writeback.h
> index 86b2a82da546..56f6e114d3ed 100644
> --- a/include/trace/events/writeback.h
> +++ b/include/trace/events/writeback.h
> @@ -68,7 +68,7 @@ DECLARE_EVENT_CLASS(writeback_folio_template,
>  		strscpy_pad(__entry->name,
>  			    bdi_dev_name(mapping ? inode_to_bdi(mapping->host) :
>  					 NULL), 32);
> -		__entry->ino = mapping ? mapping->host->i_ino : 0;
> +		__entry->ino = mapping && mapping->host ? mapping->host->i_ino : 0;

I hate remembering precedence. Can we add parenthesis around this to be
clear?

		__entry->ino = (mapping && mapping->host) ? mapping->host->i_ino : 0;

Thanks,

-- Steve


>  		__entry->index = folio->index;
>  	),
>  


