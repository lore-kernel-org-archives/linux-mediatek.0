Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3E3C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=; b=j8vfu0CuPHWKgECGCxZsKkgGEz
	gvrGtk9JIv05XVR4oEN3Z3wEC/HYwBOlgoEwvxFvOsCLWCqF9P4/eTGTnZAFwF6lyGjMS38hgUGEs
	ykg556m+5J7+CrcMPbUY0uSyDuiHu180H2MfrWVSpoFX/GIQXLIavW7hOSLi0vaUQ4dPQTzTPq/Mg
	B9rFbKKpZeuoiNSgxK1MwQttdeYleReARjXMFPizearAAYMVyMp2lKDky1wBPHBi78h8YVQKbRVM0
	BKOXlYAa6AOuUqjNBGJmC/N5ixmLPVpTNWBzIP8FK9anv6Gjo3PcQBkiR3bxLEKJ70SsLOCazuzXy
	/vpDDE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ORu-00000005bqe-1hyv;
	Tue, 15 Sep 2026 08:23:30 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ORr-00000005bpn-1sgq
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 08:23:29 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469d249c4so2963249b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 01:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789460606; cv=none;
        d=google.com; s=arc-20260327;
        b=ZFw+NJ279MVkleb1NqQ+CJH4fBeR7jEhMA63Jh/V5fcE8sH5UFsd9NnrjulvJ9NbIA
         R0xvDs67qrgINzTH2s4/rABDBNsIQMMd8tlHp+jFIqIEW6LrxswXgnyW0YIVf3hGdTUX
         da8uoPILnJcJd8kTHgWcYGjOHYEaYqWGw5SKIIs/0LyeejJCX5+MmgMIHrFIB7zelXki
         fx1MMkpQsZyMyrM8EPS/XR4JMljFhtXr6Bkl3IWcjI/ObFppUsAe6EJJm2wSFl3PUpP9
         yOGDGFuDrY837sGImRvz3BneKtcx6PYHLQKphLVMjOo850edBVRMvW0iSJhem6ZTzeij
         W2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        fh=5AaH4m9U3BWn4MtUA9Ylo0999wCdWOD7DRJlQE3r3p8=;
        b=DxmaHz/vivdJMqKjhYPo4+XQGAu0qcaTrAKtX3f38HLkluPJw65ExUXqP+TR0INymy
         qW3c1xHs8LcuG6+EwgNwFONpSnGsLU/J2F8iB63XDSiHMGnnLbuoHXdSx9KcyBhaU7D1
         Nh6/dFkxrK+HR3Y9nxCBFie4UbHzsVd0vzbzsPdUJxtRINVrUX1y7BgIa9ZYW+cmmV1Z
         ihMhfOTuydO3M6CTBBSIxn9ha6TKMP+HuUjy0CqFRu7386gJ4kQoOsJZm3O4vlobqvd0
         9JRzms/VGlWgkqHljC7M7K1HpM/z/smUJImQeFhx3oM1j4p/VyeXVJ1YTuhGL6xaS36t
         W+lA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460606; x=1790065406; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        b=n3cgDVnQlAbW79lis1lUoR4pfj9FLc/9w+4MuQcLgAHa9DCJeQkjYPX6S+bUtPmXDX
         CK2sXQ7oXLjenxNA2rJicTFhxQ0GUQog+Oauk3H14sCVdpLgKt2hjfq8ys//4+CJaugF
         +ITV/FTzpUppynIFgZXBqx1lM2WPST2EXioJIn2WsAjkL9JJwTUtJBedQEbiI17SaU4k
         gmZQo0OytVSFnUFTbnlMxBG9FIklk/w+18RHw3H/DLVfHRNm7BLfBnyoSWkMA5UDVs9S
         mJyv6X3/+n35m8ufhC03+5zHYfjgGalD08xn2DOY42+t/dUwz18HWQMojMqkcMo2i6XQ
         tjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460606; x=1790065406;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h/xcej/j7S2rGPSD8Gyx86eUYHBjb6muKeX/bEp2HCY=;
        b=2casZ/E1Pba/JwTXf/PpqLNhRBlRJzMVoNufJR+D5OyMLp9REoeOzhUlbJyP6YytUU
         p1XlIibysiDjrC/kj5HQo9X/TckRZnjUU5TiypexLdkqU2iLphvP2MqnY1DxO0GINO/U
         WAykHYpPJskcuGAOOdNkln9O5oe5f8dVOFCPIzrvV7zMTui3fudU1mFmC5nw5hilXvB/
         g9CRKvuk905MCXtyIDpKVEtZwJoXZ45mdCf+tdnbtqn0oRZAntt4w9CqqkVJL/ETto+K
         XE6sG8zcRr5sV+DenoadsWCpSqgdytEDZBXfgwciG0Jej8fmy27tUHEx3XyV1m+FQU9H
         rpuA==
