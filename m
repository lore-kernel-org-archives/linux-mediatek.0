Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D296CD4847
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHwdImZwMaVc4O1Fs/2dN8M1RWteS+aWLr57hgj/EfU=; b=Gvf/ktW8bHWdJ8AMazLW6XAATi
	sgyknlaZSMlSqgOVGiQkvGQ86mPFJqb8G8RYsT51pynKb5CVd49PsmKCre3Qu9OlTz/HA1+9ZuA7B
	YLRmpd5nkcwzbYAosmbfgsqorIb8ZMR732TNnkErL80DslA8u47G5HqiOiHHDSIt0s4oCzGtcqKU9
	LUjzxyls8NeULDQuBHeRv8SWkf9N9wFSBa96+EcyUK9g/gHsGO6DJcxDXiosVdeYRSrrgZ4j7A6cm
	eiR0RfD3bb9jBpOKQr6BA2vBSk58OfxJlV06/rs911ntCKueK7GDVgns1PW8+wb/8whTk12/44OYP
	Cjke/Ygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmvu-00000003pmq-3ezH;
	Wed, 04 Sep 2024 10:08:14 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmKv-00000003gUA-0BLx
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Sep 2024 09:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=QHwdImZwMaVc4O1Fs/2dN8M1RWteS+aWLr57hgj/EfU=;
	t=1725442200; x=1726651800; b=vrDsAfXgbZRCf2ZQrKaaHOGWiKNNTnla9WnWFKzaDA9BIWL
	+dxzjKQEJ4PzNEf6PeM+9YNdUVsLQQrwosIp2izUmg/o4Jgx7XCJEyn4hJpWQO7LH+nSS9Pp5Nlbn
	zcJDapLNDpveg+HONs+wSTD9bFFTGedt2jrZIB3vgeKWizrtHX86HPzs/6obXrHH5yNVIULONukHr
	Wka/zYsEzRN9bCgNHQT2hIjA2Hz+5hCeUc6rkMKFyy/Yhot9JWduo+P1PbhNVo5YaWl0c2WsplMT7
	lVUpYI/vAvptqk69L/TXv7jYzco7EK/P12j5eA2eChV/FJP2PShZRulPCtCTcOCA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1slmKq-00000004Z9a-39p8;
	Wed, 04 Sep 2024 11:29:56 +0200
Message-ID: <df96a65701b5c72d78805b7f7c518670ae794f2b.camel@sipsolutions.net>
Subject: Re: [PATCH v4] wifi: mac80211: introduce EHT rate support in AQL
 airtime
From: Johannes Berg <johannes@sipsolutions.net>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, jonas.gorski@gmail.com
Cc: deren.wu@mediatek.com, Sean.Wang@mediatek.com, Soul.Huang@mediatek.com, 
 Leon.Yen@mediatek.com, Michael.Lo@mediatek.com, Eric-SY.Chang@mediatek.com,
  km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com, 
 posh.sun@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, 
 Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>
Date: Wed, 04 Sep 2024 11:29:55 +0200
In-Reply-To: <20240904091749.7311-1-mingyen.hsieh@mediatek.com>
References: <20240904091749.7311-1-mingyen.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_023001_107558_047AE004 
X-CRM114-Status: GOOD (  10.41  )
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

On Wed, 2024-09-04 at 17:17 +0800, Mingyen Hsieh wrote:
>=20
> @@ -443,13 +549,18 @@ static u32 ieee80211_get_rate_duration(struct ieee8=
0211_hw *hw,
>  		idx =3D status->rate_idx;
>  		group =3D HE_GROUP_IDX(streams, status->he_gi, bw);
>  		break;
> +	case RX_ENC_EHT:
> +		streams =3D status->nss;
> +		idx =3D status->rate_idx;
> +		group =3D EHT_GROUP_IDX(streams, status->eht.gi, bw);
> +		break;
>  	default:
>  		WARN_ON_ONCE(1);
>  		return 0;
>  	}
> =20
> -	if (WARN_ON_ONCE((status->encoding !=3D RX_ENC_HE && streams > 4) ||
> -			 (status->encoding =3D=3D RX_ENC_HE && streams > 8)))
> +	if (WARN_ON_ONCE((status->encoding > RX_ENC_HE && streams > 8) ||

That should've been >=3D, but I feel like it might be better to move the
warning as multiple warnings into the switch statement now? The > and <
here also makes it vulnerable to reordering, which is probably not going
to happen, but why put the trap here?

johannes

