Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FECDC88E53
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 07:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=; b=UA6yqMs9o2aegemq52liRLxi15
	V74DKXNDUOrbPSicE+A6mOAt0G+PxhUH9wjJE05ELTMdtd16BguY48CX0OR4tHH3DI2BbB58m3XYV
	4XbN7yZqZcdJIv47W20p/ssvD7BqmDF7mbMvB74gDQDByuDJU0ASLVGjOG6eBSil/fDRLAyef05Cn
	zqRKTyMSRAkZOjLDYlw+SbimbXT8QIxsXt6ipI/ohnNZJfYRZMzXuB4bFgpyDGl3kI51d81uXkk4M
	zNZBezlm1RtJLxzwA2+0LonanvOiRKoxFVZQM2Y8F3DX8i6L7hCRryffKg3ZbDlUHnFEj6MI7DJSt
	vBERYK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6O0x-00000005Y8m-2XKY;
	Tue, 15 Sep 2026 07:55:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6O0w-00000005Y7w-0TbK
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 07:55:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c294ad260fdso89989966b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 00:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789458935; cv=none;
        d=google.com; s=arc-20260327;
        b=UjssUpSoXADB8H/IP0aXbuqJXwMC1W+HxEl7G4ziLxObxTRS68dNqRjRUXCPjvAfyo
         Kv+CSvbnRSRf/RK/ieMs7IKRzqoxLwAxFtgiuh7i35xa0AT5OaONFKhN3CeotwCmwfTU
         VGP88Boio+EKsIct7rYji/vjZj3e4mDaJd8tvahDNdI4/pqbKxU8/LQnceulR8PzKEKr
         p/SjWt18GqQjmKcyd7Difho13Vcvt92yz4+nwmb76tduQ5mpBYgIJFHAL+rjCjIcA1ln
         pPH6tbvsBhViOgk25nj4eJxWhEql5ZqwaT5/pKv5jJV6pB++62eAJ304p7LqkS5leMYr
         V9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        fh=imQWVzz5g/WwnFHDhO1WJOOSnLD60wfHGf7fwvCkLLc=;
        b=hYfuWLi+vigsAeqpV1H8NEepeUGMMUSeu1cL0Oo1IquTZUVTMDzpu6WP8HpqNkWxXd
         W65ux+mETbDzdfRk4e2hdqg9n2rCxdjjDByhDruzntQHditpB05mWlUZnYuV2RiprQER
         mMXAbN1WUSR4jcQmNhLyTZTcRo88wDldJMVKjMi3j0TH3KAafhs6QAsIheGewj1/h4TF
         qNfu3p6rVWoMX7X511/U/R+Rvt1uxIE8Kt2Z9o4zeYsUeade4kvn6DN4izwoFvTt1/Gx
         fC5hAJy3yE1Hrtd512n+W5dET5SiUKoYOotun8snOq7NxnnvtFY/AujsLmpLepnGJUD6
         cF5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789458935; x=1790063735; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        b=TOjBTqatGzF1UL+2xEMJLW7JyydVwHbcb/WmXu2TAdLZY50Bzj7udQFzJzlsSkT3WB
         pod1MWznXfDX6oQRg1olypGatT7ljtyXP1jyrghZEq7Xbre40jeV3fFyaZ0TupR22kAl
         07TrTDLx0P37cb9uTauE6tQOZd+76A2GoYDu+ynXxL2X95fdCYx1vPlmGSg7+WrOLfFq
         /GfTPCr+Voix92XAmEwvlV/A1ICs09bk3agdxK5f6O53cmVYDsYZxDtF+KhLLnnF3dOw
         RjE1OxESGOrZK2TEpyQBhAHx6zFhcqw9AOYICzP1BBXcR65QG6+tpAGHODo9NVFb/MC/
         95aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458935; x=1790063735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        b=0gN3f41eUzfKVOMGNvJ4uq3n1JJFUNBQsst+hsXMR3kgBKcuYrTx3favGjQ6eHLp5j
         4eRU0T9mczkskHi2PGu/00fWcNHCyfxp3gLc4ZnoiJbR13BIXh/tcQOFK7y9dLKkqsj9
         emE+weCSxMsmsyB6j4jzovp/U0NJEQNwQ5Y4SiGoaHCoJX5pz9GpPquIWOs/Rs2baSjv
         baK3WucrHt79U96zg7Y9yV7oUJlCjrHX5dpAkDo61Ve78lY+fABwTe1l2kYanpsPzKJb
         4s5QOBcbjCUsNUN25cOeEbb99XcJLZkLyaYxe2EDAWSvT1OG3lYDMctUDxoVG/v4Ju9e
         +w9A==
