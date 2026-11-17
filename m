Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405E2606A893
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WU1HK2W1;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HUJgftab
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=; b=WU1HK2W17KKtVvi8Z5nrfRDZkx
	c09Y8P/PRpy4MRSJlV23JhelAJvUki9pE9qqxTIUcpWlTdIVNFvu91D0J78/ClndgW54Fiyq0UM4I
	VyyBPPJ/BzyjxaRsK1W0ijJNnGxVw/WbZfn9Yi6DAE72QMeAFs53EEn9O/EiM3t5A2Wr81iqXZldf
	AH4h/uUhZijfqZ4FXRXt7jcUi+f6j40S2VAx8nUMbIymeTEtpKK9R1pipHmM9564cnYMZFQFWc+R4
	1mFAmuhMmplJaEhpCfAKtDCAlS5FnZKseTjfJBYbkTu0jcrw1ZcwbcWNNA2RJLWtYSefoH8RdFNI1
	V9Q1TTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN1e-00000006Zzw-3owQ;
	Tue, 17 Nov 2026 17:31:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN1c-00000006ZxT-0jTn
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 17:31:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1297265e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 09:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794936678; x=1795541478; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=;
        b=HUJgftab3B0l9y+JIfqvVHEHlnj7elpGHUrQLaj0kiN8hpgMpORnj+s6dlgXXU7U2g
         OhdhGYHU2GaT8zg9A+Yrej8xKOIVhAEclMvX1g6HU8xo0Dgy8q9zkHH3mEokbUx4tFbZ
         OnohFFJ3ap+A5L4McNiRd9j3TR2/xTsKjqDTPMlDsi6UaLGHUXQcTuGHVksr3uin6GcF
         xr7icUBewwPw7+i6HeKaQT6TY1uNdR6rTW9XOqjIH/6d83zekblQSmVbVnbDNSj+eS5K
         +0T3vBFmDXV9pAHRX4Nwulu2pp0Py0kTX80RL4I7cxV1pom3qjZobmv5B7pT/fRzSTZO
         eWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936678; x=1795541478;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PM+gGzOAYa/FTkiyD9xYa10o3sGPOU41PoOWcwMpxkI=;
        b=WFFz0gP5aDgFtFA7DMoc5QuYYSsMehgBRX8G94FJ6VS8B3vahGBLiahBUaS1A18LHw
         Rq2b6bGrVkc1BaoKCbBpwfDzHH58NRML/OXpUIoLZStrtfXLVLUJdillcl6ODJBJLMky
         rVO+3wdKvv7Tf6ZCLnbmfnKDFtaMGX7MUoIr2pL/yJTPr1MeAN/SA9rxTQGrWbI41OFT
         m26CbBMFrvfpSW1U73XmtMIBBpP39k8I2lzQwy/buFlKp0ZUlMK0yyO8am/5Y/J3eol5
         PQ82TtBNTa0STkDyk8tvppZCHTFta9ZRrX9wfWReDoHU4FMnYgKX4lsMUcgIntXer1da
         zJgA==
X-Forwarded-Encrypted: i=1; AL+hErEmrw85uuZVm2NGkPE79ryhH+ivPml/GSk1CzpaXIeDnszv5hWfs390h9UJ/bWt+G/aJDow1W5F7XEEh8AgvA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9tyP8L6ahXxhIjF1B+t62aLk4UQ7eF0n77N+Sv94gjzTIxcPuj
	d9vZ45piVGr28hRwqAhhC9fPJdh302kNwVdoJVLkicDfE2vttVMCzt2+ijkXHgHJzCs=
