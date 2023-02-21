Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBECC6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLyDkkCJVTxe9e+wCAF7kAPYPDh+jvwGVi3AdFN6hFI=; b=IchCIQE7FyheogRR1RMn2P2QI1
	wJ1G2y13XmTMn15GTWkWcVTRnLGFQc2jDVETZUy+s5bOUgLr0OHTll0qIl77nG/abb+pZ8aJmFMRR
	fkpKvkjOJ6RfbcxKBhx3KkU6mYrVQIgnV99kbv4HhdfYfyeSul3/um1ga2Bt/6VuOP+1eVJIpL+u4
	fhGLL6NiGLB3rQ+06k8DSmanaoO0mceivLw5qkDKxOEPVvzuUocZCgXILnLhgIjERztcqA6iQyx9O
	CNZy6kAgA2a5GOHiYV3f+/2+uwy3vHHUnfz78tm2jaB+8Q8VMn9OC7QJEXEy2illa1VoV/7I+rbPx
	SwjNuMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUPPA-007IeD-02; Tue, 21 Feb 2023 09:57:48 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUPP6-007Ib7-5I
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 09:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=jLyDkkCJVTxe9e+wCAF7kAPYPDh+jvwGVi3AdFN6hFI=;
	t=1676973461; x=1678183061; b=m6zBnqrj/vYzfbcREUpYJGjs4ANjwNznv6fXB2EXntyTNB2
	0dde1A19eit+yXavdAw9iWJsp2NxjuhiH1FW7n/YMbRTKHlqBJANVj/E15ssp/vwudJ4ZUGCJqTep
	udUbPx9fdOmLLWd7UMvXTZIe9Vhq0+wdY0G9WD0/nU4Ve43FbBVDSyXWUygen/ffAw3U/NDvJ7no6
	8TQzqGwyrue81HlKOnhIiJqR7OwMLk7pc2ZmamkOA5k7R//gSgG50NTfm+RcQiIJCsYy5MESZTpW1
	F41oa/KmS3Zr+7veEZIuavGf9Nk8ywHga7kPMuGS6yJS30afiC1Sv7x560I7kRTw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pUPOz-001Axm-0o;
	Tue, 21 Feb 2023 10:57:37 +0100
Message-ID: <a3f50c4b4e75ff53a5611c3ef2d6345d4324cedb.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: mac80211: introduce
 ieee80211_refresh_tx_agg_session_timer()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <Ryder.Lee@mediatek.com>
Cc: Shayne Chen =?UTF-8?Q?=28=E9=99=B3=E8=BB=92=E4=B8=9E=29?=
	 <Shayne.Chen@mediatek.com>, "linux-wireless@vger.kernel.org"
	 <linux-wireless@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>, Evelyn Tsai
	=?UTF-8?Q?=28=E8=94=A1=E7=8F=8A=E9=88=BA=29?=
	 <Evelyn.Tsai@mediatek.com>
Date: Tue, 21 Feb 2023 10:57:36 +0100
In-Reply-To: <ed37dd9cfba8d0ec7b50f932742156aaa57843e9.camel@mediatek.com>
References: 	<7c3f72eac1c34921cd84a462e60d71e125862152.1676616450.git.ryder.lee@mediatek.com>
	 <44f956b493e33bf394b2947b77e7c86f394b28ed.camel@sipsolutions.net>
	 <fea6defb05d0f39d99bce96ea22e8c92d1a939ab.camel@mediatek.com>
	 <fb3ab2d925fdeae2e7cc778419c1476102b9f85f.camel@sipsolutions.net>
	 <56190740441a6740e9edf761ab2167edc51f20c3.camel@mediatek.com>
	 <c05a8b20b5d4429b1c42ef2398ff2bf760bd7eae.camel@mediatek.com>
	 <ed37dd9cfba8d0ec7b50f932742156aaa57843e9.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_015744_243553_5E3CBBCC 
X-CRM114-Status: UNSURE (   8.65  )
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

Hi,

> > > Since there's no any keep alive packet being received by host
> > > stack, leads to mac80211 destrory BA sesion.
> > >=20
> >=20
> > More specifically, the BA session relies on client side's Tx data to
>=20
> Typo... I mean *our side*. Something like this

Sorry. I'm just totally confused - I thought the initiator only set the
timeout, but I see now that it's negotiated and the actual value used is
from the client.

Which explains basically everything.

johannes

