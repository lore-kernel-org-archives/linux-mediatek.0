Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71D6ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 05:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhzhPn2YSCEh/VEOd0K8UJG8nXmRRJz83NMi2inqG5U=; b=LHpiQfrsfDOQ3TrKDT9FhpOwNj
	nE5WWVaBiE0nOCl5oAn7CPjl+hLwz/qcxl6nJREYs2xP9XUx5mkaQ7YQ4fOeLvllilEg/yKQ5Fngt
	yi518zxTWhfc/2faahbjOsud+JsGkCm2GPa7ya1WNDQ986jZJFEOE1IrQy09KYC4QuSgcfVbBtMWz
	cP5/+LCUORlHsaZyfpsWm21aU5wiDkWf2Sr+mgaoiVxZxkTK30zyH+IQpF/elMluTWg11QuVDp3lZ
	rt1fhjFHdFAuId1nXmaeLgk1rgyDda0Nc1O/EcXJPqQ7yJT6r+U+1PntPMrF70zf4OyhQs0rlj141
	rk0j/uQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYh8l-000CYO-Pq; Thu, 15 Sep 2022 05:10:19 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYh8X-000CHr-Jc; Thu, 15 Sep 2022 05:10:06 +0000
Received: by mail-ot1-x32d.google.com with SMTP id e35-20020a9d01a6000000b0065798eb8754so2703165ote.2;
        Wed, 14 Sep 2022 22:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=DhzhPn2YSCEh/VEOd0K8UJG8nXmRRJz83NMi2inqG5U=;
        b=TRp9RmLfxbRJhlww8zHaCm/TpVgwOtsHI0NJZ+7W6/5GSoKr9S1KjDo0+A34loUwnd
         Y7ZFouu0m1Ed7irNlcM8J9ILz++S7ACpAabM8lKxAfc+WGenNQoYoEt7J/aU36CZX0Ls
         xvL2VVyr42+vA+1uryRs4TnUweX0gn98LA+fwCpzedQ1Tmy6bvS06sNzYD6IEKGXz/PF
         pgFni+MKcYV5M9Xr3X3UlbRWimWhugjgzMMf3NjuXbviA7QRbf8ofGK3+7dCUhTVtl00
         gsJsxqAGFaoop+1OCG7z3qc1kkgHOAKLBtVLWxv5GK6nRb7rry6XR0cBuIc4rhd+sl7p
         AKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DhzhPn2YSCEh/VEOd0K8UJG8nXmRRJz83NMi2inqG5U=;
        b=ckA0Js0ANBbSwX005JTAJ+OzIpGXvu5O9DpyUmjAoVjlp4j1Bhu1Jf4Ef59dYmbxgM
         iHZeU9PaJZcR1v7BRLO0D8xY35T3JVZSclOGUHDNHfm3t+I+LainvPRzUVJeOEWx7xfh
         aIsgkktOfqAzELrBZjckyhXIwEsXu2VSiT8M/vWOApG+4z4AMeEaG/77KNDzGuNga7RG
         26ZQVC2l7SCQapTH0kaNgZ/8lc2Zm/lFHyT12NvMeJaBdsPIEqbLyCsXH8WwMUfcI3tw
         57mTQMdGEEdtNgVNSux/kb3UhqmBEnF/r5dYBN1kHQ3Dd0mfn5G7KP0h/4HNaAPgxnyN
         +7Ew==
X-Gm-Message-State: ACgBeo1YryxlVcs/oPTvnjwmk+sVtGrYHN+CBpuHUQK1UDgEG2A9p4NL
	xuSEw+hDgXh08w+z/qeUOWJ7VZsT6wxESQ5wv3A=
X-Google-Smtp-Source: AA6agR7ttNz1jhPVaAmBo6hvEqvWJ4oTkoElikatgicTx2EhjceigRoiTrcQZO71eJfHowxRsQGpz9KUh/yJigwBSLg=
X-Received: by 2002:a05:6830:150e:b0:655:bc7d:1e5d with SMTP id
 k14-20020a056830150e00b00655bc7d1e5dmr10361973otp.272.1663218601884; Wed, 14
 Sep 2022 22:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220914085451.11723-1-arinc.unal@arinc9.com> <20220914085451.11723-10-arinc.unal@arinc9.com>
In-Reply-To: <20220914085451.11723-10-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 15 Sep 2022 07:09:49 +0200
Message-ID: <CAMhs-H8dE2XOvUZ029X0r85_v81=oMsOGRcaGdjL=+Ti8F0uKQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] mips: dts: ralink: mt7621: fix external phy on GB-PC2
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, erkin.bozoglu@xeront.com, 
	netdev <netdev@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_221005_678760_779D764C 
X-CRM114-Status: GOOD (  12.18  )
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

On Wed, Sep 14, 2022 at 10:56 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arin=
c9.com> wrote:
>
> The address of the external phy on the mdio bus is 5. Update the devicetr=
ee
> for GB-PC2 accordingly.
>
> Fixes: 5bc148649cf3 ("staging: mt7621-dts: fix GB-PC2 devicetree")
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

