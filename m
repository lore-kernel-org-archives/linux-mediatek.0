Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648EFC2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 20:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiChBHg1P9D7NyUJ3efflm1pCT0nEeDegjyVvv0Nqh8=; b=tD5cB8Jcxyry+MwhcMfSq+j1TU
	OA+J3k9fTOJPnk4uzeTy7QxBlHKr5nbsKnVefgur2e2pjOLlH8RbL2TX/yqF3XOHLPJtZRSPpvjcd
	4i+W5Vifn9grOeiZEU2oMh2TFHKa+JDuNE62TT53dJa7wR22pxj9Rq3tqf4I4oi5XcjNPYLrKCMAw
	weMgah2k2NcIn8Zrajqec1K+M6ylEWTAFVaIl1rZJJZTuRCtawBXjDUiPvCsANI8tqPSWg3G58Csc
	RzDxMe7i6PfRk18zMZwRwW3FmoxE/Y8pR24aFNLGZFmR40pNITDC5C8WVeTCmXHvxU/RGVRaMcpEJ
	SjmQyKCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLqOl-00000000arY-3Uz6;
	Mon, 24 Jun 2024 20:34:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLqOg-00000000apw-0MIu;
	Mon, 24 Jun 2024 20:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9DD756108A;
	Mon, 24 Jun 2024 20:34:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0985FC2BBFC;
	Mon, 24 Jun 2024 20:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719261280;
	bh=fnYnt1cm4H5OJFjouGeyQRwAXFsct3WiYlfwxAclM7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ioCSjRgPVmkWKAYfMEnQcKe2/Nw1+gJNjjLMabDjfApiT5h25BtImV/0c+b2S74sk
	 oGZKI2CPMFm9e7d+xNuB1iQlMlvxZg5gbQWchcAwiZBwh9ix7+Yz0PC2SCCbF7T/CR
	 DSTk8ZYyI3v6h27WbV3p6FkqkoJz59JF72kem1iGXRY6e9CnUAQfSPK1qedsunc/j0
	 pZUjufoWbx/gWXDcl8nqogJAgkW/ibbVxYU5mmNJBvz79ZrPmw+EX/i9sKH6tr9UUc
	 ARldhrSFACNmx0YyJ8Ka+UlDGMwu9AUJCJh8wjjafgADmQaqViA6Sdp74krJhShOHy
	 6sqlgIdo+tGMA==
Date: Mon, 24 Jun 2024 14:34:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>, linux-arm-kernel@lists.infradead.org,
	Lee Jones <lee@kernel.org>, Nishanth Menon <nm@ti.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
	Jacky Huang <ychuang3@nuvoton.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dt-bindings: soc: intel: lgm-syscon: Move to
 dedicated schema
Message-ID: <171926127659.368668.12236897236768555715.robh@kernel.org>
References: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
 <20240616-dt-bindings-mfd-syscon-split-v2-3-571b5850174a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616-dt-bindings-mfd-syscon-split-v2-3-571b5850174a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_133442_212532_CBA010F2 
X-CRM114-Status: GOOD (  11.81  )
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


On Sun, 16 Jun 2024 15:19:23 +0200, Krzysztof Kozlowski wrote:
> intel,lgm-syscon is not a simple syscon device - it has children - thus
> it should be fully documented in its own binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Context might depend on patch in Lee's MFD tree:
> https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/
> and also further patches here depend on this one.
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
>  .../bindings/soc/intel/intel,lgm-syscon.yaml       | 56 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


