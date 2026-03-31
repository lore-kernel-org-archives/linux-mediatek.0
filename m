Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006EFFF60FB
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2026 10:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=; b=OdK/4TcjhHMbowYlpyacwVPLip
	LNpgA3Uslhn3twfIguBC6mcBib7itUVMwMof/Xlkuduv9dLJtVVM2/sAojveDStRnM532MEbI8B4E
	aoVYhWsP7OcHt131AUxrNhP7Mgl2fCw/SjUD5qm0Rf/CUrzCQKgki7XfkPhfKdXuWvUpDnIPcAOvd
	EJ3LcS3gdFOPA4+dgEO7bg1Yu3+1gJQ1b+kNiV8m/DuXgWCzIRZOipugy+ldYS5LsgtbCRSjesTRt
	mubrDhKZdV7lxUlLzdtB4HqKUsOaqS9/bkqRyNiofxxHIiQmLAg0fN2XPX2EmQftdzWKkG8RVSvw2
	QJC7dZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W7y-0000000ClPb-1e8o;
	Tue, 31 Mar 2026 10:15:18 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W7w-0000000ClOv-039h
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Mar 2026 10:15:17 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a2853b1f8cso5450535e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Mar 2026 03:15:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774952113; cv=none;
        d=google.com; s=arc-20240605;
        b=U97R6w0gzsSP1flQgzpujtJKFlEiTkQIFTO7WTk/mdFYobHwKjRyaldS/xrS3gYJEB
         TiHK2B0DYzT+muwH0BsEnPnI7ECuUvIdPmBV+bF8zDALWPAyW3VasQuv4Cb1yzVTDcYh
         2rBN9scrJGh/69ep6dO7vI83OtxxS3XYs9j3UhbUNr++HkxBv1WnYNSX6ukp1BBtD8Th
         z4+3hENYiEZjhncpwQgAk2nUbNcJt6P8ih6X/lKvWLRzSPoVvs1HyUhnRG9C7Ix756Yu
         0M16e1YYU6KlD2szEExn6QHET+aAxl8dOTD/DADP5OCkwhboZGE24jnwSvAvUJNqnnC3
         B+2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        fh=EQ5UEnx6QyeXfGKUHwhFsPqXI6d7uaWnUBOpqhqbf2U=;
        b=VnhE1PHSMg/DMlPOfSQEY8eq6A7qRXEMLe5OQ8nxbM3X6Rst/MH8AmHNgLfuAeHPaE
         eoeiX+B2uTkmKNfN3GSxGQEetqMj4qnsTcYEksI98EFs3YRk+UzzBnZRHWhg0flC83O1
         7P5NgAPOfr672MBUBnOchqXTDjJorGuZOvGOFKbY+OaMZgF2bp+3Y/z69NDFzLicXJ5w
         B2rlJ/r/0S59cwSi0cNyY0bu8SqEJ0kxqr02CXcL/NYABsol1qfVeYzbTLAFT7HoXUCr
         KZZ967AqELwmZaqX68jDE2ZkLVHy3hQUnr4s767xkyKWZ2JkWg73liyzrnzZnQ+TILDN
         SfHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774952113; x=1775556913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        b=NvyfrSd7fLGaHmiYyvT7KWPdfE1COYswL0cUVCDqUz2Q7WoxSxhvbj7FC+UKbgbOoX
         ebwRZLkeXz6ZGmPjU8OD251gOLZStz+zQCEcwXWQvyoj36pRX9EY9cwKWFIdmiEqCDKs
         T7in7msT03bvhpdxAMejotZSb93jXf99Uf/uo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952113; x=1775556913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwM4Dg0oPoF1Vd4vmJzcbvBl/vV3R15yI0dEAidybMw=;
        b=C+zDHIp5FhNBfNM/45bG8pjiayh2Kp3Oc9HyEvlzKngbHQctc3jzdpnlINAs+FllEV
         u1WMapMH5srhMwKL3cIuYd3qt/KXhrXAaC2AZy7k4pTCLxEaFRf4JXrVdMIpEK/Q7R6u
         8ANwVdSj5KgEpwFFy0kv7s4NVV3RZUAueirn8GMvfRc57ifBfzTOrkgpWPhNJTiq76Ll
         SBdcdvsQPRUpAW3ugpYT0/rQmism0HkB6rdpaWovlUQ/x2S+CISg2EAGfbOenkr/hKr2
         7DISMHovmZxB4PDEWOAgnTA1L65vAF02M72PMagsG4DqeneUVvmLaqcM+ICLNPRHJU11
         TpcA==
