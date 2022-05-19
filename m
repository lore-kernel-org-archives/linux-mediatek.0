Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5528DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 18:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQ2b1CjIH7wrPByqk2+XpR0rgclpbgFoQIx7Z3OIggA=; b=E7twO3Ayu+T+l6
	YBbkvvuPjfL9Y8qs9TkVvfrKjX89IMlXK3n/lz25uFIgHtwR3t0AQygZz5fTKJkcgLYuQdqB2dxvU
	GHj/A4ymGd/6wSf9u2x0X9SpVZWT071m1OvTUtnERSI6UwKvRo5B7goO4xPV5EtxMRErVt3+aPda+
	lf7GReQgWVBp24SZUlSFrjZvF8rvYjSBVZNZYvz7cxly0Xdypg/JBdJaDl2ALQ/eLDj1uZ6cj9FSK
	i/UQej8geUi5X54FYZaFkWPFlIrg4HduicCh7JMHLZPKDO1Zq015wzQRBOTYWflZBsAGYgpqZw3Ao
	ezHVVpQ4MrmcSsbNfAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrkpu-008rpY-Bm; Thu, 19 May 2022 18:25:22 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrkpi-008rmh-DC
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 18:25:13 +0000
Received: by mail-pl1-f170.google.com with SMTP id s14so5495662plk.8
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 11:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=yYJ5d8JV3t4O7WcoAyfX+3lgnKWLdKUEPNKkivp4FxE=;
 b=PMgZUnpuw3z5MWH5fZNx8CGlyDz83/fI5ZF7cd5qoov+Ek8xUiPHgdw7i04TE+ZF3u
 JepGnYsD9Oo3YrZZNWlTBWg9qwXYlM9NBH2kh3xzDHiXJEGiOf0nvT8khjufsi3NcdEO
 JQ9uRoweNz2gV3MXxXdUixydvTpeU8i9QwIQx83MqWnCkLrclCH5Nwk5Tqm6ulf+vE3b
 tyBtK0SgkFNOlHqcRCKnoHUwaSK3KhN6pUTmQZcjx3QQlZo/kI04siOazj+1AJPGQR+M
 O/sD+Cn792fvMA7QU61cZiukSu8SdLcIUk0ZY2B69iD3bUk23DHjUcITOeNCbjeGidTE
 3sJA==
X-Gm-Message-State: AOAM53265xEdf7nfOvqAA4TJRqbIA4AnDg8fX7An2NATRca9apqO9LxW
 kL6DMrLIzCTkVRbBZ0IX4n1wyA==
X-Google-Smtp-Source: ABdhPJxJuiO93xsMywzWjqiZThDp7pcpVoqDBgq85ICeMcDEB034hBaCoXLEhaErUk+3R3vaFW18kQ==
X-Received: by 2002:a17:902:e415:b0:161:d804:dc6c with SMTP id
 m21-20020a170902e41500b00161d804dc6cmr5341884ple.50.1652984708201; 
 Thu, 19 May 2022 11:25:08 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 76-20020a63044f000000b003db141a5f26sm3868353pge.1.2022.05.19.11.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 11:25:07 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>, cw00.choi@samsung.com
Cc: Roger Lu <roger.lu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Fan Chen <fan.chen@mediatek.com>, Charles Yang
 <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, Mark
 Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Guenter Roeck
 <linux@roeck-us.net>, Jia-wei Chang <jia-wei.chang@mediatek.com>,
 =?utf-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v25 0/7] soc: mediatek: SVS: introduce MTK SVS
In-Reply-To: <CAGXv+5GT=3m=pVPwUOWR42BR=emCpBXvvoAiRV7YKt2kEKWdAQ@mail.gmail.com>
References: <20220516004311.18358-1-roger.lu@mediatek.com>
 <CAGXv+5GSdWPZe3fNpBJ_WW0zCL8Skg6fHx9ATxaKU1hyMEt2Ww@mail.gmail.com>
 <7h4k1ndaui.fsf@baylibre.com> <7hy1yzbtb7.fsf@baylibre.com>
 <CAGXv+5GT=3m=pVPwUOWR42BR=emCpBXvvoAiRV7YKt2kEKWdAQ@mail.gmail.com>
