Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F7FF47CD0
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 21:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uMUvcEj/jfsJXhZHMSm5BagEwceXMMjDcklR+tqh0YI=; b=X2KBM6iBGQClOH
	KOCom6f4W9GAPuf/86PocBmcCYQbHn8wX3KifDFzwJvHJprFMQIyA4JwcCDkknZJ9gvplmzzeqV4D
	Cn8jFYXOMJn+FUtZhG6eDcpFZ2HohPRIT4D8v4EMbKmzOyHW3mSNhu2BfQgnBR12s2Dv5SUboYCFM
	OtwGkNn0Qm4chGP9vaetyHOFZdZ8UXOvQARszM9m7hb1TzCr+Jm51pwB1n/8Nf4gSVKxgrKii7tKu
	mCAtH3xRlRkyotQunyZYUsxWwe3qc8SKAqQ6K1hhuYaEaGjM3QljL1I2DpXgQrzoJEuTE4yz/wPmI
	UPDufLPW1mswUkK0pvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrK-00000002YL5-3lo0;
	Thu, 05 Mar 2026 21:03:50 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrI-00000002YJq-387Y
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 21:03:50 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-4648447e29bso3438518b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 13:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772744627; x=1773349427; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uMUvcEj/jfsJXhZHMSm5BagEwceXMMjDcklR+tqh0YI=;
        b=IVrSwSjl8ECg2Zb9+1qSOZUXz3HSNSR8BSLiEGAhUBHuJrIBBZ5hXo3OzkkEK32M6E
         DRY2Do8KwjDWzAPxKzpd4D4oqOzySLswqwuDT/X/27osAiTlUy6Pal9tu+dTNuEpMOTm
         YK8BXdCjtXxvpITYRwrWUk0sxX/I5r88TftkeITvgMS/7gUL0wn+OZxUR0MYNjrWD4xO
         lEwaQ8mmSEI/bCHJS6JbMFvAAlTzUXmsY6Sbzb+Oqm88p4qPjQpajPUcXfTiCAGIxWlW
         GdqSNJPQwzo0T2KAM3Sn3gkjGgWshC2To9+EFmiOkS953JYIcwA/CBin2xDNyRQ9SQwX
         AFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772744627; x=1773349427;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMUvcEj/jfsJXhZHMSm5BagEwceXMMjDcklR+tqh0YI=;
        b=CDGxMBH4zLDkZy9U8poN/tsr+gUnTCO9z7/HslxaQgxGcl3a379JDHIJqipc3aqW2r
         qcYzNhBTjnW8SSEthpfyP77Y8Y9gAc29ycarrK/AEd/u7hNnIR70aALYa4AlT+tBJZqg
         17bOJaYOts3eivzixZPCunQtEFEdUdg0mBlK2kfaOg8aKJgo1GKUJrE0/sbeCx6cr8tM
         czjWrq9DzKz7Pjq3Nc5To9Q3ZH0bI9SAJ/dbJAklM6nP6wvhAV0tTIPQIouzG6xNIJBh
         VEyRAR0dtMITGrtHFEioy+Q49q9lehNe78W9fxhdZqePqHtMW/XRoo43mkaVAIBUoUl8
         adOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuk3Hp5ZO01zhSlgBvVQrbKOdALHGFp9XDskTNNPbM5L/JMUDlv8M5Rr8KHcf7v33aqa+AmV/siFurY4rcNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyD6xVH5v1s+hEzIxj5BzrOK8rG8sAdwYqaK6kTXF3nFiM4iBUv
	jr93YJQ/nrgRRRR+QjfO7g4x79vaeZjoxsxrZPdvLDpEDaxanbVdQ4j0iAj20EUtkZ8=
