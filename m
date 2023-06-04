Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC8DC7EE29
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 13:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehsXLibKE7EsdL7h37Ey3hxWw2NtYcUCkyRCtwhN2Ag=; b=pi4wvdteGy3uXLM/tP/o02LKaw
	P9cxlHn4zoHbWesqtvRZYmp5HLCp4G+UW9FXRk9dHn6zDQBkC18jz6edz3NtNplG1dcb+L5RE6HpZ
	hrMP23bN1WLmhAYnEX1Elmaovjeu1swSrTKCK88/EtdgU1V1CMXaxAl87o9AoosKPYC5HGhIonkt/
	NBfiRIEt4nUq70WMz2tmgXLOwB/hnGq6Ru+ZxNGY2JseH1DQyY7pKZtPLyCBkjCzbzcAfq4xN7vuD
	LEj46WFPqSeTLnfzi2kRvu5MtKbD7jeWNIrOym7VOc7WlqVXkrlB3TZzuKJbWhaSFigKh0BTQJT9H
	fn1vO7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nT0-00CCES-2F;
	Sun, 04 Jun 2023 13:08:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nSx-00CCDl-2h;
	Sun, 04 Jun 2023 13:08:17 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51456392cbbso10430983a12.0;
        Sun, 04 Jun 2023 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685884092; x=1688476092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ehsXLibKE7EsdL7h37Ey3hxWw2NtYcUCkyRCtwhN2Ag=;
        b=ho+w3R3eBSHT8APyM7DlSIiJgXHu4swFXy6oR7N4hSWfBv4/VSLDlCoenkxDecIIlT
         2+LSHeMWaiAkSJRBhQOF0gj8sXyagxD4+joGAovn0s8rgH4HAIg2vLslWxfoyu9ui6Fu
         OlGh3SmmHNly48F0zQ4V/bEY/w6BNQ8D7iN64zGovx2m6blJc24vJnmkCGgr904JwbHJ
         rRNMnRblhHbjaonYZhEO1tajssgFtoPZb8r4PLZ/J7ypsYZKbwhSe/TIVbaiZ+Tett0f
         tLQ+5rBRC84k0ATMBhVTl2UcI9J8XkHk+h6psOo3h0xlqUICdWWX9pyvfey8ekmv1MZF
         XDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685884092; x=1688476092;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ehsXLibKE7EsdL7h37Ey3hxWw2NtYcUCkyRCtwhN2Ag=;
        b=k9jOnlEgkShZ742m2rCjcNxUv34jngFZL9Eyi6lD40jbC97VBeBS0zKjIhOqvxveAp
         L3MBRpnNB1poDAlose7T7jL4twLMtuv+QUHicUwsa4FXiZbybrZEY77XmtbCc4Yvncgf
         OUB+aEX3UnApK9DAhlPmiuthpOnHpNVXCCPVVhFjqz4iVJV2rLIJ1+Xj7XsRibT/F3fc
         /ENthoAz4zPuxDCnAtu/p77IkYb2IPoytOX3/VFHwxk8XxnPvd0Zvg6MpJTYo/pBw4e9
         zdsDSfplcsHLQ5QZuvlazWCpFKS5pU/KbcDI1an3VESj4CBHYtnbeH21pK5xF9cm9czI
         OOBg==
X-Gm-Message-State: AC+VfDxS+QG1T0MOuC4ShlHFQEnUMvwJrytqltRe1dqPFTJ5F2Xgzl/N
	e72i2td+PcQcv3q++CutJaU=
X-Google-Smtp-Source: ACHHUZ59tILfc6BM6SJHOqRlylQ71wlvooctdxI8yBhJwx+vZqx3AMdIhV5aVsgRYPcUsvofHoWPVQ==
X-Received: by 2002:a05:6402:34c4:b0:516:5b18:a9f1 with SMTP id w4-20020a05640234c400b005165b18a9f1mr836092edc.0.1685884091938;
        Sun, 04 Jun 2023 06:08:11 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id b9-20020aa7dc09000000b005149e64260esm2773600edu.16.2023.06.04.06.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 06:08:11 -0700 (PDT)
Date: Sun, 4 Jun 2023 16:08:08 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 25/30] net: dsa: mt7530: properly set
 MT7531_CPU_PMAP
Message-ID: <20230604130808.3lxuz5ezsouhku57@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-26-arinc.unal@arinc9.com>
 <20230522121532.86610-26-arinc.unal@arinc9.com>
 <20230526155124.sps74wayui6bydao@skbuf>
 <9423a818-f9c0-d867-7f7d-27f05e1536b9@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9423a818-f9c0-d867-7f7d-27f05e1536b9@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_060815_877451_BA7E8D78 
X-CRM114-Status: GOOD (  22.97  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 04, 2023 at 11:21:48AM +0300, Arınç ÜNAL wrote:
> > Stylistically, the existence of an indirect call to priv->info->cpu_port_config()
> > per switch family is a bit dissonant with an explicit check for device id later
> > in the same function.
> 
> mt753x_cpu_port_enable() is not being called from priv->info->cpu_port_config()
> though.

Quite the other way around. I'm saying that mt753x_cpu_port_enable(),
the function whose logic you're changing, already has a mechanism to
execute code specific to one switch family.

> I'm not sure how I would do this without the device ID check here.

Hmm, by defining a new mt7530_cpu_port_config() procedure for ID_MT7621
and ID_MT7530?

Although in a different thread we are perhaps challenging the idea that
what is currently in priv->info->cpu_port_config() is useful - at least
half of it are manual invocations of phylink methods which are possibly
not needed. If after the removal of those, it no longer makes sense to
have priv->info->cpu_port_config() at all, then I'm not saying that the
explicit check for device id here doesn't make sense. Just that it's not
in harmony with what currently exists 3 lines above.

> > > -#define  MT7531_CPU_PMAP_MASK		GENMASK(7, 0)
> > > +#define  MT7531_CPU_PMAP(x)		((x) & 0xff)
> > 
> > You can leave this as ((x) & GENMASK(7, 0))
> 
> Now that I've read Russell's comment on the previous patch, the below would
> be even better?
> 
> MT7531_CPU_PMAP(x)		FIELD_PREP(MT7531_CPU_PMAP_MASK, x)
> 
> > 
> > > +#define  MT7531_CPU_PMAP_MASK		MT7531_CPU_PMAP(~0)
> > 
> > There's no other user of MT7531_CPU_PMAP_MASK, you can remove this.
> 
> Should I do above or remove this?

No specific preference. If you want to make this driver start using
FIELD_PREP() then go ahead.

