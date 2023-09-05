Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD40C83F3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 07:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+qxsr241VmvOj8Hq0IhLN75And1mxfBNN5wXQ6InNs=; b=1+C7eXZXm27EHF
	uwLTRL4b8e/X0IoMr03AjVNfVMIdUQ1l/rVmv/0AWpYlzZOLxk07qGPUdf/CBhd0+gov86tVYDYK7
	J1kwwxUu7Jx2lnc7Q0Mee5uKREyycsbY+k9qHAdIxFBpRbMr5u/CZ2hWTd+yDwSuRN4ASmP/36GHR
	HnQmpBqjT8Kr8+xUUV9iG7WU92383Vaiz9wLNPLM8PESqW1MDauL8yCYKcljPEYTP+cuyYtHsHUvC
	uQ8HInrwvFpa415JdtMdnvqm7DwKOeD/0JqrdHA9lwcaYa6nbLJUuNRUqRl7+JeUtOWbJaMM20nTH
	zjZI4LCnAlxq/45kve6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQxc-005U6t-17;
	Tue, 05 Sep 2023 07:58:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQxY-005U5V-0u;
	Tue, 05 Sep 2023 07:58:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B67F7B81097;
	Tue,  5 Sep 2023 07:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81992C433C8;
	Tue,  5 Sep 2023 07:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693900729;
	bh=Dnlu1SDu2v2QnFOKA53mp8v1htY/lKtNTEha/hvocxc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BsAmLrNAK3vRW/Ymrt8hnLJqZhHBqtc+z93aKmix89cbGbhO2h2ccpOS4/emu37Cm
	 qZ+cQ1oNKl378LvaB9nSaSmHygFW1LhtwTaYl0ydUbXhifhmuQiUVSJR28StLntCxv
	 qXB92+lnyhBs4cNDyi6aUVcHKJq4qDPK28NvR7GyfZ2+9rHjVXdxWW/srzQMqfWB2u
	 F/QpNxnAGoYouTTd9HyrWrxWrcDW8A7QqArEMDyudwVNB9vu8ILYYIIwQovFT/zcai
	 vRq5UGfIkVUDpxpL7p1Jkm1ESvxYR1epeYhWTQ3opxRexM98a1st/YvMkEAHrpyM6H
	 DveQ0u/e2HqQg==
MIME-Version: 1.0
Date: Tue, 05 Sep 2023 09:58:44 +0200
From: Michael Walle <mwalle@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs
 calculation
In-Reply-To: <d7e6917d-7315-12d6-d7d4-dc7ea8c58dc9@collabora.com>
References: <20230901174557.3617839-1-mwalle@kernel.org>
 <20230901174557.3617839-2-mwalle@kernel.org>
 <d7e6917d-7315-12d6-d7d4-dc7ea8c58dc9@collabora.com>
Message-ID: <cf7d01700f5e5adf2f28b0376451143b@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_005852_449581_3197132C 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy
 . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> At this point, I think that it would be sane to change this function to
> return a signed type, so that we can return -ENOENT if we couldn't find
> any DDP path (so, if we couldn't find any possible crtc).

Fair enough, but should it be part of the fixes commit or a different 
one?

-michael

