Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04168C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 16:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MxTBz1QF8Hk1p2nOoK7qHGhbXl6VPJE+rF2sS1370Uw=; b=IXECdVNGbneGbB
	mj4hlmp/kc/iLVM7nQ1NpNEN1WP/9xiloKGbX4IqiCyk2MFVkDTzFLoou3tDexOMyCOeNWWEhDAf5
	/F0izBgKbqS82Fo1TUNAQ2J31hfeUP1xtgZ+bO9XVlajpTz/znah7d3jCBWljgU5i2MLscaL7eg++
	ydKWsOOMpcmH5fCkpoVySFMtmhkR8yn1bU6JNV1VY4rfKpU6hQW62wob70nf6iHx7Z03BAHDgRj6k
	Wyy2xZ4L8xlgd+ZoeyhGUxFszsiGO4KZ2BHqBU1E/JOXzStazqwt4hyJ35yNqtKcJM8ceAhDUs6E/
	gLbYVXlFE138K42iv0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntBOg-005IWF-En; Mon, 23 May 2022 16:59:10 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntBOU-005IUP-Ey; Mon, 23 May 2022 16:59:00 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 a23-20020a17090acb9700b001df4e9f4870so14289644pju.1; 
 Mon, 23 May 2022 09:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7fn1yFxpVe/lx6SRRrqC5pO9JkynA3lVXz/276E/sVY=;
 b=TB6j1syu19Pk/CRBokAkVCLwh7Iroqg0r+rDrmviHL6ABD5eyvFuq6vkskf9zoALSs
 sx1A2nXlNkXcVooRfOGLcCwnl+VN7klMGiBUF9H42qvSyhtuUfH6+rPSCWrCF6hsNTqf
 Udb/2iWCSBABW3XSyQxjUhTl+R1MOR0Vnkd70/vimfTObURvmQKM7kZBE1HzjZNR6W4Y
 OGyR5BhoeBkzdPTTzorbEQTMeiuyHSzSvhUHhm+mOBQkWprm0leXizNCer2mZ/HL8ZQV
 taTmv+ORGQrCQj8jkoLTkmPROBfTd9oJ3gRxegQt8IdCSd8C/GWTPMQf0tBOiG9r9GSd
 G7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7fn1yFxpVe/lx6SRRrqC5pO9JkynA3lVXz/276E/sVY=;
 b=zcHoRRn0t5FaTMz6WzFZp0CP4Os8M/k57KlR7ZoxLVhjt1fTeyeF1fAw2N0XEuxeiB
 Eb6qmNFG6AYK/UqDIMxw17sHxektiutQwSow/yuyx2WzIBJIp68PS/OGvFE64zcXwSqA
 bGSdR7VYTCU61BrhRPOZ98tqKDP6ibfNf6zpscKC2Q0+VcPQbTuuOxe2g7tV5diD2I2c
 +zSMEkKIQ9dcWal2lWtWbZN8ZfL8Aafie8272z9/AqitKBQB2APkNjcKtWHAyehbiCb0
 6RjbZqkQLPEJFbTW1uqWh8JVEREPFLK+9EoAcVYGVPpuvb6AtAgeS1Fn9/UYSjRwqrzQ
 tn0Q==
X-Gm-Message-State: AOAM532roExA0Z6tu9R7GuXj+hPQ6F9vzhUzsuM510hTm6SeABo4j9e9
 nO839WT26OlX4fu/JAYmnCE=
X-Google-Smtp-Source: ABdhPJxv14G1AbpX6lfKccE6QIH5Vd/dtw1/hAcDrvzUHWqyTEAxRWPl8ZFaeBLEMUyFLdFoUur0pg==
X-Received: by 2002:a17:902:7597:b0:15e:b5d3:267d with SMTP id
 j23-20020a170902759700b0015eb5d3267dmr24016528pll.55.1653325134120; 
 Mon, 23 May 2022 09:58:54 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d84e:5dcd:9d68:ebbf])
 by smtp.gmail.com with ESMTPSA id
 23-20020aa79217000000b0050dc76281bfsm7422375pfo.153.2022.05.23.09.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 09:58:53 -0700 (PDT)
Date: Mon, 23 May 2022 09:58:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] Input: mtk-pmic-keys - Use regmap_{set,clear}_bits
 where possible
Message-ID: <You9SjGt4UjJk17/@google.com>
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
 <20220520125132.229191-3-angelogioacchino.delregno@collabora.com>
 <YosS0ZvAovyl8cF5@google.com>
 <926ce818-4f42-898d-aca8-185b5c7434ba@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <926ce818-4f42-898d-aca8-185b5c7434ba@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_095858_566612_5CDCC430 
X-CRM114-Status: GOOD (  22.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 23, 2022 at 10:58:47AM +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 06:51, Dmitry Torokhov ha scritto:
> > On Fri, May 20, 2022 at 02:51:29PM +0200, AngeloGioacchino Del Regno wrote:
> > > Instead of always using regmap_update_bits(), let's go for the shorter
> > > regmap_set_bits() and regmap_clear_bits() where possible.
> > > 
> > > No functional change.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/input/keyboard/mtk-pmic-keys.c | 24 ++++++------------------
> > >   1 file changed, 6 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> > > index 8e4fa7cd16e6..83d0b90cc8cb 100644
> > > --- a/drivers/input/keyboard/mtk-pmic-keys.c
> > > +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> > > @@ -157,28 +157,16 @@ static void mtk_pmic_keys_lp_reset_setup(struct mtk_pmic_keys *keys,
> > >   	switch (long_press_mode) {
> > >   	case LP_ONEKEY:
> > > -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> > > -				   MTK_PMIC_PWRKEY_RST,
> > > -				   MTK_PMIC_PWRKEY_RST);
> > > -		regmap_update_bits(keys->regmap, pmic_rst_reg,
> > > -				   MTK_PMIC_HOMEKEY_RST,
> > > -				   0);
> > > +		regmap_set_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_PWRKEY_RST);
> > > +		regmap_clear_bits(keys->regmap, pmic_rst_reg, MTK_PMIC_HOMEKEY_RST);
> > 
> > Why not combine this into a single update instead? I.e. assuming
> > 
> 
> All downstream kernels (at least, I checked 4 different kernel versions for 4
> different SoCs) are doing these updates one-at-a-time, never combining them.

It is not like drivers in these downstream kernels were developed
separately and each of them discovered this as a requirement. It was
written once by someone and then either copied as is, or maybe
additional key handling was added later.

> 
> Even though I agree with you about one single update being simply more logical,
> I am afraid that (on some SoCs) the IP will not like that so - since I don't have
> any *clear* documentation saying that this is possible, or that this is not, I
> would leave it like that.

If we go with that we will never be able to touch any of the hardware
interfaces, as I do not recall when spec would explicitly document every
register and call out that individual bits can be changed together in
one write.

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
