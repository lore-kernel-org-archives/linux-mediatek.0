Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44255103E2EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 23:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfJ0pg4ulLgmlw0TiDKCH/RTKXpm1mM+UIwhZOLFweA=; b=4+BiEWWK3qHkEzBpdx5uLK8+x0
	Zy3Cutm6fmuMPosawcEcbgJt0EbAWoVuEKhOV0u9Q9Dj7vuhlxg9l0erM63DWcaOYr0070Ux7yzp9
	tL9bkrlUx43067M+agzTvMSKMDfFlybsOTmeRhFlMpb31XCQ9iRGcet2OyUgMACgv+ff5VaSWj4ui
	JH+uvo5hfXhlTt4e6auHjKoWq3WYyKPVpmlNJM4ZgLpb7Nmoj7rGoEIy3jmWITKyU3ww6GzcV/Z4b
	hQWpbH8f7VJsLEdXUVgOzxzdzG/WRL2xUNf7yB+arYbHHlmcZ1y1ODU6E6cHuRbqTMSN8F8zaQGon
	jYRAJKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SYB-0000000Ck2p-1bhc;
	Wed, 11 Mar 2026 23:01:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SY7-0000000Ck1M-1dCQ;
	Wed, 11 Mar 2026 23:01:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F9AA42A73;
	Wed, 11 Mar 2026 23:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FD9C4CEF7;
	Wed, 11 Mar 2026 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773270066;
	bh=M43vvKeQEycI0Se6DJz0lUqaq2xuGnr0lBhb8EOl+sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TFg4LtDY60YO3DcpIt9jlsGJRZl8kpQHrl28MfEteMjifEiNlK2ItuP6nJyPjAOIa
	 8IsWNSauYnDAXh57ABMqJwEw6UZtzN4dbupuKBv0DL9sNh+DewkqUnfQxhJpaLqbX3
	 qx3AH/mafIMqKPqhbPSJNNmkI6fkeAasKrSjtZolNhljxehwodpFSP2WvR3YmUOHBb
	 Xb3bFsr/f0d8FPDOK1S+sP3Rtkl0GvmUhWBSrmR2+cjHQvVIuX+z3TQIRlePjq4+2C
	 yDWf8leE2GPvPwQtnZ84ErtgphEYfSlH5Yt1hKSBs/dHompWid4+Ac08J4uentM3hg
	 lI3D6wZwimoAA==
Date: Wed, 11 Mar 2026 18:01:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, wenst@chromium.org,
	kyrie wu <kyrie.wu@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Maoguang Meng <maoguang.meng@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Longfei Wang <longfei.wang@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 5/6] media: dt-bindings: mediatek,vcodec-encoder: Add
 MT8196
Message-ID: <177327006458.1099258.2235399248272370761.robh@kernel.org>
References: <20260302035244.8994-1-irui.wang@mediatek.com>
 <20260302035244.8994-6-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302035244.8994-6-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_160107_465919_7DEE516C 
X-CRM114-Status: GOOD (  11.86  )
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


On Mon, 02 Mar 2026 11:52:42 +0800, Irui Wang wrote:
> Add support for MT8196 video encoder which uses VCP (Video Co-Processor)
> for firmware management. Unlike previous platforms that use SCP/VPU, MT8196
> requires VCP to load and execute the video encoding firmware, with the
> encoder communicating through VCP to perform encoding operations.
> 
> Add the "mediatek,mt8196-vcodec-enc" compatible string and introduce
> the "mediatek,vcp" property to reference the VCP device, which is
> required for MT8196 encoder operation.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../media/mediatek,vcodec-encoder.yaml        | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


