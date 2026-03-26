Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669E7109E547
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 04:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=; b=fT72kEdKYErsbyVVZMGh+BoYUX
	eisONSpuFHIGP6xN3GeUdDyC9FCFCMjDks1wrfTPDBttJaNbNLEwzr8hb+vDsnY1OOrwuvkp5qcdp
	3ZT1r4NvvIQtDAbJuMgUi7XbWrCgbJRRT98k+w6nlD3V6z5xuMJ7zxTHLhmv+Ic0F40VUd9eKcx+K
	noul1mac/jT790xtx2YubQMG6CUIbFiE9SL+PworAIrXk5Fxkrqz8g06A/kp4eWDu4pcc2/3Qb/5z
	+I0NmKWOP6kR9Q4dp88+mqYR8hh+vt/OHV23G9ER+pUwYFCovsh7c52+3cOv5qOYj+FT0avcJUUUQ
	VY34YA5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5c7M-00000004fCo-3hFq;
	Thu, 26 Mar 2026 04:14:48 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5c7K-00000004f9P-0pZI
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 04:14:47 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a159c1e65aso572429e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 21:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774498484; cv=none;
        d=google.com; s=arc-20240605;
        b=GcXfqogzZu2BA91ADBkaC/e3GrG2iukgWPQe1J77UJcbSW8ACcwZQ04NRHH2lVnC0q
         HF5FhAsbAfwufbEOpTwhRpwLbKE7nuDEQntMOjnb6U5NR6wAH4as8hybWa1FURrPSXCB
         qh4sxbarkAkd4EAW2hf1AimG7w3/tZ5j6Le37UOFXikTMHU1npceEYPoIpZuklhwXTPj
         6l6JFq2ltnvNJsd60eY8yh//U6UahVSZ7vSRK5bwGS+unwEQZSTItMSvkB+4wcXah5Qq
         mlF9yZlrcJznv5qMcduF0G26BhZNgXrdBDeZgj4hBq1gZ9ph1xQT9pYSIoOvlWRJ2eaQ
         545w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=;
        fh=UnDJDEf0H3xBBAauMt70KRj2ByAEtzWJpSWB6w7ZFvg=;
        b=bAyanlqXqRs7E7MHnwYzcjb/pu1Gn/BXiQjB6dwnIwHc12gALsQcEbVawa3tYbYnk7
         PLuPtJG8zLkgBjuuK90liBNgiwQO1Nv3rfluzGp7Sh98jyZNnznwp8e6YNDDPi5X3u7K
         UvY4P2X1Gjel4RmAiEQGY/y+Wy+cEZrOaxBL3NXwYPIFv7qM3FIm/QnWaBc9ZM+WjUY7
         RUjpOKx3SpL/3fCXxLnGGZEBUeWcXyoCatb2OiSA5A7/t+r7ongiOBzTLC+zCbAtWyz0
         6LVkBx0ukJ6X26B+Leq9I+y0BLznhJXoDCwGY4M9ijnAU/Mfal0OWZqSCWJ6FCkx3rr8
         B98Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774498484; x=1775103284; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=;
        b=dJ/5WGwXV4lQj9ljO0ansBsAkqS3gAVGD8oN+FhVDin38U5cU8rJmT3fQCLfV/jQoz
         tpfpNr3poDzef2TTPHYnbSkX9JsKlQikE112eS/vgocViH+Dp0ta+KNQbmSkgp9F5mu+
         kGFxZoK9AwkSpXWWP7EUtol04shJ4wes40G6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774498484; x=1775103284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=de7JHH7k1zqX8/9oU7ziLibktmb15IDmP+4qbS9sqKo=;
        b=ifPl6HTxS3XR4drLwsiT319DusfOS4RruIHcz3ZfSwBOD6ItCj1+AqXjJgu5hLv1JM
         lL6NdI1jhAzTVrsZiN9EO/Gj6Xu8wYS9spjo3ExvUUVGnYb/94aTJklVArEeLXdBQrxM
         2Y8WY4qY/H2QTw+e7Mqty2PU0fnTCPffGIK25uEXuY/1kos8byh0AdrvME9MYQbdLdyN
         HO5RvwV/+dEbquz6to7yPH6WXtR/0+XafsIJ8UdH2nTrcFzpzfPIwo/WkJ6es+tNkGad
         /3Wi+8moPmT3YzfNLk9mVYtJyHTFXhDx4lpil2uRVEtOISxGnVbyOl4KtZ2+hQNU98pX
         i8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVFMggKicvJH0cnCQzXZcMWtCRjR/o7854aWztt5azn6JE1TqfNyasL69IWfeJni/oYQJqRTUom3HsXOOkFEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKAsRwp63hxHyJwVzIJoT/PLjaIJlzjsZeo7SaWh6gkrlxbtq2
	fKNBQDP29XJdqL7heL3FeSKiETGIJffzkas5nsbfFCXX9M1vQHKjqYzNQlqSyRYMgkm8OUpYsR8
	unm3yMRva1ctkLJaPAMgz9km/WQAjWWizUJF+3OtR
