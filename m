Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B72CCAC598
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Sep 2025 09:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jQzjfISWXhmjsCWqCbC/EKcBa3nhvEnsbsmWDiienE=; b=rNSTRRrSUEx16pNJx4AKpF0yVe
	LTGrNuzprOh++cX+sEw+ZyaZhY2zh9kvcJZW8AnTZE9MB9TzbYAO7JtgPw6jN5Z5zZdKk13QA/uIC
	MM7xtaIIGW9X5FoN1qsp3DE1/QUqRbl19zK/5HaKIk/OJqbySl6hOhaRnDasRrtKAT0T1jF/OM1nd
	btEFGFWkvA0MopuqyBfBptYNDFuTcFoFiDxiGALAS/WKups0OCsf4Ziq2cHoNeyUrcPpGmdCPruKU
	XV7KiOKow4GuDANgudLj2wMF5OLdaP7DbYnBuyAORsMywdTnLV0JSuO5UmfbI+WKaz10vbObjIZ4J
	K1kihXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoeb-0000000Ap80-3aZG;
	Wed, 17 Sep 2025 09:40:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyoeY-0000000Ap6I-3SwP
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Sep 2025 09:40:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4619eb18311so4093385e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Sep 2025 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758102041; x=1758706841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5jQzjfISWXhmjsCWqCbC/EKcBa3nhvEnsbsmWDiienE=;
        b=kctD+yQ64hwZleyqUyx4VqQcWCSlf/3JrIDaYYWz0kf/HGvwkOTLEUIJa2HnpCg1Qv
         KVTZvzCQD6dT14EZ5OikNICLtQUGYeVfIWObxdQE0s7FSll+TUrman7fOS2ZcGbwkfnx
         nc4BojK36TO/o1+WXxoInEDO9J/SCJBnU9GLB15upjyOTip0vL4eXYYUwkOFGoXixwrG
         wG2hM7RUKtOdJXATok8YHjb4LTGgMApd7CUmW+/HWNLjTnj3SP0aPuuZ53pS6W+5NKbb
         TBBsUtn6WSGp7yKg+9kh2Pjlyg+bGZOqhZAe2aBINnuLWvqEZX34jb3wUGGqct7nDP3y
         84Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758102041; x=1758706841;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jQzjfISWXhmjsCWqCbC/EKcBa3nhvEnsbsmWDiienE=;
        b=rUnMeL4/VoJrIgRV4wEO29F3i4/Hw7DUl4P3EWgtXRyfK6anx6pNqsl4YH6LEugYRx
         Bx2SHW49xUf3SmyRQ0r8Wfhda7CtrA5Cpz6GpmsN1BXofazYT3tHLzMvNSXvpPMSeGGn
         8/X0v5GgdmkHiFASczCAH2uVMDA+nYWF0Qt92Rv0XI9TkJ31bKYLg4flV2+wMKGWPLgc
         msPWe81rp7dJgnwx6GrHJ6BdPdW0t81awBPSRrb446aob6MHFlqlSqCatijoJ3A9E2mv
         9aIOq207gW6hBbKeHHqtT7r5p9CsoCoKZoJvsmmz0mBhtDnxmUZcZcEI9p2WX7MlLMBa
         0CiA==
X-Forwarded-Encrypted: i=1; AJvYcCVHvg0iQI2bvYkj8l9i0Oop97BHFd2XmGCHtHz2BVhvBapRNwO5y2/w4CHI/tANE84HlXd9ff0YBm87Iit0Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf3I+ONydMtpTsu5NtUWHdtlkU0H5ZLGxf4ok+BKVpvMZ8juzt
	PJBpv8BslpM+sFDUgaeT4/m930DK/4nTm/uT2K2KKvKbfxNl1J2g/pGb
X-Gm-Gg: ASbGncucfsl87N2gvIum04nDGc4jI+JdWJO6GXkBzkvRZasf2eWYOrdtPArDMaaeUkU
	ZwZmFwMAvOGCIMJwDiR/vPQj4DFZ1HAOWuxTJX/YW3fD5vZEwkJU0rbxIrBAC2JO6uaEvX+Z+7O
	+xn7yaEdzDvexYoQJL8jbuQd0hYJK6/5h5v0B3k3aEF57LSO9K4/I0fEC0dt1WDi+D6Dp/oEi3/
	49tlnOtxEALWCCEEanpn39EEUZmlGXvZKGknZevkiPBXzwqNsb56qBpZlIrpZhsJmYT+NSUoGTN
	h50fXUIdu7i3k1jmu/5uTtPFYMGUtJsHXKrxdAJT5M9KYm1UWh8GMEh3y2aZvL5WtkIDX+ATcQn
	U3SA9slJEXeLczIt9K61J79e3cfObD723vkDOEyLXrA4e4Z4A+WyE0pmW+lKbvUuegHD1lw==
