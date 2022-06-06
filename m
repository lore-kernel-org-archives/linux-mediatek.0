Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F48C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7ToivEQgQ3RuxhK5sCIiusIf928IX3Z60gt4d/Ktzg=; b=IXPOELSW9plKVk
	Qmitubl4joSEAmC/kb4RRqcTLy38kLIzoa96qxkbjMXDI2LKYevxz48IJ3By+NrkRAJyt7e4w4uF9
	F3GwdP4DA5NcKcK3ZcTNcw/hxvXdZ9t2aVcaCMNWChYFFlpdNTqrX/M4k6XxyHiqX78idU6EFgFuD
	97OgDtYVtlGQjW2t2jMRYhw01l5QxdI95ATwCM+T5nJpWppawfmh4paxPh4RmLQ3zsnssgyKsgTgI
	8d2g3ygq1XkY93KxfPWuo9oavggq7DFt0E78vIrD22O7Vp2Ln/hS6/OFz3rkqMtnCB/tJoDEHihe/
	b+H/7c8N0XpY90rLRy8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDcZ-001To4-6W; Mon, 06 Jun 2022 14:22:19 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDcV-001Tm0-Ry
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 14:22:17 +0000
Received: by mail-ej1-x630.google.com with SMTP id kq6so16255380ejb.11
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lYyKGEeq3UcMlhiJRIzst7R0qW1WAne+X1OnepWLUYE=;
        b=SFL7T5uifrBNLjB2DlOQ76k2CWD4lYFfvi+Cpg2JoGdLGFnhB7NYaEk4VeIgQjMih4
         dWD6g0rOGkVYh08vQvggGJY2yZvlDGzOf+oz68gB+AJ6zFrx06LXKkzALLHoXBKljZOe
         I9/PsfKKDUm55hO4bPdYQWfKmR4oBwin7fnuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lYyKGEeq3UcMlhiJRIzst7R0qW1WAne+X1OnepWLUYE=;
        b=c6tjGXKr89LBBnDlq2IQdfsXt1cWIeNAKzzWtVP2Ojk6W57dlOvbMerx31M1Hdc7FE
         yXWALixY8xmb3xGxmDu4UB3W4/Bl/0gJVvM5hmBno9CqN7VP0B9Ofjd0rk6ClAZ17PAM
         jq/z4CZnYTZW5g+8pviswxbHUk6BZMFveGEt7QGTN+R01BH5TeNlYX9P5VzoeqoKoOat
         YXqaYxc9sZSVX/WKsLcwKkdWQf0g56ACLf7CKkbpCAFdDlKQab/Lqow04zlE7eigcgpS
         tFP10KaAi4b3aOkk18M4qCO99Ho4W3w6miT0E0icZEXcNHp5dawJ9KMWZbtr2rpqWHGG
         0h4g==
X-Gm-Message-State: AOAM531qeZWG4fpFrVv9nrVGDETb+apk+EUSmrqomu/zPdq9oZ5Pkcsz
	K4oaOJNNu5jNGRuX+vmDwDpJf7RL+uajsCVk
X-Google-Smtp-Source: ABdhPJwZ+qehBXC1dsAn7BF22CASof2jIvWvWmMm86HRARk+XnfgPwdjJ0Xpk5qtXVKiKHd6UhFJuA==
X-Received: by 2002:a17:907:3fa4:b0:6fe:b83b:d667 with SMTP id hr36-20020a1709073fa400b006feb83bd667mr21389186ejc.481.1654525334240;
        Mon, 06 Jun 2022 07:22:14 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id o5-20020aa7c7c5000000b0042ad421574esm8768305eds.33.2022.06.06.07.22.10
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 07:22:12 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id u3so20102082wrg.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:22:10 -0700 (PDT)
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr21413566wrw.679.1654525330160; Mon, 06
 Jun 2022 07:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org> <20220606044720.945964-4-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-4-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:21:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNnWcvedzgxfSWT0-sTR3jF8LsVXKFRnm49ZCJw6EH6A@mail.gmail.com>
Message-ID: <CAD=FV=VNnWcvedzgxfSWT0-sTR3jF8LsVXKFRnm49ZCJw6EH6A@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] drm/panel: panel-edp: Implement .get_orientation callback
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_072215_929028_D025A57E 
X-CRM114-Status: GOOD (  11.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> To return the orientation property to drm/kms driver.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> ---
> v2->v3: add comments for notice.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
