Return-Path: <SRS0=Zwng=2E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85287C43603
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:57:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CDAF20724
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HC1qWnPe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etYuhZFI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CDAF20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=s0FllV8lwPw1v0LVJUNa7T3lAgVrXJG45BL1wIQeUvk=; b=HC1qWnPevsMMB6gRlx96xWWkyV
	qfGB0dC5M/gjEy1gcOr1sJ4gCpUTc+azNP4ThN2yzEQEFId0vkMCPbQsbeBuaeDlAKyWiT5D2e8Pv
	skXqktYEh6TKA7M1sHbcCuMhalep2BnhynfZ1AHekA9Ny4WMOvfMMtvIdhbZhXwd4hAA/2j03HNTJ
	qHYA0H7oWJgxNM+LRoJ30o9DuNlBgEGoB/qgdPSQ1aGnSjBe1MrG2W/AZ47+IycUbErQ0HeS2ZrjN
	ICcDS9JQH4iweBsyEqkTmKOg31Py4mC1cs7cS9npHbTQ4Cz6w7JPW/ee7pTr7MciTnEstPOnk0SlT
	lDYXgMVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igBfQ-0006mB-Bo; Sat, 14 Dec 2019 17:57:24 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igBdA-0003Uv-8W; Sat, 14 Dec 2019 17:55:06 +0000
Received: by mail-pj1-x1041.google.com with SMTP id n96so1132019pjc.3;
 Sat, 14 Dec 2019 09:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+BU/Ff9gTll4l1H4cHIf9pN8etRhbZ4P9b/IJDTytGQ=;
 b=etYuhZFIpCXV1kkHjldlFQSwc0TrxbWNSKhQinSIxVhNYBw8CEktZpcQFrLkDDF5K5
 +Hsam8gZ8taAgwKYcXtKae2DICNa/JmCyH3kvS7XB0zTRIY0TJHSeG68zdGm045/AUbR
 1Z1XSJoe2L4CqIeUX/+NIBoVqUBpAjYl91Yp/GeG2BvYdHn3A+WyBoXkLvsfKCYYcnbm
 JaTVP6TRg7evuPWJApVMdGiJG7Rfl3BAD4FOd0aTybSzCnxYWajApbMeCYieL/hV6qvf
 k6jIqlBdfGrtylYtS7K0+d2ygq+dZJ9r7ke8j7C2GWhYAbp2yLZxuLkpvIQusP4V85Qp
 ZO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+BU/Ff9gTll4l1H4cHIf9pN8etRhbZ4P9b/IJDTytGQ=;
 b=eiJVTiGzaSYnpbYNzXj3emh0cRiHDCxgeotVfOxgj4F6cPVYBq/mytiMbc9Sz6ezkZ
 0SQJ9pEHU42hOvr530xJ2Vim7xVeF5roKmOyahKvMDIDhzV4Kgk0ZSzfgmM7WG9TT5cV
 oDXATbI7rEf9a4r4HtU7WhIvyPVutQsDaR9H17TvkxkwYKYJahZwmve7JYSUjQiqcf1n
 q7bSipi8kS09oHMGU9KR3PMwxJI/o5DLxqedb488bjXRo29X2RSpTcz02c5WucxNHaab
 NoZHApeeOdfR91m8SsnyUJHp0D1SU3k+LdP7UhqTlNuo8LdCvljiI6m3p/B/CCI9YYNa
 RGmQ==
X-Gm-Message-State: APjAAAWa9/0XLwIVpr6pUbXUyAcKrgVj5Utz8dYwsGTR9T6CyBx+j637
 2thowu1pL77zYNahzN2266xsDW40Obs=
X-Google-Smtp-Source: APXvYqzDtz2PbMdoWI7FnmJ/zsXx+7KES2ydK86NxuECS3KFBEaYhRKYIxzKO0i61f2CWAU0CDUJ4g==
X-Received: by 2002:a17:902:9048:: with SMTP id
 w8mr6142048plz.294.1576346101451; 
 Sat, 14 Dec 2019 09:55:01 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id d22sm16263997pfo.187.2019.12.14.09.55.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:01 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 04/10] soc: zte: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:41 +0000
Message-Id: <20191214175447.25482-4-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_095504_526752_9B8B8A87 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/zte/zx2967_pm_domains.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/zte/zx2967_pm_domains.c b/drivers/soc/zte/zx2967_pm_domains.c
index a4503e31b616..9f2a274d2759 100644
--- a/drivers/soc/zte/zx2967_pm_domains.c
+++ b/drivers/soc/zte/zx2967_pm_domains.c
@@ -113,7 +113,6 @@ int zx2967_pd_probe(struct platform_device *pdev,
 		    int domain_num)
 {
 	struct genpd_onecell_data *genpd_data;
-	struct resource *res;
 	int i;
 
 	genpd_data = devm_kzalloc(&pdev->dev, sizeof(*genpd_data), GFP_KERNEL);
@@ -123,8 +122,7 @@ int zx2967_pd_probe(struct platform_device *pdev,
 	genpd_data->domains = zx_pm_domains;
 	genpd_data->num_domains = domain_num;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pcubase = devm_ioremap_resource(&pdev->dev, res);
+	pcubase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pcubase))
 		return PTR_ERR(pcubase);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
