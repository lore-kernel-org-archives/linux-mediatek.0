Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603B4C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPFcUgp9vq++lj+6ttIDgjgq0e83TsVF0Q9UvQRCwnA=; b=JDPBBTY5SxDmUS
	8pz06pOyz/sdsIy4q50SxPQ1LutHmYyQR/YcX3uAl3MKGC/vug998jZ0IL4HpK+ED77wP1gdLQe5m
	RfQBgqq84CZsaXmZM2b9qgIQoNcAOOZXKNQjA5D9/8QjrHOlYfzFqK6hpVYopwnwBgsDs4Q+/iY7i
	Ezvk/ISKmhRiEaNayxsM+VNftDHGICB5TIsJbog1B5OJhfVP3fTxIqHsD66xCR/0qwcGrBoC88UIW
	/qnfeIAirfE3pWefUymuZOO/B1mYUzSupLxqhG39UssSJZRGKUhjM39pKlGLD9GObsP4QF49KYlEA
	5kO9q2D5abugK9cc0BoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDlX-001Wpa-Ad; Mon, 06 Jun 2022 14:31:35 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDlU-001WmN-PJ
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 14:31:34 +0000
Received: by mail-ej1-x632.google.com with SMTP id u12so29345715eja.8
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GtB/1q8V6w+BWdhC9EKrHFyvz/JN34Sk5t7oVzNMdlI=;
        b=S54yq+aqgMtQgBARzs3r9I0ZrPQI5ZVZEutMIlcApQ0O+ylp3x4EGRtSkJThXVjx2y
         aHxka38JYLUmgi2B0Sh9t/3M28Bm9PGYHW8+XnhqG2jI9keSQmZuZPdHSadC73yyLPQ7
         Io5j+kBcKNbhtIatxrfuoa626ix5piOgJmDyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GtB/1q8V6w+BWdhC9EKrHFyvz/JN34Sk5t7oVzNMdlI=;
        b=qYmWW5IZ/4RvmAr7TCjveJrvYIqIKBOst9iWOQVkgp+4xTeEiQahcPp+MnHPP9HLY5
         mOV5AQTzJyqtUzkVV1EumDxjTHI3osVrDGSJ+s+Y778f0X2ko9rd7F9Dp1GKEsbN41Zr
         CLpRlHEmPy4zCPZCtXFhmGWQlKe6Tdc+xcpbdOMg7jZeBZUlM/lAkX8j9XJf2hkWm6sb
         4lpu6C9pP3CA7g7EsS869abVQlFiKVnBIN4mbRAhUuzgulr2ECP/8ZGFuVRvWVgsP9KW
         8Og9/LfmeoWaEtd/kr4EZ6UMPL7+A9L0nD8NgLkb/jKLIBkafOH64sCV7nIEYM9l0Z/w
         D+Kw==
X-Gm-Message-State: AOAM531cjM1O1UwFv37pfkEvYmFybuO/v0OU/l2U46Px6IPfQr4hqwTr
	2dnCqvfQ6BE4fYYp79epMHXbK8Rrof+zVh7ds2w=
X-Google-Smtp-Source: ABdhPJyJ9w+ArwuSiluPexUytwUP/Tt5IA2urJW7PFXRxmsg4Afye6EpAu07FG6fqh6yuRAgwN4KSg==
X-Received: by 2002:a17:907:1b1a:b0:703:a290:98f1 with SMTP id mp26-20020a1709071b1a00b00703a29098f1mr21711914ejc.418.1654525887890;
        Mon, 06 Jun 2022 07:31:27 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id dc15-20020a170906c7cf00b006ff045d7c9bsm6423878ejb.173.2022.06.06.07.31.27
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 07:31:27 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id z9so992322wmf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 07:31:27 -0700 (PDT)
X-Received: by 2002:a05:600c:202:b0:39c:40de:ec19 with SMTP id
 2-20020a05600c020200b0039c40deec19mr16405042wmi.29.1654525391306; Mon, 06 Jun
 2022 07:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org> <20220606044720.945964-7-hsinyi@chromium.org>
In-Reply-To: <20220606044720.945964-7-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Jun 2022 07:22:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UwFuNrgBqyseHNLzuRQqyYHXe_sgSfQUSfsp80923h7A@mail.gmail.com>
Message-ID: <CAD=FV=UwFuNrgBqyseHNLzuRQqyYHXe_sgSfQUSfsp80923h7A@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] drm/panel: ili9881c: Implement .get_orientation callback
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
X-CRM114-CacheID: sfid-20220606_073132_846612_6820F81B 
X-CRM114-Status: GOOD (  10.97  )
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
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
