Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0684ECCF2C9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=; b=4qlmYhefalUKCDyVPaMwfkGgtk
	AEcw3X2JB+6CExNl/vlIn8AlANN4QGVTo5Eixl3ZcyGa9H7/Iun03eZ98FJ14gkdgNOO4hMzS7zQI
	/9a2BDnC7qbqZC4qK1j3BqlKV7qUYwSIlWLD5vTLmxWol1rleWi/lO/LHyN2CgarhsuVG1+BGyy29
	3QN9LNVcJXgEcs0kLQVaQVUgn4NdjQxPSa3j/7R2/QliZJxv9ND0JX4D5IH8Y+LnN/aVcfkokKlSq
	QrbY2Qm69JmUGdxcFepky6Uv2QJke5h9C72Vm/NJyLaeF11CYm2sXGPmb0wrwjb0Kqy3s8xWx1FWP
	1evqQBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJjn-00000005Z2m-1kte;
	Sun, 18 Oct 2026 05:47:15 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJjk-00000005Z25-2DO8
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:47:14 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3ab41538192so907716a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302431; x=1792907231; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=E85lFPyKbu51jypYcsQe+POoxpMM6nLTVoMUFdUh763qxwmGzqskK+qnLFEGFsl94n
         1Q+RkZGcf4vEbLdyzWHtY/h4UvWNwY3bkc8DgzGlGgtyAdv0PrNYAnUMrk8qOW0Ywc5o
         89XMjYc9PHHxU9AVaDXNkz8tSWGJKLTtoPyJVal73rcOpjR90jITZBebx3HMgLUq8Ql9
         lbg/tUFutvdQfsU8OHP4Cx4JWCWLt0fQSpRiH7zMMEehnP/HMyEkB+6ZuruwdZnFU+Mj
         IrQfjSOM9NmuHA0ko1m7mVaKeCIKYyN1NGztJl6gVJx+g77amc8RkVwfQapJkPZ5wRBU
         D2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302431; x=1792907231;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=n+ZMEWRxW89hWnDx/+mA6BGdXjd3XqHXvWMQthMezRISL9GGhjZordS4XF8ZXPlUsm
         92MyGgWn6IWfWf6LJe/VRpHLJXWfPdcJBOoedtYLLN1vghq1fuk3NrXtJ13CAmJ5/CYZ
         yg6SPG74FK787pRh+v1uCUDQV/bzwumX3tvzLMMkw/MaNF8dMFfoE4ccEnHcsPr31IK4
         drgfxD6XidMM8cinF6f2SJA/cIdN7b8gy1gCWnEGOXn+nMJQ5XNZEKEF0YbKcADal63t
         1Y3BBg77FLCd0AzsEpFrQy9N9DXITkEmEiMWnB6KW7GwOGsvmoU9Ewdzh+1yX4YTGGdY
         gxGw==
X-Forwarded-Encrypted: i=1; AKwUvByWRfFuxdLkbczuunr4bRFa+G3we9Cxq0QsitKRVoum8XKTnEwO/16z+yh8odAAfk9sueLkEwm9sd+6PIuU7A==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6mI0Mq4Kqkcpko416AdgDHcvVr3FhQWy7XjDtHdhCkDegQdTP
	45kVEX59e5XmEpxy22ce2M75JWaPyeKmxDDa5Llx388iK3jWPX0+ePu3
X-Gm-Gg: AYBFou2wfxwYc5ntD+TZghqmxEBirhIC2QuDLyqRyLaKm1ZblkRPuoX52jXtaVml9WQ
	eAQjV0fvcMjMP2H7R8rGVfFu98nJWef5230hsB2CcTiq+NZDZNCleDmfegq4AX0O3xTL4fuMBLO
	O1X7e8YXLkGB0O+7G67iD3PnolOq2sgWF3mtox06IQeyggM+9WS2h4ur2WsJgY1kEzFLT69mlg2
	JpJZjhKlIiJY+LffEsczw0VDyeOxT93r4gHmR3j9o2pUyfNfLWcIzsRhnCwcq+Xi8XyAQqjlWEn
	QN3F6hlnLmZCQVIVxJKSQPjVnBmZNteUOig0dI5ygkMaN1Fk5yQdSR4XUAu8Mf2WvVL4PJrbz3I
	B7fmbQhaPWM2xQEV/Sq23DMvlflcGluTaY1KDjpVUG4xs/hrR6psnHaTJyZT4XZWm2DQF/ELaDj
	iLKPyUNz90LYInfS2airaHUzDD582bEy9Pdql6WqX+Lu7ANt9tm85C+DpC40ZqaXjyiDa3/HD4a
	TG2bT63IzUzBxMQATyhzxu8otP69kAvhGaTOg0CRcxjx+KyOrfryrbclZsoZEKrPJZTSIi0+kVd
	v+X+iZfScYBo3CLHELe31Rw89f2g5ohfOJgovkEreeHlO0orNNQ=
X-Received: by 2002:a17:90b:4c49:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3aceeb95f82mr3942070a91.10.1792302431271;
        Sat, 17 Oct 2026 22:47:11 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm5442358a91.1.2026.10.17.22.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:47:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
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
Subject: Re: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
Date: Sun, 18 Oct 2026 15:46:54 +1000
Message-ID: <hMEBpV6QSOSLxRVSn92CIQ@gmail.com>
In-Reply-To: <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
 <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_224712_572761_40D2F36C 
X-CRM114-Status: GOOD (  12.35  )
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

On Thursday, 8 October 2026 12:23:42=E2=80=AFam Australian Eastern Standard=
 Time=20
Charles Keepax wrote:
> On Sun, Oct 04, 2026 at 04:03:35PM +1000, James Calligeros wrote:
> > From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > Let the 'fixup_controls' card method return error values which will roll
> > back the half-done binding of the card.
> >=20
> > Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/sound/soc-card.h                 |  2 +-
> >  include/sound/soc.h                      |  2 +-
> >  .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
> >  sound/soc/soc-card.c                     | 12 +++++++++---
> >  sound/soc/soc-core.c                     |  5 ++++-
>=20
> Fixup is missing here for sound/soc/sdca/sdca_class_function.c

Unless I'm missing something, that one calls the .fixup_controls on
snd_soc_component_driver, which is not the snd_soc_card callback
modified by this commit. That callback already expected an int,
and class_function_component_fixup_controls already returns one
per b8f71f16134f ("ASoC: SDCA: Switch to fixup_controls callback
for IRQ registration").

Regards,
James



