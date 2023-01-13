Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553D6C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcM3UhmX4V8KSyZnY4nAAwUPvIj1NLjz7lmQqW/RSPA=; b=BSaST8OuahAWy+KqFy19HpmCiG
	bhmU65uCOfoTpekrVIZy+9ACRsUvuHUgKg1QsICFvtc/hXAGEHmLz0Q4tahav1AoZHu3GYPyLKBKM
	9oz/BUFCcMpvDzm6KazSH+eLgnwDr3sr0Aoj3gfNjn5KHJYfiDfUSxcN9kQOY3tKddKy472C9Mw1M
	LgkpjOn3YR3OMUbKqgNmXtfYi3/AnTNJSvl+pAJG2KtFAiCmmi9cUz36IHCI+Fgvo8FjoWfLDhjbx
	1ek2mfHnMsmJP9A+TAdH1NCmY5i3gaaQVLRHRImFgnj12lrlX8/6MFZD0oqjXVgAjl5+Nk8L9Mmfx
	XgIk5jfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGJPI-002b3Z-Jl; Fri, 13 Jan 2023 12:43:40 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGJP6-002azI-1F; Fri, 13 Jan 2023 12:43:29 +0000
Received: from 8bytes.org (p200300c277327f0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7732:7f00:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B52F6262340;
	Fri, 13 Jan 2023 13:43:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1673613806;
	bh=eAedM8kUpXf74wYVvw3sbi954tDx1WJVtgDncIaNFq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XVvCfrEHbJJBmS+tx4zrgb9AW8hqb3KqzWWGZhf+kizYzwhSaHILZZ/w1IEqVvKUs
	 82Rr7nw9/Otg4eeV2II5Z9XkfRJmtC29LfRYGbj27HUMzIj8AvZNt73Va4e1sIB6gp
	 ILFTXXLcLI3dtOoRv6zB98XtnvJsdlmRzsilsXQ967oY0BTT5m7wSt4bu5D1HC0aQP
	 CPEVAOZTMabLxz8YfwGCGRjLf2evCsYlQoYq7c6OSoOcWgIGErvmPQEiQ8zKQ1qgR0
	 UAJaYXMH1gSjXdgjKyYu81pur7zkCA6vmnQ/VxYOESwQb7c8uUyghiz/VlACimGvfi
	 06u70PnpsuPEg==
Date: Fri, 13 Jan 2023 13:43:25 +0100
From: Joerg Roedel <joro@8bytes.org>
To: yf.wang@mediatek.com
Cc: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"open list:IOMMU DMA-API LAYER" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	wsd_upstream@mediatek.com, stable@vger.kernel.org,
	Libo Kang <Libo.Kang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
	Ning Li <Ning.Li@mediatek.com>,
	jianjiao zeng <jianjiao.zeng@mediatek.com>
Subject: Re: [PATCH v2] iommu/iova: Fix alloc iova overflows issue
Message-ID: <Y8FR7U8YaDrIF62d@8bytes.org>
References: <20230111063801.25107-1-yf.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111063801.25107-1-yf.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_044328_325366_6BFF7015 
X-CRM114-Status: UNSURE (   8.53  )
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

On Wed, Jan 11, 2023 at 02:38:00PM +0800, yf.wang@mediatek.com wrote:
> v2: Update patch
>     1. Cc stable@vger.kernel.org
>        This patch needs to be merged stable branch,
>        add stable@vger.kernel.org in mail list.
>     2. Refer robin's suggestion to update patch.

Applied for 6.2, thanks.

