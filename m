Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E99CCA0FF6
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Aug 2025 01:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9K+fJNggecVHSH9rsQrWD/IWTdAnXDcN0J50NRvE2A=; b=rNRaofgEi1hVAADpdWoeC1bS6j
	98QFgcMfMQ5AHCuvCWqs/GESmrL2zYTLkAV0wgogLlKFs7+O1laEvEczK9xw1fzye8YzusRbGX3VA
	56rD87kh0jTyemjVntp7/zYssmxRiK8k9tnX+/R4/9K7uo5Z5KrbRfpZ/l1jlEM7ZM3IRqEJljQC4
	8CyzHh3L2nToUpHKlv6inkyIejFJrfyGLtEY1DHUtsQp69WCtVey6D22DrUwOJk/zJe8kxd5rprPH
	HicP+13ZEE7x1e5zSrs7Q0n01ExHEUa13UQXDtA0ZsBPeQR8bid+gmJKAPJ8FJL4BPu8Z7n7PW/2u
	LOx0WhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urneX-00000003yV2-1TqG;
	Fri, 29 Aug 2025 01:11:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmGr-00000003ia9-2tb2
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 23:43:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 217E36013D
	for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 23:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5ABEC4CEF4
	for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 23:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756424588;
	bh=IKkQPTLNow+5QOzXg9+pFjpSfZ+cYSFqp7PIC7fnb5w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iUZaQPUhHcIbg2rJDSFhmKAFHTWvWhrvmQV4eKTJ19FMh08hNcJZ2KDEL+zfW2ntN
	 VItxfr9eF+nJWVo+DJOujC5V8zP71c6zrd+7fCQAbveJudGduKfViJE9E01fOp4dMh
	 m0sIKgj32tXga3glYPSGIvjTJJya2hjHHLDn8SaOfr4IvmCYdohmboe5CAQ2WLMfsp
	 1S4XxYnT7OkSC0Zxn20X1R+ovOPIARvBGgQJW7IVACOY9LLWXseUa6UUPAnwza7+HB
	 4xG514htBPwoMkOMlWq8Zk3DfQ76hwVtsxZhJfNpCtYAdzrS+h0vuvSQZkXvKx3i7/
	 5vGVCvPL+uaiA==
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2445805aa2eso16413915ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 16:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX5NY34+nw49aph0jMxjcsR4bCXhbViYQdmpoWA+JVu3DjMcFxFywRA0OI2SD04RG9yiRAm5LTtZjCiJyJ4Cg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnAxI9wCO/XMSp/W4nd67g6GWr8oD1GVHkVrKeVsXaEQIKHIjg
	93QtCemdC+M3GllZUbnU3Yc845jEZE1CFkfkfAUUpThQUR2u7K+TS5xfQKrpb+ymxJKhXLsE3tQ
	y8BXlg0ahpRNOWet3LzGw1K8BCwPGKw==
X-Google-Smtp-Source: AGHT+IFSLDRoEj3Ks5hwGi1W8AnLLwz/yGpEDFuakB+9DYUjJgQ8P7MVJ/lJfz07WcL7JOg4li7B6vPRid2aUekAwfk=
X-Received: by 2002:a17:903:1249:b0:240:7247:f738 with SMTP id
 d9443c01a7336-2462edee76fmr342377505ad.1.1756424588455; Thu, 28 Aug 2025
 16:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250825150948.2998-1-chunkuang.hu@kernel.org> <CAPM=9txPBARP_60P1M=9SF6HzPWkaj2gDN=J0wCAO2PvjwUWug@mail.gmail.com>
In-Reply-To: <CAPM=9txPBARP_60P1M=9SF6HzPWkaj2gDN=J0wCAO2PvjwUWug@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 29 Aug 2025 07:44:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8yV=Wj_rXWSZMiXJsqzm9swvMj8QnKJAMVn83krYatxw@mail.gmail.com>
X-Gm-Features: Ac12FXzIyWw4_oCgW2atmQfT4w63UswKbptiVkaCrxHf4Fc9WJ6K6uWBZ3v-ZOw
Message-ID: <CAAOTY_8yV=Wj_rXWSZMiXJsqzm9swvMj8QnKJAMVn83krYatxw@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm fixes - 20250825
To: Dave Airlie <airlied@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Ma Ke <make24@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi, Dave:

Dave Airlie <airlied@gmail.com> =E6=96=BC 2025=E5=B9=B48=E6=9C=8828=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=882:27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > Louis-Alexis Eyraud (2):
> >       drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order
> >       drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_up=
date_bits calls
>
> Hey,
>
> ^^^ this patch is missing a S-o-b line from the committer, please fix.

Sorry for this. I've fixes this and sent new pull request.

Regards,
Chun-Kuang.

>
> Thanks,
> Dave.
>
> >
> > Ma Ke (1):
> >       drm/mediatek: Fix device/node reference count leaks in mtk_drm_ge=
t_all_drm_priv
> >
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++++++++-------
> >  drivers/gpu/drm/mediatek/mtk_dsi.c     |  6 ++++++
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c    |  8 ++++----
> >  drivers/gpu/drm/mediatek/mtk_plane.c   |  3 ++-
> >  4 files changed, 26 insertions(+), 12 deletions(-)

