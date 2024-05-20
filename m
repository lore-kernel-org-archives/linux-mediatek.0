Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A04C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 13:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBepfuRSnR60+uXpcB5dLLA7csPWcskh8ZUNfZDMcXI=; b=Q7kmydZvvIuffZCEw+WlY5C7Cg
	Q1UGa2TTShIFgd7E5s/D+QLfW8i+TxCQ7WjapFZMJhrU16E9a6YFr7fZjO6X0qxd7Q+2YE1uopcgf
	n/okf/08NtZf7qYXbqY2CjSXFURIG0qJRTd0jIb2b8aPzRUGLX/iVXw3ERtrPxuY7pO8YU1TjVk4e
	qpvOCq33RifkxybvwyX5WS1kWjaAqPTjqu1S+URNmDkgtKJ1h71/IfCdeJOtOzthPdaxmVCmH+7Wp
	uIjoEXchFD693tfQTJbKIfB3SDn8HtHWsGta3o7U0z9xbH0PE7h+Q9+U9wK4DFxHu8rlf4hU244th
	fIv8V6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92tl-0000000EYmx-1HO4;
	Mon, 20 May 2024 13:17:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92ti-0000000EYmB-0WxH;
	Mon, 20 May 2024 13:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kBepfuRSnR60+uXpcB5dLLA7csPWcskh8ZUNfZDMcXI=; b=XrQkqERh5PY8JuDZ54IBjmYc/S
	OzyanipZZToOSnM3CT9RqesnTEe7B0Jyqt1grcLwm8aDN+oJtl4WJbPB7bnKL9VS+SMFDkY+Vxnfv
	RKQ9FZI+7i1LHL6p064EIw20vAMW/04AgUsPWZkkHiEeFhbvQgVk3eiKbJNRgeqBxWok=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s92tR-00FhLz-AJ; Mon, 20 May 2024 15:17:33 +0200
Date: Mon, 20 May 2024 15:17:33 +0200
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
Subject: Re: [PATCH net-next v3 4/5] net: phy: mediatek: Extend 1G TX/RX link
 pulse time
Message-ID: <5389c04a-40ff-44a1-9592-05c6dc1a9636@lunn.ch>
References: <20240520113456.21675-1-SkyLake.Huang@mediatek.com>
 <20240520113456.21675-5-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520113456.21675-5-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_061750_190789_C9156847 
X-CRM114-Status: GOOD (  18.80  )
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

> +static void extend_an_new_lp_cnt_limit(struct phy_device *phydev)
> +{
> +	int mmd_read_ret;
> +	int ret;
> +	u32 reg_val;
> +
> +	ret = read_poll_timeout(mmd_read_ret = phy_read_mmd, reg_val,
> +				(mmd_read_ret < 0) || reg_val & MTK_PHY_FINAL_SPEED_1000,
> +				10000, 1000000, false, phydev,
> +				MDIO_MMD_VEND1, MTK_PHY_LINK_STATUS_MISC);
> +	if (mmd_read_ret < 0)
> +		ret = mmd_read_ret;
> +	/* If final_speed_1000 is raised, try to extend timeout period
> +	 * of auto downshift.
> +	 */
> + if (!ret) {

If you look at other Linux code, the general pattern is to look if a
function returned an error. If it does, either return immediately, or
jump to the end of the function where the cleanup is.

Since this is a void function:

> +	if (mmd_read_ret < 0)
> +		return;

And then you don't need the

> + if (!ret) {


> +		tr_modify(phydev, 0x0, 0xf, 0x3c, AN_NEW_LP_CNT_LIMIT_MASK,
> +			  FIELD_PREP(AN_NEW_LP_CNT_LIMIT_MASK, 0xf));
> +		mdelay(1500);
> +
> +		ret = read_poll_timeout(mmd_read_ret = tr_read, reg_val,
> +					(mmd_read_ret < 0) ||
> +					(reg_val & AN_STATE_MASK) !=
> +					(AN_STATE_TX_DISABLE << AN_STATE_SHIFT),
> +					10000, 1000000, false, phydev,
> +					0x0, 0xf, 0x2);
> +
> +		if (mmd_read_ret < 0)
> +			ret = mmd_read_ret;
> +
> +		if (!ret) {

This if can also be removed.

> +			mdelay(625);
> +			tr_modify(phydev, 0x0, 0xf, 0x3c, AN_NEW_LP_CNT_LIMIT_MASK,
> +				  FIELD_PREP(AN_NEW_LP_CNT_LIMIT_MASK, 0x8));
> +			mdelay(500);
> +			tr_modify(phydev, 0x0, 0xf, 0x3c, AN_NEW_LP_CNT_LIMIT_MASK,
> +				  FIELD_PREP(AN_NEW_LP_CNT_LIMIT_MASK, 0xf));
> +		}
> +	}

One question i have is, should this really be a void function? What
does it mean if read_poll_timeout() returns an error? Why is it safe
to ignore it? Why not return the error?

> +}
> +
> +int mtk_gphy_cl22_read_status(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = genphy_read_status(phydev);
> +	if (ret)
> +		return ret;
> +
> +	if (phydev->autoneg == AUTONEG_ENABLE && !phydev->autoneg_complete) {
> +		ret = phy_read(phydev, MII_CTRL1000);
> +		if ((ret & ADVERTISE_1000FULL) || (ret & ADVERTISE_1000HALF))
> +			extend_an_new_lp_cnt_limit(phydev);
> +	}
> +
> +	return 0;

If extend_an_new_lp_cnt_limit() fails, what does it mean? Do we
actually want mtk_gphy_cl22_read_status() to indicate something has
gone wrong? Or does extend_an_new_lp_cnt_limit() failing not matter?

	Andrew

