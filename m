Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268D1F5A8BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 20:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQ381gyFls4AWTGtbPx+Abo8y02DoEXmdw8t9bbWC4w=; b=nEoZZ6pOgvmY5wCe4O2PKDvhzg
	3WXK9eG3etwKr+X5hMZycI119tpdJnuqLTirhilreox46dXQvX5yxVB7t/wN3NjhCKW9NJVXPReh5
	h0MNjYyVMYvNUMXY4UtPsypx6nF7mtYNMBof+aTTNmxI+I34zaMZToBUrU3JUB/r1Tbi9KH99ojPn
	cBpaK3e8qyDD+fFHZpHTvAnFuchiyU3lW12kX3pa4fq0VGTFALKTAcmZFlqz6MhjiWixj/CXWsz8P
	sBHsUHN7vYkI1Jh5w/eEGPYdUd9v2ZyV4B6r+p9iMnEOo/Uyx0Y4fiKN3dalkdS9F+mVc+YwHEJ/L
	B4w5oFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvWR-00000007e5N-1r1d;
	Mon, 20 Apr 2026 20:47:11 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvWO-00000007e4m-3m5g
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 20:47:10 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6501418152cso3192233d50.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 13:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776718027; cv=none;
        d=google.com; s=arc-20240605;
        b=SI2p5cqxJ2ptVDeaalc76PKwgLSsLlYUirsBOxAmYsGRqwCrVT4OHAH+E4Diw4gq4s
         s8sAU2LfGJ+d860ZbZBJQqOnloOvMoT13J4VarCofTXXlsp+KzyY3BsgW/kT7cx0SBi3
         xZMdMbk0IRM3mQsomBZB/YB/ZnRaSZnTFIOAJX8EUKFgylpaBz20owEsSETg6G8CPord
         PprUZ5qYz/pmzTVlNCl2feN5R2ShPQb8PyeZocsHVHtTpMWxffR1+RMy0XnVeA8EHWfY
         fPVaUfv5Yqi7QnUqe52xAcdppsD8hnNapNPprwi4Xq4qU10w8JfsMPbTVcs1pna9lZE/
         QAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EQ381gyFls4AWTGtbPx+Abo8y02DoEXmdw8t9bbWC4w=;
        fh=bpVqMdELEaZMM0mQisKJ/ZtrMV7RsAc3BeXEf20cu7c=;
        b=SiPcTrA/jktBsNx408rNAR3ZVUdLCA+EKXwbqCNu/BrKj6XJSpu7gkJfAdG1jgNAB4
         h/160DsVAere8DyJ0D7l18jOcWy27cp54OV/CAZVVVfEMz/zPO0qXQXLxeBO3opQrkT9
         +mmY+JE0h50MnJ1aeN7RcIWJxJFCoM3wLnD9yv6iTiaGE3zWIncSV9LVT5VWOmc0jiHt
         xGlPe+ViZVmJCzFMw2b1gGTnQDwf2zA2GmKLnTqjyfhhioLQsHd3/OqSKDJ83XQ8XJYa
         TI7FjG0ZMmUw/RsXul2m/kHe2zE5zkfi7hF70gu2UvePTLMbVFeCtbbjlU9TyMRlT5+C
         375w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776718027; x=1777322827; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQ381gyFls4AWTGtbPx+Abo8y02DoEXmdw8t9bbWC4w=;
        b=NUIaK4EJ8IxfiSDGRiNEuU3J6QDJLLRkNzhlQSKh4lv72XWTY5+UrSvB4H1WmtIt/f
         +lcBUo2r4r1S0UEfDSVyhUiRDRbCiURA3pzhifIgvJPuQQtxm1R1sw1CKcP0HE4N6xNa
         FQtsgSh0yiEVvhd8iH+NCqVEnYI0Tge7BHNMy5zL3UETwESj8NpB/0DJmkkRtyss4oPv
         vpJH9Wxr21j5UjuYBHd1utiB52VfkNAcS5Zmiwv5PiSy5kjfnLYmU1wxrPig2w0c9ALY
         PWe1P3PBKlULeYLS3AXm0FKxXJvP5DOv4VuWlDRWOOFFEqrOEH6lbGAmQm25F/OVI0ir
         itOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776718027; x=1777322827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EQ381gyFls4AWTGtbPx+Abo8y02DoEXmdw8t9bbWC4w=;
        b=YPAt0wGcklPPtLHyKSRMUrenDpkYOPrDobMQGrg46LUquBxMlBTH6sAUNv417Lexcu
         wxe9inRGKoRbPndN+9h9oNrONeAuljjxA4qI78L8YLnR8AuOQPbpDOh2pJ7GONh4KsF6
         suXdcVdxwbLQe3+TRpzSkSdvAuzGY8t6j0nyEK+uQVHz286Hxkkr4Td5XClXEx7Ql1yN
         ybeUGRoPIXPFXwCn97DXCzTUoAJ218i4T3vu27AB6CZnI3M4tkSNbUXr/c37NnxnvYsp
         R0A1rmQNv3eNFTxwiGqsk2rlBneuV01eMu9IL7FThZWrXukjw62icUjh5nRjOu82qD54
         vDcg==
