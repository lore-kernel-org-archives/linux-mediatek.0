Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404D9C369AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 21:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7rwXNV08/b3CnAP5VnLNtMdejwjJLT3vXYXbvK5dIE=; b=qTEgD/i8pUpljaXUzxlvqpqGjH
	Fc+pf1tbGihPy35e/sww4pGdvePplvh7PAWkqhstgO4oT7UUwEKgsxT1Qszt9DB4wVrYQ1uahZxKr
	1LiWQBn6SaZ2aIxqfIHs4/F3RjLx8AmiPfRFoiUMhCO4oCqax0tBWUwtOJEEj8fQSKB5bHm4ISBLv
	EGo6V7PflEeeadKHafl8hh4uvTYWCth0F3gXL1xcwawUS1NQz8srQ/6WZGv95mWtdQIooQeQBAYuL
	Pjj3SPQH/15zm6TrziU6ZSgAktJher8wq+UJBOExu6V5smRRKB3JikA/z4y0xug4ITnzEZ1FQEjrW
	t4Z63jTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yx9-00000005D4d-17tr;
	Mon, 21 Apr 2025 21:45:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yr2-00000005CDS-411s;
	Mon, 21 Apr 2025 21:39:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD1415C58E2;
	Mon, 21 Apr 2025 21:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67671C4CEE4;
	Mon, 21 Apr 2025 21:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271543;
	bh=P2gkcD2TmU3ybW+EhTsT1VxrzyAL10mA2MoDChIYdbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=REQsm3pHvLmRf1crBuCTuGBW/4rGeoNYksLlAiB2UaXbWzMNDtlGaYEEZrAqQU1TP
	 dH+/W7fSGorv6qmw7bujZapB6k2W27fFfqZKmgPqphHZ37NGCs0l3SEi2XS3AU7wwK
	 yjuZd+7m7ssJBicv8yrt+FSSbJT7NGkWbo9Ro9PJTzAP/wqDU6GtVt963sda3eAUWK
	 JzXzKu7I0yTUznNKg78zpVUFwaLMuBv9tJJd2LQpztnGgNvHzNXWX53GYfgLwfxPFJ
	 YM1o922lhyYReBdqaWc4Ja5dzVP3DhTncHSNElvKnDncfLBcC1EOdeIVc+j2ZTjfbT
	 EDZ2kANJnZyHg==
Date: Mon, 21 Apr 2025 16:39:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, kernel@collabora.com,
	krzk+dt@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, linux-serial@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: serial: mediatek,uart: Add compatible for
 MT6893
Message-ID: <174527154119.2973427.10851570873227553140.robh@kernel.org>
References: <20250416120241.147925-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120241.147925-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_143905_049858_8E4C2A57 
X-CRM114-Status: UNSURE (   8.26  )
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


On Wed, 16 Apr 2025 14:02:41 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Dimensity 1200 (MT6893)
> SoC, which UART IPs are fully compatible with MT6577.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


