Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBADC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 01:11:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F184020780
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 01:11:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ICHVKG8I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="cSM7Pwgj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F184020780
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bqe+fHMty0OOnsH95neHJTr4NkKPYX2h0+uYh9nGjjs=; b=ICHVKG8I8mi9NEYSiUQJzNExhW
	bYSKiQKBbc9XU1LTa9fDLi0qs/HRnsqSt/dZdAWhEbWIRG41xBWuVq7QGGvKtpmm8TT34E2eQ/bhA
	M2MA1eQrPT+H7lNzWq9M0j5Tlg8wNk1YWjI6tZgjSbdAiq0lueHsONhdD/9WDoOluuwsppZUdrw5A
	QiuEJw2JdRiHA2Z93DZWAxMXd53VA2wFx6rDGSmi+il+kmcqdvSxWQEvYV7k9gsQyBXmUxYfsPB8U
	S1JADNtJJf9MdfHr05k6i/Jyffg14wcgsSXZkqB9qbxw10zqYDjhvrvXsuVniEhUl3j9HXnVmFCNh
	W4khfUwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq4nl-0002gZ-Qe; Tue, 30 Jun 2020 01:11:09 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq4ni-0002fU-Gw
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 01:11:08 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id y3so21004219ybf.4
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 18:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=3+Iq/MXOcbSUp/+nHtUzggFuUsgKGhG/vV+48k4w4OQ=;
 b=cSM7Pwgj28gdY5CA12KGe4fYcjvJzOjCGrwQ0AmXermj1tHfdZrsjUZJBsBx2GrEPY
 BA1q0mlnRFN2+jx1RR2i6CitfER/2t0HDTe1Ea6GnnnNQB5IPSRhOHNXqbwbNUPbT37f
 DzH8QBrP2sy/jsH6Tq37FKzFLDwvC2ffYWXdjs9u5G58B68x0mZp4+sRmtufEXeKXBvy
 E1cgWh7vGWO+Xo5ZffR5iH1Tnc5JVBb50PIy8cwDQ8SQP+y6sIPGW8hb40ECLqLLaRvZ
 5kqhGq8GSvG2uX3JOUsUesKCvX7hxtmpipPnOsbmzuHn50ZPZkki9Y7lI+siCFRkCevp
 Cbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=3+Iq/MXOcbSUp/+nHtUzggFuUsgKGhG/vV+48k4w4OQ=;
 b=l38SvRUQLlmJGCSBAUAexYBWSdsKfsHhwXSCeaftDMpN71I6b/EZdNK43DN8gL/LlD
 vmJEvzAWi9JeODcW3NVDa7Y2AML65rcAPxfnSCpGWCQVRxqngSVpsp1yy2aGB19GIDNg
 OyV92wNasPsE1scPFwlD16tA+Uz7DD+WaPaUsUxkEQq3z/ftvRp9QyXZ/OwwnWB2eNa/
 Y0w/h9sZ48neqQTrEPW4WonZZ+5kPrh8wiC0NbrxYSQhhcP5c+hgUCN68pZVJ27UCZXy
 KOmFZgXbLiS4q27WT42ZspXmvmtTmS0Im4pc7FhQsrokYNpNiORZjOBoJ8nBhJ/YRXGN
 kA7w==
X-Gm-Message-State: AOAM5313ArjVR8y28v5rUi0/WeK+1LdiY6WKinzJZuwODMZNZOGZPOOO
 u8gG1bMhjMSqreO2yzPC714KpDqqH9xHCmtYIN2kmEohBVoUkmiA/zKro0RBYwhDm36wEmlMqVZ
 SiEC1jxhFoLa/oqb1wXL/XmM5Dmc1+PzAiKTn/9in7/UbECB6/xKF7RZ9VxZ1fJja//rY/R9Md/
 LEaBNR
X-Google-Smtp-Source: ABdhPJwHlV12J3jmhSgfapnwmVJEvCJRHQHW7Wzl8yg/D9C9h0zd6idlrSpzbckw9anZCATywg6aWVmQswSM
X-Received: by 2002:a25:b21e:: with SMTP id i30mr29661766ybj.35.1593479462230; 
 Mon, 29 Jun 2020 18:11:02 -0700 (PDT)
Date: Tue, 30 Jun 2020 11:10:51 +1000
Message-Id: <20200630111047.1.I05d781ac794389337a4adc2f6402f673117e2937@changeid>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH] regulator: mt6397: Implement of_map_mode regulator_desc
 function
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
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
Cc: drinkcat@chromium.org, Anand K Mistry <amistry@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsin-hsiung.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Without a of_map_mode implementation, the regulator-allowed-modes
devicetree field is skipped, and attempting to change the regulator mode
results in an error:
[    1.439165] vpca15: mode operation not allowed

Signed-off-by: Anand K Mistry <amistry@google.com>

---

 drivers/regulator/mt6397-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index 269c2a6028e8..5c60b52addf1 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -55,6 +55,7 @@ struct mt6397_regulator_info {
 		.vsel_mask = vosel_mask,				\
 		.enable_reg = enreg,					\
 		.enable_mask = BIT(0),					\
+		.of_map_mode = mt6397_map_mode,				\
 	},								\
 	.qi = BIT(13),							\
 	.vselon_reg = voselon,						\
@@ -146,6 +147,12 @@ static const unsigned int ldo_volt_table7[] = {
 	1300000, 1500000, 1800000, 2000000, 2500000, 2800000, 3000000, 3300000,
 };
 
+static unsigned int mt6397_map_mode(unsigned int mode)
+{
+	return mode == MT6397_BUCK_MODE_AUTO ?
+		REGULATOR_MODE_NORMAL : REGULATOR_MODE_FAST;
+}
+
 static int mt6397_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
