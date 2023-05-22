Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD02C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=651D4ohYtQknTVaxAMakIwgxn7KJAKAe8JKeLAL3saY=; b=OEa/fnyp6rj87D4D+JWm3bwwuP
	KmExoBsXtAYu7te5ddfUwk0QuNnv/Q7wk7TD4gCZu3e+S0D4uwt2L8TU8HEfblmdxUy65/JTWabPb
	Zwo3r04qd3TRjxnJ5FG5h2ndWT7TOWrAU9X7zHwtZuDEjqV573AF8A8RJduRexpyPifEkOFk7bf7/
	KLSGS9hDvmFeTOVncbGmbtqOLT1ITRfBmjLvck1Aco5jti7E90jB2s3wkWIvWTlM2NA006MZIhpOT
	l22bUwtA8MWoq6z4okqtXmZZTuPNTiTdwJiX1QBtvfQoXmidyHP91vsWG3AZueKYZkJrPhC5DBWL8
	q8Qzxfdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q16E6-006mIZ-3A;
	Mon, 22 May 2023 14:09:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q16E1-006mGQ-2A;
	Mon, 22 May 2023 14:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684764566; x=1716300566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=K0m/oZc3q6u8X83PstBBAycwqKcivROxc9wp0fTYirM=;
  b=sqDibpIsqxStGXgJAYrhdu4FKhsLXzazciYJanHF3cgfBsdgVamcLMUs
   wAAX5uQBp8nJyvA18tWjP0PtZnUDbBEtHBpuedMwMDjq+o21TQbAceLX4
   bWU/BNJA5bhRrAQG/DmY+9qYl/CmrtYH/g/uNI92jbbI++4V5fSnSfvDY
   4641Zc7ynHKo/CQL4GoIp0ZP0CKpL6elDt/14sZrcR5xbHU3f0zlCgN3b
   lrWNNy7aiebOkgB/HworLuGSjPYVKpjeDqQzsj6Ojlj/QoZYBu0ZwukvS
   F8DFygV+mXp2wXF+ufdAz1S73rUP4pkcumLAhhGY9xx7eOhkt3hzQqYnV
   A==;
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="214927953"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 May 2023 07:09:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 22 May 2023 07:09:18 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 22 May 2023 07:09:18 -0700
Date: Mon, 22 May 2023 16:09:17 +0200
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <arinc9.unal@gmail.com>
Subject: Re: [PATCH net-next 00/30] net: dsa: mt7530: improve, trap BPDU &
 LLDP, and prefer CPU port
Message-ID: <20230522140917.er7f5ws24b2eeyvs@soft-dev3-1>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_070925_735795_D65AF18C 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The 05/22/2023 15:15, arinc9.unal@gmail.com wrote:

Hi,

> 
> Hello!
> 
> This patch series simplifies the code, improves the logic of the switch
> hardware support, traps LLDP frames and BPDUs for MT7530, MT7531, and
> MT7988 SoC switches, and introduces the preferring local CPU port
> operation.
> 
> There's also a patch for fixing the port capabilities of the switch on the
> MT7988 SoC.
> 

I have noticed that in many patches of the series you have:
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Where you also have:
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

I think you can drop Tested-by as the SoB will imply that. I think you
got a similar comment some time ago to a different patch series.


-- 
/Horatiu

