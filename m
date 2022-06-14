Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFD4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 22:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIb8/A/KYkdu4WfwKQgxbLFr+5QuW7IsBwwNmpC4BFE=; b=FBbJVCiftVjOlrxVmw1xQRvhim
	hc3rY5NjNOkc+lLHGov9CSMTmEZ9kdtLV7C8pO4Vo8TDzPCs6wvL3I3THuRmJG+Uu0tSO5rPsD5GE
	xl12izcn5tAz/exwEy6a6axzCm1QJ4o2BcXT6TX5oVq6K9RB9c0UlwxjpSOEWKABYxROjubzLRNwe
	gY3TBdKxsv+m1VVbCRqN7Fb1gS85fDTIIY/reh2L9Dtr4KjkFbnVrvL3BdRtVur06ezlm7xLp6aJ6
	+AqpykRm7j1QrGkP4Ryx9PtH7P1XJfzl/9y3D0PCg6GNRV7daUkwuzdlTTXS9AWKMlIzToL2iRVsd
	H9iZjyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F9p-00BdRE-9n; Tue, 14 Jun 2022 22:37:09 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F9m-00BdP1-N5; Tue, 14 Jun 2022 22:37:07 +0000
Received: by mail-pf1-x42d.google.com with SMTP id bo5so9825324pfb.4;
        Tue, 14 Jun 2022 15:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ehMdU1wUOTSLPaXmLlr3cJgFkTKRonoGOZLrFCdQIRA=;
        b=Dp09UW6yv8u8DJ5Hc4yf8A/Y/UC+N8nBXwwzDZLo+VqmHZjkB9ewlAY8ajlUcZgF9k
         UdakADtH7vt28/CxePNkuxauxiqQqxDCbTSOobBH8vgPyKK9IF5Q/aD+EHPPI8eszJtz
         gAhyWu0ywr6XythaXm0cPINL7t5SGMwMxu2i9oHRqzEBy4Xi+APw4tY0zjOT0/n0N5B2
         2TEtazJ1HUE/v1T8CIv0BvwFqIKBPJ9q6iPJUHgTj8KgOr6AjrVn8doCYDrw7SWzDZH0
         xHRpoPnneeKxeI9z6Sykjqt5O4Fa0DdoXnrp5FCKxpzPQYYFjA21pgEyT7BWRO/cxIu8
         OIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ehMdU1wUOTSLPaXmLlr3cJgFkTKRonoGOZLrFCdQIRA=;
        b=p2JoOWiwiE4fwNHnIfLKXZRTHHVZRUl+z4zI8L2+UFTDZyHE9VCOp8gOth8wyIVYZT
         V8eTEgZOCrVJwPG4EkcyFM/X2VG5DZN/d1W7dMKxxklEAQ5Clwo93hyWuBALpTSfi45d
         U6EW1nyK1q7JBHL/UKbGyKHRPdywM9lMP9H5VnvAGjdQOVuxu9+TxLD5w8ybPOFrUKKn
         +3aT4S/HGbLxeHZCeqNOITJ1gDnUNWDp3HPkeNOr5ffTS/h4LZEmKHRRt/tOyKr3+QiL
         85ov6AULliCQCt28vZq+xG07FV7eECZ/whY6MFSM92GhmX+2acM8cv1yTJxSKaO/2tRl
         PfRA==
X-Gm-Message-State: AOAM531qvv/J4uyA4DM8uXxfVeG/H5bXs6uhAnr6ybwlJdD+wZsuBeoY
	5CjSlkBMNxrsYHyFfDs5CL0=
X-Google-Smtp-Source: ABdhPJyz5atbGbpNHgmgU5yU8QCEQtJBmUiQY46Exz4wbdmtkbxIaNTG9WUuvWndA7T87oS6MDSvFw==
X-Received: by 2002:a62:601:0:b0:522:7a73:c0b2 with SMTP id 1-20020a620601000000b005227a73c0b2mr6819990pfg.33.1655246224606;
        Tue, 14 Jun 2022 15:37:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id x4-20020a17090a530400b001e0cc5b13c6sm108943pjh.26.2022.06.14.15.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 15:37:04 -0700 (PDT)
Message-ID: <ce8b295b-4330-f0c2-328a-eead693a1c79@gmail.com>
Date: Tue, 14 Jun 2022 15:36:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 6/6] arm64: dts: rockchip: Add mt7531 dsa node to
 BPI-R2-Pro board
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220610170541.8643-1-linux@fw-web.de>
 <20220610170541.8643-7-linux@fw-web.de>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220610170541.8643-7-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_153706_800267_9C65B4C8 
X-CRM114-Status: UNSURE (   9.59  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/10/22 10:05, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add Device Tree node for mt7531 switch connected to gmac0.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
