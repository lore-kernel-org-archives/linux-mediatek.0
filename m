Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7CBEC43460
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:10:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 472046103D
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 472046103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kn7t5kL8P5X1JceNnGg0X04qowh3WIXBcrZYxtaKh+8=; b=E05NKiZQ9NxZ3sdze8sxs6lme
	me+VOprfwDi6EtnJIbrfsswrLIlnuUNKDpcUfXbCA9hUpB2j9NBD4XPtJcKh3DV1CmgIlAoiD+8aQ
	FebC/OJM5x9X9WLqIyArTMWe1w8rvcFfh8VdxnMIKVA9rW+8tCtKTo+oBWkvA6g9DYz53DIl2E3b2
	nxBRE2VaDHqVDLW1reK5HvqFlMdYaBVuDgumYzk9u4G39eBIkzXiESwpCn5kW/ZF5D8w9Q1cR+nsy
	c0x6pUsoFRwmSq+gL9qo1E7IkjHfqbM017b/Ug1w9CO9lDhdmS/I7cHq+1nftySPPhLTj1S4i33aG
	yDtV+tv7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXPAX-002LgY-1N; Fri, 16 Apr 2021 14:10:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPAJ-002LfR-49
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 14:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+iDAodRRpEUhtkqTZXwhK3yiesnssmbfnpzAO0fQBaQ=; b=F0cahxkHt0DlxIaSePTCQrtNl5
 W7d4EmdJUySXS5TmN+xfK5efCmdMO630o0tBRlk50db3fIS8JCXOUGNxIA3D6iv/Gzd9hZHHAyFA0
 DnFZgLJoSvGrZtrRlviHPWtdOYqVAtpzhEp7pZLqkEEMeSEJA8i4AJxWyQ8jc9KF5JKl3Yfz0UPuF
 K7fDS96tirl3XbebJOS65RjWnlk0pP3fvJRFlWrGe7QgPcBOC7l1Gds3KuxJZXLmS11xPYIv4O4KE
 1BRPutHn1b+KkqqdBKfb/5fNkNjt8GI4DW5C/2Y6BGDRpWNsdHoLKsuw3ga/oTNY7t9bGDYyXQOSC
 +fL9H2wA==;
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPAD-009QYV-7W
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 14:09:45 +0000
Received: by mail-yb1-xb30.google.com with SMTP id c195so30233489ybf.9
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 07:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+iDAodRRpEUhtkqTZXwhK3yiesnssmbfnpzAO0fQBaQ=;
 b=uQnXtdLxem4ikmdqZ3Sd178lh0PBi6OUJIlybbB1Ie5/18gwUWnyxBhpRpH6dsApt6
 HgrKJn2BSo4sflN3QC1oawT22dcpsQXEonF48AcXTCo3T7YP0nEK5+WDv5oht6teVOwz
 AiygdTYr/z/sfrxidG+UPLWcKK2sIVIJG0FOIlGo/Vk9ZzHwapDhyuh6DzaFInl5xfKH
 igFcFGX/vkuTVhINzKQ5Ry5A/neEO0evmj2KjKwapLWh4OxXRKMvv9yBKqPWN9f7fHR+
 4yFm57+/w47MwLYuHhQ/w9rf3WZlE8y2I4orMG6klYCzxRmT8QZ5mgZ5BLBexnforcOu
 yjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+iDAodRRpEUhtkqTZXwhK3yiesnssmbfnpzAO0fQBaQ=;
 b=hpmLRP+TyoJhYvE7aNu8AqOZCCRGnYli1hvKE13bODiRuLcAhd6ihwVwI5QgI2EVGD
 fN1EVs2SFVNd8b9vppBi85+zTBLDhwOHrYY7CWuvHObNT4SOTIboSz686DowWr4dJ0Zt
 5mhhlHnG2sCAvXsm0LObGz4FsBbVDyvd8IK4198B6uDH/y9YW8oZ+8cwSZLgkALPcrND
 bCQ/k7queL5eG8Mx2/IiKje65k+hUy0ftr4tn/RMRncu6pV6t4n9FLARHDgOCKNIcmm9
 47Rhb/asO0wxSx/6jXmy/yjztU/Cg6z7aNc3HPeyE7qOAvmf2lwzGV6I+HKeJSavVFOe
 WreA==
X-Gm-Message-State: AOAM531Ar2inFN8RVJrCV4ATz/jEzYx0BIPzW72tDiI3YE/Ui3pF/Nxl
 LPM20FQANwknIlZov1/gNo1K2UVygA8hvsDRgH0w4Q==
X-Google-Smtp-Source: ABdhPJxirPkkW4ar8JP1azi15sakWVGJn4HrEQDx209hIbNv5M1svItYhPj+O3FrREbRjomo94vZ2Z3HsLbFndBeixg=
X-Received: by 2002:a25:1905:: with SMTP id 5mr11994893ybz.302.1618582179030; 
 Fri, 16 Apr 2021 07:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210414172916.2689361-1-hsinyi@chromium.org>
 <20210414172916.2689361-5-hsinyi@chromium.org>
In-Reply-To: <20210414172916.2689361-5-hsinyi@chromium.org>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 16 Apr 2021 16:09:28 +0200
Message-ID: <CAMpxmJUGxUPYC9NEnJDHYq7Nu=akP5GTpU0ts9htf1vELhK15Q@mail.gmail.com>
Subject: Re: [PATCH v19 4/6] misc: eeprom: at24: check suspend status before
 disable regulator
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
X-CRM114-CacheID: sfid-20210416_070941_449145_B81D6CBA 
X-CRM114-Status: GOOD (  16.58  )
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

On Wed, Apr 14, 2021 at 7:29 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> cd5676db0574 ("misc: eeprom: at24: support pm_runtime control") disables
> regulator in runtime suspend. If runtime suspend is called before
> regulator disable, it will results in regulator unbalanced disabling.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Please add the Fixes tag.

> ---
>  drivers/misc/eeprom/at24.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> index 926408b41270..7a6f01ace78a 100644
> --- a/drivers/misc/eeprom/at24.c
> +++ b/drivers/misc/eeprom/at24.c
> @@ -763,7 +763,8 @@ static int at24_probe(struct i2c_client *client)
>         at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
>         if (IS_ERR(at24->nvmem)) {
>                 pm_runtime_disable(dev);
> -               regulator_disable(at24->vcc_reg);
> +               if (!pm_runtime_status_suspended(dev))
> +                       regulator_disable(at24->vcc_reg);
>                 return PTR_ERR(at24->nvmem);
>         }
>
> @@ -774,7 +775,8 @@ static int at24_probe(struct i2c_client *client)
>         err = at24_read(at24, 0, &test_byte, 1);
>         if (err) {
>                 pm_runtime_disable(dev);
> -               regulator_disable(at24->vcc_reg);
> +               if (!pm_runtime_status_suspended(dev))
> +                       regulator_disable(at24->vcc_reg);
>                 return -ENODEV;
>         }
>
> --
> 2.31.1.295.g9ea45b61b8-goog
>

Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
