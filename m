Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9973EC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 20:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEEu+pPtxfspocK6zq109AaLk/5j8Tauev6g36T9+v8=; b=bqV05+uy5qtRJCm3Nkle5Q030F
	W3r0ker4jSESLieiECJ4ZS3QttZBTMUzkqTnacPbwVOIH+RjeM4AqlRzcse2iozOLQgrPMK5MpNXv
	PakNOZiwnaTguv7bA11UL3suNT6dXYS/3MitKVMmk0CxhaNfMqAwBYcfWwEk7ibOPww1nM8f5hrpS
	lS44K8SntCsFvm7Dx91mKX40mxF3sRnvfl2QYxbzq0sEvKLpQ39sWvNyzrdAvMg+3/mT4QkZHgTD8
	KtJtGHKb1OLuVdjlPKcK4fD+jr4LJDW8FCvStEoVJ5PYnF3LuciwyvqDxsCJ5PKQtpvDjwVzS77ea
	ngsPsuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqh6L-001ejl-3R; Thu, 03 Nov 2022 20:46:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqh69-001ehc-Uo; Thu, 03 Nov 2022 20:46:03 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BC4E9660295F;
	Thu,  3 Nov 2022 20:45:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667508359;
	bh=ISVrpYt4PR/qsbbqqG5f/trgN2UjQtmT5vQsGuTNWYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aPffSOWHfvf3cv7PtJFElqX+kIJyAs5RUE5oMEjV9GXiGcZsze8QTHbE4ouhQedUN
	 bnO4/UoNxjIMaeETlEinj3tg6typI5IjS4OJF2CgxBYKtrgJOcgfIJ4m898oekR9aS
	 ArbRbzSExbF8FzJ/U4nEkpUvKJG3QPpBqZVY5VqsWJJcBxIC6Ni9+sI3aM7W9kqg2v
	 6orABOsR2DhsSCFMXEcZDai78MVOp+N2ia8JV18M0W9LuzcJFlMlNolxpqVZ6Pu6bD
	 Sb9pYH/MkEIavj3ibVF9UQfQ6vNmvrqj4ObF3cGK/pVIDR5d8AHySEo9EE59mDt2fm
	 B/a6hGxIi8Q+g==
Date: Thu, 3 Nov 2022 16:45:52 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux@roeck-us.net, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, singo.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v27 08/11] soc: mediatek: mmsys: add mmsys for support 64
 reset bits
Message-ID: <20221103204552.5aklyrn7mbdhxw63@notapiano>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
 <20221103032512.9144-9-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103032512.9144-9-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_134602_239554_6137F59B 
X-CRM114-Status: UNSURE (   9.52  )
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

On Thu, Nov 03, 2022 at 11:25:09AM +0800, Nancy.Lin wrote:
> Add mmsys for support 64 reset bits. It is a preparation for MT8195
> vdosys1 HW reset. MT8195 vdosys1 has more than 32 reset bits.
> 
> 1. Add the number of reset bits in mmsys private data
> 2. move the whole "reset register code section" behind the
> "get mmsys->data" code section for getting the num_resets in mmsys->data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Change-Id: Ic7c30ad6c4f74a6b2ebf75fc0e3f9f207b0416d1

Again, no Change-Id please.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

