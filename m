Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72E8C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Dec 2021 09:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=peN3PUWD5TBqeShVJWhPj1IM8lTlzuFerK2ZN24fpxA=; b=m0o6URzJAQWUQI
	B1uEPHQ0I6gZd366emqPycQ6dIU7M9Rvc1H0pf8Zme7VkanWZjqcjYdEUq0C42wfA31M3Pxiwh8Zo
	EcsM25w1cx62w36j7mpJZUJiMsq446X5yy2I0hq5cruS+qnPfK/T7WiZbncq6puIhj0R6p/EKX1hX
	mZduai0X4H9FdTwja0xeI2xkXhmASUZPTyuUexK08yPfcHqQfEaaPKLCfDp/cSGQrdjlaCOi/7Q8V
	WL6wSYg5BIFcoScF+sCJaqG30B0zixhSlPQqeoT2wAwIQlbdkQvuQ3Xtt+eSp1UGkic/Xjs96QjUj
	lpq6C5F/zt983V458Waw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1Pqn-00FPYb-Gt; Sun, 26 Dec 2021 09:29:57 +0000
Received: from slot0.jllresort.com ([62.197.136.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1Pqa-00FPUr-MV
 for linux-mediatek@lists.infradead.org; Sun, 26 Dec 2021 09:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=jllresort.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 i=ele.mon@jllresort.com; bh=0Yr7/sG7enL7tfsb0xNgFPgiUTg=;
 b=nb6t0T9PtzyIZo/nndzM9UKBc4H4L7gaIoGpnUkSCht9THLAnGjDO8FtfvRI3zxqPplxih1lrQWQ
 6BRLsqF5oh/VEQ4r1eEIEYHS2RNPOSL/pwB++1y/B0PUmhcGwRU3K2gkM6J0DU4I1NCbMLs8/BgD
 lgQLCeG31s/OwFIIRcn/UjnsGmGDig11GiymPnhE65yhpJ/DZfBjbonWzTvx+kE396zC7I68U/UF
 ZzfHHPSTHTaUhBqFvBoZinwIBTz2iYZgX186CrNOrxpJUyb+Iz7Wg9CrHpK4D6nbyLzbIKN8Mk6v
 SpvXhce2Tk/pM4CEdGrgl5yLVQt5QvNB98Lx9w==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=jllresort.com;
 b=xstkUrPZx/M6XDKhvDL5DaZqCxxJRfgk/H9Vp7WMrkT3k3pAsfe0yY9OJ87OHiKwu+R9pBlJnTD+
 s6GnAxijRJTygr415SSQknsrV6RgqzwxP35yyfc77JqVOfH8ZIt4XNkWvERP/P59t53pN5Pobiwh
 VXVFTdQTP17iaaD4SsCfoT1Au7SxaZAQs2iPEdkDS6gC7gupDXgFkqjhLmoqw/0bcI16PHiImoL3
 jpo3UYGIad5V8i2BHX00cHxVieEWCb57noY8M8TTS7v+nZrdyfsJ+GzuJXrEKBoeYQ+Q0GrgHi/y
 1uWade9pY9fg8lBVH9LZCU9EOkDU7nXHAWoDKQ==;
From: ele.mon@jllresort.com
To: linux-mediatek@lists.infradead.org
Subject: Happy Weekend:
Date: 26 Dec 2021 10:29:26 +0100
Message-ID: <20211226102855.B831CBF1773ACA5E@jllresort.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_012944_910883_314AF57F 
X-CRM114-Status: UNSURE (  -1.09  )
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
Reply-To: mustafa.ayvaz@ayvazburosu.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Greetings to you linux-mediatek,

I was wondering if you got my previous email? I have been trying 
to reach you by email linux-mediatek@lists.infradead.org, kindly 
get back to me swiftly, it is very important and urgent.

Thanks
Mustafa Ayvaz
Email: mustafa.ayvaz@ayvazburosu.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
