Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F7AC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UIfKvFvMqAxcJyxWvWpP/N9FWfFY7zfLwomngLyGZ8=; b=u5O55cetW1ckQ2R7w7mlXExWV5
	x+WQUoFsPU+KVd4RzcZ6G4T0G43vdfAlKTU2NWeK57RsyqxxuxT+OYjK/QBCxVYP6/BqZlHLd/e3v
	DYh5WvIUUWYAmcqyV0DwMCFAeqfPIVvKWv+MUO6HPUDob/RwzftPhSeJoSOi5MeIrOqP7DZYtE4N6
	f3PhFpi0CEFlMIf7i3Kf9RUWahhwGxFppiw9SCp1l4CVPWfJbfTrGDAS4UfRwOyQBcRDpqG7xL4YV
	jENAyXzuZAhtocxcIN/dGj2bBzZTk6yLa6c5dm133Dm1Mb/p/CV9EPoinXYgU36Dfzuf6p+x6GKjm
	h8xl2q7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcxI-00BVyQ-Jv; Wed, 27 Jul 2022 09:03:48 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcx0-00BVjr-VN
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 09:03:32 +0000
Received: by mail-yb1-xb36.google.com with SMTP id d124so11799574ybb.5
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 02:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0UIfKvFvMqAxcJyxWvWpP/N9FWfFY7zfLwomngLyGZ8=;
        b=fIdO0pY7egrExHSgHak6Z2Inm4ATnzaAOly1bxMtw9tVoSwX7aM1VrAyPzybYMgYcf
         C9F1eKsW3h0FUA7cB2RuK3Ef2yeQDITdSMTuU6K0hEmw+IyJhSEiBp4hUgYFnNJc2MQ0
         wEEEby7mAchafqVQvXoUoUn2EKpF+QB7+L6qbkJwOoVJkBKffyc9MBGCT7Z8pCcrsM/F
         R/7vr9fzJzoiuCXkzRUiB70zyHowU6fOAlgZ7XU5XZA93uadMqQrV2YBkErcnalhu2xM
         9l0nbEe8kQmAdA1LCZRRAYXO0SSTT1Ye9onQOUALcHeMXWPKeYsBfrOYWfRvl+g5W3y6
         0rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0UIfKvFvMqAxcJyxWvWpP/N9FWfFY7zfLwomngLyGZ8=;
        b=2wCJYB/MbrVP2MplMZ1Da92i9z4Voetut9IhoHrBPACzzW7blNeN+Vv2iYIe6M308a
         MyOtCgN9IrXKYFUjEIwqsG/fSxz77tT170nmwaVeQGlKeFnehLUDuICDugtRsxPca3tZ
         RzfA42I4+cVXPUvp2gEDobctZT7Eg6H7QB5EN1m6/OVkQPXmOsFemxRe8iThOrsgHbrt
         St4SGpBzJ/YCnUBk9QxOA/twaVvSzQe1+VY2iQ9luXYB8Cx/rK3Om0DKGj2dYmDUW9H2
         YBdPm/KxvQf+cTD8ac8XVap9IRaLpr1MIeX3XcsEqViPnRDhkcVZRm75ByaL/W7/YTl9
         +T6Q==
X-Gm-Message-State: AJIora+6ml0imRsf/pUvJJ0XtiJqZjyCNmXPl8ZFihwtHhCKGb3EHsAT
	xi3sJTQtqhRPJPInHzyFg8IdmqbdRzXlVbN1LojDZg==
X-Google-Smtp-Source: AGRyM1vtjVCiK7A2GDqW/KyubKNqjvhydU8MnJUwOvM8jWILa+8/+sx6a8efaxGE5fWIQcDhL9rRTzH6sIt9ENFqg9U=
X-Received: by 2002:a25:bb12:0:b0:66f:3c5f:dd9c with SMTP id
 z18-20020a25bb12000000b0066f3c5fdd9cmr15614585ybg.520.1658912607967; Wed, 27
 Jul 2022 02:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220726135506.485108-1-bchihi@baylibre.com> <20220726135506.485108-3-bchihi@baylibre.com>
 <35e9db62-4233-1804-0233-f048b149c22c@collabora.com>
In-Reply-To: <35e9db62-4233-1804-0233-f048b149c22c@collabora.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Wed, 27 Jul 2022 11:02:51 +0200
Message-ID: <CAGuA+oqkcmJGUuzraQzjjVO-w7_sSNiU5ZpAYN9nc_hsufkkHg@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] dt-bindings: thermal: Add binding document for
 LVTS thermal controllers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com, 
	abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_020331_028348_8A340E40 
X-CRM114-Status: GOOD (  14.88  )
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

On Wed, Jul 27, 2022 at 10:17 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/07/22 15:55, Balsam CHIHI ha scritto:
> > This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.
> >
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >   .../thermal/mediatek,mt8192-lvts.yaml         | 73 ++++++++++++++++++
> >   .../thermal/mediatek,mt8195-lvts.yaml         | 75 +++++++++++++++++++
> >   2 files changed, 148 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
> >   create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml
> >
>
> Hello Balsam,
>
> I don't think that having two separated files is necessary (and I don't know if
> that's correct, even).
>
> You're referring to variants of the same hardware (and using the same driver, but
> that's not really relevant here), so my suggestion here is to have only one YAML,
> named like "mediatek,lvts-thermal.yaml", where we list all of the compatibles for
> both MT8192 and MT8195 (and future SoCs).
>
> Regards,
> Angelo
Hello AngeloGioacchino,

Thank you for the feedback.
Well received. I will resend ASAP.

Best regards,
Balsam.

