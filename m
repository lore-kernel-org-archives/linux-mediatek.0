Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB7BCD37BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+v2ay7d5zaezO4LQdeMSaE6xJKDm17at2Vx/sGq20mw=; b=ueXrPP4ChnqIaegtYL/kvmEVcr
	yZc30h/i6Ni0ew9Kz77qtr8lEoSfw0McOcjLxLpX61ImLtGbc9QcT6cPY2VmHAmwokVxrF5o/GKmM
	dR5WuSb0YS3HTqI7HRMYdhJEjm+ul8MxO/+NMu9zYdTE1JU5Q5Q5XxiLXYBzgFwYV8kSG58TA45tP
	Q4SmzPHQ0u+9Kwt5TEw4HM6vPf5Iuc+SwXTeUJ+keFCb2TRcnUjl83fcSxyELThtc//APIXRhu+6Q
	hjG/o+9eEIlCfp0PCsv1qPcv6rlVawzPpN1ZOiXeUnV7/PQBMhAV8D3rChsjvkeVUtIYErvlzDOvs
	tUjyg45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRiQ-0000000DvFa-3VL8;
	Mon, 11 May 2026 14:34:38 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMRiK-0000000DvEc-0FYt
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 14:34:37 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-7bd5c773ef3so43615927b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 07:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778510071; cv=none;
        d=google.com; s=arc-20240605;
        b=KLxFVadVPRiUmsDhfrIrK0C2QNh6sL6bTvlwvQedwU/hGGxdy9GrvdZ5oFzEKVE/eW
         iQMMGQYOX7/FjEUNXrtTywzE1bOeGmyeG21qnbE+bzn3uVRT5s4Qij6c3OF8kkSBnBzM
         0sO/Vdgbjn/KCh9RcUUoPJnRl6xTjwIn+tjqHKoFa1yRsJHTFbDXcLkIGLnHVwq7gLQL
         8EHWHHaEjrqfG2tM6bmJYwMpZw1yPycmhAcJBEAhnayjWFq8J1BWQ0edextw/aZabzXp
         KZvyq00oH8g4FuLjNViB9LcFIu9/50k5rMQZofQ0PqZkMCZgtoLSCsEathlOzMm3tRuA
         PeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+v2ay7d5zaezO4LQdeMSaE6xJKDm17at2Vx/sGq20mw=;
        fh=kT1o9y4yseff0SQY+7ZafbVHcOwCLxWn1AnnyzmOroE=;
        b=RXzGpmGUnMqEUCBOJ6pVSggqkdiQGWJIuUyS9wl443QfriWGWuC8zgj0g947U3XTPF
         5/362798xdFJPyPHC0pqEuUjnRVL+xzsY4HAHxcTIlYZrHKqvC2opjKr7JakFszknO6O
         yZRdWpvty5ZWaoLRaP3bgUl/jiillfSdfGFWwBC+NVrEckB6ZBhu9cFmav6M11m64ywj
         D0o1zH728nZ/TVnlmn/pY009ne2TJ1laC/1UFFaz69VlwjPYuvrSZ8lgx+8LJvefelSc
         qYdgc1vZiN3wmwwTNtZ5WHOka9NZrgJvY8JHQaZ9ghVJAiOTX/y8dSPvPvxSQSHOEpnZ
         rWTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778510071; x=1779114871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+v2ay7d5zaezO4LQdeMSaE6xJKDm17at2Vx/sGq20mw=;
        b=B6zPT2BUiXIgS6eYQ7xjDcX8u/XDRjATu0HlY95U88It3M/sUohCfxQKPgjz3Y4XMd
         mSNeRX7fzxR2m0qE8Al0s/FgcV88AbYuMB0SEb9Mecv6xcdm5ZaBeMNheRkMg66VSOUq
         oqF5ArkYD/q+DrPyK3UAssTuj+QZsCIt0PfIa1jqmT6VtW3ehTzohGyp17bs1pn8tWRv
         xeOfS6gd1+8nzA3oaqUd4sKZtvDXnNCWwhnU7mxl2YZBIBmM82tjGjmjenOsVWF1Nlp4
         WYGupLvQK2i0uMhGPpQHQMEgPPSoiUWKQmgWSbR3/uuAAFrxkgOubEffuqhadKgaJ1Yo
         3Oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510071; x=1779114871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+v2ay7d5zaezO4LQdeMSaE6xJKDm17at2Vx/sGq20mw=;
        b=HgkcgkrPmQLxwPQWbTslcdzkPj5UR5eWCbOhojF6ugm4pDs1BBNqYIwJjUziKrmK8Y
         EwQzEHGEBL/KB01ViCG1GTHBVQByPrsOh9o58xNHuBt6YGgdvqzX+UUmfOaEMn9cUVqF
         yYMMfsLkFKzglt0E/TewwGOYR+EPN7ZfhbgnNQhLe/hpHRlKm7fslV2vDqYKgkSRSa4i
         Pwql92E9Tjb5zWavo6Xuiy3R7qaFFPscaSB3DAyUWt9W6YzNrIx8EtnRzscMOuMx7Iov
         JJz7wyvIggUA7vEkbKlpiMkfH46UpqwvoVrq37vNjUXE5qMjc05UVTycG5NYC8J7PSic
         Oujg==
