Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A02C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 19:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/9/kvKcBnbjLbCMecs3+ZfpAqoUPdBENEYsRUM7e44=; b=fX2YJy2cxm6oYBcAl36FKR1vzB
	omJaacFXGjcs74leVVF9z0UdOSTC5BaG5/ZG1p4UsLghWonwoIXuKowMWgv/Cqw1L7xhuYvQbqi4E
	5z0jgrDpBGZOavxRGuBTMzubHHesDt3+QiVQdDBVELf9u9+tteyuFZx5YKhMOkjpJy9Qrek7HzTv8
	Cd787wbKSp+GyB1JLSyJhrllsl4ofW04CYH9aUmNRDWSQk9XNVT1Lcc5yJZfyzPqSPXxJlH+1/1zC
	wpn1S3GKCE//8wCN9qsuP/CQehBXdmsqS/VjTpA6HUIor2ULUSRfbZvZBhlbcVpQQ0Xl7Ichfs66Z
	wz5aPdCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIoZ-00DNML-JZ; Wed, 01 Feb 2023 19:30:39 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIoP-00DNK2-Hh; Wed, 01 Feb 2023 19:30:30 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pNIno-00027L-0u;
	Wed, 01 Feb 2023 20:29:52 +0100
Date: Wed, 1 Feb 2023 19:28:11 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Simon Horman <simon.horman@corigine.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 net 0/3] fixes for mtk_eth_soc
Message-ID: <Y9q9S9AxdsYMti3P@makrotopia.org>
References: <20230201182331.943411-1-bjorn@mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230201182331.943411-1-bjorn@mork.no>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_113029_606040_231D35F2 
X-CRM114-Status: GOOD (  15.35  )
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

On Wed, Feb 01, 2023 at 07:23:28PM +0100, Bjørn Mork wrote:
> Changes since v4:
>  - use same field order for kernel-doc and code in patch 1
>  - cc'ing full maintainer list from get_maintainer.pl
> 
> Changes since v3:
>  - fill hole in struct mtk_pcs with new interface field
>  - improved patch 2 commit message
>  - added fixes tags
>  - updated review tags
>  
> Changes since v2:
>  - use "true" for boolean
>  - fix SoB typo
>  - updated tags
> 
> Changes since v1:
>  - only power down on changes, fix from Russel
>  - dropped bogus uncondional in-band patch
>  - added pcs poll patch from Alexander
>  - updated tags
> 
> 
> Fix mtk_eth_soc sgmii configuration.
> 
> This has been tested on a MT7986 with a Maxlinear GPY211C phy
> permanently attached to the second SoC mac.

for the whole series:
Acked-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>

> 
> 
> Alexander Couzens (2):
>   net: mediatek: sgmii: ensure the SGMII PHY is powered down on
>     configuration
>   mtk_sgmii: enable PCS polling to allow SFP work
> 
> Bjørn Mork (1):
>   net: mediatek: sgmii: fix duplex configuration
> 
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 +-
>  drivers/net/ethernet/mediatek/mtk_sgmii.c   | 46 ++++++++++++++-------
>  2 files changed, 35 insertions(+), 15 deletions(-)
> 
> -- 
> 2.30.2
> 

