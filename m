Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8B2C04FFE
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 May 2024 00:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2v1/YXR2GimaLG5uR1GGycdNdXwLlVivQdeAFA74MKY=; b=KUuue/fCx0qm1IOf+/DKlLvO2q
	2f+EEcgSD0UMERYFxrTU9mshjOzMg769RnPx0l09AFQIvd5MsX1kh1Jdz4jmQWDnHcu8j/Sk4/0AW
	tzCM2CiHQ0nEqfF/AqSoygFrQbQ+RuDa5fHXzM4EXsnDeqcJhcI0vvjju1YQLB0AWlbxRdgaHCKLQ
	r+5alaRl+p/LjaGqc2zGNjflwGArwv4xXzkhL6u86bpVi1FEw3ElQdMcquJQBDXx+YgIepS1lQkrk
	2T0LsPsckOUpSJfPV3zkv96Si4hPRMbhbco84jsEo26j2wCCuiFAVb/pImOg09ReCPMufBvY7rwqg
	sDYYlxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s88Ei-00000009Jn1-1jCE;
	Sat, 18 May 2024 00:47:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s87En-00000009Exj-0HiH;
	Fri, 17 May 2024 23:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2v1/YXR2GimaLG5uR1GGycdNdXwLlVivQdeAFA74MKY=; b=BpwuQ07D3voZOpCgCFkeJsb63r
	c2vlcQ/F1POceo4vWMKt7NbXK85u+SxbAWfNINq7DSYPzAwZ79P+x5k4epUT2mdRolPget8Nc+gUb
	w2oXHmdFgmP6gI9oWRKQ0JQFi6zUBTjniF+Mz2rITBmmVHZvr7vrd50D5bq08Y9iZhLXmUxYc5s7h
	m/xQkzWc2ikMRZRrxSz63PXOA7tO/yMMIKhn+YHx6R3TTAW/Oe0GkfHjI77BaE5RqFQaZmm4N/Eul
	Nk1ARx+2+uy6PZRGxqPL6FqLA1Z3aox/86E8Gg5vYGwMbRKYve0+m7W2gTEHflhPqiNDwV0B3dsox
	2Ad0oxyg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s87Ej-00000005pMO-1nPW;
	Fri, 17 May 2024 23:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2v1/YXR2GimaLG5uR1GGycdNdXwLlVivQdeAFA74MKY=; b=NI8N36hk3w1HBCPBgYWVnuTdlU
	MN8Jb6YqDUjkgQWyBkeFvHzmmqRZz4DDcjHWIv2z3Yw97fVCuPPTzQJj64sxUNfcdvAHFdrCeP0cB
	HLlQbW4Tt2zfmgBaj8IJZWx1b5FoQpTsvM3V/W44EGW1j6VIdnwjjrAkwlgxmNBuFcVs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s87EJ-00FbJa-LE; Sat, 18 May 2024 01:43:15 +0200
Date: Sat, 18 May 2024 01:43:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 4/5] net: phy: mediatek: Extend 1G TX/RX link
 pulse time
Message-ID: <d4a99edc-e514-4a18-9d85-0355ddf4686a@lunn.ch>
References: <20240517102908.12079-1-SkyLake.Huang@mediatek.com>
 <20240517102908.12079-5-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517102908.12079-5-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_004341_850392_B91BA939 
X-CRM114-Status: GOOD (  15.50  )
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

> +int mtk_gphy_cl22_read_status(struct phy_device *phydev)
> +{
> +	int err, old_link = phydev->link;
> +	int mii_ctrl;
> +
> +	/* Update the link, but return if there was an error */
> +	err = genphy_update_link(phydev);
> +	if (err)
> +		return err;
> +
> +	/* why bother the PHY if nothing can have changed */
> +	if (phydev->autoneg == AUTONEG_ENABLE && old_link && phydev->link)
> +		return 0;
> +
> +	phydev->master_slave_get = MASTER_SLAVE_CFG_UNSUPPORTED;
> +	phydev->master_slave_state = MASTER_SLAVE_STATE_UNSUPPORTED;
> +	phydev->speed = SPEED_UNKNOWN;
> +	phydev->duplex = DUPLEX_UNKNOWN;
> +	phydev->pause = 0;
> +	phydev->asym_pause = 0;
> +
> +	if (phydev->is_gigabit_capable) {
> +		err = genphy_read_master_slave(phydev);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	err = genphy_read_lpa(phydev);
> +	if (err < 0)
> +		return err;
> +
> +	if (phydev->autoneg == AUTONEG_ENABLE) {
> +		if (phydev->autoneg_complete) {
> +			phy_resolve_aneg_linkmode(phydev);
> +		} else {
> +			mii_ctrl = phy_read(phydev, MII_CTRL1000);
> +			if ((mii_ctrl & ADVERTISE_1000FULL) || (mii_ctrl & ADVERTISE_1000HALF))
> +				extend_an_new_lp_cnt_limit(phydev);

This all looks very similar to genphy_read_status(), except these
three.

Would it be possible to call genphy_read_status() to do most of the
work, and then do these couple of lines of code.

      Andrew

