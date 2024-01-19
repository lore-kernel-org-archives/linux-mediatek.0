Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5DEC47DAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 14:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7R0rM+dfY8BfVM0tiwahRm291+uVOKMOygaYokiphA=; b=Yv7i3WqVJSoSUVWA98hS2chcnT
	eQ3w4sfKUr6v6lnSn0rzmvZPaIA/IwztxBuXYQTi7FF8iMx4P0FZQnWelwgfrBrAcvgcljk3fg2Hh
	0JeOBhJCmWjDy5UFElc1FpXiIVH5+GueT62RQWzWSZPfnB2XZ9C4tIPfy9CsBVnoQob1RsSrjRdY/
	WTh27HpOJhRvwo4Ks8Pf09XQUR8pwwuh5hlDTaBJ6uajJ1OJ1VmxxD04vKk9lAjSgGV1pT2x2oBTP
	hIOe+JMVkHu15D5MZUXlT2atFX7Ftw2V2Df/hJ+XlCwaJP4TNXi7ZM+kZQhUZL+BTAl6KeA7XFeH4
	wGGQ7BFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQpRB-005maV-1s;
	Fri, 19 Jan 2024 14:01:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQoRx-005ZfV-0u;
	Fri, 19 Jan 2024 12:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=L7R0rM+dfY8BfVM0tiwahRm291+uVOKMOygaYokiphA=; b=mXlph8ejYXaU+MlQlpY8YxxA1G
	+KTwkuuRgTkaxYxlN7XKTepP2X5blD+7B/lVMJIaKfNvV+afedRWEgRC+GW8vYLH8UPdy+HZ8IKQG
	tmxm4sat49Re15urvq//T6zqZQTPA9LUtziIfIF+XKJ//1HyYYclqLQOYJ/dk6JxKzRnJFRUH7tM3
	uMaMXkCr4xMakw8JMssvXc7EngSConoLBdS9GtF3WW6OJZ+2/CZwtW+Roa6+vfPzdbpSvM4+7og1u
	PlkLjic9ECqAwoxL7IofKlIEmZ9OAepqO93Hy5T1UFwNzT5sBnmity3zIyVVbjTb5Ga8/CfNsFW/a
	H67PKB2w==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rQoRu-00000001Ydk-11Fo;
	Fri, 19 Jan 2024 12:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705669096;
	bh=bGrbcVKvkDIoSfHBTxlivOML0alDs0Jm3cTz73DwTkU=;
	h=From:To:Cc:Subject:Date:From;
	b=AfvubQDPxx1z+zoJEr13Zm7CA4GIl5QXvLMMXzoULV6oQUHsAVLlwSLQrqWEojT4T
	 QFBS0scpSnOD0UwuwQLt+7SnZP4BD2NRskBqR8IgbM1qB8ZPUQUNAned1tTVR3cElo
	 i0OKPjxaaA5a+BlVnnqKOvcLwiAKnk/V/HhpXxTJFV+zp0TO6JSfkE94eYZotKpkjE
	 KdePlcbHbSM4DfVxYafEOvokgtyfhhpyJkooH6f/CsD6GMGnQ3ew2ufWD4w7bXl8Wb
	 63nEeQ+/U4IKpzefHJw4EKiinW7zWyBhwzWf/BxuLmNfTMjWHJsJEUBSCaCr2nOx2q
	 eBzNy5ZfOCuhg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4532437803EE;
	Fri, 19 Jan 2024 12:58:15 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	heikki.krogerus@linux.intel.com,
	matthias.bgg@gmail.com,
	dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org,
	andersson@kernel.org,
	nathan@kernel.org,
	luca.weiss@fairphone.com,
	tianping.fang@mediatek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/2] Add ITE IT5205 Passive MUX
Date: Fri, 19 Jan 2024 13:58:10 +0100
Message-ID: <20240119125812.239197-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_125818_454352_C5D87F9D 
X-CRM114-Status: GOOD (  10.12  )
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

This series adds a driver for the ITE IT5205/FN, found on various
MediaTek board designs, including the MT8395Genio 1200 EVB and
others following that.

Changes in v2:
 - Reordered headers and removed unused ones
 - Added a check for altmode in it5205_mux_set()

AngeloGioacchino Del Regno (2):
  dt-bindings: usb: Introduce ITE IT5205 Alt. Mode Passive MUX
  usb: typec: mux: Add ITE IT5205 Alternate Mode Passive MUX driver

 .../devicetree/bindings/usb/ite,it5205.yaml   |  72 +++++
 drivers/usb/typec/mux/Kconfig                 |  10 +
 drivers/usb/typec/mux/Makefile                |   1 +
 drivers/usb/typec/mux/it5205.c                | 294 ++++++++++++++++++
 4 files changed, 377 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/ite,it5205.yaml
 create mode 100644 drivers/usb/typec/mux/it5205.c

-- 
2.43.0


