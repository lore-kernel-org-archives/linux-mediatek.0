Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F4FC4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 21:19:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A8023AFE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 21:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56A8023AFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C+F+gE1ZseAWg5rVgKQV6aoByCfZF87AT9AuFSAJDGM=; b=bPpp3cSIoUhh9VOM0cSfbUsRy
	lB0zynF2zkJU9DDVG4tW/Q11a89G9Fs+uoDN2SQbE5QptSfu27KIeU1iaCDdo8fNjHWTRbVb0H9nX
	l1+GWb8GlGmH8bT9VTk6Th/tl0YpHReysKLVcE8e7kj2Eew/XgqaHxQ1T3UAbJ/QNQrwImfIiyUNF
	MFqmTdrN/7kM4FuHZnUwiplZWuH0d/TM8eajLsQwZv3yNNDL/gSFBByR7KZBRWSv0JX+rMXhIpn8e
	M44plEOvTqSTEPFAkYKsV1I/y5T3pRr/fx7HBxasOwLBXlAwy+1PoEI+d98OEe5cUqjNV+6HiIq/k
	f6b59gFww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmkOg-0007Kg-00; Tue, 08 Dec 2020 21:19:46 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmkOe-0007K5-0X
 for linux-mediatek@lists.infradead.org; Tue, 08 Dec 2020 21:19:44 +0000
Received: by mail-ej1-x644.google.com with SMTP id lt17so26750976ejb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Dec 2020 13:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Uka+2onLr/hF/L1RahMPdiX9WOY0ncZlXCWRJl3wMho=;
 b=tZJD6H2UJyH1H8uxl2LGiKdQsC37miig9Cs+XOWAaIkElGOQH8KHlyEECZjigfn1Hq
 NjGmfS76eTMQscsbJf0kM/9lURDMTFapBdRo6EmXg1jPjzxFoXfBDk+VSEdmBV7xrBy5
 HKZzFoOEJgYVnHxbksPrqCYe6vzTG68Kxp/Ozqz4J6CYTiTyTGXx7MPeckwsBMh0ZoVB
 5XeG/qYUeHIS2F9hheDcae5FlS8No2k19Tl46ZrlYS7VHldJnOaHkbMaStwQqviV+SdB
 xB8TSRzMsguulFIgL9gKL8fdVIOUqPkUB+/6hGXk3u/ghe5xazeeoNOhFFSlVp7a10uP
 cuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Uka+2onLr/hF/L1RahMPdiX9WOY0ncZlXCWRJl3wMho=;
 b=sCFXNfhmn0Vnt5B7sLdKkbmHwE7yXD2MCVkF0M27y9DKYHA0108iNKptgtU7Ko/68c
 Xv6VrhbZOrQXtj7gAnaUR5BmmXbfd5Ol8zV39+YAVeoMskoZCEwhHWhqQe/kpHzpZf0f
 LM/CrKCzNXIxwJjeh4GQjMhvgDDypfFAqUZZLBg/bZuHN5Ho6Mi4O1hdCTf4ZV+wUOIx
 tyZjGzLkl/3+PLxWUUWFUjcM2ZvoNP+rJud6ZipV44hB1dzFRFtw3P19Bc7T3YTLsQwr
 RyWZQVJI0LsSCynbB4Sy8SASYbF2Cg1cN3152eAxPMUMPE3ulW1FGIkdN4hCKAUo5HME
 8Rrg==
X-Gm-Message-State: AOAM532DnFQM/ZnUNQptrlZ290d9KxaFKVFRGSLXcBUzyEyOKssLQx/8
 346yBtsk0hfL6Hs7MOtINdI=
X-Google-Smtp-Source: ABdhPJzqouL6MJZAj0WHsQEsAAutI/cIEX1KtQKWg1qtBSojZwP2QP8JFihSK12g07fJYAB6ubrLGQ==
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr24998162ejr.482.1607462382650; 
 Tue, 08 Dec 2020 13:19:42 -0800 (PST)
Received: from skbuf ([188.25.2.120])
 by smtp.gmail.com with ESMTPSA id w20sm37426edi.12.2020.12.08.13.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 13:19:42 -0800 (PST)
