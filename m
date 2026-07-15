Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90453C44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzANICZPcrQ4mfbgZVA3ED3GO6T9Lf7g8EslsvNWAkc=; b=XNJqcIB6IB53p1kC4umodiaQLp
	0o2qg1MqHTcXKSq7pamB7zVTf4icr9YllKKP9Oq8h5ry50Is3QlUjzz3igYD3lbfY4eEI73Ev1Nuu
	/fLys8uZ+WBMW+HqW/gfKe4l/nlwz37y0PSgV2ethU3xuYHl9sx6EWk7hB+dKkgy6T2SmvtWyXF6V
	llr/IT7xa7nxPYXimrq5uPOdsFwURMK4Sv8EWDxgVEvINUJAI0gnzgb5Vfxv1OCe1OZRGETi6T2c7
	NTBlOv17v1gQgG/bVz5yf426lU2ubGwO7rbDCCg8/E9kqadFpZyA6E+PlWHE0BgeaxfyWgut5dxYK
	ocy/uR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjznI-0000000ExoT-0Bll;
	Wed, 15 Jul 2026 13:37:00 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjznF-0000000ExnC-2Xad
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 13:36:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-475881b9a4bso1892021f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 06:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784122615; x=1784727415; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzANICZPcrQ4mfbgZVA3ED3GO6T9Lf7g8EslsvNWAkc=;
        b=IiP2Qda53iKfvzmaMVFsaT0I9yYrRrg7cRh8ZCY/SFOdVHkRw1sUu3TdehDfYQJZnO
         Gd/VVHNNAK5mrOwXso+f4POZ/ErP4YTpX3uzMYRKkHyoMCqjFWp5AYlqa+O5WgldULme
         UigCdnaRW5KqHJ6B3bOd4IUTNQoogayFLSm+FRaPFnJJ/62C4sRMb3wNbs7Ilh+oSXzE
         gS3HA1HG688PY4zeDnxV+A729wXobT5P2GZyETYnD0u7MAI6t/uSpVbg8SXonxbDc8rw
         3kaWl5DaEblA6IibkyEltv6Lgc+9u6duGRilUjOr/ntPXwAazYevDXISCPrT7aYuUs+1
         PllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122615; x=1784727415;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzANICZPcrQ4mfbgZVA3ED3GO6T9Lf7g8EslsvNWAkc=;
        b=C8C9zcw7CiPv9mpNVF7U/yIhXibXM7fWp4OVt46T0SF/3OlC39W8VodIR0V8liozjv
         cWY8plX7q2qB1reIMCu8O2tALCoW+u0cw+At8zK0npum80LnsSFWpub/gEbuuNen8aWb
         2mRh3tQvD2tpqLMJ87HBmctn1J060P2QDkylcmEYgvN12ComBkreqvTLgqfsPpL9ZNEs
         J19jCJVrklGcyLhJu+vqvaEdYCamgXz/ED/Ss22XLUWJWpFyrUi5RRUwgqllkQvdCdLa
         pLrYsXhw9qbRdDwhwJgfADCqp40cdCEC4ufPs/Yirr7hIXgwqUlzeZg9o+tDo6KDOYIZ
         C8Sw==
X-Forwarded-Encrypted: i=1; AHgh+RoSH1CUksIuyw6b470sAFsCyAGH3o7slURQLDYzQz/jDRAqJsWxXNQ/RbketdlsZ2zVe2deM6hwo2WOh7bZpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyE1XFKyRPK6gEYss8NW6X0YVjxl0spWi3KKNVwxAS4KFF/BzAj
	xabdzKCndDoI6Fd53mrB/SK++SDL77eDp9qAwfLNuZMggTmJmm0+U34j
X-Gm-Gg: AfdE7cnrghuXthuPHrDTUfl9POTETDqAhk/voF/E03E8OP6Nje9xnxgo/xj44EDToIj
	1p/NyFWzd+/tV8STQ1KS21VP1Hnh+ig+J4+AWMVf9qrSaKKJGzMCMGHXTFfNsoOk/yYeDkkcl7j
	zT2nifmh291zrft1+UGs20quG0+1k0DgQI7T5ef9qZymePCY8bUXXLfzTBY2AkZDEkZ1jBlSjun
	rZja/tq3J5mt+2n6r5jGolMh6hjvP8ByXpr8rI4JCR1PKaSSIyDdlqvdYcmFOK1YrFrozmbUe7X
	ASwgYcNZr7KMsOiXkwyi/Yb+Sm5CqGOsD6CcYLBcqEPXO7kG96OblXz2n9RTpAilJCHjSpPNE1q
	zU43t+HXtMmHzITlss11tewGLbyn5g9rmUrC0YmplzTKH8ZIAzm7Fdmyw3vcu4TjoxqT0wkTUNR
	aI0EOetxta
X-Received: by 2002:a5d:5846:0:b0:475:94e1:29d5 with SMTP id ffacd0b85a97d-47f2dce942amr20020545f8f.20.1784122615112;
        Wed, 15 Jul 2026 06:36:55 -0700 (PDT)
Received: from owl5 ([2001:861:3201:3d10:e682:163f:4878:db7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f462e0cb2sm16802692f8f.0.2026.07.15.06.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:36:54 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:36:53 +0200
From: Gary Bisson <bisson.gary@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Esben Haabendal <esben@geanix.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Adam Thiede <me@adamthiede.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
Message-ID: <aleM9Wy9otpd6Je3@owl5>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_063657_668234_568D1BFC 
X-CRM114-Status: GOOD (  20.40  )
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

Hi,

On Wed, Jul 15, 2026 at 03:25:11PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/15/26 14:53, Esben Haabendal wrote:
> > Gary Bisson <bisson.gary@gmail.com> writes:
> > 
> > > Some bridges, such as the TI SN65DSI83, require the HS clock to be
> > > running in order to lock its PLL during its own pre-enable function.
> > > 
> > > Without this change, the bridge gives the following error:
> > > sn65dsi83 14-002c: failed to lock PLL, ret=-110
> > > sn65dsi83 14-002c: Unexpected link status 0x01
> > > sn65dsi83 14-002c: reset the pipe
> > > 
> > > Move the necessary functions from enable to pre-enable.
> > > 
> > > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > 
> > Hi
> > 
> > I have run into the same problem, but in combination with another
> > pipeline. I am seeing same problem with an i.MX8 using the nwl-dsi
> > bridge and the dcss driver.
> > 
> > I have submitted a fix that adresses the problem in the ti-sn65dsi83
> > driver instead. With a bit of luck, it can replace the fix proposed in
> > this thread.
> > 
> > See https://lore.kernel.org/all/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/

Thanks, just tried it on 7.2-rc3 with my patch reverted and confirm that
it works too. My assumption was that the SN65DSI83 was locking the PLL
earlier for some specific reason and therefore was reluctant to change
it.

> > /Esben
> 
> That clarifies a lot of things.
> 
> The patch on mtk_dsi shall be reverted then.

Angelo, do you want me to offer the revert patch? Should I wait to see
how the other thread goes?

Regards,
Gary

