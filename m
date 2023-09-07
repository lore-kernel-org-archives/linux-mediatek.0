Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F50EE14D3
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0Vb1jIn39YXkuuT4Nbk0VcgKn+6p/FH7cOGAY6HpLs=; b=WHVjDIR6Im7v5wtVc8+sXjhWop
	Jl2k3OI8K3DIN/lzaAKLQm39B4IPMAL94YFbDnuC0SUjce6eZJN3JIq/M+vqSNnKQXYjYvf3fiQbp
	M6re7s3QkOjJRDbDgXy3qHPALfWKlB+qnN7sB9QCCLWoXV7TLuYrbE7TbiyENEBY384mGb+OW9TDs
	tThsaZb/tnTZI7W1M0E529w9ihwTEdhEzzsFD9R5cst8ZbugqOirPwjwIIE7b2fVNShVtxIsT37k+
	iOYuM5RB7rxTKTWAehLipSD0CpGTAKwjDATzc2MxwxUyAoH+F9rahCmfhb6VtCQrrsWTnQx8QAf0c
	j0q8FdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAXv-00BbaP-34;
	Thu, 07 Sep 2023 08:39:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAXs-00BbZS-1J;
	Thu, 07 Sep 2023 08:39:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 345B266072E2;
	Thu,  7 Sep 2023 09:39:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694075963;
	bh=5HAuUKmxIJjg4VBaguLk4I4c+d601rOrY72YVF44X0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ckA0g9vdfCDOuObnUptNofe71ykQGSYqCxS/zNk0qiHFM/fWOi8hP6O782zIyHZTu
	 2KXFJDGyGJRHV6zVGjLgpikCK+iI3Q2+Z3a7VRK/m+JWeU2/0u9iXhPGR3lprRAGvU
	 YpDGz60C8YWZkLhW1z8RnG+GPO6hXmTv3HFVYFqsM2KF0umWeLtu1YtoIMilRnnVD9
	 kAUj9pnizAshMgEIDrqlnr+/sN8Ygc0eaKxnxsDvPzcQrgABidAn8DcwP88fn778j4
	 AvAUYch05oFXm6U2RI0oKtpItlQe5EKLa9+//Kk6xhe4P5Msy4saKe6rHdMUj9+kMl
	 6Ne+quxCRDvDQ==
Message-ID: <a3221a0c-a638-ea06-e8d5-9252fd95a032@collabora.com>
Date: Thu, 7 Sep 2023 10:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230906114425.31187-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230906114425.31187-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_013924_574420_3AC5C0C5 
X-CRM114-Status: GOOD (  10.88  )
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

Il 06/09/23 13:44, Macpaul Lin ha scritto:
> 1. Add compatible for MT8395.
> 2. Add bindings for the MediaTek mt8395-evk board, also known
> as the "Genio 1200-EVK".
> 
> The MT8195 and MT8395 belong to the same SoC family,
> with only minor differences in their physical characteristics.
> They utilize unique efuse values for differentiation.
> 
> The booting process and configurations are managed by boot
> loaders, firmware, and TF-A. Consequently, the part numbers
> and procurement channels vary.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



