Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB29C32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 19:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Adl8Zofc2dI2GmEzIqr91M/9GzbJVXD116WFpwYwxD4=; b=Yp3hfsk8v1cpuUgnkZFnwrMxKJ
	w0d0ydxVh4oCp9fToKxZbMS0g8Jqa+TOQVBIFqRzQdHr9QJDGCUtIQeO6C+tyd9Bqasjfk9pI+S3C
	ICaU6sQxtrdZN1yFwL6p0BEatVcOszSxbsKUau6JM25U010EOIyxVfMrz4g1URtv+GUwhSrWUfIHe
	3EDVg5nkLzlvFwdmloQuUoEsTuno1XRYqktAsIg+an1GKfFqdm7fHZZPRdQeQQA0yhWT0QfqzHwrX
	OS+nJl3rFltSHFH1/cmsalTGuecR6tgkb0035DU1yznCieqREhxHAz6UAfWtxzvUt6wfbZg6s1y3Y
	smm77bOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP7xP-00Bjj4-DJ; Fri, 19 Aug 2022 19:47:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP7xC-00BjaJ-R4; Fri, 19 Aug 2022 19:46:52 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B725C6601DC4;
	Fri, 19 Aug 2022 20:46:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660938406;
	bh=sRXwaDjYZwFvMt0JXRUXrrOwoE4Qoa92zFqWgUdECMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAIUksXIZu2+Lr+PB/54wM3eHvY6NsWHwHAc3TqizdU7gNTDTyx/70X0fuOcjNaVl
	 rjHb9iJX4BjZAP3sYxSS7exR+W5sSqLlTP2jSOeCzzyJmw62Yeb0ZYNvB5t1Cx6Nsh
	 ZhuQXMmyCGiOwxjvwvVjNO3hK2Lg1+h4KoRphJqgPCb/vQqXWra5pyMvLOpl4bXfp1
	 bz5iEOWesxg7+rARRLDfFBWibj6+P29aEEsh+pDdRHlPT5ZF8ZqBg3ImdioGa6d+9m
	 BRITgtCIdF650K4uecRC48QaLCJZDQkQyLZBqS3dII96+s/wAJ3oX3SVhueDE31OIm
	 a2PLtdJoaSIRg==
Date: Fri, 19 Aug 2022 15:46:39 -0400
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
Subject: Re: [PATCH v26 5/7] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
Message-ID: <20220819194639.tiyiiucgdknmjiew@notapiano>
References: <20220819061456.8042-1-nancy.lin@mediatek.com>
 <20220819061456.8042-6-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819061456.8042-6-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_124651_106191_E13C1520 
X-CRM114-Status: GOOD (  10.31  )
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

On Fri, Aug 19, 2022 at 02:14:54PM +0800, Nancy.Lin wrote:
> MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> only one drm driver register as the drm device.
> Each drm driver binds its own component. The last bind drm driver
> allocates and registers the drm device to drm core.
> Each crtc path is created with the corresponding drm driver data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Display and external display still work on mt8192 as it should.

Thanks,
Nícolas

