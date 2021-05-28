Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF4CC4708C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:13:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E03613D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 08:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27E03613D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kh+LLhedrVo66ypAdKXBhhYgf0D0hi/5QA5WHGHt5t8=; b=rYReyOhnPGcDzR
	jODHoqY96Oy9drLnHajenw0nJhugS8XUzP/0RrJpelhK/JpCdC0Dx0TN0X1CNAUmoauQdPg3600x1
	qfGgNT5q6nsFPkkALglJiAe/B5i6ttoGd8ykfi62t1h4dThzV9AjfCSWGfXYBDPu9f4TtwE1VuZhO
	yjWAwUL+TNl2AtBD/rGupiN5ZkJ1PXPOO3OwgFIDZi1bxTEMVpphjYB2dUEFP2FPTph3PEryz1q6M
	TWtq5nQw8xySHdpwK4JU4WnwAndAeBFyRV8CNXD6zLi5aWOCsVrh+Z5rTzg8dN/+j/mmM8kPWGbmt
	JLOQEFPh47PUZd68B3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmXco-00DKBp-Sx; Fri, 28 May 2021 08:13:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmXcD-00DJsN-K7; Fri, 28 May 2021 08:13:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id v12so1260275plo.10;
 Fri, 28 May 2021 01:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WFpvdJz81Rofrn0SCvWRF+k7het9w/ooU9Ou53sso1U=;
 b=RQfAOsj/JemwJemXCE6fis1wMnfcIp6Y+sHLpnm3HOZg1fPMfqMp1raHj6xbFggLAh
 8qYd7A+Rx+nd9H+HezIX1/GpsOvzukrzIUmLfPhVWEy2BF+rvQFzZGe0bWK1iPWW5m/H
 6g12Gr3CAV7K6lqgHF/WrxOTTJYOYcQZDpgYTcPVcJuO+eIV8RFqlIcUrnwhxrX8V6ML
 DlF7euw8OBla2Ur0XBAj8oWru5S7u9BYsOahSqoLX2N8NG+Vi2lDRzqqflDsgZLmCfih
 pT3pDHNjysGbC2DsFzDC3TSqPB7GAbw7qGdU3SKJwRH2w/vArotIvbRv8fNg88t5id3i
 +Xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WFpvdJz81Rofrn0SCvWRF+k7het9w/ooU9Ou53sso1U=;
 b=mPEFwXjlkM6wYozhDLF14m6HlxzJSQFA0TjcCe5Qy9WhSAZko09/18e7HlLzu710uA
 g3JFrainPQA5xK+2rIIWrpBkKKwisSQYfme7/Hb8Fsnq+F0ECGRGaqpYRVE6iK2LNYQ/
 dZ6KoANzaLzwsFUiun64DUWHEVVevyY26mnU8SjLaIvGKR+gzxYT2JoaqVWKrjSV3MN1
 yavb7Dg5wGIb4XxPBYxPGaG14+DGigDsE+pCONTJJtktTx1nu1hlS7ezndH1bFhOWEAS
 rV369TwHJ88xlNRDLwKznpWZnKWy5JfaUsindE1Xagtb0GAWM5FxNEZHLUgIytRnFHbk
 dbog==
X-Gm-Message-State: AOAM532gPxt9F5VVDv/zzIWMfOiX0MsRv9rzYVHwrrRngcUefKrs1oR2
 jNzqizugKuNf0+5Qo7RLkTM=
X-Google-Smtp-Source: ABdhPJz+VoBj7k8vwcL64HR51mNk+YLRUvpLavlP+rVuUsDqQcGrzR7m5IyQvsxLL+ZbK6YMUSBeJw==
X-Received: by 2002:a17:90a:d90a:: with SMTP id
 c10mr3032756pjv.209.1622189588876; 
 Fri, 28 May 2021 01:13:08 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:3194:b541:419e:4878:8a93])
 by smtp.gmail.com with ESMTPSA id z18sm3846594pfc.23.2021.05.28.01.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 01:13:08 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org, matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 inux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: [PATCH v5 0/3] power: supply: mt6360_charger: add MT6360 charger
 support
Date: Fri, 28 May 2021 16:12:57 +0800
Message-Id: <20210528081300.64759-1-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_011309_710464_548DBF7F 
X-CRM114-Status: UNSURE (   7.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add MT6360 Charger support contains driver and binding
document

Gene Chen (3)
 lib: add linear range get selector within
 dt-bindings: power: Add bindings document for Charger support on MT6360 PMIC
 power: supply: mt6360_charger: add MT6360 charger support

 Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml |   48 
 drivers/power/supply/Kconfig                                       |   11 
 drivers/power/supply/Makefile                                      |    1 
 drivers/power/supply/mt6360_charger.c                              |  856 ++++++++++
 include/linux/linear_range.h                                       |    2 
 lib/linear_ranges.c                                                |   31 
 6 files changed, 949 insertions(+)

changelogs between v1 & v2
 - Add binding property with unit and custom name prefix
 - Remove extcon device, redundant brackets and interrupts
 - Fix power supply prop "charger type"

changelogs between v2 & v3
 - Add register selector to value mapping

changelogs between v3 & v4
 - move pdata vinovp to mt6360_chg_info
 - remove unuse sysfs attribute
 - refactor debug log and warning
 - add power supply prop input voltage limit

changelogs between v4 & v5
 - add linear range selector mapping
 - use linear range to map charger setting



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
