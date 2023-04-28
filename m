Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB22C77B7E
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cndfm1961jpMjk7aeGQFFrUAS2/uIG05OKh7Dqm+2AQ=; b=ACYmiQH0uimfLQVQlIzJ3lTEZK
	2QkxPnTQ7ovZvvL0rgFJgJuyYBxNhyJ54dW/UyPgQLtL7CGDdrUrRGGMG27j24sNOKSEFYf+5B3pY
	tW1r5nPV3SGKdGLVnz6bFYAcuw4ZyeVWOT9bp8n5z1PPoVj5Vtct6e2Ntj66Tunj+gr18AIBM5ZvA
	hIyTI0IPfzAGWFq6CbQYnHZjC5L9vcaWrOTb1BgJ4YakecxaZ+4YFIOJlzwcGMtE5GRM93CC2ctGe
	VWKKH8YgUaGH0tmSo5uU9bEHNh6ZY8r8f9/CmSk+r1ZSwfaYEI1IskQP2ksSZrN/KswCiG0h6AgKc
	N+ADufJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psJuN-008ax2-2o;
	Fri, 28 Apr 2023 08:56:52 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psJuK-008ava-13
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Apr 2023 08:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Cndfm1961jpMjk7aeGQFFrUAS2/uIG05OKh7Dqm+2AQ=;
	t=1682672196; x=1683881796; b=Vj9FhNFdeA78pimTgrqj//NNh91KwaBJNZuXXVrOZe5UxrR
	sqrpu6XAAPqcuObtQ5QsSkdAypyUMwMCWkcW2xJKFiQK7jlbILpUgUw2owhX4wHNAr8URN/1BoDAb
	PlC0dNWJ86skyX3MCtdxmbeneq6m2+hPs8yu3gM1/0a6wK0yi4SGIn2qhL4ADnVAOzKcePoMbZzlm
	gq7iUy3rWhGwPygPf5/n/C56dbgP855C+EtJnKJPTsAVixrBWZZDl1NqrxZfUXKmX7lCXJHjNZWzp
	iuq645iZtQnjKhivtFhdRjhAL3g+4VQv1jKLgtZQwcKKNmPYLLrzx+e13/d/ksxg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1psJts-00B7C3-1g;
	Fri, 28 Apr 2023 10:56:20 +0200
Message-ID: <966af4d19dff44aafe48505880f55366ce521e8c.camel@sipsolutions.net>
Subject: Re: [PATCH 1/2] wifi: mt76: mt7996: fix endianness of
 MT_TXD6_TX_RATE
From: Johannes Berg <johannes@sipsolutions.net>
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>, 
	linux-wireless@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, 
	linux-mediatek@lists.infradead.org
Date: Fri, 28 Apr 2023 10:56:19 +0200
In-Reply-To: <16fa938373e3b145cb07a2c98d2428fea2abadba.1682285873.git.ryder.lee@mediatek.com>
References: 	<16fa938373e3b145cb07a2c98d2428fea2abadba.1682285873.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_015649_060280_C423858F 
X-CRM114-Status: GOOD (  13.15  )
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

On Mon, 2023-04-24 at 05:39 +0800, Ryder Lee wrote:
> To avoid sparse warning:
> sparse: warning: invalid assignment: |=3D
> sparse:    left side has type restricted __le32
> sparse:    right side has type unsigned lon
>=20
> Fixes: 15ee62e73705 ("wifi: mt76: mt7996: enable BSS_CHANGED_BASIC_RATES =
support")
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7996/mac.c
> index 130eb7b4fd91..39a4a73ef8e6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
> @@ -1088,7 +1088,7 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, =
__le32 *txwi,
>  		else if (beacon && mvif->beacon_rates_idx)
>  			idx =3D mvif->beacon_rates_idx;
> =20
> -		txwi[6] |=3D FIELD_PREP(MT_TXD6_TX_RATE, idx);
> +		txwi[6] |=3D cpu_to_le32(FIELD_PREP(MT_TXD6_TX_RATE, idx));

Btw, and no need to change anything as far as I'm concerned, but just in
case you weren't familiar with it; that kind of thing might be nicer as
le32_encode_bits(), i.e.

	txwi[6] |=3D le32_encode_bits(idx, MT_TXD6_TX_RATE);

Personally, I also generally prefer the typed lower-case versions over
FIELD_GET/PREP etc. but YMMV.

johannes

