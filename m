Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B95C3600C
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNOxqJPY/YHWbLO2RHaiqSmt9tX5hxrtpOUoQm6ztDU=; b=kj4QiOyIiAHSUHwrl3TbcnfJuG
	O5GcyY/N0YNmYZBe5JQSMmzbe0RDs42hCHDDJdnLK0xodegTMdsqNVy+U0v2BDrf1E67ISGH9xE8+
	M4ezMWykPwAND2XvMacvyq58Hcs84LTBYUyW8UleZ6LaaVPa6r7eMJUrwK3No3I+GnrrKSks3bw4S
	e5rS3b264AVRvjYubUfbS8/m8ND8qQs+BMuWd94iuj0m5UHA31LRCnzNVk7YiNSrkHXaI+V7D5kLm
	4kA0YRbGPXTmC/uaAbdzy/FUGtZaW++nPlHjiYdx52cBYAiK9i4TIqva50wlO186p/MLNYISKZHs2
	c1F4enZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0N-0000000008v-1ntW;
	Mon, 31 Mar 2025 10:04:31 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBni-0000000HZYu-1osP
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Mar 2025 09:51:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=pNOxqJPY/YHWbLO2RHaiqSmt9tX5hxrtpOUoQm6ztDU=;
	t=1743414684; x=1744624284; b=BMhMGtCpBmc+C39sex4+hB1LbtrM/GzTFeZcGwVWR707kbW
	CsnXMp1mHRmFwkybExaTsXTTilJYg9mFFEbbfBHRVnK9OjaGGPEGAPszJFABQiwyHLU+sXfqzd+F0
	pp3uolCB6BQJPp0qsAvP/QHkT3nFKea3xr+1tpP02I/7Nv06V9NgTnHtga2FJI1+9LEo0NtEJReKo
	uEXHztoI9eSj4cAOj66B5/k6plxGrKZF9BjIeyJIS4Vud706wo3gwK6rNswFg8rTnHGA6dZWzv2Ax
	VpFfxjOCnO+Ii9UQlv0MB+QgfnfKshm5meZYnRnAtODnGQogB1o1kxO7jXrNu6KQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tzBna-0000000B8Kn-3SWD;
	Mon, 31 Mar 2025 11:51:19 +0200
Message-ID: <bb2c561c7b849dcf9c129520a28f8d5667e5bd8e.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mt76: mt7925: add EHT preamble puncturing
From: Johannes Berg <johannes@sipsolutions.net>
To: Allan Wang <allan.wang@mediatek.com>, nbd@nbd.name, lorenzo@kernel.org
Cc: deren.wu@mediatek.com, mingyen.hsieh@mediatek.com,
 Sean.Wang@mediatek.com, 	Soul.Huang@mediatek.com, Leon.Yen@mediatek.com,
 Michael.Lo@mediatek.com, 	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, 	ch.yeh@mediatek.com, posh.sun@mediatek.com,
 Quan.Zhou@mediatek.com, 	Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com,
 linux-wireless@vger.kernel.org, 	linux-mediatek@lists.infradead.org
Date: Mon, 31 Mar 2025 11:51:17 +0200
In-Reply-To: <20250331091747.2592021-1-allan.wang@mediatek.com>
References: <20250331091747.2592021-1-allan.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_025126_752420_26E308B5 
X-CRM114-Status: UNSURE (   5.55  )
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

Was just idly wondering what you were doing and it's your driver and
all, but ...

On Mon, 2025-03-31 at 17:17 +0800, Allan Wang wrote:
>=20
> +	req->is_eth_dscb_present =3D chandef->punctured ? 1 : 0;
> +	req->eht_dis_sub_chan_bitmap =3D chandef->punctured;

That can't be right?

johannes

