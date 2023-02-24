Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0259C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 19:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4j7X5bZBJS6tZ8anTL22FpvMdZDYtKgep3AsY1Zqzk=; b=XwJgvK1h+1cCFjipRESluDwOjq
	7NeTuxRdtjicL7tutYqsBZEG2Z/pKnGdDChf5+0ua0OSQSszuJJyJJTLR9oaJ/z704119Vede9mUY
	6fJ5NQRB2ZRFy+PQbWlxpHOi1gxArzJqhp3IcqIOOBcWKCkmr1d1TLds2Dl2WlDUt/hKA9vjlCspB
	rpa9EvzpgB+abfrSTbA0VVXQvTf4hfelUnEhkmdTW1F5Oa2woZ+iwFXf3/tCT5lPBPS46suDiRZQc
	NLBZZXnFcNFI2KrpQNznLlQkJ0cjmJTB7JJPvfYfwdWuhxYI2opEuSNC04IByoU8/l/qaxpq79gEf
	dt6fS7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdc6-003euI-47; Fri, 24 Feb 2023 19:20:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdbv-003er7-IZ; Fri, 24 Feb 2023 19:20:04 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F2056602FCE;
	Fri, 24 Feb 2023 19:20:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677266401;
	bh=93WOmXt3Of9KXOA1+0JJLvM2QcA/MehDyh1OEKDHA+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OusYABMC/GMZI+VunNJn3PdsgJr6AbABf3RI19Z1F5wcqComEwcdMt3gCFzU+VeML
	 6AxCeO8L3MXcza4//XqoCgfkw0BS6i3wFu7D/X0JdzOZ6+paNaY7TqOwIWWJDmtjmI
	 1SbSHD3oFMbBCS0BQdEZN4bIkyXnui+7nTUSVBjtGOR+gp2ijk6NOu15oIksRJqT5A
	 cqcvCvUYNWL/TcK/jbaVSE5cEHPmJfR0da9XXJRaZopq6z0K24GUTQEpJeaqAOo9gP
	 RDCe7n/j6Ig7Mna3GMw8pvbRqx5e53yUV/4pAPY+3ucozGAdr2F4Thmgo427LOW2SK
	 5QN6mVPjtIW3Q==
Date: Fri, 24 Feb 2023 14:19:55 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: mt8192: Fix range for sidetone positive gain
Message-ID: <20230224191955.h74h3fcsj6w3k5al@notapiano>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-4-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-4-9a85f90368e1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_112003_761821_01B6D4FC 
X-CRM114-Status: UNSURE (   9.55  )
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

On Fri, Feb 24, 2023 at 02:03:58PM +0000, Mark Brown wrote:
> The Sidetone_Positive_Gain_dB control reports a range of 0..100 as valid
> but the put() function rejects anything larger than 24. Fix this.
> 
> There are numerous other problems with this control, the name is very non
> idiomatic and it should be a TLV, but it's ABI so probably we should leave
> those alone.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

