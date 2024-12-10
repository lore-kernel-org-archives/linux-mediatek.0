Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6EFE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 21:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nm2Mjco+od8VJPNesv7f8taGbBUYsjl37SP0Hd6X4WI=; b=HnDBWQqjznRZokYtT4prLWqg+A
	jGOxBEICqignPV4YAb+EAPlHuakDzBzJJt/4DX9ugXItOIOib+IU/p17kMMA4wEfBsCd8MaFrMEjf
	fvCNTIY1Rtw+jDtPEKdcGX/8Xlh5xSdTeW3io+8QABCPdWu10YK1npiKKcVCDt6Q07MQkVoASiQWP
	HW4GFa/2bah18BFGo5k7HIz0lV5bzu7iaBz8rAIfOYRn5D8GlimfgWuIbHH/NRi5AdH59zdyaCtm5
	q0XEL+Uh7NnlJKlB7wiY5gbkzjjl7V7FTR5CTVytvK/vVG9pnthF9MmjfoSSZCsRKmT6nPbtgcWNo
	kSUNbRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Qy-0000000ClU5-0wwV;
	Tue, 10 Dec 2024 21:06:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Nz-0000000Ckvn-0QiY;
	Tue, 10 Dec 2024 21:03:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-434e3953b65so26272405e9.1;
        Tue, 10 Dec 2024 13:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733864593; x=1734469393; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nm2Mjco+od8VJPNesv7f8taGbBUYsjl37SP0Hd6X4WI=;
        b=M1zC7AKguLS2sJ5Sm/G43ehW9WD5lT2TmC8TAm4ykloj8fccl9U91AG5EM56m5nmkY
         GhdtDKG5D115uxr5iUfK3w8K/79Ip/OhwChx9L2mjWj5UjIpUpa9QN8plXdr4bqd6YSW
         U4rGoErluWiqNBrbOMcGXUsrf3sMPEbruGBFcdlopFpyju1PTMgeNA6dr6nexA/UtsZw
         CbSVT6lmlK9MFnwqV9Pcaxnrbd1kavrlMMkdZjTkQ3ow/vfuLKxYgnzQmjbtPkRAPs7T
         T+BbXSjEUOsiNL606UjnSdQCY4Xgi9C/YFVbhk+QiZ9Fg9kRsmaQOiMTYzF4a4CJTmUJ
         jbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864593; x=1734469393;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nm2Mjco+od8VJPNesv7f8taGbBUYsjl37SP0Hd6X4WI=;
        b=qKbsfcNr6Ic78ppXnRD8E5eO7db4CtyvP/RJu4rirrU6W4fiv91Z2OFMy3RJds06q7
         sNt5an6pOdLbMM/DyCu8+C9QfT//uf6PYXhEgnGqy8r0FIW8iGIAhCrim5jmkqF04kW9
         bcwc8Z07010dqJmnqsRAaD2/ajDtXXUYeaDPT1uyJP3SKHXNE5SohPVJ+7oaqokTon0q
         dXr3RdXlZavr51C4z261queURE10Ixggser3rA02TGvFpzvPwJ3nqvMUc7Oy8NlVy4J0
         lw8DiRROJ2VX02KP6Z/JA4c50vt04JSfsOXOZxBg0v23/ekbwlJNwlRCo7asKVcoV7No
         fzVA==
X-Forwarded-Encrypted: i=1; AJvYcCV3m60rTvV57OE/8tlq1ZbbY7JEZtWmzgOu8VLUP4rnR8HREACZSGOeRk6ICloaz3e8t3RaHy1G6YY4gWrzLds=@lists.infradead.org, AJvYcCVNHRAXhn2T/SYKsBqQZMLv8kvV7+liW/o5HauKYKTYlqACSaKdrd8X2xl8+qFtI+WR6Ah2fL3q1VEAJ8StRuh6@lists.infradead.org
X-Gm-Message-State: AOJu0YyVTMur7gXQpz1Hui/UV1w4Dw4tFS9AlH9F3jcrt4sjZ9Hp7BLq
	oRXkbngYP9LLlX9/OniMm5tg/zDGSy9I4tBfUz6rNTI7ITz0wPEz
X-Gm-Gg: ASbGncsO+fdN/Ut6p5OBG0seFGnJrQxG/Xou7ZZexMgxqQBFcVKrIF4MY7G1Hx0mZdt
	S52sIrFd3w7brObjM3ut0VgChBrVu+GP0cpBx5VeJsAeDlVsIpdVTNNRJoLr7GEP7+TzlBCNFZX
	kp11gXBeDbOvy38TDp9E+KmqmvLshXQqPYYutCH5ss9tGW2G/0lgZzkd5ZHqVM/JtQPgn8QjSEi
	AjQbqku5vTyljN5m3kMjTaqn99rnOT88/cTjWQtjgQQu1meoltBCsD9g2KPAy9xUYwPF4LshIuV
	1mCUFMKm1g==
X-Google-Smtp-Source: AGHT+IEXtT2UlScHLsjoILK+fcmMLa5fdqey9hRCAZXHg3/61m4/0ewYioRKLrqpj0zjb4ItoNJGrg==
X-Received: by 2002:a05:600c:358b:b0:434:f7e3:bfbd with SMTP id 5b1f17b1804b1-4361c3efb43mr2036915e9.23.1733864592696;
        Tue, 10 Dec 2024 13:03:12 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621fbbe15sm16620197f8f.92.2024.12.10.13.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:03:12 -0800 (PST)
Message-ID: <6758ac90.df0a0220.20ca7f.df40@mx.google.com>
X-Google-Original-Message-ID: <Z1isjbV2ypR2T2Bh@Ansuel-XPS.>
Date: Tue, 10 Dec 2024 22:03:09 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 4/9] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-5-ansuelsmth@gmail.com>
 <20241209134459.27110-5-ansuelsmth@gmail.com>
 <20241210205544.g6y7vcyekyfebkoo@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210205544.g6y7vcyekyfebkoo@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_130315_209049_DA504E4A 
X-CRM114-Status: GOOD (  19.27  )
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

On Tue, Dec 10, 2024 at 10:55:44PM +0200, Vladimir Oltean wrote:
> On Mon, Dec 09, 2024 at 02:44:21PM +0100, Christian Marangi wrote:
> > +properties:
> > +  compatible:
> > +    const: airoha,an8855-mfd
> 
> After assisting dt-binding reviews in the past, I get the impression
> that "mfd" in a compatible string name is not going to be accepted.
> The bindings should be OS-independent, MFD is a Linux implementation.
> In principle this could be just "airoha,an8855" for the entire SoC.
>

Ok I will use an8855. The DSA switch has the suffix so it's not a
problem being that generic.

> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    mdio {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        mfd@1 {
> 
> And the node name could be just "soc@1".
> 

I tought there was a constraint with node name but this is not the case,
will change to soc.

> > +            compatible = "airoha,an8855-mfd";
> > +            reg = <1>;
> > +
> > +            efuse {
> ...
> > +            };
> > +
> > +            ethernet-switch {
> ...
> > +            };
> > +
> > +            mdio {
> ...
> > +            };
> > +        };
> > +    };
> 
> I hope it's not mandatory to duplicate in the example also the bindings
> of the children, especially since you link to their own schemas.

I checked other example and some duplicate the example and some
doesn't... My idea here is to try to add the most complete example
possible. Especially to how to define efuse and how phy makes use of it.

-- 
	Ansuel

