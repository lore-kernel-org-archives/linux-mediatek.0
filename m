Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1239ED2D8FA
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBcKfGEm0HX448WXDFbLuVJe8IgT3W1pTsRj6aILCN4=; b=3F3467zcrkGYorxQwEwQcGxlWr
	vTUW8qvBoSAThSZAfm2P4A5k5Oqqj4qkgDk6zBZAgQd57Rs9UuBzN7hiI52nFM/zLLspUC1V28l40
	9KBmexnGwu+2JRgdKjEKo9MdLiDag8tGu40vztEbyLCEN2XYv8+TdmelSyS2DU9iajMjeNNUNwvP+
	K+eGMgfBrG7UgRQsQwQDIqcI0MTpnb6bGFTqk+WnOyqnN5618Zhxpzi28YckltOkZtbqg9UKek1AZ
	KLpk7VzNSmQZGZKaUjTVaNyQiX13+ZxxfG3TIjwKwHzUGb6HrVkJjcLdJ3HaaK6td5MPFH6BGA8xX
	l7RBlkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgmw-0000000E6rW-0OZ4;
	Tue, 27 Jan 2026 10:59:14 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgmu-0000000E6r8-07LG
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Jan 2026 10:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pBcKfGEm0HX448WXDFbLuVJe8IgT3W1pTsRj6aILCN4=; b=BAkHs3kWnd8woq3FttRZV9IrVs
	cH2I0cTUOEf4X1fAugTiE/BA4SdtUTsy3O9B4TVL21eh9LMTyUHhmi7UY3Q0asvnR18VBTyDbLVzF
	rBE1oZz5cYlU3YIP8KVJ9J/ExJ7iFZyBKq5CP5ZwBSiuHtUndSYLFYdivD79Ycc6I3sc=;
Received: from p54a43f8f.dip0.t-ipconnect.de ([84.164.63.143] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1vkgmr-00BWf9-0L;
	Tue, 27 Jan 2026 11:59:09 +0100
Message-ID: <a1113ede-9575-433f-a9d4-f8e9c1c6f8ab@nbd.name>
Date: Tue, 27 Jan 2026 11:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] wifi: mt76: mt7921: add mutex protection in
 critical paths
To: Zac <zac@zacbowling.com>, sean.wang@kernel.org
Cc: deren.wu@mediatek.com, kvalo@kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux@frame.work, lorenzo@kernel.org, ryder.lee@mediatek.com,
 sean.wang@mediatek.com, zbowling@gmail.com
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
 <20260120201043.38225-5-zac@zacbowling.com>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <20260120201043.38225-5-zac@zacbowling.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_025912_077232_2DBC123B 
X-CRM114-Status: GOOD (  19.42  )
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

On 20.01.26 21:10, Zac wrote:
> From: Zac Bowling <zac@zacbowling.com>
> 
> Add proper mutex protection for mt7921 driver operations that access
> hardware state without proper synchronization. This fixes multiple race
> conditions that can cause system instability.
> 
> Fixes added:
> 
> 1. mac.c: mt7921_mac_reset_work()
>     - Wrap ieee80211_iterate_active_interfaces() with mt792x_mutex
>     - The vif_connect_iter callback accesses hw_encap state
> 
> 2. main.c: mt7921_remain_on_channel()
>     - Remove mt792x_mutex_acquire/release around mt7925_set_channel_state()
>     - The function is already called with mutex held from mac80211
>     - This was causing double-lock deadlock
> 
> 3. main.c: mt7921_cancel_remain_on_channel()
>     - Remove mt792x_mutex_acquire/release
>     - Function is called from mac80211 with mutex already held
> 
> 4. pci.c: mt7921_pci_pm_complete()
>     - Remove mt792x_mutex_acquire/release around ieee80211_iterate_active_interfaces
>     - This was causing deadlock as the vif connect iteration tries
>       to acquire the mutex again
> 
> 5. usb.c: mt7921_usb_pm_complete()
>     - Same fix as pci.c for USB driver path
Changelog should be below "---" after the commit description, so it 
doesn't get picked up.

> These changes prevent both missing mutex protection and mutex deadlocks
> in the mt7921 driver.
> 
> Fixes: 5c14a5f944b9 ("wifi: mt76: mt7921: introduce remain_on_channel support")
> Signed-off-by: Zac Bowling <zac@zacbowling.com>

> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> index 5fae9a6e273c..196fcb1e2e94 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -373,6 +373,11 @@ void mt7921_roc_abort_sync(struct mt792x_dev *dev)
>   
>   	timer_delete_sync(&phy->roc_timer);
>   	cancel_work_sync(&phy->roc_work);
> +	/* Note: caller must hold mutex if ieee80211_iterate_interfaces is
> +	 * needed for ROC cleanup. Some call sites (like mt7921_mac_sta_remove)
> +	 * already hold the mutex via mt76_sta_remove(). For suspend paths,
> +	 * the mutex should be acquired before calling this function.
> +	 */
>   	if (test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
>   		ieee80211_iterate_interfaces(mt76_hw(dev),
>   					     IEEE80211_IFACE_ITER_RESUME_ALL,
> @@ -619,6 +624,7 @@ void mt7921_set_runtime_pm(struct mt792x_dev *dev)
>   	bool monitor = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
>   
>   	pm->enable = pm->enable_user && !monitor;
> +	/* Note: caller (debugfs) must hold mutex before calling this function */
>   	ieee80211_iterate_active_interfaces(hw,
>   					    IEEE80211_IFACE_ITER_RESUME_ALL,
>   					    mt7921_pm_interface_iter, dev);
> @@ -765,6 +771,9 @@ mt7921_regd_set_6ghz_power_type(struct ieee80211_vif *vif, bool is_add)
>   	struct mt792x_dev *dev = phy->dev;
>   	u32 valid_vif_num = 0;
>   
> +	/* Note: caller (mt7921_mac_sta_add/remove via mt76_sta_add/remove)
> +	 * already holds dev->mt76.mutex, so we must not acquire it here.
> +	 */
>   	ieee80211_iterate_active_interfaces(mt76_hw(dev),
>   					    IEEE80211_IFACE_ITER_RESUME_ALL,
>   					    mt7921_calc_vif_num, &valid_vif_num);

It looks like these comments should be replaced with 
lockdep_assert_held, so that these assumptions can be verified 
automatically instead of doing so by hand.


> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> index ec9686183251..9f76b334b93d 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -426,7 +426,9 @@ static int mt7921_pci_suspend(struct device *device)
>   	cancel_delayed_work_sync(&pm->ps_work);
>   	cancel_work_sync(&pm->wake_work);
>   
> +	mt792x_mutex_acquire(dev);
>   	mt7921_roc_abort_sync(dev);
> +	mt792x_mutex_release(dev);
The next patch is removing those...

- Felix

