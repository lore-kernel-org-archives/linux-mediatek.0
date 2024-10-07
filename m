Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71643CFB446
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPuYg8i4QEggqDnqakprNVU79uhZPjB5d8z2n+kb4OI=; b=JsCYXneRZaRQzd6jYAPOirhtZ2
	mM6tzh+6iTJDOuILkl3j/UVQHojo8xW1MYYwUCaySixH/ArHKgRjrOZwFROfR/inWVg4u6Rtto4a/
	jK/Bza9V3CO3OieLIiqqE8egaPVMJx+MF0fgQqtEAVDjHVooMbB+716C2pzeGuvP5kPPCoo/cszUg
	CetZEgRymBWIpFHRpgih0cbdkcNWobE3l3UutzbU0tCl3tnOJinqnuedYffyN/LIKkj63C+ffMCPd
	LqYDx86sMIe78C9wGsyMDCK0DwkNDE17yXfGyZ0hxGuybCxXbh4WgBCAFPboEyBHpLJpOAVnyeUHN
	7tLIptDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpdk-00000002vxQ-337S;
	Mon, 07 Oct 2024 15:27:16 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpab-00000002vTV-3YpV
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Oct 2024 15:24:03 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-84f1aefd4b9so1359293241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Oct 2024 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728314640; x=1728919440; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPuYg8i4QEggqDnqakprNVU79uhZPjB5d8z2n+kb4OI=;
        b=POwcuL+Cu1aBqV/YscwfKV5/rdMiiF9+HC6KjFlkxmdptWJrL0HQZM1+PaAWK45uSW
         Df1vZziw4XJuhPa/hpmiyswuNZ7q6gXMJ2Bbjx58TUxAu+lgSCB6fRXg5BKh2qmDqaXl
         nWXjVE0Coo3beleLeFqfg9qpvMJdmov1yklJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728314640; x=1728919440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPuYg8i4QEggqDnqakprNVU79uhZPjB5d8z2n+kb4OI=;
        b=ViJbSZYOOv0KfiR3/5NPL1kvHx5nLBGDTYuZarz2sVg6Z5exdpE9VaXl9E8aNvICrF
         ZMMSl8+EQStOR3hyAOQVTljxHh4IKYHYdA2dqUJuZNOq2LKojYahmApvMlh563ycD73O
         nxCLvcXrBFznfpuFWH+5vjU621b7RxCexymUnZH4ULFateNKHzj2Mjm6mrigWnpofGpW
         vTQgk+8jf3ya1Lo6xaKKxxZbuFpi39PP2/C2hPs0l15qCWbiYjuH+p3pePGVxSvY8EhE
         o+8bEWuGaxvIATJlQp0L8SNDCTTsGkcikvPVzyNggGKRNA0YyGyku/toTadMTchzwRvI
         0oYw==
X-Forwarded-Encrypted: i=1; AJvYcCVgOFHkzvnt1LVe6iIvp6TMEZ/PYzs/DmxUCG9yRkuzoBpmIA6M4vo6c70TMR3o5DVpI5otieji85HaaVTiAg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw909wNe58jRR4/24+wRhpc2VzEXP6zUJQjlr6hcWWZDT+9WcKw
	9fx1iy3mBu+nt6Md1ooCyHcF1LU63LquWvGDSByg37p5/G2vLVApD3woSgjcZPyxRIxddu2DhKA
	=
X-Google-Smtp-Source: AGHT+IFuyehvCP6Raw0RXKqnCSwd9mAfcGl8A2jE9KZYHwUYugYmRLTa8c0As4z3Z15EAHKZ94z4fQ==
X-Received: by 2002:a05:6122:4589:b0:50a:8cb6:e9ca with SMTP id 71dfb90a1353d-50c8544886dmr7578624e0c.2.1728314639775;
        Mon, 07 Oct 2024 08:23:59 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-50c9ae57e6csm805592e0c.51.2024.10.07.08.23.57
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 08:23:58 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-84e96669774so1320337241.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Oct 2024 08:23:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNreH2Ig4xqWBjfaM+n1+1Q8WEygO0IZ3ENP0hum0qqV077ZHVmcYsGb/+6ZCo4V6dKpbV4YIqHATOcH98XA==@lists.infradead.org
X-Received: by 2002:a05:6122:1d88:b0:50c:4efb:835a with SMTP id
 71dfb90a1353d-50c85448816mr7156083e0c.1.1728314637367; Mon, 07 Oct 2024
 08:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241007024350.7878-1-macpaul.lin@mediatek.com> <381fcbfa-edfb-46c8-8ee2-1386af2ba4c4@collabora.com>
In-Reply-To: <381fcbfa-edfb-46c8-8ee2-1386af2ba4c4@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 7 Oct 2024 23:23:20 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj-hpt9CS1+_Jt8C710KDz1uYTcTS5qGqSZT9qmmVm7Yg@mail.gmail.com>
Message-ID: <CAC=S1nj-hpt9CS1+_Jt8C710KDz1uYTcTS5qGqSZT9qmmVm7Yg@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: pwrap: add pwrap driver for MT8188 SoC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Macpaul Lin <macpaul.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Alexandre Mergnat <amergnat@baylibre.com>, 
	Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_082401_908852_3BE5BDBD 
X-CRM114-Status: GOOD (  13.76  )
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

On Mon, Oct 7, 2024 at 10:55=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/10/24 04:43, Macpaul Lin ha scritto:
> > MT8188 are highly integrated SoC and use PMIC_MT6359 for
> > power management. This patch adds pwrap master driver to
> > access PMIC_MT6359.
> >
> > Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>
> Actually, MT8188 and MT8195's pwrap registers and code flow are exactly t=
he same:
> since they are, we don't need this commit (or we don't need it right now!=
), and
> we can just update the binding so that we can declare...
>
> compatible =3D "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "syscon"=
;
>
> ...hence this driver doesn't get any commit :-)

... which is already the case. :)
See commit 040c3303f110 ("dt-bindings: soc: mediatek: pwrap: Modify
compatible for MT8188").
And the device tree is set as well, so it's all good for MT8188 I believe.

Cheers,
Fei

