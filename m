Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AB1C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 17:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 214FD60E8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 17:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 214FD60E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OfAtXNl8+Ke5yLNlu88f3J0AwDiIidMRBGWawmt4w6U=; b=QqITU1hWp8rm2w
	tZG43Pq2HNF8cwMWaMg7mn0OGyXzIU27JtjqrdSZ4jQdFMSGN3H4SKmFrjnF1S2vL2pTuj9gfi7eO
	6PAbCnmrg2YRg3nbfhiZp98EJUErnSKOn3z9ztthEk4KyCycvJ4fp2QOYnZzoaYLbLJjfQAm1XMzo
	nkWRrHWliR7T0mfyqmFQ46BlrXMJ3Jlf5eh7wbFnMnLqZYvzc8MKWugOKelhiqKXmmDatBJElAWiB
	NrJJv021xbyN5f9UbiUkVLe9A1rJ8jsanHV5nBaq8PKNpylmmPdHZZcduAaPKCfbZ57v84OX+gi7s
	UuiZJem1sLLCPfarVqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIaIL-004BNd-QO; Tue, 24 Aug 2021 17:33:05 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIaI5-004BHs-BS; Tue, 24 Aug 2021 17:32:50 +0000
Received: by mail-pg1-x531.google.com with SMTP id t1so20433868pgv.3;
 Tue, 24 Aug 2021 10:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=g9LJhggKHy5VJtMaJ9R8dOKVVlo3xEJqmgw1Slxeh/4=;
 b=Fvh6g+4bT66GQtkOkpVzPme6rUscGPaqEpRt4v7/FxlsWdaeM6Kfrqed0YuPBjI7F7
 66Lg9gXRDyDEH4YyqnuZCTZQ97wW/7KACpAR+RwHWpqT5L7kxAdlRAwtUhJ8h8nO/C7Z
 aRzjxqWBgxT180W6zc+myoV7znLlUfp6LD0qqs1go7wd80mbgyWCTdTTtEn3hgr7Wer1
 rhwRCmsJUyVbBhU3n9WL+eYf1Qvw8QWYwBSIqAL9yzgck+xGhIKZR7nGNVnT5mIsenHu
 Y668D7vt+wTs40JDT+OkqwHIb8/N2QqOCym1DWt4KQv7Q+tTenxw4ohK/KMOexP+16T9
 IgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=g9LJhggKHy5VJtMaJ9R8dOKVVlo3xEJqmgw1Slxeh/4=;
 b=QkuaIocim3jD7S176zpyvAhunoZwP/fbfKlPhoEUQzW7j2tfJy7QT5Q1o7E66L9Y/b
 LZR198XnyhVFOP1r1zpXZMcGmIOIE8FA0V6kq7LzBLyr9VIUfMwvTyHOiIpATiP2oPzQ
 5ri5p4bpF7GATHjPinTvNKZckrpzqEYku7ZZvuyXxPkDpVKn+cDawwGKg8g6X7SypeEd
 gJL1YqYP68Bn/61iG1NLjjoQ/+0G8J7KQpGEegqgsx1LgucDwp/HHDVU4IrsTzjg3UZX
 hruKkKBwAZgZqtuZ71GfUKPkTxd2v+nxXDsuoQOyg2SZM+piqEcDrLcyFoapLMWj7Ox3
 zPUA==
X-Gm-Message-State: AOAM5301+4HZjb7/8DNF0cHa3WJTV6P0IF0VzgyHsvnZqMVe1+qWdFBw
 h+PhK9P01pfz7W+Jkb15IwE=
X-Google-Smtp-Source: ABdhPJwrP2Y1h9/6wAw1h0wgYRixs3rnIJtHaZT9iSxCxCh4eYqcTRpzqWDAqRb+OBEtlgFo/maFdw==
X-Received: by 2002:a63:2047:: with SMTP id r7mr20577260pgm.398.1629826368075; 
 Tue, 24 Aug 2021 10:32:48 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id w76sm17142028pfd.71.2021.08.24.10.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 10:32:47 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: dsa: mt7530: manually set up VLAN ID 0
Date: Wed, 25 Aug 2021 01:32:37 +0800
Message-Id: <20210824173237.1691654-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824165742.xvkb3ke7boryfoj4@skbuf>
References: <20210824165253.1691315-1-dqfext@gmail.com>
 <20210824165742.xvkb3ke7boryfoj4@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_103249_434635_93FC0D13 
X-CRM114-Status: GOOD (  16.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 24, 2021 at 07:57:42PM +0300, Vladimir Oltean wrote:
> I understand that this is how you noticed the issue, but please remember
> that one can always compile a kernel with CONFIG_VLAN_8021Q=n. So the
> issue predates my patch by much longer. You might reconsider the Fixes:
> tag in light of this, maybe the patch needs to be sent to stable.

Okay. So the Fixes tag should be 6087175b7991, which initially adds the
software fallback support for mt7530.

> 
> > +static int
> > +mt7530_setup_vlan0(struct mt7530_priv *priv)
> > +{
> > +	u32 val;
> > +
> > +	/* Validate the entry with independent learning, keep the original
> > +	 * ingress tag attribute.
> > +	 */
> > +	val = IVL_MAC | EG_CON | PORT_MEM(MT7530_ALL_MEMBERS) | FID(FID_BRIDGED) |
> 
> FID_BRIDGED?

What's wrong with that?

> 
> > +	      VLAN_VALID;
> > +	mt7530_write(priv, MT7530_VAWD1, val);
> > +
> > +	return mt7530_vlan_cmd(priv, MT7530_VTCR_WR_VID, 0);
> > +}
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
