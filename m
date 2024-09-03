Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C7ACD3429
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 11:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfbNMu4qzEGnRP1FtA/ifbNQtdpnxCg+iWqeb8rLTUM=; b=ERyTiRN2rIDZPIPgVjjDDL3Kry
	O2KNa5DGmFKYv+mZ5QUfSiA7Q4kTGvzhFPRkkgzI713j0x/7vJHFBVE0xm7/atrM5rZLj7by1sZnt
	jt8vHXdRrX3xPl+LWjMeHgSczki3UKishSmkFhqedwIzmD3CbVayhU/p7ceXyqFTDOB0V2+YnsPcX
	AZr3hRAcPCsL7E3TvuBNF1JUzMYlQSr7cu+1rJJ+HA5bjo4jPqiXTWG4Sv6eD5bqKjlPeUuP5nIHl
	iL4NPCbS7DI0U9jCI5SbtFe4RFB2POp6IlQ7NmO6coa9VVlOu+u2t6TrAaJf2YW+WfvnwWx12BsoC
	29KpIqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slRH1-0000000HS1M-2Bj6;
	Tue, 03 Sep 2024 11:00:35 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slQEk-0000000HFjy-3KsJ
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Sep 2024 09:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=kfbNMu4qzEGnRP1FtA/ifbNQtdpnxCg+iWqeb8rLTUM=;
	t=1725357248; x=1726566848; b=ItDndGmc8IDqKx1UHknGsjDykUpjgirhuPfe4VlXBJyhkS5
	Qcnk8GUi98C85cOa1VOnkQdYckPDKLkM1nx3pEVnbopwvPUw5liqQO2HF0jz5Sj1yTGXBC4f00aGr
	9AKBudmzCkbcW9Fk4hfde71wC6qooP8wh/yLWoTzgJW4xMyTtSj/0hYNYKJRrK6huYRo4TV+r5eX5
	EickVLmet3o9re/3Tz6C4ziZRCxmaFh/ej5YHoU7tPQYYZPUag84Z5AjhgIhUeIrmy60cwDl4JPfC
	54ATdbrqoyEP96iuJUuA6AOY9t6PNqowHOkZfNujDfc+0ZBd1ZIOA4URQdaslKpQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1slQEc-00000002BQ8-3nPF;
	Tue, 03 Sep 2024 11:54:03 +0200
Message-ID: <d7d8b63a1c13fb3770a521155b10b964dfa6b74a.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: mac80211: introduce EHT rate support in AQL
 airtime
From: Johannes Berg <johannes@sipsolutions.net>
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>, jonas.gorski@gmail.com, 
	nbd@nbd.name, lorenzo@kernel.org
Cc: deren.wu@mediatek.com, Sean.Wang@mediatek.com, Soul.Huang@mediatek.com, 
 Leon.Yen@mediatek.com, Michael.Lo@mediatek.com, Eric-SY.Chang@mediatek.com,
  km.lin@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com, 
 posh.sun@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, 
 Shayne.Chen@mediatek.com, linux-wireless@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Bo Jiao <Bo.Jiao@mediatek.com>
Date: Tue, 03 Sep 2024 11:54:01 +0200
In-Reply-To: <20240902054428.13273-1-mingyen.hsieh@mediatek.com>
References: <20240902054428.13273-1-mingyen.hsieh@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_025411_139318_62BE473F 
X-CRM114-Status: UNSURE (   8.94  )
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

On Mon, 2024-09-02 at 13:44 +0800, Mingyen Hsieh wrote:
>=20
> +	EHT_GROUP(1, EHT_GI_08, BW_20),
> +	EHT_GROUP(2, EHT_GI_08, BW_20),
> +	EHT_GROUP(3, EHT_GI_08, BW_20),
> +	EHT_GROUP(4, EHT_GI_08, BW_20),
> +	EHT_GROUP(5, EHT_GI_08, BW_20),
> +	EHT_GROUP(6, EHT_GI_08, BW_20),
> +	EHT_GROUP(7, EHT_GI_08, BW_20),
> +	EHT_GROUP(8, EHT_GI_08, BW_20),
> +	EHT_GROUP(9, EHT_GI_08, BW_20),
> +	EHT_GROUP(10, EHT_GI_08, BW_20),
> +	EHT_GROUP(11, EHT_GI_08, BW_20),
> +	EHT_GROUP(12, EHT_GI_08, BW_20),
> +	EHT_GROUP(13, EHT_GI_08, BW_20),
> +	EHT_GROUP(14, EHT_GI_08, BW_20),
> +	EHT_GROUP(15, EHT_GI_08, BW_20),
> +	EHT_GROUP(16, EHT_GI_08, BW_20),

This is really long and repetitive - maybe we can have a macro that does
the 1..16, and gets the other two arguments? Then we only have 16 lines
for the macro, and 16 invocations, rather than 256 new lines ...

> -	if (WARN_ON_ONCE((status->encoding !=3D RX_ENC_HE && streams > 4) ||
> -			 (status->encoding =3D=3D RX_ENC_HE && streams > 8)))
> +	if (WARN_ON_ONCE((status->encoding =3D=3D RX_ENC_EHT && streams > 16) |=
|
> +			 (status->encoding =3D=3D RX_ENC_HE && streams > 8) ||
> +			 (status->encoding < RX_ENC_HE && streams > 4)))

However, you also seem to consistently assume that 16 streams are
possible with EHT ... why?! That's not even supported by the spec, much
less being practical...

Fixing that would already halve the number of lines needed, though it
might still be good to have nested macros.

johannes