X-Gm-Gg: AYBFou1Fn+Qq3OEk3WXfJE1mZa6e+5DgM7UfjC7xZKPKqVGyKslEbF7cwe2jQxpdC4S
	kiWFAocqn6j2k09AMbcj0U9d+aFjJH5wzzec7Zt2cVW51v8FvC391B8+JloUL0nEpk/0M/YbweN
	dEF0MrMpt1U7rEUdHDz0GY+j3kJA76T97BwQGfJPMN16fD+gLB+juWo3TLiOWNpqKZ7NtkmPP5y
	LIVpIKSmNi0CZDLDOl2NcbCLHqt6c+5mxYr4TIHGxU8zo5S+DmaKCTnuZSCI0H5OFirS8TdeBR3
	pT0+BoNf0lyPSbI9gj6vWv9co+uVkZGAPi1e7X50t59gSp6BnFRDQW/YfONEp55VWMLa6yIQtbN
	YGlkH99T70R1CGApx80mm5YMWqQm1Klgre7giZQ8xUlI5ZkKosXKWrWFrzwJTY+S19sjqkFREBj
	yIVt6LUhNAmbTMX8bXJ9YSB09wtFV3fBUJ6rHvIQiMlV3dXyCVivWjTCZ6rITDV8vB0kxw18+wq
	IaNfP4miMpO4VsaWyOuIYYdNI7on5uUzbzNvmE5jzmDJ+L50nD0dwEwuO6Sn0t7ZYY4D3LeNBkM
	psUF5YZ34c8NCLcTVDbMatiU1y0WWUAnMgGd2X1Uq/iSu6obxim2bDhB
X-Received: by 2002:a05:600c:6986:b0:4bb:6a2d:b438 with SMTP id 5b1f17b1804b1-4bb6a2db52fmr181094395e9.0.1794936677610;
        Tue, 17 Nov 2026 09:31:17 -0800 (PST)
Received: from [127.0.1.1] (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9426asm46870735e9.4.2026.11.17.09.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:31:15 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] Add MediaTek MT8196 SMMU wrapper interrupt controller
Date: Tue, 17 Nov 2026 17:31:03 +0000
Message-Id: <20261117-mt8196-smmu-wrapper-v1-0-229f04d9f693@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFeP/GoC/y2NQQ7CIBQFr9KwlgQoUOpVTBcf+FVMaCtQNWl6d
 9G6nGTevI1kTAEzOTcbSfgMOcxTBX5qiLvBdEUafGUimNCc847GYnivaY5xpa8Ey4KJGi+Y5KN
 ArRypyyXhGN6/6mU4OK/2jq58U38j4WOtd+XQiIWM1M0xhnJuACwTKPuRWSWBmbZDZZzutOJOg
 vXgObSCGTLs+wd5W3VKwwAAAA==
X-Change-ID: 20261117-mt8196-smmu-wrapper-8d2041f2e65c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_093120_233729_480C08C0 
X-CRM114-Status: UNSURE (   8.29  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On MT8196, the multimedia SMMUv3 comes with a MediaTek wrapper that
merges its interrupts into one GIC line, which stays asserted until
each of them is acknowledged in the wrapper.

This series describes the wrapper as an interrupt controller next to the
SMMU node and adds its driver. System suspend is not handled: the
wrapper and the SMMU lose their configuration if their power domain is
turned off. This is to be revisited once arm-smmu-v3 supports runtime
and system sleep [1].

[1] https://lore.kernel.org/all/20260929034510.2023173-1-praan@google.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      dt-bindings: interrupt-controller: Add MT8196 SMMU wrapper
      irqchip: Add MediaTek SMMU wrapper driver

 .../mediatek,mt8196-smmu-wp.yaml                   |  70 ++++++++++
 MAINTAINERS                                        |   7 +
 drivers/irqchip/Kconfig                            |  11 ++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-mtk-smmu-wp.c                  | 145 +++++++++++++++++++++
 5 files changed, 234 insertions(+)
---
base-commit: aab02e49f0b54a0837e58c67651c4abdad1a3208
change-id: 20261117-mt8196-smmu-wrapper-8d2041f2e65c

Best regards,
--  
Alexandre Mergnat <amergnat@baylibre.com>


