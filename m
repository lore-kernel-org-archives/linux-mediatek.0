Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87642C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:34:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDACC61077
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDACC61077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JsYzQFY+95TgACKPY6pdexkbGkyE+D/+b5/fOv7MW40=; b=oG+ulQnzNFFGyYiyJdYPmY78l
	6sj19KwF2d3PsO7au7z7ji/BHCDIC3Xdfc5tdgHs66D4hszE3/+F88bvCMr0vcTgbcnieOerFWpbL
	gqiZYriCCyxOX8PTW47Er2QGpKeSLgsb9c0wWPPLHgrg8qdbskJ74dmKwItxV+ULx+c0QiruFBRve
	gRdpq7VtyUIyujXObZHz+GmL8V+lr8traIl/cAg24nVTaUyDgOR+ZX5RJdMeeFTgeVU7GJKNx2WZV
	wzgq5wJw7IPnP/AHrX7OldIYN182l2eUYTfNomQUYo7L4CWBFMocvQzOMP/RedpWvmyX1Z6xkGg48
	QgOe9RzZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqW5-00CEal-3W; Tue, 20 Apr 2021 13:34:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqVs-00CEYa-4a
 for linux-mediatek@desiato.infradead.org; Tue, 20 Apr 2021 13:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Xgfc7mO4E1wXWUmekqC8sEt5bIbUy15Zn+YoHQva8NI=; b=TBk0949S0khkT8s6CcYsMMOHh/
 bwJd2EQimJIO/6FPyHwZPFVhCxQ2Q0r0lmBJZogQmFO8KnnE6sK9iYvZ91s2vlqZJ8MxcEQgbFMKX
 UgLdeZL0KywZ+9QMX5mBjWzMHSS82wAng+woyNJipF5TukwyT8exBcaodftNWVwVqwbjJGkcCRb/w
 kf2ltOHVbUF6AW3lr/GSjSLlBgxP0Sn5cIDFzZ7nfShRUr8/P1ssdM8cVCt8rZqYFNUefxT/PkM0N
 TdikOAeeWu7W4jtYWS/mrnnxh/o9u2OKHQImejwIRqgNzlZ3g4J8sXQ6Fo4UBzc2kVAeOFYy8xrtX
 ArHAvCdg==;
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqVm-00C9Vo-Nh
 for linux-mediatek@lists.infradead.org; Tue, 20 Apr 2021 13:33:58 +0000
Received: by mail-il1-x12d.google.com with SMTP id c4so5484457ilq.9
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xgfc7mO4E1wXWUmekqC8sEt5bIbUy15Zn+YoHQva8NI=;
 b=PYyvqtFzdzRakpUOqbunR4I7/Lj/8HDyE7lqd9tAm0PNx6Uh1yOIHCDmuaqBR1ViP4
 mmStHq4YHDIb9iNLpswctc4T/0gjz0QMypKb9sh/woNGTQHvzByI8qY89af1f2aYk6+S
 wieFezmrOmmKh35TaWQ/tU2N5mVDzf8HRzVYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xgfc7mO4E1wXWUmekqC8sEt5bIbUy15Zn+YoHQva8NI=;
 b=WgBhLK+AJS8rVmLIdGfGv42Jra4MSZ03FpWoJDl/i2fAVqM61hPtFJ0k7jOex0LEen
 sQgS6oxAS3LW9pFESKsImpA+F5OTTZkXCNL9fhB+VgYmswQJGeQrJApRB7KhI8BkKiQN
 xIsEgDlTSEkj87E6B1VcejxnMA3Jro9fAL4ut1eI+nKyKGGfiQCviE+NSGawZqwPc2nf
 3lZTb2O/vGI9V+csvA45hrMdiKTjC8brnEMZy4/oY31Zb7IA8xuZ/sqRpD14/+kz0G8P
 t4zG9MC8pSKHS40HrY7JP6gJaVLcpp7kzB5a6+LdzIdsZDVkGy4kOWVLEmEvyvpWb2tt
 Ap9g==
X-Gm-Message-State: AOAM531R/UBAWXE7oC1Pr/Grtd6qYgYJxE86kS/RarmeovSwrtyADhp2
 CVNZ80EZ91/OK4JeoQZjHQct+PR8mGTIEbhUl8D6wg==
X-Google-Smtp-Source: ABdhPJy6RgMFJUk30o3Bp+6VqEWzChzCOkzvaHDVug4JPECZShpDcemglkoDMMwZ/VXKrU9wV09fLSo20xOiZ0XVnHs=
X-Received: by 2002:a92:d684:: with SMTP id p4mr22468413iln.150.1618925632435; 
 Tue, 20 Apr 2021 06:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210414172916.2689361-1-hsinyi@chromium.org>
 <20210414172916.2689361-5-hsinyi@chromium.org>
 <CAMpxmJUGxUPYC9NEnJDHYq7Nu=akP5GTpU0ts9htf1vELhK15Q@mail.gmail.com>
In-Reply-To: <CAMpxmJUGxUPYC9NEnJDHYq7Nu=akP5GTpU0ts9htf1vELhK15Q@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 20 Apr 2021 21:33:25 +0800
Message-ID: <CAJMQK-huKTYepZ+xCZDG01RBGB5Tu4ic=Hs03=remLii0WBTaQ@mail.gmail.com>
Subject: Re: [PATCH v19 4/6] misc: eeprom: at24: check suspend status before
 disable regulator
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>, 
 Qii Wang <qii.wang@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>, 
 arm-soc <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_063354_795307_BF1BCF85 
X-CRM114-Status: GOOD (  21.19  )
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

On Fri, Apr 16, 2021 at 10:09 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Wed, Apr 14, 2021 at 7:29 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > cd5676db0574 ("misc: eeprom: at24: support pm_runtime control") disables
> > regulator in runtime suspend. If runtime suspend is called before
> > regulator disable, it will results in regulator unbalanced disabling.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Please add the Fixes tag.
>

Hi,

I resend the patch with the fix tag separately since other patches in
this series are not changed.

https://patchwork.ozlabs.org/project/linux-i2c/patch/20210420133050.377209-1-hsinyi@chromium.org/

Thanks

> > ---
> >  drivers/misc/eeprom/at24.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 926408b41270..7a6f01ace78a 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -763,7 +763,8 @@ static int at24_probe(struct i2c_client *client)
> >         at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
> >         if (IS_ERR(at24->nvmem)) {
> >                 pm_runtime_disable(dev);
> > -               regulator_disable(at24->vcc_reg);
> > +               if (!pm_runtime_status_suspended(dev))
> > +                       regulator_disable(at24->vcc_reg);
> >                 return PTR_ERR(at24->nvmem);
> >         }
> >
> > @@ -774,7 +775,8 @@ static int at24_probe(struct i2c_client *client)
> >         err = at24_read(at24, 0, &test_byte, 1);
> >         if (err) {
> >                 pm_runtime_disable(dev);
> > -               regulator_disable(at24->vcc_reg);
> > +               if (!pm_runtime_status_suspended(dev))
> > +                       regulator_disable(at24->vcc_reg);
> >                 return -ENODEV;
> >         }
> >
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >
>
> Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
