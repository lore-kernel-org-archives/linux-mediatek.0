Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACCFCDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 19:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BF5auhot1bDClGXN8yxksfDZK+pWZ3Br/2OygZhxgsg=; b=Dqy3HV79ueUbshg3+bpOmN7whi
	aCCJ6P8rUQ1hD6fUxkUpPpZYlybzrV54Tms0CgoGRdBqDi7xLz4wcKhnnK/HxjksEOiTgBwlbsC83
	Qf2W7HGUSMzfBJqOsFx99NzoephC34K9kBzS3XMxsHf/PzeG1ZJVXh75ULAd4kTijYMV0y3YjQIhZ
	ImAU1rOkV3zJMBCmm5lnN2q68GGPQ+1jXP2QDwUSjAKBwcT6Q3s1Mlwc1bvybST92fE7gsgeWFWlj
	sZILs84ZONLBdXpt56F+zIMjCyI4XuqdBNxNdQ5hwJm+kCoWrCwPh5pT3SB4Iz4L6aRbklSqqeF/s
	HiHgw2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr1C9-001g94-02;
	Thu, 12 Oct 2023 19:18:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr1C5-001g7m-2v;
	Thu, 12 Oct 2023 19:18:03 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 57FB56607358;
	Thu, 12 Oct 2023 20:17:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697138272;
	bh=XOvQRewMR/StJ5ta/O6p+3WXsHfd+0zrsVXkYfFjTcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UkH0ypqERYp2FTBmpVNn7AWMLkLVVqgPpwlTm/3eoByGZzH137ghgNGk/8md/dc73
	 0Ks8BauDyDFw9eUkEDBetdowuFH8BD9ALURwE5EPwXSFKlI83oXESWupYxy9WiPggj
	 zV784MHq1fhA70jD5E+V9N2flsAy96lg8zJPCnRi4/gvVGLlHr7MPnyYEekRMaHM0v
	 9wU7A5u6HkuvsDFmIbeOZ3B4FUx+P8oXwthgGwSNP1P0gko/9sFetdg6Gg+8OalEfm
	 WEcSIltPu6TnaPf3n8O3vlWqjah+6/PBKuWaKM4Wzvp+EU1T+KLT0kYubM05mwTOnB
	 LlGP9eOqME/Bg==
Date: Thu, 12 Oct 2023 15:17:46 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org, kernel@collabora.com, ehristev@collabora.com
Subject: Re: [PATCH v11 08/16] drm/mediatek: De-commonize disp_aal/disp_gamma
 gamma_set functions
Message-ID: <1638da95-fd9c-4557-91d9-92bf1b54feaf@notapiano>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
 <20231012095736.100784-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012095736.100784-9-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_121802_079663_DF4CC4A1 
X-CRM114-Status: GOOD (  10.86  )
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

On Thu, Oct 12, 2023 at 11:57:28AM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding a 12-bits gamma support for the DISP_GAMMA
> IP, remove the mtk_gamma_set_common() function and move the relevant
> bits in mtk_gamma_set() for DISP_GAMMA and mtk_aal_gamma_set() for
> DISP_AAL: since the latter has no more support for gamma manipulation
> (being moved to a different IP) in newer revisions, those functions
> are about to diverge and it makes no sense to keep a common one (with
> all the complications of passing common data and making exclusions
> for device driver data) for just a few bits.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

