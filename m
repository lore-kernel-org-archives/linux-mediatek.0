Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2144C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 07:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azjEIx4GH14Y1N9b8EmQm9otxWDyzqOgZqFEjVHx4wE=; b=SSfJL4v3jpYzyY9TCkYmaqRoPV
	QCJ87In5Ye+8QkyIGTdNk8Pv0yKi8vHRGEMKHNQ9OLCA1AfUksE6CJHaFB+Q395NgW8a4cm1KP801
	gt559kPdt5QEg3R5hal8UhmtcKqXShf8cJh7Hmt5k9SY7fRpKHxDUtk1mnLr+Ow7fi9CZi2gtW28z
	3WyE/eQzb5RhgS4slCY3+kkMKRT106FJlKG8Enm0AxDDmHwIflpldQy355x6FtjVa9WhhrWavjhdq
	fbyturn2U9Q2iakkKkSWS/qYKVmVGn8PWncxscBUQilS/h+eOP4tFtWvnMEN2F3IdUwAwdC8SV4EY
	gg3elzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmrY4-005Iqk-2m;
	Thu, 13 Apr 2023 07:39:16 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmrY1-005IpS-1g
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 07:39:14 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54fc337a650so14984907b3.4
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 00:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681371551; x=1683963551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azjEIx4GH14Y1N9b8EmQm9otxWDyzqOgZqFEjVHx4wE=;
        b=Ahf8wKQixFqrhMEyfuMsctrl+NkTUJiyZaJXBtm6a7Mb5H6yRxMTlTpAp27NO6WMMr
         k1vSqlzZnqN0HlkTJEYd5W8CP5GwqQwh1Glh1OVNvMECKQ1niEi2aRRx/Tc1HTaU66Vl
         SlLe/FFrDSA3xfcDGqNK9fYH9nyQ0QqMUMvv44uA0YUFYxrwHL4/119gEF30EmCvK6vr
         qrMy37Gi2mL7dm9t1yyvWhanxrl202DeOY9svx2NfMz33Dt0KHaCuoYZsnKy5Dr6K0Ek
         zkSEpQerd/7Kt2t84BPmOuiWCSGzPHkQNCJJeaPIWV1OjNIKzUacLvoGsFYu+AV4nVW4
         kzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681371551; x=1683963551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azjEIx4GH14Y1N9b8EmQm9otxWDyzqOgZqFEjVHx4wE=;
        b=g64Nch6E7u5XSaRfAzHFbTINBo45YuwonGgshTpg+Ymo7Bt9VUJ/m2qUbKpJL7TaW1
         5HkL/RrTkoCYWCROVswPfTD3e7R9BYSjbBgdEjCMs5bz/xOutqSjaZxbEU7tj8xYH6/d
         LIbnj6q9uoqdenWLHXeKCM/biywuXyt0vvsny3INwT4VWbPLrApeY36QOrt2gwzhHmJj
         k58tTHUa8geOsHNHi6eDdN6Zbolc54msrB2pTD9cqx1GL2cnloCoUfgUAjCw/sXesH6k
         +7E2151So3+ao6UsIW1oZLJY+aRNFCZAwChq49+Fd3wGkeLjjt5YtrW9OEY2FA5f/D0l
         Q63A==
X-Gm-Message-State: AAQBX9ck0hYPlUzAVXedKrDA9g5NzFbyF1uv8iz6zwSBR/Q/W2OuVAC3
	E8VdRtHZInfEL6a135M1n6Ff5cEzRwHmCxCztasATA==
X-Google-Smtp-Source: AKy350Y59eHiC+Gwv7NkE0MLxBEHcIS3XiglOEbI7/MvUm+GiXiAITea2wRpLlaxuDSCQVivjm+Q6Or8PM3fYSh94mg=
X-Received: by 2002:a81:4328:0:b0:545:4133:fc40 with SMTP id
 q40-20020a814328000000b005454133fc40mr748835ywa.9.1681371551508; Thu, 13 Apr
 2023 00:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230413073429.40050-1-haibo.li@mediatek.com>
In-Reply-To: <20230413073429.40050-1-haibo.li@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Apr 2023 09:39:00 +0200
Message-ID: <CACRpkdb9sn25KdagSVmY5-XX+LypQdMEj=oBpnwOhYvS2Ny1xA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM:unwind:fix unwind abort for uleb128 case
To: Haibo Li <haibo.li@mediatek.com>
Cc: Russell King <linux@armlinux.org.uk>, amergnat@baylibre.com, 
	linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, xiaoming.yu@mediatek.com, 
	Russell King <rmk+kernel@armlinux.org.uk>, Alex Sverdlin <alexander.sverdlin@nokia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	ardb@kernel.org, catalin.marinas@arm.com, a.anurag@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_003913_569017_5A46B275 
X-CRM114-Status: GOOD (  11.06  )
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

On Thu, Apr 13, 2023 at 9:34=E2=80=AFAM Haibo Li <haibo.li@mediatek.com> wr=
ote:

> When unwind instruction is 0xb2,the subsequent instructions
> are uleb128 bytes.
> For now,it uses only the first uleb128 byte in code.
>
> For vsp increments of 0x204~0x400,use one uleb128 byte like below:
> 0xc06a00e4 <unwind_test_work>: 0x80b27fac
>   Compact model index: 0
>   0xb2 0x7f vsp =3D vsp + 1024
>   0xac      pop {r4, r5, r6, r7, r8, r14}
>
> For vsp increments larger than 0x400,use two uleb128 bytes like below:
> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>   Compact model index: 1
>   0xb2 0x81 0x01 vsp =3D vsp + 1032
>   0xac      pop {r4, r5, r6, r7, r8, r14}
> The unwind works well since the decoded uleb128 byte is also 0x81.
>
> For vsp increments larger than 0x600,use two uleb128 bytes like below:
> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>   Compact model index: 1
>   0xb2 0x81 0x02 vsp =3D vsp + 1544
>   0xac      pop {r4, r5, r6, r7, r8, r14}
> In this case,the decoded uleb128 result is 0x101(vsp=3D0x204+(0x101<<2)).
> While the uleb128 used in code is 0x81(vsp=3D0x204+(0x81<<2)).
> The unwind aborts at this frame since it gets incorrect vsp.
>
> To fix this,add uleb128 decode to cover all the above case.
>
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>

Thanks Haibo,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please put this into Russell's patch tracker once you feel it is finished!
https://www.arm.linux.org.uk/developer/patches/

Yours,
Linus Walleij

