Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57FFEE8B38A
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Feb 2026 02:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=; b=FncjfArTbXc+gNiU0d4z6KWhMP
	y1ekuxEEwVY8CNEjONMltOvdYsjlem2oQ1IBBaomrgd0G007/9wkM4/YMpcy1zY6XP8OkXEoj2RDD
	hMt70u7N5n7t30aJN3ZB5cd/NhH4Lt5hYHBLZyhESbjem7EA4dra4HQxbL4CTcTMWqoOLHL0NmRW+
	CRM5AxMW5kMfLHlNzhHqioGJIokP4ApSrZ7GWkevqO/0UVP/cQzxz/CrB5uzZCXiDAvNRF1Sk6ePj
	D3LiN8W5uEE2rqfN2LuFy5oE6ncOZec3n4KheAoLiErFP+fzJnHBfN1lWiFisimaYAvtMIeA4kxKk
	fzvnDo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSLo-00000007kkn-1P2F;
	Wed, 04 Feb 2026 02:10:40 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnSLg-00000007kjo-0JRI
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Feb 2026 02:10:33 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-50335b926c2so53860201cf.2
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Feb 2026 18:10:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770171029; cv=none;
        d=google.com; s=arc-20240605;
        b=cMa7Uifodqi6kyXCXtl2GBezB/viGkVtT4LCp5LM+eRRfx/KJrfwgAAnDwUx4ydCMm
         qoaZJoMMvY7KveVQ1YmnsTW/G/FWMuCnY3AY11Q+ZZ4tjO2CvyTxVYJhLZzMXZif7BYb
         edha9snt524+dGvEni96eTEaR/BcvzGUQkfAhpu9PAkdgGD/r/1vKEySniTIHhDq0beJ
         mXIlDD/0NQhSJpZ5VaU90uura2/wqfRsR+FWZqGLYRuT2af8ytim5blmEnoUvKQZo3qI
         ge96NQUIU2UkVkD2gIwU5Yr/WbOxuuXMRowINKfG6q+qNzxSRWN2cfgSEDuY+boqABRM
         OLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=;
        fh=BGy/qZKkuI0gsyOBxWvhkmaS1S0AT+2LbqkGR4d4gh8=;
        b=MJaReHn7NwBHSjabtzmOALhwAZrw43KJReRHYWvQV+g10f63jtm/9w2M6oTf4IZjEE
         JAZBoKnce0CdrH+wGSoeNLnijMFpNmy/Hfi51QMnZN5E6oYKqIu8tJTIKqZGZteLZ0mo
         s4w1gBDRP7HmMZTweBqD8syuBQhod9OvIKU3Fs1tX81ygewECdgy46H7kZNyqTPcIrvU
         QeqeKppP6grVehz1/+oyOU6DoP07r+CPl4LFzNL13M8NvK48Cdsz6wi7DbTJMfGra3HY
         3tvhg6anuLRXdBZhTvrV5T67cwkbw/ERkSeZL+VVD0MXTXwBE6qXoz9JDIkaiAJNguiw
         pgKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770171029; x=1770775829; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=;
        b=a2rntmM5+I3TM8GbknJXOnQ1XdYXLJFMKIXJ2lrD3Q6m/APmgyOWOCFUhTpd5lrnju
         xwA5e2q5TMXOz7nPgaeG3HfSsLCouN73XMVxkItqwfFZszq1Bj7PQh3vpXMy2VFvgzRu
         UuCu/r9R+p4lPOKSfOovn1fZXf6xB26CvgucOhPrNV2sWMzRETOWv8/qpBZ8+NCX15Et
         mZWFABtewa9cAtSXcnBgaSumutZgFailHH1f1pel1BZa7Q/fL9SIgFDJcX/ZEKlobDFm
         1P5XfaGHeMxAk4ReSdwoZwisEatAOu13bTNSOngDioju2Y0wsIhcFcXPid91ToysvMOZ
         lggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770171029; x=1770775829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cOu6uSR745S9+bQAypkT0QxhUNvKeyxB46bdyuWtD/Q=;
        b=nUrFqlKvmgZftyTX/crVSTOORRqf0XNHJEi2pkEp5+C6gWf+xs4yRp8K8gwwyuyMIk
         uEcI9J3Y6I+T6dgoFe4HABtuF/Tri7kx7Ci88WtdDd5CyCRVbLZYdhAnBVKWGgfIqFWJ
         i0TG/HGtKDmyoHG9eWihf/Bq2WN1dUNl/IKB6tszM5ZJKeAN9z7ce3Zfhhvqvcq/U5Fg
         zJ5+J3fN21Mrvge+CPuvywu+LV7Mek5yUkS7yJ5lkITM3//BX5Sh7GVZ7cd202YHg4LU
         ulCE9Euhd4aHoIB+UImaccEal6/XKaRUT4C6WVt8pVhmf3Cu7r7wtSGnCvrXLhf2tWkB
         KCIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWohkrZ5fW0M0WVEcdk5ZzAcJqAinsuBAV9UYqoNqgklOo+1yiUHWq1ShKpjadtpTCjx/BUcCYLEyOJJNw5/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdTayUk7wV3pKQjdVvxeyYUbGlK4WQ87ZoWq7eVvsFnaYvDWih
	x2HSbP1dMaKMOR4Y4ymPta+KhPQBXMYONMRGR6guviWSy4Nv1hrmxnM2zqDGGkbckjdRMEXwdPF
	G+DSkijYXhUsVkKg1JOieZZP3x1zck8E=
