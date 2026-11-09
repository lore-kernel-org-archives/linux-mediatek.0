Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC511606A33E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 21:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2pBhD1uX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DNEPzL0/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PUYXlgXOcVHlfHOjoXYqr0W2HQuorszYX6zWp63OOsY=; b=2pBhD1uXWx1hwT
	OTQqxoXBMu49aQLogO20x7KtaVuiELJcffqg/bLi0Jmg+EzHcUKfVPE+6hGbSU/JSodSlwQEb9fx+
	YDtIZqZI5OLdDLVUfRw9rodE3b/hydmQRrRt9MP3g2e11aIybtIThG1V8oEf3QArqXhdd7vDBrsNR
	N2ujXX3keQk55c/QLBoZo5AF5VyO2/OLcLowKGaGPY9Nze6AW55027r9eHnKwWrVopTsko3tYcyqm
	uFfg1htWQc3AwBPtF6YDChMbGrW8J2GaGbWHezOTpPDAQn/7JkEYlIu4Xm1cNymzFwp8lAfrw/Qvx
	PSpPRxe+/pOI1TcBxxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWTn-00000001ib5-2tfu;
	Mon, 09 Nov 2026 21:00:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWTm-00000001iaC-0BjL;
	Mon, 09 Nov 2026 21:00:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C813743BB5;
	Mon,  9 Nov 2026 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E280D1F0089F;
	Mon,  9 Nov 2026 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794258037;
	bh=PUYXlgXOcVHlfHOjoXYqr0W2HQuorszYX6zWp63OOsY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=DNEPzL0/endA1uY3nTdlc/VOe25Cchx/Eo+x2Fdakt62o4aYzwszu1V8DSP5ipyi7
	 Bp68gEBsLEPOcDSJ8W5TCuUgfwCnAmPhzNPR9e8kLGmbVJ4uCZMc+YXJycmhcjiu4d
	 rV39MP4QnnqFf0aKKvKaqwgcAw2UgWVKMXAvkFOdEcfvlujvgzFGtglmjmdg4aWUYc
	 yNKrPgwguvLzgKCmCpakc21C4NDwY9aEG8xX+ld08AQavrDRyassiH1NLpL4NXFhuG
	 bR7TFMoPE3I2Tq2Epp8vAvE3dtvE2yQa43DfhJE/gnNCqd5+4AHtzS8mMCYK43y5ME
	 w1NoqhwzWjanw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E37FC30217EB;
	Mon, 09 Nov 2026 20:59:39 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 06/22] ASoC: ops: Introduce 'soc_set_enum_kctl'
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
In-Reply-To: <20261103-macaudio-v4-6-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-6-637484efe46d@gmail.com>
Date: Mon, 09 Nov 2026 20:59:38 +0000
Message-Id: <179425797819.3711751.131370181090870189.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=764; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LC7c8xgtOqcQVsOq7+PY63O6vUwrZU5EM9lhyhjytO0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+mVgzbI5k6vi5/8Qiw3+fvfdceH8s0DKlsU26kqP1R
 9TfurVcHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE9gQLk4BmMiShwz/E5X4PYODLnEccSu1
 erflBkfh63mxTh/lHXVzuj4tV014xcjw3vh6++Wl962fvXMN6u7ZtG5FTr6CzISeu+2uixd+nbe
 JDQA=
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

> The new function is to be used to set enumerated controls to desired
> values. It is something a machine driver may call in fixup_controls.

The subject has soc_set_enum_kctl() but the code has
snd_soc_set_enum_kctl().

> +/**
> + * snd_soc_set_enum_kctl - Set enumerated control matching a name
> + *
> + * @card: where to look for the controls
> + * @name: name
> + * @value: string value to set the controls to
> + *
> + * Return 0 on success, else error.
> + */


> +	for (i = 0; i < info->count; i++)
> +		evalue->value.enumerated.item[i] = sel;
> +
> +	return kctl->put(kctl, evalue);
> +}

put() returns 1 on change which is not what the kerneldoc says, the code
is the better choice here.

-- 
Mark Brown <broonie@kernel.org>

