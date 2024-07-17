Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D86C3DA4B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woMnBHKTYxTFWuE8gxqIvlQq0A9aeNzAUxqNQwxMqIA=; b=I7BwIMQwifVm51b9vEIPanXr8s
	2NyAIrWczSC4I8CQix3jYgIfGdW/IDbHvhg6YDKBGMmDBb2UIn9cvO/jTkPmyAHrOFGHAUzMSlzLG
	2gQVY/0sXNrV79ckHtNsE7O5SWgMqgyoeS5AKzMkUhneHRYQMsLEch20c6C5MFBOwf/XMNflGSVIk
	9efS9U84eINGpOwLLjPRzgfc+e4roj1Tk4106D1EJGy9wa7hEiAela8yn0UB8oOZGvGxgQx3STrAW
	iMWG3DLAxc7NrqbZthcbke8ZrMJOaFnwBg/DJ5SU3UYRQiXKwbNtZSDAaMLiwl6+44PsIWkfqmR3j
	v7E0hHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4wU-0000000DwIg-0Q8F;
	Wed, 17 Jul 2024 13:43:38 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4w8-0000000DwCH-2ffo;
	Wed, 17 Jul 2024 13:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721223795;
	bh=XsjKcz7wJDMS9Op0lhw4ugrW9oIsyEt2rhrcKG9Ughc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s2WEjZpKxVj3VSYPwqNLEjn0TVGfUKwUf1Vlos1NKJftWd1xo0ziwwFYTjZwz8c6P
	 py5vi7V/pO3fnPdMue9/A3KfPb0XHvHIF/1XiyzfoB6D7EAVfByBWER1lB3OTKHnhS
	 Aq5T3ln8TCg0N64d8/mIjUKaw+Gr98xOe/+w/3xo8ci/z8vFSukSnyEcHlORMXY6Kj
	 KK8tW7UCKSL5f0gVuK2gzUHyn4dnY5xNsGUAk+gj0TurFe7Fcc5PhiWbRWtP/mIs9s
	 Kn0WLUtMlsKZmwPsRYqgMfwEhnnioASeQEbB6SoUKHok+Mz+H/nyHsSJAh5dGPf4ao
	 BLiDWutrW38bQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 31A3837805D6;
	Wed, 17 Jul 2024 13:43:14 +0000 (UTC)
Message-ID: <d90ef170-6c4c-4db2-9757-8e3f1cf46ec7@collabora.com>
Date: Wed, 17 Jul 2024 15:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: mediatek: Add support MT8188 AIE
To: 20220614094956 created <yelian.wang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org
References: <20240717125426.32660-1-yelian.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240717125426.32660-1-yelian.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_064316_833201_5401E6CF 
X-CRM114-Status: GOOD (  15.57  )
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

Il 17/07/24 14:41, 20220614094956 created ha scritto:
> From: Yelian Wang <yelian.wang@mediatek.com>
> 
> *** BLURB HERE ***
> 
> This patch series add YAML DT binding and V4L2 sub-device driver
> for mediatek MT8188 AIE. AIE is the ISP unit in the SoC，it's used
> to detect faces on an image stored in dram. Mainly used for the
> camera's Face Detection function of MT8188.
> 

Leaving the fact that this driver is *far* from being upstream quality, there's
something missing that is essential for reviewers to even try to help you here.

What does this hardware do, in depth?

I get it, it's giving out "face detection" functionality, okay, but what are we
supposed to feed to it? An image? A stream? Encoded? Decoded? Size limitations?

What is it supposed to output?
An image? A stream? Polygons? With or without text?

....too many questions, and I'm afraid that this should not even be a V4L2 driver,
or a generous part of it should not, anyway... maybe.

With such a huge driver, you should at least provide an extensive overview of what
you are trying to implement and how the user(/kernel)-facing part is supposed to
work.

Regards,
Angelo

> This series is based on linux-next, tag: next-20240716
> 
> Yelian Wang (3):
>    media: dt-bindings: add MT8188 AIE
>    uapi: linux: add MT8188 AIE
>    media: mediatek: add MT8188 AIE driver
> 
>   .../bindings/media/mediatek-aie.yaml          |   99 +
>   drivers/media/platform/mediatek/Kconfig       |    1 +
>   drivers/media/platform/mediatek/Makefile      |    1 +
>   drivers/media/platform/mediatek/aie/Kconfig   |   13 +
>   drivers/media/platform/mediatek/aie/Makefile  |    5 +
>   drivers/media/platform/mediatek/aie/mtk_aie.h | 1012 +++++
>   .../media/platform/mediatek/aie/mtk_aie_53.c  | 2031 +++++++++
>   .../media/platform/mediatek/aie/mtk_aie_drv.c | 3613 +++++++++++++++++
>   include/uapi/linux/mtk_aie_v4l2_controls.h    |  130 +
>   include/uapi/linux/videodev2.h                |    6 +
>   10 files changed, 6911 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/mediatek-aie.yaml
>   create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
>   create mode 100644 drivers/media/platform/mediatek/aie/Makefile
>   create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
>   create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_53.c
>   create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
>   create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h
> 


