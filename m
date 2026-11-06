Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A64606EEA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2026 12:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wAxokAyd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NlKD8YVJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+KjFRIlwc0fQgpSaiqKXkBqkuri5Ko/sHn1nPO0owQo=; b=wAxokAydh97Y4Co1+Fikr/jfwk
	zoZFCqCZUwIpcLrj4EQI9KcNnXQyAa6TA1IHjndGmDFQvRktS8lN0Var0hnZgsKsl8CsWjZWcPSPT
	9pcpiFdmL8NVCDRzQjlSzbhkOls/fjEXz6dvGdStm15HNLniwzQavC45ZvmqiJmcehEsHCzdyG6h0
	aUmMg1uobnqpbkLesxu3wRmQ52azwf6TYNJBN8VFbOJGwQyVwBdr7dRa1JGRpiy4rJpaUCAB/9FTk
	wlekIJmeqx7gG9+sxywjoeOwaUjZRMHUIlS0S2Qbxkqgc6nHe8LWgZnF32KOWaHLB6t+DFW81IpVU
	yPsrXeqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIlA-0000000CGtZ-2pOz;
	Fri, 06 Nov 2026 12:09:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIl7-0000000CGsH-2xGx
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Nov 2026 12:09:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so5687225e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Nov 2026 04:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966967; x=1794571767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KjFRIlwc0fQgpSaiqKXkBqkuri5Ko/sHn1nPO0owQo=;
        b=NlKD8YVJj7tHIS4FvfaI0q/W5jZLUOy1T5T/8jsbTBDc+wpzusFQ5KQkkvq29ADW/G
         N9YOA2sdxsViJBGP58Kobfa7GPZG2tG+o/Yw7s5DJJratjV2wcWehnOXU+4rd6PPoUl7
         kmnmZ+tglgaAtP4n/t++UhftsF3PWUehNCfL4btI01kJED+uHlGqVKXQ1jvmSXmFFdt/
         Z6jTQ+/Be78JeAoVwPjfKD4X6HvDq8NFyDzNCmNXDQrNlAhw7TjWfKabGptAifEVxVem
         s3q/Y3UU9WaJF/ZObIHeC89bKHV/v6GErYM/U0dxpExQhHjR4MGH9KLZZOMto8K8wrbx
         2IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966967; x=1794571767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KjFRIlwc0fQgpSaiqKXkBqkuri5Ko/sHn1nPO0owQo=;
        b=OHcCned1ltFv1EkIep9MQabNqQ1UL8JtMKTcCLfJDH/Rns4wghKmAIPPrF0qwGPY2Q
         147vw39i/8TgilkKoy3LRmO9z2x4ylx8Up/xwqse7Eb0GAJ+2yuqzekfUWZSp/JueQs+
         I3d6HcogsaGgQ8Fm48Lgwy7cbESceHK/ldqHe+xnS+JMdVQmE+QR/mP3WIp8NCm/vYqh
         NTft9yXcOQJLbqHo4KvZ3KAfbmCsiAJjUhNk5Fvmbge06xlKKhZRVW8g7YkvNORo7hwL
         6rusGEuoRr6DHMyJzDmBcsPzHlxoZpGCJy2/wzQ2aHdmPNNHx3YkqBxWY1KP/G8136Cu
         M+Ew==
X-Forwarded-Encrypted: i=1; AKwUvByNCFdjMFsjJEj/ZcWYGs5V/wUay4VqpUwuqUuBsz/6XEiAX/HO93ayhsug7M3oEz7bDkpOlmoKMQKMQkMLeA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/9TFpvMV1CVw7pPqO9jt/ieFSGEtM8OW3PeHONMp/ZYXuRymEU
	/mJb/JoYxuB/4ZKvQYzZ/9Ib2D+PiFJeGcj9+39mj4Zg4V14YrTP5iiW
X-Gm-Gg: AYBFou1Vq3jdgpeqyGCV0zBFyVQIUB3CzpO/cVZ9yiNlK7zMAlAOOmjc/KOR4G0Bizo
	hMLGuU36shSnwp6sCwGcEi0DIL3X0HeFdaMvWibiH670R3yuFT7GLi/vKABorxd+GbV5/1Uv9KM
	1ytjDm2IIR8H20knWU/qz9MDUXS/U5J9bkESgVbJP2ouUT8D759ve0+JjMooli84ZlTlc4aoDD0
	34WVm3XHZeZS8x+nrcaR2c3fj2sbI575DSF/X3jLCMXSP8PkjCcmqfI64H0A47qH+d90yWkAqIc
	LR/4fvIqkM1RAKVOOI36GJBURcqH9nTzIg5ds4v6QqhC9xXkyovHUZnSCAGe75BxedkZSwgrR+b
	2QcssHv0ahbIgLjn0k+OsKJhAw99zpCZELzvlhetyP4hbxKxBF96tAjxR3HkpnsZvNYRL2psIuX
	+1Vk7mVpszpuBZHQeGAGdgJmm4qTcWMoFcq70eNa1HbNpAGMqdIyAET6aA8pACz51tGqkQ7vPv3
	OiuRs9TurHeNaISPLHF09XZeWAJqZifoRmNZGi8OxHKxr3J2ocU+V+5vnGkGQwPNh9U8mr3ymqL
	nIHKjqvipO04l1iH3dQO9HzMIy9AQ08OMediy1f9Fd9eIQAwi4g0DmI5k98qXXqL/gp2NUJ35FY
	UzIIsQX6J7KSn0sI=
