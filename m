Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36AFCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Opu1+fgnwfiqRAjomE33LCew5lDraMk9w2Ix7h0wG/Q=; b=dxkxcKzrFqxCm8tIQ30sSDfMLZ
	qHoL+O5ELmExS+92NI7a8zjp0/it2bPgzYatC5v4AKmIYWMGOikMHbWcO37k+L561t/j/r3wlVgs1
	wp+tAYxkjHFx5a19ZfF2ZETvc86s4u/QOxU9C7LlD3Sm+7hot4TP97OY7n+xfzW/X7KTUDHKy2K3L
	2yP0+J1UmJPR+/SsvRFbl/3qq8eH/EBihuvGmWii1Fy2AR4XRcIc/S6treWkR1t09EBNNVXu7KcsK
	s9zuk0ofy4DoOxMsLIZnQpmqau/SMNsZs4KI7bt9GEomFvHElo5R05wgKKAQnppMq62CD1c1zWIZx
	MeI6lX9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcw1-0000000AyZQ-1TsG;
	Tue, 02 Apr 2024 12:08:13 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrcvs-0000000AySN-4AZ9
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 12:08:08 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a47385a4379so1075201566b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 05:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712059681; x=1712664481; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Opu1+fgnwfiqRAjomE33LCew5lDraMk9w2Ix7h0wG/Q=;
        b=YDBrBRdN3C69jnnP/KLPvgEMTGoLymWlK9Fomv4Cj9rv6jUR1dWqHjVJFUp1n5TNqU
         AgD5T9aIMrEtFeKewj14Yzw5aReWJHg5Y8AB4c9Rok6sKiz8lfolxXHVMPC2bIu6KYt3
         dvCvnxWfn1jerL/rpD45Hy6J+y8dKRr+8REYddK4vlvuB836LBv8uhkpe9RFsg7AARWX
         SWP12WW155rQxjxkIxxhR1oDLV9kCtTb2r82+a+yULQ08Rt5mlKP1klIeOaeCIZL689f
         +evkNCTdPavFVckJWhQ3mZC/+e7AHtMUxj+m6bNBOGdWeQu9VZDknzoo/BGO4I1dWfod
         QA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712059681; x=1712664481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Opu1+fgnwfiqRAjomE33LCew5lDraMk9w2Ix7h0wG/Q=;
        b=MFVF4504VN9XnPvhOPqLIYiBbED6n7n4WAIZfVWllE8FWk85TXWTi079WzJoHGyMfP
         iHPWZ7q0Y9tpymAugOkfEARkQI3BxX4BeV63QOcmj0D/T0dGhcTXvgakHvXSPBCEaoUy
         saw9FbmFRVdSp41EfpvKi+6KLXazlbVuQP2nc8DQ4gggiluhjXA3yTDzAO0m56X3489G
         j32IFQ30KyfR/zTSIRDlsw3ifFYL+EZh3wYzj6ARZL3rmxesN0LXFc9z3XMMaXrTvJ65
         9+uFhm8V013sANEzvjwEvHg2Gw4AOuTOBBE/R8VFwGoAFadcC8vUjy03xig0zW08wOVR
         kZoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+xI9EWJ2sBgML/ILJX7Y3hmrzwyICo657iRKcrXNW0JlP611UZYEHXBP66bMc7nzmyBTQmiTvD1MkB4ChI0zs5pfrMBEYXgaqP0G98/fMLL9r
X-Gm-Message-State: AOJu0Yxt35f+Bja9QphnmtaBZ15lp9l/3BWZlskjIhgVruvNytrMWllO
	T3ArNjRlRzuyCtTrF6ei5ryjcQ9E61wRWd1waCSlLoPf8uWxsClijcxMhb7hCPZRN062mnE4GNB
	0
X-Google-Smtp-Source: AGHT+IEh9Scg5RaWBPAQy9YV3zDNFVbPkDw+tNiOCwdJ9q1APPFj3+6+kqkTVUmlVfH7Rp7t9wFBgQ==
X-Received: by 2002:a17:907:7e9b:b0:a47:3afd:4739 with SMTP id qb27-20020a1709077e9b00b00a473afd4739mr15686749ejc.6.1712059681089;
        Tue, 02 Apr 2024 05:08:01 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id l13-20020a1709065a8d00b00a4df251a601sm6519384ejq.77.2024.04.02.05.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 05:08:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 02 Apr 2024 15:07:32 +0300
