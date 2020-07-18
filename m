Return-Path: <SRS0=kKdk=A5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E547C433EC
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 00:07:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE1EB20691
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 00:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GkE6ZkWZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="nkLT+MDk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE1EB20691
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=joihqJ1JHfqNylby9j0w1crk58kL38HbzpCZJNblh4k=; b=GkE6ZkWZ33Kdt5KEwrgRy2A13R
	7Pe5/idR/jVF/lWlFJ1y7mIMLUnI50GRoxF5wRM4GYfsPWSSy4ZcGiWlbrqCusLqzMAXKm0TlNAY6
	uYtoGX13w9CkbA2f5/cVNfW5neorKIpbsw3AI+MVPt9yLdBmP8qPmPi7HhzQ/bpBBaYV4Y5Io8t3w
	8VKqGUMYE0AvCJj2rXb8laO0ssuexL5jEMN8HEJqcxo1Dv3mo0OQ5Ztu4klcbh9CFs0vw4Ioeaf+a
	3vd/3F/g3DnLC7caYopK0H2aKwVKAwbmetGv/nj0G3zcAqHxxVwizV67kwnGUgUeTXa+PWAzxQMtV
	ZQFOgmoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwaNJ-0001sN-TM; Sat, 18 Jul 2020 00:06:45 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwaNH-0001qq-NL
 for linux-mediatek@lists.infradead.org; Sat, 18 Jul 2020 00:06:44 +0000
Received: by mail-qt1-x84a.google.com with SMTP id d45so7431916qte.12
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2020 17:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=rJVmt4ZwvRTHWXzLKcOClrGZS1hFJIY01F+5WZok3xc=;
 b=nkLT+MDkiiaXW4XaRtaceajqWSG1GinaUs7iUYNAPyVF3I16mAM60i0gGxIDbAsMQt
 fYL3Y4hkLQ4zrCRLIrRhLXNAFIUzqqbNLcna5BgT/oUTLTWlK2CVCP26dSTIHxdBJ9ha
 0ACj5SjZiHCYVw2sKDNWSf9UjvBfXMIAVREz2NDrkfitTNAXQDqByq4edHfoQysDKFnn
 XC4oT1Yu/8OuXz/+K6DazZZVmvoiE3s04R4QsiTeyT81Px5iQFL5NBAfHgZE3j/NJjdP
 d7FBIRkJbXCCOJ0U9kQsUWd45y3rWC+omYqme3AiSCb14sHnlJK5v/B+S1aTOcNzOgv3
 Q7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=rJVmt4ZwvRTHWXzLKcOClrGZS1hFJIY01F+5WZok3xc=;
 b=gTThiWpHfAr36UATGoFK9WQY8/HKN20ZFynEFwMgqj6Ev55Tbr1ha31Saefdsf1d+i
 +mtRjCJEzhIUEIdgmjhOF7Vqu4g3F1FQYwDiyiOrNhNPXJ0BGYIOvLY8pgL1bhdACER9
 dnV5m+RjQlUmXm2sTxNIvGVFPE0Qs2hrqjPQ+7D2dr8GNTpnSRd/5d6hswPPM8SYp4IN
 Q+y24ftNiigRn7O/1ineLQpQFcEC9TZugNQyygZwPRD181dmcqr4oCOqvR7ZU9WIqmJ5
 TgPLhlMzLqDUApxk6aGCvfOJnZZHri+jtk0l20Wmj7tqF6tKP860VgrUU5w7rBljCIeO
 J97Q==
X-Gm-Message-State: AOAM533oTfEClGEWUdT2Qz0QxuyShviFbt9631qGp6n4OE0JdtnzYy92
 mFa7ctoe2wMl95NaDYKnY+B0Cb9x+Zhmpx0=
X-Google-Smtp-Source: ABdhPJz83yKT96CBvwXwQbOgr6og9PaNdHb27iy5PN2zqKCaFfX0K9leKlkCDg5IteBpKBZ/nYJFfwCY8C2fVsE=
X-Received: by 2002:a05:6214:3ec:: with SMTP id
 cf12mr11680570qvb.251.1595030800209; 
 Fri, 17 Jul 2020 17:06:40 -0700 (PDT)
Date: Fri, 17 Jul 2020 17:06:33 -0700
Message-Id: <20200718000637.3632841-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v3 0/4] irqchip: Add IRQCHIP_PLATFORM_DRIVER helper macros
From: Saravana Kannan <saravanak@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_200643_815861_C12751F9 
X-CRM114-Status: UNSURE (   8.20  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Saravana Kannan <saravanak@google.com>,
 linux-arm-msm@vger.kernel.org, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, John Stultz <john.stultz@linaro.org>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Made a series out of the previous v2 patch + some example uses of the
macros.

Not sure if the MTK changes work (just compile tested), but saw that
Hanks was trying to make those drivers into tristate. So I assume
they'll work as platform drivers. Please wait for MTK Ack before picking
up patches 3 and 4.

v1-v2:
- Instead of redifining IRQCHIP_DECLARE, created new macros.
- Added more checks in the probe helper function to ensure topological
  probe ordering when fw_devlink is not "on".

v2->v3:
- Added comments
- Changed IRQCHIP_PLATFORM_DRIVER_BEGIN macro parameters

Saravana Kannan (4):
  irqchip: Add IRQCHIP_PLATFORM_DRIVER_BEGIN/END and IRQCHIP_MATCH
    helper macros
  irqchip/qcom-pdc: Switch to using IRQCHIP_PLATFORM_DRIVER helper
    macros
  irqchip/mtk-sysirq: Convert to a platform driver
  irqchip/mtk-cirq: Convert to a platform driver

 drivers/irqchip/irq-mtk-cirq.c   |  4 +++-
 drivers/irqchip/irq-mtk-sysirq.c |  4 +++-
 drivers/irqchip/irqchip.c        | 29 +++++++++++++++++++++++++++++
 drivers/irqchip/qcom-pdc.c       | 26 +++-----------------------
 include/linux/irqchip.h          | 23 +++++++++++++++++++++++
 5 files changed, 61 insertions(+), 25 deletions(-)

-- 
2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
