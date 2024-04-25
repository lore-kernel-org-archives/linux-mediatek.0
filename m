Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A973C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 16:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOcqtwMWjNdrJ7DWWV47YY5kyFrg6cLoJn7IbJl/aRk=; b=Pbw3/WlQ404eKJhsoolsWEzXSs
	kybn5t15ZpVxCrsu+qLJt/C4V7FBOgi9CUStd6Pu0r78IIWYgIbZcwuK8OXcJoY+7ZZ4Q3bhhta02
	/kH03dGWzpdU/I2k/yy5LU6WoQvWMGA86f8lW+TrM+8PKvkpOyN+03Jpkhl5soOqOdwhUjYBfl/ca
	rc0iNm9dR0CDnUvMNq4B94rcW/p3PcUeprlndAhawPSfZy2vIxngKiF4Fd9jK+OhXIvT2v1YOrQQs
	F3ElEASTA4DuVQMLvFIisWhEA3039+4MJEAC+V+Xn5eARhO1TDpSEkbZyPW4CrRJkWSNKnpLAtWWD
	7iZBSS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01m0-00000009K9r-3eB7;
	Thu, 25 Apr 2024 16:16:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00nb-0000000941L-06EA;
	Thu, 25 Apr 2024 15:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SOcqtwMWjNdrJ7DWWV47YY5kyFrg6cLoJn7IbJl/aRk=; b=Sy7RKu9T4ainbpi+Sh7e2VUjgF
	Y4edv+ECiKSR0tRBO+3SIQkXHJviX+XD4duqbHZoEQwPVw1qc1k/GQa3g2pbqu3KPAzOYG/Sk2gMB
	DHkWKDyNvLavZ1Zsn1r71hgcBQJdNYZ09VgdPTj+pAWBGeOc7Vxq6PL1UOb4+n0BgqqfCdPzTw0Ja
	Pz1KCnDZ/uuKbfHUk+7qWSJNnKQlrTYk8W0D6NlFOYBg96sJXEBmWr75nhMsEwsqO2cmkolcl/Rpv
	Fx6Ru2jK8QJcyluCNUvWCQ3Vt4MoYPw/pSahEzlXp4gJK3ahfKZQiE1zyGxriKrh+YjFdoxNHERKT
	umLoE1jw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00nX-0000000EyEv-3bwg;
	Thu, 25 Apr 2024 15:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SOcqtwMWjNdrJ7DWWV47YY5kyFrg6cLoJn7IbJl/aRk=; b=lB5WciM7UX8DfNBtZYPNwydUK5
	A1CQwdEOoWDDLpfYy1EoNst+ybo7mpFVMQBn0tAE/pKhNRFSdy4raiSMKTNNDLJRzN5Av0QJzkLsC
	pLOBsvdaOjBBLsEw2nnKSP4dPsTsUskX6t87asb4QzV70D/rVdKNyXbBw69aaEBcA9tE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s00nK-00Dzqc-5y; Thu, 25 Apr 2024 17:13:54 +0200
Date: Thu, 25 Apr 2024 17:13:54 +0200
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
Subject: Re: [PATCH 2/3] net: phy: mediatek: Add mtk phy lib for token ring
 access & LED/other manipulations
Message-ID: <d6c62ab9-256b-47d2-8145-7dc6ffcbd020@lunn.ch>
References: <20240425023325.15586-1-SkyLake.Huang@mediatek.com>
 <20240425023325.15586-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425023325.15586-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_161408_046466_1645E42C 
X-CRM114-Status: GOOD (  12.61  )
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

On Thu, Apr 25, 2024 at 10:33:24AM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Integrate some common phy manipulations in mtk-phy-lib:
> 1. Token ring access: This is proprietary register access on page 52b5.
> Use these APIs so we can see which fields we're going to modify/set/clear.
> 2. LED: External/internal giga & internal 2.5g phy share almost the same
> LED control registers/logic.
> 3. Extend 1G TX/RX link pulse time: We observe that some devices' 1G
> training time violates specification, which may last 2230ms and affect
> later TX/RX link pulse time. So we try to extend our 1G TX/RX link pulse
> time so that we can still detect such devices.

Please break this up into 3 patches.

> -#define MTK_PHY_PAGE_EXTENDED_52B5		0x52b5
> +
> +/* Registers on Token Ring debug nodes */
> +/* ch_addr = 0x0, node_addr = 0x7, data_addr = 0x15 */
> +#define NORMAL_MSE_LO_THRESH_MASK		GENMASK(15, 8) /* NormMseLoThresh */
> +
> +/* ch_addr = 0x0, node_addr = 0xf, data_addr = 0x3c */
> +#define REMOTE_ACK_COUNT_LIMIT_CTRL_MASK	GENMASK(2, 1) /* RemAckCntLimitCtrl */
> +
> +/* ch_addr = 0x1, node_addr = 0xd, data_addr = 0x20 */
> +#define VCO_SLICER_THRESH_HIGH_MASK		GENMASK(23, 0) /* VcoSlicerThreshBitsHigh */
> +
> +/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x0 */
> +#define DFE_TAIL_EANBLE_VGA_TRHESH_1000		GENMASK(5, 1) /* DfeTailEnableVgaThresh1000 */
> +
> +/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x1 */
> +#define MRVL_TR_FIX_100KP_MASK			GENMASK(22, 20) /* MrvlTrFix100Kp */
> +#define MRVL_TR_FIX_100KF_MASK			GENMASK(19, 17) /* MrvlTrFix100Kf */
> +#define MRVL_TR_FIX_1000KP_MASK			GENMASK(16, 14) /* MrvlTrFix1000Kp */
> +#define MRVL_TR_FIX_1000KF_MASK			GENMASK(13, 11) /* MrvlTrFix1000Kf */

This is not what i would expect for moving code into a library. I
expect code to be deleted from one file and appear in another file,
with some minor changes, static dropped, EXPORT_SYMBOL_PHY added.  If
i see code just move, i don't need to review it line for line. If you
do want to change the code, please move it into the library first, and
make modifications.

Lots of small patches, which are obviously correct.

	Andrew

