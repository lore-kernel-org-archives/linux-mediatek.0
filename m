Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BCFCF044D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNG+QhTQAdWb1KvFrYofboNFibFz2WosHRUzPUAB8Y4=; b=g2/Rkj5n22SqHawXDW9rraFDqp
	/9rgfC1kH25in9NlWPLsmyWr/bpf5vTpR8bJWX9RCiNivz3IEvSk1DYN43DGtaucZT5R5qTvVZ9sQ
	gpE73c0PPVfm8iuRtg6nlTULPR/AE/EKmmTYHSr+muLe3tr5BPXQrqEYg+E9IX0jBFBsnJ1o26IYh
	cDtKEx53N5jraro14jHpjqAT7UuUebETkgPt31mGB462N3hhLyvLogAyrdbvCNxDR2GSgO1RxsK4Y
	jnveHPTWFa1IpfMq2AOqV6e78t2B/9J7KIVLI/NF5HXA106i06YD4cowI7W+r/hEYNfZ+/pyq+r8z
	s/xs4AqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syUPA-00000008y3t-2nXC;
	Wed, 09 Oct 2024 10:58:56 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syUMT-00000008xUL-3lJ8
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 10:56:13 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4a3b67e719aso2314239137.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Oct 2024 03:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728471367; x=1729076167; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNG+QhTQAdWb1KvFrYofboNFibFz2WosHRUzPUAB8Y4=;
        b=LMpqbqqzfhnMQcMK13hxZoLEAfRcETF18ZuEpVNNF7EhWJoA5nPYB0FobpnOz0SILA
         D1VsTBOgsZnC8FjWGPwPMQxREA3JuQW2qm4qKL2S/PUVYa6D+HXmnFRHUjdFAafFiH87
         6VUI6v0BI0nIFG0KCIXK/dQtGzsuNgk2I2nYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728471367; x=1729076167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNG+QhTQAdWb1KvFrYofboNFibFz2WosHRUzPUAB8Y4=;
        b=ssvvg2rBZlJSWvGiOfYB75fG1nVKSKclEz2/pniUxXNRPqtn+IE32ULW2IsC/2Ym/H
         NamITc1Ho9VAlUVqYZv5B33GQ7DSPib8cxkHaU71wbh8LXMEcsmhOOE56YuiZ2Pf8Wyz
         754K5+E0NrKmb+C1vQENsp+oEHUx41TXhMZMYEZYOIdzHXutRh+eGayNOqky6SV7nDm/
         wl5YYzipdiUOww7BJL3lQftaKe1guid7oByapKdgiPm39MU1GIA1jCz5D1lAqI9Q5bXC
         j1Medj/1RWAdUY2nEktizKx+vkugKV3GNyWR0FudMBo12YNPeFno390MP4Ge0Bt/I25a
         lqVw==
X-Forwarded-Encrypted: i=1; AJvYcCUOVT0IamxOdiJuubxxoDgF2MvWFSKUoLHYJzBzjMFPmCQ28e40QaDnlpk5JaQf1o/dFitaSLuA3Tuz9dQqww==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ9UMo/uaLNsQ7qmtv6DfkDOLJ3YdhdmJ/q49WgOq4vHW9tqar
	3DO61biW5I5SBYOFhFEeKnFxJjUPNHcRydyH8S3Xm6dovVQtmXpDFTFEy8oD5gq7S8UN4q+zcBV
	1DQ==
X-Google-Smtp-Source: AGHT+IHyZaRi8rO1eeA1LmZs+0enGy7SbOLlSqa3s6eC3mBnTWu+qjZMBJ19r0R6++VmTPb8gv/QSg==
X-Received: by 2002:a05:6102:2ad2:b0:4a3:cce7:8186 with SMTP id ada2fe7eead31-4a448e37004mr1919075137.27.1728471367346;
        Wed, 09 Oct 2024 03:56:07 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a412e8bca1sm1746924137.27.2024.10.09.03.56.05
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 03:56:06 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-84f1ac129c7so2267510241.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Oct 2024 03:56:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDSx6d6nohkb0nKE4Yac+5v5u4KyptO9j4WQiFE/k6+MZDUtm5if6+zrD4RQv9HbFnu0Opi6nhQXnbIFV8jg==@lists.infradead.org
X-Received: by 2002:a05:6102:1612:b0:49b:d1d1:8f7d with SMTP id
 ada2fe7eead31-4a448e347d3mr2296143137.26.1728471365444; Wed, 09 Oct 2024
 03:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241008053514.6800-1-macpaul.lin@mediatek.com>
 <CAC=S1ngrsDxQ1Fe9xB_EevGbGB5nDoCB_n2oGb2VTLiv1vSsGA@mail.gmail.com> <f1bb941b-cb6d-32c4-2cf9-268fc3f43bf9@mediatek.com>
In-Reply-To: <f1bb941b-cb6d-32c4-2cf9-268fc3f43bf9@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 9 Oct 2024 18:55:28 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngHAf+CNuyMB9ZEW38e3mfVRNy7upsoKyAp1gN8=FGrxg@mail.gmail.com>
Message-ID: <CAC=S1ngHAf+CNuyMB9ZEW38e3mfVRNy7upsoKyAp1gN8=FGrxg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix dtbs_check error for tphy
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Jieyy Yang <jieyy.yang@mediatek.com>, 
	Jian Yang <jian.yang@mediatek.com>, Jianguo Zhang <jianguo.zhang@mediatek.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Seiya Wang <seiya.wang@mediatek.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
	Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_035610_372877_B623089D 
X-CRM114-Status: GOOD (  17.87  )
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

On Wed, Oct 9, 2024 at 4:50=E2=80=AFPM Macpaul Lin <macpaul.lin@mediatek.co=
m> wrote:
>
> On 10/8/24 15:10, Fei Shao wrote:
> >
> > External email : Please do not click links or open attachments until yo=
u
> > have verified the sender or the content.
> >
> > On Tue, Oct 8, 2024 at 1:36=E2=80=AFPM Macpaul Lin <macpaul.lin@mediate=
k.com> wrote:
> >>
> >> The u3phy1 node in mt8195.dtsi was triggering a dtbs_check error.
> >> The error message was:
> >>   t-phy@11e30000: 'power-domains' does not match any of the regexes:
> >>     '^(usb|pcie|sata)-phy@[0-9a-f]+$', 'pinctrl-[0-9]+'
> >> Fix this issue by dropping 'power-domains' of u3phy1 node.
> >>
> >> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluati=
on board")
> >> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> >> ---
> >
> > Apart from this, can you or Chunfeng confirm if we should make a
> > similar change for MT8188[1]?
> >
> > [1]: https://lore.kernel.org/all/20241004081218.55962-3-fshao@chromium.=
org/
> >
> > Regards,
> > Fei
> >
>
> According to the suggestion and discussion in
>
> [1]:
> https://lore.kernel.org/lkml/20241008-disorder-slacking-d8196ceb68f7@spud=
/T/#mccf978d76f52cc26970f3f3be6120055e4698fe6
>
> I think adding 'power-domains' to PCIE node of MT8188 is okay.
>

Acked, thanks!

Fei

