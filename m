Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4115606A31E
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2C1VaCar;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rJdHORtx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=r53zQBd90L9qdkyWqx4Yp32RyLUSfl8WDtc6jDamlsM=; b=2C1VaCarGuQlscSBL7Sy5cth08
	cm1MNF1wiN5OcodvfiKbGcrzTts9x1rWxWxzK1yMAgHi09qfQ2QHr1azfqm/KNZAbZzlID3Z2oinl
	hIAZzcWeqp2FUfHP+VR430ueOD+FziOLBMRB4m5Oq5hCnifTdM+Py6/aJch5aDJgJURW7cA7iDMoa
	kHmEoPDFKI4Qxy5fdO+RPMkRW9T8vd2T/2LpGKGIZYcucn/iDmRlReQH7Ro/OQHoBwHAiXnOq8K8s
	7+4DOcP6fRleAPBjjSjUZ3py2akNC1NcS6LWADOwjW/5tcQMQiNpTa1JIercTPRbP2HUDRK7qf0hL
	OpQTHEVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKbdv-00000000DDf-2f4q;
	Sat, 24 Oct 2026 13:18:39 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKbds-00000000DDI-2Zj6
	for linux-mediatek@lists.infradead.org;
	Sat, 24 Oct 2026 13:18:38 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c413dea9ca6so268875266b.2
        for <linux-mediatek@lists.infradead.org>; Sat, 24 Oct 2026 06:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792847914; x=1793452714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r53zQBd90L9qdkyWqx4Yp32RyLUSfl8WDtc6jDamlsM=;
        b=rJdHORtxs7lCnMdVTsNzp06Kqowffa5QHlTifDOHEDCgzO76rlrRUd7b00hCqQDxRF
         iyMUffb2oxP638njwaIRXqGzrjhdcOdSm09Sv7OsgdBYtYuNVSZIZZbKnUCqBZD1NX2Z
         1zmpbRk1IAizTdUpGt7ODjW5QGkcG0DHa1hCVMBm9tKSqOyEyDxWin4UBa2GpwlYXllS
         SRonrUDihjmFWuQzmsMlnRKCjmOzNk47Q52CsumVN6ycwiA3tbmW+YPciKtZE5/0ffUq
         vybTwZI7UgE70zwSpaQ2tBKiyay0Ge0/ks7UBSXG29atckx19CIHBkvvO3oSkCR15AZ3
         vf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792847914; x=1793452714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r53zQBd90L9qdkyWqx4Yp32RyLUSfl8WDtc6jDamlsM=;
        b=XU28pB1JSyG2nlmfHKuUuvUxcwylGW5g/ehsJhlSuWc3ZFLycoN+WTBiVk19GL2oCQ
         Q8LgUS9QtXTqNJu4ArHU6FPgnkH1bcLmlGssZpNXRy7BxhdD7lifbx5zMyAtKdmtI+4p
         3NXPdgnyPkib2sWBpf62jVtIIcIAcxkTOCc+azYlOaCIfissvlCwSSM/2GpcTGaUKYZn
         X2nAno6nBuDCjrXlsFri0FUY+XGHU6goNT8eGYcnsiN2Gkj7huHHVvkihu7sMS87fBCR
         w54YVWUo9tRjNt4ExAxYrf+wui6HScIWETyuLk2mCp5aMs1SFsq1DcPZDAru3MUx8rGV
         YwJQ==
X-Forwarded-Encrypted: i=1; AKwUvByOa4VnsAOzYfzhP8qjGKbjwBFCrNgMWUHkvHwMDeJ45fxl0UT55gzps4N6653+J49RoRXL3pSskvhvHmNFaQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLU9EkXaDKUkDt0/1DDsTNQHrDDjyC2lxvwcKU+Ch1U3cimiTlm
	A9VmgaX4seMqlfQO2TtEos/c8dwBdEQT1UWl5BZj6PF1UzbFpOFlfrr/
X-Gm-Gg: AYBFou3JNK1Y1wIdljHSm7zZHRAdwhI46CdpBjItj/onDFbkQt6Ka3eMoA1y+pV1sql
	3wBlWtoZb/XxGfItWEQooz7rvFj0d9V/+MrdcD2yTvfjCrqp6K+1TtLmz06E9KShtfGtAJwNazX
	vmqnlyqEVStkUAmPGJePI72XZm85gczv+V6/RWDVEyYc9+BwxnxTjmTArdnEEoiWfYqjvOvzdZQ
	TF59FLwHm756Zg0k1du/xAio3fkpY6e7Obdx5/MvIuV7pxw+PE+OxkK0aJfw+bO8jEhF071eSLK
	bmLLpcDi6swjn5XUJunzpKIXVru+8j4NE0k9vvojPXFnBGr4Ae5qgqcgdTu6TIa48dLKbWKJ6+w
	n5GmLkw1gF2ZQgVPlmQdp0GXrp6ocxIrOIAEELN/OnxPWPc/YeYk4sJYqYrSlDIaVPY7b9/2wAb
	jI3zQVX5EDzO/VOHe99MSVgFHk+1CBrWlKiQiDjUdKPBBx/SbnRwauqDHHYHajJQ441cbS4BeJP
	649xQRyAHOjNDEhYfoRplD++6cNyXdV9y56CQ1lpv0UJzapcNFQPNLSfJ7coPny55mpw3OHMQ==
X-Received: by 2002:a17:907:6e90:b0:c46:8909:963b with SMTP id a640c23a62f3a-c46bddb52camr227292866b.9.1792847914396;
        Sat, 24 Oct 2026 06:18:34 -0700 (PDT)
Received: from localhost.localdomain ([185.65.135.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd6276d8sm87306666b.41.2026.10.24.06.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:18:33 -0700 (PDT)
From: Hedi Ben Hamida <hedihamida096@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Hedi Ben Hamida <hedihamida096@gmail.com>
Subject: [PATCH v2 0/2] wifi: mt76: mt7921: fix hibernate and suspend resume
Date: Sat, 24 Oct 2026 09:16:51 -0400
Message-ID: <20261024131715.64435-1-hedihamida096@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_061836_681838_8F7463CC 
X-CRM114-Status: UNSURE (   8.37  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes two MT7921/MT7922 power-management resume paths.

Patch 1 adds a dedicated .restore callback for hibernate. Without it the
S4 restore path runs the normal resume sequence and times out waiting for
the HIF suspend MCU handshake.

Patch 2 recovers from the same HIF resume timeout on S3: the firmware does
not return the HIF_CTRL response after D3, so reset the device and report
success instead of failing the resume.

Both were tested on MEDIATEK MT7922 (14c3:7922) on kernel 6.12.113.

v2: add the suspend resume fix; patch 1 is unchanged.


Hedi Ben Hamida (2):
  wifi: mt76: mt7921: add pci restore for hibernate
  wifi: mt76: mt7921: reset on HIF resume timeout

 .../net/wireless/mediatek/mt76/mt7921/pci.c   | 34 +++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

-- 
2.47.3


