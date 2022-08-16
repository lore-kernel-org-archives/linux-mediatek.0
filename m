Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCDAC2BB41
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 08:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOTvXzbW7+WlBywkRhiLReAqb26tVzFv3kdVusjZcnA=; b=WH4D/85fjESarPi57mvhmiS2NL
	isau5bzf0ki7MfhrG1XeAilNFsfO2RZm4s+52bS8t/p3Pad4SRA9aor3S/y0YhygbnLb0z0aFoP8D
	FV1gyD3TY0hYwCKIqiEWrahIdtRpO0jeq2KWTYTdL9VaLRdfW51akGJEpRLPEC6QncfGcpsSwAmi6
	zEknrWtgT7pxZDqbFU48MMx66Wmmp8FpUm1MlHZWi7koaRxHlfMAuJ4rPOV+JeiKK5YrTAkjX4wXm
	TkiqFhxvj+OU4NgJFa4S+wCy8o19s7HFLDO6DkqfbngKYPV9QW/VE+ctfYULRBfQ53bnwq6IovDpX
	jX3JbvRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrYT-00G0lX-4p; Tue, 16 Aug 2022 08:04:05 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrYL-00G0Ph-EN
	for linux-mediatek@lists.infradead.org; Tue, 16 Aug 2022 08:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=cOTvXzbW7+WlBywkRhiLReAqb26tVzFv3kdVusjZcnA=;
	t=1660637028; x=1661846628; b=hXqc/lVa1uduabaircsH2OTMuJa1/YhTpMSpQboajqqZY3Z
	Qj0ThDYlcBemtxSamNhY9dq89+SWZWUtFsZgwbrDkUGxkJRJ6U4z82zuyrBe2DuhociBnLlhFPonl
	P8865C6LBqnPtTfyQwdTH+BYlolAS8NLByeN230CO6EJWbmLJsKXbss5u02ysX80kBhUiPc1Kqrj3
	iZ9HASW7G7Ke+AE1ddX1SiutK9Nnc8lD1FdEzBogiETOCL4noKyieUggRYZvAZ/qD/rMymD2rFVuw
	jmbpMiE3ox4KUbtkLRLiE9y9CsnL4HM1uVZ2u3BqFJyO9/x111LpADgN3OGV9WSw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oNrXw-009P0n-18;
	Tue, 16 Aug 2022 10:03:32 +0200
Message-ID: <edd45a1e732a0eef1894b9f6eda2d4e3c692359b.camel@sipsolutions.net>
Subject: Re: [PATCH 1/9] wifi: mac80211: allow enabling chanctx until hw
 registration
From: Johannes Berg <johannes@sipsolutions.net>
To: sean.wang@mediatek.com, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com, 
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com, 
 jenhao.yang@mediatek.com, robin.chiu@mediatek.com, Eddie.Chen@mediatek.com,
  ch.yeh@mediatek.com, posh.sun@mediatek.com, ted.huang@mediatek.com, 
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com, 
 jsiuda@google.com, frankgor@google.com, kuabhs@google.com,
 druth@google.com,  abhishekpandit@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org
Date: Tue, 16 Aug 2022 10:03:29 +0200
In-Reply-To: <473fc7b169f288b7815a7736cf33ac0ec1599a09.1660606893.git.objelf@gmail.com>
References: <cover.1660606893.git.objelf@gmail.com>
	 <473fc7b169f288b7815a7736cf33ac0ec1599a09.1660606893.git.objelf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_010400_145564_E1E754C2 
X-CRM114-Status: GOOD (  15.81  )
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

On Tue, 2022-08-16 at 08:03 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
>=20
> MT7921 device can be supported with the channel context depending on
> the newer firmware so that we need a way to enable the chanctx related
> methods until hw is being registered.
>=20
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  net/mac80211/main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/net/mac80211/main.c b/net/mac80211/main.c
> index 5b1c47ed0cc0..98d05ed1a081 100644
> --- a/net/mac80211/main.c
> +++ b/net/mac80211/main.c
> @@ -1011,6 +1011,14 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
>  		return -EINVAL;
>  #endif
> =20
> +	/* check all or no channel context operations exist */
> +	i =3D !!local->ops->add_chanctx + !!local->ops->remove_chanctx +
> +	    !!local->ops->change_chanctx + !!local->ops->assign_vif_chanctx +
> +	    !!local->ops->unassign_vif_chanctx;
> +	if (WARN_ON(i !=3D 0 && i !=3D 5))
> +		return -EINVAL;
> +	local->use_chanctx =3D i =3D=3D 5;
> +

Not sure I understand this - this just *adds* code, based on the
description I would've expected you to *move* code?

In any case, I'm not sure I see how this makes sense - ops is supposed
to be const, and you're supposed to pass it to alloc_hw already, so how
would it change?!

Also, conceptually, I'm not sure why it's needed to alloc_hw before
loading firmware, we also have a lot of things depend on the firmware
capabilities in iwlwifi/mvm, and so we alloc/register HW after loading
firmware.

johannes


