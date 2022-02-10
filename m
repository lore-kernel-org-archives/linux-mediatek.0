Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DFAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 01:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiw+VHLS0OqPcLFQSVvGr55W1zS5EX6S41kNZ5ytx9E=; b=L/55Na3Rpk/0aa
	pIUakPiWA5oqqKZ4+hID2ca6TAY8/sp8D5r7qLpY5lNA4vUtdDtDtwJeZsJAzTiTFYEiqmARWXYrG
	GaXKlo5olKOPVYU2ktF5zHPnk9w3UjNV/MI1MQw47xCve/bM3drXq6CimX5+Ib9TB75IGopbi1ZWa
	sBpW+JY9p84KhnMl+8kl+HZ/DOBictGlBTaWSMroqyWguW+pdt6Wcqnv7vAQTP5IusDpUo4wBVf4w
	EmZpFaUOzhvAtqBJjHQTVo31tiLpX/4sjeawvY0Z4j+IwV7vxjtua9lhr0Ne01JdV2Tah3op1pgFK
	nBDTooSGqfjZxhnitnIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHyDe-002BEk-FU; Thu, 10 Feb 2022 01:25:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHyDS-002BBQ-Ie; Thu, 10 Feb 2022 01:25:48 +0000
X-UUID: 63cb7a5ffcb5437dbab26f9dcb15f1df-20220209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mdt9PZcBoM4WlKcvMhc8oJZ3ZxPpigbucXSBDz4i0y0=; 
 b=oMrcgD52mBNQG58l25s5HC/zAIETvgAbGYbcFi/OcEEJrX2/ACdM5TGWx5xVjRpLF5SqVm2xAnHz+JH1MLHIuVYevdneBXoq/gqedVL4q7IGhtMiWYT2Q2+dI9+oWQmUTzAIVJF1BUNYlfXnbc03g+T5kw8tWCglV0J/BwGrfuk=;
X-UUID: 63cb7a5ffcb5437dbab26f9dcb15f1df-20220209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1182894618; Wed, 09 Feb 2022 18:25:41 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Feb 2022 17:15:39 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 10 Feb 2022 09:15:38 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 09:15:37 +0800
Message-ID: <2707120457e962a78e3c4ffd231ca25a7138ae72.camel@mediatek.com>
Subject: Re: [PATCH V5 0/3] Add compatible for Mediatek MT8186
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 10 Feb 2022 09:15:37 +0800
In-Reply-To: <YgO+pXPtptHCQ9Zu@sirena.org.uk>
References: <20220209014443.12443-1-leilk.liu@mediatek.com>
 <YgO+pXPtptHCQ9Zu@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_172546_639981_16CDD397 
X-CRM114-Status: GOOD (  13.27  )
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

On Wed, 2022-02-09 at 13:16 +0000, Mark Brown wrote:
> On Wed, Feb 09, 2022 at 09:44:40AM +0800, Leilk Liu wrote:
> > V5:
> > 1. re-send these patchs based on v5.17-rc1.
> > 2. add the flags: "Reviewed-by Rob Herring".
> 
> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.

Sorry to ignore the applied mail before I sent this new versions,
thanks for your reminder.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
