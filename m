Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268DBE77197
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2025 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3Vv9Ii4oAyb2xBXKP796hUiYRnbIlEgJVRU6r0oeJ4=; b=QAPxrbDq3GO34dNpFmpyvcxr6P
	hFoPXZ5eSO03D9ZQEI0laYalI+KGUkt5gP+rD4F7BbkbPMRfmC/FTz4zuwkStJX9l8s6iKf3+/P/4
	NliCWv2HK1UKt1Pozku1L7W+tZh+knKsrU7NKZf5gv5hrSzxkoHRRfoN/LZU4qcAmq4/gvgFt5zgG
	3yZG88BwYbRiJUQgB8bvqjmk9Q0UxKIhNoOP1bMgcyMqMSBL4TvmLMq626VEG1o57Gkc30YJlbg1X
	wQGe/UxBeTa5CRUVxZ7Ic2CyYbi+pr1K9Y8u0PG/jCBpSFR2tb95s8OJvjnGVRuF8TZvvy8pyIpIH
	LsHONKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9es-000000050T1-0t3z;
	Tue, 07 Jan 2025 13:30:10 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9bY-00000004zxA-3WNC;
	Tue, 07 Jan 2025 13:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=I3Vv9Ii4oAyb2xBXKP796hUiYRnbIlEgJVRU6r0oeJ4=; b=EDja036ZoNSxV1Bflk1hEMKrwv
	l0MQhjpbFvH4DGCtNaEnCqBfs6+ja+sdJ1+3MFUfHdGSYEMEM7+COya16k8YkTYHFpea2P28anFtG
	g4Lm82NEcjog3dGCM5Mq1W8AwefLmTkWSOhDaxRexOJgqBfG0zlG2lox8z8tCa4GCMVc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tV9bM-002Est-OJ; Tue, 07 Jan 2025 14:26:32 +0100
Date: Tue, 7 Jan 2025 14:26:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
Message-ID: <a5beb529-5769-4310-b6a4-0ddccd85caf1@lunn.ch>
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <Z30pMSxDn-R3Cy5S@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z30pMSxDn-R3Cy5S@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_052644_874929_9F447A37 
X-CRM114-Status: UNSURE (   8.46  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, bridge@lists.linux.dev, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> The PCS doesn't support in-band status in 2500Base-X mode, or at least
> the implementation isn't compatible with those RealTek PHYs.

Is one or the other not actually 2500Base-X, but SGMII over clocked?

Overclocked SGMII cannot do in-band signalling. It could well be the
PCS is 2500BaseX, but the PHY is over clocked SGMII, and so the PCS is
not seeing the in-band signalling it expects, so never reports link.

	Andrew

