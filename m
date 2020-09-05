Return-Path: <SRS0=aCep=CO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1F6C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 23:51:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB8BD2072D
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 23:51:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0lStUO+l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcGkCr4t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB8BD2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cULxzniudc+MGNs2cEMgO+PRsDN5uf3OjqeE4d/CmT4=; b=0lStUO+lHYldLxnKVXFtUcazE
	KIRIRJ3ZY0v7SANOpqriBv4sWit769qL9nR+4uqq0O2iGuwH5Jjj+5uOwaziUqoyN4ggfCw+TJpgg
	jihxWFLcPhBgziGifH0eYB/S3dOmseCSKapOuxXePkJbqoDG/CKEILPstS6t9rNs75ttDdo7CgGfL
	DHjGJulUaKOtkQ1lw/c0KNREYqy69mnVSQUVoE4rxefRn6+BXTtrHO4FxkUPlexSbMh05wK9evc1q
	9uccLbcqKYa71iD3xHnXlXUiVRkBlK1XzalQuqslhsLVjsTGhbAePF5+MWVY8D8JEpRZupj7Aoyqg
	pAzsM3eAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEhxP-0005Fz-H1; Sat, 05 Sep 2020 23:50:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEhxL-0005F0-1z; Sat, 05 Sep 2020 23:50:52 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2411B2072D;
 Sat,  5 Sep 2020 23:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599349849;
 bh=h0R4sF+5A4qwm1j7RZDzVqY8zeUBVfqPznj/PjB+chg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WcGkCr4t1aHtiLM2bweaw/TvLg1ZWv+tDICD8sUu3E2m4RaqIarx2DnPeOjVa1urZ
 lDJcH+vYwCyDVzHZGwXi0NtftkjtgUuddnMa3y6xealnrlMs0fMdi7/EV6k9GQJLBm
 81nAsgH8dEH01nbQBQpGx5PtLOpiXs1toeaMOg5Y=
Date: Sat, 5 Sep 2020 16:50:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v3 4/6] net: dsa: mt7530: Add the support of
 MT7531 switch
Message-ID: <20200905165047.32f94ae5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <63041b5c2c346b874e92761b3b3d6553106dde98.1599228079.git.landen.chao@mediatek.com>
References: <cover.1599228079.git.landen.chao@mediatek.com>
 <63041b5c2c346b874e92761b3b3d6553106dde98.1599228079.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_195051_474323_F433DC30 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, frank-w@public-files.de,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, dqfext@gmail.com,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, opensource@vdorst.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 4 Sep 2020 22:21:59 +0800 Landen Chao wrote:
> +static int
> +mt7531_cpu_port_config(struct dsa_switch *ds, int port)
> +{
> +	struct mt7530_priv *priv = ds->priv;
> +	phy_interface_t interface;
> +	int speed;
> +
> +	switch (port) {
> +	case 5:
> +		if (mt7531_is_rgmii_port(priv, port))
> +			interface = PHY_INTERFACE_MODE_RGMII;
> +		else
> +			interface = PHY_INTERFACE_MODE_2500BASEX;
> +
> +		priv->p5_interface = interface;
> +		break;
> +	case 6:
> +		interface = PHY_INTERFACE_MODE_2500BASEX;
> +
> +		mt7531_pad_setup(ds, interface);
> +
> +		priv->p6_interface = interface;
> +		break;
> +	};

stray semicolon

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
