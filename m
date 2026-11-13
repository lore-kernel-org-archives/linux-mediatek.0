Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3833606A327
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=seOIPj1e;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hGP8N56L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=; b=seOIPj1e4ii248+dI650cbAsl9
	qnnsZZxDLYmPFoMD9BoVHeYvYP0aLJ6EFNHbYAScz5XY0zzV1hxrfFytIuQTWdsb5WRIPUvY7Ba+Q
	W4gS/Jj7YxV9aFknjIXqPN5gHbcIib+gtrW2XMcj6JG1QdonbPAUDlO361qx0ZUZmWv2HzQnYGNkH
	puzxraa2kov9gkIBQo1kEycEo1dMwXIivj5iB6HkPRj78oNAFAuts3Qiv+IrfG7Y2BgqDwm2VpW8g
	OvAv/f7yqa89B6XETiFyJ2v5V8gttVXcyI4hrB7zKZknxZ/ZAzKEf9d1wFD6/rD2Z8JC8z2xAOtR3
	pEGzMglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRku7-0000000Bn5q-2jKb;
	Fri, 13 Nov 2026 06:36:55 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRku1-0000000Bn3C-1ugW
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 06:36:52 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so626727a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 22:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794551808; cv=none;
        d=google.com; s=arc-20260327;
        b=mLS+EC4XYh4ZQhGPcxAVFZ+nZReTmC1Eap7r+gvw/FFXWRnUwdL51i7MUY2FfTNMFS
         Ky25x7q4bGr5wm1un+ZsSXzO05fgHgUFnmRXgXaX8UkK+QofCINFMJFGwY4aEIRMIHsj
         iSOR36rj/BmmkAFRATiyoboJirHcFtUNuUi/oABodF9fTMIVTGf1UAakbp6xajQdNzaD
         XrujRL6s2XcX4676I9R2wOnuPGoz4fwlwdr3NAFcyRbuhhR1U3R31dAPadetF0LwwZL/
         TJLnzJcae8+5AIHJZT052az7vsJqsEJGCwqowKaq316w8W6B1sUAFaPZULQ709nUhagu
         EYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        fh=UOxgpFTroIpxVBpGwO2QM/CPh8LVOjvnb6bUJr7Fe30=;
        b=GisO1YryVrIfHbGcWHuGIfXh38Hmam04w2Ks+Y1lgBsp2egChNxMe6jyyvr0CqXyNH
         vNmGlIWYvWTgO5H3pDPSH145Ft2r+77T/L+ExOGMFDSErIXrnfGdAtLjmZ/Z0k7NGCj7
         MIKiBEEfQJlqXu6l+dWdZ9xeX83q5mxmOKd0XfJaqFUUQQ+xJUVSzpWOTLs4UcaC6lvl
         mkR/JveUKqnnTApUgDBql00m4ENfiTUrUSLFm31DsfZNG/15TTpssv0WwkgKeN7gZvK4
         yrOQU0qLBGNEYeY3fLAE8tbX0Gu47XoaO1JVMfGBlShVWv+3xFIg6ZEO0cqFeYOVYW8s
         1C4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551808; x=1795156608; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        b=hGP8N56LqI4/9GnzjkFxs3IdHEFUzTfXGp24Sr2e9BqGWbNYbtx8D5tldtO48wwnZM
         N0b2vVxEshk333xlr8U8r/VdsWr2uDk+RtApSu8ttMZnZs+2thNZgCui4biqJPcCBf8U
         D6Z8xQFAkiV1YkEVezDqPHizQCU6/DOw69rSErxShCo8l+d3jVFCRQ1KBei2IRqjSxnS
         rjI4Y6kCsQJ4xcAhObdmNCXuGL9wyta/sTJH+/ffNBbP64fydZ5hbvDcgJN4eovyeNBf
         p86vMRI2Iz60F5HP0A1N0RUr7lXA8p/q1xkOSaaeWg837B8IknAwmvqqw6JvSaPO4brh
         dV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551808; x=1795156608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        b=bm3qB/lWXcwSln5vrb0930ZPJ4WBGisQ+BI1sEUg/FVGE3eOAKHTZUFCKRr6kgSMmb
         PG8MG9iFxuTR2N9jbGZefeSgyoNs/1TpcIfT1Dwl5V1GkVXtN0z7vY/FhNbM0AEywcBT
         eLc6CqvVj6kdM5Wxu1D1l53o/M/fExQDGnM0TpVsmaZ0gCXB3Yq+kTvQ7kh2mnYQa+KL
         tRQ6gJeazGcFDBi5qL7SstSeCah/DVFv9SH1KkRbPmBTbS02ftqaL+Ft63/MyCo1CNqo
         mFEXXUIOjxhgEvHakXhl1YIvNhwc74TFpmnHf6I/W+C8tN/BAka7aU4EWxDFF99Bj/B+
         X4pg==
