Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08018C54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 01:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zR/D7Gt4i2U/ZYSazLjSoiwUJzxb0ZYwel8BdIg17Y=; b=eCFgyIRFE5Ym6MHz//ueJoGKHD
	4T5dEIe0pCkQ/NbZcbeKJe5zU05oGJWMXqFPuxYkeLLQVIsdvMrkeTJEVs1RuffPrUsFs6Md2RQt6
	ln4xGahPjz+DmBOsa/hKvB+TF5JIbFaxZkSPqXgKMNKedwD662sRoMUw6GF1qcNrx+HJ6Kf2+gCa+
	eX+XACmh6zOoYu6NpQRNDlvj2Sp+OjczQKxtgojb20LB18CQCsn438Nkw+Qn8n2arjUp6DRsP4P9E
	yuICEmYhNZUGgTIXm6W0/qM1vcXkM3f6/aTv28WImHRZukXzLDte8nfc22iRpSIYGB5YnIfDI7bPk
	gw84UpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYHI5-003c6V-JL; Wed, 14 Sep 2022 01:34:13 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYHHq-003bk5-Cy; Wed, 14 Sep 2022 01:34:00 +0000
Received: by mail-pj1-x102d.google.com with SMTP id d64-20020a17090a6f4600b00202ce056566so7906290pjk.4;
        Tue, 13 Sep 2022 18:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date;
        bh=+zR/D7Gt4i2U/ZYSazLjSoiwUJzxb0ZYwel8BdIg17Y=;
        b=e83yzkSfbqQl4FHCnsCg8QeAgRRFyHw5t04ORjLKvGZj53gvAgj0G9uh1sdZ+kZuP0
         mzzhcYPiZ9VDYTZ6HAzW1nCT4q4J+UovZbuzcWw4crCugJpiPnUQr1pUe+id1V7Mg3kr
         qx6L7Vpud8XADS7FJhFcwf9Df5e+LCYzoxinKnHXxaTHCuP9f2vrVTBsNt48asKUN6+w
         ZrsY4eAUg+WCZzgxR5XjwzAI7922phY1vTz6/VzWsANESlZjbYii907fIG3SpN16tgjW
         fcql6vhIpWM2foBiNqC3OC+2IuAKVoHTDFQmKhR9VrMKfKy5ellCfn0whtr4nT9Kps9I
         YrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=+zR/D7Gt4i2U/ZYSazLjSoiwUJzxb0ZYwel8BdIg17Y=;
        b=rnhFzA8JWzNY3Yr29dvdJkkGF4gNxougaU93OfByB9D2VG446Q5i3oyYTAuh5pu/lt
         GeZQu2NedJO3R+/ui9IvadmV8pZCMmqgiQHmQuqB4TeH509yazpavURhdGp9L0fMnjIr
         yI/hKnUX5pab69zm7GIhZJFSr9n1MuwYkPgwWjFUjZH9SQTwLz9uUGl79uib70lF9tC5
         vNRw7g+mlj4Or4bi72uTCpwvLRTvAZj4EYnqOdOXFPDmxbnh6q1L1t+wq8JdYz3Fyv2W
         1BMM+CAfku6VJuiA8+ZwV36X5fABnzkcoDmMxl0HH24eKcnH/gn6M4ba32yOF0r8g7Fn
         19iw==
X-Gm-Message-State: ACrzQf3DBIzwSMZA6sY77wnqOYXlB3Mzw7bokM0AHW/+GxaXdEnDCdaL
	UQ9V/uf6g7fnRKljuG4sSaw=
X-Google-Smtp-Source: AMsMyM4P6M/na02By5wy5twVLFsbiifoZyhYyzLDPSNF/G5GVIYSiqntzXYncxIbP0HojwZqM/7qQA==
X-Received: by 2002:a17:90b:4c84:b0:203:20a:7afe with SMTP id my4-20020a17090b4c8400b00203020a7afemr2122581pjb.94.1663119235718;
        Tue, 13 Sep 2022 18:33:55 -0700 (PDT)
Received: from cyhuang-hp-elitebook-840-g3.rt ([2402:7500:486:362c:d94f:b1bb:6842:3424])
        by smtp.gmail.com with ESMTPSA id d21-20020a170902729500b0017441330392sm9025714pll.63.2022.09.13.18.33.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Sep 2022 18:33:55 -0700 (PDT)
Date: Wed, 14 Sep 2022 09:33:49 +0800
From: ChiYuan Huang <u0084500@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Gene Chen <gene_chen@richtek.com>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	kernel-janitors <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write
 functions
Message-ID: <20220914013345.GA5802@cyhuang-hp-elitebook-840-g3.rt>
References: <Yv8ezribLQbq5ggv@kili>
 <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
 <20220822125705.GD2695@kadam>
 <YxmSTH5ETSC0D3Rp@google.com>
 <Yxm7eztkQKDPU/Kl@kadam>
 <YxrkZX36wzVlzq5u@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxrkZX36wzVlzq5u@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_183358_739053_011066A8 
X-CRM114-Status: GOOD (  34.52  )
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

