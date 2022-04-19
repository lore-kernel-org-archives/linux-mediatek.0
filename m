Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622B2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 22:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbMn9UA4twq8TMlf8RrVCotwr3cH66z0P0tRQchc+wQ=; b=VRZyeiZMHCy7Ww
	On30d1g7RwB06OAYJbi5xVBVmyTMoDEPyai0uygFY2f5vxecCsZ4A/+gobvJXOU6dSFegJOTUY00m
	0bvJfrMFP+hpcV756qgEepbZioUMooZfMva/i9UPtuUpq87pAW7ZHftDNTaTn57RGgiEN2IhK4DFr
	TW6Vcrr32BkFhXwoetCgmiafPCyonONYYPVqFY+dnmI2K1n88Dfc34oCzR+YNbB8/Z6BhBaAWdqxg
	UeUMwfVVt8JbWtCHwkoIlC0W0Nlq8l8A4su3wvh+8Tmq58ToxO3swNFtaJkI1UFx6JMFGS1+ptmPl
	Q9lUIAdR0fhuYx+yNUqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngwWY-006YL4-Ok; Tue, 19 Apr 2022 22:40:42 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngwWV-006YJn-VH
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 22:40:41 +0000
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2eafabbc80aso149707b3.11
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 15:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/b2WbchJKMIG7OLkhvKci/yGaZfbKG5zXqIPhc0xmR0=;
 b=Tt68ItjSM/LAp3E41Jog8JtRpHi8d3dz0w7VxFHGbIGW0coAayZVgW+uNFaU40QSYB
 RsyQDZ5WB1RdpbFj9bnLuB3uBYQuekkcV2YsDqMKmmbniLcX7lL0GM2JWqqjFBWk07e/
 oj26cXfa1ekeVewaAhTStvCnPv2Vfj8pO23xJzyJViUwALqTPc1reSR3b4+Q2YG04JpY
 +/FqmFJ/SC/BlughesaZcUBbJFtsgt7X7+cIMgRHjonDxLKn3+QT3Qhcdzhl3JY+/d83
 dv0ATGFYp5vzYhpRBcS5Bh4SieRgna2e0VfbWFcpS4bYYwsQFpMnqDL6pgzutxom/bys
 3DVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/b2WbchJKMIG7OLkhvKci/yGaZfbKG5zXqIPhc0xmR0=;
 b=DoliOOLzv67Il+a6gItdDBeBEI6epxNiL3slOtdwXem3i6oV2q1aH8HLMCJt0ejfud
 Tx10JxatJ80SAc765Sfeer7ptzzEr3sEk5RRRVh3VwVH2dP61RetVmz4jLjw2jRqNPnL
 bV1qtzIy1apG+d9inlmZM3gbPu+hB9cnx6Bs/8nsb1SCF7X4DPsUYG2IwvUrT+jMkS3E
 YnH3DiPc8+JbNTFk61A535HrrxfJ5Sc4Z4D0RKkvDGh4a6NcN2lOMBOJpfhj7daB7qxX
 RjS8Hk2IJjHAbVh5ME4UqLNtCrdc40C9agWIyPArshYok1Ff2SHTtoDIL/dh/RDb9aGM
 kFAw==
X-Gm-Message-State: AOAM532nlJMV7q3jWzqzfrk4qikgDYIk/gTv1zX3sowYsbeeHoJMCVFX
 Dq6rcYCqXlzLCuBbCMaR7D9nPCcJeMEqe1sIRRQKUA==
X-Google-Smtp-Source: ABdhPJxBvWoEuALS1rZ+F1VO+n+79HViIlGOhO/TPJsJqyRQp0aw9SbnBM6F0FKiFmwkzlvdYO6WDRlljl0Ty2m1AiU=
X-Received: by 2002:a81:6d14:0:b0:2eb:fbdf:639 with SMTP id
 i20-20020a816d14000000b002ebfbdf0639mr18226715ywc.126.1650408038984; Tue, 19
 Apr 2022 15:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220327160813.2978637-1-fparent@baylibre.com>
In-Reply-To: <20220327160813.2978637-1-fparent@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Apr 2022 00:40:27 +0200
Message-ID: <CACRpkdZUVDOL7LzqhaZbq6JA8MxAAqER++c7eCJGY8c5s7Z-CA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt8195: enable driver on mtk platforms
To: Fabien Parent <fparent@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_154040_065141_BD8F7BCA 
X-CRM114-Status: UNSURE (   7.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Mar 27, 2022 at 6:08 PM Fabien Parent <fparent@baylibre.com> wrote:

> Set the pinctrl driver as built-in by default if
> ARM64 and ARCH_MEDIATEK are enabled.
>
> Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Patch applied!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
