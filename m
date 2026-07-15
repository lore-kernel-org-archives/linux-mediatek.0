Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1061C44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiWQwRYXK2ect7bQDu75GH3hgE4r/BOXJyGbx1WJyc8=; b=ThK+tf254Xj2ac/fA0WuFJ6YHd
	h3GF59OeiESyx4EjMJQb7nN6c2uSMAV51c8LLwRGad/q4LaJahgzK+Ak99qiI2SeC9+KgjNQQaZqv
	geg5t440EjuIZv0KbmzjhSrkCyA9gP4DIQNE1FGITrCCpBy7DfoRPsvEg87AwilJe6AgpDV+R88xp
	kOhY0Z4DqX1TAg+F5F0QDryOkB4Qb7AN/Xz0occp1c7+x1xAp3NTaPd3UcFvon41B3c8a7d5gzGwh
	F/m1RrEyqT3zKVvSSEaYw0KX6oXiLEjQxEe4cwth6SguFh/sz4KjDMTShyrhkiUbWVDuKrUIdEFu2
	Vy+x6aig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyF4-0000000Eei0-3WYr;
	Wed, 15 Jul 2026 11:57:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyF1-0000000EegT-0l2H;
	Wed, 15 Jul 2026 11:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784116648;
	bh=ygstzEkP+JyZmGcQ7tRnuvfQYRLdyR6bfVZsm5RzxQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BdB3UVJwnodQo8Cy8oL0ZTippxQaEiXCbBb5Lq713EfsjOJylM/LuKN/oL0BNYkSJ
	 ImuP4A1tymrkeOYuDScouAbUrkeUtjT8HEcOs2jW1WlmPsD9AIo6kLpSMrmHqmJl9h
	 RK+XHMJtjK1kuInm4xj9wi+aVnyXoJWGddfVFLcHl/+qclxqDr2QElORH3uzqVOejx
	 prEsPDaPleQ/1fHggJY9FE1Pn2d/Xo0irxR2tFr0sw2ncPJhu7c00YDVaTaIcI224h
	 fUUm2sqVeQJrpVJZtGHREIt8EB9weUkOLXwxjm2SrB2voH+shzOuZ6gkMS5Zvdbm7k
	 3nZHajprWomKQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C09017E0A4E;
	Wed, 15 Jul 2026 13:57:28 +0200 (CEST)
Message-ID: <821ce2b4-2630-4110-b493-b31c5d04556a@collabora.com>
Date: Wed, 15 Jul 2026 13:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] phy: mediatek: Add support for MT8196 MIPI DSI PHY
To: Vinod Koul <vkoul@kernel.org>
Cc: chunfeng.yun@mediatek.com, neil.armstrong@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, justin.yeh@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
 <20260713103805.23030-3-angelogioacchino.delregno@collabora.com>
 <alZm25Ro_WdKigPd@vaman>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <alZm25Ro_WdKigPd@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_045731_380999_B88365D3 
X-CRM114-Status: GOOD (  11.74  )
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

On 7/14/26 18:42, Vinod Koul wrote:
> On 13-07-26, 12:38, AngeloGioacchino Del Regno wrote:
>> Add support for the MIPI DSI PHY found in the MediaTek MT8196 SoC
>> and its variants.
>> This PHY has a different register layout and provides support for
>> more hardware features compared to the previous generation.
>>
>> This initial driver only adds support for basic functionality that
>> is necessary to drive MIPI DSI displays as a D-PHY.
>>
>> Feature additions like lane-swap, DPHY/CPHY switching, dual-port,
>> and others, may be done in the future.
> 
> This seems to fail to build
> 
> https://patchwork.kernel.org/project/linux-phy/patch/20260713103805.23030-2-angelogioacchino.delregno@collabora.com/
> 

The failure in your log is:

make[7]: *** Deleting file 'drivers/gpu/drm/msm/msm_gem.o'
Segmentation fault (core dumped)
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/msm/msm_gem.o] Error 139
make[6]: *** [../scripts/Makefile.build:549: drivers/gpu/drm/msm] Error 2

...your build server is experiencing some hardware issues maybe? :-)


In any case, I've just rechecked this series, and it builds fine here, with:

ce1b90b20bbc (HEAD) phy: mediatek: Add support for MT8196 MIPI DSI PHY
522a9d162c98 dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
49362394dad7 (tag: next-20260713, next/master, next/HEAD) Add linux-next specific 
files for 20260713

With CONFIG_PHY_MTK_MIPI_DSI=m :
   AR      drivers/phy/mediatek/built-in.a
   CC [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi.o
   CC [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.o
   CC [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.o
   CC [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.o
   UPD     kernel/config_data
   GZIP    kernel/config_data.gz
   CC      kernel/configs.o
   LD [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi-drv.o
   AR      drivers/phy/built-in.a
   AR      kernel/built-in.a
   AR      drivers/built-in.a
   AR      built-in.a
   AR      built-in-fixup.a
   COPY    vmlinux.a
   LD      vmlinux.o
   MODPOST Module.symvers
   CC      .vmlinux.export.o
   UPD     include/generated/utsversion.h
   CC      init/version-timestamp.o
   KSYMS   .tmp_vmlinux0.kallsyms.S
   AS      .tmp_vmlinux0.kallsyms.o
   LD      .tmp_vmlinux1
   LD [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi-drv.ko
   NM      .tmp_vmlinux1.syms
......[ etc etc ]......


With CONFIG_PHY_MTK_MIPI_DSI=y :

   CC      drivers/phy/mediatek/phy-mtk-mipi-dsi.o
   CC      drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.o
   CC      drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.o
   CC      drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.o
   UPD     kernel/config_data
   GZIP    kernel/config_data.gz
   CC      kernel/configs.o
   AR      drivers/phy/mediatek/built-in.a
   AR      drivers/phy/built-in.a
   AR      kernel/built-in.a
   AR      drivers/built-in.a
   AR      built-in.a
   AR      built-in-fixup.a
   COPY    vmlinux.a
   LD      vmlinux.o
   MODPOST Module.symvers
......[ etc etc ]......


Regards,
Angelo

