Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19E0CA101E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 04:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaXgD3nnEBf2FvN2o3oUkR2SpAKFJSDAPnp60cmG00M=; b=pMCrCgE68jCgp+w8QU1CHvOslC
	f8d9AOwc2XCru2tElzW1Ya+Co+fgDrXsQxWj4CxNm2U8fEoebrnLVgNytDTDAxJ53DOCdWoNzmmmS
	zJQHjs2Kem3DqyiKaAzJTrf9AkBgRgivarl8CPtO7bEk9FouGWH0TGyoXwojVSQIscdeJFzguLZDs
	8v/DY8dFq71c0YroGMSHSF2RtHq5evp3O4H2rlumMHXBNtpRe77HQLPU/WfBnMEgjGkcqY1HwURfO
	sq7wgy/70p/kFM2l684VzAQEcQztmpqSMVOS8h6Wv2sLwkHEV6cnaNNRQNztwh35iHqBdr3HISVro
	bWzDdyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slLbE-0000000GK24-1VrH;
	Tue, 03 Sep 2024 04:57:04 +0000
Received: from flow5-smtp.messagingengine.com ([103.168.172.140])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slLaF-0000000GJw2-04hl;
	Tue, 03 Sep 2024 04:56:08 +0000
Received: from phl-compute-08.internal (phl-compute-08.nyi.internal [10.202.2.48])
	by mailflow.nyi.internal (Postfix) with ESMTP id 6E99B200212;
	Tue,  3 Sep 2024 00:55:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 03 Sep 2024 00:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1725339359; x=1725346559; bh=QaXgD3nnEB
	f2FvN2o3oUkR2SpAKFJSDAPnp60cmG00M=; b=lrRrLrd5xSbH/ug6+KlAeIfBcR
	qaQYhdGGV7g5qvomtuPvVCMlau0MKsFqfRc879wODFXaTZBZ/8QYTrmCO/6Yfpov
	2ofD83p+Sx+1eM4rBcMiOnuOtYgX6NZqA7lqQ9ea6PLfY8fORimsjINWuFPFpg9w
	nlrqOjfEMj8USskrW7U4iI+8fc5w4dBYU4TXmS6uw3npwQdgzbH6AD3aLaeBwN+i
	nCOWnv5OCd6SaeCEN9mTkU/75o1nd/x0LRTNXgL9CCbe/aSLwnJvatF9R+Oxzxe3
	pnQDJGCpME7OqAK9Ls1KWjwrTLgtcTTICWodNuDF+Flp0WugvWvWaPXVNGvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725339359; x=1725346559; bh=QaXgD3nnEBf2FvN2o3oUkR2SpAKF
	JSDAPnp60cmG00M=; b=kkgRwXxKqXV4hca5Mw/+wTzndZFnOTrZVr5Yy5gSzUcN
	l/Frz31dZBhO8irg8IrtIv8IUC8O+bGi7H+JS2I8VYCHwzTCUx8IiP9fHkSiFGJv
	VxG+nPvPgjQBJW0InT1DKfDC+Qxrg3qNI50htHB8evCNGDSx4Y5LDD4yKvT/3r1V
	5h5v2DJmeN3PlAisV2E1EPdB4dtKQrHIVHEOA4kSA7lQH7/cTVQQYlYpftnuJe/S
	Mn5bIWK/wo3+LVK+Ws0RopxFA8dOMjLo9efsrIVhWClubstfR2RamDzUTzWvbidG
	7Xv+gdG3LGqwddh44BV6gWO/z1kKQwsnS2uhV6Oahw==
X-ME-Sender: <xms:3pbWZkZlMyT8nw3X75H33sZYTuBLrC2qifWq9WD_djnoYfCmXyhlCw>
    <xme:3pbWZvYeXe-W_dw6QF1ChUzuwLRcmQ7EPqLqGaslQy4vdlg_VsX7Rnmg9ROs3-uVA
    IW0HI9l_ifYiQ>
X-ME-Received: <xmr:3pbWZu-Kn2oarZ8_9Ow94znknYYSJ9cGVsBC0eSNUTNqsPkrViiznZL2cnR9dzZFZw7RyeepUkvC_kFAqiQI10MUsueiXng_U3D_Dw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehgedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeegkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepmhgrkhgvvdegsehishgtrghsrdgrtgdrtghnpdhrtg
    hpthhtohepnhgsugesnhgsugdrnhgrmhgvpdhrtghpthhtoheplhhorhgvnhiioheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprhihuggvrhdrlhgvvgesmhgvughirghtvghkrd
    gtohhmpdhrtghpthhtohepshhhrgihnhgvrdgthhgvnhesmhgvughirghtvghkrdgtohhm
    pdhrtghpthhtohepshgvrghnrdifrghnghesmhgvughirghtvghkrdgtohhmpdhrtghpth
    htohepkhhvrghloheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrthhthhhirghs
    rdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthh
    hinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdrtghomh
X-ME-Proxy: <xmx:3pbWZupN-FcNMwfx2JqME2u1giu4qg3Knb8zOft___manRJ7U81gCA>
    <xmx:3pbWZvostYbpJjibu84wEbU76J0ekjMUe3kGMLFc0Icz6nSJHJj9RQ>
    <xmx:3pbWZsRe6-QfWiv-rn4CV96o3PV6tnGlWHsb91TvFygcH64qTChGPA>
    <xmx:3pbWZvoCqbYWRGd-lJbR7yyo4QovcSguYwsB9V73AVlGZNw2wTnPgg>
    <xmx:35bWZqHQxUchp1_GGGk2zcsVFWLUDcR1HYI8TELq0TunTNpuIIxF_hxh>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Sep 2024 00:55:57 -0400 (EDT)
Date: Tue, 3 Sep 2024 06:55:55 +0200
From: Greg KH <greg@kroah.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
	shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com, howard-yh.hsu@mediatek.com,
	StanleyYP.Wang@mediatek.com, benjamin-jw.lin@mediatek.com,
	allen.ye@mediatek.com, chank.chen@mediatek.com,
	meichia.chiu@mediatek.com, Money.Wang@mediatek.com,
	Bo.Jiao@mediatek.com, akpm@linux-foundation.org,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH RESEND] wifi: mt76: mt7996: fix NULL pointer dereference
 in mt7996_mcu_sta_bfer_he
Message-ID: <2024090332-waged-yummy-296b@gregkh>
References: <20240903013913.4143602-1-make24@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903013913.4143602-1-make24@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_215603_419824_A1CCD0CC 
X-CRM114-Status: GOOD (  15.91  )
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

On Tue, Sep 03, 2024 at 09:39:13AM +0800, Ma Ke wrote:
> Fix the NULL pointer dereference in mt7996_mcu_sta_bfer_he
> routine adding an sta interface to the mt7996 driver.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> index 2e4fa9f48dfb..cba28d8d5562 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -1544,6 +1544,9 @@ mt7996_mcu_sta_bfer_he(struct ieee80211_sta *sta, struct ieee80211_vif *vif,
>  	u8 nss_mcs = mt7996_mcu_get_sta_nss(mcs_map);
>  	u8 snd_dim, sts;
>  
> +	if (!vc)
> +		return;

Why is this the only place you are checking the return value of
mt76_connac_get_he_phy_cap()?  Either fix them all in this driver or
none as obviously it can not fail :(

thanks,

greg k-h

