Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31D3C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 14:28:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D9F22B4B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 14:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WJ5wokx/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ug3i5S5j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64D9F22B4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cKPKDN2qWuU+PJxiKAzv1QzLQFiKNnactR6yyZ0TVHA=; b=WJ5wokx/Xq2B8JieFmTf5znMR
	bhJvPitDYOJWm4DJglnLb8XxLyBrXtZ/c+0x1LVtHvB70yFu0aU5mB6QZNNELVtti9YpsO53dHdHN
	ZTL+mHo04Qp4kn3duMAmHvY70Eva22TgztdpFaYwPAU+IJfkzLPpg4aaJrS9bzIlBStAz9E32rC9C
	zVzdvtRgL4ZVltmmNRXHGZgnt9+ftT/4wmK4oMvqbXy8ID7MXt+3gGXP7QFk4N5D6BLvRzB2jXWAH
	cgHUYR0QIZeu1Bd/Dv7g2NHn4Qvl/O+/jb1+EKFfr1gwDkgUoIDWKKmdMBXo1GIWIjAqAQWWLb8p2
	8d7y8AJeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBIt3-0001Zo-LF; Thu, 27 Aug 2020 14:28:21 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBIsy-0001Xb-Nu; Thu, 27 Aug 2020 14:28:17 +0000
Received: by mail-wm1-x342.google.com with SMTP id o21so5297340wmc.0;
 Thu, 27 Aug 2020 07:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FshHx+iy1bAEWzQUJ7cQEVfyx5chyaL7080CcYDwA74=;
 b=ug3i5S5j6LnxQjeobT6WJyqsDG5rSL5cjC1KdHk/XUjSQaIBdPncWBRt+R+bZVW6KZ
 Jg0GgaKv3ULjDGiVw9sabdOuplNLQzTqpyEJXwvxpftphaysJGeTARCP6zSW8hJd6xG6
 ywaMaQ7nKxpvKWjo/D4ReXw5PtX6sJLmKc42PKKETft4/apJEQliSel1wrc5nYPv1xG4
 gS6EGRFQli0bF+SWIQ3o+AqylEMwBlQ/pdD82wlr8G+ce2rsbnRRDqDjPoPDv/fjLsRE
 XQTD7XQQqNpDRwN2Hu0bNv4c7Az1RlNh9b3ZzvarBWSHqhCLVnNiHTMmuCRDeUgrCB3s
 NWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FshHx+iy1bAEWzQUJ7cQEVfyx5chyaL7080CcYDwA74=;
 b=pgHphalxhOD3TZweaQ8cRNH9tPruLpT0xHFGPq2VWvKRGAPHiYT0FvDGGSygGOJu5p
 HZq/hXD3F8MCSaM0/0iL4VQmxCbzmS6uNDMNC8JRqpaEZwkDFQEB2zb76h1h3w8+vqHD
 mBHzGSUiDNrSb+2MnYIExaQF53KIEID+2mM+PfFhzfvyxWtbw3QMzTQ+i8JnaWJ3jjUS
 omli9MwhrYXo3Hsd9POOsYtUElXEwOoNK2YaJ4A+PvC5ksiATHmytXcPVvwEeqzOMcOw
 e1zzhZQ7P8Flac/Nksk+bqQ7YY+oDxF2lMb6np8yDOEWG5A4KF/QcOwOTQpe3hAoO3Ma
 D1Bw==
X-Gm-Message-State: AOAM532RknKjdEVcriueWFjQSVTLp6AYOoNgXheFVnGmTW+MdAF+sxCP
 0JxveuKNUojD7h0guMG4CJsPid9WRYcEpoeQ
X-Google-Smtp-Source: ABdhPJxXV0L3SpjuwYIyAF5JoXygB8XwFBGwdswwyGmaWnMPJCE5eUzLF2LAxUdEaplJ9f+RBeopdw==
X-Received: by 2002:a1c:6a03:: with SMTP id f3mr12772161wmc.181.1598538495430; 
 Thu, 27 Aug 2020 07:28:15 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id 21sm6843823wrc.55.2020.08.27.07.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 07:28:14 -0700 (PDT)
Subject: Re: Aw: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: Frank Wunderlich <frank-w@public-files.de>
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
 <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
 <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e0edfd9f-5916-80ee-3bef-92d7050f97db@gmail.com>
Date: Thu, 27 Aug 2020 16:28:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_102816_828860_186E32AD 
X-CRM114-Status: GOOD (  14.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: chunkuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Wunderlich <linux@fw-web.de>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 27/08/2020 15:41, Frank Wunderlich wrote:
> Hi Matthias,
> 
> any opinions about the dts-changes?
> 

they look good to me.

> maybe series except the tmds-Patch get merged...so i add it only to my own repo till we find a better way?
> currently mainline does not support hdmi at all for the board. the tmds-patch is only a fix for specific resolutions which have a "flickering" without this Patch.
> 

Well let's see what CK's opinion.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
