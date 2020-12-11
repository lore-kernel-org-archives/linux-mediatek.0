Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EC2C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 19:12:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CDDA22D03
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 19:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CDDA22D03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cEK7IXntiDCcxEL77cp71KpcbUKRxYbIXuAC6KBfTDg=; b=pnRsQEtKrk0tBUucPjLcRk+Cw
	BsAhr3cEQ40wHgg+NjtC3yYTpWCdf8GKAnyHNVrLFqZPeFb7XAulyEQsSEyGYQ57KBjZOLgJoCEXX
	A0n/4ENFx/zhzCYspH3Gq8z8O7TFjtsdKgbuHSKfM0S1sqwRNeXqvgGIRMmk4oiw8FnsOvGT6UkI2
	21fffWvN/SXBgkao6EftBGj1hZrNuS3O8dplDWexYyFfTdGwVwHUAyceDYVaCRViTmTj+ssg73cSB
	purH8BvPGlnSiLdAvaYVjngmYDKOHyAJEhFzkNYLnwYrtmVVHG6OJ0/+aMDdDa9mdLY89riDxRF7W
	psoFGB1dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knnpg-0005EX-JG; Fri, 11 Dec 2020 19:12:00 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knnpd-0005DM-De
 for linux-mediatek@lists.infradead.org; Fri, 11 Dec 2020 19:11:58 +0000
Received: by mail-ej1-x641.google.com with SMTP id b9so13857497ejy.0
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Dec 2020 11:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DU0zog1ZqLuqAvCIYsUQGKS8GLoSJnDCg9BlZ3FS3Ss=;
 b=KEgJkvJyy4wnn32ZMXtfCK81kmVZt1HFkJyX+dGr3GX093Ik0lyu77Q/HHHrR6ZG4r
 tGcAPkSaMKP8VUIsn23f1iUAL40AdLmwcCjyeZrkgcP5dlfYjJorVrghP/86D52gJrFG
 pla7AmvIvoQ4eeJp3B3XGaQ3bOmaq7KgUcGqJyqIf8f3RnpTmP9N4kc5qqW5f1HLakk6
 BCZCuMIk1EVqODLlToUM7P56cCR+jldi7yjNZ0vHoN+HUb8N8PzPruRZjLhOwPjBINsu
 XFsw6+/A0SFPhKkw5yQ0kuC20eLULAhNEjZ/KcZ4sOQKkbt0iIeb72EmprGUBP/Czqsi
 BHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DU0zog1ZqLuqAvCIYsUQGKS8GLoSJnDCg9BlZ3FS3Ss=;
 b=UrbWyI9zwG33cZVtpX3Vg04+nx9X3pLSCGExT6ls2A+kE6w8pSROtSuvS+Wz2OIqJ3
 HdGBUQseUCOY6o6sK9qUINRruUoRUwfL2tT47V1l5OUpV3bj4OAllL/LNWezs5WXM3Xx
 dQIwcegSjPBgf5ygyCA3BVslHbXEroApyb5t8CDJI+urGml4fX+cibwU0QJKouM8iOaf
 pM66rgUYRyVGpmmQh/ejf0NAxvvUJZnVQnVDyk0vNVk4SDLeaWFP3XWUkiWKTJTFlW7U
 g25r2ZAUyZUNJOLhhOypb9mPvqRsM6cin7abkGuinfhzUmc1ZlVfkrfYKxNCZt9AZNvz
 ni/w==
X-Gm-Message-State: AOAM532Reg/uKrkdMuE+8d4IdGjcUXCqhryQMPMyzwexKHBoO3FLwKpR
 VQz+HwzqCwBXXkpNTqOY97M=
X-Google-Smtp-Source: ABdhPJzBP4ujgKsAae2aipyAbtGDcmsZMa1jvAQxgd/m4gQYE+brK2FaCm05CreuuD82LS8Vk1Hb3Q==
X-Received: by 2002:a17:907:9705:: with SMTP id
 jg5mr12446174ejc.448.1607713913773; 
 Fri, 11 Dec 2020 11:11:53 -0800 (PST)
Received: from skbuf ([188.25.2.120])
 by smtp.gmail.com with ESMTPSA id p24sm5654624edr.65.2020.12.11.11.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 11:11:53 -0800 (PST)
Date: Fri, 11 Dec 2020 21:11:51 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: enable MTU normalization
Message-ID: <20201211191151.3xrcv2voaws4xhjl@skbuf>
References: <20201210170322.3433-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210170322.3433-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_141157_576582_C576ED60 
X-CRM114-Status: GOOD (  17.50  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 11, 2020 at 01:03:22AM +0800, DENG Qingfang wrote:
> MT7530 has a global RX length register, so we are actually changing its
> MRU.
> Enable MTU normalization for this reason.
>
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

Makes sense. Since it's global and not per port, this also helps the
stack to be aware of the fact that all bridged interfaces have the same
MTU. We could probably do a little bit better by also informing the
standalone interfaces about the updated MTU, but since the value that we
program into the standalone ports is >= than what the stack knows about,
there isn't an issue really.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

>  drivers/net/dsa/mt7530.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 99bf8fed6536..a67cac15a724 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1657,6 +1657,7 @@ mt7530_setup(struct dsa_switch *ds)
>  	 */
>  	dn = dsa_to_port(ds, MT7530_CPU_PORT)->master->dev.of_node->parent;
>  	ds->configure_vlan_while_not_filtering = true;
> +	ds->mtu_enforcement_ingress = true;
>
>  	if (priv->id == ID_MT7530) {
>  		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
> @@ -1895,6 +1896,7 @@ mt7531_setup(struct dsa_switch *ds)
>  	}
>
>  	ds->configure_vlan_while_not_filtering = true;
> +	ds->mtu_enforcement_ingress = true;
>
>  	/* Flush the FDB table */
>  	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
