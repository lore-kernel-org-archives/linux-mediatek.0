Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F4606A32C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 14:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WmNvPpVj;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=mMQuqSN7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=; b=WmNvPpVj33SAcOdpus1Tdwg7MA
	CdU/RO89mBkHoHnOaX6AVkWo9m7Fkrt2fD0VCzjFbWJXM4s83xJ3gwzymqH3s1PfsroVkrklXV1z+
	OgvgZ5pCOJXT9RRZUn7XxX7HkDYKUz2WgEwMXWMOM5unc3GnDMsk2CjZlhylU1OUf5sC0kKhauKYu
	/IHsAYv2kZQeJfn+j3w8nMv4JTke8+V4SxPE7n1jWZYufZ8PZCwyIcpDsLevXKqU1EiwA6uZJJtX+
	bDi2NpuhU7UiYn/Lqk+a+C52bBvHIlkigInWKTawcZwQk0EJNXLDXIuSD2zumfD2PtMbDdvKq22vX
	Eh1yyYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrad-00000006lkS-15QF;
	Tue, 24 Nov 2026 14:33:47 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVraX-00000006lf6-1lOJ
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 14:33:45 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso1876508a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2026 06:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530820; cv=none;
        d=google.com; s=arc-20260327;
        b=a1BEP07R4G/2sAECGrMIVOY22owtAIyrNFHMyLDA/YIbDHtrlc6QzGim89B7Hed6v2
         A7YX6VRKkHxB6N0JiKZiEKIxjTxbNTjbs7FUODuaDMTkBKw+pvMoBmAHxkRXxbRiJDRJ
         MPZY+83yrTe70EDVRL0rTGFctFisuPMiQ5yxlAGtZAt03IjAaZXMDIOi0W1EuYLMwm8i
         UoNIFZHHMYGZ/Eu0fcKIGyja557RiLeOpBzrIE93/1Q/zfvm29KuvKzA0KnDihrJl732
         NxkHLbUiIFdPlpzx3mPL4XnHYxxPvhQIq6XAVzkkmR1i1MJYpKamD46vaSv18imLUUup
         oGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        fh=zzluCqz71FwAyK5xKaGQq/FVpvX4borOFt63v1faiHQ=;
        b=WqJ6CcOIuKMOww3VM6cjqOWQE648LAtnATzF0uXC3jrXUPnQEBO20XMvcV0zbvx1yV
         lLJFEux+DQY0yJfO4wW4RmuG7pv0M2kJyra8hPBdogsZsspyPMnK+9BEaQ/s6Rk1UoCG
         hsHV6B5MGdz48EizcUN7+pygD/EHaiWFs7gFjuRBDSZ9vcgw3F3bLl/uVlO2ibGujt7c
         ZqYBLR9Ua6hxb1cdnl0uHHQhJktlcKjmVPPfa66hVTnKCSeHNwqik/UpEospMGaGIl9S
         QCatKnbEoO+iYN2COJAVGydZPnNAq/aq5uWHaqkUJUIR16ptHmekGMagiTKZvhJpPLWO
         PUBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530820; x=1796135620; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        b=mMQuqSN70izrpDThpR/xN9G3phfFqgpqbgIBm903iNKu0M7qb0OpzppB8jfI0f+O45
         KmyeijsocxsQkS5LEAyvCAa0zvgo9sd4I5M8wrBpwafcojK2KY102wmnkihOb8QdOIzs
         PFLdYjWXW70NMWvDOxoM/8DBCheSihPs+3SzQ7Ad/UJ2wAOLaJrc1rrQIH0zvEVtzfgB
         Z+lJYSOkbrMv8Zt69vUSnBuBTMNmcwJODBGMMnM8zEmtkmK1XSkV7zhX8ekM/5cdo4CH
         PVIPOMMY6/Gp7zbtqPjbLlAolHLqcZ14+ahwoL5jE+01zhCpw2u8J0ViExYYX9732RA7
         3ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530820; x=1796135620;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RUxbFCgX/qZgkllCLWhh1DGi6P1IWH5bzGO/fNRQRnI=;
        b=EIiimzP55PD/ibRyzHqE2CLnh2/71DED2OMkzQVFhZkDEurFCtvN2CSJBji0PXAmyT
         qCh9aFpaKNbXbZf8WGKx+964tQS8kSttruqf3W+b2Ox3iO+rGMuhRv6+ad9fecANGH15
         TApz66UPg38ad0yiXwcmROW5h3g5REiiNVBXnmSx33kyibp9dk3Z4hVQJbWJjePI57+R
         FxFMOXliDdgbGNBz8x7IcDGwFZ46GXlNSnEZQAzJ+zBYyLuTnHZGGFVAixtY9MGlHivx
         xeY46x6GsbPGtvezjR6uMlRSGE6L04Z3BUnnD1SNul7Xif8nYce2en121GHOjBNUO8Ux
         MkAQ==
