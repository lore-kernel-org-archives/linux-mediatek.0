Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qlA3KX9WoOpmQUYb4tCi0Yni1vSIYvNGItlMtQiPHs=; b=4OZKdUT6tDQJ9i
	txiYUhzzbLYDULI7BMifZqFqSF1HW0paCpKRNQ+L7Sure+CEaF3dUjE/tz3Hkm0xO3mg+l5p6psP/
	B7InvvlGDoKgo1FcwUxW0lsQ4AVG702Io5PTvLzUBFvW2XEnLMW7EFN1r5p617jwG4DRHivFEegx+
	KNPaZAw8KZ7mP8N0Hg4s8wsUSAZTg89StFAMoq4kBh6CmQcNzv4E2n4T38g7RxRrZiKUqDtaCg6Fz
	rY+aiHe9LtOf+f58AMooMvx26zFmmrlBa4yDz8uDK2LuMnj+PnxHkquWl/rHdlXpfdLE7YQWSSiZv
	lKnqa2fC0OLeSaHJVKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzc05-007cJY-8a; Fri, 10 Jun 2022 10:36:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbzu-007cIE-P9; Fri, 10 Jun 2022 10:36:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BAB726601739;
	Fri, 10 Jun 2022 11:36:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654857369;
	bh=f5a+MYhGnP4KyJ5AO/ArrESCaa3tE2Fm/8PB6l2aQAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YqvofSFSy5+oFQgFvIszQd0Dwa+XnzDwzzDx1GVY7cR1A+jZY79cnnvJ4Au8MfN3w
	 Zw9kPdWStMAJNlyU32/zlsbbB8jgVcoih8Mh6xuZJIuM7thwBitSC8xvkrMeZTLedN
	 PxQfaVupLpyyXkEHuUd8QsQYiZPFnZW0qYyLsdZrAsQWKGI/c8BQrZYO2Eus/PNk80
	 MJImM6w0W/ePP3liAfR3x/cwaKaB8Rhg/uilC31Hr8dR2bextU/FLvqwEHP3jBGKgy
	 9RnBi32OF2uecP5kYS1yflQDs5SJ9zpL5RJQeiA1Xh5S0oxFoTyIeTmGsrqYSgpC2T
	 dl7xDJnTdxlGg==
Message-ID: <956c7a9d-5f1b-e552-60d6-acc082732b3a@collabora.com>
Date: Fri, 10 Jun 2022 12:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/3] usb: mtu3: register mtu3_irq by threaded irq
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20220609074233.15532-1-chunfeng.yun@mediatek.com>
 <20220609074233.15532-3-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220609074233.15532-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_033610_988854_6B11288D 
X-CRM114-Status: UNSURE (   6.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/06/22 09:42, Chunfeng Yun ha scritto:
> Use threaded irq to improve time consuming top-half
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
