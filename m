Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0806ACA5534
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5/3EokUL9b/oTCtDJRyvfxwFJp1yaX0dODpevqohlw=; b=qy+kYfviDAzXYsJTA7nfnIv3K7
	GEMXX5aS/7RSNuk5jIqtg3Tx5H8UHzV7k1NOVFIDB2St8qorZJvbsGeTnr1eI6+/N0OjVN9s1fSMv
	ZY1RHEgkOUhXnk5CGBOThdMvrIClwXuZc2WIjSmaDhqp2URgkk0Z1jMfT2U7t7Cp6ib19lh4II7UI
	hZPHcfm+W3omaY1dIHJLvA7D4Z8J7mBauHH398W4jT23Jrqvj+4VWGyBuU5txs6rSrQ0cow3iHIzu
	vLb2wNBv31RySnoTaGLqKeBrNLicGlJoySN+bjyDLPxmmt+xh6jSlF4wftgtSNlHG6DINePuMbzOF
	O6Y2UHmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgMlM-005NJW-0Y;
	Wed, 13 Sep 2023 10:06:24 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgMlJ-005NIS-0V
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Sep 2023 10:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=E5/3EokUL9b/oTCtDJRyvfxwFJp1yaX0dODpevqohlw=;
	t=1694599576; x=1695809176; b=LsjCc5zQZhMOJUML1yGORYzrmbACOjLD830XlqKNFLmoMLM
	EejJyed4iuS+M/Lgu/sWbTVI6HiCEOL1CGflPTNZ7JL8ZChTc2GjwYZg4rO0JDJAUJBrwBiwp0KG7
	b7CPLwTb7bMUfJFOjTcn/2HxArHZNG2mlg67YOeyMKo1zhME32pHuYNXDJ7ScCt4r4s7+6LZWXh4y
	I8DWFTEaBxFgcBZxCjN0FCL/OqCn1Pp6TOZrby2+WOifd2bPAodI1UkYiawB1NSKGou1chrAEdZw7
	HYQpJAThCsJ3R5SODmc6eFpD8oUAJUjw98OrWJdcFHk+2M8+IbC9uzPXahDdx4+Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qgMl2-00Elhu-29;
	Wed, 13 Sep 2023 12:06:04 +0200
Message-ID: <31eb0df432f813453b487ae8fdc26a9402c448fa.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mac80211: export ieee80211_tpt_led_trig_tx/rx
 for driver
From: Johannes Berg <johannes@sipsolutions.net>
To: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Benjamin Lin
 <benjamin-jw.lin@mediatek.com>,  linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Date: Wed, 13 Sep 2023 12:06:01 +0200
In-Reply-To: <a887a7bb660837cbb3466e183d1714364d8ba9fe.1693549288.git.yi-chia.hsieh@mediatek.com>
References: <a887a7bb660837cbb3466e183d1714364d8ba9fe.1693549288.git.yi-chia.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_030621_197708_25B4DEFE 
X-CRM114-Status: GOOD (  10.13  )
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


> +++ b/net/mac80211/led.c
> @@ -319,6 +319,24 @@ __ieee80211_create_tpt_led_trigger(struct ieee80211_=
hw *hw,
>  }
>  EXPORT_SYMBOL(__ieee80211_create_tpt_led_trigger);
> =20
> +void __ieee80211_tpt_led_trig_tx(struct ieee80211_hw *hw, int bytes)
> +{
> +	struct ieee80211_local *local =3D hw_to_local(hw);
> +
> +	if (atomic_read(&local->tpt_led_active))
> +		local->tpt_led_trigger->tx_bytes +=3D bytes;
> +}
> +EXPORT_SYMBOL(__ieee80211_tpt_led_trig_tx);
> +
> +void __ieee80211_tpt_led_trig_rx(struct ieee80211_hw *hw, int bytes)
> +{
> +	struct ieee80211_local *local =3D hw_to_local(hw);
> +
> +	if (atomic_read(&local->tpt_led_active))
> +		local->tpt_led_trigger->rx_bytes +=3D bytes;
> +}
> +EXPORT_SYMBOL(__ieee80211_tpt_led_trig_rx);
>=20

It feels a bit wasteful to export not one but even two functions for
this ...

The trigger only really cares about the sum of the two, so maybe we
shouldn't really care too much, even in mac80211? I think the only
reason we currently separate RX and TX is that they can run
concurrently, but the truth is that it already can race anyway, at least
if you have multiple interfaces ...

So maybe we should just switch to a single counter, and accept that we
may sometimes lose an update?

Also this seems wasteful for mac80211 internals, so maybe instead add
triple-underscore versions that are still inline and called from the
double-underscore versions as well as the existing mac80211 callers.

What do you think?

johannes

