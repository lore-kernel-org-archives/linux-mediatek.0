Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2309EC433C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 14:46:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3D7F619A9
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 14:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3D7F619A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aWdTkfum5fUD0UIkq7FsIq6eSWfPWGJ1u+JGJuvVbSE=; b=ku/8AwUIoazVGyj0NLSPiNGKZ
	lrmeN1zPuLaTR51mTT8DTuwBKjOt+hxiZuQEL8boASgX0QgKpCw0MKaMyhlyU2xcuTnsSjVpei5y6
	LhyAv8BOmeTfqifFCUDite5Izy1HaZdk0TkRCPwbU2upzdbYCPNakUYv5qOx8fBvSn5UADNiYZCVC
	WI/QL8WXF0VghDE9pnvIhw+gALngcQ9x8Ocf6EvlQIVVlXMiJc1THpX3R4uKL9tx7iHlOLObXaY7t
	RBshz/0PvZHCgm60NBRWWvGL52LKmkrobHeB0j+RJvOl45VgLRzWSN47p0y5SwqmkKwSCjOarl2AD
	BcNBkuZvw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQACb-005C6E-Vq; Sat, 27 Mar 2021 14:46:14 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQACR-005C5U-B7; Sat, 27 Mar 2021 14:46:06 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lQAC8-00DLHu-FL; Sat, 27 Mar 2021 15:45:44 +0100
Date: Sat, 27 Mar 2021 15:45:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next,v2] net: dsa: mt7530: clean up core and TRGMII
 clock setup
Message-ID: <YF9FGJmH/b5BMHQC@lunn.ch>
References: <20210327055543.473099-1-ilya.lipnitskiy@gmail.com>
 <20210327060752.474627-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210327060752.474627-1-ilya.lipnitskiy@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_144603_475535_5094E47F 
X-CRM114-Status: GOOD (  13.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 26, 2021 at 11:07:52PM -0700, Ilya Lipnitskiy wrote:
> Three minor changes:
> 
> - When disabling PLL, there is no need to call core_write_mmd_indirect
>   directly, use the core_write wrapper instead like the rest of the code
>   in the function does. This change helps with consistency and
>   readability. Move the comment to the definition of
>   core_read_mmd_indirect where it belongs.
> 
> - Disable both core and TRGMII Tx clocks prior to reconfiguring.
>   Previously, only the core clock was disabled, but not TRGMII Tx clock.
>   So disable both, then configure them, then re-enable both, for
>   consistency.
> 
> - The core clock enable bit (REG_GSWCK_EN) is written redundantly three
>   times. Simplify the code and only write the register only once at the
>   end of clock reconfiguration to enable both core and TRGMII Tx clocks.
> 
> Tested on Ubiquiti ER-X running the GMAC0 and MT7530 in TRGMII mode.
> 
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

Thanks for moving the comment.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
