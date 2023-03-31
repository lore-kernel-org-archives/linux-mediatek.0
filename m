Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13384C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnM1jEkArQh17/mOk11TjN3gYSihaeWlWs9eODOyfrQ=; b=uADeDye8V1lAAXigmwbqDffc91
	MYv6BoXoy7AXVe6hhkzq41ExFKR++zvNoJtUycFlZMvCWlcR1Lc2ipnykytCBPqqN+fLLZq3x+ydX
	+nW/2NhXN78PaHz/6jHs/EFw3g82NRex3pq8rilZ4Q9TY7jAgleLXxFV+NGZzaunIRh2CH4N/gE9a
	6sLbDJPZA05qME+M79LxcB6GIxesuBXbiKgtnj7AnNPrQRwW2v7XycUaZ5dM8936WaFivq+cPfxx4
	9aTI/PF0DcwcWoEEU5cmhxeLpEMMtT5so5H74YjTnQDy7uluBXW+QqHouTF7g8Wc5RUVUEx6O2G0y
	lWY/U+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBRz-006nEk-0x;
	Fri, 31 Mar 2023 09:53:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBRv-006nCt-2d;
	Fri, 31 Mar 2023 09:53:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AD52C6603192;
	Fri, 31 Mar 2023 10:53:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680256412;
	bh=jNOaW71eag7G5il18yilOMcRbddq9VsgCKH4D6vwk0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m6zkoKR4+sN6ROjOmI8MPs8SGzmVgo79kidUfTMxVrqXEUwSyocdpmkaKiRBz6iJ4
	 lVzU6vc6K/rFWJN9GRC1FDeva3Se7KWAf3KwEpkslSGTWlVXyfTYVJWLm+AQSkTGcL
	 +3UroBw75qWSQU+u6oFRrYVAsjtvzFf/u2yNTUXi3xn8ET6mdeFpvwOQa7kJ+ZnxGM
	 u15Q40I9WlCW/KIwxJrlb+jR+BZ7nY3GdxtSCOKcFswT7ROaXVJJrVbvgXGirNhGDI
	 JLfm5OLx1cZw7LwAjZdOIxYn2D1UeaUGZV9U06U69nEgr+DLna8i3QhpcIBkoDf3OL
	 ceLG3EVzK5NMg==
Message-ID: <f0c7abcd-6751-5172-1ec9-9e16f3210531@collabora.com>
Date: Fri, 31 Mar 2023 11:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 19/19] clk: mediatek: Add MT8188 adsp clock support
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, netdev@vger.kernel.org
References: <20230331082131.12517-1-Garmin.Chang@mediatek.com>
 <20230331082131.12517-20-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230331082131.12517-20-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_025335_984352_891C7951 
X-CRM114-Status: UNSURE (   7.27  )
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

Il 31/03/23 10:21, Garmin.Chang ha scritto:
> Add MT8188 adsp clock controller which provides clock gate
> control for Audio DSP.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



