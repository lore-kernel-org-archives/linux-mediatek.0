Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7986AC10DC3
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cyd5phiUGtF3gGm1M6y6XMNxNpiGb0naeJEFalYfR2w=; b=THC8BF3Sn4XoodqUJgcOEg9UTY
	eVrB85dYEdr2SwPGlWCDP0Vw1DlBKK/Lxlf7y33tia0RNjKjxRPVBCF8Qu7JE4oDRsG9fqVWyjK7i
	pvDcL/qNk1/zvJUN0MOnwxyzxg1r2K6r+qdkzo5HQ94G+G5ZKXg8QIzIgKI+z8eb/CBRPP688I6aD
	xyLC69EEo216QtQ0uWkljAeHvQVJNyLnuiSLzkwt/CDv9uzIAuSQ9gEImefvtp7B1kb7CwPWtrGWI
	DQlbjCgP6YQVuHuLwhvh5DgDe0UZtzNtOT/WUqHOS5Bv3HyygIqUVIXa6NUJlt96H2QEzNS7rMSQm
	utQT2dxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIj6-00DbUR-2u;
	Thu, 07 Dec 2023 18:03:56 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBIio-00Db9Q-1f;
	Thu, 07 Dec 2023 18:03:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a1e2f34467aso120574066b.2;
        Thu, 07 Dec 2023 10:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701972216; x=1702577016; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cyd5phiUGtF3gGm1M6y6XMNxNpiGb0naeJEFalYfR2w=;
        b=W53gA5I0uOrVK8fQjGzVwpmwmNfe+1/78Rblm9coFMsfVtKGWal5ofAUhCHKLHZqXt
         sIXUyMFU4lUg5M79XZlL51cWt5zdjXHWDxelefvUmuA8G/k3Bh3kkOoXKmOTWzRqYQrH
         KBQ4iTM3FzZjMxViqQrypuGUffz8bTbXyJiKo7JyVkTb7bj8zF36L6XTbtWtQKkDEJSW
         fbAIX5pRmRUpbgWYqAGvOwAjmmMrLqxF49Y5aMkOudE1A4lbTYYzxtQzZYseS3bDO6JX
         gNYjJb78J585zyXYOvWl3PM9xpJvX6fUfQRW+oMrkeK3jD1zqg7OexdYVeYWZPz7LSly
         acuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701972216; x=1702577016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cyd5phiUGtF3gGm1M6y6XMNxNpiGb0naeJEFalYfR2w=;
        b=lXVXreWqdLTc7ks2Ky4b8bmDQakRWuiBvbUBs7UgFLfIxSsaPvTMVRJaPtuW023Y5E
         6UJjmOAu3nke2ty4eQEQxeYMmmynHZ8B5TD6cHNu29UWZyazHbauvlNAnv+PRWie/ecN
         lKsreKsI1CvCU72z1eqg5pes47/+tNOdB+a0Rfi69hcc5fKVso+IJ9TwvtXIY547znKy
         Nc/Ye0tUZs9mwBQ0Sm8GLPS1FxqWPOMLiEwyTxnvCwz26wptjFZrhEkSWaaiIX3UPh7X
         j0NeHl42dVrAVnFsOsWnns0hPYZhsfztqSHDq/Xq+9Q9esmk9bQOQHVHVyhQZfNfDEsn
         WLlQ==
X-Gm-Message-State: AOJu0YzHl4qs7dH4VUqZG7HaZBzH70OZovzfAg/LJYrcibWIKcMPBNiR
	Dhzu4Khogyyao3Bm+XbuDuM=
X-Google-Smtp-Source: AGHT+IEb+8/GgdfwY783D66zPQhIszkM1fWsRJgqvO0vREeyx1Z2tXbyEmShioG3fZn9KBdhMDEBMQ==
X-Received: by 2002:a17:906:fa92:b0:a19:641:66da with SMTP id lt18-20020a170906fa9200b00a19064166damr2080980ejb.7.1701972215689;
        Thu, 07 Dec 2023 10:03:35 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id vi8-20020a170907d40800b00a1c7b20e9e6sm40275ejc.32.2023.12.07.10.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 10:03:35 -0800 (PST)
Date: Thu, 7 Dec 2023 20:03:32 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 05/15] net: dsa: mt7530: improve code path for
 setting up port 5
Message-ID: <20231207180332.ugfp33xcdkw3elrw@skbuf>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-6-arinc.unal@arinc9.com>
 <ZVjNJ0nf7Mp0kHzH@shell.armlinux.org.uk>
 <5e95a436-189f-412e-b409-89a003003292@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e95a436-189f-412e-b409-89a003003292@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_100338_621463_9AF5A44A 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Dec 02, 2023 at 11:36:03AM +0300, Arınç ÜNAL wrote:
> On 18.11.2023 17:41, Russell King (Oracle) wrote:
> > > For the cases of PHY muxing or the port being disabled, call
> > > mt7530_setup_port5() from mt7530_setup(). mt7530_setup_port5() from
> > > mt753x_phylink_mac_config() won't run when port 5 is disabled or used for
> > > PHY muxing as port 5 won't be defined on the devicetree.
> > 
> > ... and this should state why this needs to happen - in other words,
> > the commit message should state why is it critical that port 5 is
> > always setup.
> 
> Actually, port 5 must not always be setup. With patch 7, I explain this
> while preventing mt7530_setup_port5() from running if port 5 is disabled.
> 
> Arınç

Then change that last paragraph. You could say something like this:

To keep the cases where port 5 isn't controlled by phylink working as
before, we need to preserve the mt7530_setup_port5() call from mt7530_setup().

I think it's a case of saying too much, which sparks too many unresolved
questions in the reader's mind, which are irrelevant for the purpose of
this specific change: eliminating the overlap between DSA's setup() time
and phylink.

