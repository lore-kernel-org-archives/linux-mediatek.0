Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A106D606A321
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 04:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HiTFyY3C;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ga1UBwdp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=; b=HiTFyY3CRoG8TO
	HBTJEeTGfWCbdD/WSBWVCBhrgV0atkPBjcnkE9KjxkiOJdw6I87j0CRSK6UeT0fAXE5vEd3hv3grz
	FfmG3YVwKgy07B9HKFqKkkCQ5FqAxEbUeWyykH5HR05Rx0XwqpiUxP7Jg+9I2j8u2zr9BTT5pYFU8
	pliS6u0MFNG+wAoYB8r+oFtjY2T4ThUgJoM1SvYW1TB72i5KrqlqiWwGK7PsJxyqfl2BEGXwraJiQ
	COEEDnDlPcZxJ2V63GWZPNTo43zKO5MArP+uW/59omgDvtoUVxMQG7GtAZvcDpIE3j5uWx4yL3jZW
	5I0DYMxPbTfvpFIY4kEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHCI-0000000HKZc-1XBj;
	Mon, 09 Nov 2026 04:41:34 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHCE-0000000HKY0-26Zn
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 04:41:32 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1128604eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Nov 2026 20:41:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794199289; cv=none;
        d=google.com; s=arc-20260327;
        b=KiR1TTc1CsbdPpT6EBDsDhNdQEWn0qh1fLdsJWAyIiH8fowdq7n9tb1Lt6Cwsre1dO
         rgqYiRp+nP6TgJkB9s8J4pKAJBY9DKn9d2e3faiZQDNGIHFr2d8HdDu03TJaxUhOEjIz
         mZi7Lzvug8sZX7RyCWiPO76smfQI/bsxKwsi+kSUrG+nj9bNNzvOgwvRL6Sq6I9zQCgf
         RTCraJzU4zIUecEWpj1DepqGXCNebupRi7RpT4e+QToByQfXxaE0zT5HnuUUin8ew5HM
         JfbWZwV0sTOt7PDl7Xay5Ewe8/zwj5zFMvDM1lhSI6HqW7hjeMC5q6/2Vu5HvLI2Ly06
         3Zaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=;
        fh=d/KRESxVKonNF5j73K/4Yi0SgFJj6r6Dg2GeGLrIcEs=;
        b=L1yk+amhBa0sal3F6brSnfZEUx9YzSMGH5xhpD9i92w5wyEMcZ2luLaNkdPHaXvOud
         K8do+CCZNNGtAPCW9aEYCm/59UVnr0kN1OhjhN5pu9GYWlx4uSa2rcH7HX+pv0DAbYMv
         +xmCCMdmjPsnZheFtRfIRFZHHitdrNbOnMcUcFqm+O/oUwVWFp2fZjB5n5kXz/ZIrQy1
         Z8VwsH9F2eYUcZ6Yzrzysp7cdxzY5f6VQeiS5jYv5Qdj5zL0Wsw9AjIUw5ZZfc9BoEG7
         dMg8aEXFdmFJ+kfAIE10/qVaH4CELfJalcBkwPzVC6iZsKvCslEMwxPwiSuaggegfqT8
         dtcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199289; x=1794804089; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=;
        b=ga1UBwdpJH/zB/uNi6rjDTS/A05iEgI2mfQXmnLjioCuZZs618rmYaKtReXV+R55r8
         VONEPWxkp3sPPA9563RgK2uaaeR6GzriuRyMMqjCP9eRnpqhAY6kbOs5mtyiEvo4NvW+
         bcPXq0pslSc2NpyxEuF53VaEUBGE+CnZqBrAQXIIQpggl0XIUf877wLII3uND6xFJnXp
         gOGq2voPvnNfoY2CHw22Otgygg4voOVP8rT+tnl0J42pOyrDXS+ZSwN1EFpWiXkAa5Ex
         UdAHrU/NctMf0ow/3sHisAJkn+KrBXVXD0ZOeZVsR0NRi4D9XeI5Qz5uVKzJh/3uCzYR
         VUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199289; x=1794804089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=;
        b=Do7dHU4krIz97JvgneITq57JMM+rNuIcxlhcQq1L7N5B4FxJujZIXGkKrKioeqxtU9
         iwHQcIg+rnXlhav9oeelRIx8cKmnZxxsGxe34ttbho2XbsofzTo48Rly6gW95yfgH1Bf
         LlaXbpmPHEvmb+97TqvhTyuw8uShKE8933A9LxDbZxMxdc2egKQqnYlqkCqUp9torYTo
         8uPn42DlcFSlQd0CE5tr9GRe6i1txsaOefYdL4ZVWmpstFHxxxpZAU3ATpUGsaXLCcE/
         HvRnTKbP18ZQCCUppDIE0LpvpBtkMmjTSEwKag1T0Dsff3g+YiKr/8PcY+0C4Y2WWDa6
         9P4g==
