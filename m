Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658E5C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpDwlTsLlGREtqpgpuzE2hrkLzTmenU/2dk0EKrGIFQ=; b=Z+nmrAgwiDCYlr1xjvw9Am58R1
	JQXIrXNhLPtBMb9nhLxhSdRBrDIyGR55xTMWRIUkpbgllI1+toQdulN6c2Ngr8T1+k/IH8utmAHTb
	nnBNaOSovyJoeqlH8cZISgwXKMN6MzY0mgto4qrCDBz3co4+jIrmMsGyhXRaFhCEo+Fk5BcvMxMxI
	hot+NPEs+RogIJvHWkNa94biSdDNANTFa90ShiMyA43xtmZDBpos+lCDe4SOr5i/ALN93tTiA+N1z
	tpW2Blg8AtKhMGndp3raJcOSl0cXejvoweQX3yXzOpCQ0P4YElu/dSioMEoVDJXMGGACOjuM+OWbB
	ouSz8PXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peE5U-008tmV-32;
	Mon, 20 Mar 2023 11:54:04 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peE5S-008tlb-1I;
	Mon, 20 Mar 2023 11:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tpDwlTsLlGREtqpgpuzE2hrkLzTmenU/2dk0EKrGIFQ=; b=qH7vwDbeu7NOkQjdNnjmMHg4Km
	AVUaSWNMOCYcQh+eiRXWhSDPRWWIh0PFMS4g31XIG8Lamrf+o+0yYyDzqZChLNpGZquU/fBi9Giuo
	5AS3d15IsN0sANS7RJIBluz6QTLscG5IhgG2iQg4XflOF9QZMldaj4Sf3YMHrlFdzGiiU6GsvbnqU
	rDv7AjclGKxa7UXrQbf313h4pnWoA5TtRN2QyKBMG2DBbezxsmu1DdeWrf6hquwQ8rcFPUpQiOV/h
	9dq1SFpnaxb7jJJzttd92ysK3R8HWmFI1o7qYCCPVqbaMQSufO2MG/LpuB9a1BZ5dWT+H8Kp82idB
	muLftrZw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46278)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1peE5P-0007Jo-LV; Mon, 20 Mar 2023 11:53:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1peE5O-0006Ud-Ll; Mon, 20 Mar 2023 11:53:58 +0000
Date: Mon, 20 Mar 2023 11:53:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v14 9/9] net: dsa: mt7530: use external PCS
 driver
Message-ID: <ZBhJVr8FkdpTJRGf@shell.armlinux.org.uk>
References: <cover.1679230025.git.daniel@makrotopia.org>
 <a770f39662182c5dd494d98717820f5bd98a47e2.1679230025.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a770f39662182c5dd494d98717820f5bd98a47e2.1679230025.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_045402_437786_10B62862 
X-CRM114-Status: GOOD (  10.45  )
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

On Sun, Mar 19, 2023 at 12:58:43PM +0000, Daniel Golle wrote:
> Implement regmap access wrappers, for now only to be used by the
> pcs-mtk-lynxi driver.
> Make use of this external PCS driver and drop the now reduntant
> implementation in mt7530.c.
> As a nice side effect the SGMII registers can now also more easily be
> inspected for debugging via /sys/kernel/debug/regmap.
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Tested-by: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

