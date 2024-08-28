Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8589C5479A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Aug 2024 09:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDXXPoP3Ql2ed4Kq1NPFVHjXHxrCWpZsHv/VA9HbH3U=; b=fen2kADEyLkP8aPO9XakAhCkiQ
	ML2FcH/dmEU7KTMWXyqAJpjn05UMzMrTcOvI87Lm9UEb36cEppdKUjCOlqEl06LcT6YGZ6mHneUQ1
	+cFNkts8HKb4SYjU8JsaIA8nZp9zCz6PPKrFl70LjN/W8J6IuMQx8uN87KdJF1Gy83yGXTH4sPrjs
	trc2UhQSBtjSWIV5HhOfIIRSwTy/Ppxfew0rLHSn4csF/tVPXpJvIWt+QQhEK6qcodId+9Gnn41eh
	/W/6Czb2ZHaSOquWExmIMFZWh2eFbzoorPkeuDxx0mEFZoojiRan2d8udT9Ui5R+3fNT19pFhY5qN
	g0HeMkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFCE-0000000EmL4-0X2W;
	Wed, 28 Aug 2024 09:42:34 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjFBN-0000000Em77-2Ab8
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Aug 2024 09:41:43 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4fce6ff78c1so1660932e0c.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Aug 2024 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724838099; x=1725442899; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDXXPoP3Ql2ed4Kq1NPFVHjXHxrCWpZsHv/VA9HbH3U=;
        b=eW1qBiEJUGsvuqpc5+77eA2tVfmehuTAqOXvPav6cP7oTTr874BwRv6ePTyfyT4Nmx
         HzEw0ckBdFTfZk8PhucJKEspBXmobx966gXmeCb72bilOOzWpUCgX1XpZmHtS+j6S9oT
         iIpXRFIH6W9jylD0LScmk39gEWkHowph45LJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724838099; x=1725442899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDXXPoP3Ql2ed4Kq1NPFVHjXHxrCWpZsHv/VA9HbH3U=;
        b=QBObDaiNrEMZnXLw/AjPEARu1ajRrgMGYm6euRXhKHLbAfDVUqIiGQO517U6y7EZr2
         mjbvia2s3FIsPAKSF324C+juR+ujnwK8tKqWgHsV6SSB+ZoG5IESniDULGu9zpE5rSlE
         HGuwN1yxlE+GELKpfyS4JelASIFkGLxRlPVpq3+lbe4P23r1iawCR1j/L5c/lHLV1gbU
         FnjQnLTe1h8dKyEftFv2A5VRWjjlB7TEsrNVc37To5CIP+vhhGRmxuh3ynO6NIXUfX1J
         UkvbYZQGC+yNnFFiesU8DD2hDlYqjYmv/cC6UkSxc1WGLzZd6g0h8sKDjigKeAaphQKW
         20hA==
X-Forwarded-Encrypted: i=1; AJvYcCV2zRtWGEBRpt64pRXIP5G2Uttql+b5Nvv2rYMcueLhVYu4kiQMLtZKHZp5szW7f/2XgP0CcxJeCS1FriA1CQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZe4LI9AaJfoxRXMJVZ3tgyM2l1ClDfhFWZLPHpDkGmEQDu9nE
	8KuC8T+G/nv4S3wTZf2z41mXJxADvEdztBLU5ZInnEMMBf+zK/k3HXQUhkmft8HQNZuE9EBntuU
	=
X-Google-Smtp-Source: AGHT+IErdgCcqEhvALuflSEJ6XpyZQMc4DAcTjSajJlZknrS8nMaBqkJChBiZYoanrdZw3kn5Wvm1Q==
X-Received: by 2002:a05:6122:911:b0:4ec:f7d0:e71c with SMTP id 71dfb90a1353d-4fd1a542084mr15665191e0c.4.1724838099395;
        Wed, 28 Aug 2024 02:41:39 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4fd08270f35sm1254582e0c.23.2024.08.28.02.41.38
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 02:41:38 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-842f04589f3so1712018241.2
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Aug 2024 02:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWUTLpyYkwM5wlHJcZ9DSgp5C/dPPdedizR9PONr9MtRt5MABUrBYVXo7ta5DfqbhtrTJFp9bvjIMQ2nXNtww==@lists.infradead.org
X-Received: by 2002:a05:6102:50a9:b0:493:c81c:3148 with SMTP id
 ada2fe7eead31-498f41cdb2fmr15317053137.0.1724838098095; Wed, 28 Aug 2024
 02:41:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240827-drm-fixup-0819-v3-0-4761005211ec@mediatek.com> <20240827-drm-fixup-0819-v3-2-4761005211ec@mediatek.com>
In-Reply-To: <20240827-drm-fixup-0819-v3-2-4761005211ec@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 28 Aug 2024 17:41:00 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngpXtsLUF=A-MxVnmWY7YgwvxHKSe0NuN_n=G+7-kpG7Q@mail.gmail.com>
Message-ID: <CAC=S1ngpXtsLUF=A-MxVnmWY7YgwvxHKSe0NuN_n=G+7-kpG7Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/mediatek: change config_lock from spin_lock to spin_lock_irqsave
To: jason-jh.lin@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_024141_599643_9BB23DA3 
X-CRM114-Status: GOOD (  12.49  )
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

Hi Jason,

On Tue, Aug 27, 2024 at 10:58=E2=80=AFPM Jason-JH.Lin via B4 Relay
<devnull+jason-jh.lin.mediatek.com@kernel.org> wrote:
>
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>
> Operations within spin_locks are limited to fast memory access and
> confirmation of minimum lock duration.
>
> Although using spin_lock with config_lock seems to ensure shorter hold
> times, it is safer to use spin_lock_irqsave due to potential deadlocks
> and nested interrupt scenarios in interrupt contexts.
>
> So change config_lock from spin_lock to spin_lock_irqsave.
>
> Fixes: 7f82d9c43879 ("drm/mediatek: Clear pending flag when cmdq packet i=
s done")

The appropriate fix tag should be:
Fixes: 1bbb2be61bbb ("drm/mediatek: Fix missing configuration flags in
mtk_crtc_ddp_config()")

I don't know if it's worth resending though.
I guess it's up to CK if he's willing to replace it when picking up the pat=
ch.

But the change itself is valid, so after fixing that:
Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei

> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

