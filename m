Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C82C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 08:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGk5rp2O/xrZXP1UnM6tl1iS2mrZIvbhYdrZvxo3Eo0=; b=EfNZUa3IdwVY7K
	IlLw6JpDEO1K+PHxWIk6nkSJMF7R0wg3z4Is+N+SCct/zW446Cx/r5NgVwC065WjZVv/5chMebums
	pUx/5yNvADXP2DPtH12/B0aSkk2vZB8veXwZlItT3agzSscc4QcnW87EKzfiKpKI7OZ4QGLZQEbhj
	rhDLIFhRZfFaOcXgN9CrWLwR3rT02xfKCDyrbFLJSFcQrq12SqWHtXaG9zCJchxQOe7qoQyJFpGjT
	cQhcH+p2eXFdJn6jCp8H8ZNmLn1Lg7XsKTs7vwPRvvMgTUp1UjgLoImkR7VraTjc2RYTiUnjoOupS
	H4hW2xN6SFGuNjCq3woA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZ5G-00256t-0J;
	Wed, 24 Jan 2024 08:58:10 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZ57-00253B-1U;
	Wed, 24 Jan 2024 08:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706086680;
	bh=DxcDpKLmIS5x9C8j3sVwB34LceUIhcJpP8hPAp0icRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=apw6ogb+ighCkG56dE6a2Roe+FzIFSCZ3fTJDqFMHMLv7+kdKl5y9zwMcqSUV2Dta
	 FmNwl4nM5/3vZhBxHoi2ML3PBMPJvpG5lQDt6k6JxbXRE2nEapLL7uszXvlzyxoJQm
	 rkqE/iud/R3NZDSRel8+PjI68mLdidZhlaGdgMBT5r0pxYi1P9uwc9q1gQEc6AI42U
	 xSGGjsrm5cgO7z7Cm6S0WXP8NzzIrvbtwpxJ9Dpp0hzaU4AQXhAAa70vu6Ub/Z9S6w
	 vmNBLH7p13eYyP6WIDsQ3WPIhrRf8gYPAMDO5qanWQTfJTCfJzRXczD568YTS3YzsN
	 ca9vjfbYSJjZw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 05EF43782074;
	Wed, 24 Jan 2024 08:57:58 +0000 (UTC)
Message-ID: <cadd67e7-55c1-432b-9377-1a8f8d70dc9b@collabora.com>
Date: Wed, 24 Jan 2024 09:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: media: mediatek: mdp: Change
 mediatek,gce-events to reference
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240124011459.12204-1-jason-jh.lin@mediatek.com>
 <20240124011459.12204-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240124011459.12204-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_005801_625717_4DB4B040 
X-CRM114-Status: UNSURE (   6.60  )
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/01/24 02:14, Jason-JH.Lin ha scritto:
> Change mediatek,gce-events property to reference mediatek,gce-props.yaml
> instead of defining itself.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



