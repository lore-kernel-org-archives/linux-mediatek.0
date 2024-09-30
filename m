Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23358CF6497
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RF8NQ8XlYpxXe/MHG9+i89q1ADBQEDPUKFvH45+J62A=; b=nAHiSNPjaZ9I/CzqJsGvl6+iCD
	hFtSbVBDVV49TpOwbJP9ZvHI7URa8WGy76MQlYCGn0ZtgiL2+Q6jN5zDiaeno7JgKzoItccXsS7jy
	fpSJwSl4ksZMaGIx+3iaYF7CMq12fIUF74Pnuxf1zcvbD4wuuRvKQELlrRXfQkp51f0WNwSAwlUjX
	nsYq1cq7Jsp+5vtdchfctWXfRyCQrTfVOAc4J3MzYwdqkZu+7I686VWaIpG1ZB8zw3/jTed+P7Mup
	heSsESLs0eZmnrQdm+J70XWBpISf1P8eIdMx0g+n+DvfboA8eOKH6LIGhiZ3AjuzbUMZFC+PlQcQx
	DcKfIfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDFy-0000000Gckt-0F15;
	Mon, 30 Sep 2024 10:03:54 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCpI-0000000GYbA-3SB0
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Sep 2024 09:36:22 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-84e884e9a43so1139326241.2
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Sep 2024 02:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727688978; x=1728293778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RF8NQ8XlYpxXe/MHG9+i89q1ADBQEDPUKFvH45+J62A=;
        b=F5qAiXC7vsfMv33bRIvZzRsC/aqzNBA1yeNhtlkLyQRHBhufXHyOLXQzSVSZBG3jSc
         S/TR6apJYqSV2w8LhW5p30MrJ9f58qZS9l0gTsL1/ujuhz/EncOz1dYTrcCJIh0up6+1
         oaXsqv2E+AZRYV2M6JqNWG7iZGS2KqS/iZ3WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727688978; x=1728293778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RF8NQ8XlYpxXe/MHG9+i89q1ADBQEDPUKFvH45+J62A=;
        b=fMD9wea9AqT1kSV2aCBWYB9TjD/yi1DZQN3r7URYN6BH2kcOqY61IgM9I8EgehpEgN
         kpRBbuZnlLYZrFCQpuzrOHrESXSkNkXEenZXzbRNvkcueOCcBaS8SRYcez6Blvi48daP
         KG0kTRe0uwhDRF/Rsa4kvB4zAT5WKwCcU1gPF9nNs4AO1mIGaO8ieY2sXSqnud/yppBo
         gm4ivob40q5cHfNRFLTBwF+CEMgW4EKfMnFTgEzpS5id6IFkkDMFEIU/hx/IWcYNqxmu
         u2oGPGreWv8VKwFH2xTFdhT8xrBkyGuSu4mLCAMrk7YIGho2k4lbXGtJ7HBNLxXlHsKo
         JsjA==
X-Forwarded-Encrypted: i=1; AJvYcCWz2Jwige7OY1HmBTvB7CMCQ17qpuTyp0tZlQ/obYDHCmE1QSgoS3K7tNSh5xp0JAXH+GVevLydbuCa+f1tEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOf2wjXn3VuJjlps7NxFdjBRoSSLnT83FOWsbJzKZJmlnBYJRv
	Z5L2adIkWyj6gLliPxyzyzua4BXiKHIxoSc594mOwrrHPzsQ4LNhdvNoc3uQNmVUpoFCs5+mEn0
	=
