Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BB1C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 18:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U1803zTu4Fg0CP/BNLJ3R5b7AQt4yDNGDjkErQd1zms=; b=l8Q7+zPJiIy+vAojBzzf1FKaTb
	9RkKBz1b7MJZ3v6kFfc+7FZxk+KnWk/dLfGqocjC0TYK8g9Kz3/uHeMPSsWI3136HUk4wb1s/OUwY
	hx8xSvnALbRvxyAs8PKMZ8Oh4MZ1t+lnOCJJIui8C846jfWnDDPzaMelWOaDW4pPdqFDEn/Lq6JWM
	qSuBiHR4YsgZulBGJVwZmYX8c1nM4p5IFk0HFl4IychXOcngG7J7c0aTF4KWsyXXGxOeGcyyXbfgF
	SSsDP5ae6H5nljOKsglZ91Jjo889pq0R97B1q+zvtQC0VKRWqFKuEHCwNpO4Ynfr1jbu3pwxfQBvJ
	tX1tM9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGMl-00000005YWt-0YdW;
	Fri, 10 Jul 2026 18:54:27 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiGMi-00000005YVt-3zWO
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 18:54:26 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-5bfa99f8ef8so681559e0c.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 11:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783709663; cv=none;
        d=google.com; s=arc-20260327;
        b=NddUvjymYEb0KQyX4pyJJ5DbvS1oCFXLnO774vEctLixmy7zPEci+tj7tcF1plaaLY
         eqsR5rSIsW5A4B4cq/50zCttfoY+IV6GvsLwSIz1HzcKjOhfYkjVnf/zxM2atbvrpYFH
         Wgl4as/8DvJanSGutsITYADoParrKDDRT/0/Tj36vRDnm9my7J50IlQO64LyX7uZn2y8
         Roljf0L+TazrsvbRJCBBg2tmndy5y48DFGnJzdhDN+x9/LYBF64SHvOIu5YTjkGR2CO1
         kH/j8tBxv0nGuQCCWDyynm3cTl/UI++S4ry7D2xduvtbP4KHO/iB0eGP7syGK8MRGThh
         XzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=U1803zTu4Fg0CP/BNLJ3R5b7AQt4yDNGDjkErQd1zms=;
        fh=cLQ0Kyokm5SXqjGixL7ZrohM8lYA1IBT8fnSkU8DLOk=;
        b=mx6JbLlFo/2Jwh+HyW/OpjDPpuzgl0VKWZh0uAJYteCDes3rbEdIyKDD6YfZT/hqIs
         sqDEXZEI7ooSUspfpIQewu74ICy8BWSuIpEP5eRbtZKGF+ts6qcU5Sn8elqpa0MPFy6+
         8PSTpSTInsOZvLAFlJD1zdRhQvHLgBLN7P8AMuYiGnWnXGIKA3o8SW7gpNX5QLkHojFY
         hrxW7eF3JDPCNFjbez8+oCygWZzsf27RuZ+bnxbT7jCkHLWo/yHMMDlS49anSNMrRfRx
         7siIzf7kzeOMiDD2c0n/Q/2BBSyg/HhqJuSz15DKq28nTQdMO9fly68W5RIfdkRJSUau
         DTEA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783709663; x=1784314463; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1803zTu4Fg0CP/BNLJ3R5b7AQt4yDNGDjkErQd1zms=;
        b=F5FmaJwn4+4WDB9Iq80gSqdzm/DHgBr9TfwYgqGeXPL40+/5qCeqB4SraXScXPr5lN
         mm1vRohvLVIQcmTeE0Rs5kryQcAYE9zSJGVIl8oCt5dE2QLRe+ytqZ/jzAQQ6Ho9BE7x
         IPCR27loUoT09v+dfU6ynQioCEYfroxhDDOG1zZ4cazJPPUMpHKrSQOXdLnHaIqbtfSE
         dqChfz3F+Bekw2LJckjT0FM+Yjm8upB3jSxBfnGbMU+luqSUOSvpcZM4NFGWYyrsdwwh
         h6P80PPv5/E7OXyAewHvcPHP2l21zAHR1ZSRGnpq/byAvwOLr9itx5LTTE7CiM+UG6P9
         wZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783709663; x=1784314463;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U1803zTu4Fg0CP/BNLJ3R5b7AQt4yDNGDjkErQd1zms=;
        b=hPX93bE2dtmMsBf7yV1szQ0ruQybEh3yHImWkR310/yg9lT53EglLYj8lH8o0tW0Xp
         cklXXOFH3UrIG+pNwoZyFc7A8iIA3m3t37YUMaHlH3XSPZ4cquNS/ieCYn+kQy+oC9P7
         igalQsCIJoTMPJRjmPjecW80ik+qxZT0zup0d1kovRZzeJuQ2H2GsHMZWMAltAzzN5iW
         UBacL78Mhl/6foXxEUbpzy2RJha8cD4De9RxOpd299ViQM+aU/n6Cs92zlEbh12PzIMO
         kFMi5/sPpcCcv9rx/HIxMV7NHXj0uAF9jV7c+KXUM48HAft+z4Xhb3Qi/wR9rdhbtby5
         40Uw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7Oe0S6vf09IIyvGCZnLbDitatvp/GGBy0u/e5BMXXKI12OSvMWADJqvwiRcWReWR0eraQD20U77JTSlY9/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZynHc1vQGhopZEqFR/OmWSsJTpO7WSPhLP05OqYdGCihvhK6T
	XQq71HWVb8dwlE0kMm9BvUeU/YAnbFvaGyC6Rsi0LhEQJ+b/twKNwwEp7aYkmwuEMZQ/Icr5+oR
	3kTwjFDX2swrx37mIOoa0Jsr9rcJwUt4=
