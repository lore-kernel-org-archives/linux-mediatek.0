Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEA5C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 07:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skEdQR4Yo2BDcEw/vA+e8RnWbWtHA2FnT10WhyeGAN8=; b=cenAGwOY3hIyj0tklWnoMy/vGE
	fslt+oZqFYt9K+OtJWpfgCOUYznzJ/e3VUWm3xhqW9U+CvF9k4ZsX/Li36Wx9kbuYyFZeOQijTyCs
	7OtZLDyv5aQaHWg3r7DC26zo8UoIn3oozm1pSGW+YSax8zYt2gXhRandB/808dn5+83NlwTOdBtRs
	Abs3DIG0tSZUK64TmU9t39pixHjYiIZCX+iVp8G2c3dK8g4hC6z2Tq73sw7oLGeBCayBMz0evef4B
	PGN03EZX/KvRSRw3P8M651tt3cQlvDoJb9o6VYUOfq4pdROAWcXHatJk8NdEWU+MfS8GfByr9McBB
	Lx0syIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3slL-00000006S7n-2Y6b;
	Mon, 06 May 2024 07:27:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3slH-00000006S6E-27Py;
	Mon, 06 May 2024 07:27:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3CC65CE01C0;
	Mon,  6 May 2024 07:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E091CC4AF63;
	Mon,  6 May 2024 07:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714980464;
	bh=9Kw69BfKa5kkeDkJAAyST9I0D7UXthaocRM2ai6H6cA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=TPi2B+bPlbWrXR0vRrMi7OO7YfR/17oBUiIP3I0reFQOse+6mJiSXTFUDiYz9KNxR
	 Xgovz8h0zqDVo38VqRUvYWa495nrfut4pabGPBCiTJyx8MjnJDLDH8Es1uxCDl+3hM
	 UMzY/RS2j75++Trzbyg6e6aITMjsDP7A3+iToxB6REkWgd4QuQHWdTc7nCS3vwzbpc
	 e0z72+4Ib9oZ/Smq22YUV4CnfxfAHkusWe39MT5oJnmX8+hSa589nJhtRd1NPj/zlH
	 6O8cxnx+WZaWn5Rm9rYHzlX2ijHikOqIxGr1IQXAhHqQQIo4MkIs7LcwYYge1M3qSq
	 cXp1IO+KNQZ2w==
Message-ID: <0aebaa438b4f2fd13b8a7ea5a92ca60d@kernel.org>
Date: Mon, 06 May 2024 07:27:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check
 of prepared/enabled state
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Chris Morgan" <macromorgan@hotmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>,
 =?utf-8?b?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>, "Jerry Han" <hanxu5@huaqin.corp-partner.google.com>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>, "Jonathan Corbet" <corbet@lwn.net>, "Linus
 Walleij" <linus.walleij@linaro.org>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Ondrej Jirman" <megi@xff.cz>, "Purism
 Kernel Team" <kernel@puri.sm>, "Robert Chiras" <robert.chiras@nxp.com>, "Sam
 Ravnborg" <sam@ravnborg.org>, "Stefan Mavrodiev" <stefan@olimex.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Yuran
 Pereira" <yuran.pereira@hotmail.com>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_002747_765908_C986B6FA 
X-CRM114-Status: UNSURE (   6.54  )
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

On Fri, 3 May 2024 14:32:41 -0700, Douglas Anderson wrote:
> 
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

