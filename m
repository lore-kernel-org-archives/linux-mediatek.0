Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F217FCD5BD0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 13:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WE1uFjLQahicP6Pul0+3gr6Dj3sANOaIDcF9iPOsssE=; b=3OirqGIgMXFd9z
	OlEIXn7szcyCMkiI56dA+n11DSfY2arGmCR+73QFz75dNmCXQ3i14VYJBk2I2vPyUtjJNepqqvA9W
	sY78Op7oMechYAsQQGkuNPpHopmNqfUnXCUR2lNJIPBZTniRZSIj6cltiBFxOzODchv8CQT9v5lWm
	18RmMEjIjuAr/fQInWwADpi2sZ5DGV03lCEBuCI77SJKF5ghyEZ8n1S534i+mbzbeTL0dkQrGV/Bb
	yJkEsIJEAc8Hy202gcxqOx+wadjhh8YoSVvElbgVqu9H8pNAO2kX5x9STPIbTYI+QnKlqg3Xptar/
	k8i1D83nTWFiV+PUFiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEm3-00000004FQi-01PF;
	Wed, 27 May 2026 13:58:19 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSEm0-00000004FPI-0eQp
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 13:58:17 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-134fe980658so13406777c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 06:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779890295; x=1780495095; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WE1uFjLQahicP6Pul0+3gr6Dj3sANOaIDcF9iPOsssE=;
        b=c4eEnAV0HaoYV1N0WUgnNOo+dfkAJfK6eb4+pIsfKpFd0MbMkni1SyJcBoANnCL9Ra
         ZoRc4toGgkBKfYYdEcqj/8n2qZSk4rItBne/JYVyghWJ52/LUnJnXzI0UobqZ1TE2uwf
         YY7b4p5QiTsRHDQmW75EQXxVgLvvpO7mW5xhz3uEOZHRlk8sWsibGHT2mY3AX9CahjQW
         ixzSHT3jXLxV7tU5dWe1b3Tv0G+3kRi82GtTZhtpP5n2qTx2v9/BjfZXo6FgBbX5esOa
         eOGkQzs94lLdes+rg9k/9FBRJIcotQoZyo9hAT5tZ4xxFeay16dHq2RBgIlJObf+6Lyp
         BlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890295; x=1780495095;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE1uFjLQahicP6Pul0+3gr6Dj3sANOaIDcF9iPOsssE=;
        b=VZpIk7ASixitmoIJkr+GI4/rZZxruMFX696fGVqa/VQklDBnvbkJEIOrHxhYKYYNM6
         2BtLvq1yUXZw2SZpL3WRnNe9ydTOI0Dez59cMVe3ZbeaCgyUITODXymfpVlQb4dz5NH9
         4KGU90J0Xy2AJpUBt/TcvJfYiqw8TgrK/lRGuvXoydonbxwGFKcrYgZleinan3KL4M4+
         pIyNknce9VSYi/aRtLTIRbGFMt9XOmCtut53+ybiyE32hz3q7ZHxNvwr7QOs1Yp1y2xK
         la6nVxA5motV3MgjIFLZGMs0IRLwprCnrZKGXExqhfwdouPI9pOZCzkMF7OeDnOexSqG
         6fSg==
X-Forwarded-Encrypted: i=1; AFNElJ/9X0rZeJDydpwvVDVDPekopKwovHOEpwfZk83Qmw0UPDGs3fBZxN+iHLHvD3tw5YaG9zu32IftieYV2CF3sw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdDERQlcGpYUaGuf+qhFBm7VbXf8uIFacat/8KQZtnYiSOBewu
	tBQfnQtSQim6RE41dKleEf6u1gL50jfA3j6jydQy9EcsETzvjOpVqzx6
X-Gm-Gg: Acq92OEgwLTp2BJM7Ey3SdoB3UtfRK5kU1u+/cy++tvZ0LG3tLCJxDDOOW7dGil4Nd7
	gq6aDJ0VgaBRhbYuSMwjdRIZKyw/Ztc07sXTSk9Hfxm4UVJ2Ap7or2pRAX4p5BZZ0XD9xAwkFPk
	NiOdGAKjZ6dlSURWlE6jcn+hfvUyVAkyN5mPSB/vu5amqMqxp6xLjDD3PtgDDMU3M62L0XHg+MZ
	1uYBShYXqh7tUovzYMFtqu3zbcQ2/bsh0BgKU+difLMgddViKG12a+TuOqGbh29R7PmRP5PSHT3
	2+KNPvAR1+Uko0zl/0A4VUi9XkFDK4Z6uQ9rWASO4b3XwnCp34bzewgCCjdeYRSJUTnvMguTP97
	+Ek1CpAJ+RbV4PsCcyBrRvpfNqidTNgIQsc93frHumOd20Rlj9v5EUfh/IsH+LVeR+70Ykl4gvb
	NKpb1QCwV5C/zSLfezZBejQzOHBSsGoR6gJKU0xWsfwskBqJ2d1qDu4FvsMLz94eckzQNTJa1w+
	1Iu5aoPwpWO
X-Received: by 2002:a05:7022:20f:b0:137:546:9e9d with SMTP id a92af1059eb24-1370546a30dmr3647362c88.23.1779890295149;
        Wed, 27 May 2026 06:58:15 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba2b9asm13013788c88.15.2026.05.27.06.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:14 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ASoC: mediatek: mt8192 probe cleanup
Date: Wed, 27 May 2026 10:55:45 -0300
Message-Id: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTsJTMOPXsWwKGWKY7RtOmBMC
 He36vJbvLeDchZWuFQ7ZH6JSgwFzakCd7NhYZS5GKimrm6pQ6vR4XMdmjNhynFidA+2YUto2Pf
 kzcBmbqH0KbOX9+99Hf/WbbqzW79DOI4Pzadfxn0AAAA=
X-Change-ID: 20260526-asoc-mt8192-probe-cleanup-3ef72f38e3d5
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=6N+ANPMgefHybKMAFexpaMVcK8mi6ROi1nROc0wifqk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliP4q4WNfnRvVybPEVCw8X7y6/cUaq+uTreaterYh6p
 6a/5mhJRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzk7WaG/ykizCedV/beSnb3
 Pr8iTL/pXimr0hT9p+eyjzK2chScPsDIcDEr+pIXS5BX9/a5PybZy4tPNFgQbPfKsvfgxMYa9WQ
 LVgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_065816_195125_333DEA11 
X-CRM114-Status: UNSURE (   7.35  )
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

Fix two MT8192 AFE probe cleanup issues that mirror the recently fixed
MT8189 and MT8196 paths.

The first patch registers a devm cleanup action for a successful
reserved-memory assignment so later probe failures and driver unbind
release it.

The second patch checks the temporary runtime resume used while
reinitializing the regmap cache and makes the regcache failure path drop
the PM reference and clear pm_runtime_bypass_reg_ctl.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ASoC: mediatek: mt8192: Release reserved memory on cleanup
      ASoC: mediatek: mt8192: Check runtime resume during probe

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)
---
base-commit: 93f1bbc69dbcbb29544769c4d6f3456749ad9013
change-id: 20260526-asoc-mt8192-probe-cleanup-3ef72f38e3d5

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


