Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2231606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zg9rEnSH;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Kxh0oqWT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=; b=zg9rEnSHYES8vjiid05lEJB2vw
	dFJpacJSrJ2mCdp0AUGoXg847kvHFS7hV7OY5rBqYfjyfUG4e4N8VWg6OIE8dtMTzH39WdK7sas3v
	3T5STIkTRZguUzIaILkQaKbdFYHzKmQbS03+1l+2jYX43bFc2OrDJP+SlZqqhyZtE2Yu6CkpGT+v9
	ntGJGoqfkW6n7QMnqbrBq0iED3E90MtVWm/DGca7+RicRzbw7ipzAy1RIyviUCoMpqocrk297ytha
	efyLtaIegTXr4PFYIZDN7mcqIxSYyoou0O/ea4vUR9dwDt6slOqCfSyoxxDYhfdh1ysqKISOldgid
	X4uh01ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQP9-0000000BE1g-44bc;
	Wed, 21 Oct 2026 07:06:31 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQP7-0000000BE0u-13BY
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 07:06:30 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so407306a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 00:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792566387; cv=none;
        d=google.com; s=arc-20260327;
        b=msdQNF2bKpWHz7TWTKxfyH8VIXjBD3ONK0ElIwLttD6B8w8Sm50QqfJDdmIHuI0NAp
         Dbx8M7cY4MXsQIgPFdMXXmM+vL4ib7zbqByMUugCQKddspKebbR++W/H5Y9BdEoT0xuW
         22hs3Zt+bkou3mPLMp/MY+53iwSce851+Lqwxjn3ZqORQJkxn0/Qj29kwyMlTPtwvfRU
         szc6/15gXlssYqjbRQWT8RYJV9KSTeE/bo3KxB+sE45AvUCydIIzs4dyb51mU7wuGohu
         3U21LPjVTD0nMm2CfYxANm0SsXDB3K2HgbI3CaCUL3k1cNfiyCzgO8OF6JTIuLJ7NmLr
         c0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        fh=VVaYIfRboAiCsWevHsjmPy/5AoVSwB2YlIXM9liHBQU=;
        b=q5qT3GioNXQ7V8k2l0CEckrTRx35Pvdo4tWvWxfwje6kYX0D/FaZJyfVeJ3L/cLo0J
         Pd6GPtONyAagXPPTFPwibRDjTiVCFLjXpBFPkFrJaX9fsscRoFpy3tEMzoxVcdKqXfrP
         mRIWUrAsEppWYydaxoALKms3KVpO3WvwXsrnDJLylkSgHKy4e5nKt2rZj3I1tiMFHtiR
         pm0KSNHaOc5n1glxczbVbjUSPnp4DMNS1Jj3LFq68QqMJDZ0Hj0wKp9sJtBayzLn12vN
         HzBuDiul2Rytv00xLRKwNDLZQVS33DIL/Myo9/kh2UzwMbtR97PYI0dtd/560WFPms7m
         xjmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566387; x=1793171187; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=Kxh0oqWTd1VovwSYc7RkHLcvqzCbJXXsO/ELl65jyXvk3sc2NqGQI6alGptRp6PU0E
         nlnOnr5/GKkdXXvrg+jl/VKa4hmg1/LmSk7M/8ZXV69tB5O2rmg8P6txXsq23TolPiWb
         nvUJbBURTsIz/4tqnrW940LvXk1uOva4Sn7gzTeRQKPi1/2SW7qvmaiW/cpxcoYbPpY9
         fWC+bFA0Z02VHODZvDPhDasgvyJYGUbyavVoE7LUNjHOP9f7lQnm4Y9scZ/EZcy8r8Fq
         n4Aj46AtwTtBdAQPo0x4c8e0SDBus8RA6WmOTnyNmvTwpiqzU4KMblFn71X4mCaRxhQM
         B7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566387; x=1793171187;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=lrLaBTXeW8SYNK+Aow3AaAMlBhYht4BNIJh+qu1D8sKxMGb67PIzfUttUUIwhJhY/f
         sAgJDr6bB5zx9qe2jeATYPd4m/smxwIoUhERDjFYE0BE/0l/K8wj44QixMyI+GVL7V7Y
         cVVd7zoUv7953+2EhqGaGOLAsQ31wl4bUJdX8agqDpi/gp3s9lkAVALhscMOVYdobacG
         3+lPAl1Zrm9gJ14jIH8Kel/gfWJy0VmDWL66/ObNwzudiuskHViWxZvouLvhjAMJiYT9
         eXAC0/CbajWufgu7F9ZXdizgRhVp+OPyH12uQTg1mjdl9wdF/lerPFis4cUCx9fAUD2r
         BzvQ==
X-Gm-Message-State: AFq9FYITayS/n5bNFJf5GZpkSVofo5oS0ZylO35rn3GsLZpGixRP6aii
	dMi5a8j7hLZpdg8axZtxZ4C2uO/MDOvK8tAmrHoRKSW7U+BHvmoR/aXVuv9MCRzt26PIu6wY020
	u4riD2Nnn858NbfoTYIKYMWjCz9P1g0k=
X-Gm-Gg: AYBFou2qqDyMOp3M21T/NGO6Di/808+td4z6MRgWtsduXDSbPDDO9qw14TFl88XJ8e5
	+2FwwFVTtTLwdRheyeHXbLHbg2EhiGq0QF9lkcB4tn8SRThoaM5+E70grqyyQXojOBTLgt9/CVQ
	MXR2qYJOLyqwsawvw+ABIgTI6qoOc4X5SY/Hvv6j1n5OzBZtVxjfxeXveiRp+vMvUqa5iFfrydb
	BpV7jS7EeCax4tpWfjw7i3xHJjoQxqLXwhKUuAJD3wQ9unnnWKqdRQbrgONQYMKtPbkqbj6G5MM
	9c2PR9m4k3W8d5j8tfzUGLcx95yRMnuBJM+SpP80BQ+GbCcRDN0qiCOA7pP6fMSE+y/vuaB1PeS
	UyKBPG4HLLUOBxvMtS9zjhPGWu7ozI7QO6dw=
X-Received: by 2002:a05:6402:1585:b0:6b1:cea1:a011 with SMTP id
 4fb4d7f45d1cf-6b40893d0e9mr633902a12.0.1792566386899; Wed, 21 Oct 2026
 00:06:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org> <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
 <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
In-Reply-To: <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 09:06:15 +0200
X-Gm-Features: AclHuK9050nRGHSTN9753pi8bjuF0vHRU3cnUbJida-ygLIdS4pPdAAtcMwmgKA
Message-ID: <CAORyz2KsozjmcDCd+KVfvLokuxs-YAP0E5yJawHECu9pbPQmKA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
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
X-CRM114-CacheID: sfid-20261021_000629_301636_8E2A70BA 
X-CRM114-Status: UNSURE (   9.72  )
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

> The dependency of this patch. This one uses compatibles defined in other
> patch.
>
> Just apply it yourself and run full testing - you will see notice about
> undocumented compatibles.

Thank you, now I get it. I had already removed the example from my
testing branch and removing the example also removed the dependency.
I'll run another round of dt tests to be sure and resubmit without the example.

