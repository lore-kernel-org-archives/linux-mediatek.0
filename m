Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDB2C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 20:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5A/mHNM7jDVmdI4ALLKbQNDMLTwQJHtSd8/ueXMNGQ=; b=tZO1UbJVW+tHYtfHld5g+CqEz6
	AxkjNIiCfT+1MswSVUNtC1jtPMksg03B+qTDff680DzNTzFyROiO3h+3WLsois5M61hj1IRn2LyIq
	a38DniOrXX5b4fS3t0gcSa6azj/DQsc2+JrSUjB4AuDUcx8npIaN+HIAgmVeuu1KjfdxrgkWeY3pj
	k3wMJhteje1Odx4+uthBpsoER++8cLZ9jc5uRKwgcTTXdT2ASCY86QaR9pePdVjTRLglP0ER5CHnl
	tuJRN22z8RxGXnmD+Q4UAWqDYS/5undlXIZtZ8bUxBnh53JSkWZN7Pntiy3WHbZPoi/Hqd3gD9XYi
	NFppe27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQaLt-008fsd-QE; Tue, 23 Aug 2022 20:18:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQaLj-008fqV-FK; Tue, 23 Aug 2022 20:18:12 +0000
Received: from notapiano (unknown [194.36.25.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C25AA6601E70;
	Tue, 23 Aug 2022 21:18:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661285887;
	bh=3HtXjX4gyHmU0D4ZFCriKrikrXvs5wvAt9U4bZ/suVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ezfM/oUp6/AuRLjhow5JNV5fK54K3j1G+aWnWYXn4cTK1ZLqKWrWn1aEleUvpwpSU
	 dNfQq02+hg2K7p9NE0q6DJsPVeFzDAMc5XvjsNjQLg12J7T/78CBUrg9/LccOV1tvf
	 jFzNLcpOXWzmYU2noLOEaw3+j2DWRQdSZDhHDNcXdDwuT0s75Hg22SQ/IeU/Hb9vWh
	 ymVIbv2HxqnldjJipD3KwxkJ4+mRZoN7MejPeGbIkWuZFNAWyhcRs0d2WeyDxEQmZ7
	 WyXAJcpMygBHOpodZkF9MZe5IB4XrL/I2Ai5D2NBzG5Jnq9FQtG1IB6ajrxb7Jas7G
	 E2AH0/6f3Gfzw==
Date: Tue, 23 Aug 2022 16:17:59 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, matthias.bgg@gmail.com, rex-bc.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
	yongqiang.niu@mediatek.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v3,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Message-ID: <20220823201758.ffbgb5t5odoicgir@notapiano>
References: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_131811_662962_53B08667 
X-CRM114-Status: UNSURE (   6.37  )
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

On Tue, Aug 23, 2022 at 02:38:22PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add mmsys function to manipulate dpi output format configuration for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

