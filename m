Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F713CC6B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 07:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=; b=u3m6fqasgTb2cU9Oh9LLHCCxkO
	uQ1NMQGsdkpZ+iBb72qrTDKEiPZ4tJAfHddAHBvMIn8nNH2eE1HV4a+ja7peNCNQelsN/acFNbTqK
	hKYHibw6Qbrh4wHnBinhGFIqpsFKNmmrwm40DhBIr0ELRz2IVxq+KNcy4MJi8Z0bo/R5Qm7p2KBx0
	42UjGR4+TYcKH7aN+aischuPrgGCFLO1sJjodPV9OX0ov45tyQbzaJ2It6j4tLPEIJzW9sXZccvwp
	Rg6ChONdTYxYWyiMZjD4Rwc9VTvqw8v4sQ3SpFzxCedn2eczsZpOcFwdpW0bbHAyxSUNaOwhIwnlJ
	zBFaakeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWis-0000000CCCv-0pFc;
	Tue, 13 Oct 2026 07:14:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWiq-0000000CCCQ-167b
	for linux-mediatek@bombadil.infradead.org;
	Tue, 13 Oct 2026 07:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=; b=QK2H9KmgH5f9rUEKnQnjpQ7IAA
	QSFKjwC4oxAd9L7DxZZtz+m8gOGyBXGo4eRiuNu4iyrdI4HmFgN6dkq6ISJ879+CwWhnTQfniWSIs
	q9OLUWPZu6H6xg24Ke+ISdMsV2FeIUSRY/FvhXp7HhXXDJXlG2n1p16lZPNi1rwws8RS47+CpYPvm
	+PfUyoZ30j0IPsvjRgvsS81Xpspgk9x3KTp76O3Upfb9tbWXkakWBVAALG20AyX3SMkfp/jWX2pqQ
	/GHPJTgEicMCHyiOymNRqPqeKWD9qqzgdy86Jb9Eugo8rCNtx4wdo2JXK4Vm46JdkT8nBhMbbgV4W
	45v2mYVA==;
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGWim-0000000FBuf-2AVJ
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 07:14:50 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7fccba9c675so5629623a34.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 00:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791875685; cv=none;
        d=google.com; s=arc-20260327;
        b=ZGHVGsvmrBZgzrJAKuUdz4Iag8uW4Ixt9JnzI21v6kkKcFZ0d/krM2PGfnEjD/wCPk
         Q3h1qdA8ilvcuq6gv4IJgXhx7zYB5HkJYJHk9WIHGgzAK6vOTLgmBxmeJl2EKYfUk1+0
         Kp8w0DAF2PCjcbzLVLSQbrnQbmhsJLpY9HVNl7TB4xU6dQXWuAoo4rQ1+S/cSywdYWza
         AOigaRHIfRlBTG802w5AXBPTB0ozRrQmHC4IpADxrE+pTx7wMNJfo9zZahmXzILC92Ov
         m31lM2bmVuYE51crkUAW++k4m5Qf3A8xjvrZQOg64NRTXuOKGdUC/Bqj2qmtgIlfndb3
         1K7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        fh=SDgqjGgEHpofZ2y8/hTUTQHb/3SljkDmiTAdyIv04Tk=;
        b=WQkjQ/nSYrnLVDgXpY+PvPTJa8GTlWf+3MFoDzj6Exjr+af7ZsL1N8a+J9S/nlUgrz
         Gl3fYD/GOtVN90HmmMwo5xrNjaJdOgXDSYd4LzcTUlpBd6jQ8fTzN9Ica8ozR7baBfxH
         DLoWDVQegLJt6i+2celcXR8ccxeKxNlyb0fGpYWQBoVKwP06dmiu/Hr6nPQEm3xMwrKL
         YNZRnn9Bh/Xqk7JrnbSpVmCvMkdtG0OhVaxtKQapi+bB9nmhO1lrJ2J6LC9T1RvVaPHl
         844jcDzGgXLh6n63h+tfjt43dsxP8iyGx2LmJNtrlAeHji7YNAoSP3S/FNTDwpZzKMmu
         ikmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791875685; x=1792480485; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=q/KKPECPHelyuj8HvWLkNxdNsLl1lkqcjDuOMowwETsGK9sbhCbtBIlRorSYiAfnEG
         ifkfttcM5v6Jp9vp8LVMx4JgiyhornR8R/2YivNukVrzb9T5CpT49qwRGAsET6xlhtYh
         WgnPpIvlZRsZ1LbFq/7Lsva1vwePgQAIsZg2qyKvIAgtpDm7nEt018bTgN2kcz5SGQKs
         bXqGH5GVdnP85Me0pFp+MBpS+xgTgBv9dlQamExYSiXTwMd//XYlKHVDwyDNlDq64Oqq
         34FV597T7PkhqlpzjikxHnPOwigZhNyAfx2K3z7PkimEXcOo5VuT4SrSFRmcNj6M7mK7
         c+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875685; x=1792480485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=bz/VFdeBk/j0gx+zkjWHEOoDvNV/4u911Va4FBTg8p7hVZazIPaZuttW40dtHyuBU6
         vWd8ATst+AZxTmlytxTAvKR1r1hPJaUlGZDBHk+iev/SpnEKoXLokzjD/iGqMkR187Mb
         A1NcfEiUeQRG2t/CouAZDSP9ENvkkEKCgpZH/xdysAwgK0yLx+J87UoBljUNGcm6O6k5
         ne6Z0Zlv9TXMMlaHouim+IJPnJ+fPZQvyb1pn6PmHdMyPqnA2CKf+xeomc4xFy4N2Hmk
         uE10732l/M8UauUYdwuFGkLHqs7b6q4U5vnAhrdaTypvLOTKPfwY5GMwCwtw95cLGK/B
         7jpw==
