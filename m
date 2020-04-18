Return-Path: <SRS0=rNmj=6C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE13DC38A2E
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Apr 2020 12:15:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92618206B9
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Apr 2020 12:15:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E6+R+806"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92618206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5O12a7bjS205miFRivvZspaMQ8FF21Sjnx7g4YfXpbA=; b=E6+R+806NcszK1
	W3WdCVtvFAnpM822Rp5zZiyMLzAphqOTHcneF9s8d+VKfr0zGoFenfhlxrWI2we9jsxMkHFkswgzd
	7eobvwMIKuumdvPmKXgNP7TIE4PNKB5SgdHVMga5zl01ili/frZHzY2r8WDgFiiA8nzk56Qjk7h8m
	EbYN80a1r8f7M47IKd3mreqBib/h8tpm3pzXNb5Oo5Kab+LJQeaL1tp4lfRRVaZkgiG8ksbbvnmIu
	n0aQgWb+f5OhDPccblAJwLCDXluXMtgSvC92JodL3C0n0exZHxslbBV2xRNkRvwEZCiElZM1b1YPy
	9bBf1FwbHlNJtjS0h+6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPmNd-0003Je-NE; Sat, 18 Apr 2020 12:15:29 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPmN2-0000PB-Sc; Sat, 18 Apr 2020 12:14:54 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BFDE4342; Sat, 18 Apr 2020 14:14:41 +0200 (CEST)
Date: Sat, 18 Apr 2020 14:14:40 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] iommu: Fix MTK_IOMMU dependencies
Message-ID: <20200418121440.GC6113@8bytes.org>
References: <20200410143047.19691-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410143047.19691-1-geert@linux-m68k.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_051453_085155_BE9F16C0 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 10, 2020 at 04:30:47PM +0200, Geert Uytterhoeven wrote:
 
> Fixes: e93a1695d7fb5513 ("iommu: Enable compile testing for some of drivers")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/iommu/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
