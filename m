Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D5DC001B0
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Aug 2023 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCy2YukGF64kPQTe01Lnw8LXAzaGR8i9XeIiDBWpfRc=; b=NENsHB5DVwiqHu583eHpTb5EGF
	/ogp2tIN9w3+fwoApbU0pvrrk06j+CIwuZQILSLEVMxGeE5QCMFwA3rnpENChbQ0eSjzMZeCm1MKh
	tmU5oEX+vbpJpHL2kaXRXIKmcr5FU51vdzIcOmhv0Umlx3RWb5zSprkCHTMr095Up7887oUaIbq+p
	5b7ZHNglL39kkU7V+duYxKlF08Tbtj6MV/7nxwHkzKIu4PXFIHOMAeR9qnk9fmSwvN/4ueUExC9Gn
	N5h8LUYHyrkokMjJAHXLOiqVumXprtL/8UpixMoEHdamvZiT9x72/Bud9Mk9KyrDu5ar6lD/tABq2
	Up0UJdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qToBH-005dpC-0R;
	Wed, 09 Aug 2023 18:45:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qToBD-005dnn-2J;
	Wed, 09 Aug 2023 18:45:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7F21615C8;
	Wed,  9 Aug 2023 18:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6C1C433C7;
	Wed,  9 Aug 2023 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1691606709;
	bh=WCy2YukGF64kPQTe01Lnw8LXAzaGR8i9XeIiDBWpfRc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=g6ef4/VtOg15xZZXwc68hTnMmjKk6ReLqWk4DxInjCR1gzA/8J4HIg6aBOaz56Gpe
	 wjfoIo7HHCCjtkftCK5v/z5oYNMrlzB4MRl04JvDSsHz6ChGUwGtK7Oo0S+rjd7c7a
	 HRaNsURG5f2KK1Ry3HqRpO+SkwRAJb/xyDKoHAyo=
Date: Wed, 9 Aug 2023 11:45:07 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jan Kara <jack@suse.cz>
Cc: Haibo Li <haibo.li@mediatek.com>, linux-kernel@vger.kernel.org,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, xiaoming.yu@mediatek.com
Subject: Re: [PATCH] mm/filemap.c:fix update prev_pos after one read request
 done
Message-Id: <20230809114507.57282ff1dd14973f3964e669@linux-foundation.org>
In-Reply-To: <20230809164446.uwxryhrfbjka2lio@quack3>
References: <20230628110220.120134-1-haibo.li@mediatek.com>
	<20230809164446.uwxryhrfbjka2lio@quack3>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_114511_826645_738AFDCC 
X-CRM114-Status: GOOD (  10.60  )
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

On Wed, 9 Aug 2023 18:44:46 +0200 Jan Kara <jack@suse.cz> wrote:

> Willy, any opinion? Andrew, can you pickup the patch if Willy doesn't
> object?

I added it to mm.git on July 2.

