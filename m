Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DF3C02196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2025 09:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lb1WyqHjKVcN+G4oLZnwZ55S4p8nkWSdIS6ffZZDmyg=; b=2PoleaJa4hYQfkggg7CzCssXcY
	uiILbFyNaiedoyX3RBJF4V0OJxosPOLdCo2j3pkduRP4bbKrLwhphw2xZWIgX9570ohNuqtKyJbEY
	hmK9yQV1FvWwUPOW9XCn66O1C/VMqW5KrkgRymMCC/Lgo2grlA9SudKALQLRZcZAXCP0Z6J7elXNF
	SRHQuYGQedJezGxeqCAZ9ro+i24+cD6zb53YAzIMEOUV7vWjBA/Jjy7cn2YOtO9+JsR9HSoWe7bzu
	YS/boF22q9slUB1gaoJq0nr5kn8tEF3mgTQ5YDsPWHRm8q0YY1Ekec1uYEomm/jMLTghtmvV+mdjC
	Xa9p4YAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL4P-000000097J0-21Fi;
	Fri, 07 Feb 2025 09:54:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgL2M-000000096ve-0lOm;
	Fri, 07 Feb 2025 09:52:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA09D5C110C;
	Fri,  7 Feb 2025 09:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67907C4CED1;
	Fri,  7 Feb 2025 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738921957;
	bh=ozVyJ7cTy7If5xX1T25j3icBhBhcMNuBTKqE71SN3Bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTBC679Yis2+F+KclVsIb0rzgmPgeke9+S2XewYsPVyEnQXGkpS6hDmIhMUa7bOut
	 PccN/JQiwt1/yY2Cq1qY4LD3SpB+2i9c7y/dpALC8jW5ifuDC5AE6k53n1vUKOPayW
	 dSYo2OSLvQx0ZyHdsHTssdc4ByOrfRkKh/prEu4XX7mXh+05/8+jueZdNpgkinLmMQ
	 MjUTJCfk1+BoHBhSWubTEQmxP3azWLTBL5/Dvv2V6Al2E7NSZFDt8bz3WgzDXzz0hS
	 GTa1WMq5pTVImXhy8nbGssOXMsAIkgLOn4N7Ssf7IhddKAPNSlYyyCthvg7Qp1dXBv
	 AEecz12BlxZ/w==
Date: Fri, 7 Feb 2025 09:52:32 +0000
From: Simon Horman <horms@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH net-next v2 5/7] net: ethernet: mtk_eth_soc: Use
 of_get_available_child_by_name()
Message-ID: <20250207095232.GG554665@kernel.org>
References: <20250205124235.53285-1-biju.das.jz@bp.renesas.com>
 <20250205124235.53285-6-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205124235.53285-6-biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_015238_286419_414293CB 
X-CRM114-Status: UNSURE (   8.08  )
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

On Wed, Feb 05, 2025 at 12:42:25PM +0000, Biju Das wrote:
> Use the helper of_get_available_child_by_name() to simplify
> mtk_mdio_init().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped using _free().

Reviewed-by: Simon Horman <horms@kernel.org>


