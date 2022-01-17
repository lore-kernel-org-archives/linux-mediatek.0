Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1064C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WYXrttazpRA9YmqHGUCHE8ByhdVSfnA0QVW+SuntkvM=; b=GvMeA5r3rv6yMr
	x2oBB3GGzGc4rZZriXlHZ4dI/K51C2kjYEOaZytI3C1o7KbTzi28+ZmH3f3biHmHwezIQcyYYOfIW
	8G0f3T436N0kipk0HZORzjgF6bbwRod+/cMAOg5talDcAbUg9zIm/D7+aAwVwuxUzmrGU06QTjBEz
	N9O2jReUModJdkf5kWykZP3sgqFN4NFrEkePjB3o6Hbay7whDmhEfVcgNGEN1Xgl/R9pD5UGK6dn9
	0W+VDJYMb21G7AfnlF3JN6mA5bxkm0R1II905G7dLY/ITUhdzOn4k2s9FpyvpL+K5WEBEPxVGS4uA
	Io5Go2sRiiqRiymFULYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9NQX-00E4Qe-Nz; Mon, 17 Jan 2022 08:31:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9NQV-00E4Ox-Qe; Mon, 17 Jan 2022 08:31:45 +0000
X-UUID: 8fcde6dc4f814fd28edeeef2b739275b-20220117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4h8rypqWIwwluDWBclX35RTaohbQNkowObVextLcY2g=; 
 b=lC+wdZsMFTyx0LFVx/S79ZqTWLmyKsvNezFm+kQD372I4ZOTTGw9JuAIKyKeh+P6XilT7RKDUYQZByrplSOQRiQ59wIIIhxs8Qbgu3akExymBwAXX5tI5SlLFekY/saI9bhrZBARObgIXwmmgZROSDVav33mOeA7JJhQL1kiWPM=;
X-UUID: 8fcde6dc4f814fd28edeeef2b739275b-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1917176044; Mon, 17 Jan 2022 01:31:39 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 00:30:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 16:30:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Jan 2022 16:30:25 +0800
Message-ID: <efc06609571d7b6a1d5327fa37661af8ddce8675.camel@mediatek.com>
Subject: Re: [PATCH 2/3] mmc: core: Add support for SDIO async interrupt
From: Axe Yang <axe.yang@mediatek.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 =?UTF-8?Q?=28=E4=BA=95=E6=9C=9D=E5=A4=A9=29?= <Chaotian.Jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Adrian Hunter
 <adrian.hunter@intel.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery
 <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao
 <tiantao6@hisilicon.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>
Date: Mon, 17 Jan 2022 16:30:25 +0800
In-Reply-To: <60f3d381-1af4-d002-e179-9550672dae5b@mediatek.com>
References: <20220117071220.17330-1-axe.yang@mediatek.com>
 <20220117071220.17330-3-axe.yang@mediatek.com>
 <60f3d381-1af4-d002-e179-9550672dae5b@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_003143_914148_AE84F192 
X-CRM114-Status: GOOD (  15.80  )
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

On Mon, 2022-01-17 at 16:14 +0800, Macpaul Lin wrote:
> On 1/17/22 3:12 PM, Axe Yang wrote:
> > If cap-sdio-async-irq flag is set in host dts node, parse EAI
> > information from SDIO CCCR interrupt externsion segment. If async
> > interrupt is supported by SDIO card then send command to card to
> > enable it and set enable_async_irq flag in sdio_cccr structure to
> > 1.
> > The parse flow is implemented in sdio_read_cccr().
> > 
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> 
> [deleted...]
> 
> It seems the prefix "[PATCH v3]" didn't applied to subject of each
> patch 
> in v3 series. Please remember to keep the version aligned in the
> same 
> patch set. Use "git format-patch --subject-prefix=[PATCH v3]" to
> help 
> you to keep the version number aligned is suggested.
> 
> Thanks!
> Macpaul Lin

Patches have been resent. Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
