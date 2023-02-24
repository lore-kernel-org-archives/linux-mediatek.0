Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1F3C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 19:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEq6BZ/Ibc7WzoW7PICOSSMVyNljsnLYphNMlmpNM/Y=; b=LA2TiMcE6NkT2BhNZzB7HPzeIY
	4lKJvkvV8yzGxK/AU7v5i6+XPw3C12OUI4mi3PKwDsgk4bMhpr2YcozbXhmXQOJTEnpoAnhG11/0E
	6IZhCRCAZHTJ3kTZ+wnj0tL3XtgO+YhMbYewoRkF+RAAI4AFQUpwMKvR3e6TZoKYDwZgICCCQ+yhl
	j83QJb9ybFwAcWputRgCSZupb9WiiookrMPsa8dZGztGG+T45VoOJrNZnHTh67ou/QuMV9qi9Jg46
	7JCkgfc3bWyzVQ6oLVbWjmM+2hR6aW5gIADDEX3uCyGWqvGu5Pt8tgCGpFplYF2UcmzArnTfc1VN1
	m1QbpNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdXi-003dXl-VX; Fri, 24 Feb 2023 19:15:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVdXW-003dR6-W4; Fri, 24 Feb 2023 19:15:32 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 550CF6602FCE;
	Fri, 24 Feb 2023 19:15:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677266127;
	bh=xPQw93D3GC9xcaHaoMbz6Z3gb4bco6b9wkvpXKsQuuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qp+ixLlo7jr5ro5GPvfJxyUteFRxrYXcU8fkkN/J7w7tJpKnmIsalL7EOdVw2rRPK
	 hxT34DtB4CnYcg+sy4HTYgkXixZE4qQV0yo2HnJzf8LyKhoWCipoknyhuLVvW8/ap+
	 MpQFnglphbUP8qdkyzNJi55Tn6CW7mWBShyzkWqo7NRzI9q3QN7hstBBIBB1qJGKxX
	 onUG3AzRWntkms1QH40ykoIpvf3E9/bQRL4UJm3H5V+Mqtdgta223SXtw3dOzS7+vH
	 c7D4tle6neUph2H/Twcx0GzTl5h+00snvJE8jP/wxWGjfw1vjR4mVQQAylaSTBHQn4
	 /RVBn2TAfSu2A==
Date: Fri, 24 Feb 2023 14:15:22 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: mt8192: Report an error if when an invalid
 sidetone gain is written
Message-ID: <20230224191522.z4j4kipjh6y7lnqe@notapiano>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
 <20230223-asoc-mt8192-quick-fixes-v1-3-9a85f90368e1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-3-9a85f90368e1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_111531_180699_BAA77C85 
X-CRM114-Status: UNSURE (   7.52  )
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

On Fri, Feb 24, 2023 at 02:03:57PM +0000, Mark Brown wrote:
> Reporting an error on invalid values is optional but helpful to userspace
> so do so.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

