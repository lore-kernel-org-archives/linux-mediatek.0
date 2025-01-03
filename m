Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD03DE77188
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 22:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC4xRGziK9g9aVt6fSkQ1/i2c6tieWGRAMPkl5BbmQQ=; b=EfI0y39MbkRIBr1DZM48yCL3qP
	k8elnJ77SUBQLOUDBQTeQLYbo25OCV1cXGmcaX4RWVyZyZ1k5FrzmHxhvemi55MXo1fUqAMeTgtEz
	IHNSLU+h86hyRDzAWTk3UfWt6cDOwok8pKjs6ryS1sHzpU6cxknoqkuWxrgav99Js3qMDMgJRvW5o
	IuBr2Y4c5Zw5CIviVDautdcys4mByKBkhUyh4OF/JxS+JFxpCn2lo0egEzYMHshoWIijaUuGlNRDJ
	EO+eco//GnX5wL2Vm1kz3Y+0SlKPD/2ca0haUBh4mVWH00NRxvjeyxrBeNm4P8IQMg4iOt8jH46X+
	E7Y7+nuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTqRh-0000000E8sE-4B7j;
	Fri, 03 Jan 2025 22:47:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTqQ0-0000000E8hj-2bFc;
	Fri, 03 Jan 2025 22:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nC4xRGziK9g9aVt6fSkQ1/i2c6tieWGRAMPkl5BbmQQ=; b=0iXk5yj/N9X5BChmvUoExXBHij
	7nlr0oqp4aoFuCc+m92c6aDBPqBR+DgPwhvjnQ1puqPVQEKkXm4wSVtk1dCvzFbqzruEPpdAq8KWS
	+qjTPN9RIeiX8PG/phNYYSfA2HV+zWM5PiBQR5Z56DNS63bGI5dxUTERm9+Bj48OW+MQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tTqPn-001ACo-P8; Fri, 03 Jan 2025 23:45:11 +0100
Date: Fri, 3 Jan 2025 23:45:11 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 6/6] net: pcs: xpcs: make xpcs_get_interfaces()
 static
Message-ID: <7da95b85-f16e-4082-ae6b-12da27875750@lunn.ch>
References: <Z3fG9oTY9F9fCYHv@shell.armlinux.org.uk>
 <E1tTffk-007Roi-JM@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tTffk-007Roi-JM@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_144524_659525_8A9AF897 
X-CRM114-Status: UNSURE (   7.14  )
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

On Fri, Jan 03, 2025 at 11:16:56AM +0000, Russell King (Oracle) wrote:
> xpcs_get_interfaces() should no longer be used outside of the XPCS
> code, so make it static.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

