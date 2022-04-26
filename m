Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A05C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xgk7XQT9Z/q5Uhc3nmtryUhLUxcUovuht0mWj3FCFPU=; b=b3mPzsiMERhlgJ
	LFESewoDWTNmby/oEQ4t5+p+z8DbyFkzBwKR+uXl0GG/gO1yEpP2u4O2RPK/i+p40N8Ivcj+C9nZv
	iLpJ2QpOulWd2LOojenQVjHuCEUcoiDlJ9QD29d+lMNr63UG9l+yFP63nJN3Bc6PutnhmlZ7TRr7u
	VewQ/iJfVDB65gXCKEuXo3hR/ewTQuBPGVJBvCle0WiwHmyIxOhZlbQOTii5HmQMxr0r/hfmagPIb
	7OHRJrzI45BTAsGUEs76IOsXYo+7Zsc12rq3rVIqbqGQpahxOsb78r3rfJGDl2C9v22FLzHc9KpHE
	fS4lHyf/iVTFFzOdjOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLTU-00EhJM-DM; Tue, 26 Apr 2022 13:43:28 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLRu-00EgVE-I1
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:41:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id x18so25590416wrc.0
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=98be7VaWI1FVttC7RvlhLJwmj9qs7UGE+NZn3VSqAtg=;
 b=Pbj0OfI4V/t1u9ac6xyIKXnchXbAqtkvUHs1rqVFJya8ymcwqs8Il383TnyxBn5B1l
 LSJuNObN/ThcXf/txodC6nvfOv2PUPx7a8wdUebnQMzYtVOWO9d4IMipCT4LyBiE4eC6
 bd4Q9/s4JELRvY9j6vCwnbGw/nJjm8CUQIfKpdHawbVo84oDjv2k5v3pvBvkOndVk8X/
 ++NWsHkIkdyT+CU1guzljb49bNRHpKcXodgnUIOuua67N179aLJAGBc685jOO+qBxQgE
 gj3ps9MP+m832h2jdZEsBcPweQy19rdCkIsFLYFyv1yk7GG9+5Wb1LWDNFlVZe1Cst7g
 Wn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=98be7VaWI1FVttC7RvlhLJwmj9qs7UGE+NZn3VSqAtg=;
 b=U1KDV1xMolYByKjsmGUZgkKFOxQYUQ5FQywPJeaChoknfYCVavsC5T641htgmsH4Rj
 V1+3nYfVkXNLTgc7YVBalTXA1whBUvucOeeaXQ6qka0V87tgoR2YUGdFYe+eJBETkl4h
 hnUFbA8IAM6DkwA8cJK2lqiXgLyxTYhy8gtavbXCNe67Bg7pwR2wivnwKKi98SVsGX+g
 mo99+gh3euR19VwlMPLCsEzVhsM+AdQE9vbY0XjBD0maIXzVXR3DHhu7lt4aJrEhfShb
 9Tlhh30d8QZNgT7D0EpuVxebIGKyx7e+7q+xteyAZTzaFHfcxusgDKFb5+srVc1YeC4j
 /lEA==
X-Gm-Message-State: AOAM532zaU3DJcPOIaetAo7bTVLvarQHU7O8xH9lg5u7SWfcBqTDVZUW
 ILuohGY23Xsa9QCpYtyAKruknw==
X-Google-Smtp-Source: ABdhPJxU8JRwzSRWKf3zfkK1vXXYL9wk8vfoG6si7ovuizSw2uG5vgtrD+Bf877PT7txjxLyMdMTpA==
X-Received: by 2002:a5d:62d0:0:b0:20a:d834:6d79 with SMTP id
 o16-20020a5d62d0000000b0020ad8346d79mr9596756wrv.166.1650980506207; 
 Tue, 26 Apr 2022 06:41:46 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 b6-20020adfd1c6000000b0020aac8a9946sm13628475wrd.47.2022.04.26.06.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:41:45 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 0/7] arm64: dts: mediatek: mt8195-demo: Add more peripheral
 support
Date: Tue, 26 Apr 2022 15:40:58 +0200
Message-Id: <20220426134106.242353-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_064150_621636_EEB1B2AE 
X-CRM114-Status: UNSURE (   8.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series adds support for Ethernet, ssusb and uart1 for the MT8195 
Demo board.

This patch series is based on the MediaTek Maintainer for-next branch: [0]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=for-next

Biao Huang (2):
  arm64: dts: mediatek: mt8195: add ethernet device node
  arm64: dts: mediatek: mt8195-evb: enable ethernet

Fabien Parent (5):
  dt-bindings: usb: mediatek,mtu3: add binding for MT8195 SoC
  arm64: dts: mediatek: mt8195: add ssusb support
  arm64: dts: mediatek: mt8195-demo: enable ethernet
  arm64: dts: mediatek: mt8195-demo: Remove input-name property
  arm64: dts: mediatek: mt8195-demo: enable uart1

 .../bindings/usb/mediatek,mtu3.yaml           |   1 +
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  | 120 +++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |  95 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 107 ++++++++++++++--
 4 files changed, 311 insertions(+), 12 deletions(-)

-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
