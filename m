Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DA2C77B62
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 15:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0B6FpipeQ3bEbahSZbTSke5kYQ7TQ02Z97756jnvWc=; b=2MPtKdhca2mexURjMLJ0WjVoz+
	ruL/lPPrAVHSL0R3AqQ6HJ6LMlfQq6SwEmtl7YkqtU8KbpUwAlk2f789UtG3O0jMF70GyU84i+yYx
	zZ74JYuObCLmuBLe5Pxq1W0WLAOUjT0/raLBBXglqNMC5JwFvRzn4GkoWPEGp8L0xEj6w8t2/EQn5
	LVMY5s3msATaV2vYifMECMn7IMzBbUZu2YgtYZDuAKr8xGSUSP9uI2C4NBUPeCt9p0QYtDEjIhsqM
	FpMRkM/723n+eo7glFxlSAvKOB7Qf++6CebKtxkeVe3mq2WP70PB+bL5OtPbKINMRNXBPKENuG6Hf
	duTehCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phB4e-00Etjq-0f;
	Tue, 28 Mar 2023 15:17:24 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phB4b-00Etip-27;
	Tue, 28 Mar 2023 15:17:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so9671649wmq.4;
        Tue, 28 Mar 2023 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680016639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0B6FpipeQ3bEbahSZbTSke5kYQ7TQ02Z97756jnvWc=;
        b=ip7+nB/YuCICS9SIjeL+kfF8bUfEk6Xl7SvvPDcxPv0KpsHhy0rYubc14JcsMyxSDt
         0uap/XhSGuvsJa69mrjjtNda375E0WUXEUl8rEIFAbSWEKULMfJpGdyM2Vy6jUEXZ4ev
         G6FkPhFD/wpWNYwQ8hdCAV/wqv2jKIwtRy0mi6mLceiZO++bZCTsdESLm9nK1jwLCxEF
         J6Eo+lk3MDNYXVO1gvNNpsJ4d9wHsDJ8BJ4QS0ipdrKsL6RTGMjxzYmHrGhWW7bdSMHH
         z82orrZcDLbiXnFQr7bXklYH+mg1/AxJDw319BGfzFad0kGDuznY7G3arZtS+3cvjP5f
         fCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680016639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0B6FpipeQ3bEbahSZbTSke5kYQ7TQ02Z97756jnvWc=;
        b=kSIsKXc2UvGdb3skT4ZmRKgYOSK+ybZYC1XrXNQXgdoTSiLe+pQkeddwy5ga1KjUmJ
         zLVJFz1PGI7QoZJq4ky1m7+AuZqYFse7I+QTyZL+oHCa5xnvvxyFiVRdazGMH+6Lqwm6
         GPnutISNvLTdgRRrtyn6Boi15CJB8uxKlnTheqzqPRYqlkrSstAnlcsS+Mc/5qrBtfOw
         xPfWCrUhQil45UV9wIhb1839+IlTKVhmBSVIlxjgdaWYrOhmRA5bDa7l+XtsFMSNOyLH
         w01m9zfi+5pBW2HMXrjr8vKYzxxEr5xIFKat8oIQ6wUAimL9R5SrTkEgWeM+Ads6361o
         pkZw==
X-Gm-Message-State: AO0yUKVGb9SDZxGCnVcdX16NVGmXYR5GJPmYCLgzXtklpTE0dhdPWXOs
	wQSLHfxDt6zqD75Hcob1cVo=
X-Google-Smtp-Source: AK7set9+xJ6lxiwmZ7rSiH0SIWY/LrUgP/RDdq4LZDb5O8brLjg80BX+F6veKgLTz2gQ5hlPj7Af2g==
X-Received: by 2002:a7b:c444:0:b0:3eb:38b0:e757 with SMTP id l4-20020a7bc444000000b003eb38b0e757mr12632262wmi.10.1680016639297;
        Tue, 28 Mar 2023 08:17:19 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id l1-20020a1c7901000000b003eae73f0fc1sm17413419wme.18.2023.03.28.08.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 08:17:19 -0700 (PDT)
Date: Tue, 28 Mar 2023 18:17:16 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [RFC PATCH net-next 2/2] net: dsa: mt7530: introduce MMIO driver
 for MT7988 SoC
Message-ID: <20230328151716.ulvfqrvgsffjnhgc@skbuf>
References: <ZCIML310vc8/uoM4@makrotopia.org>
 <a3458e6d-9a30-4ece-9586-18799f532580@lunn.ch>
 <ZCIML310vc8/uoM4@makrotopia.org>
 <a3458e6d-9a30-4ece-9586-18799f532580@lunn.ch>
 <ZCLmwm01FK7laSqs@makrotopia.org>
 <ZCLmwm01FK7laSqs@makrotopia.org>
 <20230328141628.ahteqtqniey45wb6@skbuf>
 <ZCMBDm31AzDGBKyL@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCMBDm31AzDGBKyL@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_081721_708948_824EBAC5 
X-CRM114-Status: GOOD (  25.28  )
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

On Tue, Mar 28, 2023 at 04:00:30PM +0100, Daniel Golle wrote:
> On Tue, Mar 28, 2023 at 05:16:28PM +0300, Vladimir Oltean wrote:
> > On Tue, Mar 28, 2023 at 02:08:18PM +0100, Daniel Golle wrote:
> > > I agree that using regmap would be better and I have evaluated that
> > > approach as well. As regmap doesn't allow lock-skipping and mt7530.c is
> > > much more complex than xrs700x in the way indirect access to its MDIO bus
> > > and interrupts work, using regmap accessors for everything would not be
> > > trivial.
> > > 
> > > So here we can of course use regmap_read_poll_timeout and a bunch of
> > > readmap_write operations. However, each of them will individually acquire
> > > and release the mdio bus mutex while the current code acquires the lock
> > > at the top of the function and then uses unlocked operations.
> > > regmap currently doesn't offer any way to skip the locking and/or perform
> > > locking manually. regmap_read, regmap_write, regmap_update_bits, ... always
> > > acquire and release the lock on each operation.
> > 
> > What does struct regmap_config :: disable_locking do?
> 
> I thought I can't use that on a per-operation base because the
> instance of struct regmap_config itself isn't protected by any lock
> and hence setting disable_locking=false before calling one of the
> accessor functions may affect also other congruent calls to the
> accessors which will then ignore locking and screw things up.
> Please correct me if I'm wrong there.

It's not supposed to be used like that. You set disable_locking = true
once, and take care of locking from the mt7530 driver. Not before every
operation.

> Yet another way I thought about now could also be to have two regmap
> instances, one for locked and one for unlocked accessed to the same
> regmap_bus.

That would also be theoretically possible, but the above would be
equivalent and would require a single regmap.

