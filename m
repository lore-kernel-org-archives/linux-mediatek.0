Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F9EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 23:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9tqzrgI8xxtk/gIFSKImQ9UC0NRlRXaTXs16f53z0I=; b=uiJTNiUzFeajZl
	VdUDJWC0qWWTFPuBkN3T5lOGCTPwjbVjnJ9bithYaS1SjewCcV3Y+PYNSbu2wzb8z59EUKHb3h/xU
	DrrIx0RncyfCoyUaMv9EtJ1aE6JHRPUD5DMe1LaQrAXQ8bMYwUpncv/oRLVjeqWgrvkykoGdX0EpV
	n/oVLOsIMtnRaPY51n4TiDTXVnLZHF4bUPsUGAdx0CqObWXKAv6vTQ/m02ch3OBwYVk46PwXfOWG5
	E7V0upHFWkMp/SG5rNZPokNbkvnsJoSt4PHMjJa4GeSN8PlqShnqhl7xEChoUQQHWu9sR/Wqvwo2d
	SWQnfVrtI57t/sdNdXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbrzM-008M6k-B1; Mon, 13 Mar 2023 23:54:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbrzB-008M4e-9n; Mon, 13 Mar 2023 23:53:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF3CDB81642;
	Mon, 13 Mar 2023 23:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5FCC433EF;
	Mon, 13 Mar 2023 23:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678751626;
	bh=gSAvD8e0r3C0d1zGg6+R2BHZ7ljZS6nIV2sHt+LmnIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ancY9WMY/uv/1HxBZAT5oqADuUq9bshYi8NtqOgyyPxeCw3pxhYSzAxe8LvEIkhfU
	 Z+tYK5oIvRwcvh31DwBIY4MFjmc0Xz45zqafxk3oiIM/SNGeT8r3Qs3SEWqky64NyK
	 E8oShOIWbXoWozxraHxk7LKv6xsCucetzIoF7OsqWBSdeuNkacylYMI/ZDBZe3Swe/
	 bZee4zWUZ5w2buRnfISTgcZoTpW7uDsK0IEely5YiWNt1ZziYtJZNgWrSzeVTD1Qxc
	 /q6SF/czgyVFfGLOeS4YXXKOHI1kloxkO6u3Hmiallyo6aRG84CXGM3eBKjkb6BAP1
	 kF/5bfJaOMOww==
Date: Mon, 13 Mar 2023 16:53:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v13 16/16] net: ethernet: mtk_eth_soc: convert
 caps in mtk_soc_data struct to u64
Message-ID: <20230313165344.4db8f750@kernel.org>
In-Reply-To: <2d10d7a2de2a94f475c5134868580ddef4852c11.1678357225.git.daniel@makrotopia.org>
References: <cover.1678357225.git.daniel@makrotopia.org>
	<2d10d7a2de2a94f475c5134868580ddef4852c11.1678357225.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_165349_521524_5D0901EC 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 9 Mar 2023 10:58:58 +0000 Daniel Golle wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> This is a preliminary patch to introduce support for MT7988 SoC.

When posting v14 please do us a favor and withhold this patch.

It looks like the series doesn't need it and the limit on patches 
in one series is 15.

