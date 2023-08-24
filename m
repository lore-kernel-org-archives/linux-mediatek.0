Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8724C6FA8F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydoYhmo/zUvr/Z1jqPRUS4uEIJI8i2ctDqfsePibZ0M=; b=RqisC4a8XcR0XO
	Dae1isov/m2c4EpdZvzowloV1PYKb3sKrYat4P5f8HiiM+490fBph5aOxB27qc7U39sclE+iYQtb+
	hIseKO83zgPHrWLORdXj4arPjO6NC0slAtfFFLTbX7Z9TVRNYh4xU2zd6m8/oHnr3tgw5DY6TxTUp
	J2EDtnFCepZYUWgKsZbcxcW6zgl9oW2PJtipS9rUFA7dqBIA5GIVI6Xrc+FtkrXQMeA2o9+chwM8C
	VVF0VbEbIR4t6o+bdpp6WxieBxadylkIKBB25soad33EZIapZerNuVcxorck5QeeZKJnvIy3aVJ9B
	/RnNTIkCxiBrJ8Cd5RGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7n0-002tpi-2k;
	Thu, 24 Aug 2023 10:42:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7mr-002tli-1j
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 10:42:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bda9207132so52474055ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Aug 2023 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692873721; x=1693478521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydoYhmo/zUvr/Z1jqPRUS4uEIJI8i2ctDqfsePibZ0M=;
        b=j+dJGmOnwFeanBncZxVZvZXDdOANE32WW+vw/iNPUL0ILVzlBSEFppcBXzFD+4nHDw
         WDZkcvHZrG2lDUkUEqCtDbaDjj6P9RZXLwL+Q2iQl3XehAvnZ06VtCkoHYMZvb1UfJSm
         XQj5mgQokXWMgcLNvVRQ4s3flUWFlQ95iUaPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692873721; x=1693478521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydoYhmo/zUvr/Z1jqPRUS4uEIJI8i2ctDqfsePibZ0M=;
        b=f7z85kyEoRdraR4DvTyg9psqylfV7LmWsd/nC8tN29TCe8bsIxe+hjeqXNfYCRAQTV
         eNHL7Nfgtna1PE3Z1Cj4ybBCyZ9SF/dpE29KbnF7e8V7ksgqo2eaeZ3hE5qqpGrRrcSQ
         9edp8PhBv7SA3R3TiV9o1HWiygt59xlv8JkkSSY8v8lnJKLT1lAjlpuVvUSxJVfhe/fq
         PTz0xdJKnzPAa6WtQfxhOU+Ce/S5XB0UA/Itds3ad0dVo73qADDjKOr2cYNpeieub6If
         EYe/1u92RNH18omry0ojDjhZj6+Ght9Dm/Uq49ce0VIQKk2/vFXfvEu8zoqlEg/e3h+N
         C/UA==
X-Gm-Message-State: AOJu0YynTl/rxrR7m4oABhzCXWnv2uSzhqY/3UKG8+kFNZ2a/wXunQGo
	+RQMK7/pPXhJEj1/IN9daWkPxg==
X-Google-Smtp-Source: AGHT+IElZ1QAwdCYRCRyL6bvp8lbkZPrWVHjamIivTYTyzrIfMNAh7MSIJqXviqpBH4X+ld/2/CnDg==
X-Received: by 2002:a17:903:2446:b0:1b1:9233:bbf5 with SMTP id l6-20020a170903244600b001b19233bbf5mr17338652pls.57.1692873721059;
        Thu, 24 Aug 2023 03:42:01 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ed6d:42e3:a23:8316])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902dac200b001b5247cac3dsm12524645plx.110.2023.08.24.03.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 03:42:00 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 4/5] spmi: hisi-spmi-controller: Use devm_spmi_controller_add()
Date: Thu, 24 Aug 2023 18:40:11 +0800
Message-ID: <20230824104101.4083400-5-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824104101.4083400-1-fshao@chromium.org>
References: <20230824104101.4083400-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_034201_590313_322423CD 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert to the device-managed version of spmi_controller_add() and
delete the unnecessary driver remove callback.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
Note that I skipped the conversions in spmi-mtk-pmif.c and
spmi-pmic-arb.c because the driver remove sequence would have been
changed, as using the devm version will postpone
spmi_controller_remove() to where after remove callback is executed.
So it turns out only hisi-spmi-controller.c is updated.

 drivers/spmi/hisi-spmi-controller.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
index a5525902656a..674a350cc676 100644
--- a/drivers/spmi/hisi-spmi-controller.c
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -308,7 +308,7 @@ static int spmi_controller_probe(struct platform_device *pdev)
 	ctrl->read_cmd = spmi_read_cmd;
 	ctrl->write_cmd = spmi_write_cmd;
 
-	ret = spmi_controller_add(ctrl);
+	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
 	if (ret) {
 		dev_err(&pdev->dev, "spmi_controller_add failed with error %d!\n", ret);
 		return ret;
@@ -317,13 +317,6 @@ static int spmi_controller_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void spmi_del_controller(struct platform_device *pdev)
-{
-	struct spmi_controller *ctrl = platform_get_drvdata(pdev);
-
-	spmi_controller_remove(ctrl);
-}
-
 static const struct of_device_id spmi_controller_match_table[] = {
 	{
 		.compatible = "hisilicon,kirin970-spmi-controller",
@@ -334,7 +327,6 @@ MODULE_DEVICE_TABLE(of, spmi_controller_match_table);
 
 static struct platform_driver spmi_controller_driver = {
 	.probe		= spmi_controller_probe,
-	.remove_new	= spmi_del_controller,
 	.driver		= {
 		.name	= "hisi_spmi_controller",
 		.of_match_table = spmi_controller_match_table,
-- 
2.42.0.rc1.204.g551eb34607-goog


