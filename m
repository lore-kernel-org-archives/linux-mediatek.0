Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF4DFD4F2A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 20:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FCnsZqgY0C/inqnWcqsCfogd4Ir01+XklcEE3giunQ=; b=i1sovZmhs9wQ2wrYK0eYT5dwhl
	ogmnMSU1bVRJmo8UDys7h3l15V/jO09Y8u2/BljTlz/5G8xhlilZIDeiV35OyEdEJtzkjyedtSycs
	ckCaTPL49kp8MGUWTuRT40KSevS2PyDDnpUbGcqwKYr4bSFsWBM1boHyDEEKDoY9y8mKHdR/0Wp8B
	CQ58GME323PQ0iwXKhdXkjvwjNPNomTsc4U7PYYpSEyb30Ih7UffXzuHNiB75PpxECP433+RA7Mli
	DgF9IBqoY1fGlioDVbebDlB1DHv4aTq9qVziFBhl1AogBGsQSAa/mRlnbr4nxzKVDTlfCwMPHWk9z
	taW+R3WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03LN-0000000ADs0-3gpf;
	Tue, 10 Mar 2026 20:06:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03LL-0000000ADqB-0eJP
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 20:06:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-829756f3ee9so5955259b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173174; x=1773777974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FCnsZqgY0C/inqnWcqsCfogd4Ir01+XklcEE3giunQ=;
        b=Nw/6OKipbPcSjCe+tbX4Y6k/pLH/sa9SMvp+Q44DxnqwdkOQmp+lYPoA7kvDeUtqEn
         qo+AKZRjwgYp+DIV8FAn0zBnFrMDPLJ3770owQvDb6pQcgojuasU070ZU+2cjVLer8DH
         rSs9dXDubjvtHJvidwoiFm5wUfheFswccPCqg8PvCPFHyYuesl7fUzM6lXD4AR8h2hnp
         wTlu2KBdYM/QOEihoS17kouCuJFEH3R4fHyeth71mGFKNEhgV90+v1Odg4VjlXyEXsa7
         GInEWOtY0A1DTnA2cDyYcLyDuVFQWvOLJMpP6vkrHxi+e+bQmMgAi3lftlCeNNdLGqBf
         kmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173174; x=1773777974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FCnsZqgY0C/inqnWcqsCfogd4Ir01+XklcEE3giunQ=;
        b=k0mqOo7kFllwDVjGkR3qosjrkFrddLmjcNQzsmzwjQ4ii7O0vPigMPbJK9lZ15RjCl
         tMIY7D8gD0Fw3+01nH73TfnPqcunyNYVK8G4nKHUlsNe2BTHJVTTBdebVIbL7kTKMmyt
         60U91nRy7f32Uib1wFbSRMcBBuam+oDz7Tj30wMgMjMSywuWXfytucMVYLOZkafZGY3V
         JOTG7Wi75MECXNcWtpuA/cv7p9s8HNDHUDEyWz19sZJK5MEvaskxEvprHbZFxb74qt1z
         ZEwV23QzBgGfTYitkd4TVX8jpruUSk4YQ0Lf6Eebwtgk960SSadH7i62xBDhc+m6qGfN
         UZvA==
X-Forwarded-Encrypted: i=1; AJvYcCVYHGTkoXvu/wRNXAEBHaSJXHc8BQQv26oC1aKy8Ocs0AjkUkY0stKMTTbtHerVMGLNJuMT+M4FZEPfYIxtAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwJBKYDUhcLihUp7sX2uihCZbAYtyPK46eIaGakkZ0bjDBJC18
	ITHqtPwkSPNKMGtxPEjy/V2BpwtGv7n7gOUo5STHPurdexb71yD/b31I
X-Gm-Gg: ATEYQzw4NF3ZYp7dm6Q5fN7yWTIQFH1wsodEdlHQm2cQYVJQzufq/WjE8Pu6Zd3rXJY
	bryQjuUXMTOsvacTObPKIjLdaGaW/4sc91f9NjnVkQNIZV2XrrIfvvdPMV++T3moUCkbBUN8QKV
	BfblbC/9g5GDKKlnS86CZUP3ZQG6x8CFxWC//ysLgfNeAuOm8wopQokoh+ya0LUDERw/OBykHCJ
	eef26BBseUn2DA9nbnd5AYx1BbpxcgkBrcoIvs0ywWlbp5i5DpXblb611OdVj0/QIp11wyG2ar2
	HpNlP/+ZB1UjJTWcBwlQGrcjCHCZexbSv4JRSgjxqo6XZqSozzgAYDQ+TyY3F2TzrpWs5lZKzVs
	UUp2uf6vCwaDuavvo1mc653b18rGFt/AUx8H8dVmYExCn60wcRXiLwnuh4mWNyHvnd7uLk0FJC6
	p86ahctSuGZmvvE3KkYJ5RfKyCyxFNe19TloYVjN8mMdD8/EBw
X-Received: by 2002:a05:6a00:3d4e:b0:81c:6ca8:7ff8 with SMTP id d2e1a72fcca58-829f71c43f1mr119633b3a.61.1773173174414;
        Tue, 10 Mar 2026 13:06:14 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:14 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 4/7] media: mediatek: vcodec: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:10 +0530
Message-Id: <20260310200513.2162018-5-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130615_196402_341E5703 
X-CRM114-Status: UNSURE (   8.54  )
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 2da11521fc7b..3184939f793a 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -96,7 +96,7 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 	int total_len = 200 * (dbgfs->inst_count == 0 ? 1 : dbgfs->inst_count);
 	int used_len = 0, curr_len, ret;
 	bool dbgfs_index[MTK_VDEC_DBGFS_MAX] = {0};
-	char *buf = kmalloc(total_len, GFP_KERNEL);
+	char *buf __free(kfree) = kmalloc(total_len, GFP_KERNEL);
 
 	if (!buf)
 		return -ENOMEM;
@@ -134,7 +134,6 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 	mutex_unlock(&dbgfs->dbgfs_lock);
 read_buffer:
 	ret = simple_read_from_buffer(ubuf, count, ppos, buf, used_len);
-	kfree(buf);
 	return ret;
 }
 
-- 
2.34.1


