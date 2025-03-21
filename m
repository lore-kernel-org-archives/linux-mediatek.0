Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF8CC36001
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ReU01VkkdQwGejdvSqZN3T6tHm1DJDLTnc3Lm0Bnfgg=; b=VwfBqpQnC5wYLI6F1q00W4bmEa
	qImXQX4mdUawvcA6NXkjxnhlvcHYN61yzQjoe9X7kLxiqcXz6QKw3CKLO2NohLXTjHgoZujTHX3gR
	/7ArFwT8XxOfuMR9nBgmrP1c5psOZDTXBy1v5wZiTElvVrEe/lvP2MBhOtgORCihi9ZtGoML3gL/K
	F3UDN+rk6Vsx0jOEfBn+WAVMrbrq9yFSs36xLMFMkv5IZznu5oMtOwvCcTggmbpESZFah2JqqQE4n
	gV7MJZNXSTrTX6Mm4qoT7/pNvwNsRQAxioYfAi0Am/Jmav7uYtNb9eZUEwzABQaeoSsbm14bioK+B
	W13DwaPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdas-0000000FATA-1hM5;
	Fri, 21 Mar 2025 14:43:30 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdTM-0000000F8Qk-0ZCz
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 14:35:45 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3914a5def6bso1267244f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Mar 2025 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567743; x=1743172543; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ReU01VkkdQwGejdvSqZN3T6tHm1DJDLTnc3Lm0Bnfgg=;
        b=Gx5foGS/ytVkL09tRmYnTEbOSB/2B9nO63fDo7LaafNa/EZlDbFHZkqPfz3l/iWzQp
         NgOpE2+piuiRFK3SzPxUoc9qB7K7+Cnx3ChRC6Mhs5u+PeRXA42EmHHSIo4O2w8zAW79
         oVd7RVqDPyfwYgTbO82CzgnsE1wMXTVxHF8AGqKuVGav+fLuNC8DumHgReEnKluKL/JY
         S+UwjaiSH9Gaqtc/OGPxj8sFOW+W837GpV0IIFpEu2iA1fKnDhxJ0/wcDvOm9wCmka8+
         aK0waz0GUr6X0J9tTOeaISrwB8Vr05fOH0lGxf8diPZg0YJK7yh/GsDEIUZhZqsfFxMM
         UyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567743; x=1743172543;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReU01VkkdQwGejdvSqZN3T6tHm1DJDLTnc3Lm0Bnfgg=;
        b=N7N4Uid47y4u/jEu5325n46FDbI5/H97HgUr4ZGkkFDoyz7FiRMrS9mXP/8g1+EMyV
         ehKYiTDsz7i9XIAjIYCJnzoJ+jeu91ja3g+7nkshB4nj3zfNdOiOJAc95WWAQfgZpOXj
         chMuzceH8Y2awWZzmtLfJyfOH387bxqAyB2PxMLPRVmzpcEpy9cr0QUNVyYCtGQ29ZlY
         1rkQTypLDMUY52zaVUqwQBn1ZmowDZ7byB1/DIuJLFTgu++QW0UXlHF5/0gZzzsTLbAU
         9XBkb5r5pj4VKvS/Ng5Q+ueaArJ2eOUf61aLyRkiVYxoMp3byy1Tl9Doed8zNsRSveDb
         8q3A==
X-Forwarded-Encrypted: i=1; AJvYcCUXD1VEEG40yQz5keJsGySH027E1pv1TLFHF7jbFVFCadD45BLthzgQU3W9e9VkHfRS0B1UrBLaLSCIO/Belg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8NCm2fHYha6V1QJSEOEd/J1Y6v0UsFPen5YEJKIo6CtEhDXWY
	Zh24ppJ+QMxVTW8lLzGW7p97tI+Dgoxg1wcro+X5XL5OmzFj9y4Lx/7FMqaP/IY=
X-Gm-Gg: ASbGncvVKgpCYqKqeUrooehxKcZapKFFvAVIO/NBXg47QOCTbxNxI/b29I7IBkzboS9
	Qsk1JEVnXMdR31OhLl7DqM9LbBeGOEF+RQIJCuum1VdfAl02QCl8jHp9u9eX141Ch5zVpx5oia+
	rrV0Ldym7jjzTB6XGEZFEo/5F80c2x/6iKNbNPc6R78Viz8t8KSPDTmj+apl+WU5f29MOGs7IhY
	1Axz9HyV4s896t12qQMOxtlu/lszzoUKsecyZDkyvf0t60Pw3FGKe1FMZ+if8pcrw5PZNzZYsEA
	3TlVcPr5rEe2zK7QgO8gdEKT2dAlt6mjkSF1cfL1BHI4PZjWaQ==
X-Google-Smtp-Source: AGHT+IGhlqCe2mLQ6QE1+jNsut/3HpyriKLoQPJNlU/O0xCCy9UTKeLE9FjCB0uErwEBPN5BJ/Tizg==
X-Received: by 2002:a5d:5f8c:0:b0:390:e7c1:59d3 with SMTP id ffacd0b85a97d-3997f8ee934mr2979865f8f.2.1742567742643;
        Fri, 21 Mar 2025 07:35:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9957aasm2571305f8f.10.2025.03.21.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:42 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Hao Zhang <hao.zhang@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mt76: mt7925: Fix logical vs bitwise typo
Message-ID: <d323a443-4e81-4064-8563-b62274b53ef4@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_073544_171572_208F6BB8 
X-CRM114-Status: GOOD (  10.69  )
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

This was supposed to be & instead of &&.

Fixes: f0317215b367 ("wifi: mt76: mt7925: add EHT control support based on the CLC data")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 63cb08f4d87c..79639be0d29a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -89,7 +89,7 @@ void mt7925_regd_be_ctrl(struct mt792x_dev *dev, u8 *alpha2)
 		}
 
 		/* Check the last one */
-		if (rule->flag && BIT(0))
+		if (rule->flag & BIT(0))
 			break;
 
 		pos += sizeof(*rule);
-- 
2.47.2


