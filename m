Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80541C5AD5A
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2026 11:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ptK48I+o/8rObdtxGC8ySPWO1bsJQ+ZYfLF90RICns=; b=EpIHnAV+JtwjXqoJxZkoGm2ipB
	5sWb6kJnXMk81C3/U9MoG+wIQV1sKf7LfbXPd87mTf2cCKvZpqY5qq9Aip/ETkwXbDIDsYXnpUJVA
	rtLvsvDV5byHUoy5LWaGKg1Nj60OknsxDZqV5rYNJEU2dbaxnipj2LfMlbQSMTUXx2kcE7SbqqIP1
	0K82IdBVjuuMJG/ozzJf2GzI/mFRUlx3dtX8Jps7Hl68kncoCtzbCC8RjPAQHWuJjx0rlPS3GGp1/
	scqTCIHkSqMA0SRqJ+vBBC5OUp1YNU5D52Ls66hy99Ii+WuVchCxKPn9cwTdynEKhhS6A31RNmOFq
	B0IOln9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvC8z-00000003leR-1ydE;
	Sat, 15 Aug 2026 11:01:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvC8t-00000003ld7-0PHT
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Aug 2026 11:01:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4994c49f588so15763285e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Aug 2026 04:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786791693; x=1787396493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ptK48I+o/8rObdtxGC8ySPWO1bsJQ+ZYfLF90RICns=;
        b=tFLaLaSRR79aThTDbhIu9b4geaDd+mGp8zVHN+cyQxEqYcjSO4mDpJtWv99Q+pXLeE
         4rt9sAND0bl2tvHcAusnXZOcbHJ6h4Nc79HVDEye8aJLXBCYPewmxQgyFCXxYDimdbMU
         spvSo/puUTTqyG66zUx0epZUE6IrKLfDT2PJVlPoiEzpdMU1sks6HWwq+8FgFjjocuAk
         0DG2XG62D8rZSVn25PqeEU9Sd/n+JcahOmoAgRPadj9D8EC7yO8YUZAfM7vwRs9vqBia
         CxU0f8s42Qp4ViCfHL39QTofwseR1TbSFKVZ2Ch6cBddqwVNUCRruoxKOmbYd36H6c4o
         /nbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786791693; x=1787396493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ptK48I+o/8rObdtxGC8ySPWO1bsJQ+ZYfLF90RICns=;
        b=orJnbhFZ7yrr3V5DNHBxUtaoMhitiAq3kvbQC9KRrx2NHyA/s6526s+vXfIjl7I56f
         LfG5g9AHoFfmA6KNHo184yfQux6XCL7EICQUdf1GH2MQNFIp6nQ614p0XYvefd4ygLCq
         ymypJaEEsQe18aCWSdbZaWwDRkZTIAiyoPkXxJpA/xINBkk3pw0HJQDfqHqQf6JDd2e1
         5MnC/DZEXBN2sIkEYTFWgdG/WdJpG/IdSyW3otwDHPxYcd/b0rd6OeMTBbIKMHqHSGjy
         SIAGQBSHrHCA+tOKl2cze8FJNtvJkf/T7bPv/a66yePPOtSCr8kbm6bhWQ4YFrmELufv
         kkVA==
X-Forwarded-Encrypted: i=1; AHgh+RrpCaNWL3Yw8yap3gmgKBNzkJu5MIq/OjJMhIffDD3wkGCq8rv7zrgESdibTZg43nfbOdWSqWkURTbKS/p+oA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3XXu/oam2v0SumS6imKKImZ7nneAaYEL7dEDXJPWurtqvkocR
	oNTQcTrYwXGMSq/Tc+5mkMaEtQCgh0teZvoYZsLTDzDty8sJUun23CXS
X-Gm-Gg: AR+sD11ORIN25MMAv6v7E6Ns02UqwevUZfKwUHdAepkud1hPHwUeJdZ6IiDlo712C1u
	Kn2YsRMxpEaAmCLUSDqSv3OJEywzSRqEOQmfXBCCe+WxaT2YFNfaolqMuvi63QJifVq2tO7sxI0
	hhgVlf4mPZE0tGywwk5ssXf1uFfdvbv2+FWEAvgMPpC7Sd5iEJY/gbRmSVgpv+99x/fD7UL9lBT
	pIxk32ZkBwF2GMgPtXc3CvQpIxZZARaNA6tob8I+YoVNK9fbmqTsL0SoVAnY7+sQeR4jLKx8TEG
	B1bQd+8B+yWEpQ88i+S6tKLZcD+e6IUMftz60LoWbi1hYQOxVNXpcAODgmaKGWQouegQqbmZChJ
	pNqNOajo3dln3ki2Cc8m4iXoq5hDR3dEvNYjEqOapK8q2jD283NRYSbJDUuwsPZRAPhJn61HLNI
	7yqpC16ndlkMeG3qExUSygCkkXIiRKiDpMfVbsjrk0NJzIu3TUvIcqTrcDAGb2XVGaaSjAbdnH2
	g1KgCV8cduUMQ==
X-Received: by 2002:a05:600c:4e14:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-49987a4f03bmr179458435e9.2.1786791693056;
        Sat, 15 Aug 2026 04:01:33 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([185.19.153.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988b1d8f4sm133728035e9.11.2026.08.15.04.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 04:01:32 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: Jing Cai <jing.cai@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ismail Tarim <ismailtarim7@gmail.com>
Subject: [PATCH 1/2] Bluetooth: btmtk: Fix btmtk_usb_subsys_reset() reporting success on failure
Date: Sat, 15 Aug 2026 14:01:18 +0300
Message-ID: <20260815110119.11301-2-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815110119.11301-1-ismailtarim7@gmail.com>
References: <20260815110119.11301-1-ismailtarim7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_040135_148761_DC65D3E5 
X-CRM114-Status: GOOD (  12.80  )
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

btmtk_usb_subsys_reset() validates the subsystem reset by reading the
chip id back. When that read succeeds at the bus level but yields an id
of zero, the reset has demonstrably not taken effect: the function logs
"Can't get device id, subsys reset fail." and then returns the return
value of btmtk_usb_id_get(), which in that case is zero, i.e. success.

btusb_mtk_reset() returns that value unchanged, so its caller cannot
tell a completed reset from a failed one.

Return -ENODEV when the chip id reads back as zero, leaving the existing
MT6639 exemption intact.

Observed on an MT7902 [13d3:3579] where the controller firmware asserts
and the subsequent subsystem reset fails, yet the driver continues as if
the reset had succeeded:

  Bluetooth: hci0: Mediatek coredump end
  Bluetooth: hci0: Can't get device id, subsys reset fail.
  usb 3-10: reset high-speed USB device number 5 using xhci_hcd
  usb 3-10: device descriptor read/64, error -110
  usb usb3-port10: attempt power cycle
  usb usb3-port10: unable to enumerate USB device

Note that this corrects the error reporting only; it does not by itself
make the controller recoverable in the case above.

Fixes: 25b6d7593a3a ("Bluetooth: btmtk: introduce btmtk reset work")
Signed-off-by: Ismail Tarim <ismailtarim7@gmail.com>
---
 drivers/bluetooth/btmtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 66b346761043..dc702c0a6034 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -968,8 +968,10 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	}
 
 	err = btmtk_usb_id_get(hdev, 0x70010200, &val);
-	if (err || (!val && dev_id != 0x6639))
+	if (err || (!val && dev_id != 0x6639)) {
 		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
+		return err ? err : -ENODEV;
+	}
 
 	return err;
 }
-- 
2.55.0


