Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0119C32773
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 19:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JEkA1vzQgHVMss12u64+VzqBqqP6uxq7+u+bkyz02nQ=; b=qvJqoYJgMh5EsXlym3Y+N6NDs8
	9rG7JTVUUy1yA4UQUJNZjODxoP750oR/WSDkFe89+JXvQtbYlHsTigkgaNy/XXur4DoFVEw+ES8Ta
	Tz+VgmMxpVQ4ucABlWh0H3Chrz8c4P8gifFY3johw68JNRp7B5t7T/am2IX3a08mUR6bheiYCKyBM
	eeq6pFDD7BbWyOgzg70FVCXxGhCp+xH+UCoFkVSwB/RA2VjTcSJHrJCUxyfFW0dXEnH6Lu68g7cY0
	ORy+dBfEhKIp7BeLm6o2x7g7WbplOkr2x9dDViCC61x3zihGiBz6nlnIfK302BAq+1znr8IhxAjVy
	XlBQ/nYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP7z6-00BkPU-E4; Fri, 19 Aug 2022 19:48:48 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP7yv-00BkKr-Dk; Fri, 19 Aug 2022 19:48:38 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 305676601DC4;
	Fri, 19 Aug 2022 20:48:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660938516;
	bh=v4ukHqUgANwnYRYp4yTNwFONerykYlV1b7efGDnM8gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBYLScUut67BRsNAbr08FMBWj5y1mKut+5fi7CqbsV3fbH4IhBLlpdBSa5sLo422p
	 AErTVTzPBeiKgqyVqtDK35lLDf4FMKPH1m2neuh6lTPPm3cvDsjRLNruOTrISSX69I
	 vfYhvQ3b1gPT1VfTwoLky2bmSUl2f85hpnooEAczIBI9RESGrKGxpeUll2ik7t9ooK
	 AyhZWbErl1yZaitO1AbHb1yNL1zDYavE5SI08mEqRaiBvsO9anWi4ZOKC1M3mUYXa1
	 KG43Wi2isiTcAe1ye88sSJkJwlpyQmzWbOOwvTmv3pYLH99JjDX6xSmhpBaXXe6jWE
	 X4Pl7JkFxpvQQ==
Date: Fri, 19 Aug 2022 15:48:28 -0400
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
Subject: Re: [PATCH v26 6/7] drm/mediatek: add drm ovl_adaptor sub driver for
 MT8195
Message-ID: <20220819194828.tuevscfdt4ayw72y@notapiano>
References: <20220819061456.8042-1-nancy.lin@mediatek.com>
 <20220819061456.8042-7-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220819061456.8042-7-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_124837_640785_A06537BE 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 19, 2022 at 02:14:55PM +0800, Nancy.Lin wrote:
> Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> the component exists in the path.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Display and external display still work on mt8192 as they should.

Thanks,
Nícolas

