Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663F9C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 22:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dI3q7FYVCWjLDBVXxhDsYu3nYOANeG7+NTZx60qVe0o=; b=kld7qesPWEJDCnmHaSBXLcVfYn
	oUVyNEuW1KZwlqYYyvMFuInhnBA+nTT9ye66za/fTUEx9kH4iasB0UIwQEcKINfCK7bu6exa3CVpF
	4VFMGXnv9NSsYpoQwK+BaoYKSvqagyQQLkIj22VOAJjig6eDPn3i4oCPUo4aYW/ESgmxxVned8r4s
	eX6J6zA0KRwRPG2AVvq2wuy15D2k6ln/Wy00DCqCzkJJrEjtQdF4BK2o0rAU9aNSMHPdsVDsbWMhD
	BC+wn6tPmpERbOD8dxqsPVs09qBrx/KK7IF2jVWlZp0XwGUyt84hkmpY8tNonB0WQUbrzb4UgFt0V
	9Jr8K0yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQbrm-007maj-U8; Fri, 10 Feb 2023 22:27:38 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQbrb-007mYV-Po; Fri, 10 Feb 2023 22:27:30 +0000
Received: by mail-ed1-x535.google.com with SMTP id fi26so6092976edb.7;
        Fri, 10 Feb 2023 14:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dI3q7FYVCWjLDBVXxhDsYu3nYOANeG7+NTZx60qVe0o=;
        b=AWK1VR2Ulc1Zz9Y1ZjaVoZ8Ng3GfMjc7oz+4MS8bSMv2TWpy8BOWMc0jc4nfb2d9nE
         MGBzxIyL27cvb72c8dmGClwJpltabtuKsKwtSP1KdzdgoB4Hrn7CJl9XcKw2u/gBnXZB
         1rG9OzSwD/C93qAiug4uj0FMGRq8Nz/DC/f2tZ1nuTwJ7XuxXQRPB7RrTAVCmzRmANWR
         XsJPgMiJjdURpzRflMctATgY35idz4XOVYY8QPF23NzE8CryTKvKD8yod08i2E+pX7fh
         coJZN4UFJ/QYUsWwJP2YcN2EGCYbDYUix2qG87rswku9IefxCNLeJM88R/1PgbTvUBhI
         UqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dI3q7FYVCWjLDBVXxhDsYu3nYOANeG7+NTZx60qVe0o=;
        b=MSASdMnRbLYeobrb9CfVu96L8Qv+/764COLjKuLUVKVy1Bx7UHD3LAGTqa+jxd80P5
         LEzlyCu2Q3SdFkw08imFEkiot2V+R37dKzvQXIwwRwXxuMuoZqvYMkS1TSfyDcLsunJo
         fieVUBMnf3q1/XRhZHccTMDvtdTJBBNL7E/kEJp+zmrf8X6JgDzM2w0rJ1ybzFQ3bgbZ
         8Q3rMItCMzKfEjnv9BM08ini9/w/978MXCYY9Y3AycxCAp9ZwS/uLDmGxp2Nz8DpWtNo
         LSUNEt5RnMLyVGcgrYXKA3ECgGWOv+bt9BTVb6Al4fT7oNQye00l0PrZn3KuNL5fuKbs
         LMVg==
X-Gm-Message-State: AO0yUKUGiuFjk/IfzAQZq8TfH5uxSF/a3oV6/rEytryJCaP59BATN7Tq
	kT0wH/ATCYBnu0E2Ou8MS80=
X-Google-Smtp-Source: AK7set9HbCzSw0JmXpCiMALdNFeTBR42aGnutinBjZFU+0Uy2/jr9VXUSpHmGTXr4a1dGyt3kzBDbg==
X-Received: by 2002:a50:d548:0:b0:4a2:223d:4514 with SMTP id f8-20020a50d548000000b004a2223d4514mr17918752edj.8.1676068044714;
        Fri, 10 Feb 2023 14:27:24 -0800 (PST)
Received: from skbuf ([188.26.185.183])
        by smtp.gmail.com with ESMTPSA id w9-20020a50d789000000b004aacee2728dsm2847008edi.19.2023.02.10.14.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 14:27:24 -0800 (PST)
Date: Sat, 11 Feb 2023 00:27:21 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Richard van Schagen <richard@routerhints.com>
Cc: "arinc9.unal@gmail.com" <arinc9.unal@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"erkin.bozoglu@xeront.com" <erkin.bozoglu@xeront.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: add support for changing DSA
 master
Message-ID: <20230210222721.3rbszzzjnrctjrnz@skbuf>
References: <20230210172942.13290-1-richard@routerhints.com>
 <20230210172942.13290-1-richard@routerhints.com>
 <20230210185629.gfbaibewnc5u3tgs@skbuf>
 <42C4F87B-520A-4F43-924D-9CDA577B04C7@routerhints.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42C4F87B-520A-4F43-924D-9CDA577B04C7@routerhints.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_142727_899673_C6C62D88 
X-CRM114-Status: GOOD (  16.29  )
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

On Fri, Feb 10, 2023 at 09:41:06PM +0000, Richard van Schagen wrote:
> > I believe you need to reject LAG DSA masters.
> 
> Not sure what you mean: how is this different from the change_master in the Felix driver when using 8021q tags?
> But. Can add a check if you prefer. It might be a good idea anyway to be future proof. The MT7531 has support for LAG in hw.

I mean, like Documentation/networking/dsa/configuration.rst says, that the user can attempt
to put the DSA masters in a LAG and create a larger DSA master which is that bonding device.

The difference from the Felix driver is that Felix supports LAG DSA masters and this driver doesn't.

I don't believe there is any other restriction in the code which would prevent a driver which
implements port_change_master() from accepting that as a valid configuration, so it's going to
be the mt7530 driver who acts as the final frontier in this case.

An "if (netif_is_lag_master(master)) return -EOPNOTSUPP" will do. But it would always be good
to check if it's really needed :)

