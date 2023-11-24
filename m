Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D183CC61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 19:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dR4MEH7xKCu1higgA12F2eKeCLmZwqk+iO8UpgP8k8=; b=ihZVYxmQ0ozv3CCyeAZkH5Zoc2
	W573ty4nHUnFk9jdpQvVmRmzTA74mYT7MRM5iTniNBOoTTlfZFmEHQrxbYXnM0SFi75E4GZMLoQ0o
	YzmSK+KPfKJaJcI96p6Tc9bjCXXRz5Rk0AQEFnfTRhYTtfuAz0LuRikmv4TwOcR9jPG/zZdjH8MGg
	au10SWR/L82BPshIzlQ3ftzMIiyLICuOooR2bVFZ9r7Z1bqEK23hd7IYyRrRRTuE6RFL5NtSQsX+d
	Cp32m2/fFGnwDk8/QmPmFiTxLtM7873cgyy5h3YxijyhEjw7Iib81jJJPsXfKlIch1OtcLxoF67EF
	ZUBscdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6boV-007wRb-1q;
	Fri, 24 Nov 2023 19:26:07 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6boS-007wR6-1U
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 19:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4dR4MEH7xKCu1higgA12F2eKeCLmZwqk+iO8UpgP8k8=;
	t=1700853963; x=1702063563; b=X3lqrdxV1eUEydApa3jo8sLIi+cBfouH+23N0Zz4uvOCCOF
	7VkGvED01xNVyM+SE5R/VF5HfkQ1bJR+uq1YHBVMQuCkUQQiz8HxlUll+uXFJhPZAXsnai0VPUkxg
	3zqndEyl/y6ig93laFzlDdbeORAyUqis2dN4IT6uXCg72Dco/uyQ+hWa1sJQk2CvDYkbapuhvRNdw
	62jlgzSz7XIhkClOcTAQx1M5rgDVcsBmL3ZGP5fBrVW4KT/c7ywXIpwedfiNGSMSpKi8qaXKIWRsN
	bMqxcN2RsU2Yap+BmcwnkxcxDXlS4fnGFKS8nBuZVF1SDToiYr6leqQC4wbscGQA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1r6boN-00000002k4e-1kpz;
	Fri, 24 Nov 2023 20:25:59 +0100
Message-ID: <ff991106e2b09e296725be4d1fe02de1911a2a2c.camel@sipsolutions.net>
Subject: Re: [PATCH v2,1/2] wifi: mac80211: Add utilities for converting
 op_class
From: Johannes Berg <johannes@sipsolutions.net>
To: Michael-CY Lee <michael-cy.lee@mediatek.com>, linux-wireless
	 <linux-wireless@vger.kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Money Wang
 <money.wang@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Fri, 24 Nov 2023 20:25:58 +0100
In-Reply-To: <20231113021107.13110-1-michael-cy.lee@mediatek.com>
References: <20231113021107.13110-1-michael-cy.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_112604_498248_0EDC8D40 
X-CRM114-Status: GOOD (  10.79  )
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

Btw, I ended looking at this again...

On Mon, 2023-11-13 at 10:11 +0800, Michael-CY Lee wrote:=20
> +/**
> + * ieee80211_operating_class_to_center_freq - convert operating class to
> + * center frequency
> + *
> + * @operating_class: the operating class to convert
> + * @chan: the ieee80211_channel to convert
> + * @center_freq1: cneter frequency 1 pointer to fill
> + * @center_freq2: cneter frequency 2 pointer to fill

typos here ("center")

But maybe it'd be better to fill (or update, we could pass the channel
pointer in it) a chandef struct? Then it could also be more easily
extended to understand more opclasses in the future, perhaps S1G or DMG?

> + *
> + * Returns %true if the conversion was successful, %false otherwise.
> + */
> +bool ieee80211_operating_class_to_center_freq(u8 operating_class,
> +					      struct ieee80211_channel *chan,
> +					      u32 *center_freq1,
> +					      u32 *center_freq2);
> +
> +/**
> + * ieee80211_operating_class_to_chan_width - convert operating class to
> + * nl80211 channel width
> + *
> + * @operating_class: the operating class to convert
> + */
> +enum nl80211_chan_width
> +ieee80211_operating_class_to_chan_width(u8 operating_class);

And you'd actually get both in one function call? The chan ->
center_freq anyway implies you know the width, no? Is this really needed
separately?

>  /**
>   * ieee8 0211_chandef_to_operating_class - convert chandef to operation =
class

This also converts the other way around, btw.

> +	case 135: /* 6 GHz band; 80+80 MHz; channels 1,5,..,229 */
> +		/* TODO How to know the center_freq2 of 80+80 MHz?*/
> +		*center_freq1 =3D 0;

Well, you don't, from this. I'm actually a bit surprised 80+80 exists in
6 GHz, I thought it was treated more or less as a dead end.

johannes

