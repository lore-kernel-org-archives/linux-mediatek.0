Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01007C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYQcr8cnowulzl844Gxm9X4hSbCpgS1pd+FvCxhzaaI=; b=LkjftvCTS46+m+dqo1v7mJLtRd
	LL03nMWoLzrMbpCLJBugQT17QPRBf8GIwt5lgmHeDnKP7ZsOfI9/ubIWvxlgLD4suW22e9a3jqlR/
	MfOqJaEUyNQ+nCQ5nnL40x9PYcEzpZUzPp1GO+AQ/ZqKql2Ew+LHdT7HboxUkPikfMboQGrJ1LeeA
	PqIgxSIxrpcFsSlsm2svZWCFlXk5CdLVwlY1HtHX297ZN1kFWUb8/czacFRzoSdt3zqc5M9mStACq
	5kHMEgZlfSXP/vC0bgBLYpAA1Y0aKjACaw3okUNcJuzeNznvRzsS2XLQj5n4uY5LXIgHBmP3BxFHz
	v81AW47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7lM-000uBa-8X; Wed, 18 Jan 2023 12:41:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7kE-000tkX-94; Wed, 18 Jan 2023 12:40:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 18E8A6602E0A;
	Wed, 18 Jan 2023 12:40:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674045645;
	bh=K9DDT/sGSTZ8+laInqxtRU5BsE/Y42T3DY92eX66wEw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mzY9uuQQxYkdBa0JNkMQfeqKBZcspWKstGi7gxBZX/COvLM6+IYmMfx/5KIUEJgwb
	 vowiGQVBr834K2IBaeyw5Iov8MYyOmdaFspcjLKhYwQyEWJyTIVEtMRK3xA7fcjqB9
	 0JfczgclEblY1fnmCc2Bk87wXgFh4H2j8MVKYj+ICfCqXR05lKq2113z1lWlTLlXGh
	 O1xlK4gr1k3FVJYb4brvK1qydQCHAxvE9MYvs7fLYp4nqZItGcJutYAl1Mi90Yn+cI
	 JGi9JS2aRhh/lBAsT4fGJt7VS8OThYVfvl/vXxpaWXU1te4WPAUnRPc1+t6m+iWfVI
	 BnbTFA+Cfsq6g==
Message-ID: <22e046d0-9b1b-d7d9-6d82-bd0e2ca6e01c@collabora.com>
Date: Wed, 18 Jan 2023 13:40:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 7/9] arm64: dts: mediatek: mt8186: Add DPI node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230118091829.755-1-allen-kh.cheng@mediatek.com>
 <20230118091829.755-8-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118091829.755-8-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_044046_476707_16FEA0A9 
X-CRM114-Status: UNSURE (   8.50  )
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

Il 18/01/23 10:18, Allen-KH Cheng ha scritto:
> Add DPI node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



