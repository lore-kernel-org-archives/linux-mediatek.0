Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B2F606A8D0
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 18:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N2vZoR5m;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ppSe8A2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ycnUco1cGdhF6ejE960/8oZSSlOXbGBirBTEJmck5lo=; b=N2vZoR5mrqmL7lWn7KhAwELnx1
	RYQq6sDmRZPF7M81jNBpBBIaxcg20DuWYBWIGmrkhA/7jkrCvBlXIkQv0epNuy/COcmmdyIcE0Kk5
	0nSyaWZGD2JazIouxmhsxggaD3WJR2KCpaWpRhnGo/UVIqfQurH+GuD0CvMuuZAOcNId4Ou/Of3Xp
	V2/94kBGZmFjEOf2bOP5+fkazJ9ZdFl0rgo1aoIMUkyfKcNUfJloGeDIfF984mqYuQJ9G8V2e0xC6
	Sp7Icnhxtt8/8VT+x+tBcD16WhUR7CyFb4vIV7DypHJ759aePM2ADP2AreZZ237AGOw8CosPrTwv7
	o1+utyHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOff6-00000006OFr-1Swe;
	Wed, 04 Nov 2026 18:24:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOff2-00000006OE4-1Xcu
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 18:24:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so8774265e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2026 10:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816674; x=1794421474; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ycnUco1cGdhF6ejE960/8oZSSlOXbGBirBTEJmck5lo=;
        b=0ppSe8A2RRK2xHaQipJJZ/Yxgqy5f77tKNaGvA4tZ85dpvvvNgFCdK+x3LHNNskR+J
         kj70Ve5HDT6DVq6XTzFvZEduBgiCS7ntR5oLWViZ2VqVoZIdCt0wc8bjMlDJKjjq2wLQ
         sVtE7G19sjywiDh+ceDhCIaCbtmg2qCAWc3XnaE/7trxAqi7uVK50tDgomc4uTEtvfl0
         fUYxE6o/gEkiwXgHZVvor+WdCRxQ4/t/dU4jaGNmBf5TFmTfyB6f3GXDIp6c0Py75eMK
         DkP3iCOAz57gS+DVWh7mxOisxTBvfjDrLMrTUhwnnbXVrmoxVwAKX4V/14NoMMe+/fuc
         TnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816674; x=1794421474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycnUco1cGdhF6ejE960/8oZSSlOXbGBirBTEJmck5lo=;
        b=kHLUOdneQdYtR7zVTzOc4UMXh2uVwz4ZcMqwL/1JPD38kxJOSL2iA0n+/HqUuV3402
         750fx8d/yGX0mvu9sMTM7Xc0B8bteZPut5W97y6hcYtjUiygSbjzw39U2vvrd0SNcJ0h
         /s1dTuuF9rqxUCy1PpnZmPyKn0SUx1Ga3YP+uQmo2iv8OzxXuPKbHLu+9eT244o5hY+h
         JW5N5wImfll7ypRUsDj9UwdhlC1Nyw4AU1SbpME7cklXG2StBLWlJTiAImyJckRuTvwd
         FHfFl3RLlgxhWK8qykVD9wgL/Hb39IC486R8KiFzUJ1ZKQq94nJPYmJbY2zpIbyplweP
         4LHA==
X-Forwarded-Encrypted: i=1; AKwUvBzqHDSnmE2rTlqZviBfDNimE61q0Ih+cnQmLse9V5ZJTHgyaZBuFj8gHI5v8CttCelTh67OoNX1rVs2/HY4vw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+2fMvIti2qsFzW7M6fOtMs0YsqTIl1FW6yIbp3lR6Wi0B8zu/3
	OpgRivrsIPu8NxKO0tjU+QHnk3rcIo3kU/ViYFbdpwfITVUXxHls+e09
