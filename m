Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194DCC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3Uqu4NqQPNF2jh2eBUU6anJjJjGTOazrVfjBFPTbG0=; b=4m4iOs6//weJ/bOrE+RoBAKebm
	Btbel0YyeQxIwz0MWL1soQ2ab+KRaDcNaLRYcHw01fJw5HY5GNx0V4O7rADwe/rAF7U4a6E09ADpS
	0Y6CG9hR8k9OtzTR/pmIZTyKMBN20NoeisIJXzMb2VX6GFbB//LMQlt/LTMLp8SoQCPRQPI/PkdDu
	9QzQL0ZsfQPbp3EfF38jTJCm9mQSK+/HeyfVnae2CDm0ceJWDvSRBDucOJkbta843McbBQUEoy0tO
	sqQsRMB0sm4HbjTOWcjKlhp9BP4imB34TezcyaYqasXmL3fl2BiU5W8+GOHLwHqFcccfA5lcaLhyw
	Jk3hRJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR1E-00FBJJ-2Y;
	Wed, 13 Dec 2023 15:19:28 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDR11-00FBI8-2L;
	Wed, 13 Dec 2023 15:19:20 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50bf37fd2bbso9473095e87.0;
        Wed, 13 Dec 2023 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702480754; x=1703085554; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K3Uqu4NqQPNF2jh2eBUU6anJjJjGTOazrVfjBFPTbG0=;
        b=fmIUzwmbLuo9RqDCcVaPT0V3AJYSRhWfDNAYsg/tApiPmK87DqtbqaMPXqeegJI+qS
         9FmASH6kkEzNJJLV5lWdIS9cmLF3YYeOKCt1R26lD532EbpdLWf0Lx6WNMNYoHTTtv+k
         MEnE/48oRWNpDNQDY8mGtr96f+Q645Ho9wNMgrz2ipBL9w0Fcf//vALldoWPsmucqvpo
         NTjFKI8vnOF1eL1cfAEqj2e05QgCv5Qz0AF15hmXgmd6JluPQUHTDscZF7EiYfW7zsqm
         fA2WR/4jwj2zzlXmjNmKGfR4bZXpX3aCFCH/zQa//9SpKLgA9m1QfEQLPrmEd98QwFu+
         OPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702480754; x=1703085554;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3Uqu4NqQPNF2jh2eBUU6anJjJjGTOazrVfjBFPTbG0=;
        b=EO9gff+Q2NYrvB/XU0udu8r2jDIyU2uvKXl3p717pRM9GFNoLOi36OXGtHoXU0Dhfs
         XEzf4KeXOtkanWNqRTIE88t6L39///GzfGRJ8erIG0Mwzr2iiVvY++G+Cr9cuxZgyRXR
         CDjsW34ILEq3WoJyzrnbyBZcndjGZ2+R5Uq90vK2ntsfU5+sOjLTYSj3SgDURlssIWw/
         JKR8ODrVgXN6e2bbd/2r/Pv6IEJ42byIRDL5Y6EaRp9k+i+RGbOR4GMaFQESUEzOa1Ng
         F7txvwldCjtA8a3tfTmB7Gn2l8iEJsltBpZ3CpMe3Jwru9ud9tepkW2IiigFBHN77hde
         rbZQ==
X-Gm-Message-State: AOJu0YyYaphQf0IRRRj3/NBao96rA8AZPfzU8eP230n0+QpGCFDND+IS
	8p8LlwOZdLnt/6azBIMoXl0=
X-Google-Smtp-Source: AGHT+IHBBJM+4Q8XpOLjZTdBo/0XImnsmqRu7N70vT9N0+U7CMD4rDwiruktU0T2IwTO4K1nhwfi+w==
X-Received: by 2002:a05:6512:2253:b0:50b:f776:1d63 with SMTP id i19-20020a056512225300b0050bf7761d63mr5029095lfu.44.1702480753667;
        Wed, 13 Dec 2023 07:19:13 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id ul5-20020a170907ca8500b00a1f7b445f5dsm6673223ejc.124.2023.12.13.07.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:19:13 -0800 (PST)
Date: Wed, 13 Dec 2023 17:19:10 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 00/15] MT7530 DSA subdriver improvements
Message-ID: <20231213151910.hr3n4px7a4upc372@skbuf>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <45221d69-a780-4e81-b4c3-db1b9894a1db@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45221d69-a780-4e81-b4c3-db1b9894a1db@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_071915_805895_FDD1BF8C 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arınç,

On Sat, Dec 02, 2023 at 11:52:13AM +0300, Arınç ÜNAL wrote:
> Can I receive reviews for patches 6, 12, 13, 14, and 15?
> 
> Thanks.
> Arınç

Sorry, I don't have time to look at this old thread anymore.

Please repost the series with the feedback you got so far addressed.
Also, you can try to split into smaller, more cohesive groups of
patches, that have higher chances of getting merged.

