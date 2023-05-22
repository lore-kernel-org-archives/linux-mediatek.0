Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80262C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 15:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFlUZmtcEFUGRJLdJ4IMhNurzNwCQnfw3VnK9RxExKk=; b=VTRnvofCS18J1EsFECVJR1szf4
	N1k8WZWIzjjf2tN8VQLVZaANHUIu9WYvqoFMGL0ftSTGDglVM193PFskCQIVWr9r5PlgAAT9Iiia3
	Djv3iGoivWmtlIQZ8an5+dWU4Z5fJ6y9G8zRoiMVTdniT22Bf4BLgGIvsGBpPybn6ASS2aNTM8Chs
	oFEDjhU3K7von1ErqpJjME+u5xfCtkaDv5HAS+jPpOGrWWA/X5I7NhzKwg5T6y7JB2TSNicvUXr/Q
	4XwCo+qbd6WvpyS44WQ/ath2UG8onNiv0sXDaocrQefCDrhGhNZt3pHnc/TBkunesl5PJoT2Dpevv
	hOXh12IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q17hE-0074Bu-14;
	Mon, 22 May 2023 15:43:40 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q17hB-0074A5-0Q;
	Mon, 22 May 2023 15:43:38 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96f850b32caso608199866b.3;
        Mon, 22 May 2023 08:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684770212; x=1687362212;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YFlUZmtcEFUGRJLdJ4IMhNurzNwCQnfw3VnK9RxExKk=;
        b=ALR0+sN3cJmqm5YRGQVYJ27udzZd4OHs+U76NwiRwAT+gfljBvpy/cFKAN91f28DlW
         QOEsN2vSjg1YEbWbgqmPd8hAR9XRERQwfbgi4a5urAdZqFc8+h0GYu+2JI2fLvWNFC7T
         ABgC3IDf1+ESpnj1828uKLiyj/CCG8OkVVkwlXw7bI4qU/uonY1e5LHG3d8JCjLvj8uw
         BeCDg8gF3Y497/FoyvpzBynopYfd8EV6QAXXNziErCH4pAZULbqoP+5RPyDJ1/3+ABxe
         fIDkS4HpzVZ/coha2GfCG1KZ5bZaSc3uf8CoTuLHXNDVstOrW8gplis2inlHNbLdM1qu
         LEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684770212; x=1687362212;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YFlUZmtcEFUGRJLdJ4IMhNurzNwCQnfw3VnK9RxExKk=;
        b=OgAnW9aZY+mz524hkmHjuJ4ZvIwVddZiUUDEZII9r/gM2Ce0ab5J0mWpWpXvPhweiz
         B29vw3SO/Uv29t5/0KBaGYdEOQ2lW/9vQ6ZtGnCUgMDo28vrXX1thQK19ts855ZbtAXY
         PuJbrxZAgLuZYSZotwYsi6ZfeKymRBXRcZ/LifkZ+ylkLYr5OGbA+mWK7JB4saKUagFx
         zt8Gal06WyhmQXuSy/7U0PE9FpGKhFiD6OTMXP+GZQLf41/HbOHYb0KSKqBhZfZgQ1mv
         fe7UnEQ/7z83s7dpMQPmvOxEYzB3cP9A+nUWwDJnMpvoACdRGbV4WA3Rl0tL69SEoW1J
         Zyyg==
X-Gm-Message-State: AC+VfDwqbhz2Jr+lLRJswwcCYbufplU0FIao8BMgqOZ04LGmYGq19vn5
	7z/Z3c0SNGUfa/bFlWZ02J4=
X-Google-Smtp-Source: ACHHUZ7G64caxfVS+RsX/khR0zw6oy3v3ttbJXFrG+JI+YW3XuGZFFBdcza+hiosaEZTIQMtOOKwMw==
X-Received: by 2002:a17:907:1b29:b0:966:4d75:4a44 with SMTP id mp41-20020a1709071b2900b009664d754a44mr9735908ejc.24.1684770212243;
        Mon, 22 May 2023 08:43:32 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id s2-20020a170906778200b0096ace550467sm3266289ejm.176.2023.05.22.08.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 08:43:32 -0700 (PDT)
Date: Mon, 22 May 2023 18:43:29 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 00/30] net: dsa: mt7530: improve, trap BPDU &
 LLDP, and prefer CPU port
Message-ID: <20230522154329.n23j3wwbsh7b47m3@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <5feba864-b792-4fe4-a58a-e1b22bb7842b@lunn.ch>
 <0346d5dd-bcb8-1bd9-6943-2c9d83587364@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0346d5dd-bcb8-1bd9-6943-2c9d83587364@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_084337_168875_EBCEBDB5 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 04:37:28PM +0300, Arınç ÜNAL wrote:
> Later patches require the prior ones to apply properly. I can submit the
> first 15 patches, then the remaining once the first submission is applied.
> Would that suit you?

Please wait for some feedback on (a subset of) what you've submitted thus far.
Thanks.

