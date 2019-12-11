Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00828C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 14:10:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A776C214AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 14:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HZKvhYX9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WbANH9bY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A776C214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maxGkQlbs2IVzLOj0BBSztsNwtlv2R8xV1ousZcEAIA=; b=HZKvhYX9/ugytS
	xynujQLvX+Y3PZ/DNpptYblowy/tVFjRS46yAtdLR/7UpMxNzE/JFF5LWwCmGD4ZT1yaDpCnlYHMW
	47z8j0HxQG3iquHIT2xSr3bjNo6if22+X4M2aQdy+4OpCgrNVvPE6riL+g+7/ZuMU33qkuw7Kd4aM
	FaxeuAEdprjJuRzagaVHsg3sxuJxMYE7jz52FIA/Za/ub8uUsUxID83j5g1JkiahuG7DchdDR9UpO
	6ZtR925R9cKwNC1azpxxK3EX0wbVmFge175LuZb+UvvH5do/rWjCqAvLY4/0eR/oiUxr55wjcKL6B
	nuCBesj2pJXVSuCx1FZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if2he-0003cA-A6; Wed, 11 Dec 2019 14:10:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if2hZ-0003Po-MW
 for linux-mediatek@lists.infradead.org; Wed, 11 Dec 2019 14:10:56 +0000
X-UUID: 680b79b266174071a8052909c37ba592-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Axc6RlNHq3r5/GnAxxkyvJrrLbwxm4JZnBh/iubqg2g=; 
 b=WbANH9bYzqKU4Qs01Ukn8js+r5f8MbEjNt2YUOmrd+4dH1EUWHoeSRT23noh7xATcAUgWLA0dOpeNHH3ePSVC9qHWwXaczN1czCLKJrJyVlH2UuxGNiz7jkRrogCHYsyPgVjOVqQDdx5NbI5YWP9MN2xMuxagFE77qgsR4MXu6g=;
X-UUID: 680b79b266174071a8052909c37ba592-20191211
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 599044128; Wed, 11 Dec 2019 06:10:47 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 06:11:45 -0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 22:10:42 +0800
Message-ID: <1576073444.23763.11.camel@mtksdccf07>
Subject: Re: [PATCH net-next 3/6] dt-bindings: net: dsa: add new MT7531
 binding to support MT7531
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Wed, 11 Dec 2019 22:10:44 +0800
In-Reply-To: <20191210162010.GB27714@lunn.ch>
References: <cover.1575914275.git.landen.chao@mediatek.com>
 <1c382fd916b66bfe3ce8ef18c12f954dbcbddbbc.1575914275.git.landen.chao@mediatek.com>
 <20191210162010.GB27714@lunn.ch>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_061053_754844_A6127856 
X-CRM114-Status: UNSURE (   7.65  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource@vdorst.com" <opensource@vdorst.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On Wed, 2019-12-11 at 00:20 +0800, Andrew Lunn wrote:
> > +Example 4:
> > +
> > +&eth {
> > +	gmac0: mac@0 {
> > +		compatible = "mediatek,eth-mac";
> > +		reg = <0>;
> > +		phy-mode = "2500base-x";
> > +
> > +		fixed-link {
> > +			speed = <1000>;
> > +			full-duplex;
> > +			pause;
> > +		};
> > +	};
> 
> 2500Base-X, but fixed link speed 1000?
fixed-link speed should be 2500. I will update it.
> 
> > +				port@6 {
> > +					reg = <6>;
> > +					label = "cpu";
> > +					ethernet = <&gmac0>;
> > +					phy-mode = "2500base-x";
> > +
> > +					fixed-link {
> > +						speed = <1000>;
> > +						full-duplex;
> > +						pause;
> > +					};
> 
> Same here!
I will update it or remove fixed-link block as the discussion in dts
thread.
> 
>      Andrew

regards Landen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
