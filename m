Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A54C00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhrZMIVTpic+K177V+uLGoUSTrTQtBRabrXfgw2TSso=; b=nq2TPt50oNCcwe+YlIUS/LGVUw
	7BkRq9R5ulfJKtp0fN6P2d/lMEbE2Mng4tlghhX4ib5uM0Fe5cbBUlicI8ezUyUYgicMriww8e7pQ
	KanEr5qOEDunMzyAKh7SPQGb4VT9HjdpE1HMhFjGkkC+EhksP0KA2ED/1SCl2sfbItPJL6dqyQ2hi
	wW9cFU3nGb67ee57YqOojPsnPJct5FT+LO68C9W0pe+jlEm1g/peY+X/9unPy4KvgWUnzFohXGb4+
	6rF4853O4qyBk/Gday3g/ajFT7k0d2JYCB9Thj2lmEcMHXQZlcQ+u5e9tIytaMKBPHnZGoYFrzSue
	gQhSoLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGNXv-0012Dv-CP; Tue, 26 Jul 2022 16:36:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGNXg-00126W-RG; Tue, 26 Jul 2022 16:36:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 899C2B8188C;
	Tue, 26 Jul 2022 16:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C281AC433C1;
	Tue, 26 Jul 2022 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658853377;
	bh=ble3zRDYs/yITk8HA/1pQokt6KnZTLpU07UlEohD6WI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agTB7w/4rgu9pBobWKtUapMo9JBItfgWY/4f0gZVgL4KUFH7SQ/8mDIWSGd+qojE6
	 EejuKRagYWctkrt0cddg9nPrE+QPp+YWPGMQXwtF2ZIva4jCjgErOLBPmRnJJNtoEA
	 gmxDDuq1a2JWWHeuPxXrD35Jsclog4rG7q5bAK5/x9ww6eWbK0BwJPNUVciznbwZS1
	 l6JI250Vb+ZqMU9Uct6FeRmGiHwWCslvvIwdGIYMYeYC8lPHESeS2jwDvnaH+dJRuN
	 IZZiyDLQyrpy1sMGUiltK9Zv8nmqPbvWjlu6wcGzf/ySiBFktjJutwusNV8GOZLUbf
	 rVmjIBUUM+Lnw==
Date: Tue, 26 Jul 2022 22:06:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Slark Xiao <slark_xiao@163.com>
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: mediatek: mtk-hsdma: Fix typo 'the the' in
 comment
Message-ID: <YuAX/eR78JdSRCzS@matsya>
References: <20220721055647.46085-1-slark_xiao@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721055647.46085-1-slark_xiao@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_093621_069500_414B209A 
X-CRM114-Status: UNSURE (   7.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 21-07-22, 13:56, Slark Xiao wrote:
> Replace 'the the' with 'the' in the comment.

Applied, thanks

-- 
~Vinod

