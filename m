Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3271F606A324
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 04:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t331AJxj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VYPUI7jP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=; b=t331AJxjeyog6XkWljaR1+ykbs
	/tjIvsgGTNySaKF5A55zx3rsbeLZuV02GOqDcbECayyeU1SQXUZSwpkQFM2UeI2r4T4ML0xLVmROr
	WG2ism7Gijrztmmv7ymj0KqMbL0pjm0IYjsSSCK+HLT6x+lMTzWKQjv8Hu1uNBpkorH4CZCUplzCo
	6lWV/ceWc/XlqlCn4c4PqRtNohEab5O/QjA8QaDEuKcMq6fBUM4DY9Qe/T+/bMxIVfbqoyKU5Q5eJ
	N191o0/J59xtCW7CivATAXgJi6SbwG0yojwXIiDfb8tCR0DZqBRblxCD2+gakzoy1n2VVH0BoLSTD
	ppwbXqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjHa-0000000FUjf-3ANZ;
	Mon, 02 Nov 2026 04:04:30 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjHX-0000000FUit-0cYh
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Nov 2026 04:04:28 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-15943c9c005so148286c88.1
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2026 20:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592266; x=1794197066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=;
        b=VYPUI7jPtj24G9FEJdy/8vb9pQY9K1kcpaC7A4NYDobA8NJuvyY5ABCPPIxwSrg0cD
         NcJfTaIAq4o+lExwgH9TPygYxw9Bn+mXdx0rDqyFA/Aw0+B9lX0QmPJtxv/eUPOmCg5v
         LzpnscIeaYmC3v5IAdyEVcUbNeFMnvOkfvxHbu40em05xjDPgCB7KRegKgumuNr5uTxU
         j9VUsrNACT9dgO6qjbNSOBT0gJD5J4o0Tn7GnSt0vvcwWxiuvZoXdYWJWfnW4vJLbTOz
         3UL2mlxyqz/JYy0hgHwlGocOjlOVfJZJkLLwreLEFucarZDT2Y6Qk4hcA5GQfnqa7KVA
         0c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592266; x=1794197066;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=;
        b=YlkzkrGYmHumuRIbEkgFVvCQK0aj5uBXfGU4Kofzz8qSET1NFfUXDWeqXKyj5w9Ody
         noL/rp3OgTiZVF0tX2qRLpC85kDob2v5NNSKPVj8A1QdnwPKMcBD2FCl0N3ihwwSGd++
         M3pq8/iPocM79RyqoOfv6hWBPV2FZR+QL5+pQoaOcYIdhhvODInrBjjRJiRf/hK/SP/O
         Zez7615C8QCFO+WyjlDGzW5/s/mQLTZeyG0iCGTYu32rqjCutIc++3kUuWikaGLFh8ta
         DaWe2zu5QTMGYAGjw1cgRvIcJk8dqxHzaR2HJWAYyX1ThbQf497j8LDRGkGtyXImDM/a
         Kupw==
X-Forwarded-Encrypted: i=1; AKwUvBzQcs8V5z3IMHkOMD4x1ZQfXM76r1olPQw1FAO0UR8bE3oKriatoST2RAmGeO7eF+/5kkAkeG5CdEs5gNl/Ow==@lists.infradead.org
X-Gm-Message-State: AFq9FYIpEn8jDBpxGVV1/gy7xQII53AXvrBg6m1aqup/f1n02ixaxHF5
	S6kA1SsZaXKg4R2jzvHyrItx4xC0guaetLJiZgtZM/M5iAOHFUfoZZW9
X-Gm-Gg: AYBFou0uTfHZOBxcQKa1XyKzxIvj76391gq0qFri9eF83jPBkAzGnUB1SGn9vI5NhW2
	fpZ/HBN4zNxd//jFjlguifkTTbQZ1g2EnN9YZt2VygQNwTusFfnL1igNheMojuVRDbjx8g2ILIS
	Mr/5+YICuWFt4Gtut/K5GXIma24kxmuYDzffCCKw91Y7g7wKwQ3ExoiXwRxBl/TR4QECNF2lSew
	ttRbNmSqA3HyB/1CIf2NKE5cP/mD1MeeJlrGR0RsDQVdD54Pav5acxEbJoF3RuUeOqjOaE0ObcS
	xWou4jySbUTMYoMNt+z+KU3/qfRFNlfF0/1nbiPg7klTfQNzFzpxaG+6fo7PZNA9zzB9MzczMkJ
	yXjXZg9UyEDoQ6H+0pfpTfGFRU+D2NmJxvQB9Cf2NLClJismH6bSlc5e/KrizmCfV3wxhVLtoTV
	yJxQEf4lYSLJAz/MJWhNJqLydwbV0ZNutKgEvjIk21JMnH5evehLDEMxI4ci9zMYZkAu4rx6U8F
	WNAG6Q2Yhybp7x5sz2WF5OcQ316VCvMIGk2xQIjhLvxorhv+ULhScYAYNW5m/RAWRIv9s4qjX+7
	pN7CsaAYcXzBoOzk6Q+mYfYuMbId8V4xDXb1bd+CWsyUvM/sRYzZLTU50TUv7Y9HztviRnY=
X-Received: by 2002:a05:7022:b043:20b0:19c:dd9b:d09e with SMTP id a92af1059eb24-1ac5cdf9b17mr14479268c88.23.1793592266054;
        Sun, 01 Nov 2026 20:04:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d75c:a9d8:6c00:c5c6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm29283682c88.5.2026.11.01.20.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:04:25 -0800 (PST)
Date: Sun, 1 Nov 2026 20:04:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
Message-ID: <augLnMBF7Mbw9_sL@google.com>
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
 <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_200427_193762_6C4486F9 
X-CRM114-Status: GOOD (  11.39  )
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

Hi Ryan,

On Sun, Nov 01, 2026 at 09:24:58PM -0600, Ryan Brue wrote:
> Hi Dmitry,
> 
> Gentle ping on this one. It has an ack from Rob and reviews from Mattijr and
> AngeloGioacchino. The device tree for the Amazon Fire HD 10 (2017) that I'm
> posting for 7.5 uses it for the volume keys. The patch should apply to
> input/next with a three-way merge. I can resend it rebased if that's easier.

Applied, sorry for the delay.

-- 
Dmitry

