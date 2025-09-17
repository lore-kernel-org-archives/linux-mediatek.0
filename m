Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608C4CA0EE8
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Sep 2025 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o12PIdH5jrLINYaBDIAtrFJQyb2acUWsg9n32mRR/5k=; b=0d162PKr8evo/VPFZBxxI1kb4M
	GtVTW4KgzBWM3+fkWwvRcy2bsbR1VP1SORGRKr0NkMF/Vlt0IP/Yp0GL/axfZdSaAJZnKnR4iN/mr
	yEUJdzD2/LO2dUyZz+GptrGV6Lge8LALeZZUaYzNS45Tycjlw+MYMIPKB+n78D31XZiaBI3de5bcg
	SXtY3UbFVZ4wcBU4yKKqwSvOtDQWJrSMzT14Sc1nbcdaiDVJsF8kg5tFXBOs1WpsOwy/51XYtv0N9
	S2pQNLkKMmGNz+ywHJsbQ8J4VX6OWSGuH7JeZYPaItf3fXfVaWhoQgSYT2znumhpyDb4oz+ATegPx
	do7BMO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoSW-0000000Aml5-3eU9;
	Wed, 17 Sep 2025 09:28:16 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoSU-0000000Amji-2uRt
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Sep 2025 09:28:15 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aff17215facso93340566b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Sep 2025 02:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758101292; x=1758706092; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o12PIdH5jrLINYaBDIAtrFJQyb2acUWsg9n32mRR/5k=;
        b=EKh25laDAAlkn30yqYU5seB83W76m7r6hEufr58me/qwKqBnWx/KVxInE9ym2C35y/
         fKLj867S74oHkdDmAj+TJB0xYtAkKNNrLPTV1yy4j5T5ubueJUqc7nPLaA9wMW8KB0dI
         QhPYMAyWgAtok16+UgvC1KTwcAX5vC4VIQ8insQOv/MN67dg0nKDXTaf8T66ounqVYGd
         1cHufuHNEEDsayrc/vTv3J4MJu8mtTNfTcDFbRRbvrhoNyy9ecQUpbk4iwBK5kRPexNS
         5Gzs04ZL/zrkfbWoyn+qwWOvS3LCbU34xU9x8M62Mdt4iiVhDqVkSG3aQYkNKC6cdhuS
         UMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758101292; x=1758706092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o12PIdH5jrLINYaBDIAtrFJQyb2acUWsg9n32mRR/5k=;
        b=KA81NEh4533xj6Z3kYqb3209tGNAToTb0aXWksIxVVhutBpq3iuuQyj+PrScQ/wwDV
         CnGCxoiT1fj10HQeljqDkRQo/foK6iHU9+y0EwyzfspCb11L7Hwr1Ccg58849HfF7TeZ
         JRqY75Lm/j0oEHsqydb31ZXEPFWLkrQlTgi2MvhFZXTX1SMahsmbCr2NBhM76xL8CM66
         TJF7XNI8yzGHJhVT1EuNzCtD8QiBABEipqfSsU3YFszYa5eZZCXMit5SRgppTyvSWFch
         WI5dPI3jtZg3beW80x8JcVKgKu8eoSmjhalO9xBA6FC10trWKK77EYKXWIqS2b+OwbZR
         3UJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCp1A6AzscnZx3rYC0/6/Bp6W6kewkrJ0mmMjDWHXjKBGqamzFMRYIlNFryYdrub640lyfjlEdQ/jzZu+Fhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8iw47smcPDPG43KZA+pQmf/+Ue7up62Yu9IdCOXLAGroYJxC5
	LtRI6QsbvsgWS7INQ1vxH4dJNRBrBN+Ld+SyODsolhYVFVzXm8bBuNG6
X-Gm-Gg: ASbGncvuCxbNH/7ljVGEN+m2M2UA8JdUUcN4FCebl+odEFIVJpkSvFcuVfZwMmU4z68
	T+nig/vWXtzorVpTRGnphPX4WdPRkpC47PtIlUftzp8Qlxtm/sTf8W7Ad1M+y3HH3R8dTUvjQ9J
	mr21Fj4ghohRO/p5ivQZu50/NUi8N6xO6PUcDdRBv9nB1tlR+pW6LpXHc8hlHEon/KzV77xWwyU
	rMCe7RHinlqqqm2Mj0CkNA7DEViAkjWFCf404h4QAUgeDYcJPl8LnFV49+d1BKHmHqfk6LRfzFC
	UdHKn4vN9sWTFFnKEws/iD6XddzGdEGg3SpIy2n5OQabFEdOuKVjDiEZgzEiIifFwah2BD8H1TR
	tsY81qNDlCJUPLjM=
X-Google-Smtp-Source: AGHT+IHvszT87WzP63vcOaexO/pLxfMWcRX57JUYYOxi6z+V5togEaPi0QjDbwzVUWpwnuisJKwZww==
X-Received: by 2002:a17:907:7f9f:b0:b04:7b5b:850a with SMTP id a640c23a62f3a-b1bb5598e03mr85457666b.4.1758101292043;
        Wed, 17 Sep 2025 02:28:12 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:8bcc:b603:fee7:a273])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1c40fe2df8sm74103266b.18.2025.09.17.02.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 02:28:10 -0700 (PDT)
