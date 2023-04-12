Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87420C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1rD/EKlAM2QobKZRdWuKD2WYCE7Wayo1AHNpbxop9Q=; b=sd/wh+UyP/QBCDMi3COSj2ELH5
	veFT8hH6385HxM9WJN62zDXJcujwuQjMjnPpDalQViw3+lcKjuNX2EVqp3nocWp5Dmk7ixBT5SD1Y
	6X5ddIqKSwYe/dyZ9Dp/r7HO3Jz+PQGilcknkLjirZfXa4I9PFbKwldz+3s42ViMVoYVJ2M9c4yS6
	oshJEpvfl8zItsZhapdzNyUf2dgbK07dP2mySyU91i42nYKp0YQMVJ6gCIZqbUDtfQwCR/rgWxJwr
	AJK3AY6QV5PMcVUhusw5B4OHsEMNzTFpkoiGMf+BF2lm9gUSVFYDhcCtYFbClbViqOm9ldcrYYHoG
	5xcuL/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYUD-002m7A-1h;
	Wed, 12 Apr 2023 11:18:01 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYUA-002m5g-0a;
	Wed, 12 Apr 2023 11:17:59 +0000
Received: by mail-ej1-x635.google.com with SMTP id jg21so27520318ejc.2;
        Wed, 12 Apr 2023 04:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681298276; x=1683890276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j1rD/EKlAM2QobKZRdWuKD2WYCE7Wayo1AHNpbxop9Q=;
        b=dMf/tdeLCWYDPxppNVuuvxlsNmLdxbynLHseAz+jPQ9hRu88zbH0VHMT4G2Y9L5f4k
         r49IUdwpKbmbArnFI+pygbpECgPVl2cGxKqM8xyz9o/irOScR22HLmKtVzVHVNAXJ/Op
         kQiOo6/ZJKT0mk+6TUaNNxQ9lEy71nQz9ZjefheFOxunFpl+yckNHDFVMLgSmfy/FhZZ
         33nvruMK4NjUs9V6D2Cy3UMxoVAk2yakBlITCDXCRFGE7jbebHTrNXwgyJA3G2w3RM84
         DK7mt1yD0998x4d8ITlLmMaq3PzyZf0NRRx3vam3V70Q+ePz8qSWDMrn/btSqa+96AJ+
         yULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681298276; x=1683890276;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j1rD/EKlAM2QobKZRdWuKD2WYCE7Wayo1AHNpbxop9Q=;
        b=PM0chG4wLc5snGZhIxiD3T9sFUcbgew51+iZ61oxGIFZ3GP8pT+tix21quiXd79k/t
         MJ+6WElgYCvJbc59n6BHodUyL9YUIAyWLEAu3qyuxSIRbHUmcELIh48AM4U3NI6kLWfe
         HD192zqvqHmWF4iivNvqYBEl92EeeFRDpnqnVr47bJsBMQvPtgrZsWYVFwrkEITjoskB
         GeTWruCxlxZ9NRg0HVKj54doTmpRrHzJTXuekbPfJ2Q8bryNTEgL97TX97KPGLIip4yu
         Y/JVhXztlzbEe+pTtiHaXrXjSstuTLeB584g/JLgNv+ivZ2l3IBZ2s83wpoO/radQ34f
         2ExA==
X-Gm-Message-State: AAQBX9eP+JMRufbOFSGw+pA9+VereTA/Py9WdN+ovVfL1zumE/rnPp0J
	KvBepwp8i+q3LW0pKtwHh+j7kBXNSPWqMQ==
X-Google-Smtp-Source: AKy350akEW91z/suHsYQnndS0oJ6188mIM2+Z3A9u5zo+96wZsMsdFHW7LKgsB8rrSM375M9B73lLg==
X-Received: by 2002:a17:906:7309:b0:94d:a68a:139c with SMTP id di9-20020a170906730900b0094da68a139cmr7493624ejc.51.1681298275560;
        Wed, 12 Apr 2023 04:17:55 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id n19-20020a1709067b5300b008f89953b761sm7094185ejo.3.2023.04.12.04.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 04:17:55 -0700 (PDT)
Date: Wed, 12 Apr 2023 14:17:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/7] dt-bindings: net: dsa: mediatek,mt7530: correct
 brand name
Message-ID: <20230412111752.bl2ekd7pirbyvnue@skbuf>
References: <20230407125008.42474-1-arinc.unal@arinc9.com>
 <20230411235749.xbghzt7w77swvhnz@skbuf>
 <80d4a841-db7c-fa2b-e50d-84317ee54a40@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80d4a841-db7c-fa2b-e50d-84317ee54a40@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_041758_225987_8D62023E 
X-CRM114-Status: GOOD (  17.25  )
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

On Wed, Apr 12, 2023 at 09:36:32AM +0300, Arınç ÜNAL wrote:
> On 12.04.2023 02:57, Vladimir Oltean wrote:
> > Hi Arınç,
> > 
> > On Fri, Apr 07, 2023 at 03:50:03PM +0300, arinc9.unal@gmail.com wrote:
> > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > 
> > > The brand name is MediaTek, change it to that.
> > > 
> > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > Acked-by: Daniel Golle <daniel@makrotopia.org>
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > ---
> > 
> > It is good practice for series larger than 2 patches to create a cover
> > letter, which gives the overview for the changes. Its contents gets used
> > as the merge commit description when the series is accepted.
> 
> Ok, will do on the next version. I'll also split the schema while at it.

Ok. I wasn't sure if you and Krzysztof were in agreement about that, so
this is why I didn't mention it. FWIW, it's also pretty unreviewable to
me too.

