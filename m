Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC61ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5mscqBjskoIJTmbE49fccjEFLGV2r8MvVioIABdkxI=; b=WXJ/hfs5fGUO8lglXkmB7WScuB
	nZGKZlRCidSlCGPm+68zFRoHKn9eIcmNw6kYPrg6bCdo83/RKdjUBWTeksZL3jGxD6Km2xfaYWexo
	WyygmKAUH127p3tW7w/Uio+2ajjZUjt9jdOnj+JEdBqwvUlanHDryQh3KUDv2Vh7jXYJZsLII4gOw
	8ujlvt/R2B1EJXabCmuSzEWBCTacUOcg4FjQ2LRPUOxwvDRKjEni0Gm84uv0A2WVlIsM3RA3IFLqN
	cqgoUnbafYrBO2M6SAUrYDajthF/GBBO85yc59fRG95NzRsMj4UrCHoKw05UxjC0/7QmoOIxtmhyK
	VdFLx0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYmCO-006v79-5I; Thu, 15 Sep 2022 10:34:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYmCB-006udO-1P; Thu, 15 Sep 2022 10:34:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C68D96601AAA;
	Thu, 15 Sep 2022 11:34:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663238049;
	bh=J5mscqBjskoIJTmbE49fccjEFLGV2r8MvVioIABdkxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dKPxgbQRShNmGL/b7jZx4PFKNG282zTyXxU+SfgKnAbV4J6/XFebgfvLrEn6pGQYt
	 xgThBVrgkdLdLKlmjs+zn33eG57xjFbB2AOdRagNudkFEaGNghFNB80NPjvM5AqBGk
	 I3FWJCRpuDyZUXbfoItND/0tPF/peiUJw3580L6T3aRZLuzP0Ust49x2AKczfZo2yP
	 OVSJ5Jxa7tS4KXIpll+cEgFvlwh0FxosQUuV7q1gGC1E0PmMFp05tyTvIGGTjPztmb
	 HdNUnD3thRUbkvjOwrWpG6TEJ5KEL4T2ZiDDunFB3MgKIZ709DdrmSXjJxibvI1jDr
	 6saRbAzdJcLOQ==
Message-ID: <47c6f2a3-ad38-c9c6-544b-5b2d1a234593@collabora.com>
Date: Thu, 15 Sep 2022 12:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/3] drm/mediatek: dp: Refactor drivers in
 mtk_dp_bdg_detect()
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
Cc: matthias.bgg@gmail.com, granquet@baylibre.com, daniel@ffwll.ch,
 jitao.shi@mediatek.com, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
 <20220915075028.644-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915075028.644-2-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_033411_247705_C0188E05 
X-CRM114-Status: UNSURE (   8.21  )
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

Il 15/09/22 09:50, Bo-Chen Chen ha scritto:
> It is more clear to modify this in mtk_dp_bdg_detect().

I agree with this commit. Since you anyway have to send a v2 of this series,
please clarify the commit description and title, something like:

drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()

In order to improve human readability, reduce the indentation by returning
early if the dp/edp cable is not plugged in.

Cheers,
Angelo



