Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01199606A320
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ruLKSa4U;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gzLhMIRm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5tXRrlu6pVIT1vr+YhxUcVgo6aTbfODu2mQd8Xde0q8=; b=ruLKSa4UsWbAMxHsKpXmMgKs26
	SqMd/e/nwGVQvnOihIoVbksu9X2BLTVy5WRFSz6/RLq1/6gPzsocm6MDVTDpVftSPXodwnnMjIx+L
	6AfQy5tbXw6H8ws99Y7DEdi+e7mQsInIPmWWLPGTvO/zXc3cx6y83xDIeR/ymSIiryIoLut7KusG6
	NR1W4YgSLe+b3y57LCZaEw7vrCKhTldfHb1MKCeHMA0Y9JWRKswir35C0Y+wQ0AjoXJmbTEp25Jpw
	z8GRU4Fg673r05DWOEGEaS53G+kinUqqyO9Y2VzKXTtuAfenbtqkhoEgtbFjD22oohGVLCPrawz4l
	k0uGOXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4In-000000092df-3Od6;
	Tue, 20 Oct 2026 07:30:29 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4Ik-000000092YX-0LxC
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 07:30:27 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48e0d1da913so321483f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2026 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792481422; x=1793086222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5tXRrlu6pVIT1vr+YhxUcVgo6aTbfODu2mQd8Xde0q8=;
        b=gzLhMIRmtJ0KCUf8rLjy0vatnwn8bdoMkeFJ4anJEwNS/4pD98GpF+aaUdy0sMn10z
         nSdPo71elfHHoh3c91m+mHf/CQxMSd2TYim9jtQPxCcSOMPfznCvQ5L1TYbcFTbhddbz
         U9jQ2bsxY2vWK8YM4G/Fm91tKvba81BDxOiljdT3qFWKOSkrb1MoEtCzC9bpVd97C0ob
         +xaFmkKUURf1McD3+KoBgjw0PglDb/nvXdCZAXbvrJ1LQboAARZmHjYgNp9RAVdrJ51p
         iOgbrlsozejZyF0kaX09ruy0xgNBl6A2eHirlsyZ1aPesANBDQZCjD4aode5naSxS0q4
         W9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481422; x=1793086222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5tXRrlu6pVIT1vr+YhxUcVgo6aTbfODu2mQd8Xde0q8=;
        b=eiKrCKmpaHczSho8HheXCWDBc161ZTaEWks6y7cphXu9koFH3mCmvs3V9URzNXl/7+
         12NECqjyg538oxvncGY+QgW/qlJ9uz4g8hOpSeGHgCPZuVwcFJRE9hzWeAvmhvfe21Wi
         Tjy8W43fDi5nn2VJdqBU9kecLzSRrxTZUl5QaregAnDizerzM8OWjg4yQpotTT0zhqOg
         r2g24OmhAkhoM03Vh6ZFZLPwUC2ZiE9aobBAeEHkbfYsP6vVzIc3Qdu9jp+korTGOLto
         DEhgG/NJCZCPQ/Lo5wfhENyMSTxPukJf2WeyRIr1UnGx/ZsdzSyo+hA1K6aKhBEGBeT/
         kNbg==
X-Forwarded-Encrypted: i=1; AKwUvBwLx6EFxIfFZp28C1jCJb0kqe2cm0/owY7civh3rRnTA/W+Xx1DS+NFPyhYbI50kbX5fchK/v7q4k1TmgFSLg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKEjwbWi7lJZ6Lzl8hV/WlbsNZuiy3yyPujy86pJG8FsOd0CrrZ
	+8gKLwc+NcU4waik5STV1j0Hn7XYsPxkDlin7StttRLBNEFqfhhIiwmO
X-Gm-Gg: AYBFou0ORFHQqvBYD9zFKJDvpiMFuyR4xFz8y9TMS+j1X9i984yDVb2EV9Ya8S4tiMQ
	JNWmuCZQtDeo+NPhoksfjyxIMxs02M5RynsdckfK6pLIf53jmYeFq+G3O9tLhAHU7Z/9fVgsdny
	C5u8vXz34VduS4zq9sHh2+iFiQBYDQ2GNp1AdIkPCT5AX1s01sGbJv2YrbO9MnsyRRp+hWfUIYM
	6Oa2lAsjsJMSfn3RepilCvQIu7Jd3j2lKhefUuAVRdx6/OjbifZggla4koL6UrMWj1lMP02TlQK
	pqxC+Xu/C8j6G7EAROTipGzj4eLJWnLaHAADedF7lRnLiZ8cjAGUTX8FcGd1QvRxCyS7QZZTrjS
	/sOkv9gCGJh713GYmLdUKl05CUZ7EFkbhPIR9/N0sp+rDN91lt44IcTmiSbTECwXeZqWoNBkRLF
	DrU6zaFqZGxJ9Nud1HGgIpOrqgdCEILNbHXViaIFhf90Wkz8hMypcVHB/ThriwQyS8cvLXSDYNT
	b15V68LL7bOxw+qm9sc1lM=
X-Received: by 2002:a05:6000:617:b0:48d:f160:efad with SMTP id ffacd0b85a97d-48e1e9f12c3mr3046877f8f.30.1792481421580;
        Tue, 20 Oct 2026 00:30:21 -0700 (PDT)
Received: from kali ([102.209.31.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817d75sm4747712f8f.25.2026.10.20.00.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:30:21 -0700 (PDT)
From: Bashirah Lawal <bashirahlawal017@gmail.com>
To: outreachy@lists.linux.dev
Cc: Bashirah Lawal <bashirahlawal017@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt7601u: remove unused ee_read tracepoint
Date: Tue, 20 Oct 2026 03:29:46 -0400
Message-ID: <20261020072947.124586-1-bashirahlawal017@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_003026_131768_118ACEED 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.5 (+)
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

The ee_read trace event was added with the driver in commit
c869f77d6abb ("add mt7601u driver"), but no call to
trace_ee_read() has ever existed in the tree. Building with
UT=1 reports the tracepoint as unused.

Each unused trace event wastes several KB of kernel memory.
Remove it to avoid that waste.

Signed-off-by: Bashirah Lawal <bashirahlawal017@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/trace.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/trace.h b/drivers/net/wireless/mediatek/mt7601u/trace.h
index 07696b672161..208ab8b0117a 100644
--- a/drivers/net/wireless/mediatek/mt7601u/trace.h
+++ b/drivers/net/wireless/mediatek/mt7601u/trace.h
@@ -123,21 +123,6 @@ TRACE_EVENT(mt_vend_req,
 		  !!__entry->buf, __entry->buflen)
 );
 
-TRACE_EVENT(ee_read,
-	TP_PROTO(struct mt7601u_dev *dev, int offset, u16 val),
-	TP_ARGS(dev, offset, val),
-	TP_STRUCT__entry(
-		DEV_ENTRY
-		__field(int, o) __field(u16, v)
-	),
-	TP_fast_assign(
-		DEV_ASSIGN;
-		__entry->o = offset;
-		__entry->v = val;
-	),
-	TP_printk(DEV_PR_FMT "%04x=%04x", DEV_PR_ARG, __entry->o, __entry->v)
-);
-
 DECLARE_EVENT_CLASS(dev_rf_reg_evt,
 	TP_PROTO(struct mt7601u_dev *dev, u8 bank, u8 reg, u8 val),
 	TP_ARGS(dev, bank, reg, val),
-- 
2.53.0