X-Google-Smtp-Source: AGHT+IEew0f2e1yP1+r0BbXH+YZ5uivU+KS5NY7uuWU8Le//RJKzivgwlhECM3WNftOUaabpPsDDzg==
X-Received: by 2002:a05:6102:3f47:b0:49b:cbf4:f56e with SMTP id ada2fe7eead31-4a2d8006eb4mr7182013137.21.1727688978288;
        Mon, 30 Sep 2024 02:36:18 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84eb207da08sm945187241.5.2024.09.30.02.36.17
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 02:36:17 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-50792ed3ad9so531093e0c.3
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Sep 2024 02:36:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXX5Grzi87A58TzJUX2Jv6iRfXUkAuL1E3+azeS0MB6cgvWXug8QXattxA5O4ywnazDK7yG+C2s4L7ulCjpAg==@lists.infradead.org
X-Received: by 2002:a05:6122:2210:b0:4ec:f6f2:f1cd with SMTP id
 71dfb90a1353d-507818a201bmr5969368e0c.9.1727688976487; Mon, 30 Sep 2024
 02:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240925110044.3678055-1-fshao@chromium.org> <20240925110044.3678055-6-fshao@chromium.org>
 <b3842173-7074-4bcb-80f4-1f6f8cb38a52@collabora.com> <CAC=S1nhs4EUR78HunNnz=Z-cG4GgAZ=7JFyJmj6he96Z=GuxOQ@mail.gmail.com>
In-Reply-To: <CAC=S1nhs4EUR78HunNnz=Z-cG4GgAZ=7JFyJmj6he96Z=GuxOQ@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 30 Sep 2024 17:35:38 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhAr2vMYUnhw973RuCe1JzefKdugp-Ls1HktZdsnDTEuQ@mail.gmail.com>
Message-ID: <CAC=S1nhAr2vMYUnhw973RuCe1JzefKdugp-Ls1HktZdsnDTEuQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: mediatek: mt8188: Move vdec1 power domain
 under vdec0
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_023621_070610_F74E8311 
X-CRM114-Status: GOOD (  30.66  )
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

On Thu, Sep 26, 2024 at 6:42=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Thu, Sep 26, 2024 at 4:33=E2=80=AFPM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 25/09/24 12:57, Fei Shao ha scritto:
> > > There are two hardware IP blocks in MT8188 video decoder pipeline:
> > > vdec-lat and vdec-core, which are powered by vdec0 and vdec1 power
> > > domains respectively.
> > >
> > > We noticed that vdec-core needs to be powered down before vdec-lat
> > > during suspend to prevent failures. It's unclear if it's an intended
> > > hardware design or due to power isolation glitch. But in any case, we
> > > observed a power-off sequence here, and it can be considered as an
> > > indirect dependency implication between the vdec0 and vdec1 domains.
> > >
> > > Given that, update vdec1 as a sub-domain of vdec0 to enforce the
> > > sequence. Also, use more specific clock names for both power domains.
> > >
> >
> > As far as I know, yes, there is a sequence:
> >   - Cores (mtk-vcodec-core) gets suspended first
> >   - Then the LATs gets suspended (mtk-vcodec-lat)
> >   - Finally, the LAT SoC gets suspended (mtk-vcodec-lat-soc)
> >
> > ...but you checked that downstream, and your downstream misses the lat-=
soc HW
> > instance, and only has the lat one.
> >
> > Are you sure that this is not the reason why you're getting this issue?=
 :-)
> >
> > Otherwise, I feel like we must ask for some clarification from MediaTek=
, as
> > I'm mostly sure that the two cores are independent from each other (but=
 I
> > might, of course, be wrong!).
>
> Yes I think I should... this is actually based on a downstream patch of t=
heirs.
> My understanding is that LAT SoC is not always in the vdec pipeline
> for every MediaTek SoCs. Although the MT8188 and MT8195 have much in
> common, I have a vague impression that MT8188 doesn't have a LAT SoC
> HW, so the downstream video decoding works smoothly without describing
> that in DT... but still, I could be wrong, and things just happen to work=
.
>
> Anyway, I'll find someone on the MediaTek side for clarification. The
> datasheet I have doesn't seem to contain such information.
>

MediaTek confirmed that MT8188 doesn't have a LAT SoC block. Its vdec
pipeline is (mostly if not exactly) the same as MT8192 which is
composed of Core + LAT only.
Also, there *is* a hardware dependency between Core and LAT's power
domains in both MT8192 and MT8188.
And for reference, MT8192 DT described that dependency correctly. That
suggests how the power domain tree should be like in MT8188 DT.

I plan to send a v3 of this series to include more fixs I found last
week and exclude the invalid patch, and I'll refine the commit message
of this patch all together. I'll also update the bindings to document
the information above so people can reference that easier in the
future.

Regards,
Fei