Date: Thu, 19 May 2022 11:25:07 -0700
Message-ID: <7hmtfdbcsc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_112510_471859_1C08A479 
X-CRM114-Status: GOOD (  25.19  )
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

Chen-Yu Tsai <wenst@chromium.org> writes:

> n Wed, May 18, 2022 at 8:03 AM Kevin Hilman <khilman@kernel.org> wrote:
>>
>> Kevin Hilman <khilman@kernel.org> writes:
>>
>> > Chen-Yu Tsai <wenst@chromium.org> writes:
>> >
>> >> On Mon, May 16, 2022 at 8:43 AM Roger Lu <roger.lu@mediatek.com> wrote:
>> >>>
>> >>> The Smart Voltage Scaling(SVS) engine is a piece of hardware
>> >>> which calculates suitable SVS bank voltages to OPP voltage table.
>> >>> Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
>> >>> when receiving OPP_EVENT_ADJUST_VOLTAGE.
>> >>>
>> >>> 1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
>> >>> 2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by get_cpu_device().
>> >>> After retrieving subsys device, SVS driver calls device_link_add() to make sure probe/suspend callback priority.
>> >>>
>> >>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=25cb20a212a1f989385dfe23230817e69c62bee5
>> >>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/commit/?h=opp/linux-next&id=b325ce39785b1408040d90365a6ab1aa36e94f87
>> >>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.16-next/dts64&id=a8168cebf1bca1b5269e8a7eb2626fb76814d6e2
>> >>>
>> >>> Change since v24:
>> >>> - Rebase to Linux 5.18-rc6
>> >>> - Show specific fail log in svs_platform_probe() to help catch which step fails quickly
>> >>> - Remove struct svs_bank member "pd_dev" because all subsys device's power domain has been merged into one node like above [3]
>> >>>
>> >>> Test in below environment:
>> >>> SW: Integration Tree [4] + Thermal patch [5] + SVS v25 (this patchset)
>> >>> HW: mt8183-Krane
>> >>>
>> >>> [4] https://github.com/wens/linux/commits/mt8183-cpufreq-cci-svs-test
>> >>
>> >> I've updated my branch to include all the latest versions of the relevant
>> >> patch series:
>> >>
>> >> - anx7625 DPI bus type series v2 (so the display works)
>> >> - MT8183 thermal series v9 (this seems to have been overlooked by the
>> >> maintainer)
>> >> - MTK SVS driver series v25
>> >> - devfreq: cpu based scaling support to passive governor series v5
>> >> - MTK CCI devfreq series v4
>> >> - MT8183 cpufreq series v7
>> >> - Additional WIP patches for panfrost MTK devfreq
>> >
>> > Thanks for preparing an integration branch Chen-Yu.
>> >
>> > I'm testing this on mt8183-pumpkin with one patch to add the CCI
>> > regulator[1], and the defconfig you posted in a previous rev of this
>> > series, but the CCI driver still causes a fault on boot[2] on my
>> > platform.
>> >
>> > I mentioned in earlier reviews that I think there's potentially a race
>> > between CCI and SVS loading since they are co-dependent.  My hunch is
>> > that this is still not being handled properly.
>>
>> Ah, actually it's crashing when I try to boot the platform with
>> `maxcpus=4` on the cmdline (which I have to do because mt8183-pumpkin is
>> unstable upstream with the 2nd cluster enabled.)
>>
>> The CCI driver should be a bit more robust about detecting
>> available/online CPUs
>
> This all seems to be handled in the devfreq passive governor.

Well, that's the initial crash.  But the SVS driver will also go through
its svs_mt8183_banks[] array (including both big & little clusters) and
try to init SVS, so presumably that will have some problems also if only
one cluster is enabled.

> And presumably we'd like to have CCI devfreq running even if just one
> core was booted.

Yes, I assume so also.

> Added Chanwoo for more ideas.

OK, thanks.

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
