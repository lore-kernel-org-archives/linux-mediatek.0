Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D28360960A2
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FdwsgVYL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=gYMcabrr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZfTs+ryizwPn0Cl3XX+fYi34UNKxEvbPC3g5XcJfRFc=; b=FdwsgVYL3pBBSS8a9wIc147VDt
	eLnJUfwhM8HqESx74fFOeMBmkE2Cbs2pjz6s2hCpwRdt3cKS128X+OPFg2F08MYJ5vbBD3w2Gi1Od
	tEgu6nOX97g4ljdbh45mlGSafA3sSkiLlVYQOGheq0Hvxh7zT3KbICJmJ1zD1I8ugCMlAkUvF1SpU
	7w6PUNxtATa4oyZjnjh241EvogsvQoHnZdAKwhOy7RWqNrBkKAb3u5X+Smuj77jMxQeGdfMELDCVB
	KUhkDvlKRreNhFjZHxCLpI/CJ7lScYgg576I78Ubk+WRQmV2ax7I7I2XFIiAVS++JsUikUJKYw5G1
	8HwgjIOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhxQ-00000006wjK-1ssp;
	Wed, 04 Nov 2026 20:51:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhxN-00000006wiK-0orR;
	Wed, 04 Nov 2026 20:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZfTs+ryizwPn0Cl3XX+fYi34UNKxEvbPC3g5XcJfRFc=; b=gYMcabrrRrrv8R/JgiDQxQdpoO
	B4xeVkOkMAmW5SkgjzvXAXfOQ6JqfSA21vWQ3ZWQJRkwxEO00Cr1X2Q8EZW3y3AT0vPDV9fkXqdBk
	gqDbevO66SBMR4liG1+Nj0cg3+SfEF6DPc6bOe2V8Dj/iZhjs/xwOY6jPcw98oWTSJ+c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xOhwz-00ENw1-4M; Wed, 04 Nov 2026 21:51:17 +0100
Date: Wed, 4 Nov 2026 21:51:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 5/6] net: phy: mediatek: add calibration
 logic for AN7581
Message-ID: <68eecc53-ed61-463d-bb5f-c68b507be82a@lunn.ch>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
 <20261103221439.30502-6-ansuelsmth@gmail.com>
 <2b744929-609b-4529-8b6b-30feb3ebbbde@lunn.ch>
 <6aeb7861.6171b307.11ae12.6b94@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aeb7861.6171b307.11ae12.6b94@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_125141_236353_0AB5A888 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> It's safe in the measure that the worst is that link goes down during the
> calibration... I will rework the function to assign the base address to the
> default address for port 0 (it's hardcoded by the SoC) and use the lock and
> read/write helper instead.

Are there multiple PHYs in the package? What happens if both are doing
calibration at the same time?

PHY #0                            PHY #1


phy_modify_mmd(phydev, devad, regnum, mask, cal_val);

		       	      	  phy_modify_mmd(phydev, devad, regnum, mask, cal_val);
				  ret = mtk_cal_cycle_wait(phydev_p0);

ret = mtk_cal_cycle_wait(phydev_p0);

    Andrew

