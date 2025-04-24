Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09714C369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfTMyxnIB01quA/V2nunnWHVUVFti2y/BX9X/pdrGWY=; b=KbDMWV1pbvcUG10LP1xO8ZZjAa
	rxCADtwF/5WE04a/VwRpcppkwPlsH/+oJlb7Hynjn+eN2TYqjM1WUS16L0DPlQ6m6Qf8kFJ5P9i6Q
	v2bg7BbeAmFc3drVtUywyAJR4uXYegf5PEvvgYv6oSV33V0tAq8qX1n6t8Elk7V1mF67auJ54Q07E
	LsNxA6oNBBhNMEcePOqr3vjvmc4cjoRbp1LP4++uZR+HQatuI81KgBibqzo4nFDTiN8iGExJW7NdE
	C3bA3e9i1xzw/9FXYXovlEPJ9x+ug6Ht2QJQLoBwkPg3azF1vaNTQVqUnZ36sFkE0DzHFbu7tKSEq
	QxhSofkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uQQ-0000000Dngz-07vy;
	Thu, 24 Apr 2025 11:07:26 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sh3-0000000DTMI-2xJH;
	Thu, 24 Apr 2025 09:16:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5C60439EB;
	Thu, 24 Apr 2025 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745486186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfTMyxnIB01quA/V2nunnWHVUVFti2y/BX9X/pdrGWY=;
	b=jOzEvNZEShCzsxTs+NkBn1qOJdqxA8tHkP08L2Lg6qAXRL/5ijL0AN/edPlIv/jmiSmARl
	NS8waoNweatYVMlJWYeHqQ4afL9NF36QodTJy5W/g3V3N+bfMFZ9pEL9xyF6Q4/NXGPMAu
	zreIAtnVZ73Ff1kZzA+DZb4UsChwu9yPMkmp6eDzvmVymwn9GHvUkLgDmk+ZIPh/sbPdDI
	abEzn7l+jHbpLFF2IsSSutGq8smCtIwtFMVqCrx6d+eT+MUKvvaEetsN82PPVjK9cTe+xs
	y4BKUkoBslN4Uq/+QWbZcxGwXZpJe4eHVUq7z7Oqb0NZ8I1loxiTym8acAgUyA==
Date: Thu, 24 Apr 2025 11:16:23 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Biao
 Huang <biao.huang@mediatek.com>, Yinghua Pan <ot_yinghua.pan@mediatek.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, kernel@collabora.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 2/2] net: ethernet: mtk-star-emac: rearm
 interrupts in rx_poll only when advised
Message-ID: <20250424111623.706c1acc@device-40.home>
In-Reply-To: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-2-f3fde2e529d8@collabora.com>
References: <20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-0-f3fde2e529d8@collabora.com>
	<20250424-mtk_star_emac-fix-spinlock-recursion-issue-v2-2-f3fde2e529d8@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeltdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopeguvghvihgtvgdqgedtrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehlohhuihhsrghlvgigihhsrdgvhihrrghuugestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehnsggusehnsggurdhnrghmvgdprhgtphhtthhopehsvggrnhdrfigrnhhgsehmv
 gguihgrthgvkhdrtghomhdprhgtphhtthhopehlohhrvghniihosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_021629_902965_188FB16B 
X-CRM114-Status: GOOD (  11.69  )
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

Hi,

On Thu, 24 Apr 2025 10:38:49 +0200
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> wrote:

> In mtk_star_rx_poll function, on event processing completion, the
> mtk_star_emac driver calls napi_complete_done but ignores its return
> code and enable RX DMA interrupts inconditionally. This return code
> gives the info if a device should avoid rearming its interrupts or not,
> so fix this behaviour by taking it into account.
> 
> Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

I'm unsure wether this counts as a bugfix, as no bug was
seen, and there are quite a few divers that already ignore the return
from napi_complete_done().

I don't think the patch is wrong, but maybe it should be sent to
net-next :/

Maxime

