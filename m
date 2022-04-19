Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079A8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3skn6+NLpYC/Tq/oSWRs3f/Tjr7EGB0rgpVmcmEdgcc=; b=FLrrUYKxCUUqlh
	N5i4FvwX2J0aaWcKdzmoFBK5IPnnIaEbwmHSlvO/LJGh/XGQcvzbwzNblqv0/1E1T2Pn/LTkMX6a1
	K1OFC3nQ/sI4UJoPg5EEn6uRkpsjZrc8od5gsqNN9Z3UFFBK67gnbjolggSi8NhbhbtrLJlbCq9Wc
	Ah8HQBhZ8UzgInkN+uGewNapGQtClr3URClNCSNPcM9Bd2eh5rJnb5ZXGWfyQWmVpE29R8B8dS04M
	tEX6cBXIk/57ldFfYpr22EJGlgbfevRQgz3HTypFtnnPNr32thUroEMFyDgro7JoDMpknBVVs22vk
	bh0OPIi81GTD4dmL/cCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngoWV-0048SE-6G; Tue, 19 Apr 2022 14:08:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngo1c-003twE-PJ; Tue, 19 Apr 2022 13:36:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 497021F4196E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650375365;
 bh=l0PW7e+6W+aaMzk2U8nvs+mNTAlvq/0lMKfGCn5v1qo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lN4vsatvsaxNRST52TP7FxX+njdf8wsKm1XU7qdEqyhqhvJKCdPhSqsDATugOCz3Z
 iQO4acUTT/i1lcBQx1+3gkwnBStD3gP1xRfD4/VfjWjiZqYVMcamKk9/BDuQ2W8WqA
 eiAmym8AGy1rffeU01ZOZcpcMzZv8AMLm1TnBPDSo6kH5Qn1rh8pC6gROrlx7ksm4E
 vNbVWqC6064eoSOGweSFBsmP+9x3p7r3U73Jvl0fni4GWGe2kpGy2/PAAP/mPJZ4mh
 NZBq74/gHzc6evdgfQXDfFT09qnfTta7Qq/6km31D3Qof7JjQomWe0aFLPjg1VnFqi
 OFW1tr+6lp4wQ==
Message-ID: <3448a113-3ea3-08bb-950a-16c2ac6eec75@collabora.com>
Date: Tue, 19 Apr 2022 15:36:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v16 1/6] soc: mediatek: mutex: add common interface for
 modules setting
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 tfiga@chromium.org, drinkcat@chromium.org, pihsun@chromium.org,
 hsinyi@google.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, allen-kh.cheng@mediatek.com,
 xiandong.wang@mediatek.com, randy.wu@mediatek.com,
 jason-jh.lin@mediatek.com, roy-cw.yeh@mediatek.com,
 river.cheng@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220418083018.1907-1-moudy.ho@mediatek.com>
 <20220418083018.1907-2-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220418083018.1907-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_063613_003008_67DD6743 
X-CRM114-Status: UNSURE (   8.66  )
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

Il 18/04/22 10:30, Moudy Ho ha scritto:
> In order to allow multiple modules to operate MUTEX hardware through
> a common interfrace, a flexible index "mtk_mutex_table_index" needs to
> be added to replace original component ID so that like DDP and MDP
> can add their own MUTEX table settings independently.
> 
> In addition, 4 generic interface "mtk_mutex_set_mod", "mtk_mutex_set_sof",
> "mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been added, which is
> expected to replace the "mtk_mutex_add_comp" and "mtk_mutex_remove_comp"
> pair originally dedicated to DDP in the future.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
