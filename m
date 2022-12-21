Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D98C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkIsmD7F82Tob8wMGZPqcerhvhZrsf5pN2fD4+doqA4=; b=m91VbsN7LWbqB5Zof2UgppANry
	X5Gxhcp1tTDCGKzuklMl0H9ePkzYjVAc05MGllDMPC72DQmd5EU5VlZykmr70mU5yAT4Gb6Kmtzw8
	g20pOVUfx4i5djuwt6JE5rOT1h4eOxJSqg6p3N4zYezmdJhTEQtNe814ySMABHA1OU2WyYWKYj3x8
	yMtLl1hPSnq/SaLRTyytUuy7i6Dou0lv1MHKcY3LfENvNyEpOZxqE5dGbKgxW3e/GL+sCU/SNv7em
	pyjczlIM4uk2YCYm4G6L0PfjQAYkLy41gZQyaLqQXxFVGD5dO3yQhIX+6Jx7i62E/DxvdwPASOorb
	ikULSTNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wLA-00DRHX-DG; Wed, 21 Dec 2022 10:28:48 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wEK-00DMBY-1A; Wed, 21 Dec 2022 10:21:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 34F116602CBF;
	Wed, 21 Dec 2022 10:21:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671618102;
	bh=wmDW/+U3zliqfbi85BFcqe4MYNDfSwKN4+cDvRv67ac=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qgepu3f38a6zsIwJ40kfG+fGfnn2B3/TOjBNPQo/R9HPDznKjn0SE6QjRZiiiNQuZ
	 xMjSQvt2PjoGt6PDH91FbIy0+E40tKqK3IWuMvQdywMMXKBC01xBEmnIs0m3rKRXAv
	 QNmbBML+Yie8/VjqVtgCaF61kcxXs1jJad8FBaAlzpjwJC8SvHHd1U1B5MZ9Dtk8bT
	 xqvyq8tOEOv//GIMOAdW5/XXzB5DPs5U/EyMMdzJ8zkhglYa8XeyjgQA6Cu7WALTe3
	 zeN/2Mam1ulmBBgMmKfAzM5/FOEUml41KK2eHJ4z8bnUCc1XvIKZPhNeA6Om0EUyf0
	 VI3XAJVf893Dg==
Message-ID: <faf72517-d77f-e6f6-de94-c2dd2156b1d5@collabora.com>
Date: Wed, 21 Dec 2022 11:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/6] soc: mediatek: pm-domains: Add ADSP power domain
 data for MT8192
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-5-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221221034407.19605-5-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_022144_270718_771B0247 
X-CRM114-Status: UNSURE (   7.54  )
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

Il 21/12/22 04:44, Allen-KH Cheng ha scritto:
> Add ADSP pm-domains (mtcmos) data for MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



