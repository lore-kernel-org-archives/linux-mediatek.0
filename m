Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECFBCCD197
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 12:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIkDzOp9lOkC64phyHj+bKX1qlxxtXvg/X9w367rNpc=; b=zuozdXVVn3TCJ83cgbDP3JKCmc
	ajxR37JFNoBrG+Jua4ow0/yXG4p+yv8JaeJFPkUkKK0moAqN4jhkOcMrBdfgpXvjSiRjSiwHyn8CM
	0meMM0DXvdRFkfWCE6WYOcJCZT2QkzdaPtgt5Ffa1h4uUbruZo5rEPli71gdcggtgbZouRUW7a36a
	TUjR9+pteVLUgGAsqI1Eq5y2OQ/v6OWQt9oB+JjEwbPgzTEGtwYy/xumr5VaXWJmK4P5KqrvuQ8gd
	r7VBtsKki/6n2dkZ/yfAW0nAW/0XIMVcAGHktaArf9AhlWKPwc3dZFeXVLWav28mS3OqSwKkADigc
	1/Dm+EwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90F8-00000001V10-2crJ;
	Wed, 15 Oct 2025 12:04:34 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90F6-00000001Uz0-07MO
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Oct 2025 12:04:33 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-856cbf74c4aso1238755785a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Oct 2025 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1760529871; x=1761134671; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIkDzOp9lOkC64phyHj+bKX1qlxxtXvg/X9w367rNpc=;
        b=OPT5UA0OlOZZ50ueWhh5l/U1tmbQ+pAxTu2hguKgLLE5443ScxsK1meXXxsGPav9UL
         ZuqS8weG/P+ebkn7Rkh42W1i87Q5+BJDfGCP+ud2Q/oqIol9vmVxaz8Bp3TuyQafqb2+
         gG3L7WLqBMZo34M/dSoe+WXsL9sIziNaB/n7sVD+n1/6hdRnApFJemt1yddSHTHKP6qp
         I1OzdLd/p6iNEYRei42SL+PuAMyUTPID0GBTpOfHFut5z8v6DR3AwcEsdt1nndTkzyYT
         WuRwQN6gZIOwo5n+GbvCiPBE8Y8Wkg9Lkzz2HPY2obR+e31X1i91k/N98NYRWUpwDqr2
         pzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760529871; x=1761134671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIkDzOp9lOkC64phyHj+bKX1qlxxtXvg/X9w367rNpc=;
        b=nANrWu9mRj32TBZOCv7cM6jqKTjiekFOE6zqjpr7TI5i1FiCJcSE5/d58Kjijt1hcD
         KovFuh6eErUxXu6WZJqJ45BDIF0Q8XlipQ9psz+/h3nnRs+LhStekYiazFCSKfKBhtNW
         WdRg8CPT76B6Qn9wfalLyTSKndNZyX+ABpl3y/BvpOxVYC2wwizQqOKe3zxypMkjjD35
         n52iSJujX5/lPcoennUGfrllbLlG1YvuL4lWW1V1x677pxIjS4Wf0NE/+Z34jQ2HOvR9
         YrsPTCBKP/lhn6qZeX1+SYFiphW6X7CEgMgQ6xp4R7XSGivMhJjsQ5MNjO3hK+DmnuZc
         500Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlClpaPe8nDpcF46+aHUofRoALzKtj0m6geeSjv7GRP+Wntmpb1a4BOYaTiaoWQ9xurOz4Z+cZddwHuC1gzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWTOPY8GYf1Tl1xVAiQsV5Qkva6vF9iQ6Clf/EPvuNufcxRyCI
	R1Vl1Khq/HUvwEOkWlOP75oxLrAA9RVEmdOgJQeCTzUkESXXiHbGPMn/creCjgPdSW7fM24ONIH
	4dC1vdMjXKtfP9Xe9JtIBCXthRRM58gZZkycv+U1QaQ==
X-Gm-Gg: ASbGncvYInRwnFpG+n6KRcxuNTfTGDB7+h1ZeBprfQyVZGKBJjiblVOsJk6NhrvbGlg
	RibcNI+Ohrp9oaHgqMGjuBvM+Nkxwx1YXvA7+dKvfVAONyWHhJqE02+Bz4LOdr56QCyhfVtbTPM
	lUuWBynnjm7aeEO46r5Gu3fqQf5rgpan59fVKGZu4TlgLRXSrUGE195oKgifqoGXCo0FuBGZHkb
	RPOV2ELIfmg66TmZ8TunHeCSVjN5/jWFQ==
X-Google-Smtp-Source: AGHT+IGsy4ghNUujV8ICs5xCd3l4JFRIFi1WBGAyKhaZaEA9CMFYjjgZCN0vS1WL/9stf48sqTR9sa0kj6mJ0PU2Rkg=
X-Received: by 2002:a05:620a:800b:b0:85b:5fdf:69ef with SMTP id
 af79cd13be357-883524cb7c1mr3776426285a.30.1760529870781; Wed, 15 Oct 2025
 05:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251013060212.14583-1-vignesh.raman@collabora.com>
In-Reply-To: <20251013060212.14583-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Oct 2025 13:04:18 +0100
X-Gm-Features: AS18NWBrg_BqO2tS4RN_x8d2btqMDE8us2R2sNEBkP2IYKjicDOGCIjh3Jp7IkM
Message-ID: <CAPj87rPDppYBRuQ99mh=VqrsSErGKcw-ZRY+zPuGrDj77G5k6Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: disable broken MR check in sanity job
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_050432_074763_68FED436 
X-CRM114-Status: UNSURE (   6.25  )
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

Hi Vignesh,

On Mon, 13 Oct 2025 at 07:02, Vignesh Raman <vignesh.raman@collabora.com> w=
rote:
> GitLab recently changed the required permissions for the
> are-developers-allowed-to-push-to-my-MR check:
> https://gitlab.freedesktop.org/freedesktop/ci-templates/-/issues/81
>
> Until that=E2=80=99s resolved, disable the check - it=E2=80=99s mostly ob=
solete anyway.
>
> Based on https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37782

Thanks for fixing this.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

