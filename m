Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5853C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 19:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5gtOD6hXHaLl2flIN5xtqUjHiGJD5c63qPDbo7JQFQ=; b=bQ1ehFF1YAuzSn9sjlyqP+v1H3
	P+OQN4v0fyEcNL7GnCaPCfFvO9/Zee63i5J7bwiHzIXv0e4ATUSCGBW9+wVfuGIincPWGb2n9ofo9
	Wd/mDMQcj0azOirO2sQZQONbpTSM+SCqbRxa7jf8ROJz2mIXKqiJNGEA+WTiepkwEQ8Xjn6Q7xnSv
	zgMtQCcM3/KgKQCaxa9kTBa4AVRFCUbnyP2tBfwE01lfLOSR0+k+sqAWyRz97i5tqLcqkvBKcdKD8
	IOJVTMyWDQcC231mFJ3NGWNNB7R+zpIEAfrNFZXb9+kwz+nXtOduLbVjuJwczJuLepEWRz6DFKocV
	m4GoLETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqg42-001R4u-VO; Thu, 03 Nov 2022 19:39:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqg3s-001R2f-C0; Thu, 03 Nov 2022 19:39:37 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FB29660295F;
	Thu,  3 Nov 2022 19:39:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667504372;
	bh=GpG+ngXsfFCaRT4GOJHRCxmlTrFS2EeFudrgWsqneTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaMyRk9pRHnNTI0UAGNbsu4Gdqk0Y3WTci3YdTVXMassIzSL5bNYV0ha3085r0ETz
	 uMbjZSBan4TgTDDICKU54vOLnB1FX/mNSv84iE4RCDRUYBKg3qV/RVmTtqQmV2qilB
	 jiDVkI8IEzPt+EjySDdn3kO0zFhBXE7D9YRQjBc5jXAbaRPoYJkJvDX+MGypRl52d4
	 j8tLu4fGEBEQ6860QxcOu29NbSMWIp5cAdnvHcAwKmrgoflNg0HPvesqgwlwCA7OUI
	 7ydBDi1ilq1mpLtq1REVGiI4E76XiGSQK7hJv/VI5XWDN/FkFxEs47kWYJHJczA+Ad
	 rXOTW1zk7A13Q==
Date: Thu, 3 Nov 2022 15:39:25 -0400
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
Subject: Re: [PATCH v27 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Message-ID: <20221103193925.ahdhhuz67mg4noqz@notapiano>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
 <20221103032512.9144-2-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103032512.9144-2-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_123936_647343_63CAB903 
X-CRM114-Status: UNSURE (   7.83  )
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

On Thu, Nov 03, 2022 at 11:25:02AM +0800, Nancy.Lin wrote:
> Add vdosys1 mmsys compatible for MT8195 platform.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Change-Id: I8065205ce44baa417f58176adaae9e1eefa6eadb

No Change-Id tag, please. There are some other commits with it as well.

Otherwise,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

