Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21586C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 22:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zq0O4vVrMjbhd5IPh9dbb+NLn73KWGBpnasQ568iBvQ=; b=staMWgEDX+9Vbg/5S/sy3DSKu0
	KnhxeK0zQKWYKfKK1uPLLaqtIWVmTHWwTrQ0tCAqdGXVWCjfQ4qNnsjTmEFlR8/mPI7FPyU0p6T14
	R0Jw8aAkKCVVF/BvY3jU81RNLoSZ0YoulbEQYwHW4YntwjhNgB1jJkfSSKbt+6qLWasQSm3qFtOGo
	cPhuykYjeQonhuV4DoR36LL0uVq9T6/RIJOsRCiUPK1wUotnBZyMxnxsWCcYZ4wRfsTnCWFHBZ/o8
	eJpkO3vtOptJggq9r51koarwfo95wOunU0N6jpFUQP1+Rm1XIfiDkfDljN/pQ6ovip2j0d3/meIif
	5n+FyMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjSWU-00H2vv-04;
	Mon, 03 Apr 2023 22:19:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjSWQ-00H2uN-2P;
	Mon, 03 Apr 2023 22:19:32 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5631766030F1;
	Mon,  3 Apr 2023 23:19:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680560368;
	bh=MfmeAyMP4kZnUtbedObZ5J3MvrkjTUU/2hwYA1Mdx6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBDhs8F64dEDL9yF4U+vgr0Qx7wzZGhhYKMmrBTgpyflQKR+FKgXbpmO2QUH8zLMA
	 ve/hZuMzhviSVvmZQU+kwgqk9e5zC2CWTUjAJpIyuNV9wZC2XP50X7nTakcK9KuNhl
	 ijrk+HItTJtFXltBIUHqFsfxyQQY18X0JN26j95u7VKSdoBxNlNxjTE655MSrgyqES
	 dav8ToW4kZeyaWNNjEQYeOcT9tdkpFaVXLhDPPNlhJc6Pi8WeTFNRSwRqvtYA8NUI6
	 nrTqdIAyh5rOusfsagIrdCFoDcChchq+COk5gwBb4SF61y4BKFXzQm+ZA/7LozXiF4
	 nahUY/UinXnVA==
Date: Mon, 3 Apr 2023 18:19:21 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: Re: [RESEND 0/6] media: mediatek: Update video decoder nodes for
 MT8195 and MT8192
Message-ID: <4ebd1c9f-0460-4436-8e17-0e46e88f4828@notapiano>
References: <20230303013842.23259-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303013842.23259-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_151930_998124_3495B994 
X-CRM114-Status: GOOD (  13.51  )
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

On Fri, Mar 03, 2023 at 09:38:36AM +0800, Allen-KH Cheng wrote:
> This series is based on matthias github v6.3-tmp. Since there is a
> dependence in the following series, I resend a series for them.
> 
> patchwork.kernel.org/project/linux-mediatek/list/?series=702423
> patchwork.kernel.org/project/linux-mediatek/list/?series=702078

Hi Matthias,

this series has been completely reviewed and tested for a while, and the
bindings patches were already picked up by Hans and are on their way to 6.4 [1].
So could you please pick the devicetree patches?

Thanks,
Nícolas

[1] https://lore.kernel.org/all/98c48690-631d-1086-9b7c-004c61cc8dbb@xs4all.nl/

> 
> Allen-KH Cheng (3):
>   media: dt-bindings: media: mediatek: Rename child node names for
>     decoder
>   media: dt-bindings: media: mediatek: Remove "dma-ranges" property for
>     decoder
>   arm64: dts: mt8192: Add video-codec nodes
> 
> Yunfei Dong (3):
>   media: dt-bindings: media: mediatek: vcodec: adapt to the
>     'clock-names' of different platforms
>   media: dt-bindings: media: mediatek: vcodec: Change the max reg value
>     to 2
>   arm64: dts: mt8195: Add video decoder node
> 
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 113 +++++++-----------
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  59 +++++++++
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  70 +++++++++++
>  3 files changed, 173 insertions(+), 69 deletions(-)
> 
> -- 
> 2.18.0
> 

