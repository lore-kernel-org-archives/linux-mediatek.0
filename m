Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CC1D46602
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 17:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7GrIqwzxCpF6eluWwlLxNym/KeQX4Z7034zY1qgjA4=; b=faTLAHqkVEuvBiZwbg33lUj5ib
	NcI9mo5ogBgOK1IAlyoGxoTpJC13AkPOlLQZUek92J7mABeLva+CXzA2vi63gN2MLwwi2l68b64pQ
	BnWTShmTbF7j10j3jAA38ajS04LmQEc1N001qruEy2IwW+jgp+VK1gn5Mtw/IINI6sYeitMzg2fO0
	GFy4cqNiiSBZs6+QVxLfGiTq2k5yUUCISlRN1+CrpJ+AqDXx7JW6Xh09T/De+Z9VcvGufs1c1PgKG
	GE0qx4/fzlltr+ISpZZLafCqnnsvKYkhiSiUOqJhphyKIZrVApStUp33pb53lmdsjTZAfJsWxVZdi
	X4zDso9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRCV-0000000CrLV-3JhJ;
	Thu, 15 Jan 2026 17:32:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRCV-0000000CrLL-0gpf
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 17:32:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9882F601B4;
	Thu, 15 Jan 2026 17:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F19C16AAE;
	Thu, 15 Jan 2026 17:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768498322;
	bh=UJ62QhE0z1mWbLKaTG/N9Ah90St5W9bIvVAyP2MRfsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agGaemDg2z5bX0VDV9+mHJ0JkmSVZm+6FPqby1ViSSmJbXMqaoObr8GfFye6k41y0
	 LJOuD6brvRsF0ZxKL31JQQ8XNAnGLePm87kIPjWn6M7n/DIdRIdAz+RWdSaCAyd8D6
	 K0U0NBvt0ot4PZ8kE6EZOxC+WgesXdSav4iCvD9HzzmTPdWVlZoOXeM00B6rCkL8AL
	 Eqz6L0hFhHhwLmBF9/EOguy8I+I5eu7v4WGGGMdX1K9Cu9N6/pYhuX93+D8aficW2r
	 aOSXPPpSD4Tlz5rlnvBWSFyw5rUaO32/JC2pv+8P3+djc6O4BfQc5BHD3WVxdwHj2a
	 zeuogLuE9JQFw==
Date: Thu, 15 Jan 2026 11:32:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nauman Sabir <officialnaumansabir@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: display: mediatek: Fix typo
 'hardwares' to 'hardware'
Message-ID: <176849832082.924193.1440994026964193868.robh@kernel.org>
References: <20260112160759.19027-1-officialnaumansabir@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112160759.19027-1-officialnaumansabir@gmail.com>
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


On Mon, 12 Jan 2026 17:07:59 +0100, Nauman Sabir wrote:
> Fix incorrect plural form of the uncountable noun 'hardware' in the
> MediaTek DP binding description.
> 
> Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dp.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


