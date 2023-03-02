Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93AF5C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n+FX2bRnFYB4pwUNOT+bxicT/CBSQOm6gc2j2xz3BnQ=; b=c4Eqfb3uG/JT929GHL5DmWUULl
	NrIjLeb4zrGVEmVFNcjYdE3roE9BNdFQFE3zBuJcO/1uquJCkaCJNXTvZTnzdIJ7TJZeF7R7wkocY
	k2NtHX7zXtyjoppNn7o80jbde214iUj/nO+a2GmVW4MRXMNr9udwOiLYa2rwrBPKwVtWP6O9IUNaF
	Mq7xjulBNLoH41WulEMmK8PoG9RlMgzCAwbGEz7PcPQo53ztpuuGFZVFLHLt1QGqpq/1ZG9pBaMEz
	8HbH6IUS2Md7lt/kv2bA4+WW/Em0r9/SGEkJTPY8YsPRg0k9CY4L3YhDCM6NQLjZGWptAiZCktWmV
	c2mTJcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXjr3-002SSn-9u; Thu, 02 Mar 2023 14:24:21 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXjqy-002SRR-Gq
	for linux-mediatek@lists.infradead.org; Thu, 02 Mar 2023 14:24:20 +0000
Received: by mail-ed1-x535.google.com with SMTP id da10so68358127edb.3
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 06:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1677767053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+FX2bRnFYB4pwUNOT+bxicT/CBSQOm6gc2j2xz3BnQ=;
        b=mySt6yKzU0MPpjsIOQSpdfsaJYaU4vwgigGhMgO0Rlq0/92t/YM9DmRkeNxagirRcp
         iT+nNZ2RewxnwPpll7uIfD6P5B1zOssp9LmcMs4g9hesKKVuvRlvIXxvp7mPeyrBHkh2
         zMiAh6N95NMozIK5wOmbbL6jJ6ZP5vpWM46hfoUzm/BUsikUpF+CZD4wz6UQXNcj/M4b
         rRziW8AWrS7yO3/jNVSbn8uP9Un/sqQO4L1Sq0Vjux/C9Jtpq5Y+4Vr3eBPd7xtNCuV8
         b7+WCuW2Qk9anZswOk/fSpxBWrSEvuHPbBPBpieju5ccRVDFbxx71gdn32t3t8s2LSjR
         knZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677767053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+FX2bRnFYB4pwUNOT+bxicT/CBSQOm6gc2j2xz3BnQ=;
        b=4XnWkBtGnEOkKBISK67IsG5choHxP2xAYUjWY3iMpZX1dxkqlryjkKEVvMYSvsC7B5
         lSzIK+xn4okN4APJox90baTYHt16PN9dC39DvR8dcA7mpZ8lReNJ85ehkMyh5IQOJPgD
         hOnXFbXEuDl3ghmDXC7Lb/03dWP7rzgeqYz/NGbmdJBGZO3InTDWEGuZWZeS92Yvv89u
         bgCqIT9JdkpJ0z4KxVebMffX6IMVIVDc1/aX3fN9LYEDKLfaa9RqY9sc5brykY2dB7Jb
         /syt6erD3uIOEmNK7OtdfPJvjyysFKWVAtSS9PkXInAuGUknj/yM2fcruUQcWHJ3ETb2
         Qx7w==
X-Gm-Message-State: AO0yUKVb0fs95kOPqmkQiulbpFnpA/I8xKoYOzGkLsmYI/0wJLzSeQck
	nbWjxmHF1A3lT2WZ807qvZgwu0uwIrtGDLIgn4W4h1p0n8+5kFujBcA=
X-Google-Smtp-Source: AK7set8r4j0tq4rowbbxxo8fIvmc+CPTtwUYa80qViAhpkPD9kvq8gLfk9uOHpWXWuK70y+1jlhXp7wFwtrfjeU2zns=
X-Received: by 2002:a17:906:6d55:b0:8f3:9ee9:f1e2 with SMTP id
 a21-20020a1709066d5500b008f39ee9f1e2mr1255982ejt.5.1677767053169; Thu, 02 Mar
 2023 06:24:13 -0800 (PST)
MIME-Version: 1.0
References: <Y/yTacHF8TvAkxdj@kili>
In-Reply-To: <Y/yTacHF8TvAkxdj@kili>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Thu, 2 Mar 2023 15:23:37 +0100
Message-ID: <CAGuA+ooJXL9f5P8ToCyOwYoYA2TG7H4x_H5FMDhAOwqf51FfQg@mail.gmail.com>
Subject: Re: [bug report] thermal/drivers/mediatek: Add the Low Voltage
 Thermal Sensor driver
To: Dan Carpenter <error27@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_062416_815052_A6587981 
X-CRM114-Status: GOOD (  12.82  )
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

On Mon, Feb 27, 2023 at 12:26=E2=80=AFPM Dan Carpenter <error27@gmail.com> =
wrote:
>
> Hello Balsam CHIHI,
>
> The patch f5f633b18234: "thermal/drivers/mediatek: Add the Low
> Voltage Thermal Sensor driver" from Feb 9, 2023, leads to the
> following Smatch static checker warning:
>
>         drivers/thermal/mediatek/lvts_thermal.c:562 lvts_calibration_init=
()
>         warn: not copying enough bytes for '&lvts_ctrl->calibration[i]' (=
4 vs 2 bytes)
>
> drivers/thermal/mediatek/lvts_thermal.c
>     555 static int lvts_calibration_init(struct device *dev, struct lvts_=
ctrl *lvts_ctrl,
>     556                                         const struct lvts_ctrl_da=
ta *lvts_ctrl_data,
>     557                                         u8 *efuse_calibration)
>     558 {
>     559         int i;
>     560
>     561         for (i =3D 0; i < lvts_ctrl_data->num_lvts_sensor; i++)
> --> 562                 memcpy(&lvts_ctrl->calibration[i],
>     563                        efuse_calibration + lvts_ctrl_data->cal_of=
fset[i], 2);
>                                                                          =
         ^
> This is copying an array of known ints to a u32 array.  It should copy
> sizeof(int) instead of 2.  It only works because the data you're on
> little endian and the data is small.
>
>     564
>     565         return 0;
>     566 }
>
> regards,
> dan carpenter

Hello Dan Carpenter,

Thank you for reporting this bug.
I will create a patch to fix it ASAP.

Best regards,
Balsam

