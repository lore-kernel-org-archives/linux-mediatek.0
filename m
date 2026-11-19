Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923A6606A324
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yIJtwVxB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=leZm7fKL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Jl9oyBMBlY4JXOrQAW23CuXlJczhQJcy241+h238qgg=; b=yIJtwVxBQy5BD9jB14Gp4xro68
	mUIj0dDHaWZKnHVaPRfRxqKp9LxlX4Mxa2EhGkxoSnJ/5Go8qFh4fm9PwcHhkR05VIyMYMzwcy/u3
	NPkEUFuav98QCQos9bhbgE6Ov2+jAy2drX7ZnuzKZjTJgz4RE0gvBKantwOpC+bzpJMuej7pcYBMk
	dTKSZipVuyldGpQ2509ebFvsIbdJb4MNYdc/rs/jrAerUJrlLDNXNv0yVqtaT5FzmSFdxMLX2d59+
	dWVDPz7NHRxJ237+9mZF2e4F0WtYhp66aAKfGjxfdvYt0RyCc9P6VT8p7K8VTWnBi7hplXrAUQGLv
	0OQsfZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1a4-0000000BvX5-1GIt;
	Thu, 19 Nov 2026 12:49:36 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1a2-0000000BvVm-1E3Y
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 12:49:35 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-381f65e4e4bso3388158eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Nov 2026 04:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092573; x=1795697373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jl9oyBMBlY4JXOrQAW23CuXlJczhQJcy241+h238qgg=;
        b=leZm7fKLy7oSvjzRK6T/nuRxpmigtgZr8GTXo9YOHKO4SSdD5lY+MOgrUf8YbOIg0A
         t+jLtwX8kTsdKF7nCvJR5In72qLV7+uchCJV0nz/O4EFj3P7RyoWzwgIsZUwq0mjhWsk
         lnlKMYJNtUvQ3Ei71RU6KNCrVflUNbHORLhGQT/yE/20wMhwr3uM2R/+8+AmoQUhusJj
         sQxM/AjPVFWBKWFudpSVE1ypB8w510jxMTfl54rUasN28eMyVRHh709+r0UO92OBGv4r
         rrEmeFbDxnliWiIoXne70l3PWcrH+w1wjCpRxoUJfYGeP0XkoorflIZFz7V6fuUNmiao
         m/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092573; x=1795697373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jl9oyBMBlY4JXOrQAW23CuXlJczhQJcy241+h238qgg=;
        b=NW1g5P+bVhh+5S7bUoIymSaIpAmR+oNfnxHviolyWNVTtC9sX0ul1zSqdq0im8oPyX
         pwcmd58lacFKlJpyLr+JW850+fUi0K+I08jiiZTS7pGUvM8uQv62VPhIEgomiS824qNk
         gt9UMq58RDmWNSKEaZrmSyyOM1gYmnXjbpVTHY27E4PwKZUei8tckBAuZ9RM+1xWIuUG
         L8Jz4jxkomlCW8z4sgjdnWi4hP76dCogZ9L7WfCrStMOmAdRuwzMy4FLvulJI7/UTzWY
         rlbD4B6RhHDSZJ90SccSL0vPKjsPAtMOMvL30luThpJP3YkN1RVEiQQFJ7Ecj6U4N7Mm
         COGA==
X-Forwarded-Encrypted: i=1; AL+hErGDxRmQi7cztCg+niBTlfeaFy8wfLxjHxdtKZsPOTXJWP5SL+w1DXlQIfs+VjF8l/JRNDYzMEB78GZ07lS++g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+keb/XRD34MyDWwN6tMvm5eLg3TB5U1KfM+NFDvLw0zs+Dixmf
	gerqfuvZboSHFXKkKF/qhxQ1KnvC5wOL+YXyQ6Zy/pqNgLK0virZYYZb
X-Gm-Gg: AZFdTZdpB4lc7ILG2V+P61Ihs2WgSan5NztrRnS1/rLessV7PgDwIQ9FnlkniOVDHVh
	Bp54vsLGbGPUnbsQ8QfoTgvSe1Kpr3l3/uwTP+GvvgvO1HxAyanuAcjsmD7/oEyCWuBYBlNdVh9
	rXp488QrvDwTJ57QhQFNHFisehRQ4xcD62RQn14/mMeCEsNlP3XmlxcN7MExdNEBkq1HvGeya4L
	ulXtX7aa+T1lRbmP0xuCeW9D5cfh1OEtnDPN9wmkDgNsELb4NdOi3I3J04orehX6/VmJQnWNK1C
	lBxBACv3Lkk7Nq8Y6o6760E490g5aGYr1ilmRGWnT8l7h7IJ/hqIZ6RJSjxDk7roImwO9U+/Qpm
	R7ewyvr07PX6BEZXhPcex/OfJVx0xc1kZH2bl2VzYGPS6J8ELf7qDgO5DfPg4Q6e1rwXU/bsKr/
	DJOKJCpOBT0yTVXOjozRryRVbJE1AC3ZB0M3KqfyBanczKHVDHMbZFQE3nqMNJMIbE0K2engLPn
	iOulI7DLPNHrX5pBVUJkRTsPWdbPFA16L8amT3kZzMdksFkXULXwflg/6NMLspreePt3TYIIbLq
	EAkGbNjcbMVKzHdRe9Q04WAtpE6PG+HEM9xn+veuTN8HxkXO+uqk6UyQF3Ki2j3aGtNvLcMVfyg
	=
X-Received: by 2002:a05:7301:1a14:b0:382:5dd0:3bb2 with SMTP id 5a478bee46e88-3827fe7882bmr4750485eec.9.1795092573428;
        Thu, 19 Nov 2026 04:49:33 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm17909542eec.26.2026.11.19.04.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:49:32 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: sdio: check the RX packet length in mt76s_rx_run_queue()
Date: Thu, 19 Nov 2026 20:49:28 +0800
Message-Id: <20261119124928.1398520-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_044934_331562_23D56816 
X-CRM114-Status: GOOD (  11.95  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt76s_rx_run_queue() reads the packets that the chip announced in the
interrupt status into one buffer. It then takes the length of each
packet from the first word of the packet and does not compare it with
the bytes read. A larger length can make the driver read TX status
records past the end of the buffer and build an skb that extends past
it.

Stop at a packet that does not fit in the bytes read.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under ASan, which reports no such
read with this patch. Not tested on hardware, only compile-tested with
W=1 on next-20261116.

Fixes: dacf0acfe2ce ("mt76: sdio: extend sdio module to support CONNAC2")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/net/wireless/mediatek/mt76/sdio_txrx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
index 3f314e8e1e69f92..86dd1165d2c7f1f 100644
--- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
+++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
@@ -127,6 +127,8 @@ mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_rxq_id qid,
 
 		/* parse rxd to get the actual packet length */
 		len = le32_get_bits(rxd[0], GENMASK(15, 0));
+		if (len > end - buf)
+			break;
 
 		/* Optimized path for TXS */
 		if (!dev->drv->rx_check || dev->drv->rx_check(dev, buf, len)) {

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.34.1


