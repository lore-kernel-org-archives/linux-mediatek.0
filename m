Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0945C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 07:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE6wdunOqX6QxI/VDVDlSUgwrT2BZkhiuZcGv2loub0=; b=1GwM2x37EJH6n3eiUNg9J37Bk5
	ffnLSma8uY/l86SbLrgc3jVNdoapMFenicxm1+YYoTAj+6w67wXBKp7zcxIqpEHpUIJ7k/jnk0+qi
	gDUY9D5OlOKoHLCQkkW4bh40iIGG+uqBVjIGy5REZeV5uQp08OKySKURb3s1NVdrGjEsh/0Ku7fr3
	FTrLzvtNXF3z6fALAvxDlFLXw/bh0eEHPSLBBYI9oTdv9vTF1lSHizTXMC9b6nP0GKVjSkzi/0weO
	FeIjglNOUx3ufaQ2RB3hlCdvCqjMj2cJjxn3n+LX/2ypKsswjVKhcspjuiPH4SsUakX5klM/44t/H
	TlQCyKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJVC-003VdX-Hj; Tue, 08 Nov 2022 07:58:34 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJV0-003VaA-RY; Tue, 08 Nov 2022 07:58:24 +0000
Received: by mail-ed1-x52d.google.com with SMTP id l11so21209887edb.4;
        Mon, 07 Nov 2022 23:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IE6wdunOqX6QxI/VDVDlSUgwrT2BZkhiuZcGv2loub0=;
        b=OX5tyRhUgeAXZyAmBY/qXphpDnbKdDnCPVrPbUdMmhSOY0PJL97vYH9DFecMKhvSQ5
         5dMLkb5Wroq9wccLls0ntTAYRDCfE8iuev+FdU3zqouXIYs15zO5Yv91ghxy87DVjmHe
         GB8QW9EvHhFLwZNAsKZLHEeRHAl0jjXS7Q3VvkEuvvkGe1Qq6RJt1fZbZauu+OtchLzn
         mEec3KiaHVE0ZUtFT7T2uxEOv3tYD17+vS/Q/+/AXZsh4ds0/XTK+/OTjOZ1Co0p8ynW
         zAtmiOjckTbEnJfKFohHqXwIwYIgqwjg3WEtJcRoCTU73amcZh26gXpgU3eomA4im+Py
         WttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IE6wdunOqX6QxI/VDVDlSUgwrT2BZkhiuZcGv2loub0=;
        b=Lnyp2SdhKic7k8Z1DJ6Y7V76rHOlEQG89WzfuV0GA3YLXVFi7l1YE6OH8STLuxjDR/
         VWQR2j112uqFft3K9hHSVhU1dFrKp0fGao1f+NednsAER2xAvObGkbQXrGTSVC6IQ8Zr
         Tdd28XUTLh3oqCQEQ1mvvCJc7RIcXDRfvpYmcNKtYmmt2QpxT1iwBY+lnae35xF5cCXD
         1HN28YnVeR633MCjXlm/5jVUJSV3twc3WxlP1UPFNovS5HT6O+dMCfIvu1tnzM2m2T8u
         nVzhNtby4Tk8AzAYLRTt+bDkufhPl9nz5DE4kmdy59D2f5lkqUt7KSBpWH70t27sUPGE
         YtIQ==
X-Gm-Message-State: ACrzQf0meAy4MK845Gdip/TppzXKP1HvFgdDlWX8dZuVawtelo8gaU2j
	hwGUZhSeRNwQn/j8bf46MNM=
X-Google-Smtp-Source: AMsMyM6rVlyed+53Z8D6xzkvHzcl+/T/tWzMeSGXdAA/NsrhC6gxb+4HaKQhLVdTnOJrYtTqMTGZcQ==
X-Received: by 2002:a05:6402:1d4f:b0:461:d2ed:788c with SMTP id dz15-20020a0564021d4f00b00461d2ed788cmr54330142edb.418.1667894299000;
        Mon, 07 Nov 2022 23:58:19 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id d11-20020a1709067a0b00b0073dc4385d3bsm4329245ejo.105.2022.11.07.23.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 23:58:18 -0800 (PST)
Date: Tue, 8 Nov 2022 09:58:16 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/14] net: dsa: tag_mtk: assign per-port queues
Message-ID: <20221108075816.wsn2olii2lzcq7tf@skbuf>
References: <20221107185452.90711-1-nbd@nbd.name>
 <20221107185452.90711-5-nbd@nbd.name>
 <20221107212209.4pmoctkze4m2ggbv@skbuf>
 <f714f3e2-44b0-e0f9-0b99-2878ec12cb56@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f714f3e2-44b0-e0f9-0b99-2878ec12cb56@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_235822_925363_C319FBEB 
X-CRM114-Status: GOOD (  20.81  )
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

On Tue, Nov 08, 2022 at 07:01:29AM +0100, Felix Fietkau wrote:
> On 07.11.22 22:22, Vladimir Oltean wrote:
> > On Mon, Nov 07, 2022 at 07:54:43PM +0100, Felix Fietkau wrote:
> > > Keeps traffic sent to the switch within link speed limits
> > > 
> > > Signed-off-by: Felix Fietkau <nbd@nbd.name>
> > > ---
> > >  net/dsa/tag_mtk.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
> > > index 415d8ece242a..445d6113227f 100644
> > > --- a/net/dsa/tag_mtk.c
> > > +++ b/net/dsa/tag_mtk.c
> > > @@ -25,6 +25,9 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
> > >  	u8 xmit_tpid;
> > >  	u8 *mtk_tag;
> > > +	/* Reserve the first three queues for packets not passed through DSA */
> > > +	skb_set_queue_mapping(skb, 3 + dp->index);
> > > +
> > 
> > Should DSA have to care about this detail, or could you rework your
> > mtk_select_queue() procedure to adjust the queue mapping as needed?
> I'm setting the queue here so that I don't have to add the extra overhead of
> parsing the payload in the ethernet driver.
> For passing the queue, I used a similar approach as tag_brcm.c and
> drivers/net/ethernet/broadcom/bcmsysport.c

I was just asking if you can't add the 3 elsewhere, since the DSA
tagging protocol shouldn't care how many MAC IDs the DSA master has.

