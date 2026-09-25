Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838F6C9830D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 15:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vh1u+AU53kKhXv1QZx33pP/jyG36QNPJdJIMmE/yVT8=; b=QZAkmW4N7CHP6cuekGq5pZddek
	z/RXCwyPnFW2xnrkM+CfC6+vzuovCwfWHtKBBa8WVVlVuCn8rfXyiDqAlDwaq8+0Jjk8NytN+CYYW
	F8GSEJiTpR+vC24SkybKr3B1miqEjJHg/plNDIGWfRjVzUF3dD81d6CYI6wZYwuoqgFyZCh/CG7jp
	JJ/aHBeOwyj6Ry8f/O4Ss20fbucUuN66HC79o3kuVWB0koqqNgrCKQzG2XfbqYKBVRx4pGtzfNc73
	40EwblzeuYvls58ZBsAt4b44ik1ltzZoGJ6Y0BpfiB/WdUDMRmo3DR+HxmkV97yYGGkxscDpSRmkn
	lQyz8Ebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7VU-0000000Dhex-1NuE;
	Fri, 25 Sep 2026 15:06:36 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7VF-0000000DhVz-46s9;
	Fri, 25 Sep 2026 15:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=vh
	1u+AU53kKhXv1QZx33pP/jyG36QNPJdJIMmE/yVT8=; b=AqGpoukTycE0gDo13C
	C1yIOckO1Fgo7eCRuOYHL8uBoQ+sB4Y1cEBkFlu7tGsSScMbSLnvn34Fzs3fMl4Y
	KzINBKbwaB3BIjsj68Qr2Ichz2Yjco2d7TVaWFpFUbuCu51p2v1ruaUcJxxjzkqC
	VFIdoRPj7tNVPaSMg8jM9GMMg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3J8zYjbZq2yQpAw--.5414S2;
	Fri, 25 Sep 2026 23:06:01 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johan Hovold <johan@kernel.org>,
	Markus Theil <markus.theil@tu-ilmenau.de>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] wifi: mt76: fix USB copy source overreads
Date: Fri, 25 Sep 2026 23:05:53 +0800
Message-Id: <20260925150556.2304003-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3J8zYjbZq2yQpAw--.5414S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw15GFWUWF17uFyfCryrtFb_yoWkZrb_XF
	Wv9a4ft3W8JFZxtayakrWUAFW3Cayv9ryxCa4vqrWSq3y7tF1Uur1vvrn5Zw4Ika1Fkrsr
	Gr9rXw1Iv3sYgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUU0eH3UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BnhHGq2jdknpwAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_080622_426700_3D482608 
X-CRM114-Status: UNSURE (   8.32  )
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

The USB copy helpers round up the caller's length to four bytes and
then use the rounded length as the bound for memcpy() from the source
buffer. If the caller supplies a length that is not a multiple of four,
the final transfer reads one to three bytes past the source buffer.
The beacon write path can pass such an unaligned length.

The MMIO copy helpers already handle their unaligned tail through a
four-byte bounce buffer. Apply the same principle to the USB helpers:
keep the original length as the source-copy bound and zero the unused
bytes in the transmit buffer so that the register access width remains
four-byte aligned.

The two patches are independent and both apply to the same baseline:

  wifi: mt76: usb: fix source overread in mt76u_copy
  wifi: mt76: mt7615: usb: fix source overread in mt7663u_copy

Jiale Yao (2):
  wifi: mt76: usb: fix source overread in mt76u_copy
  wifi: mt76: mt7615: usb: fix source overread in mt7663u_copy

 drivers/net/wireless/mediatek/mt76/mt7615/usb.c | 17 ++++++++++++-----
 drivers/net/wireless/mediatek/mt76/usb.c        | 16 +++++++++++-----
 2 files changed, 23 insertions(+), 10 deletions(-)

-- 
2.34.1


