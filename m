Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CE0C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVW1HuRhi3qWhCumOh2BN9qRaoJYOTe2cMXmsKboVPA=; b=4lt22KJ5nQuAXn1kJ/9ojgPXmv
	QYGQk+woK9fbmc+lay2UT/7jSfeASgfSiJUOtPMxVUJED1d/nNNGd3EgUiZUQIcWN+aCf3ZJbcOZF
	NQhFxwnL+SJDv7DL/lwZxmzerGARu1klpFlV5G0ClIQqjnAbmmuiXwsZntQEbYsJQUJMG2L8BYQk8
	jHNNRGkjVOy2YejMvF8HtodGgZeuh+XKC0jDro+mromJ02dyq/1f7MvRnY+1ttxUIey1zcHQeVZ2O
	WyQgNCQ860oqC9pOM8twj4HVUY8QEi5QMmOybMCz9IzG7uRGw2DhSvlGs9WZf1DafX0RaLxct3icv
	P2jWPGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHRiS-005nqy-V4; Fri, 29 Jul 2022 15:15:52 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHRiG-005nkT-CO
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 15:15:42 +0000
Received: by mail-yb1-xb32.google.com with SMTP id e127so7927725yba.12
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Jul 2022 08:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JVW1HuRhi3qWhCumOh2BN9qRaoJYOTe2cMXmsKboVPA=;
        b=q3+xVd38htCkerZKxQ6R7n4Dj/dhgTXP8cf1zgt0TETxOzRPDIPko+9f0eqCQOzoxF
         o/Y64pJri8xB0On7D4lX+BJ33/XKXOk/Es62jTldY/l7pg4XOKeesDuPqY9fiz35PN5G
         7Q2AerqnCZzrSfQgwj6hmLEds9r22fcQSYT/X3u/T4uNZHd1i2qdUo5V0H04IxJc+hdX
         q+wUd3CTnyTcE9E/+/Qtp8AHG0baKZiTcvw/mh/ongkjwlo96i1Lzlpt50A9cL96srAM
         YmE9GBS1/BXs2uYAh2q0wlxlqZDTKhh4lnaIsthfcd1q6Lj0fE/O46aD/eehLc9aD+kl
         L3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JVW1HuRhi3qWhCumOh2BN9qRaoJYOTe2cMXmsKboVPA=;
        b=3qy3BtzPjWDUYvpjRY3xDt3At8PvHz+iPh6sFdWzea9+qUtu7Rz1qLhq0SNwb8WhX+
         FwQdULXyVTyRQ8HyoPBepq4fI+ObZDBEOf13VYPH+RpyMWUQV5NhDbGU8JYZ5dTLjLwL
         5+ENIrdAz9YfKTbnqLj05X9WT7FaOZPW9t08heD12+Bt/ZU17qO+AbCIGU4ZEBuoCigx
         KSFWpx6M7geS3gwmmfdXlwuu0nzGOZCq3jLKwXGpgtnc5IbsKa2zWJhAde/DRFQK//vi
         ub80LtLQRLHFqgy2oWehNy9bDI6rqBgBmpLYaNj7ZhPayxjcGZQhl0g4Rn7ehA9hkN2n
         hwwg==
X-Gm-Message-State: ACgBeo3w3Dns06If+22Yhfml5KfvryhcKtRXtXwTd2jx0bFEGazmfTjz
	CgzD1crenxLViloooTT8BAVk2SMo/uYFfYJKv1t4QA==
X-Google-Smtp-Source: AA6agR7MjsWrl5+wY6we1QLY1FGUyJgK/g+rqxviL46ZaTQ/lIO46FFNuI2HHXPoibeBW6Xc014AeHOzzqbfCG2Ff7Y=
X-Received: by 2002:a25:bb12:0:b0:66f:3c5f:dd9c with SMTP id
 z18-20020a25bb12000000b0066f3c5fdd9cmr2700663ybg.520.1659107737834; Fri, 29
 Jul 2022 08:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220726135506.485108-1-bchihi@baylibre.com> <20220726135506.485108-3-bchihi@baylibre.com>
 <1658866142.328871.782232.nullmailer@robh.at.kernel.org>
In-Reply-To: <1658866142.328871.782232.nullmailer@robh.at.kernel.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 29 Jul 2022 17:15:01 +0200
Message-ID: <CAGuA+opZSoWLZ62tZMdA1GoUe7N9K8DV19AUAophCQpr6rNH9Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] dt-bindings: thermal: Add binding document for
 LVTS thermal controllers
To: Rob Herring <robh@kernel.org>
Cc: rui.zhang@intel.com, rex-bc.chen@mediatek.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, mka@chromium.org, linux-kernel@vger.kernel.org, 
	abailon@baylibre.com, robh+dt@kernel.org, p.zabel@pengutronix.de, 
	matthias.bgg@gmail.com, linux-pm@vger.kernel.org, rafael@kernel.org, 
	khilman@baylibre.com, fan.chen@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	louis.yu@mediatek.com, james.lo@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_081540_426215_1A944AEB 
X-CRM114-Status: GOOD (  17.60  )
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

On Tue, Jul 26, 2022 at 10:09 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 26 Jul 2022 15:55:02 +0200, Balsam CHIHI wrote:
> > This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.
> >
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >  .../thermal/mediatek,mt8192-lvts.yaml         | 73 ++++++++++++++++++
> >  .../thermal/mediatek,mt8195-lvts.yaml         | 75 +++++++++++++++++++
> >  2 files changed, 148 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
> >  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.example.dts:32.36-37 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1404: dt_binding_check] Error 2
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
>

Hello Rob,

This error only appear when I apply my series directly on top of linux-5.19.rc8.
But, when I apply the other two series that mine depends on,

https://patchwork.kernel.org/project/linux-pm/cover/20220722200007.1839356-1-daniel.lezcano@linexp.org/
https://patchwork.kernel.org/project/linux-mediatek/cover/20220523093346.28493-1-rex-bc.chen@mediatek.com/

and run "dt_binding_check" again against my YAML file, it does not
print the error you found above.
Would you check it, please?
Thank you.

Best regards.
Balsam.

