Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD38FC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dlhMNjo5UVt/4mU8HvF9UQyziRTPhK2LjPiWz0Jv4M=; b=JltkL7pwu/LKJIUT4hAbwL1jXm
	8DLBNicZrlPKgIdn31g65zjLbRXq5SpLgrvjpCggwvho5xlcXZFUx5Ht9fETWiUJY6NIB9//yZFlP
	55Z/mYMZB0uzLF3R+plK0k20ajG+cQCihml7PzZq9vZdXEx7633FKmX0NGis333NGySF5yflOTe5T
	gEOk7NcT4FjrsuqBXxMP6Zktmn7NdDQspDXf//2gkMgXOEMdde7KB19t6Gm1jZ9lu5D8Qza054+h1
	hWqwjo28KBj3HAfuIMjUNGLhQYR0HX2rg7xw8+FwQ1OJAtU+XZIAcn6Xx8ten58uLF6y7SmxRKNPB
	ga5sj8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JEO-00Evnb-GV; Wed, 30 Nov 2022 09:18:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0JE3-00Evf8-A9; Wed, 30 Nov 2022 09:17:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 483C26601601;
	Wed, 30 Nov 2022 09:17:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669799871;
	bh=QA6RbiaiLnTymXb7GWLxqK8yLinuWDfI6U6/SkEO9rU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RGInw50kk9NR7f6zATGqUIJUGl3L2ei+lTbNO0JXzwhtSvWnK9sHCOIA8qFr4CeMt
	 mKndQtiUBRHzlHh+KzcMBnZlb02j7nfWEvXIfELqYfXYf6U1+IwApdEpCM8wBalLmF
	 IzB1WhJUulk9s01OWvkUWBvTOauCxRY/yjx2vutAB34HFf11c8ACy9okh6jDq9JLTg
	 MruCj6cB2DmN/T+8p7W/h2Gh9f7daHZWoyJgC1S/t3cJOqHQ0VX36wC078O4WfJgDX
	 PgZ9f27bvcKRZudLZ5PQBuERdOak83+fGvELPyTAIsPd/bl/JNkWwTaVr01/0GKKc7
	 KDvWWkxZtsM8A==
Message-ID: <6b692dd2-3d40-8346-e926-9459728157ae@collabora.com>
Date: Wed, 30 Nov 2022 10:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/6] dt-bindings: mediatek: modify VDOSYS0 display
 device tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, lancelot.wu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221129143503.16638-1-nathan.lu@mediatek.com>
 <20221129143503.16638-2-nathan.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221129143503.16638-2-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_011755_650667_108240AC 
X-CRM114-Status: UNSURE (   8.23  )
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

Il 29/11/22 15:34, nathan.lu ha scritto:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 display device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



