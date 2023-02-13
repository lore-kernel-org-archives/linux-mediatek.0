Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE7DC636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 12:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOEavSKobxzkNUwIbNjE6psRFHrp/W2anCwg7BkkLCc=; b=rp8MaccKFTpK11F7hG/NXE+m0e
	QCAMSNzKQkYYftzXSHFIZ/h9dDU31PtxQok3kGiNJS56JCJY9/+Pun7/UTisTm0eV/Stunybp45uH
	VHGlby5GFKErK2w6N8cq3MO5h5M/MOEbxZWlD3hjLU7ks/ShgApWthogEHummER5x2RX86Ax2L6RZ
	2oFa93+IMzf3941Z3Bv+Gse2iiGjXnjvuUBlYhp5NLmE/ctH60q/V5+cCVImUqZDx1K13V1jSyU8u
	lFXtRXmtULhVDIQLIGYahQTXNjM9QgY+3ZlQp2P3ibtp53tVcE1+0lPGrP9dCSsyyG1Lb5gMWmHd5
	nG/xoJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXsX-00Ecjq-32; Mon, 13 Feb 2023 12:24:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXsU-00EchW-Ds; Mon, 13 Feb 2023 12:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gOEavSKobxzkNUwIbNjE6psRFHrp/W2anCwg7BkkLCc=; b=ObDVlDbZLK9iuH4F+Lz0ntxyzW
	4s555KAxM8FkX5eXfRjE0I/9j9dVWUeM69v2YVi9jDwHrTban4YD0k5PRV3XgTNRBhcDW8OIxkIaS
	MAlOagHiPjt1Y32EREWUz7m7PNcgoELK8FNv3iF96qEe1MELulK6Q0lN2aYSBNgt8miKyUHCEE4vq
	KZT3KL94ZnJBbZ7NCiJgkO4vfbCFdJ9ADBriaX4hap1BU1ECSlzsEBW+E7/MqcIFZ0HIzqiIArLu6
	HmdVIexH0CKP+5F2PZlwOy+KnaW3PC7MZ4CM0O+e2Zm1OQIl78bSDqKveQNeVQaJeE9W7z5Hex7mo
	6Hdvp+Lw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58250)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pRXsF-00041Z-RT; Mon, 13 Feb 2023 12:23:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pRXs8-0002xY-TH; Mon, 13 Feb 2023 12:23:52 +0000
Date: Mon, 13 Feb 2023 12:23:52 +0000
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
Subject: Re: [PATCH v5 10/12] net: pcs: add driver for MediaTek SGMII PCS
Message-ID: <Y+or2P8K+BzDL7vi@shell.armlinux.org.uk>
References: <cover.1676128246.git.daniel@makrotopia.org>
 <ea7658198d2a1480746882a7e31adf0f37793086.1676128247.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea7658198d2a1480746882a7e31adf0f37793086.1676128247.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_042414_497755_B7F74574 
X-CRM114-Status: GOOD (  12.52  )
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

On Sat, Feb 11, 2023 at 04:04:51PM +0000, Daniel Golle wrote:
> The SGMII core found in several MediaTek SoCs is identical to what can
> also be found in MediaTek's MT7531 Ethernet switch IC.
> As this has not always been clear, both drivers developed different
> implementations to deal with the PCS.
> 
> Add a dedicated driver, mostly by copying the code now found in the
> Ethernet driver. The now redundant code will be removed by a follow-up
> commit.
> 
> Tested-by: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

