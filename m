Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3CECD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALxu45xu13GhaDzSJpduPtJv/caKy8w0oIUIS4mfKn0=; b=U94Pe07f8yTllrbe5AZGV/VYMU
	h/g69MRiK6FJeUbE+odMa6I50V9u/G/gBgic7Yf64ZG1raTE85b0ZjjIuQHLKenkT+imQE6izfnDI
	B+t4kEGWO2kq+St2+wqLkNZI/EyDtIA5tCboPhy+sUJ7TNO6b1rR8FhJc+6y+cksurK2YpSZS0ugr
	9miXUVMYvDHrsbU5iVLSByNb145wuT7L/Jq5BxgVyHYD/klgM08z5lFabQhVRinHC1gWabYsikhVB
	V1eg0y5gmtXtlXNwDItgg+3U+4U1NsSgTo5e/JhWjpGalqPUyetD41oMy1J+c66ib1f+eYvYsaPDs
	FAKrWG7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmc0-00000003l8Y-0Grh;
	Wed, 04 Sep 2024 09:47:40 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllxH-00000003aJP-3BPR;
	Wed, 04 Sep 2024 09:05:37 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sllx9-000000004Br-3pNB;
	Wed, 04 Sep 2024 09:05:28 +0000
Date: Wed, 4 Sep 2024 11:02:11 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v10 11/13] net: phy: add driver for built-in
 2.5G ethernet PHY on MT7988
Message-ID: <ZtgiE64iusrjPKSp@pidgin.makrotopia.org>
References: <20240701105417.19941-1-SkyLake.Huang@mediatek.com>
 <20240701105417.19941-12-SkyLake.Huang@mediatek.com>
 <ebeb75a3-a6b1-46b3-b1e8-7d8448eb23f6@lunn.ch>
 <c21fe0db83dd665d4725ffedc51db9063dbe2f3d.camel@mediatek.com>
 <38189661f30032715783e8860318fe9e50258e47.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38189661f30032715783e8860318fe9e50258e47.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_020535_816471_B5037685 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
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

Hi SkyLake,


On Wed, Sep 04, 2024 at 08:49:50AM +0000, SkyLake Huang (黃啟澤) wrote:
> 
> Gentle ping.
>

Please see issue reported related to your patch
"net: phy: mediatek: Extend 1G TX/RX link pulse time"

https://github.com/openwrt/openwrt/issues/16281

Using the newly introduced .read_status function apparently breaks things.

Maybe we can apply the rest of this series first and then discuss the
problematic patch (which may need fixing) after that.


