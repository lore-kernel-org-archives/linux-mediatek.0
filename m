Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2F3606A319
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2026 08:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pMt8aRw/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Sppg9SQN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQwxJWuJwVDn4Eefp3xWv+hEEpnKtDrA92KX9RcEi7U=; b=pMt8aRw//49NoyVLcUhTXMReCf
	7WFKF9ULZWKSLYOUkDQN/roH1MGbrXJBAUu7RZkAyVyh7DyL4vo178TKJY0fYbwDG1R6vb366jgqc
	GE4RpkcxvJGSvAvDCsEgus9m9EvaAW5cKzubawQxAYm9e1v6IMIsoVJjdPVjSlTfnVdyjHCDVDg4X
	Ork/1v4tJi9xlEQT3c95UyFvpRvMzbLO+YZ3f6dhV9iXNEMe9hrbi8//m6j53GP4FFCrvUp7BMfXt
	sjKZg8uSlyTNBRPiD6VcNLR83jIZlS06vUHfafh/CXfogA0kn8U4ftK5fKuJC/DdeQDHwz3HHwpeh
	pvlRJ5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRgT-0000000BLiT-1fbn;
	Wed, 21 Oct 2026 08:28:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRgQ-0000000BLhS-2DpM
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Oct 2026 08:28:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso267007f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2026 01:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571304; x=1793176104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KQwxJWuJwVDn4Eefp3xWv+hEEpnKtDrA92KX9RcEi7U=;
        b=Sppg9SQNtmh0DiFEvcz1NTHkIaQKmtH+pkdGwG/rjKRuGpS8n3qgZ/R7Nzn5iy298K
         fBvp15OIEXi0xGlVpzgHvNvzJ2of7bOdAcBoWf/Bpky3s/RdYvTyeumUAlNH8objndIg
         RHLJz3VT4QeBmIYIEW6n0bpTckgFBz4+p61n5P2tsh2u06Mw522TiEzREweb0uza+wl/
         dK8Gag8XfiFm52CpkTUL/oToTE8A5S9QZpxHo/XtWtdl63zuEcnsiISfdcRCy8j8U0OV
         +T2KNOuAy96mwpm7bH+amt5bD+1GfMbXP4zU1z//ArRCKG3ro5HqC1Y/RMhz9Qawc1AE
         jXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571304; x=1793176104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KQwxJWuJwVDn4Eefp3xWv+hEEpnKtDrA92KX9RcEi7U=;
        b=Gwhlhdzkg8meRQA7/CH92PpZfcTut96vMyIspypSYyflNLhSdtEdubj0V/n7/6llyl
         eCSfGDRBQGwQ1szoi6L/MVMRXnrHPJnKF3irDZgSFolIeSbqZCgT5wLruyu8ZNL9HxCT
         MVq8RUQKBqY6Pkm22YpCCu4L0aRtO5A2lms2xbj1i0UaR0cX7AOx8UjiEMomBB7KmkfK
         70C67VEu92vEmKhmKOA5Rkwus/BSt4U25+7nq8HGP67J7q3Wpj1FNkf2Hhe1CHskaN7E
         3vJqLVFiKPnnbGkCRFD6E9IflEdU813IG9IGDa/dT1wu6IMc3QjjdB1SBB8WyUelGo1x
         gOzw==
X-Forwarded-Encrypted: i=1; AKwUvBwP0UoPS7fO4QpMMwykw3NgYlq3xke1+rO6+3lWFZh4V5gBBkeorrG3MJifMmvtTrb/uymM2omjxFWB+Wh+uQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJSsaGK5T80Ooe7ap+fqNZWlGyWp3lMqJboRMOmuHpb94DSDdRg
	be5YJo0oDTl3+Tw/FFN9XaUy2toW7Tg/vr1x3I0xvQ3hTEwlfI0e7Smm
X-Gm-Gg: AYBFou3ZNR02cZBPnbjFTz7o7gH2dlEpKV5J/13BQNzjdAv5ut9SIXBw3o7duBgyefX
	qHogwR1vM/R7baivW67U4Joiirmj3h2fGMWJmeGUyPrmVuBEhZIunUsEQZt9M7xytVfqFP3Djj/
	zD2I+9PeIiihKJyIfnHeq/xtwLteZZdQoxF4x/g+qCrk0SOIHJI0vU8VrpPfHIKdMJ6PfYJJEXJ
	IgGiYcm9OtrcJcrQANI5q8Bmym6z6vfzELoE1IOdptKwUsIOajUxQcW9MytVoMnAjtlkN3qgSSi
	jQM2LdSZnKESSaidoD+5dzUvRCpEAaP/7m2r6DGdIcWgl4BKaFr841580PCadiTd66bXpoQsRJP
	hhUBsQpbDl8rzIP6l5OJ3gPOiliX8/Z10xBU/F/R/K2svq55D7sVDWJBxVeHIutNZsZdrUTrw6B
	IFl1bwgvJ9GX096iXGAYZbBXod4X18Y+vwuwzuWnRxzb8Styqo3/cP7D49kXOLKCSm/1jxGmct8
	PZU2cdmfc6NP7tvrYC4AXMMJ+8aBaBObcSkcpwRzDd3d260IFFYLQymmUFgShW9IB9hD8VKfE1W
	Xwxdxh4asFwzPCkajn4LUqjp5g+ZaDSQMv+iIyWriprhJLuRTSDGbA6f905n6LW8FBGr3gtd7IW
	7IFHrKSNMU/P5iQAcuJgH5KkXmW83Y/hKCTeKdcmQYMr34L504Xo8ZHbcHI1mnRu1JI/GkpMKTw
	b2yugmI3z8gB3K4eoKvHf+FI5tRg==
X-Received: by 2002:a05:6000:230b:b0:48d:ee59:3a30 with SMTP id ffacd0b85a97d-48e264b6937mr2199313f8f.22.1792571304121;
        Wed, 21 Oct 2026 01:28:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-cc3c-7cf0-3932-52d3.ipv6.o2.cz. [2a00:1028:8388:a84e:cc3c:7cf0:3932:52d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581efd9sm3913928f8f.18.2026.10.21.01.28.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 01:28:23 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: mt7925: status LED of USB adapters and linux-firmware
Date: Wed, 21 Oct 2026 10:28:22 +0200
Message-ID: <20261021082822.65978-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261012125310.13917-1-pepe.schlehofer@gmail.com>
References: <20261012125310.13917-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_012826_571140_B90290EF 
X-CRM114-Status: UNSURE (   8.93  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

A short follow-up. The new MT7925 firmware in linux-firmware
(20261016233029, added on 2026-10-19) still accepts UNI command 0x2a
but does not change GPIO 8. With the same driver code, the firmware
from the Windows driver package switches the LED on and off.

JB Tsai, since you maintain the MT7925 firmware in linux-firmware,
could you check whether the LED GPIO control can be enabled in the
CE_2249_CCN16 build, or forward this to the right person?

If the firmware cannot be changed, is there a supported way to drive
this GPIO from the host, similar to the LED registers on mt7915?

Thanks,
Josef

