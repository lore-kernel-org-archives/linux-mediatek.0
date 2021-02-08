Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA3DC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 08:13:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37F0C64E6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 08:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37F0C64E6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oDAgkoit3zkN8P/7dKE2qJJOCcbTEzqNIk6EtK6wQB8=; b=LGkJca85zYS3IDO/DaVJKfxST
	uAuus81/1x4qY1zZ3KAEGeLDulErPEJjqz03ry5bjNtR8RWLZhBcWcQqRHnKG+kVoByMFhGi/6aH2
	7R4agI7jCDfv9NsDuHymGpL55+pl37UwbFJDOioV1MuWHR6iB+UmIsxUIhpIMR062kbB27o06wnOt
	LxjU/Cd0HmDDfIPsHpWWdbVDItNO9mZCJr9VqwrzX/e6TrCFy3BXb5XF4riQW6hicCzFOn1vWHK39
	JItxBDGlzYUl+ep8PiwYqrBknq1agHSFD54xNqKZXhhdJmsqLOPRVUMSacPcFOf1wgX6xwe2ez2QM
	R8BIB6zWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l91fO-0007LZ-44; Mon, 08 Feb 2021 08:13:06 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l91fM-0007L4-BJ
 for linux-mediatek@lists.infradead.org; Mon, 08 Feb 2021 08:13:05 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 596013A7; Mon,  8 Feb 2021 09:13:03 +0100 (CET)
Date: Mon, 8 Feb 2021 09:13:01 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH] MAINTAINERS: repair file pattern in MEDIATEK IOMMU DRIVER
Message-ID: <20210208081301.GB7302@8bytes.org>
References: <20210208061025.29198-1-lukas.bulwahn@gmail.com>
 <1612766125.19482.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612766125.19482.3.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_031304_505774_287C9480 
X-CRM114-Status: GOOD (  16.61  )
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
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 08, 2021 at 02:35:25PM +0800, Yong Wu wrote:
> On Mon, 2021-02-08 at 07:10 +0100, Lukas Bulwahn wrote:
> > Commit 6af4873852c4 ("MAINTAINERS: Add entry for MediaTek IOMMU") mentions
> > the pattern 'drivers/iommu/mtk-iommu*', but the files are actually named
> > with an underscore, not with a hyphen.
> > 
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> > 
> >   warning: no file matches  F:    drivers/iommu/mtk-iommu*
> > 
> > Repair this minor typo in the file pattern.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on next-20210205
> > 
> > Yong, please ack.
> 
> +Joerg.
> 
> sorry for the typo.
> 
> Acked-by: Yong Wu <yong.wu@mediatek.com>

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
