Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B22BC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 02:31:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B00A4230FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 02:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B00A4230FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JcXzZxVxtP2OQmmX9eRAhtIHfh93+GLAiFQMP1wsRms=; b=AFNEpuLq4imAYfeg+dOpV+lnIE
	piO0KW9dUztPk5mfFFltAgPqft94lJB8xhDZuOeUyBMng6fj2K+tO6613ksdgf3u/OfTp+nX+ayeL
	eiTbyy/S1kbZuFxN5YnHpm/mwd71HQ35Dl0Y7zvhOOy+T8ElaxboDbO9IfY8duYQFX8+WG/zZOmuJ
	oDAUYLXU7pFsG5Zgp50IYynX2KR44ffhBfvWcHWUUCMTzA3GtQAxosLMazcMDVWENhYu5tuUu/7Nq
	qJ4d4d+LBj9iQOhmGe4bzhlPjxeHES2Fv9Jnoht0wHVCmsRqTMTKUqK7VjkeW6PchCMmZsPASB+sw
	qb9n9PHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxL53-0006wZ-Vp; Thu, 07 Jan 2021 02:31:18 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxL51-0006vC-Cu
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 02:31:16 +0000
Received: by mail-qt1-x849.google.com with SMTP id f33so3900793qtb.1
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 18:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=tNysKkCMZfVPOEF1Rqcdgg1STtCMPOn28jLi9xU4sRo=;
 b=gZCxS3Qx0a2mPHdct3VLekV6zlfpRBbW377QpRAcUnlZsXnYIEX0TJKZFPMavk7L8q
 1+lYkZG08d8XABjLTKlm0kf2MAAUFGJpAojUrmruB6Nrf8z1Te5S1ivCjP0GVYMOANxB
 auRm8f5xyT7VQ6Sf7TxYnq0KmwPBEytKLjYkiU5KO82QJ86k7t9mdzRpfkZZVE56dOBk
 pzIAEqkGnudhmnOljX+tgX1hslPIBQErlh4t1W2H98cq16loFYCeQGHDI3TLNa7LXFFh
 S3dqQc9IQKjfUqJWlJeNw/K0q2I1wsD5OxM20QSrMD4HCyv8oTRsaYqgLTxWWDDMIIxW
 vN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=tNysKkCMZfVPOEF1Rqcdgg1STtCMPOn28jLi9xU4sRo=;
 b=dIt/tq6rOwN3KIz5jGw1HNUZtba+yMk8DAZSoCADqy6DEO0NbJysO/S46dkvSOCncI
 EJzmy8s9DY4nqn7hW4G5ej1sPp6NQpX1MD21P2gOPAqP2RsseHmOiKtgaQDUMfBvuZwD
 pBRAvOWsfALyuDrcSCb7fAaPVl+oy964Dzyk2WgSDNr7oowtHs6YclctPtR0ejufEjq1
 g0VpBJX+ae333chnA7HQU+126ydgvEtMYghXYXDak6ViWwqWzPkkB+jd7mMYcVFl+aNX
 U24G8vry6rv6OyExutwfzjG08Qc1khD4Yq71BSyxT32gBCHM6FtY6rEJJNt6Y70K4nuC
 f+/Q==
X-Gm-Message-State: AOAM531kab8hTbP+5ehEDGY2FUedns2vMO2jfnEfvNSKrpUm8s5Owaa5
 dKjgDoXhpydXE3MgquPDkEcQCT9kGl3A
X-Google-Smtp-Source: ABdhPJz4AGltbzoejR8dMF7WllRpmHxZwwc4BkoGIX+vicw/ugDUH2TD8KEmZXaDNJ9+P93XWZjVpB10F8su
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:f888:: with SMTP id
 u8mr55647qvn.47.1609986668860; Wed, 06 Jan 2021 18:31:08 -0800 (PST)
Date: Thu,  7 Jan 2021 10:30:20 +0800
Message-Id: <20210107023020.3224002-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2] remoteproc/mediatek: enable MPU for all memory regions in
 MT8192 SCP
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_213115_490093_86A46380 
X-CRM114-Status: GOOD (  11.82  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
 tzungbi@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The register MT8192_CORE0_MEM_ATT_PREDEF contains attributes for each
memory region.  It defines whether a memory region can be managed by MPU
or not.

In the past, due to the default settings in the register, MT8192 SCP
works luckily.  After enabling L1TCM, SCP starts to access memory region
that is not included in the default settings.  As a result, SCP hangs.

Enables MPU for all memory regions in MT8192 SCP.

Note that the register is read only once when SCP resets.  Thus, it must
be set from kernel side.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1[1]:
- Adds more details in commit message.

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201214051047.859110-1-tzungbi@google.com/ 

 drivers/remoteproc/mtk_common.h | 1 +
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 94bc54b224ee..5f7cd2336cef 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_MEM_ATT_PREDEF	0x10008
 #define MT8192_CORE0_WDT_CFG		0x10034
 
 #define SCP_FW_VER_LEN			32
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index f025aba67abc..130c0b9511df 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -369,6 +369,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
 	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
 
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+
 	return 0;
 }
 
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