X-Gm-Gg: ATEYQzzXSV7mnyWSKUyTbKm8443/lxVLrX487tDUeF6oz7B4RQJ6e8QZTf7Xgu9JJn2
	xcdrkAYYyDZltGaNpy2bVzrenrRmv0PtGALgMx+gy3plaCiQ+fNrkaKG8U0HgOtDdSAKsFUo2TQ
	5MaaZklasi89dA229yCgEbIq6kNES5py5RGFnfcpce2Aa06o1j+IVZ9VGgvNtvwTpoAKEIWTw9E
	AFxRvmlTWSmbBPqALXLEi2RX7UEsCrmzEtsuKudPGZ21j7U3fsy8DnRltsTeyfL49OwGnX/HO4o
	EyQ3bXyGwlJy7kaeB+VJmyTAZzdYqRh/vz1hig==
X-Received: by 2002:a05:6512:3ca0:b0:59e:65ff:e57e with SMTP id
 2adb3069b0e04-5a29b976b9fmr2386806e87.12.1774498483909; Wed, 25 Mar 2026
 21:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260324053030.4077453-1-wenst@chromium.org> <20260324053030.4077453-2-wenst@chromium.org>
 <20260325-uncovered-carp-of-inquire-8a7acf@quoll> <32638731-8f33-4203-9e68-1170cff99280@sirena.org.uk>
In-Reply-To: <32638731-8f33-4203-9e68-1170cff99280@sirena.org.uk>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 12:14:32 +0800
X-Gm-Features: AQROBzDMA30fJWTvgwWnvWVXSov1HJF2nrcMqAj-rcI0Dx_RnI-WKxTXLlei1no
Message-ID: <CAGXv+5Fo2GmvWQGogA-KTsFChE0-SOwWek6BQ+ZA3xaXup_z+A@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] regulator: dt-bindings: mt6315: Add regulator supplies
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_211446_320054_D5BC1A36 
X-CRM114-Status: GOOD (  17.70  )
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

On Thu, Mar 26, 2026 at 12:55=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Mar 25, 2026 at 09:56:00AM +0100, Krzysztof Kozlowski wrote:
> > On Tue, Mar 24, 2026 at 01:30:28PM +0800, Chen-Yu Tsai wrote:
>
> > > +      pvdd4-supply:
> > > +        description: Supply for vbuck4
>
> > These all look per-regulator supplies, so I think they should be in eac=
h
> > regulator node (see also regulator.yaml).
>
> > Or in top-level, but not in "regulators" node. The regulators is only
> > wrapping node for children.
>
> > I wonder what should be our preference - have supplies per regulator or
> > in top-level node. @Mark, any preference from your side?
>
> The top level, so people can figure out where to describe supplies
> without having to read the bindings so much - the supplies go into the
> chip, even if they're distributed within it.

OK. What about the more complicated mfd PMICs? We already added
*-supplies for the regulator side of these PMICs in

  - regulator/mediatek,mt6358-regulator.yaml
  - regulator/mediatek,mt6363-regulator.yaml

And my other series for the MT6359 also adds them in this manner.


Thanks
ChenYu

