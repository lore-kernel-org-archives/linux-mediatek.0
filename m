Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D70C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 16:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzL1Q2+7WDC/g3DuLtI+wo+3VqWALiuVF8iASl1uPEU=; b=CtrcsJOIkJA8ZrD1/Y12F2qrkv
	PTtWotSHtchIxtvyeX+WohutflPIKXHM4gLgSMwAAkoPXugBxFkUsN0AjpWt3IWIrhVJ61HFL2noR
	gR5jqqDWICqaqjcX1A6k4ACV0ieOIky2rIzNuOSlwwziOrNtaX0HPpkAG6uLRbII/DGqZmT94Q6ku
	IxFYAFanbVNdts6lJJ+KhPMCqMTuGQHYFUlv9yGftjedyosqG42cdY32nmefaLCmsYJOhMQUTkC6H
	yZ5ZIp+jRrPup+Sqx3fLX0I/wptdMySpSWUl397jhQGoAGP83/LWAe9oasP5hIeMw7UI5mYJBfrAf
	wpVDbPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEYk-00000005OnY-075Q;
	Fri, 10 Jul 2026 16:58:42 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEYh-00000005OmZ-1P1S
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 16:58:40 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c96c92c0980so684608a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 09:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702718; x=1784307518; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UzL1Q2+7WDC/g3DuLtI+wo+3VqWALiuVF8iASl1uPEU=;
        b=cG9xzzpNjVKpu/TiI9YfSh7CPStxQUQ9MksdIePoiUt1acrugSM0Xq61s4vDKFSMVs
         vuxuPAs2H8GRIGbW0pJ774YN7NWJ6YYz3EX66qcaiWSJg1kg9qkoRiLe6tW3SRxwJ8rG
         6adSg50rRcmIf94mgv2zR9SawIeCYwy8ZHF5Jk28yArw9h5egcs23Tye6mkJkCasp0qB
         u1dKos5XRcKcMWyblaFig6ydxqmyuT8oiSeTWlnBo/LvpanEF8v545j67vimD4nZ4OEq
         F7qycHKpjcLIXHrd30JmUix77EMzomBoeZX1ZtpBW1a2hNnvwoP1b1inUKdLcEMkYxNK
         mIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702718; x=1784307518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzL1Q2+7WDC/g3DuLtI+wo+3VqWALiuVF8iASl1uPEU=;
        b=T6s8jqtfuwcq8FtyTWBSqkk9pAyla0wNRrxJuQWidVw/I1/Latp/TJlg0XxL2cFny+
         tTHYsD82aOBh83RRSNNJb/8yvORsi0xgEx5GTFUmnIyEL8LB39BSa1NbA+a6Nu5AuNGZ
         ujLl1OfIYdx03mJXq9tGYELFHf9TMAz88ZMg/M57htTmF49nvbQRQbcdpazdGzvUZHIv
         EzNQwDH1AVSezjH0NtTgI0DeHk/lKQm5JicsirdGv7KIP2/oQ4yMmZdEURaBYKWQKVkX
         NnJrkRR9nq5q1e8+wF2CnUhU1qMU7wlwuNo6lJYP9I5FQIitgY6bTp1awJKEXOQo6Lqq
         rZVw==
X-Forwarded-Encrypted: i=1; AHgh+RpvwqI1WAx+dBrQfI3bSwNU/e7TEhB0v2dI6iO5e1pWr1zP4Bz1tUT8ij2M2TfR+BZWzlx5T0upneCrLgEXXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvnhS0Oos7txIH2ZdwHkC3zwjRnUHftfCWaihL9zYPFS/rtOFW
	yDdqhlGHHCw6V+96+ECE4yHnL8uh82B7uyBDU9bVdoO+yOmR1iWhHofm
