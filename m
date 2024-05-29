Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14480C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 13:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8TXWaSphknRyFXlwVPSJmNAWPWCjpoZ/IQzU41JOes=; b=IuyjEYY+h/9LHszQ+DByk0hn53
	/V91yj892dzzpIenh/lMpr/7HLW99jHd4Sah8jQlJoKFdL1yDNjbZpmun0930LRetZixGotlRxnza
	RZVb1DPaTnjnvjd6lkypRDbwQcgle1X+qO9MAI8Q8IpY2YzjFS5UkJCJyOI3b038swlewvNYdyGb6
	1z62uawDqbilq6vNsIfDlJd31Z76Jvax4CyZdblTxCINw0cY3VujqRWbHXl12IRcY8n0jGdWeN6EX
	PhZs9b07winzcuPpy+mq+a/Mefn1Xul1ehB1k8dyBj55hRQFlcbb4THBtv9vZtAzAsD0E86bzClks
	8n6ZzUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCJP1-00000004Gfa-2yvb;
	Wed, 29 May 2024 13:31:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCJOy-00000004Gf7-3U2V
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 13:31:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4211e42e362so18284925e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 May 2024 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716989494; x=1717594294; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8TXWaSphknRyFXlwVPSJmNAWPWCjpoZ/IQzU41JOes=;
        b=PTr6voKkh6yVtri/0EgIjcEC/kbj/obGlgF3ZauIhjJLj7cOu1wD2qh941imwlQkHg
         7GOy5IFsE+OCnI1zZw4wDBKVV5vtSVHNHk1AOyN1oc5+cNV2SnheN2TRHunVvDWuu4gd
         yOr5vkpsx6Ps18sICznfJTwmAt+HjOLGZxL4FmBsEm2SHmb3n3sXf9DJWAsIKlEAo+NL
         HcNzcjgNZ04/orppJ/oSwjJ2zCRSv7g6JcNsWowhHPP3jmO2tZZXPPyThSL0VLYcw1Jh
         WrFvAFBjuPbGZdgEObO2Vo9x8JYOsWQn2TsFjxzg3zBgVv5WcRWH6hzOy1KLmfXZYEli
         LxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716989494; x=1717594294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8TXWaSphknRyFXlwVPSJmNAWPWCjpoZ/IQzU41JOes=;
        b=rLbJ8VtgOiBkA/ID6IRB97byQaE9lLh4pDJgHo8vQc4DHt/QKlD2f7PxeEXpRXKCP0
         89f/U2/ntpfikaUPKHfZ1NJRWGx9xQ6q42p2SLNJ4QXhlfotwYuhcDAT58h1mqYU+UZ0
         Zd+0bZ1gcUzjJVLYYcQj75VTRpk9tePpVo7JmbKDgYKEGw6mqDFdLdV67srvFZJLEWaU
         80i+J7i22P0iM83DLYA0XiYSXnVfIQtZjSubz1qk1W+J7KR2RJ1fNFqjik1cmye0bBQw
         HGcgZec8sogTZJdU4coSz20KlxC1YFjs6znCT+Om2QGwH1D1dnc2Sc7FFzvLXT0YNO4h
         7IDw==
X-Forwarded-Encrypted: i=1; AJvYcCUG77Yeqs7yk00X0YVeHR5Y6kRon3BxFgY6kijNn/5GMl/n/mi1keEhVFzw7TxBovsVn1nRKEUrJzKeD7MBKCtr0FAfAi5Y+WDSLfPn0HOqLAS7
X-Gm-Message-State: AOJu0Yw1mA/AaSGgTGS1pPuzULqCcxwpZMgM/BeP2UCUw3yBtBenQhhI
	cgRqChHHXsfBe0s27DC5lem3AMU9gxleJMfNAeTRaMynkdNzcvJ1
X-Google-Smtp-Source: AGHT+IEiSi8Wb4gEyoqJ0GwZKpXIPGUm/w8HEr8XL7jtptq7fAagbbYrv6g4/t7o18FgY0f3ugOtvA==
X-Received: by 2002:a05:600c:3b25:b0:421:2202:1ccf with SMTP id 5b1f17b1804b1-42122021e73mr18478995e9.28.1716989493895;
        Wed, 29 May 2024 06:31:33 -0700 (PDT)
Received: from skbuf ([188.25.55.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100eeca80sm213624315e9.2.2024.05.29.06.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 06:31:33 -0700 (PDT)
Date: Wed, 29 May 2024 16:31:30 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, arinc.unal@arinc9.com, daniel@makrotopia.org,
	dqfext@gmail.com, sean.wang@mediatek.com, andrew@lunn.ch,
	f.fainelli@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	nbd@nbd.name
Subject: Re: [PATCH net-next] net: dsa: mt7530: Add debugfs support
Message-ID: <20240529133130.namqhprxpvhzgkzr@skbuf>
References: <0999545cf558ded50087e174096bb631e59b5583.1716979901.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0999545cf558ded50087e174096bb631e59b5583.1716979901.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_063136_900446_58E0E391 
X-CRM114-Status: UNSURE (   9.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Lorenzo,

On Wed, May 29, 2024 at 12:54:37PM +0200, Lorenzo Bianconi wrote:
> Introduce debugfs support for mt7530 dsa switch.
> Add the capability to read or write device registers through debugfs:
> 
> $echo 0x7ffc > regidx
> $cat regval
> 0x75300000
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Apart from the obvious NACK on permitting user space to alter random
registers outside of the driver's control.

Have you looked at /sys/kernel/debug/regmap/? Or at ethtool --register-dump?

