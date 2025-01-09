Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBA9E77199
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ui++7fz34GKZbY8fJxrOyiw8TD3D7+pRtsyH410bGL4=; b=vmF+R9geD14+wx
	rdcP11mzV4YiRXV1oh2SVHP/tgjhO/asCbZg92deVlNzoMjqLA49pwW1eGDXf0tOSMWktBRL2FDkZ
	iJmVnJ3Pjmr4ygeX26edn6+2jfLBiR/iI9zsdcTHWvF9r2JHdFkaX/AxzKFDbB6dLan+sPT2NT2IO
	2gjePeTO17r81KXCthoAciHvSNnjHCny2/e4kpFAfJZj/hln2v4gBBDI3Zo3LQS1xXys7LQGIl26I
	yeXteS/z+kUAMrrP9YfVDOg1zv6957R2O7/VCaTvIG3D6NbjSMc/G8LAv3p5uZfR802lPXuq66YgI
	B5guP4Eyb3x+sUAj8dng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuVr-0000000CUEI-0h1H;
	Thu, 09 Jan 2025 15:31:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuU0-0000000CTnE-25Q5
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jan 2025 15:30:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43635796b48so7254185e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2025 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736436603; x=1737041403; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ui++7fz34GKZbY8fJxrOyiw8TD3D7+pRtsyH410bGL4=;
        b=BK1zDJqDGcrlDH/VjKdb0vhIeSOov+CtuUFqd0+XESmCMNeV7s27hna3/Z8MW/nsiV
         59gBsnE1LWziJR2CKS4SONEDOLMqwV1oLatjr9LDLbEZ4MzXlUkx9M6HE9OTl5Dpwaf3
         xRwBNWQQSm+zeheoxLb6Irl+CvGr9MnHQyiZdxoWe1xX7L1BO5rHjz8HqO9xir4gsOql
         wC1VLdTjhi9eUg/ll9cdA/nkyvhp9UDKmmPTeoDwXMJbxH9xJBedLuf7Fr4naJSODdl6
         2dne3Da4gFutQmaN2J6fpIdYU2LjWv2cQUxzy5OuM1oq+YAbtNjAWNPAnYj7dJ3EGlpP
         d2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436603; x=1737041403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ui++7fz34GKZbY8fJxrOyiw8TD3D7+pRtsyH410bGL4=;
        b=XOicWAK1N+DEFi7laaPEj91LJeSeZN34ST7WtmqnXkOuVXMYJx5Fdf0BXWGpdaNEs/
         GaWGX2nCc7g/y3P1l9wfETkebXWQd41rHVWrU5d0KpvvYgW7Vc8KNN1TAxobMWS2g6+0
         yko8HZ3M1sVpf6nTUETGonXTOE4aPceeI8NHY9Nrg18bRukGz67XP+p/y3MDTCaNazCT
         YfmhW3nVvXqDvWwFUYZuJ8t6b2VwzY3LJbFCJ93ZxfCa1IcZmEtWcD/lb1jZJKOC1wGO
         1+cR1PNB8qZUNKLfb2xOWaudEwH0DF4AogCz0ZgQIK+jx969nDTn+c6WRv/fc023xiLT
         g+ag==
X-Forwarded-Encrypted: i=1; AJvYcCVJVQ+ZVwTDVKGWRHGorF0OfEcJvPzG9ZjqQOE0/Nsv09BPGrKj5QiHTCU5++LcoYcvFzMkU2xN4mXjb138Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLCzLCS1vHp7IDzjGTASTZZKtBJTtChVYDQG3bYT/7pCbWdQjJ
	jQn6ozhKn2AzlYELpovhT+Gatz+AhQORm5QaXokXq3NmLmO8uZ44FnlA61AaE/Y=