Subject: [PATCH v8 3/7] spmi: pmic-arb: Fix some compile warnings about
 members not being described
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-spmi-multi-master-support-v8-3-ce6f2d14a058@linaro.org>
References: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
In-Reply-To: <20240402-spmi-multi-master-support-v8-0-ce6f2d14a058@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2422; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=itu5VhzRY7+Uox8ZWhW8LPb8PjDEzOtU9DaWueGgr6c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmC/USt2OJhH/CwprexawX8WQiCTrUZ/JwoYHDt
 lhJSzZcFsmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZgv1EgAKCRAbX0TJAJUV
 VsBnEAC8IyeAcovEWVj5iC/wADmCZjSgb9pbAnqUPt70WMLSgJ4HRbEjWF36d6LGFaSjETGMI4A
 xOyjGogFEFo8l0vmThd4x4AKRTQTnx0bFyQImr/uQQa9gKWsEaMkmVPbSkt1B1tzmMPaiByOwfv
 HPxdZCWtH+V8te9gxZ0SSDwF+bSceX1ODUN1TRZWPvsubYKXQ5DqY2A8yTe19sHk8gPTgT/BsBm
 MM9IpNRw86t99t/5tLYjYCBb7t/tX2FcM7HHFb8y2VuoyrPJNeVhCefulUftkPcrRzeWK/zAhuR
 yJT8qFV5r1RR/cu1BS772cNY/BgARjlm1ro8D5DxsGx1rKqbTe3K3vcfmJ5p15Ab5kg+AavCX5z
 KNngO2/LBqk/8fyHfQ7CCUklV4BlBWFxgxBYYnUJvdLYNQ7k6hrZWjozlfNSJxh1wlSOmCAFkD3
 JvcdP4Sil7lGTrtAgtr0F8mIz4d1f7i6By4DYXs03w/CADTsv1657RT9Dn0M9YGRxTYYFA82DmC
 tgRudjlugcxgFsepVgqEAzHVTrBTtP4BwdolnYLfU4Tgg7FCbmsfSIRYG8c8YQnoj12617TH7Y8
 uHJTvirYpo6xbCLiirhTAH6xA3F/HACb6Fnr0O5Uo3bosdFrkRb2VQDMOmL7+qt5v2CRySQrcUd
 ZNnPnz120EcwJKA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_050805_244555_DEECCA9A 
X-CRM114-Status: UNSURE (   9.86  )
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

Fix the following compile warnings:

 warning: Function parameter or struct member 'core' not described in 'spmi_pmic_arb'
 warning: Function parameter or struct member 'core_size' not described in 'spmi_pmic_arb'
 warning: Function parameter or struct member 'mapping_table_valid' not described in 'spmi_pmic_arb'
 warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_read_data'
 warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_write_data'

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/spmi/spmi-pmic-arb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 9ed1180fe31f..704fd4506971 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -132,6 +132,8 @@ struct apid_data {
  * @wr_base:		on v1 "core", on v2 "chnls"    register base off DT.
  * @intr:		address of the SPMI interrupt control registers.
  * @cnfg:		address of the PMIC Arbiter configuration registers.
+ * @core:		core register base for v2 and above only (see above)
+ * @core_size:		core register base size
  * @lock:		lock to synchronize accesses.
  * @channel:		execution environment channel to use for accesses.
  * @irq:		PMIC ARB interrupt.
@@ -144,6 +146,7 @@ struct apid_data {
  * @apid_count:		on v5 and v7: number of APIDs associated with the
  *			particular SPMI bus instance
  * @mapping_table:	in-memory copy of PPID -> APID mapping table.
+ * @mapping_table_valid:bitmap containing valid-only periphs
  * @domain:		irq domain object for PMIC IRQ domain
  * @spmic:		SPMI controller object
  * @ver_ops:		version dependent operations.
@@ -232,6 +235,7 @@ static inline void pmic_arb_set_rd_cmd(struct spmi_pmic_arb *pmic_arb,
 
 /**
  * pmic_arb_read_data: reads pmic-arb's register and copy 1..4 bytes to buf
+ * @pmic_arb:	the SPMI PMIC arbiter
  * @bc:		byte count -1. range: 0..3
  * @reg:	register's address
  * @buf:	output parameter, length must be bc + 1
@@ -246,6 +250,7 @@ pmic_arb_read_data(struct spmi_pmic_arb *pmic_arb, u8 *buf, u32 reg, u8 bc)
 
 /**
  * pmic_arb_write_data: write 1..4 bytes from buf to pmic-arb's register
+ * @pmic_arb:	the SPMI PMIC arbiter
  * @bc:		byte-count -1. range: 0..3.
  * @reg:	register's address.
  * @buf:	buffer to write. length must be bc + 1.

-- 
2.34.1


