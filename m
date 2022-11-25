Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB357C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 16:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FPfIcZ7oMFAWMErNOiDjIKAKPnIKu22VqMpx37ofk00=; b=h5+pIpTCex0VMx5Hin7ZkZpKDy
	l3M74Rjk6zJ8KM+2maIOraJ3fL3bQKSMraD1s3pS1TXRutTTVPVfMf92d8RFCFn+Mdx92x1RCK2TO
	7MR+lvCDdqSf3RGsdNUb8+4OmOB9V/137ng/37wqbl1ptolEnWKnIhBcI1njmh5RMmj+u/f8hdV87
	rBno1gkhvxKz42w9hScBx9jwkLcDKC19Lo1ZHFHuz5SPmBaZK6wl/nu/YVrZxNS3ntbCWE0BtxTuA
	Ss8hM1LmoA6zS8mmOFiCABtwCNA0xqILU+sbIVoWGNjD7IywHMMvlc4D83FlNXbnnUpXlOMZL4X9T
	oJlj4Rsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybYw-000JZn-MY; Fri, 25 Nov 2022 16:28:26 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oybYs-000JUR-Je
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 16:28:25 +0000
Received: by mail-ej1-x631.google.com with SMTP id kt23so11409979ejc.7
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 08:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FPfIcZ7oMFAWMErNOiDjIKAKPnIKu22VqMpx37ofk00=;
        b=aUwGVuMXyJgJCAsCUvWy3cRAnZdydVYshWa7vdWjNxFdJlX17LHfBZidw2jPsd6Ias
         rDsTEWcavVDqxeeofCi6uvNO79qiGVFMmDKKrrMomr8desXQAn9S2PY5T+eVfdHMFi/h
         8ty+kGBPgvn7HF22ZOAAZA0P+oYT/20dD8t9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPfIcZ7oMFAWMErNOiDjIKAKPnIKu22VqMpx37ofk00=;
        b=QCD9XG90iVHVm2y5OlsjwyqQE30vE9g7d8B7/VgonDQc9AknwWSW3LKk0GwdYI3fvv
         P2q4rKWipdpDi552MhwPVH7GPCk7g+lnRTMd/ZaR3zo2MyyRVAda+q9RasdzSmaBtgw0
         cbWR1ila81oYbuCFr6RIx7XJOiIvAKR5h2PuwjBfRqeQIrXB9oKH5JnFVv7G1XenVUNc
         G/aypyg6fdYTqdmZvmQmqciLyhU6VbniMyss7LFv5RNqnp0K1egjbSG6oQRZnTLIMU0u
         VsEt6r4C101zjvkh+nD5bACTOlScffSy5Na8VnMOUGe3a9fL16T/7q+E0haIOWOsH633
         JMFA==
X-Gm-Message-State: ANoB5pkDhcmrXTqFkJYq/xo0w7iKI3T+pM7GXRVmBw87hJ+S8Gis7eKG
	9WzotE2PKAKXnie9q5DxQkw6iA==
X-Google-Smtp-Source: AA0mqf5CoPt+3iMGVdMS5sptppyW5DW0OMpWoLkAdjvxpFJYpZ18xIoomWaaxApwBWBj+x5ZfUfApg==
X-Received: by 2002:a17:906:d8db:b0:7ba:8633:7f7b with SMTP id re27-20020a170906d8db00b007ba86337f7bmr9893641ejb.206.1669393699000;
        Fri, 25 Nov 2022 08:28:19 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id ud10-20020a170907c60a00b007b29eb8a4dbsm1771589ejc.13.2022.11.25.08.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 08:28:18 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 25 Nov 2022 17:28:10 +0100
Subject: [PATCH] iommu/mediatek: Fix crash on isr after kexec()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221125-mtk-iommu-v1-0-bb5ecac97a28@chromium.org>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1626; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=yRsx62PHekdowYwa/Kc+JnAl1OMT11qcvF/UlUuv6e0=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjgO0e3Iz3uM3saXvlJTwcfd3xV9teD31lx/tBsCaA
 +GKjJmCJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4DtHgAKCRDRN9E+zzrEiJyVD/
 4m5rgQ65+VT7WWI6q1UJaIcmFMXSC9WDSpsxRNyMBz6BZRl8DFMhNassgGM7Yjvs/dpX2vSLlc65qv
 GiFTZaTAvqIk5J8IS7wIrf4/vfknf9EVix8AUcFguYeK8FlPNWbxWWVPtum55vKSQS1a86HOlOtmAt
 0JWGTzVCkSPmG9whMr37fwsQmcXd1U22IoxKYKxlTDsW43eplAc8+YCXlGUw/jIRf6VSD2jyCC6q1s
 VPPdqFmFrVvYPnvPj9x2JYrSyJxgATgup+ik22/syCK/2Gfm/q6Q+F3i9D5SlOi9UceYAkazZgGTQ4
 9DU0HQ4BfNJxEdEHEeiAwMuFuA4ghfTigyEgD/U2gIt2mVnaI0+ja67va3TFrqfFjX4viTps6fQDRO
 ysS39413twJwmd2jmq9jSUAMgv7dJJnpAAwajU5EO5Ll7Jiefj982V5jwuHIEv+2UfNBcNcNy4hHpC
 rT4CPllsoZC40ASm16E4LEQ8k957AN9mCXoSOAaFpM9xoKhtwIOthkoXW5QRWPjB1iYsAYfiMo3GDb
 vpyigsb2GbfNvCV7+oZmpcrnWBBqBG/Oiohf4LIsBsuI+3HWAZMIKAT2sYpW9BrpXoPvD7qKWefC9f
 VT9oitp2Ge/qjpxG1RCS3QoszdeRwAsmwGWTzh2I0RFE5HJUvMUQaTOzdYLg==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_082822_755467_A647A1DE 
X-CRM114-Status: GOOD (  12.56  )
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

If the system is rebooted via isr(), the IRQ handler might be triggerd
before the domain is initialized. Resulting on an invalid memory access
error.

Fix:
[    0.500930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000070
[    0.501166] Call trace:
[    0.501174]  report_iommu_fault+0x28/0xfc
[    0.501180]  mtk_iommu_isr+0x10c/0x1c0

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2ab2ecfe01f8..17f6be5a5097 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -454,7 +454,7 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 		fault_larb = data->plat_data->larbid_remap[fault_larb][sub_comm];
 	}
 
-	if (report_iommu_fault(&dom->domain, bank->parent_dev, fault_iova,
+	if (dom && report_iommu_fault(&dom->domain, bank->parent_dev, fault_iova,
 			       write ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ)) {
 		dev_err_ratelimited(
 			bank->parent_dev,

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221125-mtk-iommu-13023f971298

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