X-Google-Smtp-Source: AGHT+IG1Z5gfPhstZ8Qe0/f0tZQDFllaZrwj1CdOj/WzkKpXcRN9xT6g090i2kZL7HUgri/YALYN1g==
X-Received: by 2002:a05:600c:190e:b0:45d:d9ca:9f8a with SMTP id 5b1f17b1804b1-46206655f96mr10607395e9.27.1758102040358;
        Wed, 17 Sep 2025 02:40:40 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613eb27f25sm30833585e9.23.2025.09.17.02.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 02:40:39 -0700 (PDT)
Message-ID: <68ca8217.050a0220.81571.9fda@mx.google.com>
X-Google-Original-Message-ID: <aMqCFMC3zeBPyOCQ@Ansuel-XPS.>
Date: Wed, 17 Sep 2025 11:40:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
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
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250917092807.uui2qwva2sqbe6sp@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917092807.uui2qwva2sqbe6sp@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_024042_906416_8466956C 
X-CRM114-Status: GOOD (  25.60  )
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

On Wed, Sep 17, 2025 at 12:28:07PM +0300, Vladimir Oltean wrote:
> On Mon, Sep 15, 2025 at 12:45:36PM +0200, Christian Marangi wrote:
> > It's conceptually similar to mediatek switch but register and bits
> > are different. And there is massive list of register for the PCS
> > configuration.
> > Saddly for that part we have absolutely NO documentation currently.
> 
> Please add in the next revision a more convincing argument for not
> reusing the mt7530 driver control flow. Regmap fields can abstract a
> lot, and the driver can select a completely different phylink_pcs for
> different hardware.
> 
> I don't see in the short change log included here any mentions related
> to the mt7530, but I'm not going to search the mailing lists since Nov
> 2024 for any previous discussions about this...
>

Ok will add additional info.

But In short the FDB and VLAN part are very different. The FDB logic to
dump entry add and remove is entirely different.

And the mt7530 itself is full of unrelated function (specific to the
first revision of the mt7530 switch) so I have to move lots of code
around.

If asked I can do it but I have to also introduce lots of extra change.

> Also, let's try not to reach v20.. Please try to collect a full round of
> feedback from people who commented before when submitting a new version,
> pinging people if necessary. You want to make sure that their previous
> feedback was addressed.
> 
> > TEST: lan2: Multicast IPv4 to joined group                          [ OK ]
> > TEST: lan2: Multicast IPv4 to unknown group                         [XFAIL]
> >         reception succeeded, but should have failed
> > TEST: lan2: Multicast IPv4 to unknown group, promisc                [ OK ]
> > TEST: lan2: Multicast IPv4 to unknown group, allmulti               [ OK ]
> > TEST: lan2: Multicast IPv6 to joined group                          [ OK ]
> > TEST: lan2: Multicast IPv6 to unknown group                         [XFAIL]
> >         reception succeeded, but should have failed
> > TEST: lan2: Multicast IPv6 to unknown group, promisc                [ OK ]
> > TEST: lan2: Multicast IPv6 to unknown group, allmulti               [ OK ]
> > TEST: lan2: 1588v2 over L2 transport, Sync                          [ OK ]
> > TEST: lan2: 1588v2 over L2 transport, Follow-Up                     [ OK ]
> > TEST: lan2: 1588v2 over L2 transport, Peer Delay Request            [ OK ]
> > TEST: lan2: 1588v2 over IPv4, Sync                                  [FAIL]
> >         reception failed
> > TEST: lan2: 1588v2 over IPv4, Follow-Up                             [FAIL]
> >         reception failed
> > TEST: lan2: 1588v2 over IPv4, Peer Delay Request                    [FAIL]
> >         reception failed
> > TEST: lan2: 1588v2 over IPv6, Sync                                  [FAIL]
> >         reception failed
> > TEST: lan2: 1588v2 over IPv6, Follow-Up                             [FAIL]
> >         reception failed
> > TEST: lan2: 1588v2 over IPv6, Peer Delay Request                    [FAIL]
> >         reception failed
> 
> Do you know why it won't receive PTP over IP? It seems strange, given it
> receives other IP multicast (even unregistered). Is it a hardware or a
> software drop? What port counters increment? Does it drop PTP over IP
> only on local termination, or does it also fail to forward it? What
> about the packet makes the switch drop it?
> 

