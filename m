Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51579606A32A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vurDkVS5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjKnpFNS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=; b=vurDkVS5y2NO87B2ys+DMuzup3
	whR72dftELOgOgqpaQHj4U3I7l/CeIcCTqdmOign/kdEI6C6PLialaKNcaQqX9KtczG18HQm4rM7S
	PGXNsM1o2MyOOTfYsIcbtAPDwTd/f/4ZR5w36o3DK3oPAOXrI/KU1Yd1qsxNOuvkE5nrQNUQymScL
	fBI4TNlflBtn2O74ejPtJQ+57xYwprl38mMc8FXhdSMB9mZnz5g9Telm4qNsBt9Z9cXou1SeRODys
	+y2R1Gu5a6JHBIDw9jHAbvjQ/CU/xttGlHL6+nHmKsf0VXcCB/79ydVqADdjlbq6NUvwPfNvzKxB2
	Zub9igkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHzD-00000005YPL-3ATz;
	Tue, 17 Nov 2026 12:08:31 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHyb-00000005YDl-2wX8
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 12:08:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so834701a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 04:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794917272; cv=none;
        d=google.com; s=arc-20260327;
        b=aBlpvxr19Ni2YMFxVSQOwcGQ+/YOmD+0OYZOlw3qmtTN4TIULtKePGI0WKilYBRHte
         WOvEiCcmO6hGVRtF4WJ3YbGt+AShoPdz4oPdioiLBjjRRZTYNE4ERkFJmdPkPTmSO/8J
         IIQLtkszin3YqlsUXIYvx4efR2VTDK43Q1I/+2Is4JT84IgoSQGXipiFaKW8r4ybkrPQ
         qUdLVBTuhgy6xfpBLsXuHj7y098/tnJ5RQFd2gPbvPP8sufgoEMFFnWj/SGsGRjEn1vE
         IVmLb9pATvrO1r3kseYktnyCgEn49j3h6So7oQydbdtj7pPjHR80RTyW5Rs1kcVoEqXg
         DJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=;
        fh=rrf4DaCAv7WEhBvnIjKl+sqfzKj39tzOkgKs5xxdBoQ=;
        b=q0iFRpjG8pRHm020Mv8e2KIrSMDxO8yezR+TkKvQ2L35rl+jCxRTmaEjmGdwL6PP0F
         y/nxd5sjZJj/uyIXZMXnNxlY5Hyg2uAfTR3fy6/Hrsxa0r84YK4ZHF+KmWZ+xa/xitIn
         GEgiHX9e5CN7TAtpYyb+2zeuTdHZ2dgLouIJF6Vun7NF98Ssv/0gW6MI+NHPkrz5T1os
         FpzAh9/dTVMEcGcQUaN8ERI/O11EY3DngOECIBO3QdpqcILR/E+h7zmhlLZ6GnTHK7EY
         LA1u4+SDnsXs24M26XUOWu0xV3hfu9Ax29daYYDnR6SYF2wBQo3g8y80wdjQ8paP4tvJ
         +zgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794917272; x=1795522072; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=;
        b=IjKnpFNSJada6sPN2EeM6hXyFnjrzXF4401QuSvT5xoLhj4oU1ftcIi07xMFYVxUBQ
         bfUF34S6V0tvXEjaSbWxgCPSN1Fex7fUHN4sLLYmmalZDrYnCmsxr4bp71D8F8rU3M8z
         FermnKSmd9HKigM6t3Sxs1a4n6JKpbjzT3NvjiVbJr142hE0FJXl3Bu+LrbVvaWYAer2
         /6K0FcEQAU7+K/oLwomvCbsDenGYV21F+1cOltKHlqs9x5SbZDnT+azkCaFPvXJlLfXs
         wHuaWlM+Im/soYxwJjbY3B5IegsGf2CHiB0JMIf6rMShxatcax1vBftylU1AG/sW+lTs
         RHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917272; x=1795522072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=;
        b=ZXSW5JDfc/6xqinyM5QN5FDNDuONqWu70IRVS13bfJ6+CmdjCC13sP6Dj0nt6vuZRK
         22pP9IGGAQWUQwLnbzPtpBfjC/7ibUlZyveo3jO410XIzH2aE9Wzmf1weQMrVcORWeWS
         ERrGBz4SToeMAAcsTKQC0nkYfEhGLmTTycjkvCD1xmVZsx40Q6oyFU47KdSLhviFrDDc
         28okl7qvjAlB/wrBett/Y+BbFkk5TPdM0BWmESzXDgyFjZYcAF26LeYBLlvOesd0mF3k
         hovVkCWKcvzrY+VmCUsjXkP7ri+9Mq+LxN1KmD+q6al4V4JQVmqUoVJBYAfaXu92VwcD
         moIQ==
X-Gm-Message-State: APuU4Z/u7pxhWeP1obNjMwAYYQBK0h7V4fM2gvQC64+QRRQpemBJFeid
	heVZyEyBZtA8cheGJwBiy7VsTpc3QZuSRCyeeds6PQWJZ9IqLPftRd5bz81gzaKaABBuN16fYaq
	HXRN7eUBvGu96GualFAEY8gwQwuRP+fU=
X-Gm-Gg: AYBFou1YlDn4B6d6MVYKAn1gR0FYO+FBb30uMEVSIaJSSKv1hud3mZx7s0XUOVemRc3
	RavNFNSNSu/gUzjw+INahXtMvsWa2orasRV8ZDyEQxbrGlGU9YNKpIyT4hyKCjONvBSZ0rj5i1o
	PYkQ/EUywaPSCtEGiuUB1ZtBN6TIQBtoajxNyIRxgoIZPlO4ID7WwucXXBfQNataF8v8/hsibLg
	OfVo0GDOROLmV/8hVGwkmezHvPSKJsyJxUG5yHe93dCuI8MWptZKLaltm/ix6R8duKSguXIq0sw
	zP1R6wskSNlGaRPGk3NnL4fPqRD1DMDGH54MdDsJpAaXK6GgCHJ8bm/4vFWwTTY3kupIEip3Eeh
	11/lDPC6ErBtnh7GXdOYCN8lZbqncJGtjMQ8=
X-Received: by 2002:a05:6402:c6c1:10b0:6b1:d62b:a8dc with SMTP id
 4fb4d7f45d1cf-6b7c08b4e88mr7273282a12.1.1794917271385; Tue, 17 Nov 2026
 04:07:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117113402.728183-1-l.scorcia@gmail.com> <7fb43d3c-8c9d-43b5-b979-aef65f362ed9@collabora.com>
In-Reply-To: <7fb43d3c-8c9d-43b5-b979-aef65f362ed9@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 13:07:40 +0100
X-Gm-Features: AclHuK843kgmezwD-dXfy2-fm2q_WSzPEZgRrKlkUSUYV45gRmYPefogu3Bgl1c
Message-ID: <CAORyz2L_NDcvj3KkD_6CPFO3QhX1dGWphc7Pfacif2x0n=O_DQ@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mt8167-mmsys: fix errors in
 multiple-output display paths
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_040755_308381_E0DE5B11 
X-CRM114-Status: UNSURE (   5.71  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This misses a Fixes tag.
> Please add the relevant one and resend.

Sure, thank you!
--
Luca

