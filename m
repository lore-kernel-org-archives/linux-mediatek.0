Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E2CC83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 04:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5Pt2D+lJivBS28/plTuvgaI+t3rSje6fmXy3hZeQKs=; b=36B/g/nXf3RVtuGQAY5AXmhHhE
	3EUS5k2Z7vdrfoCBq8Zf3nyRQ+eneZ0ihneBDfhpMj2vfw6WfbEg8W+uxVo+YONUZZcNtvv5AN9J8
	MguIC0Iz4duTW0XPJvm8etqIKaHT4X5ZpCSZXyO/TpTm+CNTEZDCpUSzESPEUW/6316yV1V3ITrZ4
	cpjxCevxcYTYLQZBOPAOtD42JJgCMTpCVreMRKpE/z210fPbSP0HhegTRugvP+yJChe6fROwFc9Gn
	XDB2HjPt71PQdlQJQ96buIcAa5CHY+0PprPypNzm3f3j3PIaQgpLtu6Kv0/vPixnITpECtc/+AiSW
	Hqkrqqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKs7-00000002sak-49Hz;
	Thu, 31 Jul 2025 04:26:27 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKs5-00000002sa5-1nNf
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Jul 2025 04:26:26 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5314b486207so201856e0c.2
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 21:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753935984; x=1754540784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5Pt2D+lJivBS28/plTuvgaI+t3rSje6fmXy3hZeQKs=;
        b=acQyPZqJgLggRcdLUpEnS8oH8FlWMiaq5+7GR1/HQ9AjOBFxbQ4b6ksGqCILTwMxKx
         jM8pA6tDrk8f29b/osqZPX7g2lXxa+Yn5OwtNsbTH1R1o2N55UwfqA96YqVbmbpypbiH
         DN6iUrKNsAPp6/hi9ODbgxeOgYZm6fHDxEfH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753935984; x=1754540784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5Pt2D+lJivBS28/plTuvgaI+t3rSje6fmXy3hZeQKs=;
        b=sT70RvdZ7rb50bY7emBrBu5nMsfBp/V7/Tvr9hgFuCBG/P3TD7d37GhqnW83yOhRjn
         nF5uNojO3cDVwlxVg8UnQtOfY0F1dLZHQuEprmXZiIFmASErDZ/XH0ijnTQ2IEXg7CI8
         X8zKdAngmpKDOGL2VkmSUzEqzulK+EhOTx9i4qS/QkGePWnt7cmcE6FbnGz5bZgGSt4Y
         0izHB7olw68yNgf5UHtciUIZJTTSoClldxtkBYPlam56SGEJwwUwXnbRgHDUnmxno9qo
         CUqvOXReWwvoDWsegxQs2q1YUSPvW+Mv7mgddxJ3aV5R8BO1zbYQG094tzAPGICG32Wy
         Gq1w==
X-Forwarded-Encrypted: i=1; AJvYcCVAK8dfZPZsr/C0jpHNcLAUS7H1b3/SxD8jP/1egN46KKamt3CXydUkLSuzBVyX5FbDKNJd1zLf8IQcudk6rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoV/5xtLD6Ir+ZCTGBLAJA9n+DNGLa3+Eu6O8PkAoJuZj+em08
	pbnG4ERAUcSDURnCUZ0os6Gtx4x+mlPkC328pp+foyzFGkrH0/lxQZMZp8zKt5qB97FQl4P5Fun
	AK1A=
X-Gm-Gg: ASbGncv8zjZK9rRHG3g3ktiUmpVAQzvQ/bUKRFy0KMwbPE+Cp57bvJValQWbJdfz6u8
	kHY3gc515coy6A5Z3wdV+/iHbsam+Fk681a+nmyZZ2qh00loLgVipi92bdE7U5iXnJD1LlZYvV8
	XVJBnuLeAvbLBwa2o83bH1VIwcZuTA07bX8P8y1AGs4cF6qmEzWOI4MfFO/6GSjZB0RbVBsax+8
	u4vr5hg0kZlHIzjzJvjS3ct1u3SCugsYk70JiMLCoWaMNfTrqCdq8ETKV+xAoyx239yqhp8AMXx
	VbdcTLX4s1+O/SXdOi8+L9wVyaE7PdwmhDjZ8EppAsjApJPaUMvGSz7NenGk2rkjr8fE4QZPGrM
	7C2S9qmKMkErPI+W5ayVdPQAxDQ/I5gTeqJcivdQZPIAr1OGOC6OblJUYdw==
X-Google-Smtp-Source: AGHT+IF6Ro9PPzCUCfrD29XixEHWJqzo+mrndfgZ9//5VV6v/lF9HVLIa6ILc3Nb7AWBFp0LdAUjPg==
X-Received: by 2002:a05:6122:3116:b0:530:7747:80a7 with SMTP id 71dfb90a1353d-5391cff7f62mr3746994e0c.9.1753935983997;
        Wed, 30 Jul 2025 21:26:23 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b9a5a2sm201361e0c.15.2025.07.30.21.26.23
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 21:26:23 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4fa75f98b61so192196137.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 21:26:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVsBqOAmmWyYkbKJ1n3eH/H1iZDWd6IL0//mpYlNtnlcWuVFu4NfFneXLDsGFxUV3ihYh3U5v/uuz59vFBGRQ==@lists.infradead.org
X-Received: by 2002:a05:6102:3c84:b0:4e2:ecd8:a27 with SMTP id
 ada2fe7eead31-4fbe7efb067mr3218583137.4.1753935982767; Wed, 30 Jul 2025
 21:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-7-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-7-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Jul 2025 12:25:46 +0800
X-Gmail-Original-Message-ID: <CAC=S1njcFhyY6+dT2MHU02ZsLDq+k_vAVv==bWuoGt3KA18PHg@mail.gmail.com>
X-Gm-Features: Ac12FXzpMbFxjUu23GFYxUNlitLi6oNpjwDf0fTbw3kLbAuwV_H195C3EX5jG7A
Message-ID: <CAC=S1njcFhyY6+dT2MHU02ZsLDq+k_vAVv==bWuoGt3KA18PHg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] thermal/drivers/mediatek/lvts: Add support for ATP mode
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	linux-mediatek@lists.infradead.org, bchihi@baylibre.com, 
	colin.i.king@gmail.com, lala.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_212625_487399_F516DF20 
X-CRM114-Status: GOOD (  11.76  )
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

On Wed, Jul 30, 2025 at 11:40=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> MT8196/MT6991 uses ATP (Abnormal Temperature Prevention) mode to detect
> abnormal temperature conditions, which involves reading temperature data
> from a dedicated set of registers separate from the ones used for
> immediate and filtered modes.
>
> Add support for ATP mode and its relative registers to ensure accurate
> temperature readings and proper thermal management on MT8196/MT6991
> devices.
>
> While at it, convert mode defines to enum.
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

It's not visible in this patch, but a heads-up that I see
lvts_ctrl_start() also depends on whether lvts is in immediate mode. I
wonder if anything is needed there for ATP mode e.g. a new
sensor_atp_bitmap.
Feel free to ignore if this is a false alarm.

Regards,
Fei

