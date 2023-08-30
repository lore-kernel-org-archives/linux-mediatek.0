Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773B1C83F15
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sm9OR1tDrQSTMsi+edYPuNxJAjHa0rExuE9C2Wbe9dM=; b=Rz8LBJ35ySsZky
	IgIC/g4XtjSm74fZ2WGNM+nn+wobCDmHThBvx0dnynNkrMXIo5LENRfaVhxOhwZQl9LqCI/8hJDp5
	2mKyLJD9iJKhnLESUMQHPNZ6k7xasX2qrG0lcz/eEYWt4xubV2IXTHKp9csiZnYJRqjsphLwK72L1
	t1ACMX0cdTD+EzeC+WQcNS81T2Ef2O+wo8sH8dGkd77ri/Dlp9fJOAw3ecA4xGrR/FwE3nKW55tdB
	cvcwrU1e/8EXR6ugmf4Ikejc5sKak46jxT0kq4qcGNSKXwnOaaUGRtzRcUGQKkCPKIkTcuOqAerSq
	G1ylcI095q05AaQzhI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbIrl-00DLd9-0S;
	Wed, 30 Aug 2023 10:56:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbIri-00DLcg-0G;
	Wed, 30 Aug 2023 10:56:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55A8A60F29;
	Wed, 30 Aug 2023 10:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0459C433C7;
	Wed, 30 Aug 2023 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693392960;
	bh=Qmj5BFfzATwiV9vaUhtiqnZF81rYO34Lo+8rLqUFuRQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PPgfgzXj75LN3zMV5Fa2zBOZc5G5C3Gj7mYPrwl+CnzU26tuqtCMonnL6DNAvzV79
	 PKYHXvtsxWDL0tb2L4itEOPSbwFK6xOYcdm3oyX7LxnL8epupDsf1b4pbUH8DWBO73
	 VrAFRwHyNhr7Ap6UruV3O/Jaw3Mtk3JshOJO6hiaAMQBa5B+SboXuavA+8N55zlb8u
	 Jb3ZG7Clkebd0Vl2GIArs/gyLB1Yv0ks0fTaXsgzTPGugfl/demP9SzWCslB1aN80K
	 AA5OKwqoeEsASc9/I1/4jYmdR69jse6lyT6Nopf6zk++vqhxbOF9Nlu3EWXswqzTSm
	 3J/PRWID5ZfDQ==
MIME-Version: 1.0
Date: Wed, 30 Aug 2023 12:55:55 +0200
From: Michael Walle <mwalle@kernel.org>
To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: Re: [PATCH 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs calculation
In-Reply-To: <fca464b9-9f32-4420-90fd-05e851871c25@notapiano>
References: <20230829131941.3353439-1-mwalle@kernel.org>
 <20230829131941.3353439-2-mwalle@kernel.org>
 <fca464b9-9f32-4420-90fd-05e851871c25@notapiano>
Message-ID: <acec69f943f85b02909d8ce3e4d538c3@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_035602_181601_1EA89050 
X-CRM114-Status: UNSURE (   8.41  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy
 . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> This won't work. On MT8195 there are two display IPs, vdosys0 and 
> vdosys1,
> vdosys0 only has the main path while vdosys1 only has the external 
> path. So you
> need to loop over each one in all_drm_private[j] to get the right crtc 
> ID for
> MT8195.

Ahh thanks, got it.

-michael

