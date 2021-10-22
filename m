Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210F2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 08:59:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0EB3610EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 08:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E0EB3610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJOeLKT6a2UPfm8o8lzFE59dS1fawYoC/i/cSb84VEk=; b=3GNDtd+sGq4THIv0yi9KE5sYrE
	1C+5/+5HgHncljsc2uwuYt5nkAtpGwu4vqTeX20HqynVeM+tSpBxj+KaOJVBGrNUokGQADFRu20ZH
	HThD9DQysoMob13Jd9z2G7VI/1GnlHlzEHdXfrJ0UBr30pIYC9lohF/dQTgmyrpuru/KtEXBUalHq
	+Dznfn/+ncMj5oFsltk+ml8EiCBCenxa4YfFT6KoRfHBCnY/l79/Lf/i3DL3wfq9Xt8mJihOOFqhn
	wCCcH77Ic8AtGSbp2o3LLWaqqEG4R/k/CPB5rYJkNzcvmfwC+hk3Abb1zuan6xemFioXstLSXkK5a
	S6EIhMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqOV-00AHeQ-56; Fri, 22 Oct 2021 08:59:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqNc-00AHHW-Eq; Fri, 22 Oct 2021 08:58:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6CCD91F44F77
Subject: Re: [PATCH v3 9/9] media: platform: mtk-mdp3: Add dual pipe feature
 support
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211022022146.3577-1-roy-cw.yeh@mediatek.com>
 <20211022022146.3577-10-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <def8532b-c454-a87a-8d53-fa4a77791b9c@collabora.com>
Date: Fri, 22 Oct 2021 10:58:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022022146.3577-10-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_015824_668178_A9205E83 
X-CRM114-Status: GOOD (  11.10  )
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

Il 22/10/21 04:21, roy-cw.yeh ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add dual pipe feature which uses two svpp to execute dma
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>


Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



> ---
>   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 189 ++++++++++++++----
>   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.h   |   1 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  11 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   3 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   4 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  15 ++
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |   4 +
>   7 files changed, 185 insertions(+), 42 deletions(-)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
