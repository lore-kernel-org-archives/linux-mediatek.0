Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963D0C48286
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 22:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1niz+9BFP8nJJvQSZtstaXWeqGreuVXwyIK+21IaXQ=; b=bsWpQPRtZblW6gVs7vjVdUsF2C
	9a8GlHLhPR19eG8LXy/GtxI6nCRKGHUCVyv9ZYDLI8iPSr7AbKpaPF8FvGmNeTmIOxkRHR0Zbopu9
	U/4m5hWsAGyhk0zBhFGs3G1iiDL/PuOxg2zeW1AuTGLR9772SJYmbIrIpMuvKR8BDxvVhIktAtsCD
	zEjRRxbvXgJd2I7WAuif6KGwy/yT8jSWQ5LL6B8HxR3KMi0rqfJKliXkNQWtrEbayU9zl7mH6Xs7y
	4kD5qShTTnO7jY4Q2Y36eXURzwGEiaWJiQ0D8y0+/qrnQq/FJf575K/tkBIkY5kdY1Mf0PPc4o57D
	mRqiIKrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVfVz-00000009Wvb-3nsj;
	Thu, 01 Feb 2024 22:26:35 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVfVx-00000009WuJ-2TiX
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Feb 2024 22:26:34 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-46cfc9a79ebso126081137.3
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Feb 2024 14:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706826387; x=1707431187; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1niz+9BFP8nJJvQSZtstaXWeqGreuVXwyIK+21IaXQ=;
        b=zjbYW0HUa8UkTQnETCNkS8JXVY2HlCzqRX2fjTFqk3tBBN/OULso5ijSHdxJ6dzY3b
         NxoaMECR7EqgWRQJO8Y3+r/tCh81z5YS2R+ocm71hw6mMWd5qk+rfVBliVGGNckfTl8W
         rYr2yGKGUhgYJxBl5yg+f8abjyM+uViMJVbHQjlZ3wR0fnphPPbP+6KtGXv5AIq9JCLJ
         kV2qUWheoV43mMJA0J8lsyyntV+HEIMNA4VsJK5nX2te2tib1xRvx1G/niRHDV8bEGYO
         gCgvomj8M9vjGXz/nSeJA2dQUSwMI1f8U1fBFsM+SYxoNVxESmyhpFocyK7WXWhPnxqO
         Uh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706826387; x=1707431187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1niz+9BFP8nJJvQSZtstaXWeqGreuVXwyIK+21IaXQ=;
        b=ZeXc7zPkUou4npJnyjPWUVPvxiv88fhiJhgMfZqVirUk/iquDWQGWvTJq9WouVGW9x
         ZzIEfsBIkaLwHFm7LMFFaFgAbuAd/ivA+zSnG5YbzyVBNgtbPT+qPAjlx+VrdCiCZU7e
         CKZfH30UqOwLksVkKVaFl4aLsGrsSgj+FOSXV3jO1CuXMszpgNAxQ3d+mIpMg5XBxOOv
         GH1JjiyKv6uBkv1WmhODzo0bRaaKDCBKRMncy604eqNOqxazFaZp7O1+C5gNovdYaevO
         Cie2p6BTvy5s6wWot2um/OWtOLFbez0V9tjS3A97cwFx/3jbCKwngxoJMRlsscNbotrM
         n4Yw==
X-Gm-Message-State: AOJu0YyH1Sh7gCo96qVFXpWa1FHPZM6EIDj6i2fNCrW4Arvr5Xb8t8Q4
	o7+IgTgL6XAmHAIZpC8LO93otf1mXTODHUt6ngRkRoJee24jfWBnYzkYd3XMoD7pa08bd9NU+ac
	BQmy+bbE496Zy0Yho5HoJGUc7I+iNcfkyN83Y
X-Google-Smtp-Source: AGHT+IFCuKF6QiU+ny6kuZUF3GaDPIhQfm+qSFreoCq2anMqN2UYkMUcoGIgF+ZV3z+Yz9/V09IBhzG82IgRKFYsfqw=
X-Received: by 2002:a05:6102:806:b0:46a:fd91:c15b with SMTP id
 g6-20020a056102080600b0046afd91c15bmr339945vsb.13.1706826386679; Thu, 01 Feb
 2024 14:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
 <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org> <20240201221654.GC2240065@dev-arch.thelio-3990X>
In-Reply-To: <20240201221654.GC2240065@dev-arch.thelio-3990X>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 1 Feb 2024 22:25:48 +0000
Message-ID: <CABCJKudd3SUy3Qor7Tc0zyJsSAWy0PavbbBFALuWEpBa32pBCQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: mediatek: vcodedc: Fix Wcast-function-type-strict
 warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mike Isely <isely@pobox.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_142633_647156_9EEC46D0 
X-CRM114-Status: GOOD (  13.33  )
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

On Thu, Feb 1, 2024 at 10:17=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Sun, Jan 28, 2024 at 02:12:22AM +0000, Ricardo Ribalda wrote:
> > Building with LLVM=3D1 throws the following warning:
> > drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32=
: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsign=
ed int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned =
int, void *)') converts to incompatible function type [-Wcast-function-type=
-strict]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I am not positive because I don't have any hardware to test this driver
> but I suspect this patch is just hiding the warning without actually
> addressing the issue that it is pointing out.

Agreed, this won't fix the issue. The correct solution is to drop the
cast and change the handler type to match the pointer type (i.e. use
const void* for the first argument).

Sami

