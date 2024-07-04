Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13387C3271E
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 14:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWycWJ9oxIcX2N4Ux3lOgR7vW96br71wvQA5vPsDWDs=; b=FpWvVR6QAmrl5gzQC3LRaSs5V6
	ul8EbmPbv7kg9ugN+0JnLymzhzGREmm0r2tpj4Z+dbcBkKL3NeQO3oSwGDLUF3zvqK5hFXgj0cxiO
	+UlgOwHvXAattmwidIStVs3hgQ4oNTXSWe3O1lIXHq9OkEkLr8K4cFDg9foaHLihEB09RJY/HV0C2
	Nv6Pd6wExWGLbaPCM45P/sYBKhX42IrxIvrJHm2m0w7MqK1gEkUfx+yOQFU+bgNXXyxk9sAbGeZ2w
	IavnHi2vj7NlEAiMO8p1WHaRH19lUs5b0YlTnPq6xbmZvXeiyxDp2hWF6BEYy5ashiVMWZHxikHBt
	lWyJmMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNjm-0000000DYsy-2hIL;
	Thu, 04 Jul 2024 14:47:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNjY-0000000DYpM-0AWZ;
	Thu, 04 Jul 2024 14:46:53 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2c98a97d1ccso989318a91.0;
        Thu, 04 Jul 2024 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720104410; x=1720709210; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DWycWJ9oxIcX2N4Ux3lOgR7vW96br71wvQA5vPsDWDs=;
        b=MXYdH4KH1ZGKSwyHBXpizdrXPEi8WdhINrD9vxW0gWZBHIbztwCHMjf940NL/yz/4E
         HXgYQrzHRdCVSAbrKfQArMDh66V2U5MRQE4zCgkyaxW3mLFC/4EC1Dh15y9oRAFvbiOv
         NR2hqaokILOucFHa6sFjPHL4jTt607pxgog73FFmILIZgN2f4CCjzwezrS4sWG2cDJ8R
         cX/TylfTt/v9M/VQpGAtQh1wA0GfKdR+RD6/PI3N+NFMtjQW/KVnC+nPqj8PJvp3+80T
         fNViuq+HA1xTSCkUX6EiCA2+aSCP4lFMAOvRw4W1LG7FKdkhOeoz4moPDc1M6p/iuqFW
         6wrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720104410; x=1720709210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWycWJ9oxIcX2N4Ux3lOgR7vW96br71wvQA5vPsDWDs=;
        b=uPYimFY0GR5g1hkeDWIhu/shmlxnLgjkRlTR6cH7CsWMNtGgXr54jjGYKZycoXDfEg
         HWmiXbFKTa3sYGDsRO1IddX1up28golHNxu7d25+oH1BK5/lZP0w0goggAYcrD0sfXKc
         MVNe5b3kVlLAWo+KFu0VC96FM1ee6GycIuKlGrL2cG36/38jiU9F2tJ11YuebYHC1PDG
         WWjHYz4Ph+aJ66hAnktOFBqlTKo0Fvpb0ThofDvPV0TBDJ/HXSIRQtFIxuSDBfeEOisZ
         dMsvK83jgnV72R/WHeHLyh1HhpGzIHye6Rn9JBIHHxC5CxomaCq0kM5Hvjl+rSuHjVWS
         GgKg==
X-Forwarded-Encrypted: i=1; AJvYcCUQpgzBQJdfk6hYPihwD2/grODGTqZY6taPd5Ry1nHh8zyyXjxzI5jiN1GcCkwqZtbEfvZZhidS6cabozyusBF8XK8MmdQozkz4IJWkWopB8MPsUI9OOuoYwDJ58IZpcj01S7/sI4Ew3iP60AoE1Zl9/DoTlV24raI=
X-Gm-Message-State: AOJu0YywYeu1Cg0k8gFyKWyb+YoAGcx4s3nYfbS6pLl2HS8Ijek0ctxL
	lJrFu1+SVXhcH09ZHG/rwQ1r6JQxyGNCnuCruc0GS+NW+vYj2BDK
X-Google-Smtp-Source: AGHT+IEFfEHmjs4/vng6vnOIt6EX77Xb7wIPTz1d+Ty3lM88wDhbYmEvMFq+OVkHY5zkggtcz69SiQ==
X-Received: by 2002:a17:90a:8c07:b0:2c8:2cd1:881b with SMTP id 98e67ed59e1d1-2c99f3c04dfmr2349201a91.20.1720104409980;
        Thu, 04 Jul 2024 07:46:49 -0700 (PDT)
Received: from [10.40.5.113] ([89.207.175.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6b584624sm9867616a12.53.2024.07.04.07.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 07:46:48 -0700 (PDT)
Message-ID: <5c92dcae-ec10-4652-a5e4-3f050774fc8b@gmail.com>
Date: Thu, 4 Jul 2024 16:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
To: Daniel Golle <daniel@makrotopia.org>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 regressions@lists.linux.dev
References: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_074652_114339_70D24A65 
X-CRM114-Status: GOOD (  18.16  )
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



On 7/3/2024 12:44 AM, Daniel Golle wrote:
> The MDIO address of the MT7530 and MT7531 switch ICs can be configured
> using bootstrap pins. However, there are only 4 possible options for the
> switch itself: 7, 15, 23 and 31. As in MediaTek's SDK the address of the
> switch is wrongly stated in the device tree as 0 (while in reality it is
> 31), warn the user about such broken device tree and make a good guess
> what was actually intended.
> 
> This is imporant also to not break compatibility with older Device Trees
> as with commit 868ff5f4944a ("net: dsa: mt7530-mdio: read PHY address of
> switch from device tree") the address in device tree will be taken into
> account, while before it was hard-coded to 0x1f.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
> Only tested on BPi-R3 (with various deliberately broken DT) for now!

This seems like a whole lot of code just to auto-magically fix an issue 
that could be caught with a warning. I appreciate that most of these 
devices might be headless, and therefore having some attempt at getting 
functional networking goes a long way into allowing users to correct 
their mistakes.
-- 
Florian

