Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E24F606A325
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ROQgaAw5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=TPn2xTUE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BSUyMZbUn8O+QiO2CeUKN2Iz1br7Q9gZAitcRCrCAMA=; b=ROQgaAw5/Pd6/vvLAggmkf4E6o
	MJ7gYLqdoZ0yIVfqpSS+Wvquhu197iR+VS2BxznZ3bq+b4LXSHigH/c4ehcru7uSN2QuIXSizqa+g
	sCXgHRaSu4gU7P0k8x+R2ORXzJOVckK9nutHiIdctJFRE1AJfxHVqYbNX7sXXSHm1UhH6Db1ojhi3
	/4BG3XJhhgx37qsydkB7F7EbMj8dax2vbmOvnMPJhVKFBDKRNz9Ub5frSdkOKMEx4h5w7NY5zWPfo
	Kg0Vz41cnds9aIuBd1rrlfVeNX3VvSUjH+QHsP//r0/HgrG/ikISoPUAIDvJJmrJcR1m6wZHVGZyJ
	UHLRSV0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiWF-00000003MDk-0t3b;
	Tue, 10 Nov 2026 09:51:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiWB-00000003MA5-3xEk
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 09:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=BSUyMZbUn8O+QiO2CeUKN2Iz1br7Q9gZAitcRCrCAMA=;
	t=1794304315; x=1795513915; b=TPn2xTUEmPjs2nYBH8aVkfCnP3LKyM4cljX+VLvisMBIG0t
	ZfV1w7V+vje3QSeD8Foq3IaxH808tt2POOhAJpWXCLfHHZg8m1a1/+M9CJiDOpjKWPzj0YiBitCOR
	vLvNahEDyiP/JTIktkMZ3Al3fQOkEwH+wtr6Cw6ngs1l6ZczRfb/fayVEizjeGdoWXSWVkPULHX/u
	T5QZfkbQn0TMHOGKqQPSibthWn9cDk2BG1cCjBwfbCH8Lt6fQdjyUBa6O+TVnDYmjv5gG6b311D5Y
	jxiBy8ZM/hbEylhPuwFyMep9frgii6HLMxUihu8Bu4jOb8TyEL67uGfQn16/Idmw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQiW3-00000001Pdg-3l89;
	Tue, 10 Nov 2026 10:51:48 +0100
Message-ID: <72bf69b140827263fc4dec20f757d54d85f4cc65.camel@sipsolutions.net>
Subject: Re: [PATCH 1/1] wifi: mac80211: don't coalesce a new ROC onto an
 expired one
From: Johannes Berg <johannes@sipsolutions.net>
To: JB Tsai <jb.tsai@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Sean.Wang@mediatek.com, 
	James-LY.Huang@mediatek.com
Date: Tue, 10 Nov 2026 10:51:46 +0100
In-Reply-To: <20261104092050.1930716-1-jb.tsai@mediatek.com>
References: <20261104092050.1930716-1-jb.tsai@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015156_266091_870E6FEB 
X-CRM114-Status: GOOD (  12.42  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-11-04 at 17:20 +0800, JB Tsai wrote:
> From: james-ly huang <james-ly.huang@mediatek.com>
>=20
> ieee80211_coalesce_hw_started_roc() computed the remaining time of the
> running ROC as
>=20
> 	remaining =3D cur_roc->start_time +
> 		    msecs_to_jiffies(cur_roc->duration) - now;
>=20
> and merged the new request into it when the new duration fits. When the
> running ROC is already over, that subtraction wraps around (unsigned),
> the "fits" check passes, and the new request gets added behind a ROC
> that will never produce another on_channel or expired event.
>=20
> The expired-but-still-listed state is not rare at all: the driver's
> ieee80211_remain_on_channel_expired() only queues the hw_roc_done work,
> so until that work runs - the driver's UNI_ROC_ABORT round trip can
> take tens of ms - every ROC on the list whose time is up stays listed
> with started=3Dtrue. A remain-on-channel / mgmt-TX request arriving in
> that window hits exactly this path.
>=20
> Check the ROC's end time explicitly with time_after_eq() and refuse to
> coalesce once it has passed; compute the (now guaranteed positive)
> remaining window from the same end time.

Please rewrite this with a useful commit message and comment.

johannes