X-Gm-Gg: ASbGncsHUR12Dm4YtnwOIsgGjuX0VKakpF8/RRTTCHsFqw6gSISRirEZvha4GJsMjEK
	asQoUstkI9coUv8gsHUZumqxiKMHlTJeMgJqTqaTnbaPZvv3ddOYjZbTI+Ua4UmXojZ08v2yTWD
	L9eqg9bXQj2/m8+ZCjZ/gi5YLx6xN3B5NEi+b508ST0wPD6Q6dAC2vAmcEFaEvcrOMYaZ6ogwss
	dEx01us5sxXMTyu96j37Nf1SjvBmF8HTnMhD0gD4jIPzq+MQLGUVqRy7Jo=
X-Google-Smtp-Source: AGHT+IESEIosHxIgZW6pfGN37jB+1SZ6af3hY/XwSnu7UbwNBffzVz+YXNgg1d15dRMaOLI3zib2aw==
X-Received: by 2002:a05:600c:4e43:b0:434:fddf:5c06 with SMTP id 5b1f17b1804b1-436e9d686f3mr23854545e9.1.1736436602912;
        Thu, 09 Jan 2025 07:30:02 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2df3610sm58307805e9.20.2025.01.09.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:30:02 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] Enable RTC for the MT6357
Date: Thu, 09 Jan 2025 16:29:50 +0100
Message-Id: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG7rf2cC/x2NQQqDMBAAvyJ77koSG6H9SvGwiZu6IGnZiAji3
 40eh2GYHQqrcIF3s4PyKkV+uYJ9NBAnyl9GGSuDM84ba17ImcLMqEvE4FJ6dp6SGz3UIFBhDEo
 5Tley9q3tUGN/ub9yku0efYbjOAEoLT/8eAAAAA==
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=606; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=pi3L0TZNyW+gb4rA9VnMXp8LC2gcMzm0O2i5QO+sp+g=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf+t5/shO0hxQN8k02k2mkITZ69XbCGjT/miBkOuz
 GtM49VCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3/reQAKCRArRkmdfjHURZp5D/
 0TaKWE8eyl/vEG7RaHLANL42Ymep1Hwe4a6NebC/W2NvNncoYaOY94DhnlFGHfg+2F7F2JJRVKxunq
 P12s2mr8NtBdYMPGdC2vAjzQ36YhUFIAHY4Tnxji6aW3UNvLKyF84vy2AGJhkx6nMKCNd0RPGkJiWl
 nqjkrKekSzCZwdDMS68tKAj+w2Y6YcUGV7LDuN0SdCmMMY8JWkseOOtYhAHqw0NcnYF6VayA886LoQ
 Q+Gw+tsP2CaXVOL3tyfywmrolG9ufPcsA4mpZTZBKCYf+zgfDfzB4AZ1s5P3on8rZhz1hnlltPT2yN
 NVcngc8oe9rEYaxXlFCx8vCwJYCh9OOBaCyd5b+H1ptFQZzbMS20MnAer0cF+F69x69cadrfqoTv01
 i5JwxVO1kercx1a8A4DM18shkyhzUV01fOl+lpmCZ869cVnhNiQ5BBhifI6aq70CqCunidVO1CMQsu
 sLlW1gKWZveod4lkQcy/449bn6mjzw+wgNhfjFc+8PqfcHJbqhd7NqskaQGEVClfPAxSELllcUp0vl
 yiYiPqzZWKfybXWt3JkCAuaMhfxnSYPieu2Ib9IAV2BjhwIOWOOeZfEIMe8n6ta7/RIT5kPFBI7GWS
 6LG1rSv2KDsQ8b67cSa5b/5zd8NTVfJwu8nNyQ3EVVHGX01oRs9+yuWkPLhA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_073004_803710_3F64BDDC 
X-CRM114-Status: UNSURE (   6.98  )
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

MT6357 PMIC's RTC use can use the MT6397 drivers with the MT6358 data.
Also, since kernel 6.6, a regression has been observed. The changes
responsible for the regression have been reverted.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      rtc: mt6359: add mt6357 support
      rtc: mt6359: fix year issue

 drivers/rtc/rtc-mt6397.c | 10 ++++++++++
 1 file changed, 10 insertions(+)
---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20250109-enable-rtc-b2ff435af2d5

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


