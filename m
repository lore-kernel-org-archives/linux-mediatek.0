Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBE1C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGDwz0IC3iokFhb3/JCH6VTrs8W7dE7FY1TqmL6a00E=; b=F/nqta72ZUsP017oGkc9d/yz4Q
	mN3ajAONDg61zZW+NgGz8eExhVMWH27DKdlMPer3HEJSQVb0gDFLbLlUCQ0/lRnJMXkGu83i5iupk
	BpW2JgZi0oFBeqq6ZBtQ3EcQ+gBmMYOSLsSNcM4GcR9Nk1R2DvL0IGgeGxMKIEtj+fzkJw61c6uCa
	7U1XTQh+XYF+2ERRtC6kJNCDnS7Jn5x8qMwRttwY+euFATtBiSQX1HoTc9Q0/yIhvb8tLEFS6oOV4
	YikK9de0a9poMIJFSrBDP/LNKSxnakfXnopmkXEi0ihOutF+N3RymcdpIWBH0SDHBE7kaVy0ojEio
	2ZLc8J+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poN2q-00FzF8-2t;
	Mon, 17 Apr 2023 11:29:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poN2k-00FzCQ-2u;
	Mon, 17 Apr 2023 11:29:14 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BBC436603009;
	Mon, 17 Apr 2023 12:29:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681730947;
	bh=vaZCPuA9zesT0QJlFhMnEt33VLJO7iVWxfBXtlJ/lH0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WFgCiMYbwP+Bn8ijyZhu8TOT/IS2ZAZIKz//4Hs+05/CNxMxHj/OrlBO1YQKttgHO
	 QfzA6e3e4BZu7W1PC5bJkUdPgaqGHhPe3xN74n1OZ+AUHccyiohD0IU1oPL5QM1dZy
	 A6GHYFWi2FxdJ3xbrU47fI1v8gSJgEKqVpcS0VfulfipQ/V3WJmxqXHfoiFwxp8vf1
	 lpJJJU6lEzZEFdhSOVyjHdRhEOZdbwwdTfK4FVd8lBLWAKSlzzh28IfciPdrUPOn7b
	 w4Z6Qxe9SXbmSPJG/3SazWPI4j88/x+OkyvMlpx575jS1Oo/RGQkf7CVAggaavzG/e
	 uUofIIghIHTQQ==
Message-ID: <c4a4a900-c80d-b110-f10e-7fa2dae8b7b5@collabora.com>
Date: Mon, 17 Apr 2023 13:29:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] dt-bindings: display: mediatek: dp: Add compatible
 for MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1681358785-6930-1-git-send-email-xinlei.lee@mediatek.com>
 <1681358785-6930-2-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1681358785-6930-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_042911_071152_218B7CEF 
X-CRM114-Status: UNSURE (   7.45  )
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

Il 13/04/23 06:06, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dp-tx for MediaTek MT8188 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Are you sure that there's no eDP support planned for this SoC?
...because in that case you should also add a mediatek,mt8188-edp-tx compatible.


P.S.: Resent because the first one went out from the wrong email address. Sorry.

