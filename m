Return-Path: <SRS0=GLpI=OS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD10C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 10:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D71EF6023B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 10:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D71EF6023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IY2X9ID2jk4kniiFypXJ+B3/AhdadqC5SWbL0w9VkI=; b=05iZUDdL2WvGWt
	6GKYtPymZR5sO6qou0Aang0rwcFrkjaKVzY3kz4EMKla9b5FkQWeBgRxryiH28ScM4EIo2azSKzVt
	3l+mdaIeCwK2QXm4mtp9Z9KlQzEXV+u1OXI70lU+3Uyd8qLigclHeea8mGhZhRbL+CiR1XarZUgFv
	BRMN64e/NAQvXHeesCvJ6LzEmxbpXMi4eoabr3N6G4OMXYQ/Gh5n+4WHzrkeDQ8xchhedmYAS0r5Z
	zoz7qiRNPiS45YaYWlt1TRFS0lg3AxOiBkFrxgi6xgyFGjF3ApS4Qvs2VpBhGUaFR28/JbaIZIMdr
	Fv6+7+rb9cnoYa6WrluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV9uH-006gwj-8R; Tue, 28 Sep 2021 10:00:13 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV9u4-006grD-Sn; Tue, 28 Sep 2021 10:00:02 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3D4852FF; Tue, 28 Sep 2021 11:59:59 +0200 (CEST)
Date: Tue, 28 Sep 2021 11:59:57 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Tomasz Figa <tfiga@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] iommu/mediatek: fix out-of-range warning with clang
Message-ID: <YVLnnQ+7U/P2vA8A@8bytes.org>
References: <20210927121857.941160-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210927121857.941160-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_030001_103204_8ECE4CE8 
X-CRM114-Status: UNSURE (   9.42  )
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

On Mon, Sep 27, 2021 at 02:18:44PM +0200, Arnd Bergmann wrote:
>  drivers/iommu/mtk_iommu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
