Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73802CE7D1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 20:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZT6HLXkmgq+nzP9SCRx/NsEmzXMd1CrD2QiOlaZlfZ8=; b=rpdB2nMtGZkz7RFcH4B8viIe5o
	qffPNtdOHYSX9ELXNSHeehXQhDsf72BluD2BVVM/t1rbUzO9forvSGKvYe5BxZ6HmaQt1dKUs3FVH
	oWDStNrF/hm9I8PXmgqIF9mQiTriyEGgFNne1zgr8cm99frcayCpnDawTk/Ui0suI5nHhhFYaWIki
	SU4pXpPiLYrXphiAdhLEOt9FQOJdcqRYwHXVDW1ZFSvKRmHGS7SJIKNsPn07tdH7ZGoezXVQNlFDS
	QIHfTS3YAx5LVziGz/myZBtf6lhoyosnIRMKouNbDntgjDHBFYwPZVaqfEj295sxlH4zLJL8TxDU4
	KWcygLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjIR-00000003yCA-4A3s;
	Tue, 01 Oct 2024 20:16:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sviEp-00000003r2K-2T5b;
	Tue, 01 Oct 2024 19:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZT6HLXkmgq+nzP9SCRx/NsEmzXMd1CrD2QiOlaZlfZ8=; b=d9g6mSDojsHEFwM6o85Eses/mH
	+xsTOpx3V0xt6WBpx5R0weIpa3PeeqFoJVvZmRiWKlVRu2KSUt+JELhJoAZPegHbYYiVZc4rcMR94
	ka4aBNWjAceRcMJhPXI69any3rteNrB+UBXIgLp/mKDDQaY+GPg5J3g7NyX02vfkNm7c5MCst2a6i
	CYq9thO6h3hunWxSYDxkpBhFPJkCDJ0xasHEvndHGn16HT2nwqc/e80TOr3uLM+/SfFZd00jtCBlS
	xWDTPR6Duhz63OP/HyzGky8ABQdV8pb0VuUwYypjTCAmKfQwDeBamLlG0QIqIb34WbLJ9ZuFpc+dn
	3TwAEdPw==;
Received: from mout.web.de ([212.227.15.3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sviEl-00000003IeV-46y0;
	Tue, 01 Oct 2024 19:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727809709; x=1728414509; i=markus.elfring@web.de;
	bh=ZT6HLXkmgq+nzP9SCRx/NsEmzXMd1CrD2QiOlaZlfZ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=olDNwP65/FZusddYbtaUBU0+8MUuW6O7d7khSOq2B90rT6LAYS6ZB1BWWXG+UMwa
	 Q91hZAVBTHUHq9UkVXQ74K4fGeuD5vaZ5/HZeEPJJBhrf+9iNAyb8M2sSdzspwrQL
	 Pj4sulk/ktfvfQYCzSb8FlgNkJIdxtsf/1EjmqrM+ks9epoyWzw216Ue4GpgB4ThT
	 UW3NfSqLzvl2jzW0/aKrfnX8vucJGzYRJQtsHrBIHatrYdPO6jnRd2ul5EOJl5nEM
	 1Bivs9OQnBj/i0z/aW8YUnJJWP6bbnE1mgj0+yAw5inKMm8WPITUkZ11y62FDJPid
	 NMT4GNYnMk6Ms9LywQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mvspv-1s4iVO33Fn-00rHBS; Tue, 01
 Oct 2024 21:08:29 +0200
Message-ID: <7966ab38-711a-4c46-b3c8-ac8ce34b2949@web.de>
Date: Tue, 1 Oct 2024 21:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <b9d8fbfc19360bfe60b9cea1cb0f735ab3b4bc26.1727639596.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] wifi: mt76: mt7915: Fix an error handling path in
 mt7915_add_interface()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <b9d8fbfc19360bfe60b9cea1cb0f735ab3b4bc26.1727639596.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kRjPILfqORU/QkD6eWvK+eGlmHGidSKMW4n6WRbwxP2AD2MR8iO
 qpj2u2/8ejEcSS5yVoMaskLs4AQ8RyMALHmxbAuS27m9AUcp26kjlw1YO3GWF5AlDWAwuzh
 HBP9YkpG85If3uMzljPcFs3QrZ4StYsGwjpPaiOmtIu5qcZFMzaoUfbBX9VfnlPkV0uJl+I
 BssmxKUFm2OwBOaJYDZNA==
UI-OutboundReport: notjunk:1;M01:P0:e62IPgDwXCE=;Pum2sJBK9wwiOEgW3Kak8Cmjhv8
 vqTcy8otb+EI4UDJDOOY/jefVnoCxRO7izxHBx11aE9UI1iijpfBEOfyYuYWj6h025vsB6NoU
 NRFitCZpUYNNN+Yj8ViTI3NR4+skseZsyTnij7wkwRADOeAvWmfgGscjmWf8IzGljAvBpBqUw
 fOuVxolq1QQmIYusFll/TGSpcpPhKSy/EuWmYwNjfGYnQvQk8Bhf6KJOLjLB6FHzuBCVlnccG
 gtvd3iL9oyu978Kxy+K070YflRuTeMZqMj2TRKwt7JlrSuRgJSlpHVZkbkc67Cw5tzu2IKs0z
 wFAm0gvarTsDNxGAFhk08GeVrKBa4Hr8505iCl+FL7uN8rUuXS/WbmjPd6/DQFzZTDhs2J+Pw
 iC3TNRTDvy675/abOOa/fuaWDcVZtTU6LyDXWuHM58NzTn4kc2Bx7jzh0i2M7Cf2xK+ws0Uem
 doZSyuCntUuodte6uF/mbYdg8NEROANMGJgAp+jk1xrt4KxXAuOv1S7FXEQyet6cm6aIGVsgq
 dzAat2B3QXOM1oLFcrkrUcBfbr3zUmwDUfbiZhPd2KrI0GCDjHZgiLrn59d1FCVbE5A4/PKOM
 ibxoMLks3vMyEvY4NDSEm89PO+W6pVTwsYpN3PdMiZBfGAJ8iRENflyuViZ2/gCwxjbhUoTvU
 59mouZe62VNf795O6Y8Gs+b6SQDV4Tg3vBetvztXNa9YqAVv8yrM++PUwOJoxEtW6/OihM2jn
 1fvRQQVQbLwRfOLxm8IJkyArE3xyX6roK9tiEVEXoNh3W0NE57xjJwQ1LoSX8ur5tsjH8pzT5
 /HDbJfbtqz0YZzP7Fj+Udmdg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_200844_402485_4357DD1A 
X-CRM114-Status: UNSURE (   7.85  )
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

> If mt76_wcid_alloc() fails, the "mt76.mutex" mutex needs to be released =
as
> done in the other error handling path of mt7915_add_interface().

                                   paths?


=E2=80=A6
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> @@ -246,8 +246,10 @@ static int mt7915_add_interface(struct ieee80211_hw=
 *hw,
>  	phy->omac_mask |=3D BIT_ULL(mvif->mt76.omac_idx);
>
>  	idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, mt7915_wtbl_size(dev));
> -	if (idx < 0)
> -		return -ENOSPC;
> +	if (idx < 0) {
> +		ret =3D -ENOSPC;
> +		goto out;
> +	}
=E2=80=A6

Would you dare to support another jump target for this assignment statemen=
t?

Regards,
Markus

