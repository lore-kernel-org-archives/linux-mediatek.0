Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B62FC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:16:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B8A7207D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 03:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mmcX9ayv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="HzbdSZv0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B8A7207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h7CcbPQ/egkzTm3TX7yleW1xnAbeGuJKJNHJW670Db0=; b=mmcX9ayvhWxokOVl6H+AlsvRE
	s60dfUQp+TzkTrqNYWv+oCvXoJ+yenmxgBDqYejMNTe2/zIhhPeQ9G+TT5NVy7zOLuMJ9CuAuCNMY
	Vb4YWbdAufAoIfEMfL4sV8cDLHMfJ8bl6WYZbQKGlidETmTUtF/McrGhDxwNhopJgZk7plIv2u5Lo
	uWKsF7mrSAWbAmUMS7SUw5T/RF6pT8Oimo1u0aq3RCdKcclsmizGPszYx6MY6jYHetxM6ZcEgeVwm
	tSH1HcsydyS0CUzPYs50IWX9hqam3+NRvC984xIPUqYpQsxiOtvLlIiEqcw5Ng6z44NJ8eVOVBGQj
	nEH1USdnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqphp-0004F3-Pk; Thu, 02 Jul 2020 03:16:09 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqphn-0004Dp-Nm
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 03:16:08 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id b14so21636620ybq.3
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 20:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=xDLelKXWa6n/sCGeqxnzltZlZ1vS9m9Ynk21BdAZCSk=;
 b=HzbdSZv0NNEG2jR7vhCYiFUN9B3EAKDX8y5Ni0VDrAmUEhJIxTZJpBEkIJwoKrEgJ3
 1O2OGhhnX/ywvYb2j2XvoRWK4LIpm1uf29xqCnusy2Atlqy0SJ/CnDE+vR9Y7JYl13JW
 x7xpvuy8+3cjhHmAou12BjUAftI5/9HXqxi3RXFXXHsErGfAIgaTf/NGOnt1boZF7PZK
 aomikeBmbwMIbXFhlaaVybRSmtuj9nuSLwWTfknOXGLUkDIdp/lNUzqAz0mn3XYguGRo
 SVveQxs1EXULlSehkYoSizs/fGC0DKLjc35OZZ4Hq5sTiboohN6yYfAQhCSbdcutUMCn
 lgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xDLelKXWa6n/sCGeqxnzltZlZ1vS9m9Ynk21BdAZCSk=;
 b=LawgO6uwcPBgayn85Ul/VwbIGWRmW7coJHBjstPXIgPZdJ+VzmLzaWX1m7DYGysh3k
 1jnybqXINT0MMVTLqJfB0ZP3NWHsygrWOjz2ZcfGlatkutyeOrg5SZGs/awfgmGhlgfk
 w28NsKtKXGbK6UgmY5e8JUreyjPgzMzXiIqzla1e6y0cLG1h6MJRJv2H+XoWhfAMh1kP
 PPWeCKL0A2oK911nsmIEFihoQb43SUJViLtrSqeTJ4SUA0ENUBn6NSZHl/bI1WmHJxje
 6kfIrPkS2eB1xsZCNHB7zeUU/AQ8pqytFhD5McGGmPl0eKaGa8luyNPzPJ8i6992A45e
 EDvA==
X-Gm-Message-State: AOAM533Lwsjz1Kz42Do2ibzY/Lm57yJDHu2ktBJSiVpbGeoCAWQje0ZQ
 X46H1BjxAZjdW8Ooydm6DKfUrc/IpS6PWAoiFseuVBW0FCBtVPqTEiaPsAOSGBoGJtQWMIooT7E
 MfpddmbE9l4lLA/IF5oDTTezcbBSo8a3LQBN+i1juVdpQQcluuob0SfnG5qxZ2KNX//9mSMzxR2
 oI9Ty7
X-Google-Smtp-Source: ABdhPJwAZ6JdGkzz0JV79Fl51uiKv8dPLjkIR5F8vFIGnlOnDhvxSMkJn0cZ+8nVvQzq/HnDfzwpKuV5QOWE
X-Received: by 2002:a25:3849:: with SMTP id f70mr47240812yba.135.1593659764955; 
 Wed, 01 Jul 2020 20:16:04 -0700 (PDT)
Date: Thu,  2 Jul 2020 13:15:24 +1000
In-Reply-To: <20200702031525.2662441-1-amistry@google.com>
Message-Id: <20200702131350.3.I6a0bc18fcdb2fe13e838a31e6d034d0e095368bc@changeid>
Mime-Version: 1.0
References: <20200702031525.2662441-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 3/4] regulator: da9211: Implement of_map_mode
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_231607_815487_98878036 
X-CRM114-Status: GOOD (  11.95  )
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
 Mark Brown <broonie@kernel.org>, hsinyi@chromium.org,
 Support Opensource <support.opensource@diasemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Implementing of_map_mode is necessary to be able to specify operating
modes in the devicetree using 'regulator-allowed-modes', and to change
regulator modes.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

 drivers/regulator/da9211-regulator.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/da9211-regulator.c b/drivers/regulator/da9211-regulator.c
index 1f9b75b41346..297b3aa7c753 100644
--- a/drivers/regulator/da9211-regulator.c
+++ b/drivers/regulator/da9211-regulator.c
@@ -86,6 +86,20 @@ static const int da9215_current_limits[] = {
 	5600000, 5800000, 6000000, 6200000, 6400000, 6600000, 6800000, 7000000
 };
 
+static unsigned int da9211_map_buck_mode(unsigned int mode)
+{
+	switch (mode) {
+	case DA9211_BUCK_MODE_SLEEP:
+		return REGULATOR_MODE_STANDBY;
+	case DA9211_BUCK_MODE_SYNC:
+		return REGULATOR_MODE_FAST;
+	case DA9211_BUCK_MODE_AUTO:
+		return REGULATOR_MODE_NORMAL;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
 static unsigned int da9211_buck_get_mode(struct regulator_dev *rdev)
 {
 	int id = rdev_get_id(rdev);
@@ -233,6 +247,7 @@ static const struct regulator_ops da9211_buck_ops = {
 	.vsel_reg = DA9211_REG_VBUCKA_A + DA9211_ID_##_id * 2,\
 	.vsel_mask = DA9211_VBUCK_MASK,\
 	.owner = THIS_MODULE,\
+	.of_map_mode = da9211_map_buck_mode,\
 }
 
 static struct regulator_desc da9211_regulators[] = {
@@ -242,8 +257,14 @@ static struct regulator_desc da9211_regulators[] = {
 
 #ifdef CONFIG_OF
 static struct of_regulator_match da9211_matches[] = {
-	[DA9211_ID_BUCKA] = { .name = "BUCKA" },
-	[DA9211_ID_BUCKB] = { .name = "BUCKB" },
+	[DA9211_ID_BUCKA] = {
+		.name = "BUCKA",
+		.desc = &da9211_regulators[DA9211_ID_BUCKA],
+	},
+	[DA9211_ID_BUCKB] = {
+		.name = "BUCKB",
+		.desc = &da9211_regulators[DA9211_ID_BUCKB],
+	},
 	};
 
 static struct da9211_pdata *da9211_parse_regulators_dt(
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
