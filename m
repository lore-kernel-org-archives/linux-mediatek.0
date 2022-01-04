Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE42C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHjEWq2rx3rtU9pu4hXttAEF2v6O7KZMRpwZjAmheOs=; b=BrOXsyd5PyxAMC5qsIlGxxZlif
	oDkAovA4rrvLWTwf67uJgzsSDEzlXg1WQHlD9D/LgVhnIrUDhFe1bOvlQTWZs2cHuVWT/AmT6mqdK
	91C8OKR41zqrSJpHsfjz52XeARANwze98PnYu9HttafiuQ+75gpu4KiOGsV0uxJ8e8OsolXhVdeny
	Rw5p8IlUytAcRSD04M7D2DJaB0D23oUP/Lfd9z6bjRF1SyYYyu9jl6roGiIyQkiSsYThLQeeolr6Y
	ZBDhHEBLuhIgCQqdvDj5SpJqKyONGII1Aj+7kwaPj3JDdRr+F33dlw60cx3ebcTId5vo1Yc9y1I40
	hjEzpvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mAL-00C5PC-MK; Tue, 04 Jan 2022 15:56:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m8p-00C488-9K; Tue, 04 Jan 2022 15:54:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0B5281F43595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311666;
 bh=ulZHjpTu7j0ySO1MMReKIYjoYdR7bbmUzzLd3EJvGds=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=M31g3/2LbHAm51RSMj8gQ/+f16Uz829T17eQnWLzFcVnn+T7o5DjmceJuekSLlCqN
 DHgaVnrL5OdMjSs5yLStZZibQGJ3Ng3+nZtcaQkCigkb5UFYPhDxddqV1r60EyPa3c
 F9xtRxB5ZFeFPW9jvqC+UBLXvEVDo8WBpzw7LK3saWxtKNCHZ9FQnd4r3O6J+UGiMT
 pnWBQTqhT6RYGbm2hnDIjKEY6Ir/rVvgTl3oxYTvu5RaMv5F05VkObmq/RI80YS90H
 bY8vFOJ2iwa/6hS0kaz9t9fDJ4FcymyIPkZUcjo4R2iT7W+7V9NYEpV6lOzvyxWfCP
 o2eLhdMkSIEGw==
Subject: Re: [PATCH v3 24/33] iommu/mediatek: Only adjust code about register
 base
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 yen-chang.chen@mediatek.com
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-25-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4dce6fff-1c8f-3ec3-f540-4028241036e1@collabora.com>
Date: Tue, 4 Jan 2022 16:54:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-25-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075427_507758_8CDC0520 
X-CRM114-Status: GOOD (  10.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/09/21 13:58, Yong Wu ha scritto:
> No functional change. Use "base" instead of the data->base. This is
> avoid to touch too many lines in the next patches.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
