Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786D5C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auS4tVUwcUseQVTVEiGRM+ro1zrL8AC/r1RNa7sIwkY=; b=UNTZIeW7MKS1Td2ArrAMeBFXUq
	DvQv1j5fdraD8nyYkCgw5Hc3jPLeyRvnbSUYVGMA6Mrpy+5XBx4WgUA6bi/s+X0xviXlBwW7SCPti
	qq/ELy6lwSZrMVAtAkzI8RRjHkATuiETnSx9K+Fypr179KKxHARLbrCt3PBOQZnrLFqZHuicVeNvu
	8YzzpH89bJhghDtXReQ9Am+BG4HsU0ZubSN9hwuqOlOYfrnyZYRAdMptwuAL0PDaklcgILyBor/Fg
	KWaj3CQIw8WU6VqNRZZIqLbqQqlTyBtMlH6L37EmMSsDlJ75JUCoLFt8JTtPEkaPHq4C2fC89xHAh
	76y4Mv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnUO-006Of5-DE; Fri, 21 Oct 2022 08:34:48 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnTj-006OOI-Ds; Fri, 21 Oct 2022 08:34:08 +0000
Received: by mail-qk1-x72c.google.com with SMTP id j21so1571773qkk.9;
        Fri, 21 Oct 2022 01:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=auS4tVUwcUseQVTVEiGRM+ro1zrL8AC/r1RNa7sIwkY=;
        b=hkYNZqktU4aAHFnn8vZ6QXTJRErSH0MRNGpOfna068WCQa5EHyDJYazCz4JmRfrquz
         GdIisRXXX7obNueHKmj1/JNlDZ4EhIMJfWgbiZxzE/jK8OQCUcQRRU4ASjPd31m/xidh
         kx3lOjx1L59ry2UO8kaXbgS5eKW7xAvxr4NS/8xWwm4gQ+NV2Y9v67ZM0Cx1PXua3K2Y
         Zgph9N6RMqO/esa812+MJOsxoavdSX8n4HQPPH76MWRs/xrxYegmHlWNvXNwD8T7t2rh
         ABUs0kgfoTnQriKHftPFlUSUWExu+Bw9/CDxpyBWdftpjOJ96Q3ZTAutBsGs3IrCgPca
         B5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auS4tVUwcUseQVTVEiGRM+ro1zrL8AC/r1RNa7sIwkY=;
        b=b9jl3qj5sJjzRLSgmqjQP+AVu5dtrN4LVnZ5Uukkq026SSdkQbFBex8GOwS5Enp8ep
         lTs7YfNmgEraadr0BNC6i2AskuEDfKcMMC3pVwpQu7/l9zITiVBz8PHCg0+VPwCyUtW3
         xOQ4BlM9IR/E4lJeGo8PbFHl8AN8oivLYJaW++2rjpmO0rd007IOv//0Ir9i4r3FhgZs
         MpYR6aDUbJ/WJN8VVm2tuYuLV15oX9zpSHgt3nRJFqbAivd2rzjZuuKHcYDzM8ycw+sD
         IePK4zGsHBxfL6GGvDHdZ4fs5xpqklO+3wZDmnO+vEDNyaTlrHOPayKOQPy8xZ6jg3zN
         CxsA==
X-Gm-Message-State: ACrzQf3sFgL+TEV8BGJF9Y6mbFAqI1nnHVGxDIUcl1sxG7YQAFytjlo3
	1PiafIdamYdlqVoHAXKDJHeE2XhFX6jBXWmwePHO0QlSrkN+Ow==
X-Google-Smtp-Source: AMsMyM7Uzw7wHP0j9EY0rDtZFj3HwrBBdUDk+AoqIm5ZhiX0BU7J8S6i2OXG0OrBIafK5nqO+eXsOqX3eqvGNo2taB8=
X-Received: by 2002:a05:620a:2552:b0:6ca:bf8f:4d27 with SMTP id
 s18-20020a05620a255200b006cabf8f4d27mr12651177qko.383.1666341242520; Fri, 21
 Oct 2022 01:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <1666318661-11777-1-git-send-email-u0084500@gmail.com>
In-Reply-To: <1666318661-11777-1-git-send-email-u0084500@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 21 Oct 2022 11:33:26 +0300
Message-ID: <CAHp75VeMvWycVsNPHb1cvMbtVSCiX3m9wUsZk7HkPU+e=VTb3A@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6370: Add the out-of-bound check to prevent the
 null pointer
To: cy_huang <u0084500@gmail.com>
Cc: lee@kernel.org, matthias.bgg@gmail.com, chiaen_wu@richtek.com, 
	cy_huang@richtek.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_013407_502199_20A90BD3 
X-CRM114-Status: GOOD (  11.09  )
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

On Fri, Oct 21, 2022 at 5:17 AM cy_huang <u0084500@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> This potential risk could happen at regmap_raw_read() or
> regmap_raw_write() when accessing the over-bound register address.
>
> For testing, I try to reproduce it with a testing attribute file.
> Below's the issue trace log.

It looks like you randomly cut the trace.
It's not what I meant and documentation suggests.

> [41.314358] pc : i2c_smbus_xfer+0x58/0x120
> [41.314371] lr : i2c_smbus_read_i2c_block_data+0x74/0xc0
> [41.399677] Call trace:
> [41.402153]  i2c_smbus_xfer+0x58/0x120
> [41.405956]  i2c_smbus_read_i2c_block_data+0x74/0xc0
> [41.410991]  mt6370_regmap_read+0x40/0x60 [mt6370]
> [41.415855]  _regmap_raw_read+0xe4/0x278
> [41.419834]  regmap_raw_read+0xec/0x240
> [41.423721]  rg_bound_show+0xb0/0x120 [mt6370]
> [41.428226]  dev_attr_show+0x3c/0x80
> [41.431851]  sysfs_kf_seq_show+0xc4/0x150
> [41.435916]  kernfs_seq_show+0x48/0x60
> [41.439718]  seq_read_iter+0x11c/0x450
> [41.443519]  kernfs_fop_read_iter+0x124/0x1c0
> [41.447937]  vfs_read+0x1a8/0x288
> [41.451296]  ksys_read+0x74/0x100
> [41.454654]  __arm64_sys_read+0x24/0x30
> [41.458541]  invoke_syscall+0x54/0x118
> [41.462344]  el0_svc_common.constprop.4+0x94/0x128
> [41.467202]  do_el0_svc+0x3c/0xd0
> [41.470562]  el0_svc+0x20/0x60
> [41.473658]  el0t_64_sync_handler+0x94/0xb8
> [41.477899]  el0t_64_sync+0x15c/0x160
> [41.481614] Code: 54000388 f9401262 aa1303e0 52800041 (f9400042)
> [41.487793] ---[ end trace 0000000000000000 ]---

...

> If there's still something improper, please kindly correct me.

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#backtraces-in-commit-messages

-- 
With Best Regards,
Andy Shevchenko

