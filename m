Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D7FC5478C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROMdbNXWMhqi1ayUbIsWpqVi7lBvC0ES/SbDCLZCZz8=; b=AIKy22sygnSQZVm9IBoK7DY3oy
	ScPoVddD4XgheEyFM102aCTxJ3av1c04BirICmO0M2N1lHXXdDyN+pw/QDvNO400a9mDZieg6X4/O
	jnpmtCi8L7n9fIqEdDKrBO7aScLgRjc9+ANHcOsDJ1c7noMdMkixU6kRe2Ci+xNj8DM1In/ZZio4b
	cF/r/lnLLK4QuWR/Vx+bN+c7zPtIfGRllKupdv+YFvWSfGZcBFOZA1hrmNhpT1ThY8SF/+rXRmtr8
	QaedfRns4jG6LJ4UImnY/1GlU35KvnkzyKBwI0DmdyXnGPyL39QljhvPv8vH59YsNdyk9ukfHYK5+
	GrwKpAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWFb-0000000Gy7y-3aFt;
	Mon, 26 Feb 2024 08:22:15 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWFW-0000000Gy5Z-0BDJ
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 08:22:14 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-7ce4512d308so1451038241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 00:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708935728; x=1709540528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROMdbNXWMhqi1ayUbIsWpqVi7lBvC0ES/SbDCLZCZz8=;
        b=EXZ1coo+kggY8a/5vfRlfclb+QPHpXINITshaHr+ITvUNidcSRX3BARq14llxNgeq6
         SZoZ4QoPt9x6gX7gV1M9oiwTklvlBVKI+lzqTE7KGuvXpFyekFx6GZals+/GI1rxMAqJ
         wfUZbziehykz0kHGtLMZeO4OLa5Aq57Omgzs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708935728; x=1709540528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROMdbNXWMhqi1ayUbIsWpqVi7lBvC0ES/SbDCLZCZz8=;
        b=FtAZ24HoTwLfhXmV6++AksFXdx507wR+KoT6ErTMXNGsGO4433VD0Someg2YKJvDS+
         FtNQRCGdR3+iwKO2ij62M/R5JR6s8CqmVLdwqYJRqf2HyzwgLQ3t/cXO1CtXl+tLwu5Y
         Nm9Dhq4E0tZ1Xm9P8aPGYVekTHSnD3jZlnlQIscxoUdI8n8oWXTJC5BUtmz07XrlHoaI
         rwc4LPg3GLDs2btY7zabTu0dMVsyJRKwOVkzGZFIXa6j4NOLPY+6cBFVtsjgzin/YleH
         WpR6YgBeP5JIdo/1Nl8Zs/D5KTDsMDx5Q4pPfH38EEP96yN+JmQIn7r7IQwplbi51/zD
         EBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDTsZy4pDLkvZNZNYIIR4KGkcGBFerge9MSue2I/JEBCTr+Gy1jYb3hD7lfMZKierkw6Ci2hGV2F/O2AaAxcpYM1cEMWNjeWZCiEzGA6NAj1Od
X-Gm-Message-State: AOJu0Yya2N7TTSF+YjOt2E19O8sJnNmPCGAUnPSW5UhUhvf9wDmS9mFn
	+VqsmcdiNmQ7PM2s+djpV/41xVc9W5PSoguGhJxlCDAyXlVJUraS1kvhutyg5Wfk79hW6SHjM2L
	gLg==
X-Google-Smtp-Source: AGHT+IHMBnCf0WozhJWLz07MjHsZ2n5EyldBXx99A8Dws5Y6zZDDFmtOfHJYX639isb3KekCLeNCqA==
X-Received: by 2002:a67:f5d8:0:b0:470:3a61:8f9 with SMTP id t24-20020a67f5d8000000b004703a6108f9mr3748599vso.14.1708935728364;
        Mon, 26 Feb 2024 00:22:08 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id c12-20020a67ce8c000000b0046eb7f99601sm794374vse.20.2024.02.26.00.22.07
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 00:22:07 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4caabc3f941so1339745e0c.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 00:22:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+guNy4TLESmUtklVOVuR/AWV/r/ggdHr4JfLRf9B6Nn8F+3TnWpyDObwgX936Z70nHvXYDFSQaCfHjzybos+NXR/UZLZuLTX63yEEcNF5siS/
X-Received: by 2002:a05:6122:4c10:b0:4c9:4816:8d90 with SMTP id
 ff16-20020a0561224c1000b004c948168d90mr4101592vkb.4.1708935727242; Mon, 26
 Feb 2024 00:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20240221165643.1679073-1-greenjustin@chromium.org> <c7d6259b-90e7-41a3-998f-a12edf7c1554@collabora.com>
In-Reply-To: <c7d6259b-90e7-41a3-998f-a12edf7c1554@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 26 Feb 2024 16:21:30 +0800
X-Gmail-Original-Message-ID: <CAC=S1njw4JM++D4kYyi4Z2rcDTsvqD1b0VtpQ5A071dgvtVGdg@mail.gmail.com>
Message-ID: <CAC=S1njw4JM++D4kYyi4Z2rcDTsvqD1b0VtpQ5A071dgvtVGdg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add MT8188 Overlay Driver Data
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Justin Green <greenjustin@chromium.org>, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_002210_566530_57FF58E0 
X-CRM114-Status: GOOD (  12.00  )
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

On Thu, Feb 22, 2024 at 4:43=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 21/02/24 17:56, Justin Green ha scritto:
> > Add MT8188 overlay driver configuration data. This change consequently
> > enables 10-bit overlay support on MT8188 devices.
> >
> > Tested by running ChromeOS UI on MT8188 and using modetest -P. AR30 and
> > BA30 overlays are confirmed to work from modetest.
> >
> > Signed-off-by: Justin Green <greenjustin@chromium.org>
> > Tested-by: Justin Green <greenjustin@chromium.org>
>
> Hello Justin,
>
> I'm 99.9% sure that you don't need this, you can just use compatibles
>
> compatible =3D "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";
>
> as they *are* indeed compatible, and MT8188 does support AFBC as well.

Hi,

I confirmed that I can lit up the MT8188 display with that plus a
follow-up patch [1].
Otherwise a compatible sequence of mt8188, mt8195 and mt8192 would be
needed, but that would be somewhat redundant.

[1]: https://lore.kernel.org/all/20240226080721.3331649-1-fshao@chromium.or=
g/

Regards,
Fei

>
> Cheers,
> Angelo
>

