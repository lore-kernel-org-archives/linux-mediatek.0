Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5B7CCA481
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fG4Y7Pg/8wT9AyrFzdtSuKewy1VKPEnnhivbEn7E/ME=; b=R3EtSYej6hvIwn
	MDXce979pOysEvj0bk/lARGBcONPQJkU/NsFcyvSiyQTHCjK8ya8Br1pxi6gXQMpF3g72qE56WV8j
	7aEjS1xz1GLThnUO0Kp5RcTIBLblk10iK8Y2iCIQE7oCstGEwrmwNdAp/81npCxKcqrPWYBclgrjA
	IPo70E3Cv9qKM9ajInEjx2333EEUCHUuqmkXw55rNOtXy0AIvp1ABKH7b6pESqWTQHxWoJEPCz9tb
	5VikApAMh5XQKBjaYNJpT290CIc6nKsadmYOHYuZtCHwBqO5h/TkknaKReaL5pipFHI/0bDcT7InE
	1JV67JEynJU3m7BOQ5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDcG-001Tfc-SL; Mon, 06 Jun 2022 14:22:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDcE-001Te0-4I
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 14:21:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id h23so18191147ejj.12
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vp8NNxHI8Mr5cvDebnpWHQ0r8fITxP4wMBgbky8hlKs=;
        b=cbfuFGvG9P3RoNLs/7komKcZAI5iYlhxO2c1PtY35nnPC3+G7B+1hWFJWkoS4PJIsj
         12l7R0+8en8jn64ramruBDLAM4LNDxwV5QlXnXU3GiVqV+E3Gtvm4iPw/S9vicOs+MKd
         veBzx9Qi7+Ff2iaPYmy4Uf1JlMPTfqESgCUDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vp8NNxHI8Mr5cvDebnpWHQ0r8fITxP4wMBgbky8hlKs=;
        b=dgtGKGk/hybo8YtQ/rRgp2BHPjEcVacXTB2GPbkKy9wuAYXSOo4SjybtV/3sh7qav9
         wuExIxRftNGa2hjV3LjYy9iKco5htfUFVIlkJp3KJ5iWBxnttWTe5o7YRc/MpAO8VWPt
         7BZUpsyLx8qoG4iLvBH8hU9ScxN36sR5XWdKwznOukaieqp8CRJkvMyLpekHOMD7jAL/
         0XafWkPe8lzaKI33fXqWUb1ltdrQz998erSbUqm5HAN63CzP8IAU8MztdjH0LG+mEN6a
         8NpVax2A4jbWi2yi14IY6KJyHn2IZ6PB8iXLet/M1+MG/92EWh4i2zH85FZpokJGybcT
         EBPA==
X-Gm-Message-State: AOAM531/T89AMOq6744tyG6ZSnVSs3liXj5xtq49Rgjri07tqnzrD1K9
	u9yRSTKQqL3AZCYuLqD9ESGGc7aD1ewrBlZm
X-Google-Smtp-Source: ABdhPJzbUXhQ4BLP4sl7tveP8WbLF88t22N6xjic60d40uh9I9M9sHSiPw/za9gKbiiWGPVKEH2H8w==
X-Received: by 2002:a17:906:7d83:b0:6ce:fee:9256 with SMTP id v3-20020a1709067d8300b006ce0fee9256mr22028388ejo.647.1654525316691;
        Mon, 06 Jun 2022 07:21:56 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906348100b00702d8b37a03sm6549126ejb.17.2022.06.06.07.21.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 07:21:55 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id q7so20085964wrg.5
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:21:54 -0700 (PDT)
X-Received: by 2002:a05:6000:1685:b0:218:45f0:5be6 with SMTP id
 y5-20020a056000168500b0021845f05be6mr2525253wrd.301.1654525314159; Mon, 06
 Jun 2022 07:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org> <20220606044720.945964-3-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-3-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:21:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VYjMKN=M=PWnGny0x5TaQ5gF7b_vL4muCsCi+rH7FAbA@mail.gmail.com>
Message-ID: <CAD=FV=VYjMKN=M=PWnGny0x5TaQ5gF7b_vL4muCsCi+rH7FAbA@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] drm/panel: boe-tv101wum-nl6: Implement
 .get_orientation callback
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
X-CRM114-CacheID: sfid-20220606_072158_184242_D02FEEDB 
X-CRM114-Status: GOOD (  10.89  )
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
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