X-Gm-Gg: ATEYQzw1JdPz678kv/uxOdR1DV2ET+SRk1jsfFm9VD7XudEtXMAFMAUfodMlRAokbD5
	fH13TIjzLRUpN3s48EEJ6hAkmMdYv1pdgbnKhnqvp9p00fW4iqkbnW6WqMgWQbqpIyruGECUvkL
	OPIR8sHmRAeVVDoDVpSLRXzaKwFr/AhwTTF+gfTO5tuAf8LE5F6X0w+6IfZEEeWY3m/5BT2ujjH
	WRVRuXc02wGQ9yzygOx0l3QUZ8iWgLd+56iIVxzs78spsrLrQ87k6YZWg4J3EKpXK3cZCsNrtd/
	+YxffaXpU/ggiRdMjcrv6us0b8ccZKmTVi0kYdMznMfk1IxZkVQt5x0voMkjAkPmO0I6EJZzkh2
	792waGPX+NyvU7l7iz4btiqYpdjPQl2xEcDpZ9U/YFL3k0sANs6QtlgKaNz3i2/M7iVcUVHCj5T
	nmeU/E6BN8TrULZFdJ1uVOZbePYdFZqR9GxLztQk4=
X-Received: by 2002:a05:6808:c2ab:b0:455:bf27:e95e with SMTP id 5614622812f47-4651ab1d6b0mr3573703b6e.1.1772744627481;
        Thu, 05 Mar 2026 13:03:47 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:874e:e775:4f67:b3a5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb5d0a8csm13729227b6e.14.2026.03.05.13.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:03:45 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v2 0/3] arm: dts: mediatek: fix pinctl node names
Date: Thu, 05 Mar 2026 15:03:15 -0600
Message-Id: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQqDMBCFryKz7pT8oNGuvEdxoXGsQzWRRKQi3
 r2pJ+jq8T0e3zsgUmCK8MgOCLRxZO8SqFsGdmzdi5D7xKCEKoQUBc7rGwf+pDSF0riws+uErp0
 JhzKvdJXrjnoDSbAESstL/mwSjxxXH/bra5O/9i/tJlGg1qU01gymJKq7dp+4C3S3fobmPM8v7
 sTGrMcAAAA=
X-Change-ID: 20260106-mtk-fix-mt7623-pinctl-name-f8593953bed7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=nCZZHuCOrSues8QVWXqMC3+FI2MpOSDkCrCh9OXFww0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpqe+WhDO5SBkuyTXjQeMiDCxhJ+2B7nXDuoYIk
 5tZG2mjU7CJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaanvlgAKCRDCzCAB/wGP
 wEg4B/9KENu8eGKx2Ux1CiqezA+SY9HupqER78ey4oFPO7seJ+znvkbjM4suVHJAMQSh+5NQ3U4
 g+49D/Nuf1O5XelRqVdmivXh9lSisE4Ae9a63KYim9Pcz7IvqGYctovpdU3KJ0wfY/DBKwCOetQ
 u8/RI8RLlhEzT+4O6drd63mip9IeCFaEE8eMpGxpDqUQbk6wr15DwI+AdJ/UqrXPal5mJWLx6NK
 RyJ8E2dGk7YDiYsRxm3WsTYkN4EZIqEa3gO18FhkUSLjpGohV/fahZT9qjbwQan1X6I5i4VmdBO
 p/Xc200kZ37fidWvtIbQ6Ed/8obcxanvcm7eCdo1IjBmUKiY
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_130348_793436_062E1F3E 
X-CRM114-Status: GOOD (  10.82  )
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

While passing by, I noticed that the pinctrl nodes in a couple of dtsi
files did not match the addresses in their reg properties. Here are some
patches to fix that.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
Changes in v2:
- Add a new patch to also fix the pinctrl child node names in the
  mt7623.dtsi file.
- Link to v1: https://lore.kernel.org/r/20260106-mtk-fix-mt7623-pinctl-name-v1-0-33817c7f78ee@baylibre.com

---
David Lechner (3):
      arm: dts: mediatek: mt7623: fix pinctrl child node names
      arm: dts: mediatek: mt7623: fix pinctrl controller node name
      arm: dts: mediatek: mt8135: fix pinctrl node name

 arch/arm/boot/dts/mediatek/mt7623.dtsi | 64 +++++++++++++++++-----------------
 arch/arm/boot/dts/mediatek/mt8135.dtsi |  2 +-
 2 files changed, 33 insertions(+), 33 deletions(-)
---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260106-mtk-fix-mt7623-pinctl-name-f8593953bed7

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


