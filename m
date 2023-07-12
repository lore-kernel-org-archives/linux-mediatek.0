Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3921FEB64D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwBA6CgC/uSWwgysf9itlxsD4ci1tHALzPKkAgebLIk=; b=qGYZND2t4dmFaSD7m3YaMEIIUY
	wwns3HPI/QEHvqY8DHhxNkz+wg48A2iabad9D3jo/zNiygLRoK1Z0e706F/64Ou6u3FnhjM/RtZ9+
	mwqDYCBx3rWFBmqclIa8u13b4X5w/smoPe+tVlIwm2zSK+gffvpPalKpx8l95BarCKh8H2jAFlOOl
	5JhgY4SludWS+0GBMcZrFYXXOks4IKI5lGhiKvzTp6FEZq3JIV+cHIRGlNkitvgeTGfja8DY4RYvg
	63m7QF3Y0w/450VxiFW8AODQAlKtqWdHeTVnXfgPjNJu3qdZqrMbd/TdIzEzYKZJ52of1Zeq7uqET
	TVX7Vyqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaOK-0008Kz-0D;
	Wed, 12 Jul 2023 14:00:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaOH-0008JN-0M;
	Wed, 12 Jul 2023 14:00:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so84112155e9.2;
        Wed, 12 Jul 2023 07:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689170421; x=1691762421;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwBA6CgC/uSWwgysf9itlxsD4ci1tHALzPKkAgebLIk=;
        b=nzBtO/tTreuHkaSg8fsmex2z01A3jTBVz5BYmCLBaOKK8UpmigesIYHZBbNV2F3fUv
         vJdnAapY4APjKKP+9/rmFjtawAPdjbHnVNb4lh+lopJ+3P4aijA5Tr95wdIyCqyk40vr
         b3MnQVXo/0Zj710PhEU/YLcW5cViZfLTh0wj2d8H5suZHhhxtejfJaxVaYJ1hAw+rJ/V
         uSwUWo+loigI+FKGX+PTV4GYsP0EWoXevShhDTDbcGMMHgDTbj8532fAyEpLkXh0h8km
         63pq5NTHGgroUfKe64sFwNEbaf3hHrQR/LeI6GSidazJTrIrh3X4I1s6dZJlTmovozPj
         3HJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689170421; x=1691762421;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wwBA6CgC/uSWwgysf9itlxsD4ci1tHALzPKkAgebLIk=;
        b=hWuRGPk77GqbfMiOcslm7quDkxq0Cy/58Atds3487GFXPjZHh7Ys/Ffz4RloXUD9En
         0zHJ68gcaL1lNYCcw85cZ51qw09W6tPii6wrN46CUnMC57LOmdTdyEJiWW2yqxFWrqyp
         nDz/SywSFgPnQsTt3Z36EkXXm3mN+s22AIT3tLQ5mgAMjWKWEZdUzX58ztqm1GUcO85d
         FsN9FR5AWf5CdiHAGdDZaxxcFWZCkt3wjUdOX8gK0wvkRJnzCOmn1Ovg8xnsMZl55ilX
         Qr2d2a3X+G5Dk74Vwro6GltBoDKwDXNT3x+dLCrMqhWiXvJmgBwsjIYcpzNRWm8SFJZP
         erog==
X-Gm-Message-State: ABy/qLYlk4Sf2FC2s2Kg3oocO+ZOD1Od6cyTU6gwfSnU45LzJCyDYToy
	RR73omTI4/lADQTiY3ahh60=
X-Google-Smtp-Source: APBJJlFvnpQKOvU0aobzPw3hMQLbsfLRGV5h6VkWcrOUeWACf5DxRZADF7vQ5lsCh/oTJ22vnfnZOA==
X-Received: by 2002:a1c:f709:0:b0:3f5:fff8:d4f3 with SMTP id v9-20020a1cf709000000b003f5fff8d4f3mr22648888wmh.7.1689170421080;
        Wed, 12 Jul 2023 07:00:21 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id c14-20020adfed8e000000b0031411b7087dsm5201659wro.20.2023.07.12.07.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 07:00:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Jul 2023 16:00:20 +0200
Message-Id: <CU08XUB327HO.3J4AY0JF2ZRL3@syracuse>
Cc: <opensource.kernel@vivo.com>
Subject: Re: [PATCH v1] drivers: wireless: mt76: fix parameter check in
 mt76_register_debugfs_fops()
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Minjie Du" <duminjie@vivo.com>, "Felix Fietkau" <nbd@nbd.name>,
 "Lorenzo Bianconi" <lorenzo@kernel.org>, "Ryder Lee"
 <ryder.lee@mediatek.com>, "Shayne Chen" <shayne.chen@mediatek.com>, "Sean
 Wang" <sean.wang@mediatek.com>, "Kalle Valo" <kvalo@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "open list:MEDIATEK MT76
 WIRELESS LAN        DRIVER" <linux-wireless@vger.kernel.org>, "open
 list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC        support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC   
     support" <linux-mediatek@lists.infradead.org>
X-Mailer: aerc 0.15.1
References: <20230712130005.15809-1-duminjie@vivo.com>
In-Reply-To: <20230712130005.15809-1-duminjie@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_070025_147467_8556FBB1 
X-CRM114-Status: GOOD (  14.88  )
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

On Wed Jul 12, 2023 at 3:00 PM CEST, Minjie Du wrote:
> Make IS_ERR() judge the debugfs_create_dir() function return
> in mt76_register_debugfs_fops().
>
> Signed-off-by: Minjie Du <duminjie@vivo.com>
> ---
>  drivers/net/wireless/mediatek/mt76/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/debugfs.c b/drivers/net/w=
ireless/mediatek/mt76/debugfs.c
> index 57fbcc83e..d9ba70013 100644
> --- a/drivers/net/wireless/mediatek/mt76/debugfs.c
> +++ b/drivers/net/wireless/mediatek/mt76/debugfs.c
> @@ -109,7 +109,7 @@ mt76_register_debugfs_fops(struct mt76_phy *phy,
>  	struct dentry *dir;
> =20
>  	dir =3D debugfs_create_dir("mt76", phy->hw->wiphy->debugfsdir);
> -	if (!dir)
> +	if (IS_ERR(dir))
>  		return NULL;

Check the mailing list this subject has been discussed many times...
I believe the current state of the art is to remove the check altogether

> =20
>  	debugfs_create_u8("led_pin", 0600, dir, &phy->leds.pin);


