Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D270C4829E
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 01:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oyqz5SQV7vsHMVsXkHmWHMS+rB/T1/CKYrZbsQOdOR8=; b=Glg2jtE7e4C0byyrJXxb48g1AC
	iMpaEpCcst93LpQfBhIKZ60bVMkzwO+uJns69wdwya0vNwDCA3h1+wlLA5k2ePHL2Ope5043fQ+aJ
	nQjp4XmiSzd9q0re5FZIoJYyoFayK2yTc/Qdov90gZ5f2TyC6Ia8CgmYsOKtjgBMmC55evwV3qnHD
	N9zeSyUNMxk7rKhjy1AGqvZNTOfgZ17WVJmQqrxIuZytknLIyt25E9xZV/x2CW2XxPPQLXj+4x6/6
	cQkq5jNLsV2T76P9dM05oS869ksqYY0L4z5g4tccnEo9Zjs85ng3TwccN7NPKCXMxgSAk2yXrgdOR
	8sI87Ikg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ramyF-00000000jMc-00vT;
	Fri, 16 Feb 2024 01:24:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ramyB-00000000jLj-0yMx;
	Fri, 16 Feb 2024 01:24:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-41205e19660so10712455e9.2;
        Thu, 15 Feb 2024 17:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708046688; x=1708651488; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oyqz5SQV7vsHMVsXkHmWHMS+rB/T1/CKYrZbsQOdOR8=;
        b=WFFPuroMt7BhEF/XSSZrOEObY6aYwnQcgXSOQleU0OiaQ5AGVjvQlvl4cX+kXbgExd
         HfY+bwSk7dRwm4imVRP7giMD1ywSvGfcm/KEnhkFe3dnahg0kLss3BAKnJ15Mj/QH1ax
         SYX8lo1rQJEH3leubEq28ZNddNlQA6iJucOIVuGgCA6BDMD7ywbc2HJgbx7iMXFpeTXP
         7J+vUML4kk8uLcqmy48GdnBryPldFQIUHtlozlj5CrJjOoxIeMpfpQ7OB9ckekUHUjlj
         ohd4LAeRhK0H3cEQmwdXT68d5PSpyc0Uxc8GGgP2zYDH5qnbVYTQknxFQBrgAdwVsEfV
         AmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708046688; x=1708651488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oyqz5SQV7vsHMVsXkHmWHMS+rB/T1/CKYrZbsQOdOR8=;
        b=wFeAi4d+KvqP9CyAK/zrX8+xSr4XFg/XukyuDVM4dODu0n9fGEamkwWgoAQbzx4trN
         WIObQMol5NmfhkhEA0jJe+w2bt80gkD9hC/igDgXsvRvGGf0Nx5XAU5/vm6U+Pz1rCwv
         0Nn39MVJLYEh/PQbxxMFvRzQhebPDY6Rw+QU6nOc/BCGFA3olHJysLXkRhQGwQ5p6nBt
         RI66OA/DPdgLgUo1Yt2w9ZhODM1sj1qai/5ByTN+HjaRrDA6NftD8HyCaC3s1VGmxWWO
         epWO9C+tFHIMaRTY18n0omJTUzEcAJQJsWsvY41i6ZAWPavAIjfC7lTWxiuWuKREkfiW
         NuRw==
X-Forwarded-Encrypted: i=1; AJvYcCU2eJ77FxHSKiG09iIM4kMXfKFu8F65w136PP6m3qICbuudhPWXr+AikPc2ZpmEvEyiyNzrO0Gk6uBEm+y1aLbKoXyiZe3aYdLEJcSbV85Xofi8kaSCsVOYSy3A40Oxq5A+dne5MKe45FcZzvOaB8j7ET8sO3bQyS4=
X-Gm-Message-State: AOJu0YwiRAr8sfnqpvrEFMsAxuuYKyfS1mh7yc01ThiMUmXyIxvD6BD8
	BAwkJgDGBmRef+tVpIEgfXAfvfOlWbw9rDlApN13OqtLOnFU883H
X-Google-Smtp-Source: AGHT+IGBlunrq9zjEgxmNJ3CxTO0V4JQm3KyRRcIkUsnDoNn3Qeb0dixW54hlTXUhMgR3hYWRWylUw==
X-Received: by 2002:a5d:4104:0:b0:33b:636e:c967 with SMTP id l4-20020a5d4104000000b0033b636ec967mr2010965wrp.1.1708046688150;
        Thu, 15 Feb 2024 17:24:48 -0800 (PST)
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id co3-20020a0560000a0300b0033cf9e35b13sm660331wrb.72.2024.02.15.17.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 17:24:47 -0800 (PST)
Date: Fri, 16 Feb 2024 03:24:45 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc.unal@arinc9.com
Subject: Re: [PATCH net RFC] net: dsa: mt7530: fix link-local frames that
 ingress vlan filtering ports
Message-ID: <20240216012445.em247rxfjnyufwm5@skbuf>
References: <65bbf40d.170a0220.a87f4.becdSMTPIN_ADDED_BROKEN@mx.google.com>
 <65bbf40d.170a0220.a87f4.becdSMTPIN_ADDED_BROKEN@mx.google.com>
 <20240201232619.nsmm7lvafuem2gou@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240201232619.nsmm7lvafuem2gou@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_172451_297119_5C9BB940 
X-CRM114-Status: GOOD (  21.68  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 02, 2024 at 01:26:19AM +0200, Vladimir Oltean wrote:
> On Thu, Feb 01, 2024 at 10:13:39PM +0300, Arınç ÜNAL via B4 Relay wrote:
> > One remaining limitation is that the ingress port must have a PVID assigned
> > to it for the frame to be trapped to the CPU port. A PVID is set by default
> > on vlan aware and vlan unaware ports. However, when the network interface
> > that pertains to the ingress port is attached to a vlan_filtering enabled
> > bridge, the user can remove the PVID assignment from it which would prevent
> > the link-local frames from being trapped to the CPU port.
> > 
> > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > ---
> > I couldn't figure out a way to bypass VLAN table lookup for link-local
> > frames to directly trap them to the CPU port. The CPU port is hardcoded for
> > MT7530. For MT7531 and the switch on the MT7988 SoC, it depends on the port
> > matrix to choose the CPU port to trap the frames to. Port matrix and VLAN
> > table seem to go hand in hand so I don't know if this would even be
> > possible.
> > 
> > If possible to implement, link-local frames must not be influenced by the
> > VLAN table. They must always be trapped to the CPU port, and trapped
> > untagged.
> 
> Isn't this, in effect, what the "Leaky VLAN Enable" bit does?

Hm? Any news on this? I suppose this was the reason for submitting the
otherwise ok patch as RFC?

