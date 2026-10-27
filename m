Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82B606A335
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2026 18:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G8/ckCdP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tvi9IZLa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=; b=G8/ckCdPVAcOd3dh0hf+erGILW
	vAfawUMUh7JSjPH/tZJnfpCzU2IdB4zVUhYDc3zJw2srl8LgEZWWe0fek1k6ck/xCjNiY0F5u4rBM
	ddtOZx4Pl326Zjn4zv1lFEbx0BBzbDeo1MXMyRftFSFdnkUx5tIyeAHl++97w8S5fiFEdbR58ruAa
	3aV9DdJ2fiZOQHmDtU3SieXtZyBiPP9apL6dpxLvzSSawlCX8iP/BhtKaPDykivLrhFKqwNiX+0CC
	H20hnMIuhIIMNze5INfA5k4eBqlTTVMunlrLOqymjFmdQE081lNPiQQXNzWbVfZiiaLPKAtTqextB
	cDXCjwQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLm96-00000005a7t-0HzD;
	Tue, 27 Oct 2026 18:43:40 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLm93-00000005a5m-0Jog
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Oct 2026 18:43:38 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-843b6f8e2c7so222610a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2026 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126616; x=1793731416; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
        b=Tvi9IZLaqVuLsyN4KQEWNxPZN9kbkOeZdZUzpVTrF1wZj7+f93/ntSQr8arLcDgE2t
         wROsKyLvejKuzZkPehgY1uScRPNjXWasY5/Few/FXdH+ROBXVlI5W0Kc0T/CGcADcOc5
         V/CBQ5GSUXJN0pFWeaEtr3u5S+cWZ5ZNnoS63QOchymjaITTkLzluMeI95S1DNLW0obn
         KLhmitx8i83w4qge+oe9Kd1+tkHJOpA5ur+fx831j/au5Fm8qttpy/jS/elI6wQki6e/
         MRAjKiYMyBXVrqj6QoKSnmU17ep7PtQm9kcrjlciSIPa6J3dSFFIFIW1kUYl9eFdsLkf
         lkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126616; x=1793731416;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9axz0yVX2giw2uFg+BgambTLl5XOFya7eXMeUfHcrMc=;
        b=Mfhs0UoPzrsWrkpXw7Fm9dCujFgeuIbE+KvAC3bsS+RJdNmH18svlQG59pRHre7xAs
         ASGKQn0A+iOaa9ehR7oW0pdpcp5r82DgQC6ytQtS3nLt5NB/MWcU3HVNVtYWZdoX9BpQ
         Q3A5cM6ikxAYDoK0QztNd3i23ycVV0k0rgN1x8/XgyBsgnLQxG8FzAyasT9RalNJgVzZ
         TmJy6Nze277xs7mpLCIRhgQDgS9OjfHsJOdHxaGkNBci0jwMOvsTmfptc+r6zNNqAfd4
         iHHDng62Yw6hyTy3V3kxJVvHwCmRyUujYbBJNsMWkWX8g42F8qp4UguWZLOkt/fQIcFl
         qSvA==
X-Forwarded-Encrypted: i=1; AKwUvBwtmcFatcVyQnMYsETBiZ3eyJg/L+kjzHvwUzDn/P4TncCPCHa9Z0nzluC+82qHqx2AQhHgKxJw+KeI2h8CnA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLEeLbCMBP64Lo4EECTkK4mJrhvlYkKww1bbvMH9r9IKRn/8+eZ
	SW1TK9JYMZW4DhVQ+NcuHaiQ0gNXby6Tb1RYNDOiNrFN9jDmEKNyg+8r
X-Gm-Gg: AYBFou39IyXMosANEFkuXndRiFiawxhyt+xB1CzRXdfWhwaA5EQjksS8ilUIlbKRPxj
	hJSRhZsC9srZSwayswIiNfCzgdEDvGrJnmu5ylm8Kc9m0M8samsDCQT6OFlg9ERkAK04NOGclq7
	hYFHugiXXsBgtbuS7j9wNlS6BkDK1XUHyiDD+Jd/F21YgIeat6fJ05GpvRRm1A0BeIBTRKgn4jc
	xHg1IQ5t6avXq8taMUMFfo9pNlP0WdwCXsH80Gt4elnKsri8Ua+uDyQ8irav5prIaKwdBQZkC28
	2207OA4DiLikbXoym2gQLsML1jZ8NlLSV8e6aY8FU4Eac6uI0rpwleKUuHReAj/00cd3RMAcufp
	18vVGzVHs9ENiXuqKLNDJ2M6FyYFCtAzEpABRpF1I69RMEJCYlQ6WjESMLKISZ9PPNhfURjzdvO
	bKQqI0b2kLW0SbuzNOEvLOMas2LSyDiS5bPncKxqJPhLDIF0M9qM1rTqacCKILSIBqosNE2cuLw
	3jZ1S8H1vRqxowIM/Z/CDgk4ccmpbZF5DeI3bdxEIS8zJJCkP+GbwOsOvRmT39UrnSICmJHFTIe
	JBGrkSYdWcfmATAIPxzrLq/k9hgNFK3fH1wvfU2IM3NKNewb2wsbiirNA59oMTz2JgBMO0U53vP
	a5iEUg8c8sJX4nQJvJ0wY1ncNYaybk6pPibxSQQm1JaPEfEseDWDiURvhyXz5OVEabveqVaFvzk
	WFpvnC
