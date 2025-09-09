Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255BBCA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 06:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ctlRA2i6anPwTb1Lpq1ckuR1ieUigIdEqpTs08/aoY=; b=m7SZPUMNTsUWkPOMlyrGtAK0ou
	dGdQpn+X4/p2nipul5E0h3ks55SlJKb1pDkLp8JsEKx1ldDmo/j25Jv8OLJhJegnvzZNRzQL0guU7
	8Q9mfIKzzwHikgW7OCnuacUp3TZe7KyQM0bWmczRs3WME3VCaqlJgsq8P7p9DJONn1CC1Jy+DRsH7
	vUhwxDf5NllJ2lOuKbvbmzChaRa0Zj4lcFesm0c3dL8k+/ybbs1l9Ha2CKIZcj26J871H/TD5UIpZ
	MCpSB2aT/Gqv3a+HigKpENRvQPGg0jKObsaXSFf0+mj2YkVuTXQghvBcVlV8HxXH4/X4fmpjZl6bZ
	RfKjtRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsEo-00000004tC0-2PkZ;
	Tue, 09 Sep 2025 06:53:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvm5L-00000003CWr-2hu9;
	Tue, 09 Sep 2025 00:19:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B599960140;
	Tue,  9 Sep 2025 00:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D2CC4CEF1;
	Tue,  9 Sep 2025 00:19:46 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 3AEE318081B; Tue, 09 Sep 2025 02:19:44 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <2280ca741ef36fe9ed26b8079b91a8e5dfd669fc.1757360105.git.christophe.jaillet@wanadoo.fr>
References: <2280ca741ef36fe9ed26b8079b91a8e5dfd669fc.1757360105.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] power: supply: Use devm_mutex_init()
Message-Id: <175737718422.13878.10547263868458184966.b4-ty@collabora.com>
Date: Tue, 09 Sep 2025 02:19:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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


On Mon, 08 Sep 2025 21:35:28 +0200, Christophe JAILLET wrote:
> Use devm_mutex_init() instead of hand-writing it.
> 
> This saves some LoC, improves readability and saves some space in the
> generated .o file.
> 
> As an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   35803	   9352	    384	  45539	   b1e3	drivers/power/supply/rt9467-charger.o
> 
> [...]

Applied, thanks!

[1/1] power: supply: Use devm_mutex_init()
      commit: 7d715345a86941b9e6c8e520b40078692baed4a4

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


