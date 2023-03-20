Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF0DC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 11:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMu5YLP/jkTdIj0tnEnlgPK0Nfp3Fpp+6udewmgirXw=; b=b2T+DxrWzVnEDFqYNQ6oisoFFX
	o7H8Vs1+u9jbzI5oL6qzfkSdnwZhTQfnDx2maBus+aK3fH5BE+wyJ1eNwMddQPUHma/fH0JDeuVqc
	OmId65DkY5fKeyhyeZf1eTYDsEOkj5LwdkqF62TTqc1RQWMhqlbaCVLY4jMaE+1JPq4uunekBclQI
	Cknya+/83R7FhCBibJNDB18yx37YGyFn4vP7QAOqOZgoQUAOKv2B9a3pqmF5Klfm9NQSLASEaiCsQ
	JsIzFx5MUrbJErtVbrEwDHgZ483O3GRYli+erfSAJhTVjKt4eYqQmVNbx2e93mltRNEA126knC2jC
	YOYohLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peDrr-008qVc-2l;
	Mon, 20 Mar 2023 11:39:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peDro-008qTv-0Y;
	Mon, 20 Mar 2023 11:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mMu5YLP/jkTdIj0tnEnlgPK0Nfp3Fpp+6udewmgirXw=; b=rQVL0WSfI6DDRuaDEwJjml822x
	KtD2v3CIHFYriDuEcS/4jsw7sMIu29l3YxeOvPW7AQVStBSosRBnhpzGCtNJTqKhaOXH3g/Hs2VEp
	QiBBkJ0iwG9hePCrAi4tGgO3CJcfKk5uKSTzB8faTx2U0JEueCpcj3K8D815BgfQZHivCxTqgCuQH
	5VGpiCW36UCDPR1FAcRswaokuMIeG8Q8VH3PGLYwRJxkHKHsM4QFwa5o5SNDpdOqlhGBAx/arsTuk
	EU9ES962mB0vkzSC1W8rXTGIO23j+FLDvlaUseE2G8SA8BQE3+mhQy82SJxgvmvxVcFBQ5EuGz89y
	T6gVTt3w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37718)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1peDrb-0007HS-54; Mon, 20 Mar 2023 11:39:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1peDrP-0006UF-Dn; Mon, 20 Mar 2023 11:39:31 +0000
Date: Mon, 20 Mar 2023 11:39:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v14 7/9] net: pcs: add driver for MediaTek SGMII
 PCS
Message-ID: <ZBhF88FtX7ERqrw7@shell.armlinux.org.uk>
References: <cover.1679230025.git.daniel@makrotopia.org>
 <cf8a52216cfe4651695669936bd4bb1b9500c57b.1679230025.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf8a52216cfe4651695669936bd4bb1b9500c57b.1679230025.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_043956_213722_3AA46ED5 
X-CRM114-Status: GOOD (  13.57  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Mar 19, 2023 at 12:57:50PM +0000, Daniel Golle wrote:
> The SGMII core found in several MediaTek SoCs is identical to what can
> also be found in MediaTek's MT7531 Ethernet switch IC.
> As this has not always been clear, both drivers developed different
> implementations to deal with the PCS.
> Recently Alexander Couzens pointed out this fact which lead to the
> development of this shared driver.
> 
> Add a dedicated driver, mostly by copying the code now found in the
> Ethernet driver. The now redundant code will be removed by a follow-up
> commit.
> 
> Suggested-by: Alexander Couzens <lynxis@fe80.eu>
> Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

