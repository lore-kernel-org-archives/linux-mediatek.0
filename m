Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E656DFD2D9D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrK4Ebc+SYStWqsyJG63tplrB9U5+H197FZi0IEbcuQ=; b=1fadPLEPX5Cql44blF2t53ftVY
	Iqojof6mcDM6tgzTQ5pK9E43EioZn5AGag85SwWhXqgVFQHfsczROdw0RepGDqQrOvnowQ/TuUAyg
	EzNQLTTOhhMtseNthAFPS5PQonXsoAWamkGDa1lFtUeYFnYaVNMWPgKXO10c1ikDU85GqXM80CgB2
	LDUswyDGA197LGMQWMolC0r0/qJZxYBWY5tXrn34G72xTbVrzmuvGHD5nxWI2YTBylGGM018iaASy
	3rNAEgs2VOw+d7ueKkhUqnUqv6hK/dXsQ7gZRQMCIFeai4ofMcIIfVIB7uqJ5/PTTAi4+8nTJrW/v
	oPGtfZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FnQ-0000000BGhK-2iPy;
	Wed, 11 Mar 2026 09:24:04 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0FnO-0000000BGgj-01Zw
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 09:24:03 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-50917e02532so41096841cf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 02:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773221040; cv=none;
        d=google.com; s=arc-20240605;
        b=PX/e8xo/gzbmC/VLpTRSmhpL0w20imv1xaySGdrm/gwmO+DKmXdP5228tzex94DVlW
         TBJBa+6J0yYcxs4cowS/+YwfyYWk9HywZTcvimMuDMF4h9zUkH6oeGY7RGZI13J1MNWr
         MmVRjwz22vb4sJvssLL5s0wCYWe867cLNGJvVf3YhzamhZ23+mmoKIakTjg/RVnhsGmP
         ZpsXRTA1AGx327sE/V6SQPC9g3LNCrWJkZ66/wNBz/Fq/JLpiOxOQG0MXLEsm6+ImBn4
         e3J+CVLj2ciVO2fqwKNiQcVIQmp0JVm8C/fZ3FAsCyPIsZIKPj064F3ZTK9iZiK5aBLu
         3VCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wrK4Ebc+SYStWqsyJG63tplrB9U5+H197FZi0IEbcuQ=;
        fh=DTsXZuueD7rUtTmRlc4todoWVmBSt4OWPQwucv20vOM=;
        b=fSRcNlH7TSVy3fRNv6+ND5HHrwGbVEbzK47ZgEVJmR3PT8uvbMNPciSFq+PGhKToqH
         s/9KDe1D+/QfHfU9t0ruxrO76ByZJhgPF1zgJijzehxFO861A25NqQO97gBOnEMdY06l
         47TB/HlYOa9ifzdgg8DSiIWNlYaZBde7YMPKKXHQUdQxiQR6tOqkOvL8dfvUrSdcwM1G
         wFXRsKcscGx07U1hxLlMG6h1wEaQ6Cl181sJJ7lWtZajUXEf1jNYAZDaoIYR0vhkX35r
         vnd5RXEHyIlKWfd8uWQqSfQ6I/a5X7/1iVI4lpQDEiUbY75tTBpIEKj/GYewUb3MrHPF
         O6fQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773221040; x=1773825840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrK4Ebc+SYStWqsyJG63tplrB9U5+H197FZi0IEbcuQ=;
        b=NAWiMJn6c9Pymu+PQGuXXqKBnZkQ/HgPGNvdbxCqKdvsbXyA/4FWBRwRq5nubCcnfm
         fCtW/3rxugESEFvp7IBc7r+ZSAn4ZjgKJregj6N64GHtubD4dQi7FKR3zg+nVeG0zrHU
         KeGUV5/m1pcFIvgVor8/h7PjALJOcGlUtafrIE5rlmh4lTJvllDjv0aIQ585oOizqZg7
         rr+BU8vuMm2fqxGUDh+QJionnYZhGFL8socVUogFJkPe43X8tlwhdB7vslVekm18QQXM
         e3A7qcO6Mnv1p6XsmolAn3s5LE1wG6NGvifsP7o6mVKcGnmanU0ZnG3fW1unv4SID9ww
         MjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773221040; x=1773825840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wrK4Ebc+SYStWqsyJG63tplrB9U5+H197FZi0IEbcuQ=;
        b=sDeL5E0r5sMOqdnmhvx2EPBJ/DphFakyMId0uOzIwwJ6iBoAFccIdS5L5L6HOHVkFj
         N53424PfqrzTnhuj2RC5HXLgqvgDYtZ917gt1GNr8MUi8xhkvzBuvXq3AQjCpqyabfL9
         E/9AD7MG9lJyLDLswyvtT6jVhqV8+M4ibaO+78fxtdvNk2ZhCOQhdDId6+xZp7TUCeAm
         y63bWRAnCnMooPZr7AmzVkTIgvxcvs1wBF4g1e/pmLzST7ag76J9p9wVwWb/mWdCRCBF
         upWhD+SfMlp4W8Xr3W4pLHGnPKicEqsTOisAoghy2Bs4GTAnGlSqXJ10yhOJ3dev3GX+
         7g6w==
