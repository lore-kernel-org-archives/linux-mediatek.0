Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D803C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 23:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkNaxXiMy7dB/CrQfOiflJv5/zBXe0f/wSftJOqjPTs=; b=QCwEO5Gapjiv0vPdI2rGROv1yh
	ydS8pMCCsSJLXL9rz506m8beYcDLp3wemW4Z0lZyXfWu1L9EIH4FkQPGp+GKTAy9EFuL2lUa1vXJh
	eZNrk7Jpvja9otdY0ZfXZcM+34eWGNjxr/Z2mdmlGZSD4FGj6d3S3O2FZBWX3sXxIQVhzBilXYQxE
	xIq1YyKpigTzAfQ08HLS4NJZ5mZoZH++DkU9hs/2aP7vYuNQe2n5pr82w0mEIHX/z2JKFJ9XxlUjb
	72+8LvQgPjS9T0ogdwtt/QKkMwoIknjJPJ9GvWjgiJzKYc8ADKkiLD1eN8L/+kDrZGhEXPgaVJ9C3
	WHdK7IkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZgos-002stO-7p; Tue, 07 Mar 2023 23:34:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZgog-002ssP-VC; Tue, 07 Mar 2023 23:34:00 +0000
Received: by mail-wr1-x42d.google.com with SMTP id l1so13715574wry.12;
        Tue, 07 Mar 2023 15:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678232037;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkNaxXiMy7dB/CrQfOiflJv5/zBXe0f/wSftJOqjPTs=;
        b=I0EQtsf9xtV2ehvI+faofQ58gjc4ZydAC68khJeEksSH1rhQD/n4WgRIUsQu+EY2TL
         KcL/UawUoIDbRQSyH3rV1QyaoUIDSnrZ+SBiQkunnbW6Ax+ndjKEtjnI9aNJN3ZqzXTB
         q9cdGqdluLApOFQioTUcZA4grcwG1olMdiDNZ5+ZuyXtefpZZHyHDiodyQBMxXgZ3zSF
         V+PkJGIS2R1UXl9IGOLOue+f8/yX2K6Hq+dzZfKmG0hkDcSa6qB5E7j4u4Y0nan7fZ4x
         UdrU8fhjs5N5SZalVQdiWSR/tNlHlmeDBFuL0WV+xFNbNn/07+/z/hPQFSuGeYMkozgR
         Ms3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678232037;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkNaxXiMy7dB/CrQfOiflJv5/zBXe0f/wSftJOqjPTs=;
        b=oBxFSGudPe0uD7F9DWMKGVk6LbgkJBTeb2//0rx/kaUhTSORyax9TdP4qStRvn+PSI
         0FTwn/0YWrAGaaA/odPOrJWNg4u993tSS04v7e48LqqO4z/8S+ZJ5RFcA/bWm7bvn8uL
         NPkuLfbayVStDgmmurzwClZ6qnix3Ka65p+dVNEmItahF4tm7xpHFwN+zTSkjO8sFUtp
         Y65rYBtwk6hTF2b4F03DAZ29NIWeE2yXq6qzRMgDoixk3gBspWzbPKBaFTEoMQVtWjhM
         UlR4lAwoNwUz4ei0EO3Khq8bxX66AYWfqb38VXl5qI0QRCmD2vl+qy9R/ong7brW7bZK
         XTLw==
X-Gm-Message-State: AO0yUKW4Rirz9mFlYPJaCh9M51YXWJUdH9JYNgO83Y4N7Clep8ZubSq3
	voH5BSUF5s5F5lec4fpLx00=
X-Google-Smtp-Source: AK7set+LWjjzrdvVfaBUwqng1pTIQRvZqWOtnZ08kw66e0Pnm2ILtlPlvo1bsvLwii2gYhC1QyMMFg==
X-Received: by 2002:a5d:5746:0:b0:2c9:5dd8:2978 with SMTP id q6-20020a5d5746000000b002c95dd82978mr10764040wrw.59.1678232037233;
        Tue, 07 Mar 2023 15:33:57 -0800 (PST)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id x17-20020adfdcd1000000b002c5804b6afasm13832424wrm.67.2023.03.07.15.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 15:33:57 -0800 (PST)
Date: Wed, 8 Mar 2023 01:33:54 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Cc: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	=?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 2/2] net: dsa: mt7530: set PLL frequency only when
 trgmii is used
Message-ID: <20230307233354.y3srdoggy2yzugnq@skbuf>
References: <20230307220328.11186-1-arinc.unal@arinc9.com>
 <20230307220328.11186-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307220328.11186-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_153359_028502_67D25808 
X-CRM114-Status: GOOD (  23.43  )
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

On Wed, Mar 08, 2023 at 01:03:28AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> As my testing on the MCM MT7530 switch on MT7621 SoC shows, setting the PLL
> frequency does not affect MII modes other than trgmii on port 5 and port 6.
> So the assumption is that the operation here called "setting the PLL
> frequency" actually sets the frequency of the TRGMII TX clock.
> 
> Make it so that it is set only when the trgmii mode is used.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index b1a79460df0e..961306c1ac14 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -430,8 +430,6 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
>  	switch (interface) {
>  	case PHY_INTERFACE_MODE_RGMII:
>  		trgint = 0;
> -		/* PLL frequency: 125MHz */
> -		ncpo1 = 0x0c80;
>  		break;
>  	case PHY_INTERFACE_MODE_TRGMII:
>  		trgint = 1;
> -- 
> 2.37.2
> 

NACK.

By deleting the assignment to the ncpo1 variable, it becomes
uninitialized when port 6's interface mode is PHY_INTERFACE_MODE_RGMII.
In the C language, uninitialized variables take the value of whatever
memory happens to be on the stack at the address they are placed,
interpreted as an appropriate data type for that variable - here u32.

Writing the value to CORE_PLL_GROUP5 happens when the function below is
called, not when the "ncpo1" variable is assigned.

	core_write(priv, CORE_PLL_GROUP5, RG_LCDDS_PCW_NCPO1(ncpo1));

It is not a good idea to write uninitialized kernel stack memory to
hardware registers, unless perhaps you want to use it as some sort of
poor quality entropy source for a random number generator...

