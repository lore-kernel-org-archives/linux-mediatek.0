Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DFAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVKobzbn6knFV407TP6JytNhDIC4ndBTjGgshyfT8QU=; b=PuSB6XR9l/fR0E
	3Q4RHHS5hTkEq8FI5vc3FAxv8GMZFruu3Gkgo/qo16k+CwQyi0nfXquFzjkUntl52nCJwcEmQtuA5
	HOqNnPgnN8Ghv+KWnizmJhTruIMxoPdwitNW0m0C7CwlT+gCGGQqZ3NQ9oOyelxhdBdCuCR5IiRO5
	sljJZHeubHjqefUN+8f91Hb3fUG5BBVpAgFqJ5R7KeqcW9EiXSHEYVAIhKhZg0llTHAe8dlzGOHgN
	x5KQSBuX/hv0u18qfViFZeETCau5vNSKvFHK5Ud7C8NV4w1C2RiXtgxhTWi77SmJUsKk0ZSC+RxwB
	pMX/1lPiOZLXJ8bXJUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms6C9-006BEX-9X; Tue, 30 Nov 2021 16:41:29 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms6C6-006BD2-AQ
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 16:41:27 +0000
Received: by mail-vk1-f176.google.com with SMTP id b192so14031355vkf.3
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 08:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9e+BfCk8Var4/ZAoJpMqiBWB8frMmHg3JI2ty7Fj1I=;
 b=D7RAf6t5/zc3aMU2aEFFvuzjzWNcguGqkS7eE8cSrzxGy/Q1uJCV5HyKyY2w/eO3FF
 GXcrdPVfJG5fdB7sWUY3TfXFOPL9Wg/Etv+wbkBj/g/oY/OqGYoTRL5eFztHdoEiFi4j
 bBi5L1RRrGs4/0XBxwxuA2KMEi5mNzHYwnmqwKj9Vcw1OucV9VddYvb+vOWk/CjCx3ur
 r+1ULq3chgZwySxsWvlMl9tlaykAfKIDVIDKxSS608Lv9w4r48zEI27kgXOTZHfYgayA
 2lQFe5fL4gcB3rhSOVoacFx6cLIEN29Lq9ASEuzDPHTYl/ipGvln8m9j82op/QM8S0T6
 SZqg==
X-Gm-Message-State: AOAM531OoVUOpYxp4Co4LE4NeZVoamxf1TKn2fQY99Rks7m3PFiAOH4/
 XTX9lOEIsV4e+ljRIikFLRWrB8D70HME6Q==
X-Google-Smtp-Source: ABdhPJzNDaBB/WpwavGbmIHvi1WQxfgZRwUaOUjOWqKZLWitNLSYzyTXQ0+HVs5cUl2wClIYceYH4Q==
X-Received: by 2002:ac5:ccb8:: with SMTP id p24mr124003vkm.31.1638290482958;
 Tue, 30 Nov 2021 08:41:22 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id n10sm11455366uaj.20.2021.11.30.08.41.22
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 08:41:22 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a14so42772272uak.0
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 08:41:22 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr286260vsg.57.1638290482182; 
 Tue, 30 Nov 2021 08:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
In-Reply-To: <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Nov 2021 17:41:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
Message-ID: <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
Subject: Re: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 daniel.baluta@nxp.com, daniel.baluta@gmail.com, AjitKumar.Pandey@amd.com, 
 Balakishore.pati@amd.com, vsreddy@amd.com, Julian.Schroeder@amd.com, 
 vishnuvardhanrao.ravulapati@amd.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, yc.hung@mediatek.com,
 linux-mediatek@lists.infradead.org, Bard Liao <bard.liao@intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_084126_399405_905D4281 
X-CRM114-Status: GOOD (  36.30  )
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

Hi Daniel,

On Wed, Nov 17, 2021 at 12:39 PM Daniel Baluta
<daniel.baluta@oss.nxp.com> wrote:
> From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
>
> ACP hw block configuration differs across various distributions
> and hence it's required to register different drivers module for
> distributions. For now we support three ACP drivers:
>
> * ACP without SOF use case
> * ACP with SOF use case
> * ACP with SOF use case for DMIC and non SOF for I2S endpoints
>
> As all above driver registers with common PCI ID for ACP hw block
> we need code to determine ACP configuration and auto select driver
> module. This patch expose function that return configuration flag
> based on dmi checks for a system. ACP driver module probe register
> platform device based on such configuration flag to avoid conflict
> with other ACP drivers probed for same PCI ID.
>
> Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> Reviewed-by: Bard Liao <bard.liao@intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Thanks for your patch, which is now commit f1bdd8d385a80356 ("ASoC:
amd: Add module to determine ACP configuration") in sound-asoc/for-next.

> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -96,4 +96,10 @@ config SND_SOC_AMD_YC_MACH
>           Say m if you have such a device.
>           If unsure select "N".
>
> +config SND_AMD_ACP_CONFIG
> +       tristate "AMD ACP configuration selection"

This definitely needs proper dependencies, to prevent asking the user
about this when configuring a kernel without AMD Audio ACP support.

I would have sent a patch, but...

> +       help
> +        This option adds an auto detection to determine which ACP
> +        driver modules to use
> +
>  source "sound/soc/amd/acp/Kconfig"

> --- /dev/null
> +++ b/sound/soc/amd/acp-config.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +//
> +// This file is provided under a dual BSD/GPLv2 license. When using or
> +// redistributing this file, you may do so under either license.
> +//
> +// Copyright(c) 2021 Advanced Micro Devices, Inc.
> +//
> +// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
> +//
> +
> +/* ACP machine configuration module */
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/dmi.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +
> +#include "../sof/amd/acp.h"

This doesn't seem to use anything from this header file?

> +#include "mach-config.h"
> +
> +static int acp_quirk_data;
> +
> +static const struct config_entry config_table[] = {
> +       {
> +               .flags = FLAG_AMD_SOF,
> +               .device = ACP_PCI_DEV_ID,
> +               .dmi_table = (const struct dmi_system_id []) {
> +                       {
> +                               .matches = {
> +                                       DMI_MATCH(DMI_SYS_VENDOR, "AMD"),
> +                                       DMI_MATCH(DMI_PRODUCT_NAME, "Majolica-CZN"),
> +                               },
> +                       },
> +                       {}
> +               },
> +       },
> +};
> +
> +int snd_amd_acp_find_config(struct pci_dev *pci)
> +{
> +       const struct config_entry *table = config_table;
> +       u16 device = pci->device;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(config_table); i++, table++) {
> +               if (table->device != device)
> +                       continue;
> +               if (table->dmi_table && !dmi_check_system(table->dmi_table))
> +                       continue;
> +               acp_quirk_data = table->flags;
> +               return table->flags;
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(snd_amd_acp_find_config);

> +struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
> +       {
> +               .id = "AMDI1019",
> +               .drv_name = "renoir-acp",
> +               .pdata = (void *)&acp_quirk_data,
> +       },
> +       {},
> +};
> +EXPORT_SYMBOL(snd_soc_acpi_amd_acp_machines);

These symbols are only used from sound/soc/sof/amd/pci-rn.c.

Why is this code living under sound/soc/amd/, while the ACP code
is under sound/soc/amd/acp/?

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