X-Forwarded-Encrypted: i=1; AJvYcCVngTZUAJZJiKKX/5xy/bobifMMQzpGMxZhSSCml8GAfG8YortYjQ1RPXFQdlayB0fjrDZvwZIo8/9fikMZ7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxs3IaMMOtXp4/epj8PQCyAizaSZdDK4+/Sa2uqXbMbqnVpq6VW
	/bzpzi3Uc+rbeFHXkbzvZEr3Stelrd6MSruvvzpc1bGtDi/pZW657nBCYHV8+kdzVHfepHKKTeV
	gWFuwcPCM4XDoNdttjYqdOSsLfqvIpxo=
X-Gm-Gg: ATEYQzwgt8npAamzSHbw0MpM8CexaDOSPmQnAhHn15x/Qbcrs17dKR0Ztk8kR29OiCs
	zAS1QBovFnlwGFb9qXHU9guMxEkvXD1SLReNKQLqfXL9AKqVc81y6vYbpwV1T6bczw7bliMnkqq
	ahOYWf1INBMi/TwN4eGSjH3R91khqoYF7eUbsucTuYVo4RUDLFQUnxfx7wdpdCIt4iAB/k/5W60
	zapDYGgOL5CZA3WTSomJkhxcAUXrDQnhVt25MWMMw7tvJYKblYQoRHYmAgM+XK5YnZy/tkc9DTa
	Q1lcbBNmz/ypkckLK2WRAA==
X-Received: by 2002:a05:622a:1193:b0:509:2a00:4283 with SMTP id
 d75a77b69052e-5093a1dbd17mr21113261cf.75.1773221040321; Wed, 11 Mar 2026
 02:24:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260310005230.4001904-2-ed.tsai@mediatek.com> <20260310005230.4001904-4-ed.tsai@mediatek.com>
In-Reply-To: <20260310005230.4001904-4-ed.tsai@mediatek.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Wed, 11 Mar 2026 20:23:48 +1100
X-Gm-Features: AaiRm51_8cV-ZC96Wbr95oK6RdVpyL1SwORArnS0Chyc1w1UnqmozKo680oVYNs
Message-ID: <CAGRGNgV1jcBGoUzksRMANzm2Ae130zoN2HovqHkKe0Wp-P6J5A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ufs: core: Add quirks for VCC ramp-up delay
To: ed.tsai@mediatek.com
Cc: bvanassche@acm.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	wsd_upstream@mediatek.com, peter.wang@mediatek.com, alice.chao@mediatek.com, 
	naomi.chu@mediatek.com, chun-hung.wu@mediatek.com, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_022402_049345_8D44E748 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

Hi Ed,

On Tue, Mar 10, 2026 at 11:55=E2=80=AFAM <ed.tsai@mediatek.com> wrote:
>
> From: Ed Tsai <ed.tsai@mediatek.com>
>
> On some platforms, the VCC regulator has a slow ramp-up time. Add a
> delay after enabling VCC to ensure voltage has fully stabilized before
> we enable the clocks.

I believe the regulator core has support for ramp delays and settling
time and all that sort of thing on regulators, so why isn't this just
some settings in the affected device's devicetree?

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

