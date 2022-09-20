Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A551C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 11:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JJCybOfGLCR9C+f1vwr0F2qrcWW3BFXxy5j3y8s2dk=; b=YIS7LyBtQHcae/bAYo/2JjG7gV
	6ZQ1djvKwKx09Jf5lxqbukw8KNUUIQ/Nt4my41mPR3VuACiP9MVfjbOaNGDS+MBFSzfbF7jAsSrjc
	v753jgZkNpKuRtXd+kM4Q3ZIIQpY8RRZVFy6PU7a3E+fn6cTc20ZURLMv4wGBAp7+CXUfiezm1kFL
	+aefugd3ies7A8bFKbMFuNw8aYkMqP4/fPfNBM8gfRgK3yWkUtCtUXVVNjlwNvxI06GrNTKIuLKof
	yA/IQY1cURrzNf+ZOEXTJvtFPSnP5Uzswtp9NYsmBmlJJiInKdLWsJkwrTLTOXTcdrh7Ds7Vzs4RI
	AFFnwGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oabeD-003QYv-9j; Tue, 20 Sep 2022 11:42:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oabda-003QJw-6v; Tue, 20 Sep 2022 11:42:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 139D06601F88;
	Tue, 20 Sep 2022 12:41:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663674116;
	bh=A2riqMDL+e6uXEzLF8Z0oYqGsIpSvXIapKZhlgz+MLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D1JPK3PB/rETwddxkJo+ir808mHSZkg1lQAK95Xn08P8K4jDZWkQ6+LJNYMLJmBgG
	 cwxZUkGgM2dTL4OHRfY31FWcYMWq9MpEO5kkgwCoQMjY5NJaCxuwNO4QMahHdVn9MY
	 6PJcJDRAutMYp+pLUhdp/gfHIgCWHytfIPfarSWnliBchAcyBJiTiNZlp4ITxk4OV+
	 jWlmgmKgRSOTBw7La8G87wJibOJyInxdy5Rdww0e/HAowGr7ojq2gCCPtckQ0YfHJ5
	 jbauLmui0LDUiy3c8heWBA4dGdh/36TvQhQDedU0UAaITF19fNe278Slsp/D2y7Xiv
	 2M0Vo4ij7ontA==
Message-ID: <ef56a05e-c575-2515-0e00-a22a854b52a0@collabora.com>
Date: Tue, 20 Sep 2022 13:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 13/17] phy: phy-mtk-hdmi: Add generic phy configure
 callback
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-13-4844816c9808@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-13-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_044202_781071_8FDF2BE3 
X-CRM114-Status: UNSURE (   6.65  )
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

Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
> Some phys, such as mt8195, needs to have a configure callback defined.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