X-Forwarded-Encrypted: i=1; AL+hErGLgaY2nPU6krUmlBeYGe/XhzwG+7aexN371j+JlIh2i9bxCH5uADGfW3agc5RayPMbEiKikJrEGpATXV8IDA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZF9qaBhbIGmtzZ0sNrqARkED4jIdKJo7ZUORZOTbjfiITlS34
	DpCMKsmblWO0r9LR0L97sTVUAOS9H8/zYolx3OzLtGjh9eHAVPn3jt+9zhHi1EfnH5NvgxD+ETX
	YlDsGZtV0o5SRdqtwX28dRwSq6MajPws=
X-Gm-Gg: AYBFou3/KFxLvZVXGnwXkfnvWttPV4+GsSJoRKXOKVTy2QmfTzbusCRBw2RNUk4Lrkj
	wO7PdcCOi8jGWSNjdV+Q9A6tUDhUakVTT3u/9EbG/gaPULX62I/DygYWTALe/ADboRhV4WPeUYJ
	JsyH6AEoZ6TAHa4e/wDM8IX/sadsRwCqXJHv2DNX1mV1ylu/9yxNeiSv1XkNWlDWOlOypF7AgBx
	Qb3HP/jDpsvF7WeZjcDGCxOj670qbE77SUbDAeHp243eJp/+xtDObvKK5ldRqSfjarC9BlJQoES
	FSRYUqqPs/jwql7olG/kIfml47xfQzR8qEXVH0ZPBgxfc61QJNadNDDbkP73Ohl43ESHcmcNvez
	bHBll6FnWsilPve3jqTOeystGm355zEOp5dQzw45BNBSW137rdXYoua+lFWQVWDzm3gL2
X-Received: by 2002:a05:7301:1285:b0:343:9eb1:9940 with SMTP id
 5a478bee46e88-3725e33de65mr8199608eec.26.1794199288994; Sun, 08 Nov 2026
 20:41:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106160057.2754689-1-hj351016@gmail.com> <avEdYFDUHIj6mq0Z@venus>
In-Reply-To: <avEdYFDUHIj6mq0Z@venus>
From: khj <hj351016@gmail.com>
Date: Mon, 9 Nov 2026 13:41:17 +0900
X-Gm-Features: AclHuK_VP_O81IVVw6nsjch_EUlJXziP3JNmGnD4QyN0YGW8m1KTdax5oeelWrE
Message-ID: <CAGr5VtNJwmMej+90yoLa6su5fcBc1gwOPviMGtjj7pis+Y7jjQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] power: supply: fix work-vs-devres teardown use-after-free
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-pm@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_204130_543647_2116CFF8 
X-CRM114-Status: GOOD (  19.39  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sebastian,

Sorry about that.... and thanks for taking the time to look.

You're right that the commit messages were far too long. I had added the
"how found / tested" note out of habit -- another subsystem I send to asks
for exactly that information, so I carried it over here without
thinking -- but that is no excuse for the length.
My mistake...
I'll resend as v2: commit messages cut down to the bug and the fix, the
inline comments dropped, no functional change.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 10:11, =
Sebastian Reichel
<sebastian.reichel@collabora.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi,
>
> On Sat, Nov 07, 2026 at 01:00:54AM +0900, hyunjungg wrote:
> > From: Hyunjung Ko <hj351016@gmail.com>
> >
> > Three power-supply drivers register a poll/detect/charger-detect work f=
or
> > device-managed cancellation (devm_[delayed_]work_autocancel()) in their=
 probe
> > *before* they register the power_supply via devm_power_supply_register(=
). devres
> > unwinds in reverse order, so on unbind the power_supply device is relea=
sed first
> > and the work is cancelled last. The work handlers call power_supply_cha=
nged()
> > and dereference the power_supply, so a work instance still pending/runn=
ing in
> > that window touches the already-freed power_supply device -> use-after-=
free.
> >
> > Each patch moves the devm work-cancel registration to *after*
> > devm_power_supply_register() (and before the IRQ/poll that arms the wor=
k), so
> > teardown drains the work before the power_supply is freed. No functiona=
l change
> > otherwise. The relocated devm_[delayed_]work_autocancel() still runs it=
s INIT
> > before the work's first queue site, so no queue-before-INIT window is a=
dded.
> >
> > This is the same class as the recently-applied cimax2/extcon work-vs-de=
vres
> > fixes. Found by static analysis / code review; none is reproduced on ha=
rdware
> > (each needs its charger/PMIC/gauge chip and is not QEMU-reproducible) -=
- treat
> > accordingly.
>
> Please don not send direct AI output. You need to drop useless
> comments and trim down / rewrite commit messages to a sensible
> length. Instead of huge amount of spam.
>
> Greetings,
>
> -- Sebastian