X-Forwarded-Encrypted: i=1; AKwUvBxxrKIq49Px+0TbbPA5ZivUUNXmIwhb6aTSyLJU6U+V5slfCgWm3xxDwA//a/eJGepWUFCf1b8IeJpmT1xEpw==@lists.infradead.org
X-Gm-Message-State: AFuF++k/r3g4W0/zU0AQb4nFkmP4UYVT72fq3pqWJi/McXLCMFkWmORm
	teMnbMeEXj9YbjYMeuj49sKarhzvXgm39WpYE12D47rP9+hBtN+djUtnhfgfAl/3wwqGfHSXZ09
	EmZp2Cy1JUcgGdZ3wyE6x5rf8WwOBiE4=
X-Gm-Gg: AYBFou3YBg97XYKVdf6i8foI5iTD1sACulgzXULybmqZrpBBXUF+dlxHO3mge1oXcsl
	3SpwtyU1GhaSTN0IzGB9uGZLYA3v+Owk9fSoLg9eerEeHF2Wl0/Vec+X+S1JuCkytACi+f9JlHi
	1Y2eiFlZ6JBjgE8jAaMVINkT2e8QX9WhbMKV6rZLz6RN3YOcl2AJ41KASoeyIskkgai46ggwKIZ
	bOi4zrsR25tRt5AW3cHIJu4PeInqPIglsA4XW+5lfXItXHsRpeXpCFGe5SoLk7oFRfENK+JGSJj
	BM+UiCy+5ggebPRZlIrqDeMetP6A6hrxzrpshud7zkW1Ohb2RHjKFfmWBG7kjK+YMISM1ek/fn7
	vEj8zRKy19JpqgMo41555Pu3zI1FPgZiVuugx/PYM1TYRvmyHYn+TfF2RHtJ1DaLCb7I=
X-Received: by 2002:a05:6a00:3995:b0:84f:a82e:d32f with SMTP id
 d2e1a72fcca58-86f82e5bc49mr11440122b3a.3.1789460606294; Tue, 15 Sep 2026
 01:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com> <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
In-Reply-To: <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 15:23:14 +0700
X-Gm-Features: AcwNN1VJxWS0kfmgYMTWj5HmLKEavOhSqOjDUWyYXdNn-q4rjwexIxFPMbacpHc
Message-ID: <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_012327_521370_95CC3BC0 
X-CRM114-Status: GOOD (  15.75  )
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

Hi Angelo,


> >
> > In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
> > correctly checked for error as in, if any, probe will fail.
> >
> > So... during suspend or resume or anywhere else in this driver really, the regmap
> > pointer can't be NULL.
> > The right thing to do here would be to just remove the useless check.
> >
> > Mind you, this comment applies to some other commits in this series as well.
> >

I found something interesting:

in mt8189_afe_pcm_dev_probe()

-------------------------------------
afe->runtime_resume = mt8189_afe_runtime_resume;
afe->runtime_suspend = mt8189_afe_runtime_suspend;

ret = devm_pm_runtime_enable(dev);
if (ret)
return ret;

/*
* Audio device is part of genpd. Registering it as a syscore device
* ensure the proper power-on sequence of the AFE device.
*/
dev_pm_syscore_device(dev, true);

/* enable clock for regcache get default value from hw */
ret = pm_runtime_resume_and_get(dev);
if (ret)
return dev_err_probe(dev, ret, "failed to resume device\n");

afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
   &mt8189_afe_regmap_config);
if (IS_ERR(afe->regmap)) {
ret = PTR_ERR(afe->regmap);
goto err_pm_put;
}
-----------------------------------------------

Here, it looks like mt8189_afe_runtime_resume() gets called
before devm_regmap_init_mmio().

So if we remove this part:
---------------------
if (!afe->regmap) {
        dev_warn(afe->dev, "skip regmap\n");
        return 0;
    }
-----------------------
from mt8189_afe_runtime_resume(), that could actually trigger the bug
we were just discussing.

Best regards,
Phuc

