Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C11CAC5BB
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Oct 2025 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFcKqv6NENApTHDEgHun0uuN+uezqyHAhEFQCuoA28I=; b=4D1yPtT6vKGssyV9o9AoizKj+r
	kYfM0qkwsOLFUCsikW4koxN/ajGKyIcyb17AsfYXx/0XABIpBPcG5r8/xfI+tjtl7DTFt6AA+E+HM
	wMMBiD4p1jkW2utzh3Zb4esLMvn9f50V8XHh6whtXMwhd3+8nFzkCM9oMOnlQdSLsnsz4DhHWcTc6
	A1ceF0SgRBw+FCZaftTA0P41aM66YtpxU/vGFdERf/x/SyzJw3bJJnxpXD1qSgF7moSmdUhKiWsyh
	Q/NaqeFRkThz2zObrIl20B8U7G8WiYRDpkoEUsu1dhzIczEaC0W0NJTv3CehdIXH4E3AabpOdbeJa
	B6e5YRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QDY-00000003Y72-1TQT;
	Wed, 08 Oct 2025 09:12:16 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6QDV-00000003Y5U-3PUo
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Oct 2025 09:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=yFcKqv6NENApTHDEgHun0uuN+uezqyHAhEFQCuoA28I=;
	t=1759914733; x=1761124333; b=n7Tu9+0zOwdDxgVtOcEs9C6pIGt8VrFi+CWrS31cLdRqS2G
	lhnZLMgqXqDlTRFOIy5HxHDOI5Ll4Tqx4Y+RqkIOVB3Ic42J9duWOPOdFKeYGrfc5yuPAaJOvCkVG
	b1I0xIzVPTLFxE2aFG3npOx8oooV8ffwllNjtIzma/NLWwblpYCa7wXwWnKeuMwC76nExxeW6QfGi
	/wOupvRMryys5n5UsiWCDDXldX3zubSsYI4DLNTpzXpZa8MdLydir6WAfyKB16IDdgfDPLA+lS/3P
	mXmz8QrvB55W5QXHZX2Vnjk4bZka81t0pIhGK+eXDfmE7lMOUyODuOTrM5MLoNeA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1v6QDN-00000000FXv-1RFj;
	Wed, 08 Oct 2025 11:12:05 +0200
Message-ID: <d7eb196b01003a1de70456d5a31d9b4a37d555bd.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mt76: mt7921: Add PCIe AER handler support to
 prevent system crash
From: Johannes Berg <johannes@sipsolutions.net>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, nbd@nbd.name, 
	lorenzo@kernel.org
Cc: deren.wu@mediatek.com, Sean.Wang@mediatek.com, Leon.Yen@mediatek.com, 
	Michael.Lo@mediatek.com, allan.wang@mediatek.com,
 Eric-SY.Chang@mediatek.com, 	km.lin@mediatek.com, Quan.Zhou@mediatek.com,
 Ryder.Lee@mediatek.com, 	Shayne.Chen@mediatek.com,
 linux-wireless@vger.kernel.org, 	linux-mediatek@lists.infradead.org
Date: Wed, 08 Oct 2025 11:12:04 +0200
In-Reply-To: <20251008085916.1626952-1-mingyen.hsieh@mediatek.com>
References: <20251008085916.1626952-1-mingyen.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_021213_887002_80EB82BE 
X-CRM114-Status: GOOD (  10.04  )
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

So ... yeah it's your driver, and yes it's already at v2, but ... this
still seems very much papering over a problem?

On Wed, 2025-10-08 at 16:59 +0800, Mingyen Hsieh wrote:
>=20
> Unable to handle kernel paging request at virtual address ffffffc01099eac=
0
> pc : mt76_dma_add_buf+0x124/0x188 [mt76]

Why does it even crash there?

> +++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
> @@ -96,6 +96,9 @@ mt76_rx_aggr_reorder_work(struct work_struct *work)
>  	struct sk_buff_head frames;
>  	int nframes;
> =20
> +	if (atomic_read(&dev->bus_hung) =3D=3D 1)
> +		return;

And how does sprinkling this "magic dust" all over even do anything?


This sounds a bit like the driver isn't able to deal with surprise
removal, what happens if you e.g. rmmod it while running traffic? I
believe the effect of the error recovery would be similar, if you don't
handle it, so are you sure there's not a completely different underlying
bug?

johannes

