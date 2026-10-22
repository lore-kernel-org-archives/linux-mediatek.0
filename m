Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3BF606A31A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2026 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xO3AkDQj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tLtabJxC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YBxTUn7ywMgpmSnO6blmLwOaVhY7BWSoJVdPqCPYsuk=; b=xO3AkDQj9su6C/z/NfXtEjYMIe
	VqxOdfVpYn6PYUYv0b0nEtirybRnRA8cNsKWurBS3rb956BxiiSqMAVPbeUeJK7bjZ1dpOBVvJnae
	9h1pR9E581wKXnTmWF3GioWNpJuEmqdvHdNez0TxeZ9sx0iaQzqYGXsXX9ho1hvBQ32IKVc1RUarx
	DTqHX7tFNZckN6RBUzaNj9hlEu9OEito6RYLrPbxJKsFx/LuBIcpFIfNhR4msmFuBnTrjut4Rz+0p
	uOs5Hi1H1ftgVyXdOOTVf67RchNmzhdyURfyF+Q6A0tlQ3Y39BgxAYZRSBHA7gIGu7BOIQEUNo3Rr
	whHH3Slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpvU-0000000DvKq-1sU6;
	Thu, 22 Oct 2026 10:21:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpvS-0000000DvKF-1KNM
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Oct 2026 10:21:35 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-89ff475a152so618605b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Oct 2026 03:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664491; x=1793269291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBxTUn7ywMgpmSnO6blmLwOaVhY7BWSoJVdPqCPYsuk=;
        b=tLtabJxC2FTg0Ey9LcJy2LTi4izLURdxA8mTFiRx4iuEIeEAccCY+DdT4Lvts1JDx4
         Z/WDXcV5sEXgY+pp45JDDKlKUa1PmJ4h9BC4ahfPKK8v/Dp28cLnOwuJTnOfxXVQO+K3
         Z/Ltf9XCCPp4PefP0rjO7kFsTAkg/NfeFhwheEsV5+FSbGRpY8ZdO9CQzVQWzSPFLdJn
         pXROKrwh5AhNNUBaeHoaylOw0NvNMtWkCnFW56i4ZjIYvu8hHai6CmG1+aUf+RMdKIzG
         8owaUqea4t4Ly3/vhFRUsanQMM5+wTIA7vrBPp5/kjQyX4k2eg8bwCJxbPM5mNZIY/BM
         7LMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664491; x=1793269291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBxTUn7ywMgpmSnO6blmLwOaVhY7BWSoJVdPqCPYsuk=;
        b=ovii/5dqcnSF2kl//s/8HAqL/j0zn445y+99iF3v2FP+PO36iL3HoBJ9tfbqu8wDIL
         k+ic+OYcLnBQhXeWha7dI6IpcIq/89GPMj63SP3DWVt/bQvwQFUkuPOPoOB8CcrnlZfZ
         Cq1JYdlz7APA4037sMHSzjZOcJ3iBvzrCG5fmEFZrNCule1sZIKOsbU7ErWqOzCJXeVD
         hth6c8pUs+ADNKPgaH4lba/TbGTi8CHMutQGn4fcppEPRCbc+YP4NtXr5zkVKB9o3vXi
         ZWu4pnv3oKAh9d8Xah9tdT9WbAEDRbSwDX6Em3tx1iKlllnYK8tgwMb6aqtBUq28maEw
         gmKg==
X-Forwarded-Encrypted: i=1; AKwUvBxAk/7MPElipPFYnXF+q/yByWbsTLDvTocTnnQTD3hob3oJZ8N3S4nZmC/ZeLfQH0cKAwdp9pAKzi8enIH3wQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJW7X9YeON2aA3tsEP5qOBpulEYyn5kUimv16UnVHeAvAijnIA5
	iFoSwKD3JYv9uVhqWkcaNmrfkfb6hIzIYMV5iJ+tdY5WfTqvTE36LJvj
X-Gm-Gg: AYBFou06QM4h92j9Z7vVF28l9KNlcx1fRLVvffFD1nDNxHHYwJmMSHonLkY4Dtv8alp
	g0/pAGW4lOpKk35DCL7VWGJfdN6NeNYWNAUOLwe47EH6mn3RQSUhK32scugrAImKPxfHHQQc0Lz
	bbSwjP2MHpZoYReTdzEZspIsbur01V6fALjpHzhoCcfNhFCo744Fr14X9r14Fj5Cil2LcUWJxHI
	ncGanewjCShsnTsgVhRN/8gEB+6fHkWYiG33s2uFmHewjU7VQTOSzYu5Ovaff0pa7Cja9jg+Bfm
	O+xh6oB8YjFE0exy3vxyRLqkrpz0gEQ7sPE5taMv7Knikkt0oXlHEp3NWOXcmKqCwqXUk1/oZ8l
	YQmW2pCwacrTLEQJyJbVsYSNHEavylGOnAJoScJ5lIbiIutm87lTCWxFmxxw+B2998oHE/nR+MB
	dqR9HUYxve5cr8iDoDpt9Jj3UYwqF3/mcmr9yYOrmwO0MZksNmCev4HdC68uyt3v9BxHggf2mr/
	N3h0qkZh3v9GXLLZp72aTR+GZwAqeB7xppu1BjoxPJkoE03qHlPoN3ZC9zP0a7i9VZDacjEi/dd
	7VWwM5DDg5UETVL9Y8xaUfyv/kr78/jRCnDhGS3cCwUrDIgXYa9TWKTgl+tQ98uQdXXCrNsRQJ9
	IfWB6GCwIjB5GOmk898GnsqXqcnVan4dY
X-Received: by 2002:a05:6a00:2e9e:b0:890:bd5c:5710 with SMTP id d2e1a72fcca58-8a089f6585dmr3709575b3a.41.1792664491420;
        Thu, 22 Oct 2026 03:21:31 -0700 (PDT)
Received: from fedora (aipl-202-179-95-46.static.ankhnet.net. [202.179.95.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08933c9b1sm1943324b3a.3.2026.10.22.03.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:21:30 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] spi: mtk-snfi: use min() in mtk_snand_read_page_cache()
Date: Thu, 22 Oct 2026 15:50:20 +0530
Message-ID: <20261022102020.107609-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_032134_358291_809EAC17 
X-CRM114-Status: GOOD (  10.91  )
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

Replace the ternary case with min() to pick the smaller of cap_len and
req_left.
No functional change intended. Compile tested only.
Found using Coccinelle.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/spi/spi-mtk-snfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 6e96e50fedad..bbb65a21a684 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1017,7 +1017,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
 			if (req_left)
 				memcpy(op->data.buf.in + snf->nfi_cfg.page_size,
 				       buf_fdm,
-				       cap_len < req_left ? cap_len : req_left);
+				       min(cap_len, req_left));
 		} else if (rd_offset < snf->buf_len) {
 			u32 cap_len = snf->buf_len - rd_offset;
 
-- 
2.56.0


