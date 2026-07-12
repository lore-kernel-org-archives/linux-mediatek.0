Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27217C43458
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Jul 2026 10:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=; b=EVO6+Q72DyWKvzM5g7IWXQOk72
	/S+cotFx2GbW+1A38dDlfxbMpmF6jczmtggTc/3v0FqWu0M6yRgPh2Re2WZPJ/aKjJyHnCKEIPYpb
	twy78rFzYvm1w9UUKOFR2HAnCRcHpmM0MvUM7C5WZPX+dAPgkWwnPrnN81umF5If8NORNPPLwd2Mm
	XcQDWHh6kDOpwyHvkU1BuU6jj/OFCRY6LdWjpmfGBj2El0vjQryXzgPIW0lOJiuyaEJNhc5jWMpXY
	2gUZ4ai/HOmn1cOZ2ypzG17wp7VqpKxnYVXazhW1bI3657ZCHl+Ms0rBVoXDD/OJSDYS6KX1CGERE
	sJOeGGNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirMY-00000007M46-2NUE;
	Sun, 12 Jul 2026 10:24:42 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirMW-00000007M2t-0DdI
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Jul 2026 10:24:41 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-381ed661712so2718461a91.2
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2026 03:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783851879; cv=none;
        d=google.com; s=arc-20260327;
        b=E8foo2f+cwN5SWrreJB1V8jll9qBGNAA4yz8nkAiqgjBowTqfa4eE1b0fU/hMsl6Ct
         K4Lw6TYosJtoR0HRfd22Hv6AeYBCZ54LLyQiGZywcZr9SrnoyOzlb59oB5xUD7N8RQsh
         Hkqd3L70QuJX+Jio7TPcVgJxhP+z/jb25YDBCysPShmxyD+PNHvE01310QQZjSSLcrbf
         WfRpO00KNMZFrTwJRRzH9PpnLQtbV/0X8WbObWgDuWu3HI1AOWEmqqadmis7oCIl8mf6
         CubpYzP0x9Tu06qnb1xtY7AZtzu/ufEb+kE99iuxolDn46fQyo/X0rYmoBY69a+kZ7Nj
         pmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        fh=ak16csfVrIi73E5EpkGjvMu2xk2BKKFSPR0n3jNN5Gk=;
        b=Iet3vy/iLWKXNGtwd30vYp7iE5tKE9FXKxrWCiKmIpGkmgEB4PN5oVfO9Ed7v7wnIj
         wacc/C8BOAJqOtxy5qVjm0dOKk56OG9QjfIzT25lNXO8FcEr/uUAet+k/6Y7/IYefOui
         b75QpIIM3TeAFqn5ZTSN4BmakSWl3yY525sGHGpkeqAaquXRq4P2oIDGDxCkdeog6KCa
         jyF30swkha6i5sdF0rhWc8rPXLanqtL7Lr1XxDbYrzKNxO745+/qRQgfrOU7ReFloa4P
         eEaQ3gM8efE7lSc9NRU0H/mpYQ60tKi3KQByTfX7WDqUpeDm8eTu0K8G4XPiSM7eYpYN
         Hvmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783851879; x=1784456679; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        b=rFwZPx+nre97tQwDX2SpsoAO0+aCgyF5WCu0dLFo+9bh2dZ4iCtIY6swTI8dLssi/v
         Wp7GQXsBJfo3NQSv4D6/qNVxnZQ7mPlEDrmPMg3zgrlqHBFY05jC/eDX/9tszR/9/pkN
         4REbhnkxp1Gt/+M3QlKJbkNGnM7ppda5PuP+F0n0aYSx5J9RLulIo6clr1pNvMjg8ZEX
         t39+k9U+l7qbjVpmYrjpwigtyNU5fK7/Op0mWshmA3dhaDewnsWDYx2XGigTs4DXadWm
         jTeAuA/uLO4VxnFIoXDxDUqQNMUQi6g7c1+H65fligSeBP+0KHg8qfjLdXnglMgFoLVm
         MbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851879; x=1784456679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        b=kgSLh800lv4BCidt1vYyw0NT+FNgNe+LXDl3Y+nyY0i+Tux2fcMrLzuT3l0avq0G3D
         heYpoKn9azMzdu30ibJHWT8fWv5Gd42pk/uIVZA1NadoLr/rce+2iytx2aitBlFai3Xs
         tgTec+5921KX+sTctevNC6h0DTXCS1PhHlYtT7ctOQeo0RvJQV+qQQDqt22vO/hdAr4s
         j++kj5xMbMu8aUDATXwLySsgjz+vdaT5X9Sb+i+rYxRGtFYpvuSu55uGLL0CVo20jMxy
         7OHvBcPB/KOhjcdlkUlCBle0XGExlkuj0Uc0WRZl5nZqxqAWE05DN9cb3mpz2vrLaX9y
         A9TA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6PsAaIheKjOKzcLMS3Pt0paoDjQ7eVorbqVCVzJzjFI0apbtE2W/vt4RxkOQAE+85GuUWyratCugHaDE1mQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0cM2mHk+pUJhfhtNrf+FUcNDDGAzAI5uOlB51htQ367i5/Cd6
	zrg4tRG7CTFvcsVVRC6Bz8Je+8x7AozToghaLpRDltbYXRhnsG/MfFU46Pl3ZjMZYcKvYyzkXQj
	sKrwYPJWhvU2VBUORy3/tdiPNLfAnQP0=