X-Forwarded-Encrypted: i=1; AKwUvBwn2LCYEyCbs0jkkSnEXkOt8UP9VMh3d/Hqpem9XpjkeLwUcorplXYFuaOMjYTTrJK4gAtrX+yjs+hRAjLBFA==@lists.infradead.org
X-Gm-Message-State: AFuF++nEznDQkGU39LrBRqLvhSEwk8d35mGttrxaAlA1sO8DYDXIMBm8
	ukK8n7RSWMfxfx7Cyb6sWcqQA/g0V3FzloKeqX0qt+nyaQjQLFt8HhWdNhlzcICUQAV19JFLMQn
	JYiNDXQcQHLJenQvc2yFbsm4Is2IBm/w=
X-Gm-Gg: AYBFou0jPu6mfndK57e1O0x76+IUE08r/ngLF8jT4VXWNmLIIqqanNiB5BmBe/L1pxY
	l3cJkI/jbmpwojjQpx5Ph7K+moKQ1QsIRESo3SJnWYFl75qU5Eb8KN7trvrFhtFqtrgOcCpCS0s
	3uqzEc63HT6LySkCM1SVO8wjSXm+WGo8KaJgmBaQemDg4Xct5YKD1tH0/DCgU5GE8nR1QANz/+E
	xPK7yk0bdQW7qzENnO1U93GwqHT571XqCsU1gcfAcDxlM09ye5XtKKR+nkEIfn3zkR93ByDwVH4
	sQarc9fuX6Rr18194rXmUQKTRZ290eabntsWU562XCGoyDco97jz2TuZXFVLlNjc6e44pUppyBf
	89hHMfGRDTfILmULuazT0RL5DQ55wEUrp1d9547Wp3fJ5EQ/NcBvjwZoclaL5LnG3tsI=
X-Received: by 2002:a17:906:6a06:b0:c26:1f8f:ed53 with SMTP id
 a640c23a62f3a-c29c896c418mr191111266b.12.1789458935020; Tue, 15 Sep 2026
 00:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
In-Reply-To: <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 14:55:20 +0700
X-Gm-Features: AcwNN1XHHQHyucAHdm0EW7r7ZxJRYduxWbuLcSKyAsTdoDPrrcNWVh8BQ68F-UQ
Message-ID: <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260915_005538_171508_062582B8 
X-CRM114-Status: GOOD (  13.42  )
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

Thank you for your reviews.


> >       if (!afe->regmap) {
> >               dev_warn(afe->dev, "skip regmap\n");
>
> In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
> correctly checked for error as in, if any, probe will fail.
>
> So... during suspend or resume or anywhere else in this driver really, the regmap
> pointer can't be NULL.
> The right thing to do here would be to just remove the useless check.
>
> Mind you, this comment applies to some other commits in this series as well.
>

You are right. devm_regmap_init_mmio() returns an ERR_PTR() on error
or a valid pointer to a struct regmap on success,
so checking for NULL here is not correct.

Also, if devm_regmap_init_mmio() fails, the probe will already fail.
Therefore, I will remove the if (!afe->regmap) check here.


Best regards,
Phuc