X-Gm-Gg: AfdE7clytxtQXIJ9pRW1zZr5P+GMvgRRTAVDdmgdBz+Pvbmt2mSkcZRHAbtPRpdR94p
	Y9U6KwNeuVedxAEZtjqQDELNpOSE+NF+N89qb62Co4MrKmZGSjV5Ighkgy6Q+V4X9VWWxJGlb88
	Bya/hIKKohDpuH8gLbdGIXZ6iRJAmoYon6mmgFxb1d092MnSGPEMNjsWbz1qEhXTk8h/3n96zWz
	ZhBRR39iRNb5v6ZdW6cnp0tY0dhCNWEJzfbRaK6/UQaU23zrbHHdhtu2UeQqJQMdjOm9iw08g==
X-Received: by 2002:a05:6102:390f:b0:737:b102:c1b4 with SMTP id
 ada2fe7eead31-745367c8d49mr2858137.7.1783709663290; Fri, 10 Jul 2026 11:54:23
 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 11:54:22 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 11:54:22 -0700
MIME-Version: 1.0
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
Date: Fri, 10 Jul 2026 11:54:22 -0700
X-Gm-Features: AUfX_myFkMhQ48S_ET5-Cax5aTFnmBM1HO8JjqsVC_qYlOgexphFEfB2trXuj0o
Message-ID: <CAMyXUJmh=WfwC4_KHupNxYR5e2Gy5QhBDL5TSG6XEW-XLa+X4Q@mail.gmail.com>
Subject: [PATCH] wifi: mt76: mt7921: validate CLC firmware records
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_115425_008619_21762411 
X-CRM114-Status: GOOD (  11.85  )
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

The CLC region is supplied by firmware, but the loader trusts the
region count and each record length. A malformed image can make the
region table pointer precede the firmware buffer, make the record loop
fail to advance, or index phy->clc past its end. Validate the table and
record bounds before dereferencing or copying.

Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location
Control support")
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>

---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 28 +++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 25b9437250f7..564dd836e0b3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -415,7 +415,8 @@ static int mt7921_load_clc(struct mt792x_dev *dev,
const char *fw_name)
 	struct mt76_dev *mdev = &dev->mt76;
 	struct mt792x_phy *phy = &dev->phy;
 	const struct firmware *fw;
-	int ret, i, len, offset = 0;
+	size_t clc_len, fw_data_len, len, offset = 0;
+	int ret, i;
 	u8 *clc_base = NULL, hw_encap = 0;

 	dev->phy.clc_chan_conf = 0xff;
@@ -441,13 +442,21 @@ static int mt7921_load_clc(struct mt792x_dev
*dev, const char *fw_name)
 	}

 	hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
+	if (hdr->n_region > (fw->size - sizeof(*hdr)) / sizeof(*region)) {
+		dev_err(mdev->dev, "Invalid firmware region table\n");
+		ret = -EINVAL;
+		goto out;
+	}
+	fw_data_len = fw->size - sizeof(*hdr) -
+		      hdr->n_region * sizeof(*region);
+
 	for (i = 0; i < hdr->n_region; i++) {
 		region = (const void *)((const u8 *)hdr -
 					(hdr->n_region - i) * sizeof(*region));
 		len = le32_to_cpu(region->len);

 		/* check if we have valid buffer size */
-		if (offset + len > fw->size) {
+		if (len > fw_data_len - offset) {
 			dev_err(mdev->dev, "Invalid firmware region\n");
 			ret = -EINVAL;
 			goto out;
@@ -464,8 +473,19 @@ static int mt7921_load_clc(struct mt792x_dev
*dev, const char *fw_name)
 	if (!clc_base)
 		goto out;

-	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
+	for (offset = 0; offset < len; offset += clc_len) {
+		if (len - offset < sizeof(*clc)) {
+			ret = -EINVAL;
+			goto out;
+		}
+
 		clc = (const struct mt7921_clc *)(clc_base + offset);
+		clc_len = le32_to_cpu(clc->len);
+		if (clc_len < sizeof(*clc) || clc_len > len - offset ||
+		    clc->idx >= ARRAY_SIZE(phy->clc)) {
+			ret = -EINVAL;
+			goto out;
+		}

 		/* do not init buf again if chip reset triggered */
 		if (phy->clc[clc->idx])
@@ -477,7 +497,7 @@ static int mt7921_load_clc(struct mt792x_dev *dev,
const char *fw_name)
 			continue;

 		phy->clc[clc->idx] = devm_kmemdup(mdev->dev, clc,
-						  le32_to_cpu(clc->len),
+						  clc_len,
 						  GFP_KERNEL);

 		if (!phy->clc[clc->idx]) {

