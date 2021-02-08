Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B798DC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 06:35:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42D9664E61
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 06:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42D9664E61
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xdv/LXzqrvaDOugrALGSY1wcLWZ1bcb3mvyEdV+87+U=; b=KQN/dDng4SuX2aPHvzU0tvcmX
	XH6+eR+q//pHOEpbyABOhQxuZXeZa8cnRx3QEgPAqiQ2nwDN7NCAEeWvM+At9/zocShBt/zhpPhfo
	7REP29dRr9+2Y0nTmYG1e+N+Z8w9wlrPLgcrc0ot/T6zkX/ojSoqVkhNJK323Qm1i3o3Clgi1dv4J
	Zhkt9M+aLQzufa5GVSf8h39XU4NjrAiDjofMRPmiu4d4J2w3AfXoyjfZWTOlKCHya8986pTfWy6y1
	/cdFPLMGg+zPrhEfZifQeNkZrwuHxBSroKBKu9IA4g+oA7YjSh96HZSYc+jC+2PE/jL50l3+htrUb
	ed+PHT69Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9095-0007Yo-5E; Mon, 08 Feb 2021 06:35:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9092-0007XM-Km
 for linux-mediatek@lists.infradead.org; Mon, 08 Feb 2021 06:35:37 +0000
X-UUID: eebda6ca0de741ffb38a3e99e74fe51d-20210207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3N9rRASFzxmeOt/wKztN0VIoYEGnGsamx+GlAqJh9+4=; 
 b=GUGSnm/9H8jEaAidO3sdb9qdvwlFwyjmwO+0edSlA1nQh7eH+Q/ntAg0t/zf675jEsMG42KldyEJaThQlZIz5IyMSzvLFTgRXQFlpx+4PZcq+a/SUl69oQoDMoMDaI8mCnVoh6sFLgSXwJVnLQZE00sCDge0I/X72nCWe0EWSgo=;
X-UUID: eebda6ca0de741ffb38a3e99e74fe51d-20210207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 212164258; Sun, 07 Feb 2021 22:35:29 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 22:35:28 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 8 Feb 2021 14:35:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Feb 2021 14:35:24 +0800
Message-ID: <1612766125.19482.3.camel@mhfsdcap03>
Subject: Re: [PATCH] MAINTAINERS: repair file pattern in MEDIATEK IOMMU DRIVER
From: Yong Wu <yong.wu@mediatek.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joerg Roedel <joro@8bytes.org>
Date: Mon, 8 Feb 2021 14:35:25 +0800
In-Reply-To: <20210208061025.29198-1-lukas.bulwahn@gmail.com>
References: <20210208061025.29198-1-lukas.bulwahn@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A293A2F4DB79585306E07C30A2048CADF97377D97F56478078E0BA17EB9CA5692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_013536_892561_C5962BEF 
X-CRM114-Status: GOOD (  15.08  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-02-08 at 07:10 +0100, Lukas Bulwahn wrote:
> Commit 6af4873852c4 ("MAINTAINERS: Add entry for MediaTek IOMMU") mentions
> the pattern 'drivers/iommu/mtk-iommu*', but the files are actually named
> with an underscore, not with a hyphen.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches  F:    drivers/iommu/mtk-iommu*
> 
> Repair this minor typo in the file pattern.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210205
> 
> Yong, please ack.

+Joerg.

sorry for the typo.

Acked-by: Yong Wu <yong.wu@mediatek.com>

> Will, please pick this minor fixup for your iommu-next tree.
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 674f42375acf..6b507e8d7828 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11200,7 +11200,7 @@ L:	iommu@lists.linux-foundation.org
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/iommu/mediatek*
> -F:	drivers/iommu/mtk-iommu*
> +F:	drivers/iommu/mtk_iommu*
>  F:	include/dt-bindings/memory/mt*-port.h
>  
>  MEDIATEK JPEG DRIVER

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
