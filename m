Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF02C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 15:44:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EE6420657
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 15:44:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rHljspH3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EE6420657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FweVJWiTEB63aoX30RAYm/xqnSaAQf0ny+O7S7sQ8wk=; b=rHljspH3BE7U88
	x2003EdyXijDlhrgaVqF3P7Z+5u/Pm/7/sn3bUt58hofLtZDcFQ0yqPBt+LVgkD5Y5PmajaGhtCzn
	6Je+bh/3K36obr3iIiOUalPxqt/XGr9JsYh5z8tF8MAS51VsLe3uvhaAM73rdXyHE+NUEp/Ja/xWM
	ssujSwBajKFhBH+VVoZa/GN+2rx2/smnWxspWFBHJDMOPa6RXpG5n+5RCzi/Tb0iGjs7A/u7rFkKE
	ny4LNuRJnxFqIcOT+pTwe3mRDja0aCXz651UjPf0O2Jq5iGIX/+4HJoAudpUqrz4E020GMCHLTnfs
	zrd42effcEyvVIBp4xnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jahwP-0007We-G4; Mon, 18 May 2020 15:44:33 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jahwM-0007Vf-Ii; Mon, 18 May 2020 15:44:32 +0000
Received: by mail-oi1-f193.google.com with SMTP id x23so2769337oic.3;
 Mon, 18 May 2020 08:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zmc+aX1vQ2DoVqQHld2NGpTEXaFRkMWY7XPbs/Yym5g=;
 b=jg122jgVrNTArNr+euvwuYVz/nLhvKJM2+w/czTlDDjKIh9dfTun+Fv+NCFupl8bJo
 jdtSUYW4j1D4zb2+bCj6LteYxhLh/snmiQOYfQB8y5TxYuEVkvdFpGQZ4sed+Jei5FaB
 oZijHGC3gD2bo4rZG6y2L/2B1ePOWBN1w/4AnvZ4RhhA5gzR8P6cbiTuJA92aS9d94BU
 bGFNZ6XsxaRoQdzfy3Zvw8IGxn2gTmziV6dqE8na8ZRy37XcocuLuHtQwQ//KMhBBzRU
 4HSSJObM59/iXZiihF3Anx5vTKzSjj+WL6D/JzGcL7uBVwgTbaKmRfbikfGkaicYTWN6
 heJA==
X-Gm-Message-State: AOAM532L4E9JuBGhUMzrK6DOBNU1yUH55n/2J3LI7gdZEHMjdjYwHSlr
 jlUu18mGT6Cf27z+RCZ6Z9AbkKz88/mTtZ5SMn8=
X-Google-Smtp-Source: ABdhPJy2nzNFTl+3u/yZOZKPJD6snXgr3/xAOGW+7fC9tpBtXaFCbD/tlFqxKMUwcf8LG/1SZLomAT8oopgBVFdHLgs=
X-Received: by 2002:aca:895:: with SMTP id 143mr10832413oii.153.1589816669165; 
 Mon, 18 May 2020 08:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <1589461844-15614-1-git-send-email-qii.wang@mediatek.com>
 <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
In-Reply-To: <1589461844-15614-3-git-send-email-qii.wang@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2020 17:44:17 +0200
Message-ID: <CAMuHMdXjLakWDDEy=02prC7XjAs_xBnt2mArPFNwyHgUoWw6-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: mediatek: Add i2c ac-timing adjust support
To: Qii Wang <qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_084430_618553_61DE8DE8 
X-CRM114-Status: GOOD (  16.92  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com,
 Wolfram Sang <wsa@the-dreams.de>, leilk.liu@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Linux I2C <linux-i2c@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 14, 2020 at 3:13 PM Qii Wang <qii.wang@mediatek.com> wrote:
> This patch adds a algorithm to calculate some ac-timing parameters
> which can fully meet I2C Spec.
>
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 328 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 277 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 0ca6c38a..7020618 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c

> +/*
> + * Check and Calculate i2c ac-timing
> + *
> + * Hardware design:
> + * sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src
> + * xxx_cnt_div =  spec->min_xxx_ns / sample_ns
> + *
> + * Sample_ns is rounded down for xxx_cnt_div would be greater
> + * than the smallest spec.
> + * The sda_timing is chosen as the middle value between
> + * the largest and smallest.
> + */
> +static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
> +                                  unsigned int clk_src,
> +                                  unsigned int check_speed,
> +                                  unsigned int step_cnt,
> +                                  unsigned int sample_cnt)
> +{
> +       const struct i2c_spec_values *spec;
> +       unsigned int su_sta_cnt, low_cnt, high_cnt, max_step_cnt;
> +       unsigned int sda_max, sda_min, clk_ns, max_sta_cnt = 0x3f;
> +       long long sample_ns = (1000000000 * (sample_cnt + 1)) / clk_src;

So sample_ns is a 64-bit value. Is that really needed?

> +       if (!i2c->dev_comp->timing_adjust)
> +               return 0;
> +
> +       if (i2c->dev_comp->ltiming_adjust)
> +               max_sta_cnt = 0x100;
> +
> +       spec = mtk_i2c_get_spec(check_speed);
> +
> +       if (i2c->dev_comp->ltiming_adjust)
> +               clk_ns = 1000000000 / clk_src;
> +       else
> +               clk_ns = sample_ns / 2;
> +
> +       su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
> +       if (su_sta_cnt > max_sta_cnt)
> +               return -1;
> +
> +       low_cnt = DIV_ROUND_UP(spec->min_low_ns, sample_ns);

So this is a 32-bit by 64-bit division (indeed, not 64-by-32!)

noreply@ellerman.id.au reports:

    ERROR: modpost: "__udivdi3" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!
    ERROR: modpost: "__divdi3" [drivers/i2c/busses/i2c-mt65xx.ko] undefined!

for 32-bit builds.

> +       max_step_cnt = mtk_i2c_max_step_cnt(check_speed);
> +       if ((2 * step_cnt) > low_cnt && low_cnt < max_step_cnt) {
> +               if (low_cnt > step_cnt) {
> +                       high_cnt = 2 * step_cnt - low_cnt;
> +               } else {
> +                       high_cnt = step_cnt;
> +                       low_cnt = step_cnt;
> +               }
> +       } else {
> +               return -2;
> +       }
> +
> +       sda_max = spec->max_hd_dat_ns / sample_ns;
> +       if (sda_max > low_cnt)
> +               sda_max = 0;
> +
> +       sda_min = DIV_ROUND_UP(spec->min_su_dat_ns, sample_ns);

One more.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
