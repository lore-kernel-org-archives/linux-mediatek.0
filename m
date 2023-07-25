Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A329EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 00:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjzY9kxUURYWQoHNFbgW+bOnB+sLfrqmWH8WqaD5nzc=; b=CYnjRz1PWaaODnwTOG6JGkso1u
	GvVKK8Ob5xQ3sFyEGjXEbmnHVoWlgIfZxXmVzxBTk6jH130enI6jTjDNJ5q+Zuy310QEyiEK9+AYw
	LzmwD0UPKHyChXs4Qc/l1G4Igppw9wdiERPDUtrxr2tLRoirENCdEm0V11Qrz3r3FYlj111bJvqVl
	CAQWENRKpqdX59uThHTesnfRJihu1i4WFdRUOq02RC3peG9twZkCiAaBvVYLgKk+J1rFNm6z8Jqzl
	yLXoGkfYOgbmAC1GTjbycWNVtWud9ZJhWumrgjAsCMNtNAxmoxFJ8p/FITkYkPSK+GpFOQ80j+kxH
	58FGu7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Kv-005mtK-0h;
	Tue, 25 Jul 2023 00:55:37 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Kr-005ms8-25;
	Tue, 25 Jul 2023 00:55:34 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qO6Kc-0004Y6-2q;
	Tue, 25 Jul 2023 00:55:18 +0000
Date: Tue, 25 Jul 2023 01:55:10 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Greg Ungerer <gerg@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v5 0/9] net: ethernet: mtk_eth_soc: add basic
 support for MT7988 SoC
Message-ID: <ZL8dbpEwmA8G4Mq9@makrotopia.org>
References: <cover.1690148927.git.daniel@makrotopia.org>
 <20230724160024.427b2bef@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724160024.427b2bef@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_175533_688936_6E12030A 
X-CRM114-Status: GOOD (  11.61  )
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

On Mon, Jul 24, 2023 at 04:00:24PM -0700, Jakub Kicinski wrote:
> On Sun, 23 Jul 2023 22:57:08 +0100 Daniel Golle wrote:
> > The series should not conflict with Russell's recently submitted series
> > "Remove legacy phylink behaviour", hence the order of them being
> > picked into net-next doesn't matter.
> 
> Not sure what the exact conflict is, but:
> 
> Failed to apply patch:
> [...]

Some things got applied in the meantime, I've rebased once again and
sent v6 without any other changes made.

