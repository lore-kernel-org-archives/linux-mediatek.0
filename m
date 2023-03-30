Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E19C7619A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 21:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFIPT+A6y87wSd7XrlWKS8jisV2soaxGYkXRYmD7H0s=; b=NmSHDubx/DZFnY/XFLLyhxmfJx
	9qDSiGkPw6KvCVGXMiMpTBksHnMMxgbAlFBKXKyAL2XCXcSAi12ChmZBDZLut9dAhnoEOlXBkPb1D
	4Cu9kA9VLsToj5k91BM7JVAlpEFUTYloAz2Uatt3EGMBLnGvybQvo/aTM3IxPIyRMmbIscf3ZApe/
	lSc35nvMoNHzlFTRoObcuQhRVV/8aS1xA0tjP14W/yMEy2QPhRKz7qZoKwsNF9qSfMVx8l3PLcTRi
	vtcGXwMDmIicAyuuKMhCLmh85ESxVHtdN/c4fBSGtiXACjKljg+P7MAFm7zXGIBADC6A5Um65k9DS
	HWxapR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phzPa-0054ih-3B;
	Thu, 30 Mar 2023 21:02:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phzPY-0054ha-3D;
	Thu, 30 Mar 2023 21:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hFIPT+A6y87wSd7XrlWKS8jisV2soaxGYkXRYmD7H0s=; b=IfyAns4eUr8IfpM3Xv5S4s3aSz
	QjwsQvaNW+aSrrrZNoFbr3yUnXuIid0SYIWFjINqZV345XIs97qoTzviiEt3AfWWApaDD3F/CNu0P
	S3OQia49T07FpeXvk44RHsXzpuC8szZrv0jwVrkk5pBNVrCGoJzKJ1TnWYCAfsM/TnQA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phzPX-008vzA-NE; Thu, 30 Mar 2023 23:02:19 +0200
Date: Thu, 30 Mar 2023 23:02:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next 05/15] net: dsa: mt7530: move SGMII PCS creation
 to mt7530_probe function
Message-ID: <96be4399-5e62-45b2-afc3-3702465b4348@lunn.ch>
References: <cover.1680180959.git.daniel@makrotopia.org>
 <f8f157ca470ffb54c03be821c72478b2563a1106.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8f157ca470ffb54c03be821c72478b2563a1106.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_140221_035093_E8C8FFA9 
X-CRM114-Status: UNSURE (   9.04  )
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

On Thu, Mar 30, 2023 at 04:21:09PM +0100, Daniel Golle wrote:
> Move creating the SGMII PCS from mt753x_setup() to the more appropriate
> mt7530_probe() function.
> This is done also in preparation of moving all functions related to
> MDIO-connected MT753x switches to a separate module.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