X-Gm-Gg: AZuq6aK9dt3NrrLGfipQJVlETVDJgAWdrSe8yB3dlPpFY4+ktMPDjI3KZH2lkm4g3AD
	fUJ+lg4eHdYE0Yxe18WiVQzwl8Gr3YJ7bG3+mSAwwH2aiTo5uLiFuKWdP/WK0f6rO65K3I3tmO1
	Qh8zwg0VMr9N5lS0XwadbgTxOa4vwS+Fc+OLvVmwnX+4ySJz7qF/1NRAZh1b5pwcBrcI1kWSt7Y
	/OJnl8j2el/TRgkaZ7i0lI7QFM/pPvOFRJsdcr5KNKdSZg5517sCECleaszhwxxgFOfHaji
X-Received: by 2002:ac8:584a:0:b0:4e7:2dac:95b7 with SMTP id
 d75a77b69052e-5061c17fcabmr19066391cf.37.1770171029420; Tue, 03 Feb 2026
 18:10:29 -0800 (PST)
MIME-Version: 1.0
References: <20260111053025.251983-1-akkun11.open@gmail.com> <CAD++jLnG-GGxmGMmojYwSE4T3F1NjCDY-f0+CFC_Fi5gMA9v6A@mail.gmail.com>
In-Reply-To: <CAD++jLnG-GGxmGMmojYwSE4T3F1NjCDY-f0+CFC_Fi5gMA9v6A@mail.gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Wed, 4 Feb 2026 11:10:17 +0900
X-Gm-Features: AZwV_QgfvhSnRe6BSdFh2YHo7w__KWTzGBs-jRKflpMXQ7zpmGAbD_Bihr_xlBA
Message-ID: <CAKr_iV4jBCWepn+ve2tYXncUocsnLyqS2DSebW2Wu4=pkRs=Lw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: remove unused drv_offset field
To: Linus Walleij <linusw@kernel.org>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_181032_626837_B11790CF 
X-CRM114-Status: GOOD (  12.72  )
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

Hi Linus,

Thank you for picking this up and applying it!

Best regards,
Akari Tsuyukusa


On Tue, Feb 3, 2026 at 9:34=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Sun, Jan 11, 2026 at 6:30=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gma=
il.com> wrote:
>
> > The 'drv_offset' member in 'struct mtk_pinctrl_devdata' has been unused
> > since the driver's inception. Drive strength control for MediaTek
> > pinctrl drivers is actually configured via 'pin_drv_grp',
> > making this specific offset field redundant.
> >
> > Remove the unused field from the common 'mtk_pinctrl_devdata' structure
> > and its corresponding initialization in the mt8365 driver to clean up
> > the code and avoid confusion.
> >
> > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
>
> No word from maintainers so patch applied.
>
> Yours,
> Linus Walleij

