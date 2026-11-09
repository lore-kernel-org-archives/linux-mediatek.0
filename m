Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46166606A330
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 21:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rE7C5nil;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iF6GzHcR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W40un1XNAqPtcoImBzGbxmEQEgO2uX7YR4GLBCynYYQ=; b=rE7C5nilgFeno9
	s5sz6Mp/u1Ivs82XqUAsjIxyNyJIsKinB7PWKSIJMoEDiu9wFAjmbyGnYW4+VD5p/YitaUpc3uFhO
	SyKeIXdBVygPYus3TN24FMVtrQsJNDBfjPoUzNNakJ1a4r5pVOHgnYs+Vqb58hcQHwW9ToyPebf2G
	+gAWoaI0iwytU+R4U7Zht/cFPXn99wkEcw/W//6u4ZcxQfRrc97JAWVaSBOu36q8ZPyuCXtqgwD4X
	Jg2CA9U5meZhu7Tydq5etB4FRxbJKwXtWjr3tXOqJj6PjHDTOL8wgqPmaavdHU89Ok3lawC5RsJKy
	7ucx1Qpo8xJoEJqKfLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWUK-00000001iiI-3tIa;
	Mon, 09 Nov 2026 21:01:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWUJ-00000001ihg-2tyZ;
	Mon, 09 Nov 2026 21:01:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EFDC43489;
	Mon,  9 Nov 2026 21:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6991F008A1;
	Mon,  9 Nov 2026 21:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794258071;
	bh=W40un1XNAqPtcoImBzGbxmEQEgO2uX7YR4GLBCynYYQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iF6GzHcRZmIKjnW69pOqsfO3jKAeD20Cdt392q+PS9hRNVpMtyfXiSFvnZi5+nGeO
	 XyA/Ck7Fozg+jjB7td5JXyNuj700k9Nf5A9KGOkWl1F0BUQJe4yLx7pS/4nFpaiRUk
	 x7AWekRNXn5bQCVkUh5iCDNKJmZNu7gjlX0mpe4FRQ5REGfUUaDyp+ieAACA0+Kz0v
	 qePEDEBsL7DZSqucOiLJ9ErFUjCdXfZ6PeK0XGNFr6m96sFeombWoKBtcACxeDunFu
	 Il035pDznLn2FokxjL2V6c2ePy10UMnns3fIUxZYdmcAN08iFQIZzQBqbBMPsXZP2D
	 cMa3/QG9SZXMw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C64CD30217EA;
	Mon, 09 Nov 2026 20:59:39 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 05/22] ASoC: ops: Introduce 'snd_soc_ctl_activate'
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20261103-macaudio-v4-5-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-5-637484efe46d@gmail.com>
Date: Mon, 09 Nov 2026 20:59:38 +0000
Message-Id: <179425797818.3711751.12937263042321950225.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=615; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xvmkDp6UJdRL/ikpcXrp5a9qw8WBoVYhDOKggMTTKA8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+mVhLfZutsGLFm5NREsxh81TmK534tEw69faZh2Xvb
 DPO5p2y6ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBElqcyMnTt/cX6NiT78a4j
 3hLbP96dumXapB9us2+qqLMLVG/+1F7IyPC3cd+ZEyk/joiv7+c6O399yQO2tFe8+ociNE8pHee
 SnsUMAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This function mirrors wraps the sound/core 'snd_ctl_activate_id'
> for ASoC. Machine drivers may call it to lock down kcontrols
> during fixup_controls.

> +int snd_soc_ctl_activate(struct snd_soc_card *card,
> +			 const char *name, int active)
> +{
> +	struct snd_kcontrol *kctl;
> +	int ret = -EINVAL;

> +	kctl = snd_soc_card_get_kcontrol(card, name);
> +
> +	if (kctl) {
> +		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
> +		if (ret < 0)

As Cezary pointed out this return is redundant, we could just exit above
if there's no kctl.

-- 
Mark Brown <broonie@kernel.org>

