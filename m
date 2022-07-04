Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29627C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaKzwCD6ayS4HRZFmOkJcofsnm/l8op1jclv68NCmUE=; b=3DNFd5zOOcGx+E2gkcHUd+2p/+
	YHsDtCILr173KDFg9hJuzEFUmJl0FrYNT1fiAUhdl3oGtAPNDd9lidX9Ix8Dg1s1qdz/5SAzZwphF
	zw6aYD1hXSHbk7ojEggWrCKAhkQVi15ageBZZCcD7p8v8+VuO+HzOjSuX/w5jnYZCy86k9Kq2UD/h
	h8BhyngMouwxnzM74nM0i+2kxcXxjzInSGMfV3AG7zmpSBwR1dVdEjfu8jYzcFZzPEweoPF5HP17e
	06disl+p42WHqxIAVB98E5D73gIhWx+rTnjMsh0o4pRWaAXJMTGiqBpB6r1469ZlEh5LNLv4HUl2u
	ad1aXOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Kdl-008ASr-Mo; Mon, 04 Jul 2022 11:53:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KYQ-0083Pz-W2; Mon, 04 Jul 2022 11:47:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D60B4660198A;
	Mon,  4 Jul 2022 12:47:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656935269;
	bh=wLFTtd7NM2OiqRe3Wpx0kZo23G8XtTUE22e3isGy1cc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=akB1lSbnLVOLpjoz/BhcoNtVQjHxTEtX/W0EZ+Tjyi/LjvXczQQlQK/1y5RV4suCq
	 ShgaoIB92g1Ha69cx8aajDIyXSWIDAZI/ooFWX4V3KtYfco4gjcwvqxwnVhV5SdJ3M
	 YtsO64LoEF957q8pS/74l5DY22c/uzwoDPrWZZ+Ff69mqWavN3ZNe0ngXohvH5sBfE
	 zfXjpEwCWW0mkBvWoaIT5pCCvey/NdwDpLw3gI6AKEbnqAdSgRwOmfPvD/Jc6vsKe1
	 H6VLyCcbVAlAP6IXoe/IVz+Dud00BQFLpwsXDX2FI1QhVRpfZlwSOFvXyGT/ZnI4E3
	 KIezSVM0prezg==
Message-ID: <1ceb790e-5b99-30a2-0d42-8b94c31d3eb6@collabora.com>
Date: Mon, 4 Jul 2022 13:47:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 5/6] arm64: dts: mt8192: Add dsi node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220701090547.21429-1-allen-kh.cheng@mediatek.com>
 <20220701090547.21429-6-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220701090547.21429-6-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_044751_221573_EF059E7A 
X-CRM114-Status: UNSURE (   9.12  )
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

Il 01/07/22 11:05, Allen-KH Cheng ha scritto:
> Add dsi node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


