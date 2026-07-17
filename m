Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7992DC4451B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=; b=GenutF/Vz/iMVAwx1t8aYzvEDL
	xzF4dmSo2zv4JoHY/aKhmGN00OOGkjrEJ+Qcg3wn6UyROKtA5NExxLICF52m8Wywa5hm0hXwfzn1F
	FA1VRF8WVpXFrTnWw2Fjw3UUw3zAr70d8yupc8q4y09Pp9V6F8wxry/sbLrK6obmbk1pV28tLTst5
	GhmSGFxV8VDqWG5P0426SOIcO06DKd7LQO2YZtaUkrI6GZdzh3VH4IqaZxfgbzhvUomHqvQnHP+hy
	38kxvHW/IISXVsj3u1N1Oxa/n6Ya4mYU0dqyA6q/bo0cO/W6ZHmKEM1vvG1RmMz7S3otOIXEjD8b+
	mCEPFmPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkeV-00000002dND-1xhk;
	Fri, 17 Jul 2026 15:39:03 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkeR-00000002dLc-0AxH
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 15:39:02 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-51c2808dbc3so50598471cf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 08:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784302738; cv=none;
        d=google.com; s=arc-20260327;
        b=dcx/kPZ1zZksvYVtBFzOdLqwa2rj1WOwQcK0xXpE26UiMwZDiCBqlIiaq3Y4NgrrS7
         VXEBbfGVoqayG7S+2lOCFt9gRziwICwxlzZVhnXepVIgLoZ/2XIHjLjvq/jHKzYD8rwc
         e/z2AbE/Zgs78VdUjBQybhrRXg0+Y+9IpexzRqnYw5l5vMrY+mUx/EuqeOiOr4DD5yU2
         vq5VTnyvoNeypPXtDHSt3NNpFqttnkHZ+6BfzUUoTOeBbB7pfIJ6r1Y4812EiUlrpiiR
         nBids+brIl6lXelWkHSp6w/cwTLEbWMDTJvfSp2AujpG0q0nuwIZscr2u5kp1dlv5kQU
         /4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=;
        fh=wkMYou+1MGRaLjLMSjtAvxXyEc8jpvARhtHy9Z5sqQI=;
        b=nSzuAumQBpYQ9/wCFCOhAK70jWLdrs3yjB1cOIDHhnknR5Laz84mMDZZNiGlcRIylb
         lxcq25BnqoJpM81io7bP8iGuKHkUpnv3+/MhiIz5yT09VC5IElyU9hnuR2Y7zqZzgPSS
         D8JuBjLSYNp8B3KNPXDIYuZ67PwdSJR02kikeewygy56lz1bQBK3vibrXbmbf/wu3n7e
         ue3TNa++wl+vuncpVp+mwOxiJwrB6yWT+B6TE1U9S04DwfUQ06WdyNxUpkvo5yB3pocO
         0vPrdPV90z/ad1TZCT+a9uRRTSrNVd6SZovVtgv8s1IeAVcg2rZqkzWREHzc0+MzgYHs
         ln/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784302738; x=1784907538; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=;
        b=PXfrhIZcDwH7pnQmrPtxkirX9hwDK5g15BLHv42c1iGJbPWACVlr47q7oAS5ipGwMA
         5UA6+gJJCV7AaSEik44ATc4Ia3aBzHYkxe8Zpw9VK2DkzxUOBBPSOKIj9hERN6znWwU4
         mhmLnjYCPMAMG5y2qSdEtHbPH7mMFpYcWsGnwZIH8Xtv0Q+wja9OTchLkGU9El8TxON/
         aHgTc0cx+HwzdRLagBt7uHR2s9PNrsG+pO7Mq62ntD0GrMr1cy6ctyHlVE2OLwmFOSdO
         u7dV9DhBTvs0sug9H2O7fIFUhzyD+4/9Lsg5j8PRm72KYiobyRVqqFDI01CjoTiqyvi3
         jP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302738; x=1784907538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhrpYmMFVx06rokjDPKklo1tN6B0jx/vPKzFLz4wuMQ=;
        b=tXjpCUJswn60a8Ez9YprzneuuzGafz+e9JZbY+cWKkIKNhfZ9NJVJunOjYuAHmIw00
         Jr1I3zeKiAJRHHC3s5Hb9wqIL3pz0pZoYqCmi/duORZZgHPSzImPf0uGk6YJVLLKrk+1
         UF66kT1j5gmlA3DsOdaTjD1Nv7WTdDco8lzsiD7cYR8peG5uhQIKXzbbhuzK46iRrcum
         IaDDF3SvtTzVfHxUlYSpHNIhTDq0/Vdt0zo+56W+zDOkVgVqJWDZo54LXYhu/uBzeiMF
         qX3X7nAAEwZmhKpFQHjBT+aOc5HYSwqhxxGKVrEMKpwX4P++lYk+3tOJFysgrIkn3TEI
         PR9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrTWKmI63zBJHk3MyMY90BNOPCIF9tLjbawQoZrG8rnnWm2Np8OP5p4MXsSkBhGXUBpIWuowfyt1QqNEnYRXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YznurwrMg+cjGYfvXHLd/90Z1VsrQCvSpc/sjfbruDHo8JjBnY9
	BxYJgU7BQYTmyw3A+LieXC+BgMMlCk2dfBleYnrWROHvLoWa/J6GCdtXp0impTLArmR0uXePzn1
	tP/BfwqSNvtG1qvpEGOMtE9sbRxSHNBo=
