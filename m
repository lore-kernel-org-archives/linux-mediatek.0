Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBD7C5472F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 21:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiqObwJqOFQxxCp3toVLk+SJJNTrxf9JSKeAtkXKv6s=; b=h8izYK42IBiJHCBJqw9h+y4LiW
	LtlL1+UadBuvw2c4B67g+L7UU03ZnXsftfG12oVSI4ye/feoUbddiDEhNanWY2UGPlsgYJFVu8k4Q
	1DdPaOuntzmyNdp7UV1TLSUziQf9NkIGli6RG2hhkNsE0CrjwlLwXXk1lhQn1DQK9b2P4JSDvHPsC
	nYIFbxyWeQrOnd4q7lrwi4xVuzGQFNZtVmm/5RXOfjcfWA8wiklxwbCcScs6KF8C+o6gBSoQehhZk
	i4KP6k26A1u9UA5BiLZvf1jVeSmy1IQadgllRXw+oFQuNeSXEGW4bGN8cnrb9sHA4seVArTu+sLmV
	yy6+ToVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shbsu-00000000ih1-0Sw2;
	Fri, 23 Aug 2024 21:31:52 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shbso-00000000idY-1qM4;
	Fri, 23 Aug 2024 21:31:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724448701; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ac6dohFSVTSb5jp/QnPySydG6kjkUzo0sGuP3UOGb11G57D+AEYLxpD3X929KUm7gsS5u/pXD+xn5trxYqyAgqiTnD4wnUvWw7p2/Q0VpGXUZiUi1wXGz+vf4yeJ6KJAQWS7wTh97JWZzDG9Vt6rTuStZ0xAkdUaEgB8WTV6qdg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724448701; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NiqObwJqOFQxxCp3toVLk+SJJNTrxf9JSKeAtkXKv6s=; 
	b=hLZQ42cR9JfM/18fzWL7SMfNS6+0OgS5znoUwfPclE+LXCM7TETmoETG0i5lbRxK1j97bCGFxf6rLErrYGtFZsRHLv6E8CbYTPYK6C/RotlH8ujHXOygisn5BRNvfjXw5Ofd15z0SwNZL1DrefEXNC3urR1vZOsKR/f5jfbTlSI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724448701;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=NiqObwJqOFQxxCp3toVLk+SJJNTrxf9JSKeAtkXKv6s=;
	b=V/k1CnhR7y3DRjfko5tGFoSGjKoHNh03fgq1Y75G4OnTLXu7oiUbg4DMtpE1PItL
	vqqiNz+IaXQqncnRcyI1Dt0qXguEfrZEP18x2wkK7NUmRlT6K9ivdm5m97rt+WAdE4c
	zbeRucBk7k9MnLOCQpIw+8O6gloeZHhBX0sNGa7k=
Received: by mx.zohomail.com with SMTPS id 1724448700243697.4534880773641;
	Fri, 23 Aug 2024 14:31:40 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 23 Aug 2024 17:31:22 -0400
Subject: [PATCH 2/4] media: platform: mtk-mdp3: Remove useless variadic
 arguments from macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-mdp3-comp-cleanups-v1-2-1f8c1395ecd3@collabora.com>
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_143146_551088_EE65D3A6 
X-CRM114-Status: UNSURE (   8.39  )
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

A few macros declare variadic arguments even though the underlying
functions don't support them. Remove them.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
index 3e5d2da1c807..5bcd7f8c6edf 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.h
@@ -9,16 +9,16 @@
 
 #include "mtk-mdp3-cmdq.h"
 
-#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask, ...)	\
+#define MM_REG_WRITE_MASK(cmd, id, base, ofst, val, mask)	\
 	cmdq_pkt_write_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (mask), ##__VA_ARGS__)
+		(base) + (ofst), (val), (mask))
 
-#define MM_REG_WRITE(cmd, id, base, ofst, val, mask, ...)	\
+#define MM_REG_WRITE(cmd, id, base, ofst, val, mask)		\
 do {								\
 	typeof(mask) (m) = (mask);				\
 	MM_REG_WRITE_MASK(cmd, id, base, ofst, val,		\
 		(((m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
-			(0xffffffff) : (m), ##__VA_ARGS__);	\
+			(0xffffffff) : (m));			\
 } while (0)
 
 #define MM_REG_WAIT(cmd, evt)					\
@@ -49,19 +49,19 @@ do {								\
 	cmdq_pkt_set_event(&((c)->pkt), (e));			\
 } while (0)
 
-#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask, ...)	\
+#define MM_REG_POLL_MASK(cmd, id, base, ofst, val, _mask)	\
 do {								\
 	typeof(_mask) (_m) = (_mask);				\
 	cmdq_pkt_poll_mask(&((cmd)->pkt), id,			\
-		(base) + (ofst), (val), (_m), ##__VA_ARGS__);	\
+		(base) + (ofst), (val), (_m));			\
 } while (0)
 
-#define MM_REG_POLL(cmd, id, base, ofst, val, mask, ...)	\
+#define MM_REG_POLL(cmd, id, base, ofst, val, mask)		\
 do {								\
 	typeof(mask) (m) = (mask);				\
 	MM_REG_POLL_MASK((cmd), id, base, ofst, val,		\
 		(((m) & (ofst##_MASK)) == (ofst##_MASK)) ?	\
-			(0xffffffff) : (m), ##__VA_ARGS__);	\
+			(0xffffffff) : (m));			\
 } while (0)
 
 enum mtk_mdp_comp_id {

-- 
2.46.0