On Fri, Sep 09, 2022 at 07:59:49AM +0100, Lee Jones wrote:
> On Thu, 08 Sep 2022, Dan Carpenter wrote:
> 
> > On Thu, Sep 08, 2022 at 07:57:16AM +0100, Lee Jones wrote:
> > > On Mon, 22 Aug 2022, Dan Carpenter wrote:
> > > 
> > > > On Fri, Aug 19, 2022 at 09:27:13AM +0300, Andy Shevchenko wrote:
> > > > > On Fri, Aug 19, 2022 at 8:25 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > > >
> > > > > > It looks like there are a potential out of bounds accesses in the
> > > > > > read/write() functions.  Also can "len" be negative?  Let's check for
> > > > > > that too.
> > > > > 
> > > > > ...
> > > > > 
> > > > > > Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")
> > > > > 
> > > > > > From static analysis.  This code is obviously harmless however it may
> > > > > > not be required.  The regmap range checking is slightly complicated and
> > > > > > I haven't remembered where all it's done.
> > > > > 
> > > > > Exactement! I do not think this Fixes anything, I believe you are
> > > > > adding a dead code. So, can you do deeper analysis?
> > > > 
> > > > I spent a long time looking at this code before I sent it and I've
> > > > spent a long time looking at it today.
> > > > 
> > > > Smatch said that these values come from the user, but now it seems
> > > > less clear to me and I have rebuilt the DB so I don't have the same
> > > > information I was looking at earlier.
> > > > 
> > > > So I can't see if these come from the user but neither can I find any
> > > > bounds checking.
> > > 
> > > What's the consensus please?
> > 
> > Let's drop it.  I think it's not required.
> 
> Dropped.
> 
Hi, all:

  I have reproduced this case.
If register access over the bound, it'll cause the NULL pointer.
For the MT6370, the register bank layout is 0 -> TCPC, 1 -> PMU.

From my experiment, I try to access 0x200, it means bank 2 -> empty

[   41.301385] Hardware name: Raspberry Pi 4 Model B Rev 1.2 (DT)
[   41.307296] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   41.314358] pc : i2c_smbus_xfer+0x58/0x120
[   41.314371] lr : i2c_smbus_read_i2c_block_data+0x74/0xc0
[   41.314376] sp : ffffffc008ceb9a0
[   41.327261] x29: ffffffc008ceb9a0 x28: 0000000000000000 x27: ffffffc008cebb94
[   41.334505] x26: ffffffe529116000 x25: ffffffc008ceba30 x24: 0000000000000008
[   41.334513] x23: 0000000000000000 x22: 0000000000000001 x21: 0000000000000000
[   41.334520] x20: 0000000000000000 x19: ffffff804e1e8010 x18: ffffffe529116538
[   41.348994] x17: 0000000000000000 x16: ffffffe528ae11f0 x15: ffffff804e1be01e
[   41.349002] x14: 0000000000000000 x13: ffffff804e1bd03c x12: 7220303032783020
[   41.370710] x11: 0000000000000000 x10: 000000000000000a x9 : ffffffc008cebb60
[   41.377953] x8 : 0000000000000000 x7 : ffffffe529116538 x6 : ffffffc008ceba30
[   41.385196] x5 : 0000000000000008 x4 : 0000000000000000 x3 : 0000000000000001
[   41.392436] x2 : 0000000000000000 x1 : 0000000000000002 x0 : ffffff804e1e8010
[   41.399677] Call trace:
[   41.402153]  i2c_smbus_xfer+0x58/0x120
[   41.405956]  i2c_smbus_read_i2c_block_data+0x74/0xc0
[   41.410991]  mt6370_regmap_read+0x40/0x60 [mt6370]
[   41.415855]  _regmap_raw_read+0xe4/0x278
[   41.419834]  regmap_raw_read+0xec/0x240
[   41.423721]  rg_bound_show+0xb0/0x120 [mt6370]
[   41.428226]  dev_attr_show+0x3c/0x80
[   41.431851]  sysfs_kf_seq_show+0xc4/0x150
[   41.435916]  kernfs_seq_show+0x48/0x60
[   41.439718]  seq_read_iter+0x11c/0x450
[   41.443519]  kernfs_fop_read_iter+0x124/0x1c0
[   41.447937]  vfs_read+0x1a8/0x288
[   41.451296]  ksys_read+0x74/0x100
[   41.454654]  __arm64_sys_read+0x24/0x30
[   41.458541]  invoke_syscall+0x54/0x118
[   41.462344]  el0_svc_common.constprop.4+0x94/0x128
[   41.467202]  do_el0_svc+0x3c/0xd0
[   41.470562]  el0_svc+0x20/0x60
[   41.473658]  el0t_64_sync_handler+0x94/0xb8
[   41.477899]  el0t_64_sync+0x15c/0x160
[   41.481614] Code: 54000388 f9401262 aa1303e0 52800041 (f9400042) 
[   41.487793] ---[ end trace 0000000000000000 ]---

I check the APIs regmap_read/write and regmap_raw_read/write.

regmap_read/write -> blocked by boundary check in regmap_readable/writeable
regmap_raw_read/write -> no additional boundary check.

I guess the result for regmap_bulk_read/write is the same as
regmap_raw_read/write.

For this case, it seems mt6360 regmap will also cause this issue.

I'll submit one to fix this.

Hi, Dan:
  Your patch really fix this.
Just one thing need to be confirmed, but it depends on what Lee prefers.

In mt6370.h, we already defiend the enum for the bank boundary
"MT6370_MAX_I2C".

Instead of ARRAY_SIZE(info->i2c), you can also use the enum define.

Anyway, many thanks to report this bug.

ChiYuan Huang.


> -- 
> Lee Jones [李琼斯]
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

