Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14A8C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQZg55qu2F9V8NoJDkMl02bI2QdwVXx9CTP4q5EH3oA=; b=L7dPbv2YgUeO5O
	7U648YEryu3PsDCyDGv//KSo9xvYnDU5wdI+hjV/G6DoXiQmTAwQFfkerTxdA4g6/IlkNCTEQYqjv
	xa8IWb4vcpec6hzxsBvfPJGKmcWWKohcUETI/KJghIjiVubOyaKYfq1mtctCdZjF7e9TEpPJuKy5v
	xL7qPlQ8h+HgynMZIagOCzUgWD+nxaZDEWQ/H/l9hhff2ZkP6N+RMuPUcEChJt0woWUbfENCV4JXj
	mSZudl5tzkFmMzu1VuJ5bgRvg11sk9HeYSMJ3kn9E/80PzfQWzqIM5PFn0r5iiQ4Jc0JCqWhDbiTm
	rH0/P0TUjP7Z9KvBoMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnHy-00C2HI-Bj; Thu, 17 Feb 2022 20:22:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnHB-00C1nE-GG; Thu, 17 Feb 2022 20:21:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A79A61D7D;
 Thu, 17 Feb 2022 20:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEE0C340EB;
 Thu, 17 Feb 2022 20:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129276;
 bh=aiOobr5lBz8A7yIKfHbKbUXZbVSHRX4MX9DlxRPLcGo=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=LlvM0hb5v4xqj0rKiwafwhzy7MevFh0RHetWovm1b5pGRNpt7p23KxrmvDnpwD55y
 Hmlm+ATkQzFRkvRHaUvQ51AW0hwiv+eR63EWxW5sUB0g8v+Z7WI2G8O+ZxtbK18hyf
 SaxQ6GDmEOvRpCq1znpoXcNHlyhBOT8VVZ89FNL9rJ04hmqlDGyJFZwgMFM70GrAiD
 +A39Encl/0IJ3F8ByK+HBxBZ+flevx8Hl1PgB9pqXqByxGFGI7G5CEvTbUmbOeilOU
 r/GiIhUBeq0zr1h1tzG6Ts44MsOTU9NlKjsPi3M2ehfQWTrmqtGiRv8opeesb5X++U
 4U1pVoXB+E+2A==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-6-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-6-wenst@chromium.org>
Subject: Re: [PATCH v3 05/31] clk: mediatek: gate: Clean up included headers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:21:14 -0800
User-Agent: alot/0.10
Message-Id: <20220217202116.5EEE0C340EB@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122117_616902_7C00FBDE 
X-CRM114-Status: GOOD (  10.21  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:08)
> Some included headers aren't actually used anywhere, while other headers
> with the declaration of functions and structures aren't directly
> included.
> 
> Get rid of the unused ones, and add the ones that should be included
> directly.
> 
> On the header side, replace headers that are included purely for data
> structure definitions with forward declarations. This decreases the
> amount of preprocessing and compilation effort required for each
> inclusion.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