Date: Wed, 17 Sep 2025 12:28:07 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v18 0/8] net: dsa: Add Airoha AN8855 support
Message-ID: <20250917092807.uui2qwva2sqbe6sp@skbuf>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915104545.1742-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_022814_781685_B85ED24E 
X-CRM114-Status: GOOD (  15.01  )
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

On Mon, Sep 15, 2025 at 12:45:36PM +0200, Christian Marangi wrote:
> It's conceptually similar to mediatek switch but register and bits
> are different. And there is massive list of register for the PCS
> configuration.
> Saddly for that part we have absolutely NO documentation currently.

Please add in the next revision a more convincing argument for not
reusing the mt7530 driver control flow. Regmap fields can abstract a
lot, and the driver can select a completely different phylink_pcs for
different hardware.

I don't see in the short change log included here any mentions related
to the mt7530, but I'm not going to search the mailing lists since Nov
2024 for any previous discussions about this...

Also, let's try not to reach v20.. Please try to collect a full round of
feedback from people who commented before when submitting a new version,
pinging people if necessary. You want to make sure that their previous
feedback was addressed.

> TEST: lan2: Multicast IPv4 to joined group                          [ OK ]
> TEST: lan2: Multicast IPv4 to unknown group                         [XFAIL]
>         reception succeeded, but should have failed
> TEST: lan2: Multicast IPv4 to unknown group, promisc                [ OK ]
> TEST: lan2: Multicast IPv4 to unknown group, allmulti               [ OK ]
> TEST: lan2: Multicast IPv6 to joined group                          [ OK ]
> TEST: lan2: Multicast IPv6 to unknown group                         [XFAIL]
>         reception succeeded, but should have failed
> TEST: lan2: Multicast IPv6 to unknown group, promisc                [ OK ]
> TEST: lan2: Multicast IPv6 to unknown group, allmulti               [ OK ]
> TEST: lan2: 1588v2 over L2 transport, Sync                          [ OK ]
> TEST: lan2: 1588v2 over L2 transport, Follow-Up                     [ OK ]
> TEST: lan2: 1588v2 over L2 transport, Peer Delay Request            [ OK ]
> TEST: lan2: 1588v2 over IPv4, Sync                                  [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv4, Follow-Up                             [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv4, Peer Delay Request                    [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv6, Sync                                  [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv6, Follow-Up                             [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv6, Peer Delay Request                    [FAIL]
>         reception failed

Do you know why it won't receive PTP over IP? It seems strange, given it
receives other IP multicast (even unregistered). Is it a hardware or a
software drop? What port counters increment? Does it drop PTP over IP
only on local termination, or does it also fail to forward it? What
about the packet makes the switch drop it?

> TEST: vlan_filtering=1 bridge: Multicast IPv6 to unknown group, promisc   [ OK ]
> TEST: vlan_filtering=1 bridge: Multicast IPv6 to unknown group, allmulti   [ OK ]
> TEST: VLAN upper: Unicast IPv4 to primary MAC address               [ OK ]
> TEST: VLAN upper: Unicast IPv4 to macvlan MAC address               [ OK ]
> TEST: VLAN upper: Unicast IPv4 to unknown MAC address               [ OK ]
> TEST: VLAN upper: Unicast IPv4 to unknown MAC address, promisc      [ OK ]
> TEST: VLAN upper: Unicast IPv4 to unknown MAC address, allmulti     [ OK ]
> TEST: VLAN upper: Multicast IPv4 to joined group                    [ OK ]
> TEST: VLAN upper: Multicast IPv4 to unknown group                   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN upper: Multicast IPv4 to unknown group, promisc          [ OK ]
> TEST: VLAN upper: Multicast IPv4 to unknown group, allmulti         [ OK ]
> TEST: VLAN upper: Multicast IPv6 to joined group                    [ OK ]
> TEST: VLAN upper: Multicast IPv6 to unknown group                   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN upper: Multicast IPv6 to unknown group, promisc          [ OK ]
> TEST: VLAN upper: Multicast IPv6 to unknown group, allmulti         [ OK ]
> TEST: VLAN upper: 1588v2 over L2 transport, Sync                    [ OK ]
> TEST: VLAN upper: 1588v2 over L2 transport, Follow-Up               [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over L2 transport, Peer Delay Request      [ OK ]
> TEST: VLAN upper: 1588v2 over IPv4, Sync                            [FAIL]
>         reception failed
> ;TEST: VLAN upper: 1588v2 over IPv4, Follow-Up                       [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv4, Peer Delay Request              [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv6, Sync                            [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv6, Follow-Up                       [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv6, Peer Delay Request              [FAIL]
>         reception failed

The same thing happens with VLAN too...

> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to joined group   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group, promisc   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group, allmulti   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to joined group   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group, promisc   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group, allmulti   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Sync   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Follow-Up   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Peer Delay Request   [ OK ]
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Peer Delay Request   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Peer Delay Request   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to joined group   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group, promisc   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group, allmulti   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to joined group   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group   [XFAIL]
>         reception succeeded, but should have failed
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group, promisc   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group, allmulti   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Sync   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Follow-Up   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Peer Delay Request   [ OK ]
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Peer Delay Request   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Peer Delay Request   [FAIL]
>         reception failed

And over bridge ports...

