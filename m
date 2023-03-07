Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2E3C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 22:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poew1WFVSOOAzkIAHVDedf8O8LJO/urtIChEfIqjULY=; b=c3ehTrIH+wuPEPOkKvY/yvcwO4
	EBtdqmNanUI6x8MOxnEtCmMcTr5RlcuEnwBr6fEFnKf4mXF9IjLWv6MBz/6hJL8vQER0xA8AIlp8A
	sVtAuiwHqrsGWxDUWioKHHzhQ6t4PL6nrEb/WmWLxaDEpkUPAeWicC60k0r7YzXQoAlriTb45Wnye
	+2ywWtt2rN4cgxrgd2QKKBXmwUYH13NmEr0FobhXlMVmfultm3GRO40IN1w74F1X41B6tZaTJx92J
	FqG4kQgORr0rgq0Cv8/eR9pLsi4yOkrBvNzOtDWsVSVDWNpGwH966ZWhM/w0bKFrnjfyNjDj/7FwE
	0J/VYF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfSf-002ZOq-Hk; Tue, 07 Mar 2023 22:07:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZfSV-002ZMT-7Q; Tue, 07 Mar 2023 22:07:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id j2so13585955wrh.9;
        Tue, 07 Mar 2023 14:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678226816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=poew1WFVSOOAzkIAHVDedf8O8LJO/urtIChEfIqjULY=;
        b=XbzFEsD/qU9AQKwecqFR+nyuaFeTbJRh0UAVYICoGWRfBC7IxrNkJxq7KxZAQtiBEN
         2AZ/I6HCd2fmK1VGB2CxnFzROKvqJpJoGY4qbaZs1GZFd9/o+2ptSWT5EZJA3kgfF2M6
         tcCpRLfsEcg6Or61srtYA28761Xk3weDhZYcw4GgPnkemg/Prh7faTstnQwz81ZdJs22
         RdVvNc3mRACdnz1JSgccSHhRIEwLCezZMdsJ5aQE0Z6KrF5D20ENfvhLf4Fg343b5hdR
         JZwMvT55aGhqLnDpXEO/loBxtSGIOhCuN9iABW83A4KBS3FtwOCRtoOF54g4zxrCDGNb
         cMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678226816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=poew1WFVSOOAzkIAHVDedf8O8LJO/urtIChEfIqjULY=;
        b=lSCkLo4j2GTCcNxDwIMN5gWK60ACqATIVjJ2GEXMI4e7kv2MmqikWPTXwS9lXjYFaB
         P/ivBIMyr7zezBa5pXOalVigheZTKCLMRapMHzhFjvsVCxh5R7R4bdNUP5n9upOzI0pO
         FAxCG4vTnxyJi2B34L5mkXdqd7iLEIEBucakSk47TN1Z1xBb1urxAirMqX0PYyiC2gwd
         JokEOXBud714urly7Mo/Nsv4DAERLda6ZNKRzKDoqKu1Z4Fn3CQbdXnldhQ9r2VmNn4d
         tqd/bCnqYQeEzDfuULIU5awtRsupEKpVMb5Nl7FyqxgWp8KAeWs5sLIQRPJEvWOkgJxk
         CRHQ==
X-Gm-Message-State: AO0yUKV8BQaJiQ90+YlLYgWz4kQ8xmNO587vZKIDVjaabeF5hMVgBcib
	rzq3+tEqUPlcHXcOC9RcOeo=
X-Google-Smtp-Source: AK7set/tqn67kDe3PQ6qyDz3oZV4nsz4tDTqJ05fFnzxO/hPjHNk2bAIT/HnGkc6JKDujwwNkyejHw==
X-Received: by 2002:adf:e302:0:b0:2c7:a67:615e with SMTP id b2-20020adfe302000000b002c70a67615emr11843716wrj.0.1678226815982;
        Tue, 07 Mar 2023 14:06:55 -0800 (PST)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id p1-20020a5d4581000000b002c55551e6e9sm13670141wrq.108.2023.03.07.14.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:06:55 -0800 (PST)
Date: Wed, 8 Mar 2023 00:06:52 +0200
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
Subject: Re: [PATCH net 1/2] net: dsa: mt7530: remove now incorrect comment
 regarding port 5
Message-ID: <20230307220652.feb33nkb74x6y4ip@skbuf>
References: <20230307220328.11186-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307220328.11186-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_140659_291465_3C196B19 
X-CRM114-Status: GOOD (  17.49  )
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

On Wed, Mar 08, 2023 at 01:03:27AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Remove now incorrect comment regarding port 5 as GMAC5. This is supposed to
> be supported since commit 38f790a80560 ("net: dsa: mt7530: Add support for
> port 5") under mt7530_setup_port5().
> 
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  drivers/net/dsa/mt7530.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index a508402c4ecb..b1a79460df0e 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2201,7 +2201,7 @@ mt7530_setup(struct dsa_switch *ds)
>  
>  	mt7530_pll_setup(priv);
>  
> -	/* Enable Port 6 only; P5 as GMAC5 which currently is not supported */
> +	/* Enable port 6 */
>  	val = mt7530_read(priv, MT7530_MHWTRAP);
>  	val &= ~MHWTRAP_P6_DIS & ~MHWTRAP_PHY_ACCESS;
>  	val |= MHWTRAP_MANUAL;
> -- 
> 2.37.2
> 

It's best not to abuse the net.git tree with non-bugfix patches.

