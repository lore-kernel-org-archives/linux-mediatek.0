Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8E7C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 19:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5GD6MkHX7WmXC34aYo8Jd8L/HyARqQLzQRi2/c61g4=; b=hPkz2SXXdTIoqny3ephfrR50Es
	XlU8xd0KcqlfQnjs/yZ+vxnR2SNYhhn4plNvf4VU/qu4+M7WabbOGN8QPML5lSMbNk8v+Cfj8Y7zC
	cG9Dt8xnkDPGIcWsK9d4uv61ZVlnrTTy1kaQ0/PUsaqvGyuWN42lCAG1+0OeaNesGJbAifTxvjuGB
	VvHvx1L0UMdbYt92GKyUmSgVsjQdM3AYpK9yHUWzZPkHSKFbuRh4WTBW1/fBMpZo15TWAlIW/bteH
	KE72Lh9DvmuQE4xItoSDydqY70fPTU3EebelCqx7VhGvF//txmbLM0SKRLVzct9X5nhN1xbo9a1l+
	IgYOjtsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdXD-003dKv-3H; Fri, 24 Feb 2023 19:15:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdX2-003dIb-Ul; Fri, 24 Feb 2023 19:15:02 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 538826602FCE;
	Fri, 24 Feb 2023 19:14:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677266099;
	bh=7MIYugRF4OeYSBU4bCpar84Hqz7+bV4a7/GjaOqhtPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PRETDL9/iBhS4S+FVHo+zY5QuY+M9m2bXMnVfviqogi+YSixjFekYZfWjzicgF2C8
	 evXIeXfGn5rGA865YJ1ltShN3utyNoVc1gwimcsbF4sj6QUcs11XxQ7BYFOX5p6rz5
	 8bpYdSqxODRW2ya/9tfUSgreE6/4c5itaX1lY3cluKjFXht9SfiFT+l82ZEbtp+jLv
	 K5NXKQ4pUHjGn9FxG2I88ET+/cJhbvjuDUzefKXrIxRalXmCmLUK/9sH7TJTBhicGf
	 3nANM21h+f3gaBg7bC/yv4B84hTAaTzCoM15LT3l6TAwVeAu5cNwgncIIyttp0qMLB
	 zFzCp9XepqKsQ==
Date: Fri, 24 Feb 2023 14:14:54 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: mt8192: Fix event generation for controls
Message-ID: <20230224191454.pklri23677z6lae4@notapiano>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-2-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-2-9a85f90368e1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_111501_143072_8EFBD917 
X-CRM114-Status: UNSURE (   8.24  )
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

On Fri, Feb 24, 2023 at 02:03:56PM +0000, Mark Brown wrote:
> ALSA controls put() operations should return 1 if the value changed and 0
> if it remains the same, fix the mt8192 driver to do so.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

