Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5478C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 00:56:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88446608FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 00:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88446608FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8/l4brBn1aNjTtpOQ2ICfgVwZz/Ugd2OCNV0RznDew=; b=Qk3QMlXH0yAkjC
	4aASk+Uap4j2BM/Ubp4pEBY+INugcaYRyuEUF8TGQRS9Jm572qlzFL22eVbHK/aMiI28SDLrp2VX+
	F2Rekh0VcZW0W7PoPh9UvExp6bovJ3HtPhpQBdNhwGo/Vdrm+XXEyKQhOeBc0W+MtCKbv3N0WCJwX
	huYrD+NPFknsvTYfP6N9a/JFrm/jJG1u/LyuP7eOV8//m0wzrU9YcxlHNfKXFoUSN/loMt0EzDTAT
	7HQY9KOKEAgwMZ42o5kaDbcplsVVs9y6L2FTV2akbsrePblSHpryCrwfSqnb2KwNE6Z1SDSBBUoeV
	cKRI/fNzYCbR10pq6/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgGBn-009RRq-6B; Fri, 29 Oct 2021 00:56:11 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgGBj-009RQz-TJ
 for linux-mediatek@lists.infradead.org; Fri, 29 Oct 2021 00:56:09 +0000
Received: by mail-ed1-x52c.google.com with SMTP id w15so32285885edc.9
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Oct 2021 17:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=02iNYarIGivgAYG46j9hVKUgfe1wBVpz8bSFnnDAryo=;
 b=lUdSPDlxpaJHm92JtgcD1+V87XBrSIHA10cIWbtsXBA5Rm04k1FNrk6cWnwkV1S+bC
 r3TH58DMW3M6ebDvyidHUAcDv+GaSWMkwGYBBXoP2fBT1nH6AS/TBb4PrvQOPGlhS+zA
 rw1X79Rv7FvU6eH19S2qcZfy8LZxMD6dNGRdiBzlkkSnqwTkN6xvG51XXLdoWm9vEn1F
 YZfZgb+BpI3LzlZ6RZs0LUnaFJlZ5F75GwJB/j5h+k/7HJ8Q8VHA69bgPZG6f9IywDZc
 y6+vzcBAk9bA6KLLeG0hKw6TVZTMcu0y0WANs7cYL8Xu4Hqm2pyged9wNz8HUB7FChtg
 7YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02iNYarIGivgAYG46j9hVKUgfe1wBVpz8bSFnnDAryo=;
 b=zjSkodt0UAl8d384NixmOfcCbQ5MofIzSkRvxg50lMTzjID7sndI0fPl4a6ofjqim5
 k8ODHSTTYoDbjH5Yqfj9yd0JvdqyibE8hcKCLenFHaq0NmbRUH4Z8zEFaCM/hbcca8lL
 SIEWOMIz5yTAKniVQHDmeagWaEIPDetFHJVujsT6FTfzIxZmHEH3udx2u04obIh7cC2F
 kRngBYJJmaHeWTL/VSDd4VwNnQvr0VGYi1TszRVt1qTnOldsWSNldZNzVA6nocairX+2
 xo6jK3jZ5ODq0wU5oBjmZepuolMKu3bkRx/aPbAFc4YKXF7+dMuZihV3MAl2O3ioFhyD
 cDuw==
X-Gm-Message-State: AOAM531hgf76rRfm6JXhOWb4MdXHZp+v6/MsO81WPrLVOsoOCSpStRwr
 sqqRvS1dRGLP7XzTrdwU3Yxp5ThE/Yxv0gkjp2U=
X-Google-Smtp-Source: ABdhPJxNot0/izRy915/AnfoF3Z8790pgFFQ0WCKMhTkLn5eXNDGWsQ45zGAD5/9geVzA4WRGoEkwiSWE6bnEknkWjo=
X-Received: by 2002:aa7:da84:: with SMTP id q4mr10703024eds.371.1635468964839; 
 Thu, 28 Oct 2021 17:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211027080747.24388-1-shayne.chen@mediatek.com>
In-Reply-To: <20211027080747.24388-1-shayne.chen@mediatek.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 29 Oct 2021 11:55:52 +1100
Message-ID: <CAGRGNgUvTU=yYfuKcB2VvHjqLBKVPpVJaLvMpxK926y=yniKsg@mail.gmail.com>
Subject: Re: [PATCH] mt76: mt7915: add default calibrated data support
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>, 
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, 
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Bo Jiao <Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_175608_015277_BAD8EC5A 
X-CRM114-Status: GOOD (  22.63  )
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

Hi Shayne,

On Thu, Oct 28, 2021 at 6:25 AM Shayne Chen <shayne.chen@mediatek.com> wrote:
>
> Load the default eeprom data when the content of flash/efuse is invalid.
> This could help to eliminate some issues due to incorrect or
> insufficient rf values.
>
> Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7915/eeprom.c    | 83 +++++++++++++++----
>  .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 24 ++++++
>  .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
>  .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 +
>  4 files changed, 98 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> index ee3d644..626ea4a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> @@ -42,20 +89,28 @@ static int mt7915_eeprom_load(struct mt7915_dev *dev)
>                                               i * MT7915_EEPROM_BLOCK_SIZE);
>         }
>
> -       return ret;
> -}
> -
> -static int mt7915_check_eeprom(struct mt7915_dev *dev)
> -{
> -       u8 *eeprom = dev->mt76.eeprom.data;
> -       u16 val = get_unaligned_le16(eeprom);
> +       if (!dev->flash_mode) {
> +               u8 free_block_num;
> +
> +               mt7915_mcu_get_eeprom_free_block(dev, &free_block_num);
> +               if (free_block_num >= 29) {
> +                       dev_warn(dev->mt76.dev,
> +                                "efuse info not enough, use default bin\n");
> +                       ret = mt7915_eeprom_load_default(dev);
> +                       if (ret)
> +                               return ret;

You've got two instances of the code where it tries to load the
default if the EEPROM data isn't valid.

You could potentially simplify this by structuring the code that calls
this function so it's something like:

ret = mt7915_eeprom_load();

if (!ret) {
    ret = mt7915_eeprom_load_default();
}

return ret;

with mt7915_eeprom_load() just returning -EINVAL if the EEPROM
contents aren't valid instead of trying to fix it itself.

This would also make the code simpler if there ends up being another
way to get EEPROM data in the future, e.g. an NVRAM partition
referenced through the device tree, etc.

> +               }
> +       }
>
> -       switch (val) {
> -       case 0x7915:
> -               return 0;
> -       default:
> -               return -EINVAL;
> +       ret = mt7915_check_eeprom(dev);
> +       if (ret) {
> +               dev_warn(dev->mt76.dev, "eeprom check fail, use default bin\n");
> +               ret = mt7915_eeprom_load_default(dev);
> +               if (ret)
> +                       return ret;
>         }
> +
> +       return ret;
>  }
>
>  void mt7915_eeprom_parse_band_config(struct mt7915_phy *phy)

Thanks,

-- 
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