X-Forwarded-Encrypted: i=1; AJvYcCVzK/KbpaSj8oWvWT+DwbM5Pwl2IbnizZXPBtv/Nuc3BCRBeYe9PcVlJBGuIDI3T5oiboWlH8jpHWnR4kOEUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHSHuzYL2ui8HeW6nh18agdlGa6bJ7+zCltsuyv3iIpkgb3JL9
	dMAAHeB3tizP3JzIV5Ft4+n3P2BGqaCZH3pCx7hCpgV1LXNKg1sxDZO+auTpiyFCj0oFZbdZy5F
	APzRmXhPMfDc2X0IFYhYg9AWuxLkx1SCpVXmJ72Yf
X-Gm-Gg: ATEYQzwz/dYHXzStPI3GG+GijCwb7bXKL99i+hrVADRpD/JdAFYsRjj0RrFS+GhXELD
	8ZwfRMTQ2O21h9VOzGJBxHfk+ZOXQeuy4NW+skLkXvQRU8fwEdwPKBIePbDiAZZPUaVUd1UChd7
	X+E0AZFb1x4YslQ31kpgrKpb7icXvndeoxvsf/1h7vnk44BJ/fI9x/8ht1apS3sar26ptR4jcb9
	wo2LJUyh/s5cCatiUriQgQSs4mUHZTMX0Z4SgUCJ9uizHueTZIfKSglkgcdHP94gV5KUTo7DXqw
	+VR5GxLaW8eSj+WIm8YNsuUx5nhLyFzVTunP4Q==
X-Received: by 2002:a05:6512:10d1:b0:5a2:a5f6:dfce with SMTP id
 2adb3069b0e04-5a2ab7ea285mr5687077e87.11.1774952111900; Tue, 31 Mar 2026
 03:15:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260330083429.359819-1-l.scorcia@gmail.com> <20260330083429.359819-2-l.scorcia@gmail.com>
 <20260331-flawless-bronze-lorikeet-59a6ff@quoll> <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
In-Reply-To: <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 31 Mar 2026 18:15:00 +0800
X-Gm-Features: AQROBzCSfOwC7PpxPWsVcV8RwypXUnG7y9-g_GLDlmzGCrhYIDEBqda8qgwR7SE
Message-ID: <CAGXv+5F2nMwftF4JvXLuJr8Oz9VSoB1f1qq9mPcMYegmJ6BP_g@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org, 
	Fabien Parent <parent.f@gmail.com>, Val Packett <val@packett.cool>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_031516_060079_2A55D730 
X-CRM114-Status: GOOD (  17.91  )
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

On Tue, Mar 31, 2026 at 4:36=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> > > -    required:
> > > -      - compatible
> >
> > Not really, this affects existing ABI and might make the child schema
> > being applied. Basically regulators node can be anything now.
> >
> > This is definitely not a binding we want. The syntax for parent schema
> > when listing only compatibles is requiring this compatible. You cannot
> > have here whatever empty node.
>
> Hi, it felt quite strange to me too, but that's what I thought you
> meant with your previous suggestion [1].
> To keep the required attribute I would be happy to reintroduce the
> compatible here, in the regulator schema and the pmic dtsi.
>
> Before I do that and resubmit, could you please help me understand
> what you meant before?

I think the point is that compatibles for regulator sub-nodes on MFDs
is no longer accepted.

Instead if you want to have a separate binding for the regulator part,
you would need to reference the binding directly.

Say the binding is at bindings/regulator/mt6392.yaml, in this patch
you would have something after the "additionalProperties: false" like:

allOf:
  - if:
      properties:
        "compatible":
          contains:
            const: mediatek,mt6392
    then:
      properties:
        regulators:
          $ref: /schemas/regulator/mt6392.yaml
    else:
      properties:
        regulators:
          required:
            - compatible

And drop the "required: - compatible" part from the common regulator
node bits of the binding.


ChenYu

> Thank you!
>
> [1] https://lists.infradead.org/pipermail/linux-mediatek/2026-March/10506=
0.html
> --
> Luca Leonardo Scorcia
> l.scorcia@gmail.com
>