X-Gm-Gg: AYBFou2mAO1Ceq+hhBwVu0iwBvDQsTjNeNkcAUYEJRKoAIflFUC4DD8KqcdBEQSn69T
	FsdAlMlG9LW8f7ND+RYZKlMIriBwnkLR9er04SRfmSDaEe/w0z5diZdti7BoH7EOrwxqRzuRu1b
	1sOtHRIzvamTazlElcqHW4O+8uhm26bpnbec/WTv6Dk6Ne7m2qlkKMCESHnn1kEgHtH7zCqq+v7
	dVezVKE0xexLrOAFWDcJ57+rAgA+eND1r/XxRoO1S0WK/xMWfb2Wk/8+qNetThvCpTxwZH1CEML
	y3F7sqtMLXe86usW019nMPs858fiFJMaK/BWMNh+mIc0UWM20V+G4PYkLoCYT6O2q/HQ8+3FHjg
	WnoQ1V1pFIJRSiFx3FDjHhMKXYa5GPijmpXdGh5fuXmzx08umQ972zhL7dzx7OeVl1fkdG56QCd
	bnaA8dlT6OHeGhT6or1c/zkHzBqHmc3LVaToHbuO1UZ+BSfvRb+YoYVfLoAvpnsdPRWFcYvOiaR
	JYRGS8DzLuMD1vHQxUjjxr1ri20i7iE1M7jI5+N6oF5HHmQ55bbE/HvjpM/uyeEySext0LVQ75C
	raNea+R6y0tOedFua+qcRfUQjxbHERyojo/P+nwQtfMen/38yZaLxYlXYD94WyWB+ZdTvOAUQgI
	BxYP8acg3N7Wvv1en
X-Received: by 2002:a05:600c:8b64:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4ac16fa21dcmr409378675e9.6.1793816674252;
        Wed, 04 Nov 2026 10:24:34 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f0237aesm3010995e9.9.2026.11.04.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:24:33 -0800 (PST)
Message-ID: <6aeb7861.6171b307.11ae12.6b94@mx.google.com>
X-Google-Original-Message-ID: <aut4XNrQlPIZ9q4y@Ansuel-XPS.>
Date: Wed, 4 Nov 2026 19:24:28 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 5/6] net: phy: mediatek: add calibration
 logic for AN7581
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
 <20261103221439.30502-6-ansuelsmth@gmail.com>
 <2b744929-609b-4529-8b6b-30feb3ebbbde@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b744929-609b-4529-8b6b-30feb3ebbbde@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_102436_424969_8A6B56C0 
X-CRM114-Status: GOOD (  18.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 04:47:09AM +0100, Andrew Lunn wrote:
> > +static int airoha_cal_cycle(struct phy_device *phydev, int devad,
> > +			    u32 regnum, u16 mask, u16 cal_val)
> > +{
> > +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> > +	struct phy_device *phydev_p0;
> > +	int ret;
> > +
> > +	phydev_p0 = shared->phydev_p0;
> > +
> > +	phy_modify_mmd(phydev, devad, regnum, mask, cal_val);
> > +
> > +	ret = mtk_cal_cycle_wait(phydev_p0);
> > +	phydev_dbg(phydev, "cal_val: 0x%x, ret: %d\n", cal_val, ret);
> 
> What is the locking scheme here?
> 
> When using PHY packages, the typical usage is:
> 
> 	phy_lock_mdio_bus(phydev);
> 
> and then use
> 
> 	val = __phy_package_read(phydev, X, Y);
> 
> All the read/write helpers are __ indicating they assume the bus is
> locked.
> 
> Here you are doing something similar, accessing another PHY in the
> same package, but without locking. Is that safe?
> 

Hi Andrew, thanks a lot for the review tag.

It's safe in the measure that the worst is that link goes down during the
calibration... I will rework the function to assign the base address to the
default address for port 0 (it's hardcoded by the SoC) and use the lock and
read/write helper instead.

The main problem of using __phy_package_read is that I have to duplicate
the mtk_cal_cycle_wait function in the airoha-ge-soc.c as it would use
different helper... is it ok?

-- 
	Ansuel

