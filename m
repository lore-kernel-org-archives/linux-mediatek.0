Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F006AC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 16:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TA3XyRMuoIjDvpx7IqEAQajEgPvwKCatZbgS6cEKjE0=; b=JiVQiGnE0lFLKsNoK932MKNhA9
	bPRTLaMyYQd8FJD6fvTm72bSFxyN+mVmkK80LTGSJzENUbIzxmjFB6XN/qcXwPDw7324t0ZefLWuL
	Yp4ZwYBUUBYS/St/tOo+41urDxz/uOkCzzfHfUUna1Dxq0ccrqo4c0zqWtlzbVd8lcuCmz6UyplFw
	44h+sDl9rE8T5UN99IFGLijgr0G924WdffH88CUcSvKIkOXCBBhmQrJ/BBk2M/bakxtF5MM//x0bD
	vSYvLJzJ0zlfWU3FNb7HhCGDNt4AYAZrfIwPCwWD2+0EBb+Jx3pMMUPWmZrk/ET41iz4Vj8agx4NX
	mqRNySpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmdJE-003o5C-1x;
	Wed, 12 Apr 2023 16:27:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmdJB-003o4C-06;
	Wed, 12 Apr 2023 16:26:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4BDB862E88;
	Wed, 12 Apr 2023 16:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFFAC433D2;
	Wed, 12 Apr 2023 16:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681316815;
	bh=AmBsB2SaL2/nqORtPMIw+AC5nOY+5hArVvhxKihAVlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HpqLETwJGWpvpVscapsgzgCNberlHMLS7pXWQ3MzMO9FnXwsxZT2m8rX2I7fvpWzg
	 8qPSwy7V+MqT4yKLXK+sU5JsmvyqGh9Ibr3WOIDgCtpcNWo5JleVRFXt3LCrt4ao0Q
	 Qr5Nxz1e2PjsIQk3qXHcY6ImMlC95nlwQLENfnypTkJEnm2p77H+6MQ9ziQ+dULuf2
	 ahGJH03k1XslFI3w+0Q0Ch9ccTMGoklsT9/NqKMc8/eqqboTDTUQ8NKe7phh/LTOK6
	 Tb3LMA2pKxlWMUYejrIQARkySmeY8/k3Q1cbndSWcf4vDRfD2YajWqf5bgiJaDwo10
	 XDVMiS1iv/DUQ==
Date: Wed, 12 Apr 2023 21:56:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mac.shen@mediatek.com, stuart.lee@mediatek.com
Subject: Re: [PATCH v8 0/3] Add MT8195 HDMI phy support
Message-ID: <ZDbby+Tem2vcvhBn@matsya>
References: <20220919-v8-0-a84c80468fe9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919-v8-0-a84c80468fe9@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_092657_104404_F37357D7 
X-CRM114-Status: UNSURE (   8.92  )
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

On 16-02-23, 17:02, Guillaume Ranquet wrote:
> Add support for HDMI phy on MT8195.
> 
> This is based on top of next-20230213

Applied, thanks

-- 
~Vinod

