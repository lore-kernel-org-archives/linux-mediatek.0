Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A014DCAC5A5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7/Fe+wE/dEqrMcQRvnSWZbk04ZTAZb9zui09Iw7HDU=; b=m0yy3VFVH2BkCowzbPCM97ZBlQ
	Qw6OmrFZccaLZ/Iyc8Y1pqz7pwF2q72crzLe35AAnjRLymfmaPw9vvYry7hgPDzO9KPWWieOtOpth
	8ISZnTR6qGb1jXzEgoWTMC5oLMC/cbeXHIKxSBW/aJribnxevvZoc0LVmfQlacN9fl7jKe5O3AHVm
	jxGHmEa1yivchXSiJ6Eg7u5zNh2GCR6omaRndwhNuEFJx5DBqrdWlxyuMwE9cuQlI1Rv1xsyK/mxj
	hq2QGinooN/TjK9YEd2O2jLb67ca1r/FxDFBneFgnWgnhUTTDOK+KpXyqdfJSESjuxHMhW8s8t+j3
	sWi34i6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mGX-00000009YeZ-1tX6;
	Thu, 25 Sep 2025 13:44:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1mGU-00000009YZi-23VY
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 13:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758807842;
	bh=z0nrjmYw4OalvIuVx9M/Xqt3AoRAIrJYUKWWh5/SgpU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iDwQTQjf+5aoYii8V7TIlFrezpbgSWVarP0i3pxD7eLDrfSa7YofMaSS2KBC12M6e
	 XucJJgfriXb0oON4oX0H4VjHWsqgpr7i3ZGaBZlfPVjvcIJ4/BvCjMj5m4q1bJ2bpN
	 eqzaOHFhyvVBmrCS8BtaUMyjB7rcKIQauoqRAQmodaDfYkw+FhuEr8V9cPnrhnzPNX
	 Qdio0coW3QiE1eUIYNGQgaGwiUzG8T7axx0hkl2Yy/dw0hSaqfpxpwIeo2kEYVQkt9
	 +wASpjhxocwK+CEIL0FDe4EE7h8QkOwegCUEy/a3DbsLH60WSnJCsKvnXM0DeH5ynl
	 K29dDioXgk/XA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89CB317E108C;
	Thu, 25 Sep 2025 15:44:02 +0200 (CEST)
Message-ID: <a1224727-0d33-4e62-a538-8013115848be@collabora.com>
Date: Thu, 25 Sep 2025 15:44:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: mtk-mdp3: fix device leaks at probe
To: Johan Hovold <johan@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>
References: <20250924143919.11183-1-johan@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924143919.11183-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_064406_883159_51263727 
X-CRM114-Status: UNSURE (   9.38  )
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

Il 24/09/25 16:39, Johan Hovold ha scritto:
> Make sure to drop the references taken when looking up the subsys
> devices during probe on probe failure (e.g. probe deferral) and on
> driver unbind.
> 
> Similarly, drop the SCP device reference after retrieving its platform
> data during probe to avoid leaking it.
> 
> Note that holding a reference to a device does not prevent its driver
> data from going away.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Cc: stable@vger.kernel.org	# 6.1
> Cc: Moudy Ho <moudy.ho@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



