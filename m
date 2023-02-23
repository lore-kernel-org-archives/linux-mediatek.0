Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF40C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 11:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syapajUQQKPNTLxoBBob0wJRqUEzcQ+Vd9hvk03JOZ0=; b=DVMr7EoMhkHKOLfxtXlTxAtubu
	MwArY5koRMZqliodzY5sSI5H9P+7Y0ke9RamXe4X3JTELqrSaRL4L6E80tdmXjVLsHyWOdaK8DESA
	ryswLodlAWfhYpo/T9FpaezN4r/Y4I6O3R4CikR+DgMkXreo1Pv7OG2BxaO2A0CEeuGa7Qynd/5bu
	XPyrbAE687eUFFPyewLIHxzJjqMTXocrWDoHQmJPbWA4r+Mm+UYFts5Shj+HPCaUujELB7arjFI7z
	bS+dPy9spvfQWoejXE6D9m3e29K5Fnz7J1E/jwYXdLokxHjdG7Qwt6WGkLoweznKO/FSlFSDIJ5cO
	/jj3+Ziw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVA0T-00GCbt-Ji; Thu, 23 Feb 2023 11:43:25 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVA0J-00GCZV-5Q; Thu, 23 Feb 2023 11:43:16 +0000
Received: by mail-ed1-f44.google.com with SMTP id cy6so35547701edb.5;
        Thu, 23 Feb 2023 03:43:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syapajUQQKPNTLxoBBob0wJRqUEzcQ+Vd9hvk03JOZ0=;
        b=cKTl8qPhigiCsct1r0mWyoXsv2BN8r9czI3PM9pTqm2iOH6PO15F8r9j0iW+Qk64r2
         21ZIcsn0zmqoojW7b0ipQ1iAR1aOk+nDhv9Skhl+cgDUppkRWMwwfMIkilD6fpbaPnpx
         cRWJnJs/Znynk4yowJfdaf43vu91jyfYBEBuHFxedavkBhO8w2NuJ6+lCEU1RxICy5LR
         13hYqO+P9J9Z5nHYIrRc+JH8VXRtjA7nrvWvw3VGL6WNzIeCp6pQEYZ/Yq7Kpj08WCJ0
         usXXbHKLAyxvs7pJTUMwJN8xMKh5qSVgHfZTKuTJA8rqkQmvSlk+55NzES5wYmGrSTX3
         CgQw==
X-Gm-Message-State: AO0yUKXAq7wTnswT4ALVYZ7hKk0HLEeaPn/SYauk20+QTgnbvTlcEAx3
	6SYf00wwsY3UGJ1KQmt8v+RcvRa6P2e3Xd1TMZE=
X-Google-Smtp-Source: AK7set9CFmlLdErXJwKuzgfcUTyFMTlrdRel7rfmMsQpqyTEmDHe63bLhlD6rNr8FmT9Lzr1jLyJnQQZtkuVdISeGSw=
X-Received: by 2002:a17:907:7d8d:b0:8ad:d366:54c4 with SMTP id
 oz13-20020a1709077d8d00b008add36654c4mr11083740ejc.4.1677152592060; Thu, 23
 Feb 2023 03:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
 <20230221180710.2781027-7-daniel.lezcano@linaro.org> <CAJZ5v0gTmi7ZeDDdHWGWju4m3bv2366oVqSP1dGOT+3jLV-jaw@mail.gmail.com>
 <0889767f-d187-0cb4-895e-c149517b6636@linaro.org> <CAJZ5v0h=UCOyJ88UgEdqch4NZK+DaT8jWnDaguQGNx-KOMhPPA@mail.gmail.com>
 <2b843912-cc9b-f1ac-1f81-28e3ecf8daba@linaro.org>
In-Reply-To: <2b843912-cc9b-f1ac-1f81-28e3ecf8daba@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 23 Feb 2023 12:43:00 +0100
Message-ID: <CAJZ5v0g+fkX=ZUJ0MgENy2SmMv98wD0dApVwU352OS4ZXpDDCw@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] thermal: Don't use 'device' internal thermal
 zone structure field
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Balsam CHIHI <bchihi@baylibre.com>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ido Schimmel <idosch@nvidia.com>, 
	Mark Brown <broonie@kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_034315_220590_95D9E54D 
X-CRM114-Status: GOOD (  34.64  )
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

On Thu, Feb 23, 2023 at 10:56 AM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 22/02/2023 21:06, Rafael J. Wysocki wrote:
> > On Wed, Feb 22, 2023 at 9:00 PM Daniel Lezcano
> > <daniel.lezcano@linaro.org> wrote:
> >>
> >> On 22/02/2023 20:43, Rafael J. Wysocki wrote:
> >>> On Tue, Feb 21, 2023 at 7:07 PM Daniel Lezcano
> >>> <daniel.lezcano@linaro.org> wrote:
> >>>>
> >>>> Some drivers are directly using the thermal zone's 'device' structure
> >>>> field.
> >>>>
> >>>> Use the driver device pointer instead of the thermal zone device when
> >>>> it is available.
> >>>>
> >>>> Remove the traces when they are duplicate with the traces in the core
> >>>> code.
> >>>>
> >>>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >>>> Reviewed-by: Balsam CHIHI <bchihi@baylibre.com> #Mediatek LVTS
> >>>> ---
> >>
> >> [ ... ]
> >>
> >>>>           thermal_zone_device_update(data->ti_thermal, THERMAL_EVENT_UNSPECIFIED);
> >>>>
> >>>> -       dev_dbg(&data->ti_thermal->device, "updated thermal zone %s\n",
> >>>> +       dev_dbg(data->bgp->dev, "updated thermal zone %s\n",
> >>>>                   data->ti_thermal->type);
> >>>
> >>> The code before the change is more consistent, because it refers to
> >>> the same object in both instances.
> >>>
> >>> It looks like a type field accessor is needed, eg. thermal_zone_device_type()?
> >>>
> >>> Or move the debug message to thermal_zone_device_update()?
> >>
> >> Actually it is done on purpose because the patch 9 replaces the accesses
> >> to 'type' by 'id', the thermal_zone_device_type() accessor won't be needed.
> >
> > Cool.
> >
> > However, this is a change in behavior (albeit small) which doesn't
> > appear to be necessary.
> >
> > What would be wrong with having a tz->type accessor too?
>
> I can add the 'type' accessor but from my point of view it is not
> correct because the information belongs to the thermal framework and it
> is used to export the information in the sysfs which is along with the
> directory name giving the id of the thermal zone.

I'm not sure what you mean here.

Surely, the 'type' is provided by whoever registers the thermal zone,
so I'm not sure in what way it "belongs" to the framework.

> Actually, the useful information is the id of the thermal zone, not the
> type. This one can be duplicate, for instance:
>
> cat /sys/class/thermal/thermal_zone*/type
> acpitz
> acpitz

That's correct, but in the particular case of DT-based systems it
comes from the DT (AFAICT) and so it allows to connect the kernel
message with the DT contents.  The id could be used for that, but that
involves an extra sysfs lookup.

> Given there are few places where 'type' is used in the drivers, I prefer
> to directly change that to 'id' in the next patch instead of creating
> the accessor for 'type', then send another series removing it.

So you are going to change the behavior of those few places with the
only reason being aesthetics AFAICS.  Is this really a good enough
reason to do that?

