Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E03ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JC2npHs7pPCCZ3AgqReE3otPh0KaXHEd+xhwp6pL8uw=; b=TDsMi/TWx2Aamq95tEgrMy0DUM
	XJFfbzY878INVqEsyftO2WDSsX5If0WZs0yZD3RnOP8HKyTtcC9XWXkSt9lhJg/eptDz4iT65w0AH
	/Zlkulsrp8dWzCdqyWC6/MiPbXm5B8on+osEZGLLzrL8kkbai0MhaQty5RJw6OMiJJgFrtipogUJt
	I9Xua/V9htUieyRweD+zCKuHqs0WOaLzLzMWqTMcxKkAGaC2bZYNznD3Y+kIC9MATEo4nBhXCPw+6
	NQqkc93Z+Drxd/MGAMEb8uYkV3Ra427TprbtwJM55nNGC8L9MgsLVLgzt8dsii8AXajJt6pPpNNII
	IPztO5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgc6-008iYp-Jg; Mon, 12 Sep 2022 10:24:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgQf-008d4m-25; Mon, 12 Sep 2022 10:12:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F2786601FD3;
	Mon, 12 Sep 2022 11:12:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662977552;
	bh=8cFaxVFQUN8rcz0SgV1ILziN/080VIloT1ViIdRANRA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E0wZdAHv/k7SwZ5nem3qLmiY/quR2SBQTV1Y65LT7vmmNhNr5FvR99jhZMuHKbXZI
	 cp2ikmumJSHaXQrksk45UMwbSmhPuE5H7uowNak/BbWlqZqmzowYUB7G94eYy9uxok
	 9vNBmt0Sy5hdan/HBy0Ks9XctehwWZoyyrikllFlaj2GbPSveI0zbQUmnOpcaqOHGl
	 BpeO7gI9v1fbWUfPiHCoGGdiliqUrqcuZFHdxu+awy3ZUxqTAw3zbzFPr0pmoZN/Kt
	 xRsVoV1WNDkpu29qwDjlykp9UUYZitFMrUrtBrCVPWw5ggBnESGHIe/YjI5+HQe3gm
	 +J6dzF6YZqG9w==
Message-ID: <90908764-b5aa-34a0-74c8-9f9215dcb89b@collabora.com>
Date: Mon, 12 Sep 2022 12:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 3/9] drm/mediatek: Adjust mtk_drm_gamma_set_common
 parameters
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
 <20220911153734.24243-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220911153734.24243-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_031237_554247_A7D7EEEA 
X-CRM114-Status: UNSURE (   9.70  )
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

Il 11/09/22 17:37, Jason-JH.Lin ha scritto:
> Adjust the parameters in mtk_drm_gamma_set_common()
>    - add (struct device *dev) to get lut_diff from gamma's driver data
>    - remove (bool lut_diff) and use false as default value in the function
> 
> Fixes: 051524cbe62d ("FROMGIT: drm/mediatek: Add lut diff flag for new gamma hardware support")

This Fixes tag contains a commit from a downstream kernel, which is useless
fo upstream. Please fix it.

Regards,
Angelo