X-Received: by 2002:a05:600c:64c5:b0:4a7:4697:dae3 with SMTP id 5b1f17b1804b1-4b6dfca2330mr40505405e9.24.1793966967349;
        Fri, 06 Nov 2026 04:09:27 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7233297sm3526249f8f.27.2026.11.06.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:09:26 -0800 (PST)
Message-ID: <6aedc376.79189afa.3a0b25.2405@mx.google.com>
X-Google-Original-Message-ID: <au3DcuM4XQPC-Aus@Ansuel-XPS.>
Date: Fri, 6 Nov 2026 13:09:22 +0100
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
 <028a75a3-b69c-4ae8-8f15-3ef855346a0f@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <028a75a3-b69c-4ae8-8f15-3ef855346a0f@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_040929_772361_12DEB86C 
X-CRM114-Status: GOOD (  19.17  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 11:47:26PM +0100, Andrew Lunn wrote:
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
> 
> 
> > +static int airoha_rext_cal_sw(struct phy_device *phydev)
> > +{
> 
> ...
> 
> > +	phydev_dbg(phydev, "Start REXT SW cal.\n");
> > +	first_calib = airoha_cal_cycle(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_ANA_CAL_RG5,
> > +				       MTK_PHY_RG_REXT_ZCAL_CTRL_MASK, zcal_ctrl);
> > +
> 
> > +static int airoha_cal_sw(struct phy_device *phydev, enum CAL_ITEM cal_item,
> > +			 u8 start_pair, u8 end_pair)
> > +{
> > +	u8 pair_n;
> > +	int ret;
> > +
> > +	for (pair_n = start_pair; pair_n <= end_pair; pair_n++) {
> > +		switch (cal_item) {
> > +		case REXT:
> > +			ret = airoha_rext_cal_sw(phydev);
> > +			break;
> 
> > +static int airoha_start_cal(struct phy_device *phydev, enum CAL_ITEM cal_item,
> > +			    enum CAL_MODE cal_mode, u8 start_pair,
> > +			    u8 end_pair, u32 *buf)
> > +{
> > +	int ret;
> > +
> > +	switch (cal_mode) {
> > +	case SW_M:
> > +		ret = airoha_cal_sw(phydev, cal_item, start_pair, end_pair);
> 
> 
> > +static int airoha_phy_calib(struct phy_device *phydev)
> > +{
> > +	phy_package_lock(phydev);
> > +	if (!shared->rext_sw_calib_done) {
> > +		ret = airoha_start_cal(phydev, REXT, SW_M, NO_PAIR, NO_PAIR, NULL);
> > +		if (ret) {
> > +			phy_package_unlock(phydev);
> > +			return ret;
> > +		}
> > +
> > +		shared->rext_sw_calib_done = true;
> > +	}
> > +	phy_package_unlock(phydev);
> > +
> > +	ret = airoha_start_cal(phydev, TX_R50, SW_M, PAIR_A, PAIR_D, NULL);
> 
> 
> > +static int an7581_phy_config_init(struct phy_device *phydev)
> > +{
> > +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> > +	struct phy_device *phydev_p0;
> > +	u8 phy_offset;
> > +	int oldpage;
> > +	int ret;
> > +
> > +	phydev_p0 = shared->phydev_p0;
> > +	phy_offset = phydev->mdio.addr - phydev_p0->mdio.addr;
> > +
> > +	if (phy_package_init_once(phydev)) {
> > +		ret = an7581_phy_package_config_init_once(phydev);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret = airoha_phy_calib(phydev);
> 
> > @@ -88,6 +1610,7 @@ static struct phy_driver mtk_socphy_driver[] = {
> >  	{
> >  		PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7581),
> >  		.name		= "Airoha AN7581 PHY",
> > +		.config_init	= an7581_phy_config_init,
> 
> > > There are 4 phys in total, only the phy with mdio address 9 has the
> > > calibration capability. Thus only one phy at the time can perform
> > > the calibration sequence.
> 
> config_init -> airoha_phy_calib -> airoha_start_cal -> airoha_cal_sw
> -> airoha_cal_cycle
> 
> I cannot say i looked at all the details closely, maybe i missed an ==
> 9 somewhere, but to me, it looks like two config_init can run in
> parallel.
> 

Hi Andrew, in v5 I converted the driver to full phy_package_lock/unlock and
I set the base address correctly to the hardcoded value of the SoC.

This permitted me to simplify the validation code instead of saving the
phydev for port0 in the phy_package struct (a much solid implementation in
short)

-- 
	Ansuel

