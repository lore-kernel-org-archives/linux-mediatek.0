Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE79DC5DF8C
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Aug 2026 00:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aObQf2oaYp5QKQcNw3tYERl0NwSXy/AaP2uuZhlQdS0=; b=N2WFgUDzm57FGxAdWDtVeEpn7n
	aeSWTztGgGnOlPN+E+vVVjh4amWbbY+6ALaSL9VS826y5jZexPPMgjIfCvGkCg0M6WoU7V6d+a8Df
	GhLN4NgCBZJclBxWKhqIpGuYu5PLOmW1WNZ15naaSAyiWTse85/LhkJUr5mt8eeB2gLwi8GS/dFsw
	4FB3ol0Qei3RX6uxBpafDwHutwTlsYnN/RV1cZznsFOSUWutOGj9mHpEj4Q9lkgT++aAlWNkpqkkg
	6aY8s5uDbbok6tyHK3MYuiXg1No/UI2XNhV9FJwU6bjRmuIt2x/L49tRtHTPTiQJ9Ey4BCjVIaCPx
	hmSXs2Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxZnb-0000000ECaR-0UqC;
	Sat, 22 Aug 2026 00:41:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxZnZ-0000000ECaB-45HB;
	Sat, 22 Aug 2026 00:41:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3FD261126;
	Sat, 22 Aug 2026 00:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4C71F000E9;
	Sat, 22 Aug 2026 00:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787359283;
	bh=aObQf2oaYp5QKQcNw3tYERl0NwSXy/AaP2uuZhlQdS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=c1fIJOUC8htT+L7mTOSWTZ22TQjYb6mSU3FVTqQ2Gy6GYmZ+pdnEvRVRcGRFFSzHT
	 zsg9Ugdl2YCloKJ2xt4hY+6P7dL76Gl65xnNBCNjYJIrZ6SQYVAqqOViubL7bO0w0q
	 oCZsxc+386+GMUbE15FPq7+tQ9AqEKaV4f8NyKrsmirc2VQCAKrknBtOOLKShaMJEI
	 SjnU/hN4Z8L6/u/x7UqJEHD15XQoQHH9J67yCmEYMSQL0xE1ssJv8y6mBpEhq6u21I
	 1trDR/aOM1u7ECZ3TPq25A/Wsz/UkdBGCm1h4HtiEF8atnqGAZAe/MIvtHsDAU8oGM
	 kUnQ0nX3nimOg==
Date: Fri, 21 Aug 2026 17:41:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Shiji Yang <yangshiji66@outlook.com>, netdev@vger.kernel.org, Rex Lu
 <rex.lu@mediatek.com>, Felix Fietkau <nbd@nbd.name>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: ethernet: mtk_wed: increase WED v2 WDMA RESV_BUFF
 to 0x80
Message-ID: <20260821174121.326f3c49@kernel.org>
In-Reply-To: <OSZPR01MB779537889255E2F606E47EABBCA52@OSZPR01MB7795.jpnprd01.prod.outlook.com>
References: <OSZPR01MB779537889255E2F606E47EABBCA52@OSZPR01MB7795.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 19 Aug 2026 21:07:07 +0800 Shiji Yang wrote:
> Change WDMA RESV_BUFF from 0x40 to 0x80 to avoid CDM TX FIFO overflow.
> Without this patch mt7986 and mt7981 may have WDMA TX hang issue. This
> patch was pulled from mtk-openwrt-feeds GPL open source project.

Lorenzo, could you TAL? (incl. Simon's suggestion of the Fixes tag)

