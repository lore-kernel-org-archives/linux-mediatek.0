Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94337C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 12:42:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C9652231F
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 12:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C9652231F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uC4ZuK/b2SMhzWkyfvkgy9GTk4go4JxxtLqNYAGd+eY=; b=Q4o8zVLINUwl75EeokQ69nQTbr
	DiFQHXsHBGlMnwOfxHh7br+PfdO5XIF6i5Pll1XzOqxg57g8saRH2UamD+s55S/nmYYsG5XmPwiaf
	bYqsQcfjPd4KgVce9JJqEjyHm15HYdpsWGiHcrYvJIhhikAFEb1IEU80NBSZEs/tfS8EUu3wzM0+q
	vNfAzT+7KR4jIru4gnGsqEQlOblaFG7On61MePMRu9GYkLPoiORXes+/xgOXnKPlT3Q8gpywFb0m8
	awiVkaMqw5DCCA190x7cU50pO2dXScfKYVLv2VEZ0CFbCBO/z+UQNbTv0/Hlqj5dUKT4YpaaCq1pd
	feG4vJWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Tr6-00084Y-LZ; Mon, 18 Jan 2021 12:42:00 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Tr3-00083O-AG; Mon, 18 Jan 2021 12:41:58 +0000
Received: by mail-pj1-x102f.google.com with SMTP id kx7so187920pjb.2;
 Mon, 18 Jan 2021 04:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=j/l8cPJOJH+vqkRjd6MNCTHNYSadcinQYa6/IVKJ8QE=;
 b=VJK0JRsDuiQQDf97WzOaZ5n+rrSucOvZ6TZXUO+o5F0nD4SX7ppXGC+zdd4OV+YzqM
 jRW+F8AFgA3b5DDNUI2cZrWgHX+G8MN0skaebe2fxHyl9NV+GOdGe1YNubnD5j4127Jx
 B8aSg+jOR6pHhAwz7e7fpo6io8hzl05ShCiJr1KWQvBQyle0YOAXyGnxMqJpwpGgsXaw
 j4NjadFyfLvuSpDz0Mak1+jjqY4BFGePR8vJG431eGqByDNWNoI34tQWip4CaXW0x35M
 cJ/cZwt1urb14LbF2N6ZIo9TkZJdiQSQxuPXHwn8RcbzjZ8jNs55FQzpEJ+oYcZ2wgYA
 3V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=j/l8cPJOJH+vqkRjd6MNCTHNYSadcinQYa6/IVKJ8QE=;
 b=G92HhzTJ/cwXlkUm8UolYRs5dlnst/XzsBuk2OM6b5lT1ZuRNil/Bw4HWhXdN+L6rm
 y6D/wC7TIT1iiIzdTxs/hVSa/VjCKNYO1uJQ5xje49T6mqxUt5FUSalWA3xSgDZqsJdD
 a5JYN4yoWQ3tauE4MwlxZn1BViaQwyZzqKcJpAnc96K44Mcff0hZNnhUBBgFKYgTkK8h
 DkjBHxiDouqZ2wuOXfkDHk77Qui57QuNYilYgO3+gJ6OO0bkossAgtZyXPdIOLJlQWO/
 L6RnCX1SYWFkCEkLFjLJH4cyAC7XsQ9Rmt6LmoG8+fVFwh0X5p+b69dPP799+Gdm9Jr5
 b4MQ==
X-Gm-Message-State: AOAM533LURjgUoUrEtMKACkxRKwscvjm2dRbQ2UB1YPGP2CrZWF/aCfc
 O6pMDhhCmmAhMlMVbbSw0xA=
X-Google-Smtp-Source: ABdhPJyRCa3t/Huh81DI/pMTm+4Y9hYkJTlAvaIsX5e/jn4oN1Nf87GtnTqy4s2nOttCDrMS0bAKEg==
X-Received: by 2002:a17:902:aa45:b029:de:2fb:995 with SMTP id
 c5-20020a170902aa45b02900de02fb0995mr26112581plr.81.1610973715075; 
 Mon, 18 Jan 2021 04:41:55 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:fa4f:eecf:e69a:c4f:ee4e])
 by smtp.gmail.com with ESMTPSA id
 np7sm15563431pjb.10.2021.01.18.04.41.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 04:41:54 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v4 0/2] power: supply: mt6360_charger: add MT6360 charger
 support
Date: Mon, 18 Jan 2021 20:41:41 +0800
Message-Id: <1610973703-676-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_074157_379087_08308AA8 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add MT6360 Charger support contains driver and binding
document

Gene Chen (2)
 dt-bindings: power: Add bindings document for Charger support on MT6360 PMIC
 power: supply: mt6360_charger: add MT6360 charger support

 Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml |   48 
 drivers/power/supply/Kconfig                                       |   10 
 drivers/power/supply/Makefile                                      |    1 
 drivers/power/supply/mt6360_charger.c                              |  914 ++++++++++
 4 files changed, 973 insertions(+)

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