X-Gm-Gg: AfdE7cmah/PBiI42QFHVLd49MlAud3izPPAXbmKoGB7Bzi2T9AKiw3n31IFY6B5uVV5
	Chq1Ga5Mq3q1OWJvhSnXKMCyrebCMHYJ+LfU86P3dsX2B9qw1WkWduQKK/UTfnOXTDy2skK71jp
	cxvMp5GrCp+588o8wXMdDnzTyoHfNfMc+0hKyk6RQJCUsZJkB3wyliMBGPwBpx8Z2TkM5fW63dl
	3ltSqTlerEbASQrBQ5/qP6zTFSqqCen0vOQ/bhHsLfNLTJOFySsP82HXLc5ew9fRc+wkvrX+VoO
	7Od/
X-Received: by 2002:a05:622a:5d1:b0:51c:bfd:772b with SMTP id
 d75a77b69052e-5213ea80af2mr28037441cf.65.1784302737601; Fri, 17 Jul 2026
 08:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260716161923.266315-1-akkun11.open@gmail.com>
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Sat, 18 Jul 2026 00:38:46 +0900
X-Gm-Features: AUfX_mwBl3dquzxsUOjYfNF9eon0dxcQ4kYle5GNTVWYorRVVQ4G71Eq6B_eMk4
Message-ID: <CAKr_iV76upuWauE-ad7ds5W+jA_aSCkCGsG4oKqC8KNQBG=JGg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add reset support to MT6589 wdt and remove fallback compatibles
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Roman Vivchar <rva333@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_083859_091293_ABE84386 
X-CRM114-Status: GOOD (  10.29  )
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

On Fri, Jul 17, 2026 at 1:19=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:
>
> This series adds TOPRGU reset controller support to the MT6589 watchdog
> and removes the use of "mediatek,mt6589-wdt" as the fallback compatible
> from many other MediaTek SoCs.
>
> Many SoCs have been using "mediatek,mt6589-wdt" as the fallback.
> However, they are not compatible with the MT6589's reset register.
>
> To add reset support to MT6589 wdt and resolve this problem safely,
> the series proceeds step by step:

Better patch series is available
Link: https://lore.kernel.org/linux-mediatek/20260717151134.678839-1-l.scor=
cia@gmail.com/T/#t

I'm withdrawing this series.

Best regards,
Akari

