Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A48C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjwWc9gDfir+Wkn1xAst+LGqPVhoIzVfThz9vx+DKwk=; b=J3HcVfqrEOi4eqIdtoceUNkMwL
	wEg7FWEtxcBxYnqxL0leo8eLbVxl/ADMAiSYzl+cfy00mZHJtKoOaw2BiXInqXPpjGm2BkGvJe6Lc
	4kBin2ebi0VZ3u+HHbm5sp27XFCK2Nb11iqEr0xb6Y3TTfTg6mX/79S9iBRRjT5VCWLCCRfzu6SAf
	NuAhOY/2v3e5Y2e5fWNcf1z24eJ6JHzMb62sQtsFhUOOj3OccAea8x2uPrrVlND+IhNgR5eB8vkti
	fIcicHMYvQCrbxw2B/ncrFRxWm5omL1FTycAsoSfkCk0E0mUHPbng/olPb1ByYSuBpstE4s3+V6FV
	GO0NNPBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQpUX-009VtM-Dn; Sat, 11 Feb 2023 13:00:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQpUU-009Vsj-Ew; Sat, 11 Feb 2023 13:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BjwWc9gDfir+Wkn1xAst+LGqPVhoIzVfThz9vx+DKwk=; b=mZ3cstkgXO/A7G7oXqbsTNIBMF
	gsHOViqG6SDPuO3vexL/Ytj5kfI9BDUZi86HN5qj42/TXnMrWLMcZzwzgq6/0sVLUQUmH1qDEVQki
	JuBBE5bzg3FYxNatyiNj4Xchc81tzk7w7J+3HRH79M6cRw9VN5uGDrVCOerI/P7YTvCMjF1TNKurC
	++EeMnCdkSQUVD2icaYwVfneonBGnKB8KTnU7FBdITHvkg85NHxiEzMBwVRMRAt/NhcCW01BKi5Ss
	a4XU13NvX19UkGMz1U4h7UqM0to2LC4vqFy5Ye7Q+Bm3JC2ji5EG1z3eV7R8ejI7fd0sRGcKSS06A
	G+hNdozA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46366)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pQpUQ-0001ch-62; Sat, 11 Feb 2023 13:00:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pQpUN-00018M-Jb; Sat, 11 Feb 2023 13:00:23 +0000
Date: Sat, 11 Feb 2023 13:00:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v4 12/12] net: dsa: mt7530: use external PCS driver
Message-ID: <Y+eRZ3M/0QbJpnEz@shell.armlinux.org.uk>
References: <cover.1676071507.git.daniel@makrotopia.org>
 <57dd71b0ce44d8c2a175023933d7a5dd6c4f3b6f.1676071508.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57dd71b0ce44d8c2a175023933d7a5dd6c4f3b6f.1676071508.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_050030_517779_3CA0ADE0 
X-CRM114-Status: GOOD (  10.69  )
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

Hi Daniel,

On Fri, Feb 10, 2023 at 11:40:40PM +0000, Daniel Golle wrote:
> Implement regmap access wrappers, for now only to be used by the
> pcs-mtk driver.
> Make use of external PCS driver and drop the reduntant implementation
> in mt7530.c.
> As a nice side effect the SGMII registers can now also more easily be
> inspected for debugging via /sys/kernel/debug/regmap.
> 
> Tested-by: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Nothing obviously wrong.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

