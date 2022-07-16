Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 00:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yF0qYkuNUhOMnwb9sHzODwkBW5iHpEMQMtEm7GeRBIA=; b=P1lnhp/zea7RzyoCujhMNO+qOc
	TxhGiFoVKxyi1vyV+oF1adRrYD6hu4reV7Ucdb960MQS/JLFQaWKkQ2Oy6dFF0pmEIduFZlg+XaRw
	nWJ1pdZ+VQnVxp0E9FmeYHot5tkd7cdoD4u3FDDYldUbQQDuPSYHy0mWxdfiPEfvmmOuwPLRscF5b
	2ABBSkFBATP0xm2HvYe/L2NcKE5dZie5g2kRYUWMVpXEnbCeBott0PO/StMD1+J33B51n5SKIAQ0q
	pq4eumJ/qC9TbH1U4ubrgT1/E286o3rtlQUqZihmEnfImO203c+h5R4ZPKcDH8wDgcAKIyUq/35q+
	jPOdQoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCVMc-00BNjy-EI; Sat, 16 Jul 2022 00:08:54 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCVMY-00BNcV-Q6
	for linux-mediatek@lists.infradead.org; Sat, 16 Jul 2022 00:08:52 +0000
Received: by mail-ej1-x631.google.com with SMTP id l23so11563342ejr.5
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 17:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yF0qYkuNUhOMnwb9sHzODwkBW5iHpEMQMtEm7GeRBIA=;
        b=BS6oH5L2ejQrjFIcp4AzXd6YcaSkbptMyBqZLLMeKwDpYPko8vPRFEtEht99LRRGGT
         K6iWrq2PRnSy6EK3Q6IswNuhFhDDeTW9LEYpyAmJ3eWeP20JyqGdYfmmFBmqy7vzoGsy
         Ze25JNbCPxNTNh1V3Hg36j33yANMIkxQblFLcYR4Y0+89yuK8cBYflOFjIbpcAsfLShD
         C4Qn+01ennW2EjDyRAxA7i4761Zq0ImawDtDmXMpnWR5jq0YsGAk9oRjf97EM/XXda/4
         u/3p/ziM3tmYOFOC0fvL5WOrzjNa4MiRpYucWBIrWUP8OjOnOK4IHPAsJenq75fg+Yy3
         GhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yF0qYkuNUhOMnwb9sHzODwkBW5iHpEMQMtEm7GeRBIA=;
        b=U/HjybTkkNdxyUIQBHdUIYOKTgbrOBSwkjxxLlGmxaxaep8OI4ZE2jl2Ekz6yk8muF
         A4Nxw6Ws51SeRso6xE4PhhOhXYhDPsV0N9JTaKxfPJ4it3Pbk9kCUmCgdexUN5rQsR7B
         zaAbN4nQBLY8PYUYVFQesua2tDk7pgQRqQEc9secdQsFk633YvQcz9wDKBRyccotqrdf
         +pKJMlxMlns/22zIIoITzwbElid2baDv0roRs2xL+v8NCnogy27G+YTm2wNFLWp9FQ8/
         7ZSQN0sCu2COo2cZ+EKsfd3J0C8zDHvidTyf7oJo/xdIJ4qO2qbefGqhvELAz+nPIi9M
         w99Q==
X-Gm-Message-State: AJIora9aaWf+UYCFvroHb0+8B6VHwJYmW4QGcu1QvV+0oBxON4PzavlE
	xs/ft1RpAS960MNz/14OwaF5zuqMWxYsvy9BSMmE/Q==
X-Google-Smtp-Source: AGRyM1spC6JwR89kxZwG4nhVeU6bfHjOmE3IEYDMJtJEYU9x3nVNTSOepK3dhEdseTGM80Ow8f/gWmafk1TI1WvUpZ0=
X-Received: by 2002:a17:906:5a67:b0:72b:610d:4aa4 with SMTP id
 my39-20020a1709065a6700b0072b610d4aa4mr16444194ejc.294.1657930125539; Fri, 15
 Jul 2022 17:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220711212932.1501592-1-justinstitt@google.com> <84e873c27f2426ce003e650004fe856bf72c634b.camel@perches.com>
In-Reply-To: <84e873c27f2426ce003e650004fe856bf72c634b.camel@perches.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 15 Jul 2022 17:08:34 -0700
Message-ID: <CAFhGd8pJyRYq-3VrKM+6+k0AysfYbVJEJm3FMFt9eAysAKDUpQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: mt7601u: fix clang -Wformat warning
To: Joe Perches <joe@perches.com>
Cc: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_170850_869212_B6EE96BF 
X-CRM114-Status: GOOD (  27.17  )
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

On Thu, Jul 14, 2022 at 11:33 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2022-07-11 at 14:29 -0700, Justin Stitt wrote:
> > When building with Clang we encounter this warning:
> > > drivers/net/wireless/mediatek/mt7601u/debugfs.c:92:6: error: format
> > > specifies type 'unsigned char' but the argument has type 'int'
> > > [-Werror,-Wformat] dev->ee->reg.start + dev->ee->reg.num - 1);
> >
> > The format specifier used is `%hhu` which describes a u8. Both
> > `dev->ee->reg.start` and `.num` are u8 as well. However, the expression
> > as a whole is promoted to an int as you cannot get smaller-than-int from
> > addition. Therefore, to fix the warning, use the promoted-to-type's
> > format specifier -- in this case `%d`.
>
> I think whenever a sizeof(unsigned type) that is less than sizeof(int) is
> emitted with vsprintf, the preferred format specifier should be %u not %d.