X-Forwarded-Encrypted: i=1; AFNElJ+jwR5dynxcpV/Rz9mEof/seupo2/kr9vldIJ1FfTqRmBqOQHhr6i9YLbkmBDpYP/HOBvDuCEPFIHZ4cbHLpg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7WoHBzanufIr7hjY0moPUmVEOWTEcepuSklVHVXXzqMSZPkih
	i3V94TJEvCuTirbHjyEEb6dc4pjCeD3YfPE+vkcGyARc36ubb17B2EWm/zR1pja5nLwj06NuK1I
	jy0ETNjKcSc3/7NhwVSAtAlZG+78nBr0=
X-Gm-Gg: AeBDieth1DkyA5uT/BudoSSrYoz5H9G+RK/M5cEQWFTCRBwr6QYgkrMvgPEq7TnBRMT
	NgZkKxK1ccIMrULUug84srvD5btt6mnX6xF/FCd42WqJ0bcdxsSOntddsDZC94Xpj4hQRtxrypp
	WJQTL27H44GiYMZ54PE0bdlcfK6BwfV2sVT2lkUQIic26yjeo6uYBQtzcCPfO0Rdn10pqg5XbBR
	V1o2aVi+QKqfJy8C39KLNrmrPLlQcS/gOQbCRemAOtK9OHFqyc6kjtVN3W55F3MiDWctTVln6ml
	f/1yA2kUtyzLZyRmNr1KmxXpt+6QE/P3btMeMFMoLYbgZZ4nhNAzs3GC9V6REjvJMQCsdl+SR2Z
	mzu6i
X-Received: by 2002:a53:c049:0:20b0:651:ca41:3ce1 with SMTP id
 956f58d0204a3-65310870e0fmr11419676d50.26.1776718027650; Mon, 20 Apr 2026
 13:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
 <aeaMkfk_1t98e7SU@monoceros>
In-Reply-To: <aeaMkfk_1t98e7SU@monoceros>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 20 Apr 2026 16:46:56 -0400
X-Gm-Features: AQROBzDn0VxgmPSE3vK5sUClFYZviCWKHJM6c6xPINx44xwN2GgHY3fLhlrfQ5s
Message-ID: <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in sdio_driver_id
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Ulf Hansson <ulfh@kernel.org>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux-mmc@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, Ping-Ke Shih <pkshih@realtek.com>, 
	linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Brian Norris <briannorris@chromium.org>, Francesco Dolcini <francesco@dolcini.it>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_134708_942992_52340657 
X-CRM114-Status: GOOD (  19.70  )
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

Hi Uwe,

On Mon, Apr 20, 2026 at 4:31=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Fri, Apr 17, 2026 at 03:10:47PM +0200, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> > On all current Linux architectures sizeof(long) =3D=3D sizeof(void *) a=
nd
> > this is used a lot through the kernel. For example it enables the usual
> > practice to store pointers in sdio_driver_id's .driver_data member.
> >
> > This works fine, but involves casting and thus isn't type-safe.
> > Additionally with the CHERI architecture extension there are machines
> > with sizeof(void *) > sizeof(long) for with the traditional approach of
> > storing a pointer in .driver_data doesn't work.
> >
> > By replacing the plain unsigned long .driver_data by an anonymous union=
,
> > most of the casting can be dropped and it yields a working solution for
> > CHERI.
> >
> > All users of struct sdio_driver_id are initialized in a way that is
> > compatible with the new definition, so no adaptions are needed there.
>
> sashiko.dev found s/sdio_driver_id/sdio_device_id/ twice in the commit
> log and once in the short log. If you consider applying this patch
> please adapt the commit message accordingly.

No problem I can fix them up once applying.

> Many thanks to those who created sashiko.dev!
>
> Best regards
> Uwe

We only received 1-3 of the 6:

https://patchwork.kernel.org/project/bluetooth/list/?series=3D1082520

Or is this on purpose, and we should consider the set complete?

--=20
Luiz Augusto von Dentz

