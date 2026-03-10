Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE91FD4F2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=; b=SewsE3iH4KayzrqKwZKSuIWPI7
	UZKD+m8pL0Ag8/Depn2McaLi5Zq28dUXbloy23zW+qqDe5yxFTjz1Hw/cSDMLPuESvrmW4spsQ2Di
	u8CY4IbQ8wSevVANmv0p9pxCnEMSC3V1x585nFXyDg5WtQvcwdv1RIDN/OqRB2V1etkP8V/D33+2x
	bVqV8sLkfSQhc63UWkQWNnd0sJ9dsIuyrDoVGI8Vd1Kka7pTJXa4N9l4utdESiuX7oe8DodypgVzl
	Mys53AdwToW/+YlxixSvCJQIhIp/Cjvq4171aKoZUUKwpW7W1LcsiWyECFWpEVDkbztQ7fldp0W6+
	2MnJjO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03L1-0000000ADhp-1Lbk;
	Tue, 10 Mar 2026 20:05:55 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Ky-0000000ADey-1Hms
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 20:05:53 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-829781b2b01so4293212b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173151; x=1773777951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=;
        b=JwZ7Hm0z76hezYDC8n5Q9Nhywa9LmnE4ijvAxL5Yb7JadDuwNaRanDgGODMGqEyr8/
         Bi+hWTWlXfTygxDC1YVWrooOo0f87gBqwl2NttFxKqbkdpn0jX9haLsk5nnYafMB0+rk
         jk79NOYYnoBBsWx7OEgB/kv80/5xHhy0v47x8+tPHzT6K3zznGFgFpoYSnauJkhLlrgQ
         EpTUsJPJlxn9KP0g78nyAjOqW1G2DoeVrzBx8uQUsQ17CiZ4D8eURamEzTy8zkz2XX7H
         znEBGySnWr9QNTjHXNF34M7Y+KtI2KXpX0maUoJBG41UC+XscygVvF8M2hgrWiMAxI76
         pBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173151; x=1773777951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrH4PALLy5kRg8WwPkdWNLB7To1Zs5EdGhx79dnqSRo=;
        b=YvnrkExeDjh985bZ6/7fZxso9Tum68YTeii3WbNZsAx9nzQy0YCqR99WORFwZ5yAXQ
         QMrekQKZNLsh4F5zhPsdRNE7p9D8mrJKqer4sL+18prZ/Ov39X9QRU+2pWFP1rNhRnS+
         L1BzP48G4VDtsSx0r+EMF3zNf/zQjyKV6Zo/FwPwk9aJWDliPmulzA6FsHQUq3kgJix4
         ZLvF/U+dPY2Y+/D4+BeVUaNYF+QpvuEm/ocKkASxPWtQGVAL1b+z+uUs71cr0qRJj3/N
         mWaChfqKSpsS7bXajF27KAYjDEOS9eMTyuwktSrRaLqhBX6xY8vXA5eVQA3JDFH1QGru
         UXUw==
X-Forwarded-Encrypted: i=1; AJvYcCXyGlfB0cTsvOCGRUfuD22hkyM6Fd3UERl5yp43YQCrm/1H5/y6c8JlgiUEFDvMU6aRRA2lI5rZFtcmSbqiXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8cAI8ttjkKsDUrhp7oA7O6PkC2k0vOx9PdiX1BEDhXSDMJUCk
	f5YW78d6lpbj7lCLpq51HObpKvqyc+/M3CIj+ynCA328f+hdKJWxXeYI
X-Gm-Gg: ATEYQzytybqAaJDu41GGPlXSx6Ov6rTMvsxUI3Zn45aLvvDgxUY0kiIGJzP9lxC7jYr
	e+aCr6/hezybQ6UM6KB2bbHW7qNXvoR2+zF7+FKrf5z4a+KcqvStWqZ3GhJV7yUuXWi3jE6jWR1
	cfEQWVvWn3xD6aYAi3Szrr5jQ2vsFZAYf8HdfO6Vp+cVd7i1pHwZB1ErHFJe7xZtnId8Ios5/g2
	KEvfPJVw4ecjYgIgga3DwzbqQ8Hmf93aNpv1HMMAKxeWdnGlgvaA0skfCGBTYR9jdxg3++uzBol
	PnOU7oNDqnCJZGso7WTz2GauhB0p68Fr5l30pUjz5w37Db8ZB6HTGPirubP3JZnvadk5FzlDn4A
	scGdr/w/KxfdYTDATYYWKYcL0Rjz2j0lEA1AxO0PyzFvzXK1EOa+/seTZixsF6kmXiqhVSW8Vhc
	wAgPJy1bKyn6FEeEbk5ohJRj2DKLMavZvKT+fqXCUvooHP6fI/UyrZ5NnD6lM=
X-Received: by 2002:a05:6a00:1c9e:b0:829:88e7:c89e with SMTP id d2e1a72fcca58-829f6ee65abmr156570b3a.9.1773173151308;
        Tue, 10 Mar 2026 13:05:51 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:50 -0700 (PDT)
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
Subject: [PATCH 2/7] iio: ssp_sensors: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:08 +0530
Message-Id: <20260310200513.2162018-3-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130552_347718_34D8E938 
X-CRM114-Status: GOOD (  10.30  )
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
 drivers/iio/common/ssp_sensors/ssp_spi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/common/ssp_sensors/ssp_spi.c b/drivers/iio/common/ssp_sensors/ssp_spi.c
index 6c81c0385fb5..e76ef39c6b7c 100644
--- a/drivers/iio/common/ssp_sensors/ssp_spi.c
+++ b/drivers/iio/common/ssp_sensors/ssp_spi.c
@@ -331,7 +331,6 @@ static int ssp_parse_dataframe(struct ssp_data *data, char *dataframe, int len)
 /* threaded irq */
 int ssp_irq_msg(struct ssp_data *data)
 {
-	char *buffer;
 	u8 msg_type;
 	int ret;
 	u16 length, msg_options;
@@ -375,7 +374,7 @@ int ssp_irq_msg(struct ssp_data *data)
 			 * but the slave should not send such ones - it is to
 			 * check but let's handle this
 			 */
-			buffer = kmalloc(length, GFP_KERNEL | GFP_DMA);
+			char *buffer __free(kfree) = kmalloc(length, GFP_KERNEL | GFP_DMA);
 			if (!buffer) {
 				ret = -ENOMEM;
 				goto _unlock;
@@ -386,8 +385,6 @@ int ssp_irq_msg(struct ssp_data *data)
 			if (ret >= 0)
 				ret = -EPROTO;
 
-			kfree(buffer);
-
 			dev_err(SSP_DEV, "No match error %x\n",
 				msg_options);
 
@@ -420,20 +417,18 @@ int ssp_irq_msg(struct ssp_data *data)
 		mutex_unlock(&data->pending_lock);
 		break;
 	case SSP_HUB2AP_WRITE:
-		buffer = kzalloc(length, GFP_KERNEL | GFP_DMA);
+		char *buffer __free(kfree) = kzalloc(length, GFP_KERNEL | GFP_DMA);
 		if (!buffer)
 			return -ENOMEM;
 
 		ret = spi_read(data->spi, buffer, length);
 		if (ret < 0) {
 			dev_err(SSP_DEV, "spi read fail\n");
-			kfree(buffer);
 			break;
 		}
 
 		ret = ssp_parse_dataframe(data, buffer, length);
 
-		kfree(buffer);
 		break;
 
 	default:
-- 
2.34.1


