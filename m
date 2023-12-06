Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDFAC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 10:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBJ6iAhsy+kgJ/wfCbWXrTYSijd197qp+J2InuCcMJs=; b=jjeaLBiGXhqxtDgBaUa8SrQO1z
	8g+GH7ggQvsv3+IPkOaI91f5BPR9zq1kUK7TF/2zhHA8JfwRxC4/ypdcnHIMvijbOS6EL/1D287OP
	XGl2B67SGPAUL2C/vTb0EnxtJLgpDedHysnsEKfgf3HhWpSc8nhMzGR4/lR9+Q4GBk5a1m45FRecj
	y1lb22I5w83+5yGv+8VnqlUQxOla/67GuttQBx02E7K/YkZbPLncIRLIxdc/u8XZMaQPBuuALyToC
	mpIFOS7qsx7z6Rx9X3Q459bQt3a6XLVphHVaErUzO3FoCfJ/+0Ef9U+YAbHBAyqSF3nEzgKwcEBdH
	hVzG1SCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp0M-009iBZ-1n;
	Wed, 06 Dec 2023 10:19:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp0G-009i7v-1S;
	Wed, 06 Dec 2023 10:19:41 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E4F1E6607343;
	Wed,  6 Dec 2023 10:19:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701857978;
	bh=yp0cMbMxUMjPOPkHoQ1JD3Ha3jH6vl6v0MY52LaELe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bZZYF8391VFswugKIXEFFa1UH61k4XykSx+yzwELsxrUUP30pQKl+EtTtRKJPX9RK
	 Wqg5fN69/LvN6eiccyfTorfBBmBcRpFO92Ez0TOymnPbJr/HfzCc6FbPrvRD0Vl9kK
	 o2Wx0srI4rZUjEfYM0l3sQylf3DbIRP6hK8nE61AvYns4Eel1licNkLOCMeQUs5aKA
	 VvMmikrF6eUyXUNVEcddJcdhk41Ma9rmgKNlLAM84c0IJvBSUiRCX084Sket5aEchi
	 xpuChgKEgZxgdnhfrbYz0ukXikVkyrXfCs6t3A+ZJVRQcHX72U/pGbXWU2F6BsS/S6
	 LSUZxd3Vs9uxw==
Message-ID: <fe265655-3ebe-466d-875b-f74e57e0363c@collabora.com>
Date: Wed, 6 Dec 2023 11:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: Replace dev_name in error
 string
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231113123049.4117280-1-fshao@chromium.org>
 <20231113123049.4117280-2-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231113123049.4117280-2-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_021940_617431_06371767 
X-CRM114-Status: UNSURE (   5.10  )
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

Il 13/11/23 13:26, Fei Shao ha scritto:
> mtk_v4l2_err() already uses dev_err(), so don't print the device name
> again. Print function name instead.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


