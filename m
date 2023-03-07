Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5000C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlWB/D9k1qwKsQ+RK0fIddhmn+ijgdb9pn4HbzaBGP4=; b=sb0cSEHTX6OWffVBxQb5CEipL3
	lodrk29roEUASssw/8PpdLqlAohXjslZyx2Hs+lqssJBB7aLZ8sJV0oUN6xUfgRKJftpePaBiMQus
	1YWcZbeMUpMCyZslSnI8nx2f5VvBDihE9S61EpwGmUsBI4DFTYZox/sxzvKRlOlPVwxRG9zNA1eMx
	r0+TJnRVjnQ/+E0b8/GbHXhEWG6EXAuPANNQRoE5/2XKBnyBETEX1oqR6udmSDZ2RQMiEfDpd4G4M
	Td0H8zjagXA5RqaeOOx/HFpeB9a4yRaovO314yVXDIYcMchk2JdqHdsO8TrsODU/+WP1iOyJryZr2
	ETZIFiEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUFE-00HA1P-NE; Tue, 07 Mar 2023 10:08:32 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUFB-00H9yE-F5
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 10:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=RlWB/D9k1qwKsQ+RK0fIddhmn+ijgdb9pn4HbzaBGP4=;
	t=1678183706; x=1679393306; b=WYIWh1iK6q/f4Yw2D8fRApzomu/LrOgcGA6CR0ElnDkYQ4T
	E+YhxERI0ZhTELG7jk12J9u+1DCjlPF1g7J2MsYZEkflG0oLKPlNw3TyZLe6Le6PXxFCP62b46dPj
	qzStamJ2EKfA1P1/gZ+e2znm6D2pdV493BWKXmtyAap99wnwKGOQQYfZKZOEVTuxuvWVo2Pe9E25n
	bO2pRrApZIL8BkiKsoZK7DysduxTLRjJ3ix+7w2YfYl4ipPH/2egR90i+iah7VuCgXh60W6Ui3Wud
	Fbn8Z8cZdYFJ3QJVYc2d5Dub7CbpkfsSfZjEFBY+yaB+BrXrcpJ0fDyJ/eaVclaA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1pZUF2-00EI4T-38;
	Tue, 07 Mar 2023 11:08:21 +0100
Message-ID: <3e20bade92b97c7b441f18c7e12e12eaee519481.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/2] wifi: mac80211: add LDPC related flags in
 ieee80211_bss_conf
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	 <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Date: Tue, 07 Mar 2023 11:08:20 +0100
In-Reply-To: <1de696aaa34efd77a926eb657b8c0fda05aaa177.1676628065.git.ryder.lee@mediatek.com>
References: 	<8d9966c4c1e77cb1ade77d42bdc49905609192e9.1676628065.git.ryder.lee@mediatek.com>
	 <1de696aaa34efd77a926eb657b8c0fda05aaa177.1676628065.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_020829_528308_69686896 
X-CRM114-Status: UNSURE (   7.56  )
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

On Sat, 2023-02-18 at 01:49 +0800, Ryder Lee wrote:
> This is utilized to pass LDPC configurations from user space
> (i.e. hostapd) to driver.
>=20

I'm applying this, but could you do me a favour and check that we really
don't need to reset this? What if we added a previous BSS with e.g. VHT
and then reconfigure the interface to w/o VHT and then the settings
might stick?

More generally, it might be worth checking if we can just memset the
entire bss_conf to 0? We already do this for link conf today (always
reallocate it) so it should be OK? Same actually goes for client mode so
maybe we can generally clean that up?

johannes

