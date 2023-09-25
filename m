Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE593CE7A81
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 06:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1hPzSJuLBW1+FWm/Ve3X8Sn0QK2spKaLZ5yy/mAmEE=; b=4eb0wH1enf5H4FsDAeQcI8PLA8
	aIqF3eWu99Lc5CSOPQFD4CgxMlfv9KGNufXwhIOdb0ret+RIkXeyYEm89FKbRGf35QFT5hxBVqtYN
	UZFehLbrW1p/3vXL17tXjolljytv/+0012Nbd0k21WwWMo5PaOjeTNMVnoQf+cux/3CQfSQid0QIk
	2Q0z02UiLra7n9zJiqas6KHOalXxnCLKxJO+nZYJb59Rvnc8EXeEImcbMK8JfIqrSZW5xMaa5h/Cy
	U8P4hp+lXUrT7erQ0jJS365QYaNNn1mGuKEqJRh5UYwcu7lUZWEbFgeDqrUbczxZjJniBGX9HPizl
	X9anJTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkfEo-00DT0m-1o;
	Mon, 25 Sep 2023 06:38:34 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkfEk-00DSzo-2u
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 06:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=M1hPzSJuLBW1+FWm/Ve3X8Sn0QK2spKaLZ5yy/mAmEE=;
	t=1695623906; x=1696833506; b=CzJkqmU2p9ODXL9/UoeHCgxl2ezB6ilq74pYi/0itGSnEoC
	GO5AW4tj6n9B3lwf90jtV78O0E6GF9JVIlHwlSaS64Qqu4RfdihjOYFIVcPJL8A/N09x8BnpKMkaH
	8lAT8Hls7EQkh2m1EBtDqiA/DXcYkz0M0snHqxl1NhHbhIrii186oKi9ZRtuRRBpif2KLfTy5alAx
	e7EH5EzhRYs1NADX+RWLu9hJ0njL1j2T7xCeOqvZn8VmmAfdGt+xxwB+TAGbgCgdwWqZuZ9Q5XxII
	o/5faMdhR5j5ikd1eamvlMM6hQnPO75tvWaNYycV1rJO6IYGhaE3cIE70TnIsq9g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1qkfEW-003DrB-1E;
	Mon, 25 Sep 2023 08:38:16 +0200
Message-ID: <35c14b437f8c4b61e2fc14c6b156bf5de330a493.camel@sipsolutions.net>
Subject: Re: [PATCH v3] wifi: mac80211: add exported tpt_led_trig function
 for softmac driver
From: Johannes Berg <johannes@sipsolutions.net>
To: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Benjamin Lin
 <benjamin-jw.lin@mediatek.com>,  linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Date: Mon, 25 Sep 2023 08:38:14 +0200
In-Reply-To: <038706d9bbf434642013e880300d4f597f13b514.1695329290.git.yi-chia.hsieh@mediatek.com>
References: <038706d9bbf434642013e880300d4f597f13b514.1695329290.git.yi-chia.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230924_233831_172248_48774E4D 
X-CRM114-Status: GOOD (  13.84  )
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


> +++ b/include/net/mac80211.h
> @@ -4733,6 +4733,8 @@ __ieee80211_create_tpt_led_trigger(struct ieee80211=
_hw *hw,
>  				   unsigned int flags,
>  				   const struct ieee80211_tpt_blink *blink_table,
>  				   unsigned int blink_table_len);
> +void __ieee80211_tpt_led_trig_trx(struct ieee80211_hw *hw,
> +				  int tx_bytes, int rx_bytes);

Hm, I think you misunderstood what I said.

I still think you need to have a well-documented function or two here,
but now you can make the exported versions of this be inlines calling
this new function.

But also this now fails the build if !CONFIG_MAC80211_LEDS, you need to
have an ifdef somewhere.

> +void __ieee80211_tpt_led_trig_trx(struct ieee80211_hw *hw,
> +				  int tx_bytes, int rx_bytes)
> +{
> +	struct ieee80211_local *local =3D hw_to_local(hw);
> +
> +	if (atomic_read(&local->tpt_led_active)) {
> +		local->tpt_led_trigger->tx_bytes +=3D tx_bytes;
> +		local->tpt_led_trigger->rx_bytes +=3D rx_bytes;
> +	}
> +}
> +EXPORT_SYMBOL(__ieee80211_tpt_led_trig_trx);

Even that won't build.

> --- a/net/mac80211/led.h
> +++ b/net/mac80211/led.h
> @@ -71,8 +71,7 @@ static inline void
>  ieee80211_tpt_led_trig_tx(struct ieee80211_local *local, int bytes)
>  {
>  #ifdef CONFIG_MAC80211_LEDS
> -	if (atomic_read(&local->tpt_led_active))
> -		local->tpt_led_trigger->tx_bytes +=3D bytes;
> +	__ieee80211_tpt_led_trig_trx(&local->hw, bytes, 0);
>  #endif

Ah. Actually what I was thinking is that __ieee80211_tpt_led_trig_trx is
still an inline, and then the ieee80211_tpt_led_trig_trx() exported to
drivers can call this alongside these inlines - that way mac80211 still
gets the (trivial) code inlined.

johannes


