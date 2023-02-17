Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EF0C636D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 18:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xG89Mz9pj4E3T/EI2ryZS5Oc9+f4DJBf5248lLVypVI=; b=rAzqbG0HXPprEeXgjlsmGR2LD/
	4PbeLNDN75HcBpQ5KdF4ffWXKbAngUJ5oCuEBV+Pkv5h5Uk7QSMQ0nguq9nDWyfsD8EOyKKoo5sZ8
	kulwbW9oDXHyzUv83+r+Y2P9Qxe74YPK48PfuDvnuP08cJxaLkSvUnqXx1N7jkvCJlzI9sWmcrUFO
	uKc3rKZowngszVJSbKbd8E91tysG193qwzo4dNIvq+JO7tWQxSjRcG0eubRVj56JGSnekEsrlQTcB
	N3HKqLT9ZMIT+6s1QUUIvRpPcUJnlO3N8gxO9beKsZsmY6SpYKt29E5ya/oH6Igo0ogs3qsWpMfpZ
	gSdkdxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT535-00FLRF-DS; Fri, 17 Feb 2023 18:01:31 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT532-00FLOx-6k
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 18:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=xG89Mz9pj4E3T/EI2ryZS5Oc9+f4DJBf5248lLVypVI=;
	t=1676656881; x=1677866481; b=G15hEshllAobsVI3SpAx4+bm97CedHBc7SP4SEMmwpoe9GM
	Y9lCkQrhtdiv9Kvs2V9cmr+7TjhAQZNXPaW0FSV6mPc7b/+fm+xiq2jOm9S/ZkkAqKnVlF/Hx7/iJ
	RHewCh1mSM0wkRiiC39IruZ6y9r7pF5JNnnnQRqa1ixmjdFW5g6qP+REOAPm6r28lMliZffd4Qbvu
	NLQdXmSufMZ1xi4vAOOLlE7dP7LRw3CUhr0wAIE7NChcBID5dcOiasyaO2QsJOt0eiG3C4Dvcd421
	J0HGvId/oSTox27EUWfCabwdN55eTjEH1tDMLFfb9xyFh8v+E8cTJGqQS6suiy/Q==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pT52l-00F90e-0k;
	Fri, 17 Feb 2023 19:01:11 +0100
Message-ID: <44f956b493e33bf394b2947b77e7c86f394b28ed.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: mac80211: introduce
 ieee80211_refresh_tx_agg_session_timer()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	 <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Date: Fri, 17 Feb 2023 19:01:10 +0100
In-Reply-To: <7c3f72eac1c34921cd84a462e60d71e125862152.1676616450.git.ryder.lee@mediatek.com>
References: 	<7c3f72eac1c34921cd84a462e60d71e125862152.1676616450.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_100128_261724_47646099 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

On Sat, 2023-02-18 at 01:50 +0800, Ryder Lee wrote:
> This allows low level drivers to refresh the tx agg session timer, based =
on
> querying stats from the firmware usually. Especially for some mt76 device=
s
> support .net_fill_forward_path would bypass mac80211, which leads to tx B=
A
> session timeout for certain clients.
>=20

Does it even matter? We could just request sessions without a timeout in
the first place.

Or do you have a strong reason to need the timeout, such as limited
hardware resources for (TX) aggregation sessions?

But then maybe you should just time them out based on FW statistics
directly, rather than having to periodically refresh the timer in
mac80211?

I don't mind the patch, and I'll happily take it if it's needed, I'm
just wondering if that isn't a very roundabout way of achieving things.

johannes

