Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41E2C43219
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EecE0sx/oxKbLk5dsFxeDWPO1BwVs76nXUhtDUC4wxQ=; b=P6Zv8SATpmpw1mP9D3eVz5LRky
	MmuRYkiobxu3lMuhG7XQcZDowscr5+2CHcvO4/0qPUT2d+wB2xRQU1FfEbD9F29VM5Q3OxYGbpXQH
	JTj/gLNN1cvG9wyus0KR77Ar9dfod5JOth92lqUwKWRZ/XhDCBGYq9GmIWagVg90FP8DEgSL1ARC7
	MYR8BEqZslpcpaS59pGG9snhQw+2GkZha9ZKkLOHXxHQPXYM2p6OIR9U6j7/z1n+diVQc3FwnCwCx
	y+wIzBXjzbFDding5u8ui2p30/ZlVOeaE1auE0qJOUWHoqfUXYe+rKoaqyLIjHaZpDtVRjFM/KRmC
	EuniEA4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYgg-000WLV-7F; Thu, 20 Oct 2022 16:46:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olYgP-000WE1-52; Thu, 20 Oct 2022 16:46:14 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C848660247C;
	Thu, 20 Oct 2022 17:46:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666284371;
	bh=2MohZhSUGqmwuDliCCivOWpeD5bO3MbYBpcUQ98ps4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Me/Q6NQuidzZgGKz+QB89yUsmqD1HwCytpLajWWi/83SHoUMmxSFEMShEF9wlu16f
	 cMmF7zdrGD2HlcRAyvyyi0PYChB/Y0fxufARemPw4b80YPkE5eW1S0CXlUrp8Hjd/M
	 ZQbw6cOKjNg2qtszDjPKdot87NRhF/NwqpOcFCRbFyLddnyE8I8D4+q4sJH/+Sg6kB
	 JXMaFOWbMKegjcpwj/w6uXO48ENIJKZRDPHe8ujmd/7VrD51vULICJ2gI8GrJfvUTE
	 CoVUNKiGjYTfDP32vXnJcW11SN3sAzcZRjV4z7sCSzN6CTsTqAuQT+LYiRL+YCTRdg
	 1OH/jpJ2vSRKw==
Date: Thu, 20 Oct 2022 12:46:07 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Cc: matthias.bgg@gmail.com, rex-bc.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v12,3/3] drm: mediatek: Add mt8186 dpi compatibles and
 platform data
Message-ID: <20221020164607.3ysaptgpgn5gfwqj@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
 <1666147936-27368-4-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1666147936-27368-4-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_094613_346265_A0A1D346 
X-CRM114-Status: UNSURE (   9.00  )
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

On Wed, Oct 19, 2022 at 10:52:16AM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add the compatible because use edge_cfg_in_mmsys in mt8186.

I think the commit message could be improved:

Add support for mt8186. It needs its own mtk_dpi_conf data since
edge_cfg_in_mmsys is set to true for this platform.

> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

> ---
[..]

