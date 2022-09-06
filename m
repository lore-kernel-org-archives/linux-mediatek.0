Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE54C38145
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 09:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qRQ+bsJdGYFtoehZXJ9CG9hmZnA3qGLazL+DfrVMStg=; b=sFP8Mi1vFYnFoYtt+CuuxrzbYl
	yKAF0gnan1QMwLlpsqNQG7q922z80o6IEuV6EkOyPJDxtmVA8SH6RQc5nTMPDfmZaChTcitA/MetW
	TGvBg4ileSTZo/0ef4nA7i69986TikZY8UCVUBTIDtkj2X1rrmls/ySWoSKCm1OIBsggBLzSf7nOh
	XKkctJJZiyxBufgpiyaqkXsq39fTq+mFC9clEH/rkblPGbsr+XvTGbD7VIlL+BZStf08iIAnmiYcv
	09sB5eJi83Ik9EDD5o5e63eCietXkjV8T401AKctVTbGSVVirOTuH4L1aHU0qnsu4h9tEdbC+PSGq
	Yh1CGgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVV66-00Bzjb-NY; Tue, 06 Sep 2022 09:42:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVV5f-00BzIU-C0; Tue, 06 Sep 2022 09:41:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B21D6601EF9;
	Tue,  6 Sep 2022 10:41:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662457313;
	bh=7pEeYix4E4mRwD8IkrPe/sydx5F80OmM4j61hvpJHDo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Atz850aqdqnVP4OlM865gUC2IfObKvqgM12LzdJyn/95T3UwH9DBsSurrIoOR8tQE
	 uOJUQtGcVE8ItupeK1l0jrqsabMEiRhUL0R+tni/mheB2wzL/47zfoKwAXdxEYrxtj
	 ifnWiXmptF0GpptgWiXu0QP1dVgBpF1OtCFdO42POyDbmGoOuXvFDaZh6LnR28arOL
	 usWYocvC/7yq5H1AmOFWmp6Mo7voZ9hy7pr41GeuG+K8jMPUhs89jqmKpztovPv1F+
	 1cBRzhhXzWyi3rZGvTPvbPJEwKvjh72xl7j46sKOCn/pggWzajazWhYMearHWw37ZG
	 J+zCjZ4PNDLyQ==
Message-ID: <fa26f4f5-032e-f5cf-8e67-c4a34d963e70@collabora.com>
Date: Tue, 6 Sep 2022 11:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 5/6] soc: mediatek: add mtk-mutex support for mt8188
 vdosys0
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com,
 lancelot.wu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 amy zhang <Amy.Zhang@mediatek.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
 <20220906084449.20124-6-nathan.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220906084449.20124-6-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_024155_629996_F75BB812 
X-CRM114-Status: UNSURE (   8.13  )
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

Il 06/09/22 10:44, nathan.lu ha scritto:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> add mtk-mutex support for mt8188 vdosys0.
> 
> Signed-off-by: amy zhang <Amy.Zhang@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


