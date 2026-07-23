Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79297C531D0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVHu1MArjutVseh/LgffkBjd4eU14JPypbLOkT1+yw8=; b=ssFxZS/8kBF7jSoKjEOmlEENIS
	zXuILmJ3g1G0rKOjCcZeOJWWgSSHnJ/NhMJP93C2MOZ418n3RzRjh1duz6Bz0ewgc5faigbnvCLqn
	o42uOlTtT/3FabqSBmIIVzA1DIW1NvIYb79ZZlteHsHkVtdAkroorcLBRvHh1IyQtjpBabCZ9i64y
	6o/eV+vMIh+R1GSFbcYk5faZgZqd48Ohi2hiF74kQzEh5sCZbjpszuNkBsFtOYpR5Q7pJ8cERD7Cv
	bzCtSQG3ituKkuifcnwk5QpYY9JLIvePDZJCciUGI6bAFJPL4o1yD1hKPVRbea4qGLcKnGi8zFySx
	De11ZYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0qc-0000000F6m8-06BE;
	Thu, 23 Jul 2026 21:20:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0qa-0000000F6lt-3hYi
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 21:20:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BDA543F63
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 21:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310491F00ADF
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784841652;
	bh=rVHu1MArjutVseh/LgffkBjd4eU14JPypbLOkT1+yw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AC80BQrM+mZEuEbTRDeEHKTd2K4o1FtgzmYWxV7lFZxddMJeWQLw5Ab3v4hiTou/o
	 s28xK1btB33mEEfpyG25JwMO47nrPvi2YZ9+69pJMqNJPP8haW6HKvRoG5iZqvrGOE
	 9ha61SfHC/ByikyByFo0UHvfTi+lEZyNhkqiJ5vx5q9UocAKfJN9VdlaX8OSZAtssH
	 2R2WECm7Adb7964k06xnaI+o8ZblKV7HUoVJQ3nyrAsOGlfL1Na/48HEidHR6jvb5f
	 h0abdo29MjZh/P+ZznC+W0nfYgZcOhzVOV2UAL+9YA2dMPcDvdLeHt0169TanoAPKt
	 ++HkyQhy7LFkw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b011edaf7dso1116365e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2026 14:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqyrbwZqDaFvftzrGRPS7rfdgjpSW7pz3083dV2tnA0RlvH69mJflqb+5EUSbt5zS2SH+tvS5mD95ublbFczA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNyzp7U0j4IPVsV0JVBzgtJMKvTfx6Kd5KFYuWWuZkhE7emJyk
	o8h+3b/oQ0ybXyN24rKatLpomGU54bzfoTPmHPsDb0Spfw5dyqnPjfxv95YySwQ6UCRiu+7iaAv
	CFU+WtgvadUhbocdjZ+XleUs2u7ykSng=
X-Received: by 2002:a05:6512:40c1:10b0:5ae:c34c:aecb with SMTP id
 2adb3069b0e04-5b2b2f71273mr663306e87.41.1784841650927; Thu, 23 Jul 2026
 14:20:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
In-Reply-To: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Jul 2026 23:20:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnP-f85taVv_Qus31Fmx453FL1dXuCzgV2_34YOyk6wcA@mail.gmail.com>
X-Gm-Features: AUfX_mzO1IFYAAzmWCaGdgClCyXt3fIPpy3GNEwr6OblEvy3QOAx8n-oSARvnK0
Message-ID: <CAD++jLnP-f85taVv_Qus31Fmx453FL1dXuCzgV2_34YOyk6wcA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add MT6858 support
To: nikolai.burov@jolla.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Nikolai Burov <nikolai.burov+review@abscue.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 13, 2026 at 5:07=E2=80=AFPM Nikolai Burov via B4 Relay
<devnull+nikolai.burov.jolla.com@kernel.org> wrote:

> Add support for GPIO and pin configuration on the MT6858 (MediaTek
> Dimensity 7100) SoC.
>
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Patches applied, so we get some rotation in linux-next.

Check the Sashiko moanings on the driver and address with
follow-up patches if necessary!

Yours,
Linus Walleij

