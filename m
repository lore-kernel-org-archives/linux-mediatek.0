Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DDAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 17:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=adnkNtkPGB7EjtoCn+bkM+dDjA/uhWe6llKovI5Yffs=; b=jyFJMPMt7+X29X
	Z51Qe5txJk1n08pn2jbsXF66ChkILT3/1i6a6Nk8pvzkUnIQhT1V/eDKSM9sd7v0Jo0FzZs2rj9X9
	O5eu/sMrrAhc3jnqE7vMb6yGqNtBlBCivhWNEZxui98W+GsUuD2ngGWqYGN4obej0YhC+F7e7j8W5
	F61M0H2WN9t6FkLY/tmF55Yc3UmjPFKIFlb7XHhs27Ioy5+bGKa++BRNRgFCegiG4lgkGf+loctR0
	Wtliw9jaOkswVzPvntHpDhcHcGMXRx7N7nkzICMlM5NLNh3bej+akC43vlCdzAdoWqxE+sS4HkSuT
	4o4g54NiIdG+4Rz2y5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms787-006MRh-1e; Tue, 30 Nov 2021 17:41:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms785-006MQc-7P
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 17:41:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 133so18218517wme.0
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sgi8hVAxJ2TC6lAQZcV7YIf3cslbDjz/FU37PQWsli0=;
 b=qWcEKjhS9fZxpthQ0sYoRA1mHDvYqBvtUfeqHNrQ0BDIg+02mH3WwN77xCgRzB6MaD
 5o8FaxMnn5F/sb1kB6F27fIvo46TINJc2gOF5b24aWGcHLnsGw/giiveZYRv/HAgGhYz
 onXo6RokHNdVlOmefDIehZFEaoll2Qzl5BhdnnPhvXqHWjaPB5ApiusiCxRvx1050UVh
 TSuSRVxM9G5SHMwr99VECJtZ1h8dMO5i2qOZbNgI69Zvo6AFPLjZd3GjE4ENeJ5kSOZK
 9s+q5LMrCpmEnXbYzHy2UdE+loIRJCza0Kkp5xFK6fT9bBIgat6CWGHmPJ6eFzqYmWuP
 PMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgi8hVAxJ2TC6lAQZcV7YIf3cslbDjz/FU37PQWsli0=;
 b=re5vXReMvd4DsrUKfNXxSF0pLjl6hqxeEKbS+aAelexon8AxUjqmtpOcAcaamuan+l
 u3dXDvynoL22YcuXLQfFDr/Ed3EdzFjKx4+xFtOqK+9L8C3UInNNfInKunED4S5z3USv
 oQ2E7x1vO/Cuz+Bn+l7aug9yc14nhrVLfqWA3lrXmJKM72rQvozLSQWBjJgULwWzHgJ5
 JB8sm0GdWUOSFQrrAP5va4GEI1Za13tNqs8gxXnLDQqi7F00UArZRR2dwR2Tgkey0i3z
 BTqLxVL0/emeyCb5fML7PsrZYoGrU39X0mw/+h8DuwNiZ8x0WC8z7l7YxMR+8vCuL8XM
 /7Jg==
X-Gm-Message-State: AOAM530RZuCm7QzEelLKf3sKm/lqf2PmkxL9E+c/A3aIDzguBdQDcB8N
 0SM7a2sFVEfA4QpFtV47dmyWm/j9CaTZ63zbCJU=
X-Google-Smtp-Source: ABdhPJwhnV01V8gG6iYtFPGsQ5YkF+4GQRLPbqDPYOVqcxI9xtzW4TnJhFihxZBeGpP0rt5m8BM4SaONGY5cZSsG3WM=
X-Received: by 2002:a1c:4c19:: with SMTP id z25mr54768wmf.177.1638294077177;
 Tue, 30 Nov 2021 09:41:17 -0800 (PST)
MIME-Version: 1.0
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-8-daniel.baluta@oss.nxp.com>
 <CAMuHMdVV6Os8Gzc9JVjD2CAtN38=7KFn9GqosnWvByQc-7uA=Q@mail.gmail.com>
 <bdbea252-09e4-eb60-acf8-4ea8a1d924c4@linux.intel.com>
 <YaZZzSPQDz0vHRQY@sirena.org.uk>
In-Reply-To: <YaZZzSPQDz0vHRQY@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 30 Nov 2021 19:41:05 +0200
Message-ID: <CAEnQRZA7Nr+MMP7v+4T8G2y4L4HvSPVdoy4zekBFgynXJ16tCg@mail.gmail.com>
Subject: Re: [PATCH 07/21] ASoC: amd: Add module to determine ACP configuration
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, AjitKumar.Pandey@amd.com, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Julian.Schroeder@amd.com, 
 linux-mediatek@lists.infradead.org, Balakishore.pati@amd.com, 
 =?UTF-8?B?WUMgSHVuZyAo5rSq5aCv5L+KKQ==?= <yc.hung@mediatek.com>, 
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, 
 Daniel Baluta <daniel.baluta@nxp.com>, Bard Liao <bard.liao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_094121_317217_373155F9 
X-CRM114-Status: GOOD (  13.85  )
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

On Tue, Nov 30, 2021 at 7:05 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Nov 30, 2021 at 10:49:30AM -0600, Pierre-Louis Bossart wrote:
>
> > To Geert's point, there may be an additional need to add a
>
> > depends on SND_SOC_AMD_ACP
>
> > There are also a set of
>
> > SND_SOC_AMD_ACPyx options, not sure if any applies as a dependency here?
>
> Or put them in an if block (IIRC I thought they were which was why the
> dependency wasn't needed but I don't know what I was looking at if I did
> check that).

There will be some delays in handling this as I'm in vacation until next Monday.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