X-Forwarded-Encrypted: i=1; AFNElJ8Va4uwvSbMJK0GnXbJlTGUuv8JSpAr5o3uprICpA3qcb8afSPAph66+IXr45FNK4vCZV0AQFxBmsiKMTBa0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0TPACKHnK6Tw9y6c7Asp048tbUxU7sBVBqi8H/i31QyQ8sSYM
	pfQeXmUya7LvEHSddfpzuMdh8NLgsnMYtFhbepmLqBhX7GFmx5w5HA13jpZPqu2Ks0XIPd7rVNK
	3sFoVunBzNA35BbO8pEmd0WBoEO6N0c9+2C9zzFoH9Q==
X-Gm-Gg: Acq92OHYnLZ6KooFA5mySbi1/mhHLqWzSVmDv05EiqdNA8fz6+qAG5CmBNNJZHQRyX4
	GXRz1uKC234zJdhJFt3PDWWphWBlSro4w1XOmT6tk+vS0BmeQQDhQRhV4e0lxCZwn49nYBbIyAS
	4jlSNR2zwis4T99cNkjRQedEAoVVgs8v7PhUmyORR/b+cNiJgDrQWc6UAxI4GfdFAzSdsToVAre
	39cZqBcv5KgIWL3odrGMyt4sUznO0g2ZMiRhdI8EdUy7k+ABxDVvUfl1ISVrEaJx7bMolELS9wF
	MsQbEdYpWIxiopvdBM4=
X-Received: by 2002:a05:690c:dd3:b0:7ba:d5fb:b543 with SMTP id
 00721157ae682-7bdf5dcc7b4mr242694677b3.13.1778510070862; Mon, 11 May 2026
 07:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com> <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 16:33:52 +0200
X-Gm-Features: AVHnY4Lsmc0xOoSZAdNPsitAF34xmre0WH2Fz_Ejkt7Ep8UMQ1cwv9JaIHq62oo
Message-ID: <CAPDyKFo6nvBCnOHXUSvedaT3Rnob+oF=nZoRoic_EkgFBTxzwg@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in sdio_driver_id
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Ulf Hansson <ulfh@kernel.org>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux-mmc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	linux-bluetooth@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, Ping-Ke Shih <pkshih@realtek.com>, 
	linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Brian Norris <briannorris@chromium.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_073432_133751_2F309783 
X-CRM114-Status: GOOD (  22.33  )
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

On Fri, 17 Apr 2026 at 15:11, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> On all current Linux architectures sizeof(long) =3D=3D sizeof(void *) and
> this is used a lot through the kernel. For example it enables the usual
> practice to store pointers in sdio_driver_id's .driver_data member.
>
> This works fine, but involves casting and thus isn't type-safe.
> Additionally with the CHERI architecture extension there are machines
> with sizeof(void *) > sizeof(long) for with the traditional approach of
> storing a pointer in .driver_data doesn't work.
>
> By replacing the plain unsigned long .driver_data by an anonymous union,
> most of the casting can be dropped and it yields a working solution for
> CHERI.
>
> All users of struct sdio_driver_id are initialized in a way that is
> compatible with the new definition, so no adaptions are needed there.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Feel free to take this via whatever tree makes best sense!

Kind regards
Uffe

> ---
>  include/linux/mod_devicetable.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_deviceta=
ble.h
> index 5b1725fe9707..0eb5d196f5b5 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -414,7 +414,10 @@ struct sdio_device_id {
>         __u8    class;                  /* Standard interface or SDIO_ANY=
_ID */
>         __u16   vendor;                 /* Vendor or SDIO_ANY_ID */
>         __u16   device;                 /* Device ID or SDIO_ANY_ID */
> -       kernel_ulong_t driver_data;     /* Data private to the driver */
> +       union {                         /* Data private to the driver */
> +               kernel_ulong_t driver_data;
> +               const void *driver_data_ptr;
> +       };
>  };
>
>  /* SSB core, see drivers/ssb/ */
> --
> 2.47.3
>

