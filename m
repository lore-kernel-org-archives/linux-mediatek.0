Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305BDC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=581FH7GLr1lQhnt1zpNBpizpW/gNdXxfekYWEr7mKpY=; b=AdqwzkwF5fnIj5f22e4yJNLB54
	A5y7PoA8/jiDM+U6QmR6zehX9MYpv8VO3WA/V/tuM8McGO5RRrT6EqYLrR6fJarZYapYCviJI/E7V
	RBRZ48LMszW727gYJkDgPHAw+GZ6p2JOZ/S5x+YBhzc2U44yFWkkX8hdO1jXCRdS+aVyEHSvclYCm
	Ut8Zcuis6bAz5nOvMOe5l9xhYILvAo0KfpAwofbRBkwlyl7rYTuBt8vVsvplLuu+/wZ+MFS0rE+aK
	bVg12ynXt+4UBSjxb+4xv/ano87OlZqw6f1fyV4egJm2F5a9stw6/9Oh9EvrhgF1ql7pyeI6RwL8b
	ZCq47PFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LFg-00Fnxq-Er; Wed, 30 Nov 2022 11:27:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LFV-00FnqZ-DQ; Wed, 30 Nov 2022 11:27:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 44A386602B30;
	Wed, 30 Nov 2022 11:27:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669807651;
	bh=9w7RebUsRY6IbaChOF9zwL4tdgr8VzcUyERVRfWcQ0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i/jpibuq9rcWceRQjqfhGOY4WgPlkcDczB9Yt0n3xCNOkcRAWuqDZhNPyC2q7gi8t
	 C6SyV4pwXynlM9Quy8WBDYYiNjQyhNqcUkQZvs+Ioy+EazZraoq52LyGbfNrahwf0E
	 peewq8Oq5T9oqI1GVIApu6+FyJ7AcsivttderROfCFBRvHPgvgXviNpjjNSYLiUpmS
	 k6v9khJJH5OVXZ9DSN3l1YeyWhKv5WoxvWEpJBX+v4/ygN3NWPKGZWS295vN8b+hbo
	 ZcvGLJqGT2D/Xs37PwYw8xQIgjlug5qf/xaNVpZM0ZBQnJXRKyzPPLj8fUWjYgzIXF
	 qtLMOZgsbPttQ==
Message-ID: <0f82b5d1-4fcc-4e32-c446-6b903a566b9a@collabora.com>
Date: Wed, 30 Nov 2022 12:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v5 2/3] media: dt-bindings: media: mediatek: Remove
 "dma-ranges" property for decoder
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com
References: <20221128143832.25584-1-allen-kh.cheng@mediatek.com>
 <20221128143832.25584-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221128143832.25584-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_032733_611307_2B78A7B3 
X-CRM114-Status: GOOD (  10.31  )
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

Il 28/11/22 15:38, Allen-KH Cheng ha scritto:
> Since commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
> controllers") was merge, we don't need a dma-ranges property for IOMMU
> in mediatek video codec.
> 
> We remove the dma-ranges property and fix the example in
> mediatek,vcodec-subdev-decoder.yaml
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


