Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D12F89251
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2026 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kjPHv1Hru04ZXzIaQ9HvSw3rx3tnPbEFHQIlqAw5RuA=; b=PUkT+HqptMjAlYxs0aHR4DI8Mb
	kWFdQhbAEj/9MIMlzTg24NIEdzVZsj3U7nHElQH+zGs6uehqtz5pBURNW70Ko9NQxDkWJSpA0K//C
	6LGCiatcktsZi58o8MD7n9VoO3xulYBl5y6P7EdbnkAobJyk6lvYSh7sU0/hiwfok+DZCIObiWKM5
	I7K/qNcuvEpJCjjhPcyp57kBGHr6gpgYg4h2tgki09JZQ5FIlS2rUMBu5DoGG06Kre3O1zlWkNAeg
	PkaX+cyodEMyZW2ck+SECcbDY34uLvLJ7Wk+4gQXmXITszajjowzkEWUIC7JDGslLDa95w98DjNN6
	eBCoYctw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF94G-00000008V43-3hTk;
	Tue, 21 Apr 2026 11:15:00 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF94E-00000008V2a-0Hpq
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Apr 2026 11:14:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43fea39e066so3136707f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Apr 2026 04:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776770096; x=1777374896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjPHv1Hru04ZXzIaQ9HvSw3rx3tnPbEFHQIlqAw5RuA=;
        b=J0ZOUqKgpw44USLSgdS0Rli5y8hSP5vCRKaH6Dgi82bL5ZwBl5qzhfutOVE2oREqXU
         AUu6MfvN//JK6iArTqmBE9FyIPvhEay0Jr863GEU+Tfx/AJzBKIrIsE4em5vob3UABXV
         gZKiwQwt7CSVm0LZPqfTQFpqjHvvyFDgrWBPryMzvEwe/FUtwGGUKcc/i8T4J3mU2gYq
         ga/Sc6L1ZbDeQvyJOCxbtAVrjGXS/EZuiH4MTjwUSnqR7dVEpPbJpDJ3+39yWKAcRXRG
         2IFjY0Y0c4O80HrkRSyoCDdEfB0+9/MTL0O0+n/QWbDz6ryp1z0DgapJihD3sAFvPwLX
         THXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770096; x=1777374896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjPHv1Hru04ZXzIaQ9HvSw3rx3tnPbEFHQIlqAw5RuA=;
        b=DzUPYxcrN0s3X2Si4pAWK8jOh+/0XzfbBewDkRuQBJYaSKfM6Mrqw/KdpiDnudghrq
         C+HF2CrO4SkaPF37ih89ibyiA1spsKHsu5srxm7o38zfEk9LchKEX8JR/MtHa8XjMpoz
         VMVk9wOF/0FXXjYGb91Di2Yr8AxDrUlPeiEp/LIrrqqHzZ68iAiM3B9R4WAI1IQi/EQW
         rg++yHS/k49/TDfeLEs8LnRxyz6Zrvzu2VFa7YiBFJw5ayfB+QamgtNj6AWloI1AXjNV
         ImIZP+aHHKjLqG46taoGhNIlDIgYIjNVYkI0VE9K/7mEcWwDxHrt1n9WmrgMdW5FL0/X
         Lq8A==
X-Forwarded-Encrypted: i=1; AFNElJ9qMYudbk1UxjNsEASXpnalh6tx614qqErMMmUVB4GQBychv6m6RENcOTCo8/n3E5IrQwp4L3MJ038GhSisVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnIZzFeyjvNCGkmADX90PfboWg/TEagKTDHApXRjuGrRYAK/oB
	jC+/WYd0t9Dg+PKQwvEChhD5+7nRO2KHCjh0kL5+gY2Dbgsnpzslbic=
X-Gm-Gg: AeBDievet3UWNZTwYb3CrP8qwm38nl9ZFhS0Ej2D9c/WdKaQ3tdfSA7iRiYh+AVzNus
	bsWuNu/edo/WjF3Id2PwQ4t6ofirh5yS5EG/ecforGQHsG3ziUqlo58yx7B1Bw0FITK9bMS7zDO
	r0873IpkFXgdFxU0nUjiESXli0QNmlgC8JiAxXH6uuAsBCWEQRm7AYY0FlzEFt9GRL1OmES4CV1
	6VOHtKDmWQsZol1t/JnDfNH3yB8mSTK1tUy60brrdUQH3OMps8KE6ekmidXrhe4u7G07v1swBqI
	bcFiAsaRLs9WEiyl743g9eofg452p669d1ir4lyu+KT6sx8YntUBT8fJv4K8A8sXBxnNXv0od6b
	Fm5jLQPT0+dri4410PTwSjTEw3fZxVU/aRx2I4RktC3vaBKCKKtzYA6GK9PljOiY92NKSBDtZkb
	3P4vo=
X-Received: by 2002:a05:6000:1889:b0:43d:7b7b:ab76 with SMTP id ffacd0b85a97d-43fe3dc54ddmr27175189f8f.10.1776770095504;
        Tue, 21 Apr 2026 04:14:55 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm36910279f8f.0.2026.04.21.04.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:14:54 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Chen <mark-yw.chen@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v4] Bluetooth: btmtk: validate WMT event SKB length before struct access
Date: Tue, 21 Apr 2026 11:14:54 +0000
Message-ID: <20260421111454.3403059-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_041458_124988_296D3B4C 
X-CRM114-Status: GOOD (  10.85  )
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

From: Tristan Madani <tristan@talencesecurity.com>

btmtk_usb_hci_wmt_sync() casts the WMT event response SKB data to
struct btmtk_hci_wmt_evt (7 bytes) and struct btmtk_hci_wmt_evt_funcc
(9 bytes) without first checking that the SKB contains enough data.
A short firmware response causes out-of-bounds reads from SKB tailroom.

Use skb_pull_data() to validate and advance past the base WMT event
header. For the FUNC_CTRL case, pull the additional status field bytes
before accessing them.

Fixes: d019930b0049 ("Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v4:
  - Use skb_pull_data() instead of manual length checks, per
    Luiz Augusto von Dentz.

Changes in v3:
  - CI all pass (CheckPatch, BuildKernel, CheckSparse, etc.).
 drivers/bluetooth/btmtk.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 6fb6ca2748086..f70c1b0f89903 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -695,8 +695,13 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 	if (data->evt_skb == NULL)
 		goto err_free_wc;
 
-	/* Parse and handle the return WMT event */
-	wmt_evt = (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
+	wmt_evt = skb_pull_data(data->evt_skb, sizeof(*wmt_evt));
+	if (!wmt_evt) {
+		bt_dev_err(hdev, "WMT event too short (%u bytes)",
+			   data->evt_skb->len);
+		err = -EINVAL;
+		goto err_free_skb;
+	}
 	if (wmt_evt->whdr.op != hdr->op) {
 		bt_dev_err(hdev, "Wrong op received %d expected %d",
 			   wmt_evt->whdr.op, hdr->op);
@@ -712,6 +717,12 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 			status = BTMTK_WMT_PATCH_DONE;
 		break;
 	case BTMTK_WMT_FUNC_CTRL:
+		if (!skb_pull_data(data->evt_skb,
+				   sizeof(wmt_evt_funcc->status))) {
+			err = -EINVAL;
+			goto err_free_skb;
+		}
+
 		wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
 		if (be16_to_cpu(wmt_evt_funcc->status) == 0x404)
 			status = BTMTK_WMT_ON_DONE;
-- 
2.47.3