X-Forwarded-Encrypted: i=1; AL+hErGRm77A3gjS0BoJJNUnL6iEgm7hWQTRnVtgzTu/swdooAlUSileChHnBBf4seDp5b8Lf1mhaY3eEGp/tAeT9w==@lists.infradead.org
X-Gm-Message-State: APuU4Z+AmHOw0/c22tzkycAOf8L4cXACsToRCrQAuuatWbO5bR9y9+On
	Py6FioqACw55Gb2arPlME43xEOl2pwUI43ymOafsP2mBjCBiLEMCyGp8t2ziRyRRnZ5K4xZBDAZ
	QPCRLOXdG7FKzF5+l0pAzkoQhZFSDwqnIjvU66qELzA==
X-Gm-Gg: AZFdTZf3O7x856Xb3ilzMiky9Hd4iF9PKoHKroLpeLmnSiSm3Es59wNdMvhusOwzegt
	oneGJcD6mURzMgLB+M7JZIQT7yD2blP6SlAgQwdRQbJZeaDN/KsnEIw6rwgSiytrmWGee3fWZ1O
	CuxF7NlnYDc2F45VTpfBg0p5h5ENEYxL6zEdZMaJvC46qY4uChXTHu37laXvSTNgX7fvXmA3K9n
	XiZMyfZUDEzJEbl6bQgn5HLICztqQUfGXxAK1fN766IATsOs4o8ZewCLyajTLugMUXY2rMr/0fd
	jQf4h0Tq/AmaGAoIAzJLjwnT2CVViDCK+fA0ZwCRR4U3gSq4qwgfMda4a9u6w2srR6e/6heMFWd
	SWvtMjWDOEz+RLwkNKxOWzb4cTRgqltLO/A==
X-Received: by 2002:a17:90b:2f8c:b0:3a2:b16d:928b with SMTP id
 98e67ed59e1d1-3b41c95aec8mr12847695a91.46.1795530820492; Tue, 24 Nov 2026
 06:33:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-32-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-32-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:33:29 +0000
X-Gm-Features: Aa3M54oxOcYmQorjTkd5D-GkJnjfCGVao0VGN1bH7KpMt9eEOWMLLFoUmIq_rhA
Message-ID: <CAPj87rMW6c0BMELjn70vsc+mkMxegDbSgQC-8BEDGspFyxzW2Q@mail.gmail.com>
Subject: Re: [PATCH v2 31/46] drm/mediatek: Add support for Display Layer
 Blender component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_063344_530694_2BCB86CE 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

On Tue, 14 Jul 2026 at 12:46, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +#define DISP_REG_OVL_BLD_L0_CLR                        0x20c
> +#  define OVL_BLD_BGCLR_BLACK                  0xff000000
> +#  define OVL_BLD_BGCLR_RED                    0xffff0000

We probably don't need a #define for every ARGB8888 colour tbh. :)

> +void mtk_blender_config(struct mtk_ddp_comp *comp, unsigned int w,
> +                            unsigned int h, unsigned int vrefresh,
> +                            unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +       struct mtk_disp_blender *priv = dev_get_drvdata(comp->dev);
> +       u32 val;
> +
> +       /* Set ROI for this Blender */
> +       val = ((h & GENMASK(15, 0)) << 16) | (w & GENMASK(15, 0));
> +       writel(val, priv->regs + DISP_REG_OVL_BLD_ROI_SIZE);
> +
> +       /*
> +        * Set both background color and constant layer color to Opaque Black
> +        * (ARGB) for eventual Alpha Blending to be effective
> +        */
> +       writel(OVL_BLD_BGCLR_BLACK, priv->regs + DISP_REG_OVL_BLD_BGCLR_CLR);
> +       writel(OVL_BLD_BGCLR_BLACK, priv->regs + DISP_REG_OVL_BLD_L0_CLR);

Would you believe that this does not in fact need to be black, as it's
been configurable since 4c684596cde4?

Cheers,
Daniel

