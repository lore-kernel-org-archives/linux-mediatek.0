Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB1CC5AC80
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 14:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlbS8rmt2cYpD1ter3Cf3FlZcyNn+LlDqDW3OC/XsAU=; b=baAFzObHQLE0b1Uw0y8X2DdyJc
	rUAF/mHk2WEFn8LBKEEgqTiNT+UQ7pZwI4DJzjY41SeXQEK2GpwCSKDUYGZ1aE0IvOUm2QK4hhB/j
	XMeQ+MRM3/3D2+IjQIBNGFOeAnJftNaHRM4FJgAak6pfQYru/wB+Tm67TxNocwFyqPfHlwaqBcjna
	ZSoLAHtsGDm8LgkwKAPffR4aSViupRlAxgSR/hLQXH1jfuZ6pEGK7jhw1JtQ14VhbDG9iGqOTkLV/
	sSxUfqUnTV6syaP+WtbpTuqWv5fZkVRZrJC+hkcLW0fSyAUD8aBDdPahH3K1VoXVX/7a5HD2+dd1s
	UhAps4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt4Ie-0000000ANNm-12rf;
	Sun, 09 Aug 2026 14:14:52 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt4Ib-0000000ANMr-1H17
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 14:14:50 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-529a1ee0e62so7488221cf.2
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 07:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786284888; cv=none;
        d=google.com; s=arc-20260327;
        b=Eby88NhmMWuKso5GGQVbAPa+++rH4hCbNG/Tynwges6+O91hhV3ZwMUqJ3+ss/sRN8
         yX/Kcncx22zPjIwxPTjL0+5nQ+lCfamhAG6DXXppNAtLj1/00YXq277jbZEHauGZe2Cx
         yz32ndyoxMfHGXnZRmq0qEqqTOYH2xI3D+LmpjoX5JJG5Jhjp8Q3UDgr8PdNnzubGugV
         TAsUnht4x9XoujmS0hdssznIpICxuFHYPn0RWwrYDQRr8w/nzXuT7dKMfZ4JhP2gqYIC
         2vWY29zduB2jlHzGlZV7G/dSOySaBy6+TFwcX8Jf8ilwBzj4RabipFlE5Dyy46kivn70
         CbJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rlbS8rmt2cYpD1ter3Cf3FlZcyNn+LlDqDW3OC/XsAU=;
        fh=JSZkdZ6hBvnZCcaJlxhb8bmNfHUVCsaCJStMhDixl5U=;
        b=pwFBnlEDO+fXzMZSR9i6pbBt0qnU1gFNSfS5Fy2L7DOWryBfsoTREvR6X9pJDQuxSZ
         1rsKoS8SwDk+Fs0BIIpspRlR+zs6vqKy6CyNNcPCeVADnShgaArxPLCvx00W1Qh6wd4A
         3aZoub35e3wIfRzSsjT6+KSyX1GmkxTHadn9Kxp+VwJOfO/i2/yr94EV6ZCZWQtPQuA8
         QIK39cXKn2lcg1ChfSzMN4Yj/UU/Buy7GZV56vwuqr6EzG6gIYbohUyzGwrZ3dhuwcA/
         Lm2LXiEiTmdOYE9+Bx4U+TwbBxZkUD1GBwACmnEEDNy0QFyCd9x2ODl7KbP6S8ApoKF8
         HFYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786284888; x=1786889688; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlbS8rmt2cYpD1ter3Cf3FlZcyNn+LlDqDW3OC/XsAU=;
        b=kDc4S2c1AdPaPU62FO8MezOpOtgXYmUda/HqRvxGGUuJZGUEBtIZBE+nWJct0TR25E
         EYhh74zwN6iee1CPxZu+FSIc7Qn3wyFOHLUXRTXwB9ZC/fOulgox4+WgZ2yNe7aQ2gMu
         1mJ+Zl8p4dUuuDK9oJd+l1lFiJFcWF91wR0M5OWnRcHJ0beOHYRnsSRM8W7cyM97eNkm
         +FhAn2iMssl98LRC5Cvig3MrJFfMGfBBeAtse/9CJkN6nOYVD7pIZeAKFuhYVAZh3M0s
         9rVv3xDg+wdbK+PwyANNkoSP1zGuCbYalmODVqpjXy0VVuA3ZlvkVBrj6ZVfYG6TaTDX
         27Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786284888; x=1786889688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlbS8rmt2cYpD1ter3Cf3FlZcyNn+LlDqDW3OC/XsAU=;
        b=hUwgyyjxWE3rLH+HFIn3x2+F3T4zh6dkPOlb9FM7KCJ4vLKed9RxeTHQ1OH8kPbGhM
         qFGI0kZ9aEu1CGnqGOczRBnB+sy6Sp/E+c1bsWbTZoKsnZPMhoA4Gdhoq5tkRZ6cabii
         9dXB8/XMMTldRFhWtX81KC5Z8KnEXxZhWN+6iI9J3bagIzSyHrZXyJiWBV2ZVasUC1wb
         PV5ieS+m2+/sLBcC8Zbe9UqqpJ/IlCYUUhajqQ2r8060qo7wFWA1sa2WlfHeRIS2GVZU
         n0LTxU4I4Ts2kFT/CRF1DJlcF1Pd7XfFGln+li7/FJ/pzC6PVDpE1X1Af91vtdkw+sor
         lHZw==
