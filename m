Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A26C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 00:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3f0SW39BcDbEuWdJoRWFN6DKTQvhq2BzdCv7B3PYNE0=; b=q0ePQoCTpnGXQO
	LEE69ETEKFIu2EVuq2bkZDrjNpuR+442TFtSHOyRB25+UGvNErZ668xJ6GeMl/47XfEHQAkKD+CHR
	QsIdMt5aKk9WNSnjtoclqI9oCMw3k+vzKYBCM5dBD4BItRmdbP++gOOuZCKkBtU5PzzAlAS5LzF+R
	rZLUdNXAfID5H0hvdUYjHWHxhG8I+2cby9iU9UweZQP991gRCLFVxf58sc29kgE4I18iX6sbmYgqK
	ZELjmIiA/HjBs9LO1hf0aYuXDkFguTkaPxggyoDqvUizxqmTPexhd360F6oorl+mt/wwvWI79UNPY
	b8B5Zhb37i2xjYkSI+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCA8R-005tt3-Kl; Tue, 25 Jan 2022 00:56:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCA82-005tlK-Ll; Tue, 25 Jan 2022 00:56:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A36DBB81229;
 Tue, 25 Jan 2022 00:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFBAC340E4;
 Tue, 25 Jan 2022 00:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643072167;
 bh=HGL+ZuBOHbR5QhIj3i8dJ+BOoFj7BWUdJb5AT3Nbmgk=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=G98934XM7FvuZKrSQlupbv5mzhDZPcGmLNSpyGKYSZxmQtJnSKTtbY6YPfaj8tFAS
 1r0R9d2QOtNocB1Z0Z7O5dRWt+X5inWR1jTVZXBqHatYd9RM4SlydSVXtTaATBCzmB
 G0+K5JxsLUw+eF0NFvBKn+tJ7OLvYgD8BPfGBWfNkJ9y+jcV9VYm8gnYEeG/5ofgId
 Uvkr6447UGI8cuDFB5WvupF+adnZweJxTX/atXz17zOY8Yi2O+9alFIiJmc6oN8YCq
 kxV6oB5nXOzw+y8B2sejSJKKq9kQCVQ137pI4h1QzcO42Fa7ZT+rdHc+F7zzALfMIY
 JJdCofjxz4JxQ==
MIME-Version: 1.0
In-Reply-To: <20220124052038.6242-1-miles.chen@mediatek.com>
References: <20220117090030.13064-1-miles.chen@mediatek.com>
 <20220124052038.6242-1-miles.chen@mediatek.com>
Subject: Re: [PATCH] clk: mediatek: add unregister logic to
 mtk_clk_simple_probe error path
From: Stephen Boyd <sboyd@kernel.org>
Cc: chun-jie.chen@mediatek.com, ikjn@chromium.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, mturquette@baylibre.com, weiyi.lu@mediatek.com
To: Miles Chen <miles.chen@mediatek.com>
Date: Mon, 24 Jan 2022 16:56:05 -0800
User-Agent: alot/0.10
Message-Id: <20220125005607.5BFBAC340E4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_165610_914147_3813E9CE 
X-CRM114-Status: UNSURE (   9.26  )
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

Quoting Miles Chen (2022-01-23 21:20:38)
> Hi Stephen,
> 
> > Stephen pointed out that there is no unregister logic in
> > mtk_clk_simple_probe() error path [1].
> > Fix it by adding unregister logic to mtk_clk_simple_probe().
> 
> Chen-Yu's work [1] already addresses this problem. So please ignore
> this patch.

Alright. Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
