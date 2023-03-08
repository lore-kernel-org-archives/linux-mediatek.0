Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF12C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 13:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TKxRu++VFoSSVqlF4KgFVHHMcvl3WVVlzCkMfcoDbI=; b=sStdj1m9sngnhM46KqCUzahVNs
	bdfSNxYg0xlPEmC3TY6xcTJewpM97fEU1q0yrwmNFGcg6LM48Wh1/437DwQ39HUw491j4RmLWIooZ
	v//EGvgfV0OhQ9/dRG7qL9Jbhgh/QMirtshiSSkRHuZzY6QrkmceRQqcLnV/ao8hzSjgfsrtEMmPK
	GLDqfURoMsqup1M8ID33yUHL8xz7jIgQ4ZBwCZGKaUHb2XFK2OApLXU+jTsH/5cys28I4erYqn44P
	fbsAFH1mpkdHU0chE+aIrWKKHOwMdy2S1sgCbWtBCIEheXcwvxvdwZ8U3X2+EpmTNu1eIhLLTy0aX
	8HOfjZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZu6h-005GHI-Du; Wed, 08 Mar 2023 13:45:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZu6W-005GDX-Ef; Wed, 08 Mar 2023 13:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8TKxRu++VFoSSVqlF4KgFVHHMcvl3WVVlzCkMfcoDbI=; b=cFBFBuPrdh5yUSCs7IuOyMl4U5
	Q9eFGeNXzXRR7h18kSyMjE3cduR06XKQqDNYTNB1+BRuM1GBcCK9AFqd6CZlsqbYO3sjAwm9Zju5A
	+0CiepYzRGtAHMtEMtQxOwUxwogqYqsTyzfk42mdM+m0aj3lcm1zp1DWjqCN/R2VLu0FGb8tivrBY
	CXzA1K2YNEV30WOxRnqBvnnGSlPnVdlYsfuxsKw3bUKgOS7PWDIf9VBbqHYMnky2Sy9bNn5rB+Z2B
	hY4bc1pqvV+j8CFBMtXXu71xHeEuWmKuBSgfO7WrzRe6Z4ELQTQDf9AkXXri/LPj6yvRdTvLC2H6a
	MLxSkwQQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50882)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pZu6F-0002e9-DT; Wed, 08 Mar 2023 13:44:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pZu6A-0002dH-CK; Wed, 08 Mar 2023 13:44:54 +0000
Date: Wed, 8 Mar 2023 13:44:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH] Fix Flooding: Disable by default on User ports and
 Enable on CPU ports
Message-ID: <ZAiRVnqMtqYQ7IGP@shell.armlinux.org.uk>
References: <20230212214027.672501-1-richard@routerhints.com>
 <6da6d5bf-be12-ec7a-58ac-a1a1cef23fd0@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6da6d5bf-be12-ec7a-58ac-a1a1cef23fd0@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_054516_511071_BFDC1DB3 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 08, 2023 at 04:34:11PM +0300, Arınç ÜNAL wrote:
> Richard, will you send a new patch series for this and your other two
> patches? They are essential for the port5 <-> gmac1 link to work properly.
> Without them, port5 as a CPU port won't work properly.

... and maybe detail exactly what the effect of this is.

For example, does it affect multicast frames received on user ports
being multicast to other user ports when they are part of the same
bridge device (which is essential for IPv6 to function.)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

