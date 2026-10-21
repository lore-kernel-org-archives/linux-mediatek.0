Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D5B606A339
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 06:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M2xXgtTU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FGCcxA8U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=; b=M2xXgtTUkReKAirnE0p9+tJnL4
	DyewJWGwLVUIiCQvH/ql2shB+T7Lstx7ojIZ+/W/igUC1ladwbvseZpexr6cX9Dnm1hFDwIL35DDR
	CjYmMERFXRFPhGqAhCvens+6f7HxkrauaxCQPge9HHJ0ruIqgtomCopvZeZG+OCcmHM2Ecf9Tzliu
	M0r+FykVhABe7j7jMHfJHHZDYsX6RBbga80077JHEaHGgeqe3sT69kX9gdby5WX6p2ZEEajZp/QoX
	7J87BqZfEWGJ7GHUR6RAxu5ifdtXfCE3mcwY5V13f5E1vpKP/lNXuF1QoVRsA6srtfazdWZ3eWasG
	+e7WEtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPvR-0000000BB8R-2PjI;
	Wed, 21 Oct 2026 06:35:49 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPvM-0000000BB7V-2tGz
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 06:35:48 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so381714a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2026 23:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792564542; cv=none;
        d=google.com; s=arc-20260327;
        b=otxdN0GpxmxOe01Kco02AWd8NinfnlaWLQeBlDhGjnwJxZxJPq1vX8m5HH8e4P71eU
         6/1X3g5eENObhSdi64wPXZ18KT7PUg8X1voWpNHP/z5k1+GQCy2+3+7rIpWh62zPcuLo
         7ZcBa586anLjlermc3rQQBbrX79/JBBkyHPtLLHrXGxngN3m+Ig+sEBsoVUAxB/7c0JE
         dhWyq7/n8c8tqxrF/LXEghXFqoSx9EZ+TkidOnujg3rAXNYDlyxJwjOB3eUHFss2PSnd
         sMChZT4uczaSuAmmj40cNvygYtxXMvil3MiAzcKlWwiDTaqhhqLtUAAqfvd/ozsfi7mg
         OVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        fh=ebzSbSvXY5ZL8oSJl6aI0tsrzWyHTatht43KlOdhtXM=;
        b=UKCLVkaUzE9QGKjaOIqi2L8vtiiMtoeRk5Wcfgkd+os02aS5cRYbShtZyWLJe7xjfs
         qBJMSMfdDTH5JZwoJmpwrTc8T6sfyWdLam5LS9IBhajzE0cdF0Tg6Z+U/H1EYyUZ/oco
         AL5EZKS1CzcG3q3ZsL6ZmvVZ7NFImlQyveWic0nYvYBXrzjdqk9FPxO7+iK7hQ4e5ltt
         IHOwdu0iAq9+nwYsbihnTjmtJFVoC1Ha8Gs9YtNlo8AqKp7VLdXw3gIg/UQRmbeh3S9O
         qlEdyc+sTLDzRmnFWqaP+wiH6Ewm2iDhpea2tkDtbrmX26CJC7YGiuHCN8pW9GTjKBp9
         chUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792564542; x=1793169342; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=FGCcxA8UiSXYqOWeh6qBYgSyCxjppjqjrKxLSLGJ2ZUzha85mb3034YgP9OtfMCzXE
         CdPRRUg0BD9bDk66Ph0pW6vfpn0+IFYN1aQtkOPzj9OVzXgAR8ONeYpRgbJYLqmEejbt
         vn5IqHznMFaTFH8jibfJzVP7L+QutFVgYPP9vGQ85Y7nwhus3eJHl0E9qxpSl9cm3n0S
         BVWYF9IcM2lER9lUfJ0HBWLEgnee7ywgaIuGEuA/HGWwhyfgEbaPAaatMRgl71uLLRIz
         5EGP9dDSUgj/13lh7wRJ5xrGv5CN+SSbC0vNg7FzkCfSo2Yqc/dwXhgeSfEWRQ/IfjaZ
         RNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564542; x=1793169342;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CPNgQTs1GPMvKVhw0mIO+CE00wYs1bBtR++qtcMf+Bg=;
        b=QAhosD1esYGyNC/Z9b0mE3yYrDuPi4c4ppo1ow0eZsrHhbEf5wHGrQJHAcKhht3QqK
         Tu24zvVk+vtgKctcAPnIJtyUO5EVrpKrh+4J8y3bAeDSbiHEJ/Ayi2ptiTXKYEVQnmOd
         yDcwt5/m4fxszMUWDu8YDef9PHKUrt9DT5x9cty76oYqMTdvbunnlKvbdRFxPD7ebHz7
         3pED5EABhkxOhQsYU39rZB3gQKqXZ/BWgsISrRy6daJFtQFkUySnUx69UlNyBaihxeog
         ymshdYFqN/NyUjQsJy70WCah5lIdSwb5S69tIXv0M+fnBE4aSTRG7sxECxjPr14olyY1
         STZw==
X-Gm-Message-State: AFq9FYJCv6T6s8bDzyr6fBSs5VWUO6eo0bpmjV/oH2ACZ6YKAA8vZltd
	ZozSZX+LaPBs39CJt7ue+3hT4mtcZlcc0s+CkzfK2OnNdWb5ROP3py0E6IRkrbohVNo8tysiPF8
	iGNU94m/phKzvU3SPH6fa+hnk89rQy50=
X-Gm-Gg: AYBFou2zfOwBtKdqcPwJmWWFel1jqdtYhkMmgcow5GlEd1hoXQB8zhuY5NTdDFKoKdz
	5Q6GCWINdnduyfhZ3u0mYW08FmQYmOWmyUX3yTJ9Od0MWFW5mAugDS9VHODhj29ZZXhXEYYGc75
	q20JBN5ByKIxJ/Nr3bEKi2/8AXyAAn6CcdzJfyOoSRalrDI9EObqLH8S5VbK8WEXjbXNfNIwsXV
	/E+ZEoKlKuxgoaWm+EKdwr9iru5ghSEC58Y1YBAzq8voGZGbjJ84QFKKg3WUWKlyeZgQGYTbSgV
	vILYuo5Eo//AqbeE/YUtOxYTFN21AG1HKh8U+qy94QJCMyWvykXW/EPzVS96tpJeHTZhF1ijJMI
	E7TtGfKruWNtBrxeDpNC5R4sQd2f00Zjtv9dF5j/4X+q1OUZ7Z5Qw5o8M
X-Received: by 2002:a05:6402:2105:b0:6ac:5de8:ab5c with SMTP id
 4fb4d7f45d1cf-6b408ea04f0mr627314a12.10.1792564542175; Tue, 20 Oct 2026
 23:35:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <20261021023245.GA3650393-robh@kernel.org>
In-Reply-To: <20261021023245.GA3650393-robh@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 08:35:30 +0200
X-Gm-Features: AclHuK-lIJk49lXRNa98GE7gi3l_Bk4TgNu432VwdO696lfchFDIYtZnsg1U3Dw
Message-ID: <CAORyz2JS1vf7P2cQkzYse_WheB4xYMmywWi6v2pNbeFSkCO9ZA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_233544_769532_8ACC1056 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Or drop the example. Is this one really different enough from the
> existing example(s)?

I am so sorry, there actually was a previous email by Krzystof
Kozlowski where he already asked me to do that and I thought I had
done it!
I'll send out v11 without the example.