I believe the standard recommends using the promoted-to-type's format
specifier, in this case integer. I agree, though, that it is quite
bizarre to represent unsigned types with signed types. I'd be
interested in hearing more opinions on the matter.

> > diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> []
> > @@ -88,7 +88,7 @@ mt7601u_eeprom_param_show(struct seq_file *file, void *data)
> >                  dev->ee->rssi_offset[0], dev->ee->rssi_offset[1]);
> >       seq_printf(file, "Reference temp: %hhx\n", dev->ee->ref_temp);
> >       seq_printf(file, "LNA gain: %hhx\n", dev->ee->lna_gain);
> > -     seq_printf(file, "Reg channels: %hhu-%hhu\n", dev->ee->reg.start,
> > +     seq_printf(file, "Reg channels: %hhu-%d\n", dev->ee->reg.start,
> >                  dev->ee->reg.start + dev->ee->reg.num - 1);
>
> And this is not a promotion of an argument to int via varargs.
> The arithmetic did the promotion.

Right, I noted in my patch message that the type promotion was due to addition.

>
> I suggest s/%hh/%/ for all the uses here, not just this one.

I also contemplated this change but I think it might be a bit out of
scope for https://github.com/ClangBuiltLinux/linux/issues/378  -- What
do you think?
It could be argued that every single instance of %hh[dux] should be
replaced with %[dux].

> checkpatch could do this somewhat automatically.
> Of course any changes it suggests need human review.
>
> $ ./scripts/checkpatch.pl -f drivers/net/wireless/mediatek/mt7601u/debugfs.c --show-types --types=unnecessary_modifier --fix-inplace
> $ git diff --stat -p drivers/net/wireless/mediatek/mt7601u/debugfs.c
> ---
>  drivers/net/wireless/mediatek/mt7601u/debugfs.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> index 20669eacb66ea..b7a6376e3352e 100644
> --- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> +++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
> @@ -83,28 +83,28 @@ mt7601u_eeprom_param_show(struct seq_file *file, void *data)
>         struct tssi_data *td = &dev->ee->tssi_data;
>         int i;
>
> -       seq_printf(file, "RF freq offset: %hhx\n", dev->ee->rf_freq_off);
> -       seq_printf(file, "RSSI offset: %hhx %hhx\n",
> +       seq_printf(file, "RF freq offset: %x\n", dev->ee->rf_freq_off);
> +       seq_printf(file, "RSSI offset: %x %x\n",
>                    dev->ee->rssi_offset[0], dev->ee->rssi_offset[1]);
> -       seq_printf(file, "Reference temp: %hhx\n", dev->ee->ref_temp);
> -       seq_printf(file, "LNA gain: %hhx\n", dev->ee->lna_gain);
> -       seq_printf(file, "Reg channels: %hhu-%hhu\n", dev->ee->reg.start,
> +       seq_printf(file, "Reference temp: %x\n", dev->ee->ref_temp);
> +       seq_printf(file, "LNA gain: %x\n", dev->ee->lna_gain);
> +       seq_printf(file, "Reg channels: %u-%u\n", dev->ee->reg.start,
>                    dev->ee->reg.start + dev->ee->reg.num - 1);
>
>         seq_puts(file, "Per rate power:\n");
>         for (i = 0; i < 2; i++)
> -               seq_printf(file, "\t raw:%02hhx bw20:%02hhx bw40:%02hhx\n",
> +               seq_printf(file, "\t raw:%02x bw20:%02x bw40:%02x\n",
>                            rp->cck[i].raw, rp->cck[i].bw20, rp->cck[i].bw40);
>         for (i = 0; i < 4; i++)
> -               seq_printf(file, "\t raw:%02hhx bw20:%02hhx bw40:%02hhx\n",
> +               seq_printf(file, "\t raw:%02x bw20:%02x bw40:%02x\n",
>                            rp->ofdm[i].raw, rp->ofdm[i].bw20, rp->ofdm[i].bw40);
>         for (i = 0; i < 4; i++)
> -               seq_printf(file, "\t raw:%02hhx bw20:%02hhx bw40:%02hhx\n",
> +               seq_printf(file, "\t raw:%02x bw20:%02x bw40:%02x\n",
>                            rp->ht[i].raw, rp->ht[i].bw20, rp->ht[i].bw40);
>
>         seq_puts(file, "Per channel power:\n");
>         for (i = 0; i < 7; i++)
> -               seq_printf(file, "\t tx_power  ch%u:%02hhx ch%u:%02hhx\n",
> +               seq_printf(file, "\t tx_power  ch%u:%02x ch%u:%02x\n",
>                            i * 2 + 1, dev->ee->chan_pwr[i * 2],
>                            i * 2 + 2, dev->ee->chan_pwr[i * 2 + 1]);
>
> @@ -112,8 +112,8 @@ mt7601u_eeprom_param_show(struct seq_file *file, void *data)
>                 return 0;
>
>         seq_puts(file, "TSSI:\n");
> -       seq_printf(file, "\t slope:%02hhx\n", td->slope);
> -       seq_printf(file, "\t offset=%02hhx %02hhx %02hhx\n",
> +       seq_printf(file, "\t slope:%02x\n", td->slope);
> +       seq_printf(file, "\t offset=%02x %02x %02x\n",
>                    td->offset[0], td->offset[1], td->offset[2]);
>         seq_printf(file, "\t delta_off:%08x\n", td->tx0_delta_offset);
>
>

