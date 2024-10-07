Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D9ECFB446
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 15:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tde9+HTtwvSdjyegqAc2pBuj8Xp3aZ588ljCLxtJGic=; b=dKA1XhDbnnMdvqVlQBDN6uRKNh
	hn3PkQMO0dpdhM0K/FTbWMbvrGQpvY2yB6l3hVJSbpPg0ObIWvdO4VhhNlpKxKt9TdrkEdi77GYSb
	y//yCGj3IeFVv61ilQP0bmXTqktyyOi4yzV2bQqNsi11/yz6QOCUdytB8H1xsb+iIVCNdjIBNvc1F
	Rvy7fVkQhJQIeutv7TkV6TkDUP8S01pvORE5LXNTKCWAkbfVZfoBiIxR864fllKs7TT4qj6VOTI/Q
	Dm1wmgbkgviIG2Gaf3ELke9hGIS9MTp4Xgl4LXWw5DaAvdfIqWmX9Z3n+zps47TFJ74tjUOcXX6bP
	2fBzfvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpsU-00000002zkp-15VL;
	Mon, 07 Oct 2024 15:42:30 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxprA-00000002zWL-3fDn;
	Mon, 07 Oct 2024 15:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728315653; x=1728920453; i=markus.elfring@web.de;
	bh=tde9+HTtwvSdjyegqAc2pBuj8Xp3aZ588ljCLxtJGic=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q5Sq3COyuSf/1JH97wnrgaIuQ3reunJaZXWZmgVqH3S4bc1gzfXC1bXmCX0lRPZK
	 MohSHiT6Bdr9qEsk2PM6O1gZqD9rnqd+e//uYO9xZ4GmLXXcR6gWl8OwqWdvAoY3+
	 8TG7qKE/wkuby1eu63mCXt7MDg+vGZ4FCXadUmF/uCBxSdiKGblgH4Hxdh4KJHhUH
	 cxY5LdaysWk0KuX2IZ4m/HzB83zjBAAwZiZVeR+5dUomrUUly3khG1gzv8aBq1CQb
	 Rie09a8IG5pQL2HPE/H9GYTFc/Zm7IWgjB648sn8Uyn0AQmNlrn0o0I92Jep9ct4Y
	 EvUZpid7Dbs0snx9sg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mc1VF-1tZ6sc2ymF-00aZDj; Mon, 07
 Oct 2024 17:40:53 +0200
Message-ID: <caab097f-2522-4c07-9d05-ffa2acd4f157@web.de>
Date: Mon, 7 Oct 2024 17:40:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Adam Thiede <me@adamthiede.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>
References: <20241007070101.23263-5-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v9 4/5] drm/mediatek: ovl: Add blend_modes to driver data
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241007070101.23263-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xhaVx5v7PosVmZn5lfsVejKxm77d78UE8Dwj1ZHJMNzfubbc9hc
 nOMDtulMu4vq4tw/LAOTukfsSPVPLLOLPZqM3P3udTJIHJdl6aiEcZsvibqdJvqpg3WvuXl
 U2xDR+GtEQa8tpUhbvJQj4ppHPNP8+4o/NQZa4kSx24ZpA0n8V/I5nDPj/8Y4iFGXiN9W+i
 YSKD4lwcvpemBctWU0tYg==
UI-OutboundReport: notjunk:1;M01:P0:i6vWuXQBUIU=;8wJPZmm+YsQAcUeXc+eYb4/8UrW
 mdoNJ5PMI8upFkOyQItiezXpSAGoHVOlOK3MpX3eXIulgTlc4zuur4F/alJYjKtk0tSE611Rg
 9KNU8T4MiErNjW3/3ag5oyul0u3C81SR6mP362eQzIKP7Xj8h5kah2GdQFTr5w9KayiWWhISa
 y9A8Y/q/2eMvwvVSGP3OzAKsddqrDlN4KCdfXiyWYXrkFplAwan6Cwwo0VdqxZ483Z1ODfrmN
 3JPLgGJOG/pOM73xm6LOFQpdLGfGSBo/eNCWxibra6/MH24Xhuvwns8pKr6r0QI0627A+J+3Y
 tnd9g2cp3BmXu9fJtdAKC9fTBE8hg2cXKhmhDKgGgl91ekjhu5o5r1ptUkFUdeiSTgteMRFXu
 C0qHtZ6mKeqi5/OFmckJGmP3+aam/ANOkAdcMwoCWswpeSxxq2OlIi4gxrjWdD96ATmrH9kgr
 2GYutXrcTPSoA2BSQLIBxVqhQGI4e45BXBsnngBJ86PKgAEcxWzJb1RXB8QvgDDGPittqaaEi
 qyDnIASjLIwfM8oNbaHFbYQ/myCerrwXaaoCkajWhA1rjJfpOO4NeA/lTLPPRRo/X3vGUMWFg
 Ft9xNG56sIgu0EVgTu0/71JNH8kG4/AJ6L3SbLXpGX15DZJ6vkU3XQ+XS5wfKS8eWpoXK9KRz
 J6K6rwUkUu11sbVfDkQMoi0R1Z3ddpzqgjWO6sOiZJdid57AGnADfkmeHikXvJwN24LygyIU6
 iWSM+bV7Lkm335H5XDKxh0WUCPkD+uwWW5KTguhdx3WFVF5a+jC5wM9iz1E2inrPADQxjFh4x
 rzqZi8jx1Pzox33zD5aIqA9Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_084109_211252_41A3FADF 
X-CRM114-Status: UNSURE (   2.69  )
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

=E2=80=A6
> premultiplied supported in current platform.
=E2=80=A6

                format would be?


Regards,
Markus

