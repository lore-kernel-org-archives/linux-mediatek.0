Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53890ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdQ0vxWCf/i69ElmKkr7pvNCrQZ7ifmqgzMKPZJaKoM=; b=OWPGdkxdJ2JmbmTXjh2IJpaqUp
	JAnykWDaDqUVGHVogaKJuGBKq/YBwvYrH28ymZYtDIS/8piIX0bw2xzV4qIdeSP3/e2KeSasrKPrh
	6F46OTGSrhM3FbkJW6nNxI3GbZ3FoMaRK0/Nv8R8+LSuVsYoEEN2aYMshDBRhYtBpe2udYBzts+MA
	XpG52FGAeiFWV/LYYrxnoKOqSQqqTHE9EhEADCmu5150lP3lLtdJ8cU7Gfb6PMnROfzwNG3r/sv5y
	PJ/hndcAEggG9b+cxMhe3prTKCojw1x6xlZtg/p3654IqOTTKY4PZx+vcmg95xzcF1miESm1lA91m
	dj/+bw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZEd2-00FCPi-1A; Fri, 16 Sep 2022 16:55:48 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZEYe-00FAY4-Su
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 16:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=hdQ0vxWCf/i69ElmKkr7pvNCrQZ7ifmqgzMKPZJaKoM=;
	t=1663347073; x=1664556673; b=eGooR0qUw3dm0f++EWqr05skUR/pQ0arYuUJMeaTv3BanLZ
	P92EYyyI3TuJZzV0d48F4RU7tqSzArotl6l4mutwRBli6bou029RVZ/Vrt3od1xe20pasdpTBB27+
	WwiU2AaaYOcNCRuOBHWmLSRcnuC3DE4Kf8kKh69SmEwTaBsvfPJ/SEvlp5lWae5wBmztw2XhQMTLy
	Iq/9FRfWnCUZVzRV+G4DR+gHWzEHreO2KWvsdBdNSxTnhX7kmkisAebupq2rBCCSNxnhYaBnF8AzN
	pqIVapiKwM2Q8gfjogPdTLd5Q3uqmdscC6Jg5/F5SBC5mbvyJ3Z8yek1GWnG2RZw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oZEYM-000fxL-2E;
	Fri, 16 Sep 2022 18:50:59 +0200
Message-ID: <014de3ef48c3a12bf134e7cef967153665c84d6a.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: Align with Draft P802.11be_D1.5
From: Johannes Berg <johannes@sipsolutions.net>
To: Howard Hsu <howard-yh.hsu@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Felix Fietkau
 <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Fri, 16 Sep 2022 18:50:55 +0200
In-Reply-To: <20220916141700.28378-1-howard-yh.hsu@mediatek.com>
References: <20220916141700.28378-1-howard-yh.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_095116_963923_83C4489F 
X-CRM114-Status: GOOD (  12.05  )
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

On Fri, 2022-09-16 at 22:17 +0800, Howard Hsu wrote:
> Fix ieee80211_prep_channel to aligh with Draft P80211.be_D1.5. It shall
> shift 4 byte to fetch EHT Operation information.
>=20
> Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
> ---
>  net/mac80211/mlme.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
> index ff449e0c2e62..9bb085eab12a 100644
> --- a/net/mac80211/mlme.c
> +++ b/net/mac80211/mlme.c
> @@ -4735,7 +4735,7 @@ static int ieee80211_prep_channel(struct ieee80211_=
sub_if_data *sdata,
>  						   cbss_ies->data, cbss_ies->len);
>  		if (eht_oper_ie && eht_oper_ie[1] >=3D
>  		    1 + sizeof(struct ieee80211_eht_operation))
> -			eht_oper =3D (void *)(eht_oper_ie + 3);
> +			eht_oper =3D (void *)(eht_oper_ie + 4);
>=20


No, the +3 is just to skip the type/len/ext-tag

johannes