X-Forwarded-Encrypted: i=1; AHgh+RqOyB8ugP2NTIvXpVQeH+smJkK/LgetheqrU15HIWgUSvstIw9XjNGEFMCqTiTZBYMDD/ygdHk5OZUHutyiOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXywwFMQHdJsvObWsR3HvLQeHVh/kysaPiIAl4uPkozNSObLjY
	irKcWmUp0VAJeZKAlIdbMrpa8stgO3PUrbH1rkhq/02+sZEYJDSOmcqd25ECse5LTLcD6nopy55
	PZIipYFLAa+MKV3XCSQvb+W7mXXBmNww=
X-Gm-Gg: AR+sD11OYDGL72olTUkGQuX6RwyAv2waNPiBCDnGZBpeco/4kc88B0BsxdWp5ZrsZv9
	Uo60r8IcwWwGWa284gX9Iz39XZvUHbIs30xMLPRHo+lOMJQDwbiRdemdsXLGfh/5phRjhTaQ6wD
	0qYyJKuMTG13pa+jZ/IhzeBb+DPgGxFxbzCJpwauANkisJhTr1IfdYs1Ms/4aLPZaF9nOp4+H89
	/IxagFKZzn+sMbnxFpwKnYzs9Q7+WxCvwwWr/QhI9eXXeZDgDp7FtoSZe5JJYyXW4dqqOu05YPG
	fyOv1BG1SdLapPLM0AdN3slDTDdDlkxe/JqrJe0a3w==
X-Received: by 2002:ac8:5cc8:0:b0:51c:6e:ef23 with SMTP id d75a77b69052e-52ce61b5defmr411182591cf.32.1786284887884;
 Sun, 09 Aug 2026 07:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
 <20260807152059.GA39821@bhelgaas> <CA+_ehUxQfWRRec4q2ZvC12nYAeV2VGm1xCFrTWeN6sEL+qkXBw@mail.gmail.com>
 <e41835ae-b575-4364-855f-6708b15b4db0@genexis.eu>
In-Reply-To: <e41835ae-b575-4364-855f-6708b15b4db0@genexis.eu>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Sun, 9 Aug 2026 16:14:36 +0200
X-Gm-Features: AUfX_mwchdsWKWBSl5_tblgDoEXHgnY_TIC1M0M_ze9LfMJB60Ic6Q5YNmA7c28
Message-ID: <CA+_ehUy6bAq564+1c6KMV+egnXO8S2GGaLrRq1aDik9gWrrKyg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_071449_405579_1B8D65C3 
X-CRM114-Status: GOOD (  35.73  )
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

Il giorno dom 9 ago 2026 alle ore 16:08 Benjamin Larsson
<benjamin.larsson@genexis.eu> ha scritto:
>
> On 09/08/2026 14:12, Christian Marangi (Ansuel) wrote:
> > Il giorno ven 7 ago 2026 alle ore 17:21 Bjorn Helgaas
> > <helgaas@kernel.org> ha scritto:
> >>
> >> On Fri, Aug 07, 2026 at 11:24:09AM +0800, Chen-Yu Tsai wrote:
> >>> On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth=
@gmail.com> wrote:
> >>>> This small series introduce support for 2-lanes mode for Airoha AN75=
81
> >>>
> >>> Just a nitpick, but I would probably name this something else, like
> >>> "cross-controller lane-bonding mode" or "lane stealing"? PCIe already
> >>> has 2x lanes as a standard feature, so this naming is a bit confusing=
.
> >>> It's not like dual-LVDS display in which LVDS is only a single lane.
> >>
> >> I suggested the "2-lane" and "x2" terminology because I assumed the
> >> result is what the PCIe spec would describe as a "x2 Link" consisting
> >> of two Lanes.
> >>
> >> If that's not the case, maybe "cross-controller lane-bonding mode" or
> >> "lane stealing" would be more accurate, but I don't know what those
> >> mean, so if we use them I would also like to know what the result
> >> looks like in standard PCIe terms.
> >>
> >
> > Mhhh I don't really like the term lane stealing. Also cross-controller
> > lane-bonding
> > might be a first. Even if correct it would complicate identification
> > of the feature
> > that at the end of the day configures the HW to provide a 2 lanes PCIe.
> >
> > Consider that in such mode, the other PCIe controller gets disabled (th=
is is
> > handled in DT) so it's effectively enabling the standard PCIe 2x lanes
> > and apply the HW configuration for it.
> >
> >>>> SoC. This is needed for correctly functionality of Eagle WiFi Card
> >>>> normally attached to this SoC that require a 2-line PCIe card to
> >>>> correctly work (and give the proper performance)
> >>>>
> >>>> The first 2 patch address a limitation of the PCIe implementation
> >>>> where the PERSTOUT reset were indirectly asserted and deasserted
> >>>> all at the same time (for all the 3 PCIe card) with PCIe
> >>>> enable and disable.
> >>>> The 2 patch address this and introduce correct reset to control
> >>>> reset line for the relevant PCIe line.
> >>>>
> >>>> The last 2 patch add additional logic and support to assert
> >>>> and deassert the PERSTOUT and also apply the required configuration
> >>>> for 2-lanes mode.
> >>>>
> >>>> 2-lanes mode is implemented in DT by adding the required property
> >>>> and by defining the "num-lanes" to 2.
> >
>
> Hi. Isnt this just pcie bifurcation?
>
> Logically bifurcation would need to be disabled when using 2 lanes in
> one slot and enabled when 2 lanes are split between 2 pcie slots.
>
> But I'm not really sure what value a bifurcation property would add.
> Isnt the current schema enough?
>
> The mt7987 will need the same logic as it can also bifurcate one pcie slo=
t.
>

The documentation is not so kind on these kind of details... and no registe=
r
for bifurcation... maybe it's the mux one? But the mux settings comes from
reverse as in documentation that SCU register is a good 7:0 bits of
data value...