Date: Tue, 8 Dec 2020 23:19:40 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: support setting ageing time
Message-ID: <20201208211940.ep7lr7bvvuu2wqno@skbuf>
References: <20201208070028.3177-1-dqfext@gmail.com>
 <20201208205621.2xxscilegk4k4t4g@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208205621.2xxscilegk4k4t4g@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_161944_124065_A4E0D069 
X-CRM114-Status: GOOD (  30.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 08, 2020 at 10:56:21PM +0200, Vladimir Oltean wrote:
> On Tue, Dec 08, 2020 at 03:00:28PM +0800, DENG Qingfang wrote:
> > MT7530 has a global address age control register, so use it to set
> > ageing time.
> > 
> > The applied timer is (AGE_CNT + 1) * (AGE_UNIT + 1) seconds
> > 
> > Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> > ---
> >  drivers/net/dsa/mt7530.c | 41 ++++++++++++++++++++++++++++++++++++++++
> >  drivers/net/dsa/mt7530.h | 13 +++++++++++++
> >  2 files changed, 54 insertions(+)
> > 
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index 6408402a44f5..99bf8fed6536 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -870,6 +870,46 @@ mt7530_get_sset_count(struct dsa_switch *ds, int port, int sset)
> >  	return ARRAY_SIZE(mt7530_mib);
> >  }
> >  
> > +static int
> > +mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
> > +{
> > +	struct mt7530_priv *priv = ds->priv;
> > +	unsigned int secs = msecs / 1000;
> > +	unsigned int tmp_age_count;
> > +	unsigned int error = -1;
> > +	unsigned int age_count;
> > +	unsigned int age_unit;
> > +
> > +	/* Applied timer is (AGE_CNT + 1) * (AGE_UNIT + 1) seconds */
> > +	if (secs < 1 || secs > (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1))
> > +		return -ERANGE;
> > +
> > +	/* iterate through all possible age_count to find the closest pair */
> > +	for (tmp_age_count = 0; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
> > +		unsigned int tmp_age_unit = secs / (tmp_age_count + 1) - 1;
> > +
> > +		if (tmp_age_unit <= AGE_UNIT_MAX) {
> > +			unsigned int tmp_error = secs -
> > +				(tmp_age_count + 1) * (tmp_age_unit + 1);
> > +
> > +			/* found a closer pair */
> > +			if (error > tmp_error) {
> > +				error = tmp_error;
> > +				age_count = tmp_age_count;
> > +				age_unit = tmp_age_unit;
> > +			}
> 
> I feel that the error calculation is just snake oil. This would be enough:
> 
> 		if (tmp_age_unit <= AGE_UNIT_MAX)
> 			break;
> 
> Explanation:
> 
> You are given a number X, and must find A and B such that the error
> E = |(A x B) - X| should be minimum, with
> 1 <= A <= A_max
> 1 <= B <= B_max
> 
> It is logical to try with A=1 first. If X / A <= B_max, then of course,
> B = X / 1, and the error E is 0.
> 
> If that doesn't work out, and B > B_max, then you go to A=2. That gives
> you another B = X / 2, and the error E is 1. You check again if B <=
> B_max. If it is, that's your answer. B = X / 2, with an error E of 1.
> 
> You get my point. Iterating ascendingly through A, and calculating B as
> X / A, already gives you the smallest error as soon as it satisfies the
> B <= B_max requirement.
> 
> > +
> > +			/* found the exact match, so break the loop */
> > +			if (!error)
> > +				break;
> > +		}
> > +	}
> > +
> > +	mt7530_write(priv, MT7530_AAC, AGE_CNT(age_count) | AGE_UNIT(age_unit));
> > +
> > +	return 0;
> > +}

Thinking more about it, it's not snake oil but is actually correct.
Where I was wrong was the division giving you a certain error, but it
actually only gives a maximum error. Other, larger, divisors can still
give you an error of 0.
If the number you're searching for, X, is, say, a multiple of 3 but not
of 2, and is:
B_max * 1 < X < B_max * 2
then exiting the loop at A=2 would give you an error E=1. But if you
continued the loop, then A=3 would have yielded an error E=0, because X
is a multiple of 3 but not of 2. I should probably go and refresh my
basic arithmetic.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
