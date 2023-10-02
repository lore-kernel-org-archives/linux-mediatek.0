Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A4BE784B2
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36AT19izCHeWbcwIjqV+n3L7YSacejmkkXKAt/ovhtE=; b=PxCxapOHUja0Ne3decc/R9nyqN
	vmKFr5EmnUo5rLgteBb6vGIpq03YXBkcGKNa/BjoF+9hYtUA+al0LUCjsn6bld9buQ2DqCpU5uZag
	/V8LAMfm24OjHiAts6vtD2TfmDBsBMXjlTNTTT1GvHuj7ezdE80cGpuSE50eDCU9C5VsKFiuM7hIn
	XtMiqRN8p/5ySpAUEa1S7CTDWidItcp/70FDG+hD2KPzeRlc7k04Ahd84jaS7fYQz6y0ucnV2PTsV
	H7GDBjMC0oC+pfYY8Saqca0MwINGjV3dAk8qs7/wMTcXZQ8X1BX/iMnOpbb1UQuyL8PAQYoYarA29
	PS4zMj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnElj-00CBgE-1W;
	Mon, 02 Oct 2023 08:59:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnElf-00CBdl-2u;
	Mon, 02 Oct 2023 08:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E2954B80E43;
	Mon,  2 Oct 2023 08:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE83C433C7;
	Mon,  2 Oct 2023 08:59:01 +0000 (UTC)
Message-ID: <5b1006ba-37d9-4dbe-ad21-b0bba454e97b@xs4all.nl>
Date: Mon, 2 Oct 2023 10:59:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] MediaTek MDP3: use devicetree to retrieve SCP
Content-Language: en-US, nl
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mchehab@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 sakari.ailus@linux.intel.com, u.kleine-koenig@pengutronix.de,
 linqiheng@huawei.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_015908_087252_3C47D702 
X-CRM114-Status: GOOD (  10.46  )
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

On 19/09/2023 11:59, AngeloGioacchino Del Regno wrote:
> Especially now that Multi-Core SCP support has landed, it makes sense to
> retrieve the SCP handle by using the "mediatek,scp" property (as already
> done in MediaTek VCODEC), both to select one specific SCP core for MDP3
> and to avoid walking the parent node to find a SCP node.
> 
> AngeloGioacchino Del Regno (2):
>   media: dt-bindings: mediatek: Add phandle to mediatek,scp on MDP3 RDMA
>   media: platform: mtk-mdp3: Use devicetree phandle to retrieve SCP
> 
>  .../bindings/media/mediatek,mdp3-rdma.yaml       |  6 ++++++
>  .../media/platform/mediatek/mdp3/mtk-mdp3-core.c | 16 ++++++++++------
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 

This series no longer applies to our staging master branch.

Since Krzysztof also asked for a better patch 1/2, I prefer a rebased and
updated v5.

Regards,

	Hans

