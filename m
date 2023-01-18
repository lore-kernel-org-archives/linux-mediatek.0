Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 544B6C38147
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXPyazggyYETP2ydKIvWfU/P4Jvm4kvxErklOAhvggQ=; b=ezoY+ojEC1lpZAomqxcuWGUalo
	KiXeRbvOuvw8RThTfstt5hiTdTQocbkHW0RMc8aev8kdsFKBGoTdjb4KTdNV/E4xvA8om2vwPS8Oi
	pqDQYcMhUfv6v24fP/UOcA9jIH06l6nPaDbUhN92h1dFIcPEt2MlJphu+t5w7zFtHxRrSO+K++6e0
	7CeixZBcL5UH/kT4weiANzeGzzxTm6R0Ii924ymMWmQZhuOOPiHh8IopW+xoDVwfbqPavEJ1exlro
	Vs5viYz9jqT5ZnMFH1YiqtvMpMOkbhkwmluF+DaJWXySpA6SUW1Jbs9F4TIuqIlp/eUl53RKy8BWb
	XqOlQjdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7nA-000v5X-2r; Wed, 18 Jan 2023 12:43:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7kQ-000tq0-Uf; Wed, 18 Jan 2023 12:41:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F277E6602E0C;
	Wed, 18 Jan 2023 12:40:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674045657;
	bh=Q8iWargvHqJPqAQEN22KOji42+H6hFh4x33zjT3bNmk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d1l1KWQgSEfLpj6MFQZn6l+PeBZeFdXyEEUuMzki5yZdaI2Et2hXu37iCSkQ0/c3o
	 eS0WPYhQ81SuX2ZZqWgbhxgrKyCVE7EdjGrR/HqVDIStdWh0rd5nvT76SxCjgKXpa1
	 N6ckbLnPYcwM7Ml7RLjYorNT5FLm40r4kqOlOSADz9UytaZoyU1UZJ3dJf23ReJD3C
	 7uwSYTU88gbE1ph+MVygrbvgH7dxU6L48UZ+4vqjsPMlyq7memqkmRM6sGbBNw7AbO
	 986M6e2YT0G9CNc+NZ7dcmucL8iHuoM/Px5TMco2K40Ci03ZxZoy0+VgudEYCG2MXf
	 n8EUjlx+ld/pA==
Message-ID: <640ba00d-8c04-0e24-75b4-7a997cb7780a@collabora.com>
Date: Wed, 18 Jan 2023 13:40:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 4/9] arm64: dts: mediatek: mt8186: Add ADSP mailbox
 nodes
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
 <20230118091829.755-5-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118091829.755-5-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_044059_187769_60053829 
X-CRM114-Status: UNSURE (   7.88  )
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
> Add ADSP mailbox node for MT8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



