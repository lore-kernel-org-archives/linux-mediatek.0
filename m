Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28E6C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OftHQlL3/SZHidctDx5bqDbcjKcl0GkA0Xb9cAKf5Sc=; b=Ka4VDwRsf642vSEKSNbcmZOij8
	qzso2942KvqxyBXQ0h4+YDxO0B1f4c8TXbyodcMz2R28aESgGL+tzrQYgp2F9CUuqExRiRTvSG2EL
	rAP7rzvztzUKcbz/Wzlf3Dk4oiQz14fndhR6dnAccBrelUX+zc1lS75IDD7bcA+AGCkG88eYt7i6m
	0xI1M3CFDvjf4XYuJF82O9yzE3vy91v+/zotGGtl84V95IjA21dinWXcmTcy8jvyUIsSjMgodL07G
	xIYNs7xWKQyrUbfb9FsNcmFWku2IUL+NBEjxedrud7QbY4GK9LrxARYlhOTKDWAoCAj2hH5lhwd9Z
	4UrfKyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzEK6-0000000H6CH-0laX;
	Tue, 23 Apr 2024 11:28:30 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzEK3-0000000H6Be-1QaA
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 11:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=OftHQlL3/SZHidctDx5bqDbcjKcl0GkA0Xb9cAKf5Sc=;
	t=1713871707; x=1715081307; b=neYCoIKP8mdxTMmbNZGD9V2t7xzaJfQNwZ6dkjiS1BgBgJT
	ygeDQ8FAxll1O8puVgHoG/N7FqjaIjJm//NPYzlxAuPTNdGufpiuaerY5fcIr/q6UWTFR2Ayjey+q
	Xs/i+5zZO3jmH4vj+eapbRJquF6FmnpSyUOTs0ux+tHShBo6mADVP3W24b+5Qm1032O1SWkGl1VLd
	+n56pd5gdkWN+CbhDxMTHmZZqVNtN/7YHu6TJKo11ghd6Zqvl7xf+7xWFwy+kGlOS46MBdhytReVD
	ii/2T9Otdw9ogmsZcKDKUXoI/iFgeBHJXdBnapf68t//52EkRblFHgTLnUrAritA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rzEJx-000000025tM-3X8U;
	Tue, 23 Apr 2024 13:28:22 +0200
Message-ID: <e9c1c8fb20c39ed158f11a6152dc594de6073726.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mac80211: Update bssid indicator with real BSS
 numbers
From: Johannes Berg <johannes@sipsolutions.net>
To: Allen Ye =?UTF-8?Q?=28=E8=91=89=E8=8A=B7=E5=8B=B3=29?=
 <Allen.Ye@mediatek.com>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, "lorenzo@kernel.org" <lorenzo@kernel.org>
Cc: "lorenzo.bianconi@redhat.com" <lorenzo.bianconi@redhat.com>, 
	"nbd@nbd.name"
	 <nbd@nbd.name>, Evelyn Tsai =?UTF-8?Q?=28=E8=94=A1=E7=8F=8A=E9=88=BA=29?=
	 <Evelyn.Tsai@mediatek.com>, Money Wang
	=?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=AE=89=29?=
	 <Money.Wang@mediatek.com>, "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>
Date: Tue, 23 Apr 2024 13:28:20 +0200
In-Reply-To: <757f417d63a750e84ab883b500becc2773e9ff17.camel@sipsolutions.net>
References: <20231208063820.25983-1-allen.ye@mediatek.com>
	 <65d21336e8f7e180352403a3e894aeaf27a22cab.camel@sipsolutions.net>
	 <c23373d71eff81ea043783edff0345502bb2e299.camel@mediatek.com>
	 <757f417d63a750e84ab883b500becc2773e9ff17.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_042827_411517_790612F0 
X-CRM114-Status: UNSURE (   7.58  )
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

On Tue, 2024-04-23 at 13:21 +0200, Johannes Berg wrote:
>=20
> Anyway, I think I agree, but can you please add some validation of this
> to cfg80211 as a first patch

I guess I should say what kind of validation? I think it'd make sense to
ensure that the elements even exist/are long enough (currently there's
no validation in nl80211_parse_mbssid_elems at all!!), perhaps call
validate_ie_attr() there as well.

Feels like something should also ensure that not only is

	config->index < wiphy->mbssid_max_interfaces

but also actually < 2^max_bssid_indicator?

johannes

