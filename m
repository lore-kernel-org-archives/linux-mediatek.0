Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94C6C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 19:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6hQKtSgQEWi9rODQsWaqyzCQpbBtWGNPmRG6g+0ml8=; b=HiTIamBmbZBNWys+ts9t7Yjjxd
	sa8WdJDTTgIGl+1s+iQo2IMSZFD83J31IhQW0K7tJILpu9XFzIRVyJ67NA68+Lx4rcc4EhzmTjiiI
	Lfo9zgzGrmOmVBrFwpgh09EDfe/Bttx2LyNxzg0x0g2+AtS+ICd18+e/emlATTIZ3dmWFE90AyToV
	5ymL//9enl5yqjiQYVQEgPBR5Urcc0aqiDoIIipmjpQDzccQztEUy6Q4YL6YW9H9qBIgOoa7fyGRY
	NbDT1unNcO06YRuOBq9BsoCb1zn+vnwiNueij8bMvjlvGTt1XfWHwfvnhPX+d5AhRi9rhvp6Mbrym
	EmPMyxnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1u1w-00ET50-0P;
	Wed, 24 May 2023 19:20:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1svn-00EKaa-2Z;
	Wed, 24 May 2023 18:09:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f68fc6b402so3318955e9.2;
        Wed, 24 May 2023 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684951786; x=1687543786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J6hQKtSgQEWi9rODQsWaqyzCQpbBtWGNPmRG6g+0ml8=;
        b=lJmaJjwzNATJXlTs4cbN5TwMpgB2XYhqF7kgxMI4BhGPK4IikPyo2VhVkvzRIuPTAL
         1Ih5Ph68b/w6yXNkdw339e9iZ/7tfZ6mfkktqV9WlNueekaxrunwZ6NIYkL54UojcCGf
         xM9M7eY295tsyFW+MjG3Q0XfUh/JHH/ZafxzBNdVqhSilxeSjLd6lMhCLauyGT0xA9Rt
         hXaJ4wmejq2/Z6Cb8SgjvUVO86z3A4mFVv8o9EG8As9XdtIqPCluFrsHVulzPz7GdWm4
         egMR/6FNpF1ewy2josOqyA8cXF4WpKnLdHa83fxy/D68OCg0hFfY4NClrTd1Z5/zXF13
         WDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684951786; x=1687543786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6hQKtSgQEWi9rODQsWaqyzCQpbBtWGNPmRG6g+0ml8=;
        b=R842UL0sKq22nSxGzhK6D4gTtJ3U3tkOLTWRZLGHf/KD2ZKyj9Wk6IIPT5rOdoN3Zy
         LZ15FDHWcscT0RM/OT/XwHP/b06WbVyk3qwSvuvlb0cyC7Od9LurW0VPDXevea0pvG1P
         dkUH5kfz3CLPtpMiwYdYCLmxxuqD6WOQlL2f4vh2ZTkPByUFzqPvFz9vf3vv7ZObbcWM
         4O4dYFFkkBG6qeskJqbvpH/dMMRWkeDb0UQe8oohL+CyaD5SxyNrNXTlkyMTv7nN4mHV
         GdJkCWHOdbQRBgt4BlMYK5i4HMAIWhr+j2AE6teGLgYas6mf0tKfHqaYJ9T53rM5bTff
         25LQ==
X-Gm-Message-State: AC+VfDxcyEdTkU1lqi/Xz/FSW8gNf3Bijf6K1PAO5swkW7ZXqAKgJbl0
	ZNsqPRlvVsvMQa/a99PBzaI=
X-Google-Smtp-Source: ACHHUZ6onREVy6Pl2TF0gq10+tc+q2AOGed5crJlE6SNJcWnR/VrrQS8bGbnXupCPJ53qAZzLgsyTA==
X-Received: by 2002:a05:6000:104e:b0:306:368d:8a1c with SMTP id c14-20020a056000104e00b00306368d8a1cmr446044wrx.45.1684951786193;
        Wed, 24 May 2023 11:09:46 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id l1-20020a05600012c100b0030630de6fbdsm15134104wrx.13.2023.05.24.11.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 11:09:45 -0700 (PDT)
Date: Wed, 24 May 2023 21:09:43 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 11/30] net: dsa: mt7530: remove pad_setup
 function pointer
Message-ID: <20230524180943.y24syoustr65o2qk@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-12-arinc.unal@arinc9.com>
 <20230522121532.86610-12-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-12-arinc.unal@arinc9.com>
 <20230522121532.86610-12-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_110951_836839_F2528768 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:13PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The pad_setup function pointer was introduced with 88bdef8be9f6 ("net: dsa:
> mt7530: Extend device data ready for adding a new hardware"). It was being
> used to set up the core clock and port 6 of the MT7530 switch, and pll of
> the MT7531 switch.
> 
> All of these were moved to more appropriate locations, and it was never
> used for the switch on the MT7988 SoC. Therefore, this function pointer
> hasn't got a use anymore. Remove it.
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

