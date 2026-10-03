Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4959CA5FE4
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2026 01:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=; b=QDDLWmSgTy0uRRae89Dp9thIY2
	DYd9okAQMIDJpGS7MTZS1GQohxSob8La6ziKYSuwzFmNmM0s8gM41MPrzx8I8AJDMV716O/O9afSk
	7I33MR1T3jHAM3NVrm5utU9PzdIJoB8/fbCqlTyzgaK94vpxRQmzDF9CE8+5/BZqwhbxYCuXp9+Nd
	7aAXx2BvqBZ1ZaMu+1CRvrHO6CQx7WF/sx3jUqpTPMs7DGbdiq5Q7VyGw8g66tW4Cos6bswfw2lTg
	Q5zAWSJ1KMnVlDuZclKsb7VHSqJK89S7oDHUX7OrbHPIsKikJjOFPZcCMwqWG722/8AaCpaF6sGUo
	/R3iO/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCodq-0000000CtbE-2DrA;
	Sat, 03 Oct 2026 01:34:22 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCodo-0000000CtaT-1QK1
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Oct 2026 01:34:21 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a7906f463dso61476a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790991259; x=1791596059; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
        b=tDtrdL2gPvokzgF8dJrk/L2Q4Bz4si/vDjdjJQLdguhzKh8j1WxThUyqjZCW5ObC5m
         wVDj5DXS8uFLRpqXlJM4hcoybpfxREfroSvBytsPhaiw2JLmNJ2hbq683yj1cs70lNu3
         o6X26ryOieA/tB629jtW3Bz7r+kV2sfs5pL/o23gQCxh8Qd13GgeZN60ZWJXCBhWZCr+
         87Ur12Z+HBxmGwmTiUIqLLyzie1rcIThjJ4RRUERsU33wtaudQCCwgPQE77R4guUiSGk
         npwQbHKxFK5kEJX4FYqYDbnrXKl0NHGKY2Yra0z42+b3KiGNkN3PrUqWHAebKdwGllzc
         fDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790991259; x=1791596059;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
        b=Wkji5p4Br+Cv/EqZ6V2UVWOhTEyzBR/GgIjpJ9tmtM2B7swimJC7evYCQigWEHZhZC
         WELnbBgS/Us7qKPUv+V9zURm455GM1fJP6IORB5MkaIv6OjrHZGsl9paw1RX5PCxDgL1
         AChOwiryOff+kkTeMwCtWyIk+vztPXE4O/6RWfQSfdtPeTgtHL531xRihAOpTqjqGykp
         hunR5nCeaIIuseb0GgpPSyCqhQTI73yn6gp3NB1fEb9y8kDVA/ubo+OP+AQVFWnIYdZd
         mZSgMT80n6lLRUDaqSlsDECLMtzN/Sz75ZJ/p2Dr/DZR8NpaPzs51WFi8mPknOQoipVL
         qMGg==
X-Forwarded-Encrypted: i=1; AKwUvByyoD6IOqjF4Ohtt5Bq82v5Jf7DnuhV3b6pn02ad9noV8L0rX+HuF9MOXFaFfK0ZV+WYfhpnR0TcE0JhXgv+Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYKh0bLLrLQqbpU5+P8OIZFCmYHt9xsYklpvG+6QCNIyLww5ukQ0
	f+SHmp5G8AEEMicV206vvvahGBJuCF8VMK7XnNeFOoac/Hjsjh5KsJt5
X-Gm-Gg: AYBFou02A+ybEYVGfc8K+ciGPtQAic1Ojm4Gdu/EwhQQOllissRA8mLZ+e1P1oDQCNY
	P7h0ZUAZz9AfqDgKZyOhrAHkjJTKwXY7oLAqXbrt98TCFKaIml1/nrrSTA2uu7zyba8rSVtwiZg
	PrX06PX5HQ159J5pyADgpk9+7yMyi6MER2EMVCqGY8QiioNEwKe8suzlQTtPvy9Pd1J2R63srHw
	kVAgfvWg/zZH+JhmgnGqnjzS501M6qxZIVrKTWYvNGjWvRCTtQcWnSVGhDtfkMfMiJj8669bnB9
	a1ZwSHAYSZct7GrI8tigTuEC0eLh+RgV/wPMWRu4Jq0OMGA+AbYLp7AeVasSoFXw2rJW7haprYp
	i3odsszfATfuchkzSUEjmBkz81N+e3YGstzYspKPr3Emo0qpJTx5IfsFSbmEoi9bf2199ZMfgD6
	V1w9zaUPTSCuq+J7PKbHvf3BbuKxM6ORuQMmck+TTb6Gk5EIkBsGp01AlSEdPaeyk4Y5+9XPQVA
	wO/cpRWcFzDx3ZroGtp7NvYNwQPtU70xU0Qvwz92ZQQ9Xfd1ebkyPPskTD9ICPywn4x5l9SDbc/
	oHXzxN8y6b4JKjjPfzu34KwBCWmljwJYB9t9eR4a2tcWaOeAvQ4=
X-Received: by 2002:a17:90b:3c44:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3a6ced75f41mr3500888a91.58.1790991258652;
        Fri, 02 Oct 2026 18:34:18 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm861575a91.7.2026.10.02.18.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:34:17 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
Date: Sat, 03 Oct 2026 11:34:07 +1000
Message-ID: <u9VW29vaRPGENsSTq9RHUg@gmail.com>
In-Reply-To: <878q4k2xl0.wl-tiwai@suse.de>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-8-741cc20a74e5@gmail.com> <878q4k2xl0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_183420_380830_0F2CB88A 
X-CRM114-Status: GOOD (  18.67  )
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

On Tuesday, 29 September 2026 7:52:59=E2=80=AFpm Australian Eastern Standar=
d Time=20
Takashi Iwai wrote:
> On Sun, 20 Sep 2026 06:53:47 +0200,
>=20
> James Calligeros wrote:
> > From: Hector Martin <marcan@marcan.st>
> >=20
> > This allows drivers to implement policy around locking/unlocking
> > controls, such as enforcing that a group of controls may only be locked
> > by the same process/file, and taking actions when the controls
> > lock/unlock (such as granting special access on lock and resetting
> > values on unlock).
> >=20
> > This is, in particular, useful to implement volume safety controls, such
> > that only a particular process (that locks controls and completes a
> > handshake) may increase volumes above a given safe limit. It also allows
> > the volume to be automatically lowered if that process dies (which will
> > trigger an implicit unlock).
> >=20
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
>=20
> This doesn't sound like a good approach to me, and this looks rather
> irrelevant with the purpose of the series.

I'm not sure what you mean by it being irrelevant. A significant portion
of the machine driver is dedicated to implementing safety interlocks based
on the functionality added via this patch. It would be impossible to prevent
badly-behaving users{,pace} from defeating the safety guarantees made by
speakersafetyd (and thus permanently damaging the machine) without giving
speakersafetd exclusive ownership over the safety interlock kcontrol.

Is there something specific about this approach that you do not like?

>=20
> thanks,
>=20
> Takashi

James





