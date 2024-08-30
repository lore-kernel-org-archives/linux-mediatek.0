Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4ACCA0EE1
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJjNgUGJenoBaIKVAgwwwsHux2S25WdElfpi6ReEk9U=; b=Ov6iy5fb9uAX7siATa8LmxGYlQ
	CSsxRtt83DeBtXpxtsJhJ2Jjw8fA7XeNGGK4lRuL42rd9JYFP+Lz6q/lHtAH6tFtY6dnHm70zqqBA
	HEc0ifzz/RBDBYKWYFJgac4vbo3X86B7VJGWD20WUeuUVaVRUUDHW702WdTYAH2VO+zpZ1b1tSsuh
	u57r6f9t/6oSyrO94KjkhdHb5wqZ3cHuK6yTmPOWsylrZcqT/Vs8IQEh1ETyZHQ/eg6qgPh7ZRGkO
	5YNwyLCsCgieLkiBpPijSGLm6A2ASEN+CwUbwmLWa0ySlabxAW9Nnya1a5k/ytdERNvKYwi01AcJk
	y/kUpB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvhP-000000052YJ-2uXg;
	Fri, 30 Aug 2024 07:05:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvgU-000000052FV-3v6t
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 07:04:40 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a83597ce5beso247183166b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Aug 2024 00:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725001477; x=1725606277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJjNgUGJenoBaIKVAgwwwsHux2S25WdElfpi6ReEk9U=;
        b=k4ekT+52KW00PY7id10MIprTjIxl9Azn5cHdOu3kVct5lgpe556zCAuZW6i8Ny9zuF
         jNghhuFXPaeh1wFDIGQEwalNU4hZohanR9IA+gxCPX2RSvuWhGi/wn66G4Kx2qcbJM/4
         DfNTG8LqrKJZ5CXI2sl4VaGlHcvryENYZ5Yiu7jap0VnXXE/BTpRJdgIvt825Lt3X5uA
         SpObJpdDLRQV4rMgjYcbCtFwNwAG7CMFd8qH/ldTuHlpIcf5aKC3hbLO9aUhqp5ijvGO
         FnKTYiP+PnHt6ty6kX/3zsHB2UtT31K6iKoO255fv02aiXI/rP7hYubal2azIIYekGwJ
         vp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725001477; x=1725606277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJjNgUGJenoBaIKVAgwwwsHux2S25WdElfpi6ReEk9U=;
        b=NnK0Qkm/k4p5YZfEebz5q86m3gw9jtre0AVIvjjyX7iYwfmX5owVBaxifMZ/TeBJ3O
         Tu8T6jm5ZDoujvoMkUETtjkJy/mRKRFw0QwBIICWpM4IMftqEc9jh9zW3HFnA6xk9Xj6
         DYXuXZRxeBl3qn40XRoMB7gJK3UpQ04RPzs9D8Hdnvv9Clrv8EQlkn8KYC6sFMi9agyP
         qTXcg7BJ8oKKwyFCOhs6XlRHopLJ3dLvFjS77UtedTRVBEsow9h3m2cUur7L1j/RMMP6
         tu0KO5N42SVxmLOsooNdmSFmZQNUG0fVGLcbxJM/Zz7bqCwEjaV0z+Fil9AyMIys1z2d
         fPYg==
X-Forwarded-Encrypted: i=1; AJvYcCWDN/owRDj1jXJ1aNH0fHZ94cLlC3zCuJVgWeUM7KJgwvQaKes3x2qFxSrAPukJ8RUVk7QWXD/JudlkGhls8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSWe0ert0W3bJaXZAjKVYQNwaXUOv0OQBy9OakAVmHFBWJrC/a
	qeB7qGbd19waIl0CIxJgY3O9rPkK0r7wjI4F4yNe0KG3+conzRWQQh4lqOGKdtY=
