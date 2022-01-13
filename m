Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22603C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xrw/jBCVTv2iAiYBwcwj4hxJlDd4x3+7uIpyLU2DuBE=; b=iwumfoB/6HWIjhrX+TbHSUed8M
	NPQQov1402ynWOtSgEqjnzNpYw6BVXpjCrm4BtvBiEbGIjJM90WCtYcj20khJBqsmGAwb2yNmslms
	qIwP+vPUF0nUxPxIlT2Il38eTorPRriPb8800rQN2NfsL8OpdQ2+htMx2cx83dX9TLT9ku7n3JzKU
	CIfJx7QtXyvEyMvOR1EyzxmSOxmKu9sGjLLr70ePNsKp94gsduK6QKTPHXE669SWnwt3kZeUIp/Pq
	G1wq1q3qKboJ7XOa/eP/cjl/XI3OMDpPAklE8mz0L8nnNptvvzqbsEJ5ACMiiIEiYAAloXAVYHmb+
	SoUn3pUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82es-006Tqw-7d; Thu, 13 Jan 2022 16:09:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82dz-006TLs-Lf; Thu, 13 Jan 2022 16:08:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BACC41F45F4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090086;
 bh=t9qb5Ze7CYQ8nSCRNMSDQYdvGZu0aR/A+rW9av9GndI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fa1NFsijppdezshg6p0NgQfF46tu+39soQgwxKQrktRW5mJJsC/FaDtjiwg3r96Jg
 9RDBQ75uCWOjnx2XxxkaN3roKDtOga5+Xr8YH2QmfJjL06oa7jkVupJEvOdQ0klZyA
 usJMp2s0HQ65CcV3lh5WkgyvtyS4S7E52HtaoDs5tWmKcHmYSl/Dp/GJxSruSICBcJ
 xKWLqHFbEMs3EMHxzq99XHRWdrqyM9HcEminaXBdNQnlDQkLdPesMYzhXtd7bSi/4W
 1leh0FHm6cllbnWJrzbMVQJhtAj5+yUqhMzKllhDRKdFjevpU4fiIlXtvfk2wE54GY
 pwpFMIWqD48iw==
Subject: Re: [PATCH v11 21/22] drm/mediatek: add mediatek-drm of vdosys1
 support for MT8195
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 singo.chang@mediatek.com, srv_heupstream@mediatek.com
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-22-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <c2750134-9d7d-5aa5-196c-7785c1578e4b@collabora.com>
Date: Thu, 13 Jan 2022 17:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-22-nancy.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_080807_882390_A7404C0F 
X-CRM114-Status: UNSURE (   8.50  )
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

Il 10/01/22 09:46, Nancy.Lin ha scritto:
> Add driver data of mt8195 vdosys1 to mediatek-drm.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
