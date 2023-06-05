Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E5EC7EE2A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 11:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTlxXGdow/7xkZ1gyn9rYld59gTDefocGGkbHkRmMUE=; b=b6BoE8mJjID2tlH/oMwaUz4gsM
	1NJqaCX9GPR1+I1TvlPGrrn7nvloE2LVFiMJnOaDrA2q7UM0BnpDxuTe1OclIgfQEPdjCRvIbsEkP
	2RLIndqyAgFdJCH8T0zHEslP+bj0eP9TMM2SfPgXcm4JD1b3UBhv6NT8e+YpLmZCJ6JVM1MNJ49a8
	x+yakWqZA8Vb01Y6S0TWShjj1c/QG16LKoeW4FwPzCDCMLeKjCAIQQkjle243wBe8GsxORxmZ5nE8
	y9Svn1QRfjpiuTXeIEq7xepf6hYe3+JRbpd8UHncXbbARdiZPJIEKEyNEPtJ6Rd331bN+XLVsgBTX
	9ASgbwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q68Sm-00FI71-0z;
	Mon, 05 Jun 2023 11:33:28 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q68Sj-00FI61-2Y
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 11:33:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=xTlxXGdow/7xkZ1gyn9rYld59gTDefocGGkbHkRmMUE=;
	t=1685964802; x=1687174402; b=L6aebVbw58yOOv4xiQvz8QdN+rQwxudHBYI8dtuLSoyBVSo
	UidAyKSn/v8I+piIHjATwsN4Qm7/3wVu3y/qi1NGF1DbegqNR9fIMxUsBU9U3SVq8NUDuxGE9tl3l
	1kij8CzfS3Zfrv9s5Un0tMlYX3i9rB5quOesMhYu/0uaLUS2Q9z+KHGVzOlWWKjwEPFKz5AQt1TPR
	VmxhLOYI0PiGIVX9rCzxAwffAuMNFMUOYUnaJhcY54yT52iCVYvmPTTMjRLBOkFMoy/gKNzNI0wr0
	lzvjvBkanNxuY6agVm/5qJLAHlbZRonjpewnrmrfYtVE+BuKxBfT3ycW8xWCfzdQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1q68SU-00EQoP-2w;
	Mon, 05 Jun 2023 13:33:11 +0200
Message-ID: <2650eae9d006abb4021d4ef8e9e43bbde99d31fd.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] wifi: mac80211: ageout BSS color bitmap
From: Johannes Berg <johannes@sipsolutions.net>
To: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>, 
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Mon, 05 Jun 2023 13:33:09 +0200
In-Reply-To: <4e6b407ec7dba2baa2cbd739088ff78ab1b02756.1680553708.git.yi-chia.hsieh@mediatek.com>
References: <774ab129159408a3f3e04b7e662cb559cf087c48.1680553706.git.yi-chia.hsieh@mediatek.com>
	 <4e6b407ec7dba2baa2cbd739088ff78ab1b02756.1680553708.git.yi-chia.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_043325_826855_E650943B 
X-CRM114-Status: GOOD (  15.20  )
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

On Mon, 2023-04-03 at 14:04 -0700, Yi-Chia Hsieh wrote:

> +/* ageout time for OBSS BSS color */
> +#define IEEE80211_BSS_COLOR_AGEOUT_TIME		10

I don't think that should be in this file, it's implementation defined.
Also it might be nicer to just define it in jiffies, i.e. (10 * HZ),
directly.

> +++ b/include/net/mac80211.h
> @@ -750,6 +750,7 @@ struct ieee80211_bss_conf {
>  	bool color_change_active;
>  	u8 color_change_color;
>  	u64 used_color_bitmap;
> +	unsigned long color_last_seen[IEEE80211_BSS_COLOR_MAX + 1];

This is really big (512 bytes) and per link - might make sense to only
allocate when needed.

> +void ieee80211_color_aging_work(struct work_struct *work)
> +{
> +	struct ieee80211_sub_if_data *sdata =3D
> +		container_of(work, struct ieee80211_sub_if_data,
> +			     deflink.color_aging_work.work);
> +	struct ieee80211_bss_conf *bss_conf =3D &sdata->vif.bss_conf;
> +	int i;
> +
> +	sdata_lock(sdata);
> +
> +	if (!ieee80211_sdata_running(sdata))
> +		goto unlock;
> +
> +	for (i =3D 1; i < IEEE80211_BSS_COLOR_MAX + 1; i++) {
> +		/* ageout if not seen for a period */
> +		if ((bss_conf->used_color_bitmap & BIT_ULL(i)) &&
> +		    time_before(bss_conf->color_last_seen[i],
> +				jiffies - IEEE80211_BSS_COLOR_AGEOUT_TIME * HZ)) {
> +			bss_conf->used_color_bitmap &=3D ~BIT_ULL(i);
> +		}
> +	}
> +
> +	ieee80211_queue_delayed_work(&sdata->local->hw,
> +				     &sdata->deflink.color_aging_work, HZ);

What? No ... you really can't do this. Just schedule the work properly
at the right time, don't leave it running forever every 1 second!!


> @@ -1430,6 +1431,11 @@ int ieee80211_do_open(struct wireless_dev *wdev, b=
ool coming_up)
> =20
>  	set_bit(SDATA_STATE_RUNNING, &sdata->state);
> =20
> +	if (sdata->vif.type =3D=3D NL80211_IFTYPE_AP)
> +		ieee80211_queue_delayed_work(&sdata->local->hw,
> +					     &sdata->deflink.color_aging_work,
> +					     HZ);

Again, no.

johannes

