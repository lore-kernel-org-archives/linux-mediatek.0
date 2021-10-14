Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8ABC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:32:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB3560524
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 13:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CB3560524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uadj6U19z7idMg5LIY2i3++DmUzrkxD1XNTWMwMk5BM=; b=qXHBgdkzwyiPFWJ8F+zfzC1e8A
	DhUHtM4/JfWOyW4jsDMV+v53Ys8PZAhRfiuhW5kvVZuonvM6p3z45tiiu6Rvrfmodhwp8VfkvQT2y
	/3Zl9MN98FaJFmkdsExsyPWBzKiK3fmWDLHg542s8Va2vxfJ2+N2/JcmPcT7J/6dVZj7Jw8iq0VyP
	kDtKtzfCzzFn53bv2Ab9+PFwgR4WDfaoPaViFx1zphTzdjbHINDmYNPgXkd/3ww5RtDkOfq3mJ8D7
	7Q9GrYrc5R1NB97D6LSF/UzcsFh6tiVGsMu6uIcziR5XcsMJrCr6tvDMOV0SAzOlt9O3MM0cUufm3
	bUMDFC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb0qH-003Fue-4N; Thu, 14 Oct 2021 13:32:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb0q1-003Frj-Fu; Thu, 14 Oct 2021 13:32:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0B50A1F44822
Subject: Re: [PATCH v7 5/6] rpmsg: change naming of mediatek rpmsg property
To: Tinghan Shen <tinghan.shen@mediatek.com>, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210924033935.2127-1-tinghan.shen@mediatek.com>
 <20210924033935.2127-6-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <5785005e-499f-bb39-b47d-97c5dad38d4d@collabora.com>
Date: Thu, 14 Oct 2021 15:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924033935.2127-6-tinghan.shen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_063201_701267_84D93185 
X-CRM114-Status: UNSURE (   8.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/09/21 05:39, Tinghan Shen ha scritto:
> Change from "mtk,rpmsg-name" to "mediatek,rpmsg-name" to sync with the
> vendor name defined in vendor-prefixes.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---

I agree with this change, though, you forgot to change the same in
Documentation/devicetree/bindings/mfd/google,cros-ec.yaml

Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