X-Received: by 2002:a05:6830:2b2a:b0:829:9992:20e7 with SMTP id 46e09a7af769-85ab88cd029mr404051a34.30.1793126615647;
        Tue, 27 Oct 2026 11:43:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/2] dmaengine: share virt-dma synchronization and use
 it for UART APDMA
Date: Tue, 27 Oct 2026 12:22:25 -0600
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOTRLCIAwF4Ks4rI0WWm3HlfdwXFAIbVSoA7Tjz
 /Tugm5c6vJlki/vyQJ6wsB2iyfzOFGgwaVQLhdM9dJ1CKRTZqIQW14IDmFsLUWw8Qyj9BG0lRD
 uTvV+cPRAmDjwTaOasijbTV2xBF09Grq9nxyOn5yUE6qY5bzRyoDQepmYPEomuo4crj93aaOnE
 Ad/f/eceJb+qpRbQWXqmjfKoKn4vrOSLis1WJYrTeKbFD+RIpFGSzQFCtR6+03O8/wC5PmkD1s
 BAAA=
X-Change-ID: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Andy Shevchenko <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_114337_133167_D115CEF2 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Provide a virt-dma synchronization helper with the DMAengine callback
signature and use it in drivers whose synchronization callbacks only
convert the channel and call vchan_synchronize().

Use the shared callback for MediaTek UART APDMA so clients can wait for
completion callbacks before reusing callback state or freeing DMA
buffers. The shared helper and existing-driver conversions form the
preparatory patch, followed by the UART APDMA fix.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changes in v3:
- Split the shared helper and existing-driver conversions into a separate
  preparatory patch, leaving the UART APDMA callback assignment in the
  second patch, as requested by Frank Li [1].
- Replace 26 equivalent driver-local synchronization wrappers with the
  shared helper in the preparatory patch.
- Link to v2: https://patch.msgid.link/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com

Changes in v2:
- Add a documented vchan_dma_synchronize(struct dma_chan *) helper in
  virt-dma.h and use it directly as the UART APDMA device_synchronize
  callback, following Frank Li's review [0].
- Link to v1: https://patch.msgid.link/20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com

[0] https://lore.kernel.org/r/atoz6M7RHU14_a3J@SMW015318/
[1] https://lore.kernel.org/r/auDOqLln9_ra__hY@lizhi-Precision-Tower-5810/

---
James Hilliard (2):
      dmaengine: virt-dma: share the DMAengine synchronization callback
      dmaengine: mediatek: uart: synchronize completion callbacks

 drivers/dma/amba-pl08x.c                       | 11 ++---------
 drivers/dma/amd/ptdma/ptdma-dmaengine.c        |  9 +--------
 drivers/dma/arm-dma350.c                       |  9 +--------
 drivers/dma/bcm2835-dma.c                      |  9 +--------
 drivers/dma/dma-axi-dmac.c                     |  9 +--------
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  9 +--------
 drivers/dma/fsl-edma-main.c                    |  9 +--------
 drivers/dma/fsl-qdma.c                         |  9 +--------
 drivers/dma/hisi_dma.c                         |  9 +--------
 drivers/dma/hsu/hsu.c                          |  9 +--------
 drivers/dma/idma64.c                           |  9 +--------
 drivers/dma/img-mdc-dma.c                      |  9 +--------
 drivers/dma/k3dma.c                            |  9 +--------
 drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c   |  9 +--------
 drivers/dma/loongson/loongson2-apb-dma.c       | 14 +-------------
 drivers/dma/mediatek/mtk-uart-apdma.c          |  1 +
 drivers/dma/milbeaut-hdmac.c                   |  7 +------
 drivers/dma/milbeaut-xdmac.c                   |  7 +------
 drivers/dma/stm32/stm32-dma.c                  |  9 +--------
 drivers/dma/stm32/stm32-dma3.c                 |  9 +--------
 drivers/dma/stm32/stm32-mdma.c                 |  9 +--------
 drivers/dma/tegra210-adma.c                    |  9 +--------
 drivers/dma/ti/edma.c                          | 11 ++---------
 drivers/dma/ti/omap-dma.c                      |  9 +--------
 drivers/dma/uniphier-mdmac.c                   |  7 +------
 drivers/dma/uniphier-xdmac.c                   |  7 +------
 drivers/dma/virt-dma.h                         | 15 +++++++++++++++
 28 files changed, 44 insertions(+), 205 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


