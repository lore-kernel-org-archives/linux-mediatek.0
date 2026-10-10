Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF8ACA9EBB
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2026 02:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=; b=bJNlZze2ZjaYaKhAvAlZkIPqqc
	x5rJ+CQgI11Y56D2tHY0Hj0EylWn3Tw+4PxAN93ln1XdU7YXfTFeavuEM9lQR+vWH6Fs41fViQDc1
	KgbRi+O4s/vp9GVmByekNzOdd5QgtIDX3S4eAwgsrtyGZfxOFiOEGlotMHwlQjehJ3y9bgBUAWWKt
	aRujNpxAWkmtnJgtFb2uGK4om0QhNG4oFyXHX4D4X90Ilydb98/OVI0FuJbC34K+E3q2p+dGR8+2q
	OMIvIMJP82DZ1dDHzk1hsYpo3iwmLtH0USFS9AEciO2Z3osFea0kvJhaK1B572ENveiyVwQrPcQuB
	QUIyX7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMh9-00000007Q0h-2YAB;
	Sat, 10 Oct 2026 02:20:19 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMh7-00000007Pzn-2HLW
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Oct 2026 02:20:18 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8690079f2c1so164733b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 19:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791598816; x=1792203616; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=HhgQxIej7NFgRNGFreKiZfaRIxep+JU+ncloJ2PQtfiva8ITkYRHkaOGgcYtr6QSIj
         8BlwpH4OhuCMx2AxIGoCuUwpv1i9zr26Dv4n9TjRfiIyeQ0t3g+OLTxgqhSCY2GrZMTl
         yFY2l2YsNrcrMD+X3YLwk7TFf52Vw/jqlzH9OJMwJtNmBS5uUuOHO5nHbvyVwRz0qdkC
         JDtLD7w5tmyvuPlCYD+xcXLi6OxpYHaFcsqQzG3TgFJ6q/odtGtdODQdTbdxaaWihkmu
         OoMoYWoH4Xar4CMbuVB7n2Cwgwv3LOSNdsCzQXU7V2SwyQC9YWWtw5s+1lGC6EAyP75s
         lGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791598816; x=1792203616;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=L/zwtbdh01KCtfVaAOXY8hUhnQEN5Yt1HalXDNV7wI+NJ1rTdBCn712rG3B5EgHjia
         j36Hgj2v1V0jZFGH+/wQqzK0EDWB2/xaRKIyy8DisJRtMQwRUwSDZZJEoU3pOOLKRRz1
         3QVk0QaSU7vqqnTmOAyq9lYKmL4YskUkxYMNyY5IxfTeSOQdXX6/mJYor1OLLFUWGvjz
         xAfzz9HL+hu4y1DbWqU9aWm2wE2s+PhMEUw7iD1adljxN3V6Aa97sjCE6rJdzn61Lig5
         dYjYX7739oGYe6S10jV00c4ptM0CaIaS9C4tChUS+EsVHL7lJ8An0iw5BJFDAr5ENafJ
         nSdw==
X-Forwarded-Encrypted: i=1; AKwUvBx27eiht7MRxfi4g3oYO4xYrnJw3eyG6RgMwTye+pWpzIbSJP1mRbcwY5Psa6BTUBOOmyHrkMJKZUzGDTs0Sw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJd5l+xPhFtFzKPqJhs91UrIGGrZEidhykoaGK5DGyjb4pawk41
	NzDOmojp5IL9qHCRJH71muVbvJmgId2bCWq12IuOFrnNeLJ9Dob9B7qF
X-Gm-Gg: AYBFou0M9HbTm1VdGky4+8NE2ccZWPmDjokVKnw6QF5PjSHPtjkjsGDLWlfpYViJaVe
	DbIdufkRm45DNrhvpOzCIJJh3M87dfMe0N5zhNOgTexHO8KotnLXQMmSuN+K6PyVYxqVoouy3a5
	IdfCyZ5oecRUQ6LwIG03cKzsK9iuRFvlZhby4fjAesl/bkD9/JR+rc2w8D0Jrueaq1YG6ladDF2
	YpIWgSAG4CkhYK/F8mTdogCuTxMiEtWlt/RsM8t3LzrVf+ZyJgRWRsjDsLcxbf6pHz5itVRL06Y
	1KhahtibcOopMhPhEWoA6Zsj35cQMnJVP5H6WIcodn1+CMSB8L1lQSSl39fZfk0ja8Y3UZf1JoO
	hdYEhb4AizsPIR3Q5WTbdqqnvO0Ak56KZtCL6F70NmqDzXK17iaRObPpuXK8MuD8bXeotsuuhlT
	iAUWKoHFhh3V9f+3XDS3N69CizISewiLA18To2dO/X8Q01GppUYkqRlxmyOjhqSJNESia5SD5Ga
	TJblowv/ZvBb7nzg6EbXlncG+/uoVO2x6/j/0IhlywXnUKFy9jEeIZnyg1rIbhukKS+T7QhTbYa
	GDZkNg1Y/ukVfZ36xl0vyrksoCTrQeKbzUvRxFKfE7gNj35E2gk=
X-Received: by 2002:a05:6a21:4eaa:b0:3da:b8b4:91d7 with SMTP id adf61e73a8af0-3e16bab5c23mr3009407637.2.1791598815958;
        Fri, 09 Oct 2026 19:20:15 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c479c2cdsm1804113b3a.55.2026.10.09.19.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:20:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip power
 supplies
Date: Sat, 10 Oct 2026 12:20:04 +1000
Message-ID: <WT25lTvHQhioJE_CrUW6Dw@gmail.com>
In-Reply-To: <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
 <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_192017_592350_2D6B72D4 
X-CRM114-Status: GOOD (  13.21  )
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

On Friday, 9 October 2026 5:10:01=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:29PM +1000, James Calligeros wrote:
> > Some integrators do not expose the power rails connected to the codec
> > in a way that can be expressed in the Devicetree. Do not require them
> > to be specified on such platforms.
>=20
> I don't understand how these cannot be expressed in Devicetree. What are
> we missing?

On Apple devices, the regulator(s) driving these pins are completely opaque.
They are not exposed via the Apple Devicetree or any other discoverable
interface, and they are not controllable. As far as we can tell, the pins in
question are powered whenever the machine is powered on.



