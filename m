Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF172C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAN7QqDdOWM33hSI9IS0guHk29DmMPTMLLcXOUpds5k=; b=lB3wWUcAbccTq7H+yiLl38nH3j
	tCsBYom4o+tMdAC5XBk/dJJfGwljvdRlS0HlUQWpoCbTsElQAq3d7g+f3aFIFyFcVjfgx11o+nBKP
	cLLV8h82oUkvE4LZ8jyi6+cBdIFIUe6JwOwdbeC2BQI2YLeeR6iSsxom8pe9Esf07WXVVvU9L6OmL
	TIToKdT8qEZaS7ptNb7tsm9tKEIHOzGcUgl1JaUdZN5r6y+lAxrSduFzqkszj7dgcXuXK5My18JW9
	ZB79VJpdaeHaM6WYBvI4TZB6nV71HKh3+huFRJK/P+5XZLjKmraBXAl23BQbpz7tOFMcbyea+N3XI
	Svq5POdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHOGY-00A2FU-K6; Mon, 16 Jan 2023 12:07:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHOGO-00A2Cv-0U; Mon, 16 Jan 2023 12:06:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D6EE660035A;
	Mon, 16 Jan 2023 12:06:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673870814;
	bh=ZaBlGRRy0FiA9ociHJtulXryHKF8KYSJW4u+p7j0/44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BrNVFrMeB9Ey9jNLd7osHBpnzp3Xa40ySk0/OepdHSQtrnc6Rch31wCeNWCklpJPB
	 +iiIG6L+P8RfaRGjfoTkruajeByVkcFr0n300ySQdFObdcKMS7S9gqAD1mFB1ydsxv
	 6h0+c9Cvt7Ekd+r7+x008fMQ2dLQcjsTpzKgJMA8vLfcUJ85oEaKFOmTRhxMYMEUds
	 kIJv0EER3V+wpPz2a58iqpRVt+3mg+IWO4w38RVctuaahyp0Ona25iIISlo8esurV5
	 HNtguY9yXuEle6No+iM/KZ4dlem/jnDayItlR3ZvaVi84i1J5pzQK8ucETmEdLiIGe
	 s54D/K9z9OZmQ==
Message-ID: <6d78fcb6-c975-8a4c-787f-19f83fef2bd7@collabora.com>
Date: Mon, 16 Jan 2023 13:06:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] watchdog: mtk_wdt: Add reset_by_toprgu support
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-watchdog@vger.kernel.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230116105305.31818-1-allen-kh.cheng@mediatek.com>
 <20230116105305.31818-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230116105305.31818-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_040656_213345_1B730447 
X-CRM114-Status: UNSURE (   8.97  )
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

Il 16/01/23 11:53, Allen-KH Cheng ha scritto:
> In some cases, the MediaTek watchdog requires the toprgu to reset
> timer after system resets.
> 
> Provide a reset_by_toprgu parameter for configuration.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


