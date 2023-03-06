Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34EEC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5X1DrGT/RW1/r+Y1HGheUCUnfXToPi6qBpvnHsE+fKY=; b=LsAaG3m2vmzzrYN7TYirazMUs6
	GcDwaKhi3lAkSvaWPKQge5Ajx0S0ALX3eQD0cRws+tU+R5XUwhGtH2cBoARJcUTC4a6O+ACU+iHfr
	u0ALlNa8o8pB4SvYtsvZPTI4WHBGIP8YWk5ZpPIgNqifzdkCiH7TiI3ykUuOmNDQxGdliFvr6Cxz6
	sIqSTtw7mQMOidWxQIkLm5k/0AXZcjVTvxYGQglrbMOGogOyGYCfJgfsoMKzC9wLzZwey+J78RThP
	wONW6psyNSBrOE18wMCM9tRhF3xtsW9dTiyT8SONE/bd3SjcXmQKh35jmMlyOpKHNVLSvVlRWqSeB
	884lCqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHJT-00Estx-Uk; Mon, 06 Mar 2023 20:20:04 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHIe-00EsVg-Ok; Mon, 06 Mar 2023 20:19:14 +0000
Received: by mail-ed1-x52e.google.com with SMTP id u9so43874502edd.2;
        Mon, 06 Mar 2023 12:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678133949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5X1DrGT/RW1/r+Y1HGheUCUnfXToPi6qBpvnHsE+fKY=;
        b=KwWvKclEUngSB3nCut/ygs51cOep20WW/PM6mVMbVZXU4Jq3uV9+8XJ7ifEeag9BOp
         N9ZqWkEr8ULNgEe4uTwk41dQM0cdtf4lBv9rwMmCmPO1dslhJGEmysV/Vp7wE9BG8XLp
         RL/5cwv64oNboXwBVBBUQObpvv+Em1yepOS/wJjy8TSpCiN2clXjuXBqTUei8h/kxdOd
         OllmhYEvTQXL4jIkUCwHVkPzVBcDMNa02KliH2dNm8f/1SyAIdAsJPcb+Aip6UUNmoE3
         9ebRHY6JmtjrONDS3qQduWBtHriIzGnc+rWRQP6MP6btnwVQCFgmQvgB8/DlH+I8WGQg
         xtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678133949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5X1DrGT/RW1/r+Y1HGheUCUnfXToPi6qBpvnHsE+fKY=;
        b=fz45Hsd4di4X+iKuWuLwTORw7JHP6+KfM1wyr7G2qKvCyw6TQkLJHuSMHbVfNTzf0G
         1XmcPtHv8CkyfDgEtfcRqzKdMor3XzSsrX7ceh5HhIW1uos3jB+Ug8FNAfYRz7ClNDuD
         zU6Ajv90Hg7nqgihE13iGdhGxx+Y7wSHRclnzXSuI/Uhy9XffiqSUSkLuVfOvBPfwQgq
         P+w2W604opFTNfKg8koQS3VAfqU1t10HFgBk8BcONrYx1Bkj8/zo+ItfrTG+r3/Nre36
         fKI3L8eiTMCdKSID7Ybq8XZBQuiH/9cx49TPMrtGhwxdG2I2yyeuZ5a57ZygcckcbjJz
         MbJQ==
X-Gm-Message-State: AO0yUKWSk5kkKWycq5135DQw7vTeiM5kwaC9wkSwHIJrcGpG+gwHaPyB
	g8emn6Py3PRC8Bu+tqLfnM8=
X-Google-Smtp-Source: AK7set/BFRz4eNs5vXIC0za8DuHe0GFhkdvMDwTsUhlweCkvilsfm48w3UUydiQdzAItTNdw5vmLLA==
X-Received: by 2002:a17:907:a0d5:b0:8b1:319c:c29e with SMTP id hw21-20020a170907a0d500b008b1319cc29emr15022639ejc.74.1678133948607;
        Mon, 06 Mar 2023 12:19:08 -0800 (PST)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id n6-20020a17090673c600b008c607dd7cefsm5027776ejl.79.2023.03.06.12.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 12:19:08 -0800 (PST)
Date: Mon, 6 Mar 2023 22:19:05 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [RFC PATCH net] net: dsa: mt7530: move PLL setup out of port 6
 pad configuration
Message-ID: <20230306201905.yothcuxokzlk3mcq@skbuf>
References: <20230304125453.53476-1-arinc.unal@arinc9.com>
 <20230304125453.53476-1-arinc.unal@arinc9.com>
 <20230306154552.26o6sbwf3rfekcyz@skbuf>
 <65f84ef3-8f72-d823-e6f9-44d33a953697@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65f84ef3-8f72-d823-e6f9-44d33a953697@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_121912_854293_0AC956C3 
X-CRM114-Status: GOOD (  20.43  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 06, 2023 at 08:03:54PM +0300, Arınç ÜNAL wrote:
> Looking at the Wikipedia page for Media-independent interface [0], the data
> interface must be clocked at 125 MHz for gigabit MIIs, which I believe what
> the "PLL" here refers to. trgmii needs higher frequency in some cases so if
> both CPU ports are enabled, the table would be:
> 
>     priv->p5_interface        priv->p6_interface       ncpo1 value
>         gmii                     rgmii                     125MHz
>         mii                      rgmii                     125MHz
>         rgmii                    rgmii                     125MHz
>         gmii                     trgmii                    125-250MHz
>         mii                      trgmii                    125-250MHz
>         rgmii                    trgmii                    125-250MHz
> 
> [0] https://en.wikipedia.org/wiki/Media-independent_interface#GMII

Wikipedia will only tell you what the frequency of the interface signals
needs to be. That is useful to keep in mind, but without information from
the datasheet regarding what the SoC's clock distribution tree looks like,
it's hard to know how that interface clock is derived from internal PLLs
and ultimately from the oscillators. I was hoping that was the kind of
information you could provide. The manuals I have access to, through charity,
don't say anything on that front.

Since I don't know what I'm commenting on, I'll stop commenting any further.

> > right now, you let the p6_interface logic overwrite the ncpo1 selected
> > by the p5_interface logic like crazy, and it's not clear to me that this
> > is what you want.
> 
> This seems to be fine as p6 sets the frequency either the same or higher.

(...)

> This looks much better, thanks a lot! The only missing part is setting the
> PLL frequency when only port 5 is enabled.

True. Although with the limited information I have, I'm not sure that
the ncpo1 value written into CORE_PLL_GROUP5 is needed by port5 either
way. The fact that you claim port5 works when ncpo1 ranges from 125 to
250 MHz tells me that it's either very tolerant of the ncpo1 value
(through mechanisms unknown to me), or simply unaffected by it (more
likely ATM). Since I don't have any details regarding the value, I'd
just like to treat the configuration procedure as plain code, and not
make any changes until there's a proof that they're needed.

> I'll test it regardless.

Thanks.

