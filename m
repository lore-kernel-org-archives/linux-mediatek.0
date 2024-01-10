Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F2FC47073
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSgFVUPD+lhj2fkhdLXiapb7C+A3P82l8Au/eKfRJKw=; b=DpM3kfXe+L9zCgM+5ERwdj/lBR
	ECqiJ3JG7Ndg5PH0fGgYBuYoFWdcFc0McdPNr+qdRZFqBEGCApntUwwHGOHj5UhWICY2goCx4nDDK
	Ab3yJIUckKgxQcEBZLDly7vF5PzUNLm4Mayn5jaFKJIN+1u9rUvM9eYT/IKBqARwACvBHuH9z/DH1
	QU+Rksq9I2S+NLLghlUi1gK45DGMfwr6kgMC02ZlBcyThHCxMJgyG003Dr+g2t27nFwzTlMJ2Xah9
	UurxBTSZJ1cEwDRPWmNatZsatko81MZAEZdhhCo94EKyayNe5GiAtDfGzaQKlFloywUfb5Bq6wmi0
	t+wVGMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNcxM-00DMMO-1l;
	Wed, 10 Jan 2024 18:05:36 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNcxI-00DMKg-2f;
	Wed, 10 Jan 2024 18:05:34 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a2a225e9449so475552366b.0;
        Wed, 10 Jan 2024 10:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704909929; x=1705514729; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eSgFVUPD+lhj2fkhdLXiapb7C+A3P82l8Au/eKfRJKw=;
        b=NGz6PvLKwn/JMO7Du+znmFuEkFdVJHtTrIYFsLlyE0zf9RCWjSnDBEKoTvEPC5DBaZ
         1bfU7caCjkvo+fKsI0RMc1D/+c3e2rkSB9Ju5oddv95At5exofXLWdUGpG1rOh0Yus9x
         uKdx39t9JaJOF9Y801eh3uOPTpvZXmTu1GHhRwKlvqyTovRsfPDE6zu3KZRWUEPo5OrO
         OMYUdF5d/2VEmpW8dK88qvhrjoleggpJv3JnHpJfV//lUW0fUBRX9152J9Pq6i+ZGhIX
         T+hybGGvvw9yQgRd/I6rDBcrjcnqZS6r+x82GmoXCDVn70c4/oVkZuKRrnp44QICAKcz
         Yteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704909929; x=1705514729;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSgFVUPD+lhj2fkhdLXiapb7C+A3P82l8Au/eKfRJKw=;
        b=aDKzMcIfBQGlomJIt7OCwVStmDM8bPLQDJlU3UQ1yxgVgno73pDScGdOOcMFE29awo
         3ifUCe03sJYjEDX9FRPNgfoKmr9Zu9BmtSN4RljF3+xU7tash1bYf3+i1vpGCOqZHCzU
         G0kOBWdLZWvkJNQXgpJ00b10d/afij+Bn+z7i9sF8J4DZ3WuHXeFhpzebAp/eqM1JMYw
         gcCI0OxcRQ+MQQFECfBpjN7vmzxUdAdKT2EvIDxYXMFIE2T0xfHDv9bUvk3Yd0XhVdVh
         n5e4fs0IMjy3TDQHSCprEYeeymhKpXVcBhGXoRKCLjX54PYbOYBGu9o/8sKL2tUGtMKi
         3e5g==
X-Gm-Message-State: AOJu0YycdtfBobgMGB9TC+ep1DbxlLaOyIqJB2aEi6b6VhnWRH7xS1rB
	EcTuSSW6NEYLNf/702HVOn0=
X-Google-Smtp-Source: AGHT+IGbx7BchYP1qhwI8qDfBQPy+wc1dgtHkZDQ3u4HiZTqJo3HVnAOZSXIaR1m4CUy1jtou3dIyw==
X-Received: by 2002:a17:906:5fd9:b0:a26:874f:4847 with SMTP id k25-20020a1709065fd900b00a26874f4847mr804587ejv.65.1704909928742;
        Wed, 10 Jan 2024 10:05:28 -0800 (PST)
Received: from skbuf ([188.25.255.36])
        by smtp.gmail.com with ESMTPSA id p17-20020a1709060dd100b00a2689e28445sm2317376eji.106.2024.01.10.10.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 10:05:28 -0800 (PST)
Date: Wed, 10 Jan 2024 20:05:25 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Message-ID: <20240110180525.wwxkkoqam37oqm2f@skbuf>
References: <ZHy1C7wzqaj5KCmy@shell.armlinux.org.uk>
 <ZHy2jQLesdYFMQtO@shell.armlinux.org.uk>
 <0542e150-5ff4-5f74-361a-1a531d19eb7d@arinc9.com>
 <7c224663-7588-988d-56cb-b9de5b43b504@arinc9.com>
 <20230610175553.hle2josd5s5jfhjo@skbuf>
 <22fba48c-054d-ff0a-ae2c-b38f192b26f7@arinc9.com>
 <9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com>
 <9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com>
 <20240110142721.vuthnnwhmuvghiw4@skbuf>
 <b47311f8-315d-46d9-bd5b-757141708a3f@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b47311f8-315d-46d9-bd5b-757141708a3f@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_100532_893617_482F0657 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 10, 2024 at 08:15:20PM +0300, Arınç ÜNAL wrote:
> __builtin_return_address(1) doesn't seem to work. I'm running this on arm64.

I can't tell you why either, I'm sorry. I can just point to the
documentation, which does specify that "On some machines it may be
impossible to determine the return address of any function other than
the current one". If somebody knows what this depends on, feel free to
interject.
https://gcc.gnu.org/onlinedocs/gcc/Return-Address.html

On my NXP LS1028A (also arm64) plus clang-16 compiler, __builtin_return_address()
does work with multiple nesting levels.

> This is very helpful, thank you very much. This is what I deduct I should
> do:
> 
> First patch: Get rid of cpu_port_config().
> 
> Second patch: Collect port link control register operations from
> port_enable/port_disable and phylink_mac_config to
> phylink_mac_link_up/phylink_mac_link_down.

I guess. Sounds good.

