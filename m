Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6DEC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 23:50:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E1C64E7C
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 23:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3E1C64E7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hhu7zsMmgZ+cntYYmqmqbP1Z7S7bVb4/RWOqeedXEkY=; b=kcvmV7FRQT8QrH+bA9tMhnR6S
	fRS9nM33fqVqBN+maskfCsEWE58GkuuPyiqJmf6ThhyostfDzJhN8kjCcke8oNobQfD0T7gdvTq8v
	hMIVx4CXJGEQJETr/VS8EUz5t3OVFW8C1sCklevvmJwZOW/SThfyNy6F9ta3ZbgqGqIVOs1fR3+u0
	MgDNxhc8uZ8n9+zRN+rEhXa5aznLXA6xl63TVrzl/qEIaCtNNncxifHgXfIsXEGUXJhsJPBdY5L7u
	LCSyJ+SPUPhZEiG6HyymCoz8J+EHAJCIGaejRz96tm0nP5kXqqa4byjunM9A+8S2lOgvyDcttNXQv
	FMve8HFzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEhRF-0007B2-9y; Tue, 23 Feb 2021 23:49:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEhRB-0007A2-9r; Tue, 23 Feb 2021 23:49:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD3B964E05;
 Tue, 23 Feb 2021 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614124190;
 bh=mMfhtKCjG9wujFC2z7QhKXA24Yc4aOn4meW0ekujo7o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=u+vdvz7DVoKQVvutvpD21Not+T8X9M66uLchJcKVM8VuTEgYQ7j6wcu4ca8tZyutn
 Pk5r7HHXRRFmtouEvhuSrc2vVgcyRB69ya5x4qKDraZ+g77ls3emlAkJIf6LsmITyY
 Wj8zM3qp282sfUEpq452VMw6ikuZjSHmQwNkyIhANO8mmqtROK+xkCvCX5Z41RFIL7
 JCAFslnJvxn8np2pwOVtclLBGljKDG9+9dSHgqm2tyXCV3yb7jxJpL8EWyO8cIpfrk
 8362/fqZN5M2gDe7zvHGGca7XfH7XPIYWVvrnNH1dt03vHC9qML4xGeivvR/wvDDHZ
 nD99KiURNa0DA==
Date: Tue, 23 Feb 2021 15:49:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: support MDB operations
Message-ID: <20210223154945.7723cd35@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210222100717.451-1-dqfext@gmail.com>
References: <20210222100717.451-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_184953_496386_C5C32B8D 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 22 Feb 2021 18:07:17 +0800 DENG Qingfang wrote:
> Support port MDB add to/delete from MT7530 ARL.
> 
> As the hardware can manage multicast forwarding itself, trapping
> multicast traffic to the CPU is no longer required.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

# Form letter - net-next is closed

We have already sent the networking pull request for 5.12 and therefore
net-next is closed for new drivers, features, code refactoring and
optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after 5.12-rc1 is cut.

Look out for the announcement on the mailing list or check:
http://vger.kernel.org/~davem/net-next.html

RFC patches sent for review only are obviously welcome at any time.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
