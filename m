Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E72C74A4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rS9euyXUgWeq2t5au+R0aojXRXMYZEUiioV90lCh778=; b=cJNtxXAeOa29FqJS6xksYMXUEn
	ytC2869LXbfh1dZ7K1dnQgqoMCz0F9EhwIRc8kQa/opiN/RitYBamiUVWvZxzI3SEUC0n3eeRx0Bs
	qJGtGNH7Gllczrv24lP+kmP/nWjmPtazHemCMrs0wK9hxSlXZ+6s4X3gPLaDoIsawWnqYry4xVyl1
	zVCTjJuiyiZD8NI/SWPjq0k/YD967bbcyYaE6cTqHD2etekg6Dp6efyi5vIn0iCoYM14BTVnsxtqg
	yzfn3D5LmOrV0b5HY2MsxN4enmqUslB4WTWwytjzVyAH9YNpJb1xf28XanafwTRP1RPNM9KjI0Z5q
	qGxcigWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdpR-004pRt-8f; Mon, 13 Mar 2023 08:46:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdpC-004pLB-Ap; Mon, 13 Mar 2023 08:46:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E15D96603084;
	Mon, 13 Mar 2023 08:46:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678697193;
	bh=8yx6yY1hIFnSlFOt6Ae/ktF810mVDMO69d3Xgz1ediQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=FcT6YiIXHxAYJSYrlm4aaFdR2JA24hnL8IUtQdKCVmff1DL67YegZk1nql04DEP4f
	 E/v2btPWLLruhXJhQ3RqEkiDh4FyA4yd3bHFkpd5qNQL+s9WKVvVJHTVPsl3cJPEs3
	 tQQHwCWvek2Sneg1P+SIt428A7kkigFChZOy6SgZRrDxUDgZB+ODxp4GqpeIki3pAn
	 jcie3DnrSywuoSRPFVTAY2a2LiWftozT9jxtOvHFTAmPQp8HQOKJt1RorGWqk1jXCz
	 yZrUHyznrSqogLhUmVGPOEK6t3K7CFYTQAtt2k4Ty+YkRdHd1JMX12nLavWu2JYlm1
	 RKacX3+wG/Y5A==
Message-ID: <436b3285-0166-61f0-7c0d-fa6ff1c21c5e@collabora.com>
Date: Mon, 13 Mar 2023 09:46:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/16] spi: mtk-pmif: Drop of_match_ptr for ID table
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>,
 Andi Shyti <andi@etezian.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
 <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_014634_526048_D15D72F0 
X-CRM114-Status: UNSURE (   9.41  )
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

Il 10/03/23 23:28, Krzysztof Kozlowski ha scritto:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it is not relevant here).
> 
>    drivers/spmi/spmi-mtk-pmif.c:517:34: error: ‘mtk_spmi_match_table’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



