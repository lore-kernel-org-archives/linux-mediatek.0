Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AC6C369C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 12:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLeqxcCuX3BoT7U+FhDZa/UKFjGcWR5LVHuvgMXj9MA=; b=i09S/ZJew0eTd1HcHv6ur5L35p
	qGR22dpdoDMv+IWNHH498m7iuYFAPd2k+O7k/dfLh+Ah/eoRh1toa/8YxSujAWVvl61FyvKu9mT4M
	LyZK9VKYtun8sStXCNX5sGHBrdJUsSNPU0XL+N8THcd9I9FMwIXk9JJo9i7O8blj5KD9A8IU5mxcq
	O8mbMMGKBXKg+2pVfoKJLdfQcHfmGf1pVuldeANhGp44WiEZ1TzX6lz53wqmntVIcG+Ge89/WMW+L
	0zNRlKjOsUfQEIevnAf2b/1gsMxi4wt3lDF41LLULMtX3Del8st8V+iqjRs01rLFjl2B7OQHcPq0C
	yn5gTyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51yi-00000009X8m-0iTo;
	Wed, 16 Apr 2025 12:34:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u51sQ-00000009Vv2-0IFL;
	Wed, 16 Apr 2025 12:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MLeqxcCuX3BoT7U+FhDZa/UKFjGcWR5LVHuvgMXj9MA=; b=iqLfqMOPWoffq199Gd/V5c66wg
	CBrB0Kj4NnLc4sKIpIgvttRQfduIi4E9m4MKJjBijUcIl6btI73w5wN8VacxCEkuOvYI1c7JgEVMx
	S6Umj5FJcBENd8Y5GmjAUnLN7m85/3sIlyEv8qKq4B+MOi6xcwiX4dXew97/tZpNq0eU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u51sK-009cLA-2K; Wed, 16 Apr 2025 14:28:20 +0200
Date: Wed, 16 Apr 2025 14:28:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: mediatek: stop initialising
 plat->mac_interface
Message-ID: <c952e3ac-58d2-4913-a006-c8e9215e9d2e@lunn.ch>
References: <E1u4zyh-000xVE-PG@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u4zyh-000xVE-PG@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_052826_106189_0A9885FF 
X-CRM114-Status: UNSURE (   7.18  )
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

On Wed, Apr 16, 2025 at 11:26:47AM +0100, Russell King (Oracle) wrote:
> Mediatek doesn't make use of mac_interface, and none of the in-tree
> DT files use the mac-mode property. Therefore, mac_interface already
> follows phy_interface. Remove this unnecessary assignment.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

