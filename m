Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F28F1C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 12:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccLXEki/sGjeuNuMrB08PB2ojJH+TTcQ0D9lfWxcAmI=; b=tWX+pf0XTtgtL8ydgh2bwigJyq
	lKfXPsc4KfX2GTUOF1XTx6yRSlHow7Brp+HuFh3AicQPlYguA7y28Hv/809M4SKV8uasBqVp0JY0r
	6JkWGS+muQehmihokW7FYz7Ngi/7ApPt9qqnaNVz5FlYJSrkypU3JcF1NWWNc+Fj18kp/bm5SnrTu
	5m4ub/mrmqu4yuhcYBNuYld9K1Eserlz2iFBiw6J/IO4Z2cVqMOZLRrAhVqQc5lp0qv6mPrtXMUiR
	ZofVVEWrbmoH4K6R0cEosEv8slpdVOUCn/1frzBAI+Vl/QKDm4kayHSIfUucwYKHqp7z597rlHGLY
	v4SismYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7l1-000u3x-UP; Wed, 18 Jan 2023 12:41:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI7kC-000tjZ-88; Wed, 18 Jan 2023 12:40:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C86336602DFF;
	Wed, 18 Jan 2023 12:40:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674045642;
	bh=uKsMf8MHei5ruy+j3J8AOnD/yn7UBEkn+IC8t+UWTqw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nMObZb8hu92XYzlaVaMUoqplvu3vgGw4SonMnXFx8SGMlzvmOLRVRf2QPkBTly0Fu
	 2R43uO9YpXmdzUmiWRCffbGyww/LFKOhCYHDyfXwq+71FUzY7Fp2FDaS+zmte+oCqQ
	 tXM+NxirRbVP/9L3ahgmLvvd23oiSzkPzFZRfGviqEKUyCHrrQAaSJHqi6i4CY2ACs
	 LAMeWztqGHvBnCZT63yhxdikMCjlUDm+ywjmFEXemK+WCPZAoVOuoU4I3DmNkMzwkx
	 ABNesOALUoryMdVi2AnAvX9gLcax0oMTdZKJcXx71Gi3Cfvzu4J5cHXkr/fHlrtnB1
	 t5DctGAyJzzNQ==
Message-ID: <ee0bd550-2902-eaf2-3479-2a440dc0b043@collabora.com>
Date: Wed, 18 Jan 2023 13:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 9/9] arm64: dts: mediatek: mt8186: Add display nodes
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
 <20230118091829.755-10-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230118091829.755-10-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_044044_467616_7AAC1D13 
X-CRM114-Status: GOOD (  11.13  )
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
> Add display nodes and GCE info for MT8186 SoC. Also, add GCE
> (Global Command Engine) properties to the display nodes in order to
> enable the usage of the CMDQ (Command Queue), which is required for
> operating the display.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Can we please add GCE in one commit and the display in another commit?
That's just because GCE is not only related to the display nodes, but also
to others.

Regards,
Angelo


