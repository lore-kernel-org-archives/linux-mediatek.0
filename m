Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC837E776CB
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 23:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bRL3/7Khkbg2e6woqRlv5wpaZ7o8kFg/B18p22kS+Kc=; b=pYAuzIi0xUo6MRmwDr5xma29w1
	6LvLPVra+Tmxx157XyT2kievJ590ZYc73ekkSWbj8YWzwfatAvbi+IbtiTDJwKQ/o0K1GZv32qWHm
	qMllX/q5dClwg5PxKSZ6K5mcudscVGs/fogo3FcbbGMZ+/whpLBzs8lOYepuJ+he7gSUkWwTvLaJ5
	Pb/PX3bSDimRXlAU7Q0zCcOlW/QoF0dIww5pdSkKvZZ/GwmWwbBf9Ttec1JzMg98b4X7pJHLSo487
	X7HbTlxPo0D0bTwVosgi9QShuk5R5L7TI/ckC3c4ukmjCnMOF5D7s9f94+GDapKSpZwDZNyYwE/Xw
	G1Z+KgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnSHY-00DWps-1z;
	Mon, 02 Oct 2023 23:24:56 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnSHV-00DWoC-0U;
	Mon, 02 Oct 2023 23:24:54 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-577fff1cae6so189807a12.1;
        Mon, 02 Oct 2023 16:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696289091; x=1696893891; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bRL3/7Khkbg2e6woqRlv5wpaZ7o8kFg/B18p22kS+Kc=;
        b=h4SA5O691e0cqXT103+XKztUpCQsFWP0HhD7wTtoF2Todsdam3FzBaTWZ/ZRivY595
         Z3ym7WYiID5fkJDFwFaJnYdaTX/Saut9aPDeZJcXnVnlCdP4N01/A1OyucorM7y8sUlq
         iJOX/Scqvp/F0DnA9P1ViK6tQS9LLo3zULvMhqhDCqI1iREh5M62aYar0pBJ2fGZuYKh
         hw16GE49THUHwtai9y2QKz2wWvZ67jXqRyL2m2k9byo3h52KkN9HoUwIduRxy0Skg+tx
         RdxzlVB6bOwXmOrljQak8xs/IiWRxff+74wuATsw/nIJTKK0Io0oaYwZDfNDrPVZ4HaP
         ohnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696289091; x=1696893891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bRL3/7Khkbg2e6woqRlv5wpaZ7o8kFg/B18p22kS+Kc=;
        b=reJy+cBdXasGI3HMQcxFadgjhkasBG/EG+7GPjmP62r76dbJOnpOR8RvXRIZeKwXCU
         0k2C5O23JCXMnGSfGe/RUkgBmw2Nwm6env+aggGaxXIRkX8aTfeydE8DhQgc94TciZCO
         5f21V5df10FXKc6SOGRqcUuViHdnXHVGH7ncoasNUphAynoGpYfHSgtw5BU9Cxf0dvpT
         5CJfuOjyqay7T6ekKedqmDaMW1owZNzlNp9BsWIxD/MutrbxRzQ6J5z6fa8vjO1DNrtp
         DlsBRh5/FQmPq3arkx3TYUW9Olv/ZTJFkxhwYbS+LhU4Hp64OoxFDbhKnVaazNBXoaw3
         yefg==
X-Gm-Message-State: AOJu0Yw+fpB7VUiGfQ6hHkxd+22tuNXkAJTOEFUGuwKcMiPA5XZ+kPEj
	clzA9OasYxnYtEVDHPfg6Do=
X-Google-Smtp-Source: AGHT+IGiRKnM19FETZdHmytSO7pAOV0MKx3juucoMJ4Hq570a6/MVewnuwoLdQCjx3N4PrrivmwRsA==
X-Received: by 2002:a05:6a20:7d8c:b0:15d:4cf1:212e with SMTP id v12-20020a056a207d8c00b0015d4cf1212emr1678170pzj.4.1696289090943;
        Mon, 02 Oct 2023 16:24:50 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id p22-20020a637416000000b0056c2de1f32esm4140pgc.78.2023.10.02.16.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 16:24:50 -0700 (PDT)
Message-ID: <1331726d-2cd4-03a1-6a15-ec145b197da5@gmail.com>
Date: Mon, 2 Oct 2023 16:24:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH net-next] net: dsa: mt753x: remove
 mt753x_phylink_pcs_link_up()
Content-Language: en-US
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Ar__n__ __NAL <arinc.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <E1qlTQS-008BWe-Va@rmk-PC.armlinux.org.uk>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <E1qlTQS-008BWe-Va@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_162453_194584_84537800 
X-CRM114-Status: GOOD (  11.56  )
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

On 9/27/23 05:13, Russell King (Oracle) wrote:
> Remove the mt753x_phylink_pcs_link_up() function for two reasons:
> 
> 1) priv->pcs[i].pcs.neg_mode is set true, meaning it doesn't take a
>     MLO_AN_FIXED anymore, but one of PHYLINK_PCS_NEG_*. However, this
>     is inconsequential due to...
> 2) priv->pcs[port].pcs.ops is always initialised to point at
>     mt7530_pcs_ops, which does not have a pcs_link_up() member.
> 
> So, let's remove mt753x_phylink_pcs_link_up() entirely.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


