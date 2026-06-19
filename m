Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7060CD4F26
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2026 08:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=; b=RsTCewICnMbz/NoTYiiE0X1+Mz
	WTZiXSfdyxek2dIwwbCZLxwJKO0gLEWQ6pNTaw6WjbRK1bajXBHoqb5Xe6/+TbugmiGFznODd5SpK
	f1vQ7Mo+5a0A5bSRAiML2hLB5pi/OWFQlXDVD8SV3ALeQfSXrE0H6ag4AEsM57u5xEAtU4zo57r9B
	wCsNGqbLtx3jokNSLy01CKhzbhZXffXQowVHOL7TAZssDkhN2oq7yEuWa6VlXprHLDYHlHZonFljp
	CMdN/zJqhq9ItkL9PO1dQSZ+9jY9Vd2O+AlqnRpQXcSNb80/Qm8ficUCVlnNmrMlA+OjXwm0BT8qI
	rlcuJpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUYY-00000002A5x-2VIZ;
	Fri, 19 Jun 2026 08:26:30 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUYU-00000002A5C-2nOX
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jun 2026 08:26:29 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so1176652a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jun 2026 01:26:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857586; cv=none;
        d=google.com; s=arc-20240605;
        b=Sa5RsjJcUTXpH+u5nYiYgVstRw6AFJ1ZRRltU+FIPv7CkF8giqyzuAMojRgxTUU2Zu
         DC39iiLbwfAY0crONAYVYGdbm5d1kfamSrrn1dXER/DOhqgQVn1mmml3vxdS5/ylikF4
         H/FPdoB9kH+JbIjGjdGDuAM09u5JZUXu1xO+HHhlZbilo1+5k5U+iv6T7pUixrHZ+hpu
         FBHhSVB4OSZ8oCEKHcssRC2a0pqIGJtU9AFmtsisAJb2tnSCfHzcS7Xo9DMYwXDxJNxe
         PeTfBI/KuIlae76zusY8LzHz63uEpNWFrjLDAf8excnxrIwhk1qfqv9NVGxufk1S3GYW
         CgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        fh=jDzjIyN1X7lxxGz4zyoLdJePRin0FaGEuhSI5FRomkk=;
        b=LtdgSxQIzXYt1O0uLrVznFl4Z6ljTYYQTs+bRKpb9wQ/yF7KZHn16W0D+P4/DBm/Jd
         QfeB/PIu7GvQiROVROD3Wby0j7HkI2+dikJZf823A0WVlsIb7OLI/jM7OBPRcqoZWhfU
         LhxlvGLxDGYk7+8RFfw2bqpgguBgpWohXz/dg8LvaLbN30E4qd4LcFgLN5+jV3xHtfGm
         zPLRyJA59jRYkf6iobzSTcZ57cwBMzLbYR4673WzEM+gWoUsM5wdyvpxDKXCZz6pab9w
         ndLdiG2KTKsTDNQ9f7DzuEIGgv5J0HfgGYLj4hQ8/RQAuX1BKFJUVmnc5KzNK4OONT6b
         aqGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857586; x=1782462386; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=QE1ceRddATFlndeHoeSBODOL6K80L9Dd0FvFLawIXLrDBu9yWOqHPpWg64w0i8Y48W
         OPzNHJ9h2SoqbMY2qOmwsxz4wd+JKufzqVf7O+Y5L/JOH7mAdjxAb1BO2FNahan+UX3U
         bx26SHIAIAyLUdJHhVWN/625qdl5LZ4xOILzGxkfHpRPG/k8YiyKOYXQZJwxwJI7eOqR
         EYvVQ1I+2NlICLa2SWT5opZrucCHMZH7dEMZxF1l5FhDWWiOTz+7g371vtNQ8RwcNn8r
         +ARm97hZdZohrucdJKgInjzDuVHmntxE7bqTf9o4ps+Qj8fRMy9fO8rV7X84b5Z24JOf
         wVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857586; x=1782462386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnFgb3/2Jb5tiWkBtABr85eDZSOOJMNFSVQRYJYjzOo=;
        b=QqNLE4f5L+DKg4/lecvGti7mufMuwB8JvHMvmmyn2JTy12nYg7ykVZn/YwZpT38uIf
         8FgDSLIm9+r54h713hhZIzQI+aMdxEOTDddfWF3vP36TkboJip3zBngEU5HaqTDcIu5A
         STQt27wUN1gZXH4anxH/1UreH4YzILnoTrresDr8HFijiwJfVfpRQFuu6U0pECBev+Az
         Ztmb0EQ0JRBRxH6U+2ObMiZE/gc2plPU3BGsgBn46xx3vN+/fAxwWrPy7wbkN2SNpkom
         oDN6eBRbMPyXy4hk40WsudTg7aQk8YEYk0e3v+M96lgB7nvcek5f2pt4NMjfSgTXlk2L
         GnHA==
X-Forwarded-Encrypted: i=1; AFNElJ/74XD7eabxzvKfVJ4pOlkcPx/vKo9nsKhXJSqMQbZf75sOQEiL1PXmm55438Ei2X97j1c+1FEJnOjRzq8K9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAw4RUylDYPLfDzSsVRzPF/Zhr7QD9dPmjqr0WDelzA7o1ufCs
	wg3Fz7f0UgkqGqRL/RYxZcNDo11ySXQVSSWjt4m+M3mhk4nX2KO6secUeDgSzIpIDKhylU6UeQk
	MymhelxYZFeAJJeWlHtVrAqz8Lu+mCnY=
X-Gm-Gg: AfdE7ckcZuqLIw78eNbR5fpyIncJASfcRiwXVhHs3EpjSK+hO0iwFwc+dVmbJFwod2N
	TBeN+JIMTXtG4gQYZQYmnlG3YTIPeUvgZ7cIfzhtwOj98DHz5Nr1u8H4zmlCUxY3D/XJ/fWAUaH
	neR3sE3tDIx6uAqxXGIS0ahjxznlHwkQIqFseYaKmC2l3Wa5V/9XB059LjONpAm3ZidorQvJZuZ
	dfCMPjKGnfJDdi8zKyArHC9V5rBsFw2CSIq6ndzi5BRRl7vQCXJW6u1eG72LQOr2osZTh7qegOA
	/GGNfqSiEeMNw5kRrRHCPRLlMls=
X-Received: by 2002:a17:90b:35c4:b0:36d:cc9b:2f67 with SMTP id
 98e67ed59e1d1-37d1e8d2625mr1979109a91.19.1781857585816; Fri, 19 Jun 2026
 01:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-12-phucduc.bui@gmail.com> <ajNud7QkwF369lBY@google.com>
In-Reply-To: <ajNud7QkwF369lBY@google.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 15:26:14 +0700
X-Gm-Features: AVVi8CddXW5ZNLmY1o-M3ykiX-yfQTjv2vw19gnq_6wH9bwOdl1r4oKcoEQ6Mfw
Message-ID: <CAABR9nGVAiUpnmnoszLiNDC9ooXx8e9YFmMhv5aWLfaik8tjHg@mail.gmail.com>
Subject: Re: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang <cychiang@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Support Opensource <support.opensource@diasemi.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_012627_836051_AE8104B4 
X-CRM114-Status: UNSURE (   6.22  )
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

Hi Tzung-Bi,

> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>


Thanks for reviewing the patch.

Best regards,
Phuc