X-Forwarded-Encrypted: i=1; AKwUvBxL486L2MA3MlqH/G0L/Hme5t0n8dXU1Z+E6Jv3FnRBE22K6OJh503iHYtBAIRAYwNcMVmCtoLvAuv4erN3dA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKbrKFO2So4KaMKppVc3r1j35w40aAnyXveVOHYckO35HRXw7Wc
	ruOEuCD5midIr2S7YnsTlykRHA7jPrE3ai9LAGMhzvOhof+zu2GGFvaWgII/KEPNaut5Gsdefv+
	FId/c4/7eYin0BomCYokgO6oUS7vf55U=
X-Gm-Gg: AYBFou1pRDpPH0FM2FpUIduHF6uokuBd4bkffqw3BBzazn9A+ppW8tJWE0oRd5J8QGa
	gPpqHS5p05YbEg6ksZI6qxiD0qBF61TqELldBQJWBjMIwRoi1TFTUdA/sIR6/S2oVrC32MUsDnm
	c1dai/NGrp+sz9SPBysjvlnIf/UxC/o9rxgtYWckAw89jQHDSUFtSngYBlS7vPkds4R66ttcU4k
	xK1lCPZ6zmTvN07crdA11QkP5AlpRyrf8K63GezpahB3/WN6RKAKL5CRJbCoMbnF5GxRerB+kK7
	4W91d1e48wRIN2Z5If7Gpf7ndJKe+qER6GlhGxqLgMpot43N6iO+YmVzP3Sg+541oF+bD2fz/FN
	I/vTBdwdrSBXvJRfQjBfHIiA6o3UEz+boQ6PrjMISYKEyax5q5HnFiMATXEthlKRzYeC4DbYirA
	Xhk2Bp9uEzX7+/XS1O46yc86fD8CZMQdPXWymEDTdcdjZ7W38cn6g=
X-Received: by 2002:a05:6808:30aa:b0:495:ce6d:7d48 with SMTP id
 5614622812f47-50c4e67cdf5mr8677005b6e.9.1791875685589; Tue, 13 Oct 2026
 00:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com> <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
 <l_pd6lBHQaWNYoohhfxhFw@gmail.com> <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
In-Reply-To: <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 13 Oct 2026 17:14:34 +1000
X-Gm-Features: AclHuK8TJXmdm-cxsbCKrijwUibcd22A39HSUGZRpbNW3PHDJmMdVBEajRXhBY0
Message-ID: <CAHgNfTyTQW2vMieSo+U7CTTuckrLZL+PuEKXfKCHYMFDBCFWng@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081449_262148_D6F798D2 
X-CRM114-Status: GOOD (  15.17  )
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

On Mon, Oct 12, 2026 at 8:03=E2=80=AFPM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> How does one know the speaker died? Is there some kind of signal, event
> or an interrupt we could depend on? As delayed-work is a mechanism of
> choice here for handling the case, I believe there is still a gap and a
> chance for bad things to happen.

speakersafetyd is a userspace daemon, not hardware. It cannot generate
interrupts. The daemon puts a magic value into a kctl every run of its
safety model to signal to the driver that it is alive. The driver checks
every time this kctl is put (see macaudio_slk_put) and schedules delayed
work for the timeout, resetting the timeout if the correct value is put. If
the kctl is not put within the timeout (e.g. if the daemon crashes),
it locks the speaker amp volumes to a safe level that will not cause
damage.

We do not want these checks running when the PCM is idle however,
so when there are no longer any active DAI BEs, we disable the timeout.

> Czarek

James

