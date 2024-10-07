Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39193CFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 06:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0z3Ees8Em1t3Og+JrMqEg3fienxW/lRMm0LAqskPY4=; b=zFtC93t+/ZkOzdpKHLJX6f1iIZ
	4yqlCsf+1dxmFjNkuvFRwcQ5ciSmI3ssO78psmT/s8KIiOx9OklLEDXkxRANzsw0iQ+djE/G2qLqC
	47JSOsAXJe6ILdqspg83udDaWEdhaUK+02Iml34wKsdxoeCiGtOLp5AQgdAzJ78Ro0IZMN2vlCb+3
	bu89hnH5ipqNz1qbBrFiIrCligez6C2dVfFFDkaliMBZDbFhVDd7BbHz14MY97xes38ifCTjbNJci
	Eok6UpHS4k6WOYLbxahDwg31TKInUUSrKjW4f7HZlN2R7qDTFbYnhIZ2EmVD0Z4/voWnKZLluOTt5
	Vu8bTjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxgrE-00000001MUz-1LHA;
	Mon, 07 Oct 2024 06:04:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxgpv-00000001MO4-2gzY;
	Mon, 07 Oct 2024 06:03:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EFE95C5677;
	Mon,  7 Oct 2024 06:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4C2C4CEC6;
	Mon,  7 Oct 2024 06:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728280994;
	bh=T1bREH4yDLWyE4xjZyozN2Zb3J6IlRSP3pWJSlbvkmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=baWekIS/fyExGpr5aHbhxTGF7PnGZ2UrnXL6xio6nsLVb4Pr8ZsUVp8+LJHs1Dq1A
	 APcM1gKdbC0uiusVWSbPslE5gXxACFZBtaSwuSnG1seal/2LF6VmvcyhcEy4kGSInV
	 OfN4aXoZom5qMAdb0LuKpuWjg2Kq9WrZp7k34JSu6Pb7L9j674xFMBLr+uOSQI0Az3
	 P2yqPDlcZIHejz3If046VBcIBZalID12cfyVOgglAuK60dgUUFpJLQtFgv+XMrXdws
	 IsFSkWaUQZsX3TvTt+76kNFQ/BTCCedLBfACfVxi5mmGYKosQKcPt4NufFHWToNJkz
	 OlyxgPwrfpaDg==
Date: Mon, 7 Oct 2024 08:03:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v5] dt-bindings: display: mediatek: split: add subschema
 property constraints
Message-ID: <tiduxmxji7nmlatceor2cmjy4xh7e36bvt6c6hygkkzots3kgm@ibwqoxij37g3>
References: <20241007022834.4609-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007022834.4609-1-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_230315_747193_34812E1B 
X-CRM114-Status: GOOD (  10.50  )
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

On Mon, Oct 07, 2024 at 10:28:34AM +0800, Moudy Ho wrote:
> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'clocks' property:
>   display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
> 
> To resolve this issue, the constraints for 'clocks' and
> other properties within the subschemas will be reinforced.
> 
> Fixes: 739058a9c5c3 ("dt-bindings: display: mediatek: split: add compatible for MT8195")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> 
> --
> This is based on [v2] dt-bindings: display: mediatek: split: add clocks count constraint for MT8195

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


