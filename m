Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3025FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 09:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iMBphw13KTQLLQRfUG/2Q1TsUUh89Ar5EYrCCnD96k=; b=IYQvbGxkjaXlbiZVDtBF1V+z7R
	ue1p8wTNqgQnX0Q9RFl+1Uo+dY/pVR1uYXWMCmy9yQ2pcwXjbc3+Ec4/LM2KwPM4hF1Ph8FhLqYBp
	4m65cNBXBrMi6h9jAVRrJrar97uJPfAtYJdaDzBneI3ZsD8eS86Taq7nUzuT8iu4q7KHQOi+wibAH
	u06K3oZDMAaPMS1as2uv5G335stNtPfJ+VSfmSfn+Uc2TSfaRyYDJY/KH2RC2ukkPidNvyAMkSDn3
	B+23eVcImNTCBWG6l2KSKRfOsB3hMt4piQ6drXOQZ5E2Ch730bkf6n+SxamXIUqmzW2TS7440H3GI
	fJ1WCrBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnvS-006dIc-Bt; Fri, 21 Oct 2022 09:02:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnvG-006bxK-W8; Fri, 21 Oct 2022 09:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4iMBphw13KTQLLQRfUG/2Q1TsUUh89Ar5EYrCCnD96k=; b=wh3/gEmC9mepUk1fTEqfrqlJEy
	7LxX5iGvzCultd99ss4GAQLzu47Tznnc1PQKPA+dLeQQ1U/2J0eqEGdpKKoAMVIlGBtg41DJUL7cD
	kcASAQQfNiEmBACrIMYPnPdNwR1cusbIry2QS08ZHAZiCmSloL5Ym4v98A+J/P1nkT590E9zRlIua
	25f64/PnDS4f9cbTgmeBIOoleCgTLQcVqfoLRA/XV0olSiogHasssrNWEnijciwmDoNXVvTVafw+/
	lA7mEPSANpOChXuPjPHmwwrtNfqsNiOMwW05rDG0nm9rCzYooiOCisTqROtT2k8ckMA2rME1CHzYi
	1ZAZ8JSw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34854)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1olnt7-0008PG-Jd; Fri, 21 Oct 2022 10:00:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1olnt2-000421-4a; Fri, 21 Oct 2022 10:00:16 +0100
Date: Fri, 21 Oct 2022 10:00:16 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y1JfoAD8NxvvR8+6@shell.armlinux.org.uk>
References: <20221020144431.126124-1-linux@fw-web.de>
 <Y1F0pSrJnNlYzehq@shell.armlinux.org.uk>
 <02A54E45-2084-440A-A643-772C0CC9F988@public-files.de>
 <Y1JJEtvra2F3JGQS@shell.armlinux.org.uk>
 <9E91B812-8687-463D-8B98-3C4BF26CBE08@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9E91B812-8687-463D-8B98-3C4BF26CBE08@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_020235_100312_E75F69AE 
X-CRM114-Status: GOOD (  12.94  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 21, 2022 at 10:41:22AM +0200, Frank Wunderlich wrote:
> Am 21. Oktober 2022 09:24:02 MESZ schrieb "Russell King (Oracle)" <linux@armlinux.org.uk>:
> >On Fri, Oct 21, 2022 at 08:04:51AM +0200, Frank Wunderlich wrote:
> >> On my board (bpi-r3) we have no autoneg on the gmacs. We have a switch (mt7531) with fixed-link on the first and a sfp-cage on the other. Second mac gets speed-setting (1000base-X or 2500base-X) from sfp eeprom, but no advertisement from the "other end". Imho it is always full duplex.
> >
> >If it's a fixed link, then this function you're adding won't be called.
> >It's only called for in-band mode which is exclusive with fixed-link
> >mode.
> >
> >-- 
> >RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> >FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
> 
> Right, i get this trace for the second mac which is without fixed-link because of in-band-managed for sfp (read speed settings from sfp eeprom).

So, you need to set state->duplex to DUPLEX_FULL if this is what the
hardware is actually doing.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