X-Gm-Gg: AfdE7clC7Pj6tNxNzUPVoknv+wVc83MsKWVsPacvki7XDT+OcB6wdfmHOscAnKQaLPQ
	HLRbjjip93KFDKr9wn4A36uvpi1Tuc9XdV3p8xUzgg+BOOhhm6LGjbO7TFrHdruaME3FsaH5z5n
	hJ9oEPK09SYNwd8q2Ckhisv+HMywPCGI6zu2SvdDchSXtJPnRIzdzuf2GqZIUGqbdju4naLdx8N
	/WLfKXlIU8DSYq91UTqsZrRN7Ns9eeTj8Ybc74uRfDeCiTBcHZhnh8wLlZBYPme8dEM7fTQ13VE
	P6ic8AUOVqfNRgNtfL/BZgzPKK78LGz3gmbXh5Jk9E619VcUwMdWio/x4RoFsQ==
X-Received: by 2002:a17:90b:3846:b0:381:1fd3:e4ef with SMTP id
 98e67ed59e1d1-38dc774cd1bmr4524877a91.25.1783851878641; Sun, 12 Jul 2026
 03:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
In-Reply-To: <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 12 Jul 2026 17:24:27 +0700
X-Gm-Features: AVVi8Cca40gsSncc4EvdD5aUN3fJc8X0TaVsh-jOUWXPUjZCZtF3SWItFvK7afQ
Message-ID: <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_032440_100239_578C2B72 
X-CRM114-Status: GOOD (  10.47  )
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

Hi all,

While looking into removing the goto label in rt712_sdca_dev_resume(),
I dug a bit deeper into regcache_sync() and how it manages the
cache_dirty flag. I'd like to share the analysis and propose a small patch
for review.

1. cache_dirty state before the out: label in regcache_sync()
Before the out: block, cache_dirty can only be in one of two states:
+ true: if writing the patch or the sync itself failed partway through.
+ false: either it was already false from the start, or =E2=80=94 after the=
 patch
   has been applied successfully (i.e. the patch loop didn't jump to goto
   out) =E2=80=94 the subsequent sync() call also returns success (ret =3D=
=3D 0).
=E2=86=92 The logic here is sound and consistent.

2. cache_dirty state after the out: label in regcache_sync()
If _regmap_write() fails when re-pushing the paging register here,
none of its three error paths (-EIO, regcache_write() failure,
or map->reg_write() failure) touch cache_dirty.
Only the cache_only success path touches cache_dirty.
So cache_dirty simply keeps whatever value it already had before out:
(as described above), even though this write genuinely failed.

3. Proposed patch
-------------
ret =3D _regmap_write(map, this->selector_reg, i);
if (ret !=3D 0) {
        dev_err(map->dev, "Failed to write %x =3D %x: %d\n",
                      this->selector_reg, i, ret);
+      map->cache_dirty =3D true;
        break;
}
--------------
This ensures cache_dirty correctly reflects a real cache/hardware
mismatch whenever this write fails.

Feedback welcome before I submit the formal patch.

Best regards,
Phuc

