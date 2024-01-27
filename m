Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80434C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 23:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jb6WzNOjU69Ryl5VimSWdc7WcJrT6NYdCN35vtE0l8g=; b=wmy+W5uTq6BPT/MAc5HIdO9PA1
	JWMW0AsqSFZWfOliCkZgMpMbIQruGeD+wEAuEjnVBCUQ0bdhZXAqAXZHRhZ3LBNxC1M9IA5Tppr2U
	RgnMs9MADP5ILBtzSzuiMyqjZdzn/E8FBqBNEqssAAvfsI+JI8csKXky13AfiHRRxASx27MvQeC6c
	SSju6XPS6m8pzb4rSvIsvwPJ28IiyinG+5RMsKszM5+z2i4oRuN94pEWbupMy5B2i5q+eWAS31XJW
	8kw4WnsA203VENXyRiqSPEAnPHYFAeoNoX7XLCgTPmlkjyTt10bVuTSNVwZkWgC0xJBUMEwkBmobv
	HE+jc5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTsFw-00000008PU0-13EZ;
	Sat, 27 Jan 2024 23:38:36 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTsFs-00000008PSl-3wNX
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Jan 2024 23:38:34 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2142ef4a7feso1161275fac.0
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Jan 2024 15:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706398651; x=1707003451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jb6WzNOjU69Ryl5VimSWdc7WcJrT6NYdCN35vtE0l8g=;
        b=v8emnJKwDyNSCDGl824DB6PMutEUPpiOjiAoF1p5UZXeV2KDiFPd5MdFOFjSQNt80q
         xgy770A/evEQMnARWcqYD8jVJiBuBQgAPzmliyh10i03pqQxjBuH+mFOt23z02IDZPpj
         waVjZJk2//oMev9LwPpoeHRpXBbY5Ezr+VEmBOttFbBPNUYg8CyRws15nJUSIBFKYgz/
         bXBU0Wvy2+Oh6L1cpsMDsMzRXXsp45ZitguoOllQKMvj17HY9o3+OmkzyvZIvZvnP1yQ
         BdUttWPToVvyDmol+ACNFdfkXNMWKn7RxjwISoZC8FuSCfC64YY50dB35tR7i9ZmmDFH
         2yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706398651; x=1707003451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jb6WzNOjU69Ryl5VimSWdc7WcJrT6NYdCN35vtE0l8g=;
        b=qd7pr2YlVEtM4Vcwe70ZvJ8NinvEi+zcFEYPpWUgk2tdAJFVHoGbWXikKDe6TOmnTT
         lYrdGLrIV8Y5qT3GEb/vSmylEMWBikX+oHwEsl0YpB44Yo21pWCsi1GS9BPyTwkyQFvD
         PWHsw0cbY2lXHhVrlxNC32AdDxdAnlYVQczwj1Yf8ZcWPsC/l6TYoBmcFl3SBp9A+gD6
         aPpUc+WKZyQijoTVUb7PvSDxGNZGiLgiwEStFPiBQBTg44Z6mRk2uWKczCfUAk315RgU
         mXZgzeBy5axfAXiX0HOHGB+8lG4Qyy9+dxNy68eBSQWB9We6omtXqBfLnzbMUou2HhDO
         loAA==
X-Gm-Message-State: AOJu0YwpiQwnjfbxs3jEDiZgochawCjsA9nJJYEIwPR7fu641AcMt8FF
	x9+9uSJhDhupT1l2+Cnpy6KHB1l5v4JsyBchKQQB4CDGFqpXaEve0DAYNUfyl80RN/YJBwEwd6Y
	s6R7qLWmFNF5fhWgyYR2fjio3QBBD47p7T5ShpA==
X-Google-Smtp-Source: AGHT+IFs1SEre5NR+L5aDvXgbQuHgUDG6N0Y5iH1sPtUeHn1yOVyVhTtmjBICXXTiujpD+0Wo9kngI/E6d4tsay4770=
X-Received: by 2002:a05:6358:24a6:b0:176:351:377 with SMTP id
 m38-20020a05635824a600b0017603510377mr1356541rwc.38.1706398650988; Sat, 27
 Jan 2024 15:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20240111045126.13768-1-rdunlap@infradead.org>
In-Reply-To: <20240111045126.13768-1-rdunlap@infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:37:20 +0100
Message-ID: <CACRpkdau1QDDCWviEd_aLqokesFutDeorAbWgVYTW09bA9mdZw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mt7986: excise kernel-doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, linux-gpio@vger.kernel.org, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_153833_011062_AA92574F 
X-CRM114-Status: UNSURE (   8.44  )
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

On Thu, Jan 11, 2024 at 5:51=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:

> Fix kernel-doc warnings for enum (anonymous): the enum values are not
> documented, so don't indicate that the comment contains kernel-doc
> notation.
>
> pinctrl-mt7986.c:68: warning: Enum value 'GPIO_BASE' not described in enu=
m '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_RT_BASE' not described in=
 enum '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_RB_BASE' not described in=
 enum '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_LT_BASE' not described in=
 enum '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_LB_BASE' not described in=
 enum '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_TR_BASE' not described in=
 enum '(anonymous)'
> pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_TL_BASE' not described in=
 enum '(anonymous)'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312110210.x3vxq42A-lkp@i=
ntel.com/
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org

Patch applied.

Yours.
Linus Walleij

