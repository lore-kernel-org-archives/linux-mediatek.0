Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA38C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 10:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A0a6rHC+arryyKBf3WKINTjPG+nFWESLxIzby3LNVTM=; b=KQM+XlGFdcd53F
	sVUYsWsKZ4gkYvY59mCXIYDAbeJ9lnIlDyHTLbwjTZOEI9q9X7QF7J54o62X56d7MS3uN6LoDE0GO
	A9UCLo8d7O7pd0ebasa1HBzMbZPLkAu3JLCiU/48reopYqyANoDH2uEdGCIZaj3yclzjawBvWmX8x
	1vrNt8+v12Jk8CpO1lBMt3l0OzpvBDqRYr/S2m+lLjy0Jdt1KJFs0FlMCos8+U2TO9YkQkWwAJVY1
	rhtyIizZAVjtdA3QorGKOpBVjqtu+OybAcnT8cnFHHGGlpKLbQKSgKbLTXXXRIEN7vnRm8aFRY+wX
	lu82QcNlq5ZtdcRVTpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSGPr-00CUMY-78; Thu, 10 Mar 2022 10:53:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSGPM-00CU3U-Lt; Thu, 10 Mar 2022 10:52:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B18281F454C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909553;
 bh=ZuWzbcW5SBzcLegidyZSDC4r4SiuQWU/WO01Zs4oE2k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I3Rps/fsIu7d1mr3rhCDOZ/4fEQJVBhL7g3BK5ADv5/b6QOczc1Ncj0/LLjspJxJs
 tHa8PgwOOs0q8HZsH7870XNBto9whyL/UTOc0Yb5z8039R/SaHPaihppgcd5XHC3Qe
 2oekAW7j9oQR7OTuqww7ajPIiy6V8kGqBwK8kSSRqFYckdgS/+DOipnpQMwzGBSxDO
 DlHGwAu5M5AL1Kslt4e2PVhCanrZZ4EcBv6HbvdBnqwgO9+YvKWmaC0TTk5o/iz2VP
 L+E9+orTgEqOio/6r1TWLNOEjgu0Ezh33wlDoaAejdbxvagXfboN52wy62sCLn22bn
 GstdLxBd9wZXg==
Message-ID: <d0b3a4f3-b54d-b0bf-a3d8-6e6123788315@collabora.com>
Date: Thu, 10 Mar 2022 11:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 08/22] soc: mediatek: change the mutex defines and the
 mutex_mod type
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
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-9-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-9-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_025236_895742_8A63EA46 
X-CRM114-Status: GOOD (  10.34  )
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

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> This is a preparation for adding support for mt8195 vdosys1 mutex.
> The vdosys1 path component contains ovl_adaptor, merge5,
> and dp_intf1. Ovl_adaptor is composed of several sub-elements,
> so change it to support multi-bit control.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 264 +++++++++++++++----------------
>   1 file changed, 132 insertions(+), 132 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