X-Gm-Gg: AfdE7cmZKJ0E5k8Ue1Mv0Aqqrx+iB2UIdO70aaf7qIjg1RRV6CYR6zhVnE1oW1u0JKU
	HMMRfqjXWC5Lo11hMs2CRgKNcce8B2vn6pOqax1wkYv+zzHDLO68yPJsuP89zmBLS++LjZOFD+B
	tuw7/W4RJEYnPyr9xv37ibSzvGvsBsgrpK4HNF5FeKF/UvAq/JKnhjFceTfg92DpS2Dpunt2STB
	PlKCbwjCQcgfVbVxuz5dbpHpVUq9GL/yc3RLplMdw28C50S7swLlSHFRajtCa/5DMko+2HVmD2S
	8MNI7ARrIxj0Qyk69tCeU7zaKL5JlVLwd8skwen6WA34SojmHHR6sn2RkE6pxtsD8T4zFQ6M7O0
	dA8d+HJxhVq6Gy1m53f7kp4OkXA9TTWDqQpcVUghLYTtH0zys9lsdAaEREgw8pCHZaDevjcLdWK
	mNLSfB8KLxtPf0OKJAk1TBESFgh8IVAZZNDV+6o8Y=
X-Received: by 2002:a05:6a21:1bc3:b0:3bd:4698:e7c4 with SMTP id adf61e73a8af0-3c0bcb7f146mr13586972637.42.1783702718181;
        Fri, 10 Jul 2026 09:58:38 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f72a6sm48876196eec.1.2026.07.10.09.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:58:37 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:58:28 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ahmed Naseef <naseefkm@gmail.com>, netdev@vger.kernel.org,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] net: dsa: mt7530: add EN7528 support
Message-ID: <alEktKWsrriHdR40@DESKTOP-TIT0J8O.localdomain>
References: <cover.1783680864.git.naseefkm@gmail.com>
 <1865eaedef97e593ba608764c7390209cae85b30.1783680864.git.naseefkm@gmail.com>
 <f968d3fe-83dc-4b82-972b-0d4d477a1a52@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f968d3fe-83dc-4b82-972b-0d4d477a1a52@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_095839_395979_0757E556 
X-CRM114-Status: GOOD (  17.89  )
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

On Fri, Jul 10, 2026 at 03:32:32PM +0200, Andrew Lunn wrote:
> > +	/* The EN7528 LAN GPHYs advertise EEE by default, but negotiating EEE
> > +	 * with common link partners (e.g. Realtek GbE NICs) results in an
> > +	 * unstable link with dropped frames. Disable EEE advertisement on
> > +	 * them.
> > +	 */
> > +	if (priv->id == ID_EN7528)
> > +		for (i = EN7528_GPHY_BASE;
> > +		     i < EN7528_GPHY_BASE + EN7528_NUM_GPHYS; i++)
> > +			mt7531_ind_c45_phy_write(priv, i, MDIO_MMD_AN,
> > +						 MDIO_AN_EEE_ADV, 0);
> > +
> 
> The problem with this is, you can still use ethtool to enable EEE.
> 
> Please look at phylink_bringup_phy(), where it calls
> phy_disable_eee().

Thanks, you are right , the register write is the wrong approach.

While looking at phylink_bringup_phy(), I noticed that the mt7530
driver sets config->lpi_capabilities but never config->lpi_interfaces.
Since

        mac_supports_eee = mac_supports_eee_ops && lpi_capabilities &&
                           !phy_interface_empty(lpi_interfaces);

that leaves mac_supports_eee false on all mt753x ports, so phylink
already takes the phy_disable_eee() path for every port and
phylink_ethtool_set_eee() returns -EOPNOTSUPP. On the EN7528 I
confirmed "ethtool --set-eee lan1 eee on" reports "Not supported", so
EEE cannot currently be enabled from userspace on this driver at all.
That looks like it unintentionally undid the "EEE can now be enabled
using ethtool" behaviour from commit 06dfcd4098cf ("net: dsa: mt7530:
fix enabling EEE on MT7531 switch on all boards"), starting with commit
9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE"). That
is pre-existing and outside the scope of this series, just flagging it.

For the EN7528 the GPHYs report EEE capability, but the link stops
passing traffic once LPI is entered, so EEE must stay off regardless.
The register loop cannot express that to phylib, as you noted.

My plan for v2 is to not advertise lpi_capabilities for the EN7528, so
mac_supports_eee stays false by design and phylink disables EEE on
these PHYs via phy_disable_eee() and refuses to enable it from
userspace. Does that sound like the right approach to you, or would
you prefer it handled differently?

Thanks,
Ahmed


> 
>     Andrew
> 
> ---
> pw-bot: cr

