Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13769C4452B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 09:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3xqu6DOCRis3ts8JU1eK1hQauNPqKuaV4g+S3+L3WS0=; b=2kwwnBXyg7y2k8ynesFetz6Kch
	Ci/fsFf5rqTTJpi2iklaUtiYAgQyRcp7L1jCLfjP5Z5ynYkcD8rOEo7nLeGnzckBLiBDnp5tdRiAO
	0edeVTkLgxGOJEdkDUAEM5RCD1KbXrtmRiRtHnKhilIq+daaRPPTfdxJmyjgrCnCFAaQmvHqj4Sf5
	7Z77icwZWiqsT7mlMkFzoriEY736QtaCKDAAy3AVBw6qOhCvbt2+5B2k55EtJpYErxBmUWtitmGBI
	y3SFIGBOJypVtm9MmY7eK542TW9RQ7eITlwutWgSm0CN5KetBh7Nd24l6Jl/nt3E0Qg2kyWiUxOHU
	1Wbuoi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6T6-00000008vOq-0a6r;
	Tue, 21 Jul 2026 09:08:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6T4-00000008vOb-3gPN
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 09:08:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C67D43C44
	for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 09:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182081F00A3E
	for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624930;
	bh=3xqu6DOCRis3ts8JU1eK1hQauNPqKuaV4g+S3+L3WS0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=e2rKA2QoRAl6qUhMs9hQ1Eem9usUIBCUP4Q+OaZ3u0if2/XZI9Lioxy0NBFyDPryy
	 S8S5SeBLBgooqyplAkD00YNDXDjVV+kqgYF2g6JJ+ha+i2RCLuhpwfV3XAeBSd1O4s
	 Wj69Gm1/Wspw95I89hylmpns/qCqzELkR7ali+NjMd9pFZVuih/FtDIx7FM8NSfDNx
	 CvCxQDoIXGcegrKfYENKCPGlVIVdYtx6oNm2uYMuQ1r19juAwtZMVopvj1P7F3aZB5
	 hvGRxrcmxIt7Lf8kVkizYLhw+9XVTVP0ATFPuzHD+p6CxSpaXideDHYmVvzmyrzD/W
	 dDjs7PUlOlGAg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeba09900bso5761276e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 02:08:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrLODYl+BMqpT/gZ33gkr5oobAkHIdOU9L/hzwU6L1ZWBWJtXJwnE3m4udqdFFpnjGtLmP9NSus7enh7O18qg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkOhqUHBTo3HDPScVrP5ol89hPn/npDxCMWbGFsyetixp+JH8H
	/BNWjyjRSBgR+5R968gBK/GfPQJ6wvsKahLGS7cELe6TCLFX0RhDPf4loTpdquQj0Mh4nfoVk5b
	50TdCHGZJ8RTvhaFvTZYenpZKCltoci+G0DtTBxImZw==
X-Received: by 2002:a05:6512:239e:b0:5ad:58c8:5de8 with SMTP id
 2adb3069b0e04-5b28f854e5amr3537391e87.1.1784624928719; Tue, 21 Jul 2026
 02:08:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 09:08:45 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 09:08:45 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260721065413.2306137-4-wenst@chromium.org>
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-4-wenst@chromium.org>
Date: Tue, 21 Jul 2026 09:08:45 +0000
X-Gmail-Original-Message-ID: <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
X-Gm-Features: AUfX_mzwzLN239CObNW1gLp59KRlXCiikBTT40SGbitpk5WIVatni_t3viiU0PQ
Message-ID: <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 21 Jul 2026 08:53:58 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> The power sequencing consumer API already does power on state tracking
> internally. Expose the state to consumers through pwrseq_power_is_on()
> so that they don't have to reimplement it locally.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Reverted back to returning -EINVAL if descriptor is NULL
>
> Changes since v4:
> - Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
>   the descriptor is optional, matching the other pwrseq consumer APIs
>
> Changes since v3:
> - Added missing stub function for !POWER_SEQUENCING
>
> Changes since v2:
> - New patch
>
> Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
> as it is a build time dependency. Bartosz wants the change on an
> immutable branch to pull into the pwrseq tree.
> ---
>  drivers/power/sequencing/core.c | 18 ++++++++++++++++++
>  include/linux/pwrseq/consumer.h |  6 ++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
> index 02f42da91598..72b96d36920e 100644
> --- a/drivers/power/sequencing/core.c
> +++ b/drivers/power/sequencing/core.c
> @@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(pwrseq_power_off);
>
> +/**
> + * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
> + * @desc: Descriptor referencing the power sequencer.
> + *
> + * This returns the last requested state of the power sequencer.
> + *
> + * Returns:
> + * On success, 1 for on and 0 for off; negative error number on failure.
> + */
> +int pwrseq_power_is_on(struct pwrseq_desc *desc)
> +{
> +	if (!desc)
> +		return -EINVAL;
> +
> +	return desc->powered_on;
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
> +

Didn't we agree on introducing an enum to make it future-proof for when we
also pull in pwrseq_is_controllable() from Loic?

I think this should work like so:

enum {
	PWRSEQ_STATE_UNKNOWN,
	PWRSEQ_STATE_ON,
	PWRSEQ_STATE_OFF,
};

int pwrseq_get_state(struct pwrseq_desc *desc)
{
	/* Only once this is upstream. */
	if (!pwrseq_is_controllable(desc))
		return PWRSEQ_STATE_UNKNOWN;

	return desc->powred_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;
}

Bart

