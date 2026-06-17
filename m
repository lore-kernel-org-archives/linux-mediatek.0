Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A303CD98E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=; b=xAl+Kyby3Djj1gjXGrdxHS9ZI9
	uOXvYEtOgQJZD1PrXIQSzI01TmKP3OFQAKmw4XbUEIEWYY/jSYQHnxrQj8jGTkI8TJiP6396BmdqL
	x9zZ3V/gXHQvXYlQZW9errhJsDXsFmvXffxQs4tpDW0mOjczhYcdTp5CewC5OWWokqx3O+2bdK16c
	hC2GN9Pje8UormLl1dV+w0jBzGB3mQOI1AbS31QFl8OsBspa/XLEu0V8Vp8FVPw2c2dU+8RzethDj
	HyT+C6ecEMJ3n/PIyyjLTM/12QbsL1u32oJzZ58H97Oh7bdYSr0f7OLmKvndhrXvGO4NE8nPtL40T
	UmHabx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpuM-0000000HO8q-0q2j;
	Wed, 17 Jun 2026 13:02:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpuJ-0000000HO85-3qQA
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 13:02:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so48844015e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781701333; x=1782306133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=;
        b=tLfaeuvtvXSzPeczxi5ZR5zQfdBgjo9YWJqXgYtF2CZ3aFo2+8/c2K9q09HRdAI2ky
         SbAUYaNnSROWBzc8YzcVr6ySgjU539d6Lq7acif9UUE/E132mvCgGtzb2vwP9pbN69/W
         XHgyfQAM4R2dzW11mIx2rOHcHic/aLj6tC1CWUKhC5Yl56/rbUEr7UVYjjD4QC2JjZm0
         q7uHRmXyvK42CYDPEhFPL5GZjxad3IcQCowuJjuyn6KTPc5MFjKG9mgVvLItMW7BNr5P
         6khcsEyEECXcPfA47CVF3GTqs1JukFILHO594k4OaeL3GeAlmAkNwSXXQnVMAbyPNWsK
         1H3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701333; x=1782306133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KoyHU0/MnlEjPkHmAG8qUfE8grsoj3Z59or+Bu6rF3E=;
        b=OOc7h9rhY51RyV5YH/mATJBwIDkKETO2e84TtzlTcsWm3GLyOQgQFpOy8QhkIDK8gT
         8JinLYddZY6kuFUm6/cm9PVOwz56IVyY8g+8gkrtA52eMW+8OrHKmSYUzHiLGE9LzaC9
         WBjPgpZ+GQt+NJCsk6ywHXWtxbsbVDwaz3oGgoEnZ1Jvcq6BUaHTP1e/6o4BSz0CWPQo
         YsWWrar8bm0ra0/sA4gxPUjFHV39m+jZLlpFj5ho5dolr9DHwdOY9m85YvvIm/x6wx9Z
         /UsOB2wmvHr2+/59FXPnREsRTTM4TfBHeISNoutp49zDtBLk53mYLkfJKR6pDzsRBvaY
         J+lA==
X-Forwarded-Encrypted: i=1; AFNElJ+9f33kR2E9DuUClxklCQmnUCZbXhTAo49G40ULk1t1UvXXqKyZGcf0PNJ+WXZ4S2ETJ/xNpCkjaiBHW1SgpA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRaV2RZSKBCl0wjArFytW67TLpBXt1wVy4z5HfQB/4GiwM/4CN
	7jrjhLlEqrRiz1GtV7b2tIyVPQ0WjujGIDnMGFsKyd7BBTvglY6bHw4c
X-Gm-Gg: Acq92OF7Kjeh6SugrT0aM/sNcfLq5cvOeBfmmoiXWm17Uo7koX0fSUrSgamZA/5AFYL
	BFT/TwPpBP2VsMeQ3Qsp703ZK4wFpUMGH9ARnRksYBMqyFwSS2eJpmyS8IbIUD0BsuHz471d3N0
	sQbqtwwg8ND8+FNn1hTc9LDjwrJ0rVwZXJJHP3HsJPibsTM0UYzbkzB+km0XVl8pxz+BSiD18O8
	DKq3VG/X2el0R9sJgXINgKT6TaiKSZzIXxCy78VYmUrFWHlXDcALO9eR/o3MAWANZP5FXSC2tO+
	VQKc5T9Br91HDfH7mrIoU51NP9OT8OWoOaukQGDDwArsmLtkGEElsvEinpiHrIjBR5v11Wefcod
	JJQb1Symvk4aVDNTXteM7IRtIfUQhi9d8kc+AZJSYWWt4PjB/xay/Zq9wF78PY2YcewcjoWESDZ
	5WLWeb23gVG4pygmdEBQt6z2jpLPmvf9n4/LtUz8VrWRUVCiNx8Q==
X-Received: by 2002:a05:600c:8189:b0:492:32a0:7f92 with SMTP id 5b1f17b1804b1-492333aabe8mr70111375e9.12.1781701332662;
        Wed, 17 Jun 2026 06:02:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4ff67sm157906775e9.6.2026.06.17.06.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 06:02:11 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:02:09 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih
 <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, Benson Leung
 <bleung@chromium.org>, David Rhodes <david.rhodes@cirrus.com>, Richard
 Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, Support
 Opensource <support.opensource@diasemi.com>, Nick Li
 <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, Srinivas
 Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex
 locks
Message-ID: <20260617140209.3f89706c@pumpkin>
In-Reply-To: <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_060215_983710_976E7C14 
X-CRM114-Status: GOOD (  18.19  )
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

On Wed, 17 Jun 2026 11:57:49 +0100
Charles Keepax <ckeepax@opensource.cirrus.com> wrote:

> On Wed, Jun 17, 2026 at 05:31:32PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> > 
> > Clean up the code using guard() for mutex locks.
> > Merely code refactoring, and no behavior change.
> > 
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> > @@ -913,17 +908,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
> >  	if (override >= e->items)
> >  		return -EINVAL;
> >  
> > -	mutex_lock(&priv->jack_lock);
> > +	guard(mutex)(&priv->jack_lock);  
> 
> I believe you have to use scoped_guard here, as there is a return
> from the function above, if memory serves it attempts to release
> the mutex on that path despite it being above the guard.

Indeed.
I believe clang will complain.
That makes these mechanical conversions of existing code dangerous churn.

While using guard() (etc) can make it easier to ensure the lock is released
when functions have multiple error exits, I'm not convinced it makes the
code any easier to read (other people may disagree).

	David

> 
> Be worth having a quick scan through the rest of the series for
> this as well.
> 
> Thanks,
> Charles
> 


