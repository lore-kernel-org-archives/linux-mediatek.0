Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A84C5DF81
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 16:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=; b=Bdivcall5teOozdhvIJANHY3L+
	WN3SM8+S6jFcOLch8HhZgvXgYsZJNS5ggR2/isw2w0fUPdoSTCxY2G1w7KuqTW+F1A95dX82PO7Tp
	oilXFlywPfpSwbCy+PrMpusL6sYoCZcjYoaK0bBWtKZ4qRZYW8+2tz/cBBiGhNa3JcqVO9XG67MBl
	jrGwKteiZr2xs68rJtKrYM/aJ1bpq8hREm3wmWG6rqKV9qAlkvcGeSb3LR6LabkWZOrceDUcqiM0x
	lxXhjrdBAWUox50j8MduoHjUqjt45NfmLFa6gckc5zsOFYYxkGhZbOxub3A4z3VWFOVt0TrrI/m36
	kXvnPygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5YC-0000000Bswd-0SOU;
	Thu, 20 Aug 2026 16:23:32 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Y9-0000000BsvJ-1z5a
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 16:23:30 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c1677c91969so1123466b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 09:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787243008; cv=none;
        d=google.com; s=arc-20260327;
        b=mwNntWBbRyxYt8HI4QkfSQSSuISqkZFr2g9xN9PjaA/O2101lrAF9yIMfDf5kd+/oG
         y1ZdaGEFJhnGPmwOpRYoy00L8DKvKA6ezMtP73vrl0VaxXjTX/Qc6/QzGwBiORzCjjuZ
         l2+6krn8eiAGhdGU56S2yG0T4nw/PFT+ozvRuNVenNpW8VnJ+Fiy4w0gphDgiil+9Ok0
         d9CQT1UqvhURfaHXTg2Q3LL/BlTskPePccRMp2Dqo0My+VgKDBMRywPLOvWAft0E0A0V
         JozXjnU4Exp1O9jygI9a+KlCNEBgYrvFX+rN80y1O9uoDiA5hULEUYhQhVo0k2URDf/C
         N3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        fh=3U/eDado3yMSrkl3AH36zSBSsENst6kwWEzBIoPkWT4=;
        b=rPY0jY4KeMyQcqz5djiGclxkYMeMl5YNpZoQVEDCD+3E4GDKKMdpqBuYFH1DmhxFPf
         y1lBwtiqWA4PDYRaxoj+3dhG6wfVzkXAr6bW9kOT9v2V6cl98+/+uZbpV2CnXpc2GWQ9
         6SMRmcHRGCKrEp+Ji6+20GrxPQ7MhJrxBsKY7Wt1RNWB/xVCeWKuofUjngJTlDijGjks
         e2bpxseoEvMtRaF6mRKoYv6RZJod5Lvt8QpfsEQFHDC6AEjxbhiKZxLUh0ITGQPFrwsc
         cwhqpEH20FcB5G3S3VInWxtvZX4drHL3/RJtpoiJ+g4Wh32r9PSGILe3klmsx8m3oFGy
         D6Sg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787243008; x=1787847808; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        b=dtaYYV171jUrwdgqahBBS8LFD3fH0Z4Xf8Go+XZhArdGCKOsreqSs24c554EwNt1Qr
         eW7V02dYOC9j3FDdbXCFGee2dWuuaJL9caape2LpIeu/2iFfk+WkDODlJJsMJsFQ27s2
         w5dSfismHKTCFetHDylSLEAXpwO/BQ/EPU4eYXAwXRv6sy3uEpwP9KLJWAvGfX1tjHDO
         ahCabHNqUIaWqUhgxFY2SvWR15ZrGY+oM8979gfkcoz5/3qSEZA0GSJtuGaRA4Dg++N3
         Yo5Ox3NZ0rSyPimtklOvgAtTXajwUIpF3wMZek0RGIthYkvP5YaaT0xIUu5mNT6zf16/
         7UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787243008; x=1787847808;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yKhR9WkhIUiBs/DXzAMG9ly3j13B+5WjNx96hhgAatQ=;
        b=EkkvzyqwmLsyVpYrBRKmeQUv1voVvpmlAA+6b9CvJg5z0uepxPEZJh+Z9B8n64ZQDf
         qL3BzxdeEnH0/IjDHZWmfO5DHtoUOKtvqIh/e+SwhBQ52hTrc/eZmWgWcUgtS9DMa7+f
         S4Dv2qzcwFcEAB1RBQZYV6CgyNb5QQWd/ZTFT3EYrEZCPy4j997Qz3YlKLGqbHBoqGCH
         gP3N9BadM1FY8E3gvXAlCVnOP6Y7Ztf9g/F2kvORSkV6UYipcm/q1DeMC89lvY9iDbQH
         B9Dvibtx/AxJk/qHGs4GhvsHzmmBf/LbLW8QoYx3XAUuRN3dwZQ22FZdj7xudBlk1vyf
         KRWg==
X-Gm-Message-State: AOJu0YyYlvWWGp/bW7PAorJ8jvvE1bti7yXxHHP4MGEifZGHwdCOzDLL
	eiQKlDYzmjAV4n3WsNlbAy5aoT/Ab6nBoMuptdtHHDA3M47lhiYosZvBdtVCTha898vDYOKYjia
	+a/5J3XilV2nwpWtybNEiJ/0tt/8x2/W8BxTk8wg=
X-Gm-Gg: AR+sD13fij8OLOj4Rfefw1WdZQqOEEwzPZxiG3fDCSfNwVRsJbn+JJAnTpPvG/FYYFD
	5AqJGrl4Pv1AYdrLIk1ENCl0UYyQ9dDXlEpOIYT36ffPkXrJH+4E8aYUJlVXRzUn+Lq2mWGM9XK
	1UMbt0/COkOs0bcnz7U939r9Lz4SgOkmR2VGsO2b6qkMIgNzJrrf046OZRn5eR8N+xH2Nr58R3t
	ZR0V0zpMiaU27/SVpQL817WKBeHIysET2LnN8Gr0BstrhdcR8+40gQb2vq02TNKSfCfJP1kSdCR
	sbhvNMYuiK2nwB957wichSLpzxg0r+UAyYNgTsxaOmQ=
X-Received: by 2002:a17:907:a647:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c23e86dd23fmr1141726266b.6.1787243007488; Thu, 20 Aug 2026
 09:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260820122242.120039-1-l.scorcia@gmail.com> <20260820122242.120039-2-l.scorcia@gmail.com>
In-Reply-To: <20260820122242.120039-2-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 20 Aug 2026 18:23:16 +0200
X-Gm-Features: AcwNN1WN15gIPFE-wS5GMikP40k9b6tUzSd1TSg8R6uNQUbH06o6RfXy9sJzOY8
Message-ID: <CAORyz2Lgo=teK89gxm6QBMfREY=_cAFN2TuLUFvwGcYpozkWww@mail.gmail.com>
Subject: Re: [PATCH v9 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_092329_530188_474D6638 
X-CRM114-Status: GOOD (  10.72  )
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

> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -40,6 +40,10 @@ properties:
>            - mediatek,mt6397
> +      - items:
> +          - enum:
> +              - mediatek,mt6392
> +          - const: mediatek,mt6323
>        - items:

Please disregard this patch/series. Sashiko correctly pointed out that
it's not necessary and actually wrong to provide a fallback on
"mediatek,mt6323", which was needed on a previous iteration of the
series but not in the current one.
I will mark the series as archived on patchwork and provide a revised
v10 once completed testing on devices.
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

