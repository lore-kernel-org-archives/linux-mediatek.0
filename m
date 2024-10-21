Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA91D17130
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 20:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i5o7EeCdMvEzq7yRLdAkRH1iPr5pT3dVlwDWigc6fCw=; b=qs6rVvuoo5+c/W
	1rNSNvgHjZXTV58nRNAXgaeBkKkTr/R9uzSQXmUVB7Vn/9VabtHP7nSdGBqwMSSN00TcvQ5ZHaX95
	zFMA/0ilc3Hl49CnIBT1+LNdRg/IYDhfIS5fN4a5B8jayI/JXKyzUUlrEbdHj+unD7EOs9Cx3mYJv
	AXXbwSj7mMcB9Rorko4vV8TKGE3GSVnoIxlVOPKR1nWQah8bUZ/JqHt0d1CSiB65hYpxqgh2YzOJ9
	RsbU9HzfLeyaLPNf04xmSa6k+myvUGkqQ9CTLogr1KHscyJPo1q10FmMa0gURQ+9/4F0cBeHXX8kT
	nTSlTUKFFxa28R13rdDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2z2U-00000008bsc-1Cwo;
	Mon, 21 Oct 2024 20:30:06 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2z0v-00000008bWN-401Z;
	Mon, 21 Oct 2024 20:28:31 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37d49ffaba6so3424703f8f.0;
        Mon, 21 Oct 2024 13:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542507; x=1730147307; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5o7EeCdMvEzq7yRLdAkRH1iPr5pT3dVlwDWigc6fCw=;
        b=LdOZlCAgsooDZed85AWP23dcyho9m5ef+wl7Yo1McqlSA94sjM8Xm28NyQPAkBgvQH
         xzQhaJJLW6WsgaNRQ+EKheyKgwT4s38pN8bO9UzhrbXqpMXoGiUcZiHcwbQWqDEMcHKy
         GhiXiRs9Ov24YdbTj8kdo1v+uU6HR14+1z9skJO3yQu3eI9SB9/0gIa7PLrjN8JqU3Iq
         SY/S5KCyYPqoaOOhCEAyyKHEj9mYDuO0gOw1PhFfeps2a+wGTEr3RGY1bxCxDQbcW6Ti
         FykAThpccRCCQ8kaEIThTC4UvibpwIJYP6tu2nbkuhJBgQ+RlUlG/9ahB2i5lHGXlaII
         DzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542507; x=1730147307;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5o7EeCdMvEzq7yRLdAkRH1iPr5pT3dVlwDWigc6fCw=;
        b=GAdCoCijSzzb521i5Gt3zkrVCBzg0haDY8Gt1OqmJ1Su1ZFvROIZeZV5+xVr1/gWr7
         I0Ww3SF6lCRBJskjL+6JujeX/CNmOqQknHpIpgk4u8l56znumM6h8sArin8nLIhYCRBe
         imm+xdj9lEv+CT+KieRVVsRauOvtYi0PkTDVAffpDetOzXiJu6K+o1dPOLaYprU+0s1S
         gTbNO/bZXXw9LPW/T5NYJyf++usSMjZEG2mgmkYWvyzt6aYhnZ6GydU3zFh5NHVD2khA
         a0oKH1KA7KzphRqrjLL55EWXiAAmfvfX6Hs+XC1EwT0ssxcLTsZWL9O+Ceu5yzlB9MDP
         NuVA==
X-Forwarded-Encrypted: i=1; AJvYcCU6r0JAFDa8bXYdy1c8BbTaFQqL9ukdEjeBFQHFFudaNyKP2iKAz8nOHxbV71Gud8j6zgCGHUw/uXwLIwrW4e0=@lists.infradead.org, AJvYcCVTXsZt1nfczBZlfwgNm5X9ifoZJ84TXZbkpa1LzXOPKe/UL3DM3PPjWe8AB5KRPvx15uwQbi8dl3/PE3EFf5YF@lists.infradead.org, AJvYcCWnEpi/+3seZNJQ8n79WZXCQbhsPWegb1dGQDdG7DzT+Lr5coPoHIYHVvbTIZ9cNpth+HWxTnQCSbqW5hNJX292Rw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4OJ5BMb3uvnBkDslZhO/J4js2UwG/47HM5L01FwdDa2F8LjyT
	FNPBxPObySgj1Ile7LCp2Es8PtVs7xjAdvCdXp2BjN6EHm9W7bS/zz4HF6VQ
X-Google-Smtp-Source: AGHT+IHrlU3klozvzeCVSF9Ythhy9wGpMdSW2YhVNiW7ShV97wNTQiTfKFg7ugD/+MD3/YZLWARfDg==
X-Received: by 2002:a05:6000:dcb:b0:37d:46f4:35 with SMTP id ffacd0b85a97d-37ef0bf74b4mr689047f8f.45.1729542506871;
        Mon, 21 Oct 2024 13:28:26 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-023d-d91a-ee8e-da73.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:23d:d91a:ee8e:da73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a5b98asm5093263f8f.61.2024.10.21.13.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:28:26 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH v3 0/2] input: automate of_node_put() calls for device_node
Date: Mon, 21 Oct 2024 22:28:22 +0200
Message-Id: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGa5FmcC/33NSwqDMBSF4a1Ixk1JohbTUfdRiuRxoxeqkUSlR
 dx7o3TgyOF/Bt9ZSISAEMk9W0iAGSP6PkV+yYhpVd8ARZuaCCYKzpik2A/TWKtp9J0aofau7r2
 FOo2UawXSlYYJK0kChgAOPzv+fKVuMY4+fPevmW/rn+XsjJ05ZRS0uQmeV0676tF0Ct9X4zuys
 bM4UOKcEpRTa8GUlS60lHCk1nX9AbPbcuQPAQAA
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729542504; l=1269;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1qMfZzt/NOP0BK2K2RoHBVzgF0yz/1K6FGAfAOL2CFA=;
 b=2bwV68x9h4TkspBN1svwKfo8p5XoTWoZFgQB3pz8uj2Wwx1r5Q4ZIAmKXsmu57guPApCKi5ro
 8cjJGS1XCxfDuiQpm4fvUGJBQfGeRsbUpsQHbxMnvD5GJ/OwC90vYRD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_132830_034667_01878B9E 
X-CRM114-Status: UNSURE (   9.55  )
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

The first patch of the series provides device managed memory, which
simplifies bbc_bee_probe() and removes the need for the goto
instructions That also prepares the function for the second patch where
the cleanup attribute is used for 'dp'.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Changes in v3:
- Add patch to use device managed memory and simplify the code by
  dropping labels in bbc_beep_probe().
- Link to v2: https://lore.kernel.org/r/20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com

Changes in v2:
- rebase onto input/next, drop applied patches.
- sparcspkr: drop goto before node declaration and return -ENOMEM.
- Link to v1: https://lore.kernel.org/r/20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com

---
Javier Carrasco (2):
      Input: sparcspkr - use device managed memory for 'state'
      Input: sparcspkr - use cleanup facility for device_node

 drivers/input/misc/sparcspkr.c | 45 ++++++++++++++----------------------------
 1 file changed, 15 insertions(+), 30 deletions(-)
---
base-commit: d0c3a7aa814c091843ccca467c02078db9da4e1e
change-id: 20241009-input_automate_of_node_put-1bae9f5c02d9

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


