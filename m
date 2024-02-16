Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C8DC48260
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 14:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffVQGH5CO6yIqhVHc9e6LaPuxYvvX/e38K9CHTgFpqU=; b=bEQVxzh0am+CXLlarF20snHoSN
	0VCql3N46C70WKD85i65QzLeZj9vVfmbDe8naMPGNg6lvOxzhygLL/ic7Opxovchpzs/WbIV5HlFZ
	31hOTVQG8yJf7xPX+9ye4/TUb9MQKLsZUlpjW58swzV8Wob/u1y8ZWxPvthgFWALmlKhPyUQ6Zor1
	KXWU/IMWBUdBvoyf0N3ZXj5oWweOOGWBP0wfT7rMnmkEJE9iRdSQRu12svQZ+IscYmD8W4gS8Lek0
	gCJsGKoWxUCZcxKFDKPm4juL6J7wxzMEibHD2M1ATKnWOBRXZN7WZ67IR+lKy6f9SwF4kHcrnHDEv
	hzvQQjEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raz39-00000002aat-48OS;
	Fri, 16 Feb 2024 14:18:47 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raz35-00000002aXw-41XA;
	Fri, 16 Feb 2024 14:18:45 +0000
Received: from 8bytes.org (p4ffe0c3c.dip0.t-ipconnect.de [79.254.12.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 2F8731C462F;
	Fri, 16 Feb 2024 15:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1708093120;
	bh=SZZOeJbM9IqCNRzXyb/vtXg4j78a3vQTIUylqLxTqTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bn2HfMIHDvH9l7V2fAjwpcG0c0/NmPWKIJH52PiBhofcHz6e8hQkwUtugapU8ixfY
	 nw1ZuEJanOj9/S2F+ygKSJmWhnMUU5vpY6iaIQKy5d4z3KtgYfybLAQHIXlLnXbecG
	 pdPSOZGYcFyNvyJ9pOQgyeqr1cZpPe0hdE1MZfV5VDKM0oSChLnSlbo8z7ClQiVjvB
	 KxZqriHWB9+QO3em1KHwl9W4qG96QuAMSckuNhohjqeofGvIR9ZnefA0HH+U4lXzed
	 fBy1Q+i5J6tZGSFiwmhr3rnb42eUik86OjtG7GZI/FTHiPnz6+dfDSWS8f0HTnrQPb
	 2aF35QAc5aPvQ==
Date: Fri, 16 Feb 2024 15:18:39 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Erick Archer <erick.archer@gmx.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] iommu/mtk_iommu: Use devm_kcalloc() instead of
 devm_kzalloc()
Message-ID: <Zc9uv4smFRfzf_mY@8bytes.org>
References: <20240211182250.12656-1-erick.archer@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240211182250.12656-1-erick.archer@gmx.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_061844_163459_F887E655 
X-CRM114-Status: GOOD (  10.70  )
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

On Sun, Feb 11, 2024 at 07:22:50PM +0100, Erick Archer wrote:
> Link: https://github.com/KSPP/linux/issues/162 [1]
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [2]
> Signed-off-by: Erick Archer <erick.archer@gmx.com>
> ---
>  drivers/iommu/mtk_iommu.c    | 2 +-
>  drivers/iommu/mtk_iommu_v1.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