X-Forwarded-Encrypted: i=1; AL+hErH1xGRhRTP1XHKUfsoSHqh6RmFd1kgUcYtk49/+w1TcP0Y6DT11/5bz7wW8X2+vuXssKUh5kSIZQtM2R1/4ew==@lists.infradead.org
X-Gm-Message-State: APuU4Z8HVtOUuSDhMum0phKK62vE46i9NchoUsq/xLbedLSP6lVPuW8c
	E3luDN8Uh1njmJJR9zEKAtaHeX8YpZsp+j+tkUlFYXu/dwgg5YWNlViGHX0UzmylpHq35Trg0pb
	lySvfy+CLNHw6cNvLpTlRABT3msg02eU=
X-Gm-Gg: AYBFou2sRAI52htdjrCitI40RsQdOLOc+PkcPRKPpfLSP9awMua4utB2VGr1QbMP5WL
	26Ec616UMbFMkWt0qMLoekfvcp6BtUVRtDZ8JiWRX89YEapnw1mdwzFcd/3X+75Rgu7PnPNuRCU
	aV8dTsIvOM8vdjjCdFDwhXfDfYgOEGhLVXnqWchc+wtbPSJbADAO1KZ/iqcG73K1PSQtiHCdRqm
	o8nzx5R7uDqNbiV9/CnCOU2LRfkjkaomksm7UCe9I/nMLQRqRwz/1NxoPJUjceOzuSXl+DMOI6e
	0Fb7a/NKdEHqjcbmXk/LOJc2Y55d3gJkTatCKixiAJ2Dsgx1JUvxuy31a8j7l5sUlx8luKX2XQ+
	NEhJ/0bSByoSHVwdzrDdkHjSkx5zVGQlCTVaf6oHh4Df4HdF0k4BW8kBsRA01ATtRamjZrRYkOS
	+8HAl0rT+FvGZgA9NogMrHaXlHrMylUWSZCpvLKbgcUMKXjY22vVmVAxWpFfq08s2RkkKdGw==
X-Received: by 2002:a17:90b:1d04:b0:3ad:8ecc:5907 with SMTP id
 98e67ed59e1d1-3b1b0b53d55mr1291888a91.56.1794551808035; Thu, 12 Nov 2026
 22:36:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
In-Reply-To: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 13 Nov 2026 13:36:35 +0700
X-Gm-Features: AclHuK9Tq39ygLippNfyQDEwgJ14gA2IrkABaa-YFSuCcV67ahZWzbVvf6oujEw
Message-ID: <CAABR9nGLAEoSU58+PCTSAjTG+Hn-fDXm6vtN6_omx-EH795LrA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_223649_521822_8B23047C 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Thanks for fixing this issue.

>
> Note that the issue root cause was also detected by Sashiko during its
> "ASoC: mediatek: mt8195: Fix HDMI TX startup error handling" patch
> review ([2]).
>
> [1]: https://lore.kernel.org/linux-sound/20261109102536.357134-1-ghidoliemanuele@gmail.com/
> [2]: https://sashiko.dev/#/patchset/20261014112752.683032-1-phucduc.bui%40gmail.com?part=14
> ---

I wasn't aware of the issue detected by Sashiko,
as I didn't receive any review notification for that patch.

The fix looks good to me.

Acked-by: bui duc phuc <phucduc.bui@gmail.com>

