Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B9BC98332
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Sep 2026 11:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=99nH7QFts5v2NXRQt1KjX/jXCkzUNSZrFGih2W857gE=; b=fPdWF5XYn+wF1V
	lVwz4Ag0VwzPVcjtfnGLS48GLRK69oopElI1TYqRRFGC+YAPCOklaT6Moezd6l4Az/CBV3QDaOQ8m
	z+rgUOiQUIBdJHrzK9rVxhuYQ7wV8bHt9zJ8gEHc7kYtKWbcUuSG742hlWwiG9Ighuurp081zSE9N
	O7aulZ1YuAZcFjsWiHI1rbQGJWEkYSFaOdnZLqiD7qWjFfAk4oOLHQmDs1AlQIxRzDC3S4FW/a2Uf
	yv+dvoqvKZhGQL2s+/SOqnj8ureFNXfvAJQtAiIk6Qi4VVCz8NYIA2iIAVrvQ0znAu/RA6rLSDsBY
	QU5dq0HdtVcd2NOe8H+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQTm-0000000FJrL-2gvE;
	Sat, 26 Sep 2026 11:22:06 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQTk-0000000FJqd-1NVv
	for linux-mediatek@lists.infradead.org;
	Sat, 26 Sep 2026 11:22:05 +0000
Received: by mail-pz2-x0c.google.com with SMTP id d2e1a72fcca58-8804c1728f9so1193837b3a.3
        for <linux-mediatek@lists.infradead.org>; Sat, 26 Sep 2026 04:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421723; x=1791026523; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=99nH7QFts5v2NXRQt1KjX/jXCkzUNSZrFGih2W857gE=;
        b=iYNGGVWfJU/sEOOz1WaI0wojnIUJdrjqZ0cpEXNyz9TYO689El+MT6XMPepDMe3SEf
         EV0A/94d66LdMW9VLw+Nm+S+KYPD9lJP8+PItiQeq1y8n1jhpBKDqgZlNKjL3P45aGMI
         T45dTBo9FhUJfzljbkKacqOX7GisQ+r+YaJM7APAd4IKrqWfhr414RxB03h3KNOv/JZO
         K5HD90GkWBw8ovaH9LqwkslNIzZsLG3rnAy4b2uqmj5k40lDwFMeUbAx3s8Efa9xRP9K
         HN5LnqWOWPQIJ6nc7X3c3lGTtJlnGheco8eizU089/DUYPmxak2Wp2Oxh6WWeO5n+h81
         cBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421723; x=1791026523;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=99nH7QFts5v2NXRQt1KjX/jXCkzUNSZrFGih2W857gE=;
        b=Q9W8naJlsP2aKgoXT+OJt1Kqj7a3sip4Lvt4e1mR2GVGaZbVFgGvxcBop2k1q2Qpg2
         mHwAGEhAiP8HRrrLx+6MzDh3VyQn+wTcRlk6ma0fgBZFT4MrZXqeEjV2GdAhK+0DDgmf
         qbSdQUHZe1YvpdFIvLy+AvIr84Zr9yLxshXYz/MUm7+ayHwS4OBjSOf3F2+DYnsWaq+S
         UjoYWXGjDI568D09ztawcz9zInM2icUNvMwdX+xTTIEfXGVqzJAFsI8lzKeKAQU0wZx0
         PPHL+Bw/Z85pRqbMTxZMtHZ4KaLEoHbfVhOAviyoa6MA+Dei5g6ZnjMwhwDfD+D8sqeA
         00JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzly7Sfa1TaCiNduORgHsjBifNJxQVnKyMHRbvn2IDXR0hkqtCUHaYCcixXRn7xt7Az2AprE+mwcVDaK0Vydg==@lists.infradead.org
X-Gm-Message-State: AFuF++na8TEoyc7bXGYjQi1052wNi2PmP8gBHVQ5t8OsNpFNlblCZ1O9
	ErJswqphzZ6CAgU/vs0iWtFEnukbvjSUu3R++//BbbTlfgrJduVnwDPAMcP34wx6
X-Gm-Gg: AYBFou1M3sAXov2ZPp38usJT10tj6vVfB5xBupp+id/WIi6sjmzL3z1V62XYmYwWGE+
	T47aXtDWXS9OE+wzdOedjdTRVwriCs6AafSldcvBqBmMEA0eZBtFRPrrk0oH2YFrSSuSvZ4lG13
	L14wn5uBCEdjbyFH4HwZp6mH3yQT6o1MQ10w/7GOIobuynbrtrg9i30q2CWUdxCg6ypA/Ez871y
	rv/iPQiC1q+bYQNvJwMkugql2uw5NxlVx6Nh2xdHYHbm/YZjHpxz6iRVAOQ+cZtpsQzOajbPPMp
	EQEHqWnlkGH8lU0yjI19EbN4ZBKQbUQ8+fASIqxOamkA4QUeV1Yjfz3mbFPmRXBqw1pfNyOwvkT
	gpLsmiw2md2h6jGFQR7UHCwsiCxfbKzW4ZUJKDIbgzcFwA/5HgCQm61lkSuZH9J6i8rWyZeArqd
	+GHf6aqvUA8oJ1OU86nTMpOxMXYnQgzzwD2RCUxH+eSV6mbJzURKytlLIFfTdAueePTTcgpvx3u
	ktH97FKHB2SlIJBj/tx
X-Received: by 2002:a17:902:d582:b0:2df:98b4:c294 with SMTP id d9443c01a7336-2df98b4cb7fmr28618195ad.61.1790421251744;
        Sat, 26 Sep 2026 04:14:11 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:10 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH 0/3] Add MT7629 TOPRGU reset support
Date: Sat, 26 Sep 2026 19:13:58 +0800
Message-Id: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ6CMBBA0auQWTsRq7bBqxgXbRlgEilkppgmh
 LtbXb7F/zsoCZPCo9lB6MPKS6q4nBqIk08jIffVYFpj285YDDecs7Omw7ysMm54jWEwzrsY7z3
 UbBUauPyXz1d18EoYxKc4/UZvTlvBRCWfZ6+ZBI7jC/yFE+yGAAAA
X-Change-ID: 20260926-b4-mt7629-toprgu-3cbf27a7cc5d
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_042204_370100_0DF4EDDC 
X-CRM114-Status: UNSURE (   6.84  )
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

Define all seven subsystem reset IDs documented in the MT7629 TOPRGU
SWSYSRST register and expose the reset controller in mt7629.dtsi.

Add MT7629 watchdog match data to cover reset IDs through bit 12. The
MT6589 fallback only allows IDs 0 through 11, leaving the CONN_MCU
reset inaccessible.

---
Chuanhong Guo (3):
      dt-bindings: reset: mediatek: add MT7629 TOPRGU reset indices
      watchdog: mediatek: add MT7629 reset controller support
      ARM: dts: mediatek: expose the MT7629 TOPRGU reset controller

 arch/arm/boot/dts/mediatek/mt7629.dtsi    | 1 +
 drivers/watchdog/mtk_wdt.c                | 6 ++++++
 include/dt-bindings/reset/mt7629-resets.h | 9 +++++++++
 3 files changed, 16 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-toprgu-3cbf27a7cc5d

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>


