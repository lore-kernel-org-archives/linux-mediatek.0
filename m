Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475F3C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSygxqlwMZxrFJvxJJL0orilhrDRkBvznuPEPBya19w=; b=cqRCX/uH0KxNGlZ85t5LYiLmiS
	MXTjyo0yp2VVZ9dfZnNZj6SezBiLN02r2aQSbuqw144gxKV+edfUr+rcy2aF4gclaXEkRixaaDuxV
	iZ2xlrsGMlzV5WqYQP/7EDlIYKxqynMoH7FdJ2UIXfXsxprksF/p730DRIR+64TBgW+g9YlxYfkzt
	N2cnrwKkoa8AHByfrOROxLhB9QmGAWthfVzcN2mrUNPBMGtWPmKnvho4x8BWtmAvHCVfmkF7u0IDi
	ZPRhk7NLpxICyDVV6v1Yu4BNRzkV/2/rBVTzmq7FjiEmCLtAO/56a9SofEus/Evc6q+an7gJThG1I
	6Sj72FFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZQc-00000003bVI-3UP7;
	Wed, 24 Apr 2024 10:00:38 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZQY-00000003bT9-1JjQ;
	Wed, 24 Apr 2024 10:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713952832;
	bh=uQASEV2BynAx1WUK7KoYyrhPrcyeJFPB5nX/BTtJdV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LrpEhTZjFLvzi7YmQ253CkCVdNbi5T+p1cA9t6bNrSa2r9+YLJ7y14iIqqQ6Gg1LM
	 PFBGEmg4TJq33Z/hKeSwPeAuIb3BCmZ2xPXDzJEl0zo/dsYcq+PIUDnB4iLxmyVFmO
	 cmkwwdt4Ee/S9a7/uXT7UUnIYWT4diLSzCGin+HykszfQBL8E4d40AHbr/qvEhc7gR
	 Ys7DdyLC3rUe3j162sA33f8j2tf8CLtezZcKKTEAJh4FPJfAlwnxsbeDwkBDz7zM9J
	 V6tBS49DfMDLquCUmdAb1zcaAX0E6lZWyOrx1FVobJz2iNZFD2TL5pT9pjDxNqIdd9
	 SP2RKSQBx2LWw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DDAC8378107C;
	Wed, 24 Apr 2024 10:00:31 +0000 (UTC)
Message-ID: <84acccf1-b356-4e7d-8335-d782adaa6bfa@collabora.com>
Date: Wed, 24 Apr 2024 12:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] remoteproc: mediatek: Support MT8188 SCP core 1
To: Olivia Wen <olivia.wen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 jason-ch.chen@mediatek.com, yaya.chang@mediatek.com, teddy.chen@mediatek.com
References: <20240424030351.5294-1-olivia.wen@mediatek.com>
 <20240424030351.5294-3-olivia.wen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240424030351.5294-3-olivia.wen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_030034_560740_24FAD4AA 
X-CRM114-Status: UNSURE (   5.77  )
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

Il 24/04/24 05:03, Olivia Wen ha scritto:
> MT8188 SCP has two RISC-V cores which is similar to MT8195 but without
> L1TCM. We've added MT8188-specific functions to configure L1TCM in
> multicore setups.
> 
> Signed-off-by: Olivia Wen <olivia.wen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



