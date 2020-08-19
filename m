Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8638C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 08:15:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F8C20738
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 08:15:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="csQjOkhK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TTPgISsf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5F8C20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=idDhUVXxjc9evsxk3Bdw3k5zRP40ofqasjetfOVELz4=; b=csQjOkhKNhGWvuE/SRpL/p3t5
	N7CqUkGVgFUjwP6ZO48C8fAX6i4Hkafc2fGy+pNkVkpBsLYSEuMHkptDc0Exkv5uwNZBpVTEzDctZ
	OwLhPt2fb4tuQquGNtzZ+SbcQ1DtqjZ4xrs1ZFw+fVZbK3wN32fj/7kheaC2H+M7h4XWmbFUkLL8Q
	zcO9IxnonkDQtzLfsiwcEGGxO/6kRYcvnOr3PK7r6+G0rAZoEBDRRR5Q5PdDWkNH4OPlRhuTRbZcU
	U5QkSn/b8RlYqcLA0ZJW1u1d+XCDsT8BoBDBiJ6jVPJatNAwtJfoGsNCLMSR+IQdhGF9UxW3/By8d
	kZF5xEexQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8JFj-0007ec-Hb; Wed, 19 Aug 2020 08:15:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8JFh-0007dh-Lx
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 08:15:22 +0000
X-UUID: ba0809d2b066492597e51416d4076c62-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QpCVJ4N+EUwFvE449ymwTfmxve8XNAYqWnZtBe4BZEA=; 
 b=TTPgISsfpcHTz1wn1542ppt7yDvS+sigVRpJ5bnyIPjKgbZvQckjKEqQFWY69joUd6hFcgWcTrX7jgcOaUIugl1DySfb1Kh/+kGqCnoEfM9kPikQKN6+aaH87hQpnvRr0hWe5zigEsYI2WXGM4Pf4bRVmQQWJbXxXAlV8vBVJ4Y=;
X-UUID: ba0809d2b066492597e51416d4076c62-20200819
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2016469299; Wed, 19 Aug 2020 00:15:04 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 01:15:02 -0700
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 16:15:00 +0800
Message-ID: <1597824901.31846.42.camel@mtksdccf07>
Subject: Re: [PATCH net-next v2 7/7] arm64: dts: mt7622: add mt7531 dsa to
 bananapi-bpi-r64 board
From: Landen Chao <landen.chao@mediatek.com>
To: Vladimir Oltean <olteanv@gmail.com>
Date: Wed, 19 Aug 2020 16:15:01 +0800
In-Reply-To: <20200818162433.elqh3dxmk6vilq6u@skbuf>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <2a986604b49f7bfbee3898c8870bb0cf8182e879.1597729692.git.landen.chao@mediatek.com>
 <20200818162433.elqh3dxmk6vilq6u@skbuf>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_041521_909657_79A7A441 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "dqfext@gmail.com" <dqfext@gmail.com>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource@vdorst.com" <opensource@vdorst.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-19 at 00:24 +0800, Vladimir Oltean wrote:
> On Tue, Aug 18, 2020 at 03:14:12PM +0800, Landen Chao wrote:
> > Add mt7531 dsa to bananapi-bpi-r64 board for 5 giga Ethernet ports support.
> > 
> > Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> > ---
> >  .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> > index d174ad214857..c57b2571165f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> > @@ -143,6 +143,50 @@
> >  	mdio: mdio-bus {
> >  		#address-cells = <1>;
> >  		#size-cells = <0>;
> > +
> > +		switch@0 {
> > +			compatible = "mediatek,mt7531";
> > +
[snip]
> > +				port@6 {
> > +					reg = <6>;
> > +					label = "cpu";
> > +					ethernet = <&gmac0>;
> > +					phy-mode = "2500base-x";
> > +				};
> 
> Is there any reason why you're not specifying a fixed-link node here?
I got the below feedback in v1, so I follow the DSA common design in v2.
v2 can work with fixed-link node or without fixed-link node in CPU port
node.

  "This fixed-link should not be needed. The DSA driver is supposed to
   configure the CPU port to its fastest speed by default. 2500 is
   the fastest speed a 2500Base-X link can do..."
> > +			};
> > +		};
> > +
> >  	};
> >  };
> >  
> > -- 
> > 2.17.1
> 
> Thanks,
> -Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
