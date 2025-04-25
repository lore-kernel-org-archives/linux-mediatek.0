Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34689C369C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Apr 2025 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MsSm/oC6fggdpvVcy29aPeLr5GjoL3t6EBPNylpw94=; b=f2sOo1ReQd9i/mgWRdlq0mrS/F
	iO2jHGZ2sah6KHCUzwcwQs4hU4n6bsT1W1wEKLtVw0UBNLGgkxBimUpRj4Dm9VVDiKAVEVQhTDPOz
	plu5LGveSunPNddTaiBMofeWBKEDIYQxAF0mu07EKGhD44S1s0vcceH9LYklxcQN7WwqGa+cxBqms
	5X5rTWOXKR88nAw6UYVUE2K+Nw0VQMmtMJQb+Ech6dPuScGP0BkPvUdli+gZfivHqmRPk5RbPAUuT
	SAjfV8gTQtaDXpcf3ZIeiz3gCBjAbyEj0Vi7vRU30tapHN2NQoCdndcyU28z6fl3Z8UO4yny5jxJc
	9esMdOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P6A-00000000j48-0W3Y;
	Fri, 25 Apr 2025 19:52:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8P1t-00000000i4X-2DNZ
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Apr 2025 19:48:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso1714919f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Apr 2025 12:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745610487; x=1746215287; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9MsSm/oC6fggdpvVcy29aPeLr5GjoL3t6EBPNylpw94=;
        b=dceKLTyYsPyxuwoKJszJgasTKuqMtCPEL171pAx++vAlvYooaGgrs47ojBKoXMmLm9
         TSSAqMmXglbCzwpoj6FdFk3tleuI72GFKVfLx07jpQ7UfB+8YUgP7zEOO63Bn3zrjZXT
         1732YdYdq/uwjRAaHaavXJs4oj/+W1BAQSuad/VltYABP/i7fBgL7cL0bYO15cw5Eda/
         dwotIMNgR5jQpf/ctR5nhNh0GsSxeh+A5udiiAWgpl99Kp7nGvpyxk2P3C2nInUamaX3
         jyWJIm3U8frWxNsGVMgSf2lfcT0UddfEm0Y/JQZmtnYev2kMDZqY4HcGH1NpN4umkKXL
         vCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610487; x=1746215287;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9MsSm/oC6fggdpvVcy29aPeLr5GjoL3t6EBPNylpw94=;
        b=osMSpdew5QdQ4q3tomscnVmw6EUxulOjtZ7MxWXkofccAKoA2QYuv6RWoYNkBjIxfF
         EBy3qBf8FZEFNQX7RXDjRTxkkZSyxDhuX+ISV5RDhEgjonuqTXgaKodUgvx5eYMcrN5T
         9JhsA78SwDKtKpB83wfJfK+2TQlt9FlYzMFwnqH1pl+3R9zBeyv7cUViIQBCxlKB+BSU
         Su9+a7/DkP06A9ey2zJ7E06GH/HlEFXFKIUY/Kl1tABqIIXvjId/6d+QBKMqa1E7KQcs
         VdSyWKAS7jFY/tsCkCPUKg6SIhc+UZZK1d90FNpEKUXSp58/EDT+iLR1f4DAw9MsFDki
         x6yA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Tjop/cyxifapnmGLRXLhvY3evm+y9XAPElCcex8avPkAY7ONgFnoc0s9IXdMdgvxuqa7dbyqNwvXDYzOkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YypkCYXVc8T0dbJHTSKUjZE0MR244cptVV85eHqS//3SgBGw+q5
	ihE+VJB8k8XNWh7b8A3zmZV2FymH+VMfC1MDYqPDAbD/vyFOx1/aMbcaz7w8Zhc=
X-Gm-Gg: ASbGncsZFCc4LZugBbKyDN/xFG1c4GNvIkAcKqGz3LuHQR5LHs5mJaiiOQEweHa0vY4
	+xGHUcFFpRG+HJsptNFJjIcD1lvEKIJyA8uXnhpJ+kHvWSfKEp3PB2XvyMY3JMicuZotN3iXoX7
	nvIrYzp+xrBya6VGWzT9SBwekRGKFifyx5NfrBRzeiEy3oBEvJgyOH4RePaRqRM5hvHXe1VggLm
	aWlqNR4w80uP7DskX4qt1j/nWXELFIydqAbQLCmB45rkEKdYRxzA9O2wXDqHsef1Gy9mKuTG1yo
	uwApyETYhL5Uz8oDDq0ZKzz3t5qGo58APjaRqHqE0F0zIvhvAQGwheaXruJ8+WU61O/xASRlLsJ
	ZdF0Nc/vhTSnHy6L5og806luWto/wuGJU0umM9C1qAJg+UJ52GTiCQNsYtbbTOFM=
X-Google-Smtp-Source: AGHT+IHfsn5wCKhwTa0J8zfuwB8lcJPWgRUEQdZlhyrj1mUqnBM8NKHg90Ct03YfbCjHwLs/15BqRw==
X-Received: by 2002:adf:e5c3:0:b0:39a:c467:a095 with SMTP id ffacd0b85a97d-3a07aa7545emr335807f8f.24.1745610486979;
        Fri, 25 Apr 2025 12:48:06 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8154sm66076505e9.30.2025.04.25.12.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:48:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 21:48:04 +0200
Message-Id: <D9FZ9U3AEXW4.1I12FX3YQ3JPW@fairphone.com>
To: "Ziqi Chen" <quic_ziqichen@quicinc.com>, <quic_cang@quicinc.com>,
 <bvanassche@acm.org>, <mani@kernel.org>, <beanhuo@micron.com>,
 <avri.altman@wdc.com>, <junwoo80.lee@samsung.com>,
 <martin.petersen@oracle.com>, <quic_nguyenb@quicinc.com>,
 <quic_nitirawa@quicinc.com>, <peter.wang@mediatek.com>,
 <quic_rampraka@quicinc.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "open list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 0/8] Support Multi-frequency scale for UFS
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
In-Reply-To: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_124809_560857_9842D64B 
X-CRM114-Status: UNSURE (   9.73  )
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

Hi Ziqi,

On Thu Feb 13, 2025 at 9:00 AM CET, Ziqi Chen wrote:
> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequenci=
es
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.

I believe this series is causing issues on SM6350:

[    0.859449] ufshcd-qcom 1d84000.ufshc: ufs_qcom_freq_to_gear_speed: Unsu=
pported clock freq : 200000000
[    0.886668] ufshcd-qcom 1d84000.ufshc: UNIPRO clk freq 200 MHz not suppo=
rted
[    0.903791] devfreq 1d84000.ufshc: dvfs failed with (-22) error

That's with this patch, I actually haven't tried without on v6.15-rc3
https://lore.kernel.org/all/20250314-sm6350-ufs-things-v1-2-3600362cc52c@fa=
irphone.com/

I believe the issue appears because core clk and unipro clk rates don't
match on this platform, so this 200 MHz for GCC_UFS_PHY_AXI_CLK is not a
valid unipro clock rate, but for GCC_UFS_PHY_UNIPRO_CORE_CLK it's
specified to 150 MHz in the opp table.

Regards
Luca

>
> This series has been tested on below platforms -
> sm8550 mtp + UFS3.1
> SM8650 MTP + UFS3.1
> SM8750 MTP + UFS4.0

