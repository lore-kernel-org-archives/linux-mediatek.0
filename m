Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8563C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Mar 2023 08:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r6zKkGJZ6kMl3CQp/m1p3Dok9jJ4yPqUuoGli6CZeYg=; b=RgefDLd/opZhKQufYNuYoXO5OS
	SUsFmgjRe8MBIEnMzauR3sTJwiDzmuFgLXMbYmOeFc97tKAYhQ/YWe5ca2ywpXO1xmcz8t2IeT1K4
	uxh4DcigLI2m3K1OIyJfLZlzUbfETWMCEuIvs7RFPCe8mVy9P84bVUOVlrUlUdwVXEYy1wt3xILd3
	+H7p0vEsPaNnFWAH18HBh+9/bcp2ScASxw2v4MEkWrZWC6diGsWPDdAaeIWgf59xJomGg09ZMOKPJ
	PaEakPfxZ2Z3/zzyyG58gOnJTtrWQGHiL8g2YlEVGkQgC0rVODaUkQXbuLPhcJceJUYsrILbRk12k
	d8/jQvew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGm1-001LRO-18;
	Thu, 23 Mar 2023 08:58:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGlx-001LQ6-1W;
	Thu, 23 Mar 2023 08:58:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D616A66030B7;
	Thu, 23 Mar 2023 08:58:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679561891;
	bh=e/oqoIOkUG0wo3orInZZuihofftZH8U+TexqRWVw3pQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VszBHvgC50OVPmQY4vR7n0kKNyEbylf0+xDIfH6R+Rsz3jU5CN32pjYVMHEtWnQoK
	 R1Jwjq5UYYebPuQH4xMCB8UCdZhUiGzf/ksWmKY7u9eI7EGTEg6l3KWE5U6HGsL/eB
	 t2fY2wlNj1iW6ZDzstPZU3WZkBaYQ7GlzdAey4duj5sCluTbvX5qb0CNS/cfxJcgyw
	 6WnX6q+SU5H1v0W5qYFlmfDJ1y8TKSRoYOywpIokF1Omjl/4kWNQ7R2kH1txPNUtbD
	 nTfUMXCklPGMqIjyvwd1Mr73pFTDWBIfYDxiZa0/aOberevX3KD4Ycs2ZALNakDdLz
	 H88dCNP0P/V/w==
Message-ID: <17831605-5c9d-9c92-d190-04f91060ace4@collabora.com>
Date: Thu, 23 Mar 2023 09:58:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v30 0/7] Add MediaTek SoC DRM (vdosys1) support for mt8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, krzysztof.kozlowski+dt@linaro.org
Cc: Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, CK Hu <ck.hu@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, clang-built-linux@googlegroups.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
References: <20230321121859.2355-1-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230321121859.2355-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_015813_636952_AC5002F3 
X-CRM114-Status: UNSURE (   8.64  )
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

Il 21/03/23 13:18, Nancy.Lin ha scritto:
> The hardware path of vdosys1 with DPTx output need to go through by several modules, such as, OVL_ADAPTOR and MERGE.
> 
> Add DRM and these modules support by the patches below:
> 

I've tested v30 again on MT8173, MT8192 and MT8195 based Chromebooks.
Green light from me.

Chun-Kuang, can you please pick it?

Thanks!
Angelo


