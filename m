Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3FBCA0EDC
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LgA7GylOuPlAE7lu79YVHTi8yuQPdLDmvIbvtSdQ2U=; b=lK0p/SyZ1GeEzqxz4WOKACxwj5
	dKZqwBt/+N0K2s1QmMJNFahk4PVMB9RZ0zcJwxQrtk8WavGlrIIb1UNHMHewkh5O7ieCynv+t68iw
	qWSdT8llztfY0wthQeP7eo1t10lWxSj1fBaMQ73WAapv1NVwXcahMcictLTGF/O/bxO7EKAoYVOiB
	qhA/c4FCCqAxOuX0kyknkziwrkQh/CZg4CIekNgGsoyiK70HmYTM6nRWsz/XC80c43vWjXiUMfMZJ
	IpDyJ+5hwOQlVjG6b/Doh2l2oufQdFaQ5ybbYFfv0ly8fsjYPYkwslM4bEAruCQ0oCV0xCkcqjj0T
	SpeWeynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZsb-0000000HREe-2sL7;
	Thu, 14 Aug 2025 15:28:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZ5J-0000000HI3E-0YMB
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Aug 2025 14:37:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 896FD5C71A9
	for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 14:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F86C4CEED
	for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755182260;
	bh=6LgA7GylOuPlAE7lu79YVHTi8yuQPdLDmvIbvtSdQ2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dYEHhZwaqTvn+JVB6mm4v9XaReY5rHpHmGQOFf8SYbT89bKc7TEtkfLobwZgPwsTh
	 Q8mqteXVXaJIxHbtt3D7w6SLYe2AtH57BH7/ZTAChtlHIaZ5ZBeR1674ZeuNCmKJom
	 Y+mUmJ+7IfSe9+4ltrzqRmXIzvBZ5G1tk5L6osSysjTx2BiTfahYO3OjaiEzLmaXWO
	 TfBMWsMCKqATB3RMznmnAFbtMkM6ABopqhFGae7zzeXfHKYdAi5yA3NpykFWbOcfkH
	 hGesiqofVm88KmuqipturUX6w3ZOPTZNaWGeSkpnk3DfDuK1kvI6KVx3e2DCNMMXbP
	 QCrDE8Tz1qIuA==
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4717390ad7so659192a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 07:37:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1MUq6lo0kMyAQqpd1ZO4lEeJpglASvn9R8dYuXcT1r6F9kEVSVSwlPtDzXidPz35VdwL7dC8+efims2fKIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOOjzJvuVfSpvcbJQyXitHKZCMbyMeiE9N40uhCwrjLQjKz6rI
	9V1LQNgB6fzXmhe17W93paOH9Fno0pv1HTMYIiu9BNmZG/p9ouVbrqHHbhWw6co93ACxlPOic7K
	i/qbfy6VXdmzhcE/UJb3/2xgUyC1ZbQ==
X-Google-Smtp-Source: AGHT+IHS0uaP7CItqCto1gKq+ALdXQ8qoYfqn/fWbxiMih47HHTXn0CntaSCOaendxQ0HffHBSsodaKc4ysKqNiLXYU=
X-Received: by 2002:a17:903:2ace:b0:235:7c6:ebdb with SMTP id
 d9443c01a7336-244584afbb6mr45180395ad.10.1755182259487; Thu, 14 Aug 2025
 07:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHjEvi5mb+1-zD+x1_Bp_0Z2Aov7KDyFksbU4PZKFxmrPa77VQ@mail.gmail.com>
In-Reply-To: <CAHjEvi5mb+1-zD+x1_Bp_0Z2Aov7KDyFksbU4PZKFxmrPa77VQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 Aug 2025 22:38:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8L_tJwL77wqBVxrmoMLEGgXue8wW5dz8TLfUg4Ehn4dw@mail.gmail.com>
X-Gm-Features: Ac12FXzl572Bk8E1YjFThAkpLtwFo2QIH4KQyj4nJ4VDeDrZEEqFg_h6oT4-G7M
Message-ID: <CAAOTY_8L_tJwL77wqBVxrmoMLEGgXue8wW5dz8TLfUg4Ehn4dw@mail.gmail.com>
Subject: Re: Commit d6e25b3590 breaks external video (HDMI) on mt8173
 (chromebook oak)
To: andy@chernyak.nl, DRI Development <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Cc: bugs@lists.linux.dev, granquet@baylibre.com, 
	angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_073741_207564_73D36907 
X-CRM114-Status: GOOD (  10.04  )
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

Forward to dri-devel and linux-mediatek.

Andy Chernyak <andy.chernyak@gmail.com> =E6=96=BC 2025=E5=B9=B47=E6=9C=882=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=8811:12=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Kernel 6.16 has external video (both hdmi and displayport-over-usbc) brok=
en (black screen) on mt8173-based chromebooks (platform codename "oak", dev=
ice codename "hana"). Bisect points finger to following commit:
>
> From d6e25b3590a0679bca1a1becc04e3999f1dfd461
> From: Guillaume Ranquet <granquet@baylibre.com>
> Date: Tue, 15 Apr 2025 12:43:05 +0200
> Subject: drm/mediatek: hdmi: Use regmap instead of iomem for main registe=
rs
> In preparation for the addition of a new version of the HDMI IP
> which will need to share its iospace between multiple subdrivers,
> and in preparation for moving out the common bits between the two,
> migrate this driver to fully use regmap.
>
> Reverting d6e25b3590 with "patch -R" on top of 6.16-rc4 fixes this.

