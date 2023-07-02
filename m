Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1137EB64D9
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jul 2023 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RAuoFBXJGbrEK7r6lFPsWq6Du417iZcQuP9Eu+SLXPs=; b=flfVzWtDf9zCOueLvT4QhjX+q1
	XEjUo8cfuTbU726lCz8ji/InVobGFehe8mnBCIPxs3FFEC5dxZU4FqUPAY3oQARuRemW+shOzQYL8
	EQrei8fgxnYdeMWgaJnK1TonlF3RUx18j8O1KMgaHm7Ppn7MDhcn6cm6dJPIHuLODgcvjAcm6Bn+Z
	IQNh2Y5WSAtDKqIbz7BPIuF8gvhekeF8VRXoieZ1GD3l/3/KWdArhI90J3Dd9S+fm6wgpFgVHrAwR
	/QTvDEHAXBt9dWVcJyIIn45x+OaNkd/3p8IXtoB41hpgj1VbXEp25HEfdLp0YkADbG7PBzt4AUeRl
	0Ztbmu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG3eB-008aQT-1R;
	Sun, 02 Jul 2023 20:26:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG3e7-008aPK-1l
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Jul 2023 20:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688329568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RAuoFBXJGbrEK7r6lFPsWq6Du417iZcQuP9Eu+SLXPs=;
	b=i5fSoVu+JxqByZczP9BaA4ZzoS0GqFf+8xE8AawGSmRBduJMlCjrmAp5oE6/cUuhlsAojk
	m0GV/9c20cisBi0W9YZdBt+HQi1Kg4mIFXvi3BQahLrczryA9EAg5eiM83pdqvbOdHk9tR
	yoMAmaxJY5rZoZEq11IODMgfKsFmeGU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-owhRJm95NfWC1tqw2DEC2w-1; Sun, 02 Jul 2023 16:26:07 -0400
X-MC-Unique: owhRJm95NfWC1tqw2DEC2w-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-635e822b49eso25866526d6.2
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Jul 2023 13:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688329566; x=1690921566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAuoFBXJGbrEK7r6lFPsWq6Du417iZcQuP9Eu+SLXPs=;
        b=UT/BRnEZ1eIRSptX3RIDMQuNarfEtxUz6IlMc/TQ06ArzOzz5xyd+iSt7vr7UVOUkn
         mAaSkLUhen8nqUsSs/JHYaVh4XXkT9q2AkkQqlkh+qd1nH6rSEJgFXi+Att/rLXS57M9
         QyLoFkSem04Bzg5zva1sguiMoJ3Gz4Tfwp2FikCu0tF8RUBLRKyDgfeUpHNWVehdFWCL
         Yl6qD08SkLcp9tZogVHKWIZpcSvDmb5N9nGSch+A+zt8qoa7M6hiG9HM+IkbiXFR/Hox
         Zmq8RIZvsYqeTHRlTrsGHZno8Y5d6T//RSA8nEdkQP/crGUgwsA95277pfzNZHGL/XZZ
         MXjA==
X-Gm-Message-State: ABy/qLY5g9EN/Lr+1ChMa7paOXfNa/LFJSjMubzBlNJGideTKfWhSnE2
	UeSYotOEdqRL5DxZ9VmScNy93Jei1Z2eE4uzUORkK4sn7sExibiW1QTWOE9bka06RQ9HB3cWHVI
	6fNnbcPddb3aC3iJBfQYyC0yeZKbfnTPz
X-Received: by 2002:ad4:5fcd:0:b0:635:a1f5:5458 with SMTP id jq13-20020ad45fcd000000b00635a1f55458mr10055512qvb.12.1688329566487;
        Sun, 02 Jul 2023 13:26:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHAdOVmOK/0+cxD45eADjdrnL8vXwAqDR93DNfpbltexe47gg5n3KhEGJTHpGhBn8F7/mMyLw==
X-Received: by 2002:ad4:5fcd:0:b0:635:a1f5:5458 with SMTP id jq13-20020ad45fcd000000b00635a1f55458mr10055495qvb.12.1688329566186;
        Sun, 02 Jul 2023 13:26:06 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id g10-20020ad4510a000000b0063623c266easm4430335qvp.3.2023.07.02.13.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 13:26:05 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jing.cai@mediatek.com,
	sean.wang@mediatek.com,
	chris.lu@mediatek.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] Bluetooth: btmtk: fix handling of CONFIG_DEV_COREDUMP not being defined
Date: Sun,  2 Jul 2023 16:26:03 -0400
Message-Id: <20230702202603.3442724-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_132611_674434_BCDA85A0 
X-CRM114-Status: GOOD (  11.52  )
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

When CONFIG_DEV_COREDUMP is not defined, there is this error
drivers/bluetooth/btmtk.c: In function ‘btmtk_process_coredump’:
drivers/bluetooth/btmtk.c:386:44: error: ‘struct hci_dev’ has no member named ‘dump’
  386 |                 schedule_delayed_work(&hdev->dump.dump_timeout,
      |                                            ^~

The runtime IS_ENABLED(CONFIG_DEV_COREDUMP) is not enough to
prevent the compiletime error of accessing the dump element of hci_dev.
So switch to #ifdef.

Fixes: 872f8c253cb9 ("Bluetooth: btusb: mediatek: add MediaTek devcoredump support")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/bluetooth/btmtk.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 786f775196ae..12769e95bf55 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -369,11 +369,9 @@ EXPORT_SYMBOL_GPL(btmtk_register_coredump);
 
 int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 {
+	int err = 0;
+#ifdef CONFIG_DEV_COREDUMP
 	struct btmediatek_data *data = hci_get_priv(hdev);
-	int err;
-
-	if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
-		return 0;
 
 	switch (data->cd_info.state) {
 	case HCI_DEVCOREDUMP_IDLE:
@@ -407,7 +405,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
 
 	if (err < 0)
 		kfree_skb(skb);
-
+#endif
 	return err;
 }
 EXPORT_SYMBOL_GPL(btmtk_process_coredump);
-- 
2.27.0


