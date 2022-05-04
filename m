Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D9BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 09:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeyG4py8ifDbusEYP05rqh83fQkiPJXz81exlc4T710=; b=CwpO8fKildvVH8
	h+qxvU5c19O6obnEVtuWmGeu0lqRHobi22T1s64mlwbktxvyc2qV1E/tUoSxNL6GzLmJ8ASSFFKDY
	P4vrWUZG0zA5hp2417fq6SO9jAlsAK0KroYInUc+Kil6SI7XjjzUexC32O4Z0EOXf6FpVN/mm4w9I
	/1ISPb59oJGgK1FzqmLkd6a7Pt2O8yW4k608OHn8yAKyk3QdPRh3E+37UZ0NeCYdShnS6KMiUVMH6
	md6XPYS5qkisjb8ny0Pfors1J3vdHL9uawiq5l8jsZ+gFN5wwz+Vw7tuNVPDvIk/CIDYhFbyhvVY0
	1jj8EG7iyl0xQpKgKYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmBAG-009m5y-SH; Wed, 04 May 2022 09:19:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmB7K-009kGF-U8; Wed, 04 May 2022 09:16:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DAB721F41569
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651655777;
 bh=Dotfy/ZpuAnemLKpN+RhtuMzzTxRdF3JKSnpuEWgFvU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ele/+rUhfYGdPpKz37ZSGAZweUB5eRLht1elQek2Ls7Uk7ScaKdHq4oOJZokMNng8
 E4aWPmwyZJIGro0rORFHegX8UpQyy2V66mWC9jH8mKLvBfpryzsLanzVZ6zlz6sPZv
 H04TXYArsclMV61Qmn4JLcfYl7xQNH2r9U0p7CA4nhBRvKk+RGqa1FIIaJyHJqWoMb
 oEBE2/98U70CrgAdbBH+ZmJaNy0RRxgtv2gZCkfy0UMoxcu1wo6GtJx2dKvmMvMmBQ
 aTdlEKhOIqSm1CCyQkF18ye+o1+fzC4SE7Egd3pSbp3rcILsWinVQXIrjPYB64s9Hi
 4pU26qtXcrSbw==
Message-ID: <b2bebf6d-a1e5-e998-0f75-17c84b7dbbdc@collabora.com>
Date: Wed, 4 May 2022 11:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v20 06/25] soc: mediatek: add mtk_mmsys_update_bits API
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220504091440.2052-1-nancy.lin@mediatek.com>
 <20220504091440.2052-7-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220504091440.2052-7-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_021619_144259_C8499BA5 
X-CRM114-Status: UNSURE (   7.65  )
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

Il 04/05/22 11:14, Nancy.Lin ha scritto:
> Add mtk_mmsys_update_bits API. Simplify code for update  mmsys reg.
> It is a preparation for adding support for mmsys config API.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