From what they said there isn't any support for 1588v2 (PTP) on the Switch other
than L2 (that I think they simply forward)

I can ask more info on the topic, will also check what counters
increment.

> > TEST: vlan_filtering=1 bridge: Multicast IPv6 to unknown group, promisc   [ OK ]
> > TEST: vlan_filtering=1 bridge: Multicast IPv6 to unknown group, allmulti   [ OK ]
> > TEST: VLAN upper: Unicast IPv4 to primary MAC address               [ OK ]
> > TEST: VLAN upper: Unicast IPv4 to macvlan MAC address               [ OK ]
> > TEST: VLAN upper: Unicast IPv4 to unknown MAC address               [ OK ]
> > TEST: VLAN upper: Unicast IPv4 to unknown MAC address, promisc      [ OK ]
> > TEST: VLAN upper: Unicast IPv4 to unknown MAC address, allmulti     [ OK ]
> > TEST: VLAN upper: Multicast IPv4 to joined group                    [ OK ]
> > TEST: VLAN upper: Multicast IPv4 to unknown group                   [XFAIL]
> >         reception succeeded, but should have failed
> > TEST: VLAN upper: Multicast IPv4 to unknown group, promisc          [ OK ]
> > TEST: VLAN upper: Multicast IPv4 to unknown group, allmulti         [ OK ]
> > TEST: VLAN upper: Multicast IPv6 to joined group                    [ OK ]
> > TEST: VLAN upper: Multicast IPv6 to unknown group                   [XFAIL]
> >         reception succeeded, but should have failed
> > TEST: VLAN upper: Multicast IPv6 to unknown group, promisc          [ OK ]
> > TEST: VLAN upper: Multicast IPv6 to unknown group, allmulti         [ OK ]
> > TEST: VLAN upper: 1588v2 over L2 transport, Sync                    [ OK ]
> > TEST: VLAN upper: 1588v2 over L2 transport, Follow-Up               [FAIL]
> >         reception failed
> > TEST: VLAN upper: 1588v2 over L2 transport, Peer Delay Request      [ OK ]
> > TEST: VLAN upper: 1588v2 over IPv4, Sync                            [FAIL]
> >         reception failed
> > ;TEST: VLAN upper: 1588v2 over IPv4, Follow-Up                       [FAIL]
> >         reception failed
> > TEST: VLAN upper: 1588v2 over IPv4, Peer Delay Request              [FAIL]
> >         reception failed
> > TEST: VLAN upper: 1588v2 over IPv6, Sync                            [FAIL]
> >         reception failed
> > TEST: VLAN upper: 1588v2 over IPv6, Follow-Up                       [FAIL]
> >         reception failed
> > TEST: VLAN upper: 1588v2 over IPv6, Peer Delay Request              [FAIL]
> >         reception failed
> 
> The same thing happens with VLAN too...
> 
> > TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to joined group   [ OK ]
> > TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group   [XFAIL]
> >         reception succeeded, but should have failed
> > TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group, promisc   [ OK ]
> > TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv4 to unknown group, allmulti   [ OK ]
> > TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to joined group   [ OK ]
> > TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group   [XFAIL]
> >         reception succeeded, but should have failed
> > TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group, promisc   [ OK ]
> > TEST: VLAN over vlan_filtering=0 bridged port: Multicast IPv6 to unknown group, allmulti   [ OK ]
> > TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Sync   [ OK ]
> > TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Follow-Up   [ OK ]
> > TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over L2 transport, Peer Delay Request   [ OK ]
> > TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Sync   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Follow-Up   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Peer Delay Request   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Sync   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Follow-Up   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Peer Delay Request   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to joined group   [ OK ]
> > TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group   [XFAIL]
> >         reception succeeded, but should have failed
> > TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group, promisc   [ OK ]
> > TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv4 to unknown group, allmulti   [ OK ]
> > TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to joined group   [ OK ]
> > TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group   [XFAIL]
> >         reception succeeded, but should have failed
> > TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group, promisc   [ OK ]
> > TEST: VLAN over vlan_filtering=1 bridged port: Multicast IPv6 to unknown group, allmulti   [ OK ]
> > TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Sync   [ OK ]
> > TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Follow-Up   [ OK ]
> > TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over L2 transport, Peer Delay Request   [ OK ]
> > TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Sync   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Follow-Up   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Peer Delay Request   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Sync   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Follow-Up   [FAIL]
> >         reception failed
> > TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Peer Delay Request   [FAIL]
> >         reception failed
> 
> And over bridge ports...

-- 
	Ansuel

