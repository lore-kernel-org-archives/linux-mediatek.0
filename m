Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7789BC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 13:35:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 444432063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 13:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urOygQYm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myGAulX+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 444432063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GEp4OwxzKbj2OXiWHmGj2FHpkVL4UiRkVzP+yUDTCJ4=; b=urOygQYmj7mJ53dUS9I4i97yz
	zGSZp2K1usmPJx76CphH0z6O2TtyqVHddndFonKHW9NY4yQi7CDeXv6rKzOwLHTGKrq9OeYb5sXgh
	inPiC7+fYTWSm2HRfFbdB5hguaCn4eVXZVCCFkgYDaKYtOgkuCzP07Y+sC654U3Gz7jLTOEmNdy3U
	PflZWf9rs+toTd1VGjjJZzBwYjO5uvQUK+4aw+HAZav6/ClVi+1CnqvJBX+o+XEKR/hx9WS8XHuWE
	toWwq4TcMnjDtc8JhGkuCtO3YsWeBLe4RkV1BC6AEmj0A8L4/Iuac0CH4/IBa2iaDsuXVIjm4jwX8
	ubJvw9T/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kACdA-0003ZH-9j; Mon, 24 Aug 2020 13:35:24 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kACd6-0003YI-W2; Mon, 24 Aug 2020 13:35:21 +0000
Received: by mail-ej1-x644.google.com with SMTP id b17so3641455ejq.8;
 Mon, 24 Aug 2020 06:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qBlPQKIK+Sf7xnyBmBOxFqnfqkDGJ7ZbBkjJFcCppis=;
 b=myGAulX+pUpcUtuzXi8/ExHy7RBGxysvvhPJAYGx1lH5EEqh9Cnme9j3kPo5dMV6h2
 /bwQ7L37JAHRCg5FrBZ1t1bJICI7yIpgMcUO1QcPtYSZitZjpbTS3McvwiD4IuX8YhGn
 OweCm0GoVCaAQKXr25YzIi9fmNAHU9tJRGivXBDxXAg6VYiMRpAS+MVDTH1/9DgAyfSO
 5UcyeaVNjlPc4GlTR4FIQqb6SV69PN+kMACyCYLf7iE8wtWkwWe4eSaBcVoMtamqbQ/7
 533jc/8Cn+gkrWqb/C4B3oZtt6M57HKQKhc+YiZyUT/4vAX/XWFqH/GOvy9YW6Uo+20Y
 sMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qBlPQKIK+Sf7xnyBmBOxFqnfqkDGJ7ZbBkjJFcCppis=;
 b=KTSgQuD9lFGHWIc1HQFqzQ4ahSzYM8IAWwUdLYSwwMjL4ChDdwnqIt67lc/XfxIdSH
 1PFsvd5rdye+Q0BQCG0YbbU3/ZhlziiNB9NSxNCM5eWBmg7En1VCbwR45f9Rx8BHgu/V
 Ubg7jgUWYo4t6kYge5s9HXuWwrn3emjLEHpyTAsGaph/cfUmocZLrGnoa+BUqb3A6naH
 wjYxqnRydr/s8eegaIhVuoqMho1VcNx4z72hLR2/jCEhV2ihiP4joZJfULIJeO/odT2U
 betCAhoGA/IJVb7/TBtcDjY9UAdjL3TZicqGuNzgKtbsoKMwSNvXl0B7pn311EAM1VFD
 p11Q==
X-Gm-Message-State: AOAM530QeJdY+Ltmbw3rvApsxk+spHDjYs5oaC7G8+6WoKVVy7HSFwOs
 /drAh+F/lTlOFORhPmUja6Q=
X-Google-Smtp-Source: ABdhPJy65pU8bdTG9sbTEPvCuA2gIvTWDt31MWk9H33q/YltEelKWAmDpJ8s5mvLZNd5HPHZsDgBzw==
X-Received: by 2002:a17:906:359b:: with SMTP id
 o27mr5890797ejb.103.1598276117958; 
 Mon, 24 Aug 2020 06:35:17 -0700 (PDT)
Received: from skbuf ([86.126.22.216])
 by smtp.gmail.com with ESMTPSA id ay5sm9590726edb.2.2020.08.24.06.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 06:35:17 -0700 (PDT)
Date: Mon, 24 Aug 2020 16:35:15 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH V3] net: dsa: Add of_node_put() before break and return
 statements
Message-ID: <20200824133515.j6ujfm2tl2hqjo5u@skbuf>
References: <20200823193054.29336-1-sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200823193054.29336-1-sylphrenadin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_093521_062729_0A771E25 
X-CRM114-Status: GOOD (  22.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org, vivien.didelot@gmail.com,
 Julia.Lawall@lip6.fr, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 24, 2020 at 01:00:54AM +0530, Sumera Priyadarsini wrote:
> Every iteration of for_each_child_of_node() decrements
> the reference count of the previous node, however when control
> is transferred from the middle of the loop, as in the case of
> a return or break or goto, there is no decrement thus ultimately
> resulting in a memory leak.
> 
> Fix a potential memory leak in mt7530.c by inserting of_node_put()
> before the break and return statements.
> 
> Issue found with Coccinelle.
> 
> ---
> Changes in v2:
> 	Add another of_node_put() in for_each_child_of_node() as pointed
> out by Andrew.
> 
> Changes in v3:
> 	- Correct syntax errors
> 	- Modify commit message
> 
> ---
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---

If you need to resend anyway, can we please have a proper commit prefix?
A patch on mt7530.c shouldn't be "net: dsa: " but "net: dsa: mt7530: "
as "git log" will tell you. The difference is relevant because "net:
dsa: " typically refers to the generic code in net/dsa/.

>  drivers/net/dsa/mt7530.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 8dcb8a49ab67..4b4701c69fe1 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1326,14 +1326,17 @@ mt7530_setup(struct dsa_switch *ds)
>  
>  			if (phy_node->parent == priv->dev->of_node->parent) {
>  				ret = of_get_phy_mode(mac_np, &interface);
> -				if (ret && ret != -ENODEV)
> +				if (ret && ret != -ENODEV) {
> +					of_node_put(mac_np);
>  					return ret;
> +				}
>  				id = of_mdio_parse_addr(ds->dev, phy_node);
>  				if (id == 0)
>  					priv->p5_intf_sel = P5_INTF_SEL_PHY_P0;
>  				if (id == 4)
>  					priv->p5_intf_sel = P5_INTF_SEL_PHY_P4;
>  			}
> +			of_node_put(mac_np);
>  			of_node_put(phy_node);
>  			break;
>  		}
> -- 
> 2.17.1
> 

Thanks,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
