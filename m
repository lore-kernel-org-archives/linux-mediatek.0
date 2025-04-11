Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE90FC369A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Apr 2025 17:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFwYgEAgfgWuJ96eGXAJHDD2ZuU0FsgK1SbMZS09zUY=; b=tQ7gY4RxkEiqL5qX+rdU5T25mw
	h17RmYl2qfcYHjj5bOZOJ0wNP50ZWgohpHL/AERv/43xbjmIn4zLLQYnsyCBofFW6iWOt6UBq7D0L
	zKauQ3NBGq3ICosCbSz6sgUr8ATuSnNNHmkGlWLtOPhSc5TIbHFyi2CLwqo0PJ1NprWcRNGDL9DMr
	5/64SdOJndCsn5mXLYNu6ibbHzxKDFav6hxYxV/8Jf5i8al4wuBJ89a1ae9ajMQojWOM38U5U0Vc1
	0uZvL6s0UAqwgfdskv0BwaFhgOVQjmNRbrpwfcsba79MO1/7UW9Ng4uWtJrwTuL5scqCLmB0u5PgA
	AVlIS3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IDM-0000000EWzZ-3lSQ;
	Fri, 11 Apr 2025 17:30:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3I9o-0000000EWH9-1CcL;
	Fri, 11 Apr 2025 17:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 154B7A4AA1F;
	Fri, 11 Apr 2025 17:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF85C4CEE2;
	Fri, 11 Apr 2025 17:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392431;
	bh=lThX8yUtObxnNNdpSefIo+oWxDYTahO3dx8BUWqqSSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ladMjA1o8YRPWYkPOAPLpt8mxNrrxG70sZReilZORO7FmT9YqyKf7h27MgnCWGWWx
	 N0Y8qRktCjFX7YyMabYj7xd5MdrwTxUBPaxXcN4svKJVG+3me1cnUZXQ87EWOfjTu1
	 y7DI4GjOhouEO4wZ6ubGUOdiFrcWLRIQZgP/b7tHJw/8uyDfO4srt+Z2rooySBVr9V
	 kKd8kK3vw706rVXMgfJm9LHWN9CZ/mLplbLuGn419d4aGiMnt8CCWkdF2jahFetaqW
	 Pf7+igYe8Dx4w7u5gcellyE7Fh9cR6wpp66fzCqjUy0u1tXBqtZIpXbs2afGNT96FC
	 5Wm5R1i/4O2Lg==
Date: Fri, 11 Apr 2025 12:27:09 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, joro@8bytes.org, will@kernel.org,
	robin.murphy@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/2] dt-bindings: iommu: mediatek: Add binding for
 MT6893 MM IOMMU
Message-ID: <20250411172709.GA3571947-robh@kernel.org>
References: <20250410144008.475888-1-angelogioacchino.delregno@collabora.com>
 <20250410144008.475888-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410144008.475888-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_102712_390028_4DF4259F 
X-CRM114-Status: UNSURE (   8.97  )
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

On Thu, Apr 10, 2025 at 04:40:07PM +0200, AngeloGioacchino Del Regno wrote:
> Add binding for the MediaTek Dimensity 1200 (MT6893) SoC's
> MultiMedia (MM) IOMMU.

You can drop 'binding for ' in the subject. No need to say 'binding' 
twice.

> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |   4 +
>  .../memory/mediatek,mt6893-memory-port.h      | 288 ++++++++++++++++++
>  2 files changed, 292 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mediatek,mt6893-memory-port.h

Acked-by: Rob Herring (Arm) <robh@kernel.org>

