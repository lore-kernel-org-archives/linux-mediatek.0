Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9762BC982FA
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 11:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=; b=NdC1tJTynW0749+eUD3obZQorU
	7ljqORUplyIykipKnLFVHTcjBoMJIXQlrQlYh4mZIWFyOx47+/8mrFwMjXNSDsyadj6FzoG+BO0kw
	zaNf7Fg3ku1medciQpkUyKOryI5IDqt+PSHVsjTMtA9M5PUUrHTkAAsrsh9J5OZH+OWY8QevcNYVF
	CnWhKipCsiMHEKJ9fT8OKvhLrJj/AjaLRQOHwpeh+FKAe5Q8SIhN7hx0gztJIxniAxhoZXyd8h3Z/
	TpOlUYC/42JrKS8xTQDv4F3wY1JBROGeYSsT5ObguHKeFHXnIvSXHWeD1y1f6jpDKMi42dOZAiNQD
	qSFfuc9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ku4-000000080tv-2Dke;
	Wed, 23 Sep 2026 11:12:44 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ku2-000000080sg-0Br1
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 11:12:43 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d91c22d27dso2814065ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 04:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161961; x=1790766761; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
        b=Nf81lhgbeTqWb6J0EA+q6+2zx7nQeoP1lZHcBXndaPEKq2Z8oxFXVDW0jpfrLZNaDk
         igz6qnKd01J/OlqYqi4PxwwEswPdjTd9PrlmupZAaPhr1RJy/mgHMPUN5yAoCapxNosN
         qw/an8VC5g/Z8Itcp3B+QELvAhkLXLNvImR9SFHkfalmM+QrIXsori/IBzMXSXKxtIe5
         cPcCkoty/epG9dfUE2i94RlfIoR8UB15XnYRNA4nE6mgBxajGsJLCscajDDiRM7FV0hX
         XJO/C0N5IFtQVqMufTHUkIiDtCyBICpRZ92eyuIq9MGYlotsj3iws+f4b8mU4DcWJdVq
         JV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161961; x=1790766761;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kFjPPVTiTU44/Rc2PKmvKJZjxEZERC4DkD/eRB6BvE=;
        b=SqQSGdTDHZQZl+VeTOXxgKOBx/BqbY+jrZmkjTzgGrxdFiIjXyprCFfgWycqEM8Qbv
         aqmJin3S0OPjJ+7SMBQeDEd7U1VOvx0UurNk2jSdyjTwC90EJEgGjHmTAne8Ip8znVWz
         mfefMzPuY2p59wGzYtbc0qCQz+ZrufaYUtgfyzSkXPOpuqyLr5lcy22HepsGlC5EbAj/
         76KYINzGB6vPbXyZj5ccZlQL1k0hq3II7Wm5XKTrI5fcy58GIkCior1VTwRYeYladx1B
         KB4TaPUt37AZ+a0lJfzbuoU7uf/xT0EYLWyCRQQUEiKKB5YHw2rlUPsEKOByVziUPAp5
         GGtg==
X-Forwarded-Encrypted: i=1; AKwUvByzVVyWU94+NpoRjJOnY36OhalFUhm+gUnIrFMZqZxnSoZBNE7Q/dnlhAI/EfMl/oc3t26iNlUxAQCFUhRdlQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nq2zR9/pVBZfl2c9WVqZv7f23XVp/r5IYiYx9u9+L7Rdv/I+lG
	B0MIiEJAnIPWZFpSRRT57p3RSn9OcOLou/cVUEhHOZZGQUkzT5/ByyTU
X-Gm-Gg: AYBFou0tvUcMXAzZW07O3Ktfv3w2uqHyFJFVIDnD8SL61bst3qgUUo1SpDA/Xob4Z/h
	dnb8a1ChnB9wnKT3k7BBYW9FsMR3igsUsLWEueHAj1mFnRY7zOpi9PqZKuldpSJBvPeNTGrIM4g
	OrYooGdY9zFv/P8vH98n2Eu+F4z4ekhxPF83bO4WXZtDC0ZylQ8mJuSZDftcnpn+/UWjltgW0+M
	6bcIMe14vOZRNyvZLWnor/EcSxUOo7BGQRYKU/5IP8NAWmSLh575Pv8BDc6Mxv+y7Kh7rdy2L8D
	w0lWvlPKeXIN5BetEfODx21zeGiIkTWrqDOXNmPdxY+LfzZrUCijWGXbbiiE/OTzJt6rCohuw+x
	gjLrZDpFVt0KkT+0uHLgBgaXTNtTyyBQV2d1YuyBtVj/hbNnfG34g13cZ5t6UjnmvKbiYqc+uJV
	8hdhKIsxZkQ60TfqlIDW5Jjkzs8+fP4bV/j/sykhM0F3k0fYyu9cEYpkQXq2+2hDviP8Lyu54+7
	row2as/gprCu8bQXidKKwah/St1cciBCvfmCACfx8CDIksszGNYXV3Zy2V1Jc90XYjetXZmD5cm
	/LuAn6jy8R8l4/I0bAprpUIi8KwKId84CneQI09pEwokJ/Q1foo=
X-Received: by 2002:a17:902:d54a:b0:2dd:c053:d739 with SMTP id d9443c01a7336-2df69dacfb9mr19455635ad.32.1790161960734;
        Wed, 23 Sep 2026 04:12:40 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f5886sm8814555ad.72.2026.09.23.04.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:12:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
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
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 10/28] ASoC: ops: Accept patterns in snd_soc_limit_volume
Date: Wed, 23 Sep 2026 21:12:29 +1000
Message-ID: <EVVfptRVTru_6AKB_uY-lw@gmail.com>
In-Reply-To: <arFa+frv9QcL4b36@opensource.cirrus.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <arFM5QGrJx1aYhGK@sirena.co.uk> <arFa+frv9QcL4b36@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_041242_097944_3D8C8526 
X-CRM114-Status: GOOD (  13.22  )
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

On Tuesday, 22 September 2026 2:27:37=E2=80=AFam Australian Eastern Standar=
d Time=20
Charles Keepax wrote:
> Are you using the wildcard mostly to skip the component prefix
> stuff? I wonder if adding an option to match without that might
> be more explicit.

We use it in two places. The first is as part of the speaker protection
system, to ensure that all the relevant kctrls have been locked by
the same owner (us). This one just matches without the component prefix.
We also use this facility to eliminate duplication across left and right
channels, matching partially on the component prefix but without "Left"
or "Right" in the string. The second use case is rather superfluous so
I am happy to get rid of that. I think at that point it would make more
sense to just construct the full kctrl name in the driver and pass that
in to the existing API in the one place this actually remains necessary.

>=20
> Thanks,
> Charles

James