X-Google-Smtp-Source: AGHT+IH87EkQZslfXd1cN/MuD1B1+tjpJHcDRiz/ebksiuYOXdKRtj8j5p8EyAgrD5jVzjEwQczjhA==
X-Received: by 2002:a17:906:4788:b0:a7d:89ac:9539 with SMTP id a640c23a62f3a-a898231fe8emr528271266b.7.1725001477275;
        Fri, 30 Aug 2024 00:04:37 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89892232c7sm178026866b.222.2024.08.30.00.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:04:36 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [RFC PATCH 1/4] dma-buf: heaps: restricted_heap: add no_map attribute
Date: Fri, 30 Aug 2024 09:03:48 +0200
Message-Id: <20240830070351.2855919-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_000439_206455_FB23827D 
X-CRM114-Status: GOOD (  13.91  )
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

Add a no_map attribute to struct restricted_heap_attachment and struct
restricted_heap to skip the call to dma_map_sgtable() if set. This
avoids trying to map a dma-buf that doens't refer to memory accessible
by the kernel.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/dma-buf/heaps/restricted_heap.c | 17 +++++++++++++----
 drivers/dma-buf/heaps/restricted_heap.h |  2 ++
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/restricted_heap.c b/drivers/dma-buf/heaps/restricted_heap.c
index 8bc8a5e3f969..4bf28e3727ca 100644
--- a/drivers/dma-buf/heaps/restricted_heap.c
+++ b/drivers/dma-buf/heaps/restricted_heap.c
@@ -16,6 +16,7 @@
 struct restricted_heap_attachment {
 	struct sg_table			*table;
 	struct device			*dev;
+	bool no_map;
 };
 
 static int
@@ -54,6 +55,8 @@ restricted_heap_memory_free(struct restricted_heap *rheap, struct restricted_buf
 static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachment *attachment)
 {
 	struct restricted_buffer *restricted_buf = dmabuf->priv;
+	struct dma_heap *heap = restricted_buf->heap;
+	struct restricted_heap *rheap = dma_heap_get_drvdata(heap);
 	struct restricted_heap_attachment *a;
 	struct sg_table *table;
 
@@ -70,6 +73,7 @@ static int restricted_heap_attach(struct dma_buf *dmabuf, struct dma_buf_attachm
 	sg_dma_mark_restricted(table->sgl);
 	a->table = table;
 	a->dev = attachment->dev;
+	a->no_map = rheap->no_map;
 	attachment->priv = a;
 
 	return 0;
@@ -92,9 +96,12 @@ restricted_heap_map_dma_buf(struct dma_buf_attachment *attachment,
 	struct sg_table *table = a->table;
 	int ret;
 
-	ret = dma_map_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
-	if (ret)
-		return ERR_PTR(ret);
+	if (!a->no_map) {
+		ret = dma_map_sgtable(attachment->dev, table, direction,
+				      DMA_ATTR_SKIP_CPU_SYNC);
+		if (ret)
+			return ERR_PTR(ret);
+	}
 	return table;
 }
 
@@ -106,7 +113,9 @@ restricted_heap_unmap_dma_buf(struct dma_buf_attachment *attachment, struct sg_t
 
 	WARN_ON(a->table != table);
 
-	dma_unmap_sgtable(attachment->dev, table, direction, DMA_ATTR_SKIP_CPU_SYNC);
+	if (!a->no_map)
+		dma_unmap_sgtable(attachment->dev, table, direction,
+				  DMA_ATTR_SKIP_CPU_SYNC);
 }
 
 static int
diff --git a/drivers/dma-buf/heaps/restricted_heap.h b/drivers/dma-buf/heaps/restricted_heap.h
index 7dec4b8a471b..94cc0842f70d 100644
--- a/drivers/dma-buf/heaps/restricted_heap.h
+++ b/drivers/dma-buf/heaps/restricted_heap.h
@@ -27,6 +27,8 @@ struct restricted_heap {
 	unsigned long		cma_paddr;
 	unsigned long		cma_size;
 
+	bool			no_map;
+
 	void			*priv_data;
 };
 
-- 
2.34.1


