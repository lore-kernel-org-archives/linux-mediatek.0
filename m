Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A75CD6136
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 20:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60nr4fzdTros1/1caE949JK7IrJG6r4bnbVLYmh8Yuw=; b=b+brj08xCBeqcaqQSvL09AwbSN
	jCbRpjVKfE2yDgtkoMvBIXkaERBYIlqBgVKfmEEyMJfAqOKBtb5ziUiqQmTP/WPRi8rX6UT93JQts
	a7TzdC+bvSVeHTgH/cTenpwCXy/A9Jdet9pkTNND/i+in2nH38rRau7lCdTi2F1v8GUgdIDJEgcD6
	blgP6IjFu9BMz7XDaNxkk9g6i4047TkuF4FK9JUgicuGperVOBOEJpZp9fgVbFcXGgaabECXcblvu
	6SgTxJfA8mtqAvDihOuWJrR9hr5/Rqj4tPCuh1ubPy496iXlKjpAPHw8TJ+sN1cVhblLLfGykHRAT
	8vXMcAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwwf-00Ba4O-2K;
	Mon, 09 Oct 2023 20:33:41 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpwwc-00Ba3m-06;
	Mon, 09 Oct 2023 20:33:39 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-279150bad13so3686292a91.3;
        Mon, 09 Oct 2023 13:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696883616; x=1697488416; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=60nr4fzdTros1/1caE949JK7IrJG6r4bnbVLYmh8Yuw=;
        b=BJv2YsZIEMLdG9fY6lW0sdRFUZ25YeyUOIF01At+qhIfed36UhUuXzblvn3w+g87uk
         9EDpJEpZliDNZZuT2B6TYmK2XRGDSkN/ypCvOKnclzr/l3ztpAOjHgj86RcNoToJt0Yu
         CHy5ZFLvWo0aLXDiAqJLhDhZpUv2yrRwp6VSeA0r5s28VeYf9yTdGWVsio6y0Lb5IsKk
         QzTE11zIRSfct2zGP7Hsj1sIi0Gz4NFF9oFI4pyFXceYK0stKEarmTPDaVXFUxSybhdi
         R/R77+W1r6sRGXFQ/nfmPhyDeeqFT5pAYTDz3fntu/O84kJPrFRgJ5wOEAtiJi1Oar2+
         KKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696883616; x=1697488416;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60nr4fzdTros1/1caE949JK7IrJG6r4bnbVLYmh8Yuw=;
        b=FwDn6xc/TkADhDH7Vy+bSa6BU8w/hadAYP6Oyk9VsodBy2edOvv+I9GCIDLVYpI6Ov
         89rEgCveormgaNkdZR7JNPwLdSmPGeGMI3AIWOF61Slk7hGdd5QV6TEN9FttnsJLV1AA
         EoDvdrF1oGby5Xr1OUNeQQKwJKB+qL7dm6dtMoRaQNBXi15Y10hjBXjyiSjRV/MYP5P9
         KWvY3Nw4i5mi6CMlxHyx8kd35UhvqXtRIeqcFj5KWrklffN8UO8CNVMU6QkpvizaaFSs
         Jgxr8tyOPsOQPdssqVJ4C1DCYKK6LcKpoEdsdkMUwE+8NSEGy3+bu4GOpjFSP7mgm2tL
         nNzw==
X-Gm-Message-State: AOJu0Yxv3nqnRTjAsLpZx4e+qUry+pszA6Za6yjnAdg2I9ifGBOcyOEY
	+b1EGXD8yt228MH/79GYyMk=
X-Google-Smtp-Source: AGHT+IHtfmqjRKYi7waZlIAqUBoD/CWz8n6jrQ8maCUF/DbjjprWGymIFOy1bl4xsIMH726f1M/F+A==
X-Received: by 2002:a17:90a:34c9:b0:274:7725:ed9c with SMTP id m9-20020a17090a34c900b002747725ed9cmr13483727pjf.35.1696883615968;
        Mon, 09 Oct 2023 13:33:35 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id t16-20020a17090ae51000b00267ee71f463sm6776912pjy.0.2023.10.09.13.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 13:33:35 -0700 (PDT)
Message-ID: <5c25f59d-fcd5-404d-b2b4-e77b7ca0f512@gmail.com>
Date: Mon, 9 Oct 2023 13:33:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dsa: mt7530: replace deprecated strncpy with
 ethtool_sprintf
Content-Language: en-US
To: Justin Stitt <justinstitt@google.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org
References: <20231009-strncpy-drivers-net-dsa-mt7530-c-v1-1-ec6677a6436a@google.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20231009-strncpy-drivers-net-dsa-mt7530-c-v1-1-ec6677a6436a@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_133338_094245_9BD18F8A 
X-CRM114-Status: UNSURE (   8.16  )
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

On 10/9/23 11:29, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> ethtool_sprintf() is designed specifically for get_strings() usage.
> Let's replace strncpy in favor of this more robust and easier to
> understand interface.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


