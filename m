Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFA9C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 10:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmDzdOcJCZVFEJz0cGwp78BZmKtS5/OHvJ4gcqeQ22U=; b=27VX7VyCEazqoK5efoLu6uHvwp
	CsdTElg1shahIMfPsLkYJsFw9j+YlRA6VgWBj/WHQ0yxOLSVJ0o7hQUbMjnzNqijHAlAMR4upa0UN
	sMxZxNwqUpHhIPi7fJOcnlZXXcFRdDR99hFLzUoBV1e6OyogjH4Ghx8D+r3ndH11w5k09B9ucY/iD
	gIoyeY7hjwILvLSNWEE1tE6xBSz9CJehvkQw+6kH1uk7e9vTQpt/jUnbl3t7aIDRZh7sYaqGpryqz
	fzH+STcCsuD/f8bl2CcRx85//+pPu3Vg2VtWBrgxtFIBVCdPN9xrSpEEdJJDuv4J+JCEpDpdl8B7e
	ZOz+W4UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovG5H-002Vee-Nf; Wed, 16 Nov 2022 10:55:59 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovG1S-002TKf-1Q
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 10:52:04 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z18so25938813edb.9
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 02:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jmDzdOcJCZVFEJz0cGwp78BZmKtS5/OHvJ4gcqeQ22U=;
        b=EPRG7osZR2L/3rHtV1b9dGX3T17rHFXmQU4zzbKNX42jRXbXowHCVomW9FwUGaM2r7
         LYIaZDA+k7YlaBCM8mr1imuYBEqlTmhT94UfgxNUlF6CpZnysa9lDUTQEDM2pTqyBukU
         qg38moV/kYoxcYAHoehRSCis7Bkuu42chBmryhv4yZjqtCGquzjMUF6QW4ilLCqDoqBu
         K2cU8PYsJItfRVia9c9Nrmqbj7+yqvqJzvrAm8FwazSKl2BQacUDhjza8CWDHqEn0f5I
         rl5+CYTiHV4BcqwbmjrWj7WJQyPOn1rqbndhF/6JKTrY1cGYOkQT3yHB9H4U6gKPh5e/
         /thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmDzdOcJCZVFEJz0cGwp78BZmKtS5/OHvJ4gcqeQ22U=;
        b=s0VCH/s2Iv1O+G4ZQgcvJdPyObyBQzczhKIsbiBZSGNXyP9CdAQ8Zu/geKvFZtL+18
         vTPF/sGHFxY01LR+65f017lTV5Qg8OjK6t64LwpiPWabA++kdnv1ZqDIubyI2YPyAws5
         8VkCw3t0KQzz9kmSp7skBh9cAY76JAPfw4RepqY0/d+Ro40zKeQl6sy17pFPqwfDsVTj
         jS1zN1fb9+H7a/2p4aQsQ7s7sFrI0T3zfLVM36R+VLP78Wyyvm21FwqVDEP5AoYyvQDn
         Zkab65PW0emfmhwNOB1OOLf1DcwpJYPz3xf6+vh35Lofkl4Dmn+yNBGIIyduuZ1RlZKy
         H4TQ==
X-Gm-Message-State: ANoB5pl1cwnphP+/ze2pr5/E7+j+RzRentiz5L6ZL8iqdyykhvSXcnLV
	pJ31j3Th3i/Yd+a6tTjI+ANtrp5sU53A8ZVrmwRGJw==
X-Google-Smtp-Source: AA0mqf64irImFpuxWfnuQVwe5pGIad2p0If0h7oh7065tcZjwfzMlUBDf1yRl9o/jLlSJRaOIU8hV7LxOrNP3Ko2F7I=
X-Received: by 2002:a05:6402:b7b:b0:463:ab08:2bc6 with SMTP id
 cb27-20020a0564020b7b00b00463ab082bc6mr18384756edb.143.1668595919878; Wed, 16
 Nov 2022 02:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20221021084708.1109986-1-bchihi@baylibre.com> <CACRpkdYdmG5cFenESg36BwVpJ7FDJunPH1Z8dJjHwmu+NW-etA@mail.gmail.com>
In-Reply-To: <CACRpkdYdmG5cFenESg36BwVpJ7FDJunPH1Z8dJjHwmu+NW-etA@mail.gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 16 Nov 2022 11:51:23 +0100
Message-ID: <CAGuA+oq8XrvNrDdW6JZS7UyhM4ZCk-RvpMUnw-bht9d6nJr3jw@mail.gmail.com>
Subject: Re: [v2, 0/2] Fix broken SET/CLR mode of a certain number of pins for
 MediaTek MT8385 SoC
To: Linus Walleij <linus.walleij@linaro.org>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_025202_250796_A4A112EF 
X-CRM114-Status: GOOD (  16.24  )
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

On Mon, Nov 7, 2022 at 3:44 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Oct 21, 2022 at 10:47 AM <bchihi@baylibre.com> wrote:
>
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > On MT8365, the SET/CLR of the mode is broken and some pins won't set or clear the modes correctly.
> > To fix this issue, we add a specific callback mt8365_set_clr_mode() for this specific SoC.
> > This callback uses the main R/W register to read/update/write the modes instead of using the SET/CLR register.
> >
> > This is the original patch series proposed by Fabien Parent <fparent@baylibre.com>.
> > "https://lore.kernel.org/linux-arm-kernel/20220530123425.689459-1-fparent@baylibre.com/"
> >
> > Changelog:
> > Changes in v2 :
> >         - Rebase on top of 6.1.0-rc1-next-20221020
> >         - Delete MTK_PINCTRL_MODE_SET_CLR_BROKEN quirk
> >         - Add mt8365_set_clr_mode() callback
>
> Patches applied, no need to resend for small issues.
>
> Sorry for taking so long, I wanted some feedback from the Mediatek
> maintainers but haven't heard anything, so I just applied them.
>

Hi Linus,

I'm sorry for the delay.
Thank you very much.

Best regards,
Balsam.

> Yours,
> Linus Walleij

