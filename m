Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316EFC282DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Mar 2025 20:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrH66w6hjy8vTdk3/chb+sp4rDPMHTlBdbnwkF+r5mI=; b=Zv01Djf3g5/JCqPh+janhunRqm
	MYg7qcEwCggxrpOjdCjO1dog9oKOfMS9ariaZD4VQCMnjT2rp76qIbcGBeoPoVGucyWnkaencauY9
	vDgeZVoOM7DM3+ZNk+1j8rOmmMOaURmNAsY7TJyul5Rgn2q0B8zhsMqmm4WNxcvZMoXS5uRak1lfm
	3q6m5dijL7HY4qRtOx8QsGDkwTO6B+4yR3cc9Q/8tYF9cgnt9fAGEwGXLIZPxUZ70Em8xH07UrS0l
	Q2JT2vWNcjxA4YOPaPLHroYDShrieVo9HtT3zW36e92ELLbfmexPioV0KylRsuc/Ts732YivDJNeJ
	9R0TmzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjTW-00000003p4U-2b82;
	Mon, 10 Mar 2025 20:11:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjIw-00000003nLA-2Ay1
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Mar 2025 20:00:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso13139175e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Mar 2025 13:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741636849; x=1742241649; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrH66w6hjy8vTdk3/chb+sp4rDPMHTlBdbnwkF+r5mI=;
        b=sXoWokGTD//OCQSnc4UPqku81AZZEZ7gBvOr+4iWWeI90g2ebaOYxooiFwyu4y/p6L
         FaDVpDKKJS/RdSdgvcpbbmJ2CVwTqVRK84EtccbfoeH4I2bJylcge4mCmV6mncltOmEu
         bi8yNmdek0/SZWoBn2WmQ1YR02B5SpDN6BHDc/lGkC788qylTdz5Nfv6dUOhX6Q45QdD
         Gq2AxMU3/0Sroe9bqu32Liw3ezqOSy54fPYuMwgwhh3rTSGEXbSfsDvXKB3Evu0KU9Bq
         /kNePSwEdLBgAi1c+3o6KqWHZvqxaCxbGV2zbnMM9rVFBJ39vNjqzuUTAy1ooeiiO1I5
         Zb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741636849; x=1742241649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrH66w6hjy8vTdk3/chb+sp4rDPMHTlBdbnwkF+r5mI=;
        b=vI6zMKCAnSWCjOhHC4nVFf+N5idIEFM89bpkzOyURl23EdKqka/H2Po44bkSflTYoJ
         gj75VtAayBXLcvnhiCX5lWImWe8JxgT2bj0j3srdU3X+00m81kmpQJiFnW6mas2OG2Xm
         1UFNBmn/iCvPuoOZkm8vHkPaXb/jWkvlw2pAB3RLmV84tMJqNGXneadWu3ZD+bekNCD0
         M+sumH0gsmloyNkdNh5XxOimJbcGsqReHdCofWvrWx5fzRkF0oiK9HnSkqiPb+yNWjkV
         dk/PnwI6DBmckf1cncCwnyTTprZ2Zue6Yrnw+sxJ/Cget+EwamJWg12q0G3mKCNBq10Q
         N0mA==
X-Forwarded-Encrypted: i=1; AJvYcCUBIP6h/Sn7TN59LiPYNg5S+/7YqESQJJiDFG9byiAGq2cZnMzmF4ACh+GhPbjoMsYmpnCeqbNMuTzTDks6Mw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHgBOUzqunMo5OA6to5oRdA3OY3UKF1AC08TsVbRf+ajpV+dcB
	h7joHXESkYZzltWgq/4Es43eQ69hi9jl9iFYWBj0a0Gxiluwti3lRHMAaUlYb/g=
X-Gm-Gg: ASbGnctQiog2SWdn8H9v9wOL5JO0huy3nDUoYZyuVFtneW91Uoi5RgGr4GE3Mq7kKo8
	tIrkN+kXSXjDlAWSIYDVipLs6juz7oWGPIo+4GY0eTNRWJKAaLr+DMnv/jLMjD1Zu1g9fixG1md
	Ad6IEnlJyQFZL+niMGmsUZLxsuI3BQjIcWLOKILOElhJogPdaqnKrKCdlv45V3q7gGLEngOO7A2
	VsAU3PvLg4cRLYd7Xa/vnn9klECnbRx8GWw4xan7jD5/h1PRafjNDysZjMEct4gtaBpZOMUf8lO
	4672RWQiwFucxi6Roo9mW/Zrz+1EQJm6sbKA4Xr0/5VkutrZ+A==
X-Google-Smtp-Source: AGHT+IFM0bk3L92HPL0a5ZdSUwgEKFaDtW1VyX0wWUqemrb2A9UISJTLPEdrw9TUJkHbZkhUzucD2Q==
X-Received: by 2002:a05:600c:3512:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-43cfded98b3mr28404325e9.19.1741636848948;
        Mon, 10 Mar 2025 13:00:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfb7aefsm15672875f8f.20.2025.03.10.13.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:00:48 -0700 (PDT)
Date: Mon, 10 Mar 2025 23:00:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: mediatek: Fix bit field in
 mtk_set_queue_speed()
Message-ID: <20f34718-e60f-4361-9ad7-311d3f67e40b@stanley.mountain>
References: <eaab1b7b-b33b-458b-a89a-81391bd2e6e8@stanley.mountain>
 <Z87e75UV0Qc4oY64@localhost.localdomain>
 <aab6d5f3-7ef9-4220-8b67-ee9b09a5f168@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aab6d5f3-7ef9-4220-8b67-ee9b09a5f168@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130050_575268_A104083D 
X-CRM114-Status: GOOD (  24.34  )
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

On Mon, Mar 10, 2025 at 10:27:34PM +0300, Dan Carpenter wrote:
> On Mon, Mar 10, 2025 at 01:45:35PM +0100, Michal Kubiak wrote:
> > On Mon, Mar 10, 2025 at 01:48:27PM +0300, Dan Carpenter wrote:
> > > This was supposed to set "FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1)"
> > > but there was typo and the | operation was missing and which turned
> > > it into a no-op.
> > > 
> > > Fixes: f63959c7eec3 ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > > From static analysis, not tested.
> > > 
> > >  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > index 922330b3f4d7..9efef0e860da 100644
> > > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > > @@ -757,7 +757,7 @@ static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
> > >  		case SPEED_100:
> > >  			val |= MTK_QTX_SCH_MAX_RATE_EN |
> > >  			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
> > > -			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
> > > +			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
> > >  			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> > >  			break;
> > >  		case SPEED_1000:
> > 
> > 
> > There's a similar bug a few lines above (line #737):
> > 
> > 	case SPEED_100:
> > 		val |= MTK_QTX_SCH_MAX_RATE_EN |
> > 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 103) |
> > 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 3);
> > 		       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
> > 		break;
> > 
> > I think it would be reasonable to fix that too in the same patch.
> 
> Yes.  You're of course correct.  I'm trying to figure out why my
> static checker found the one instance and not the other.  I will
> send a v2.

Oh...  Duh.  if (IS_ENABLED(CONFIG_SOC_MT7621)) is false for my config so
first line wasn't reachable.

regards,
dan carpenter


