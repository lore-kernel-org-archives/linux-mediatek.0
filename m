Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C283AC47095
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 05:52:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58EE120796
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 05:52:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dIESYadd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDgd2YQZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58EE120796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+hX8jnX1pjQZa20gexu/e4rpFtJuZtCkj5q5Jd0J1SE=; b=dIESYadde1K+aIkoF27R06Ue5F
	3glnG+iqJONeT8NtXqmq069lC1BNNCFxAWrpwCqUuKB0/ONAFOEj3zwrL6YFFRQEkjr+pzpww+0Kj
	xmeumQzUGWhokqmnjuvIw1bidwBWHNF/FtjKXnlvUAUBwRduVBPn0sku2F64fuuxo0ZClWQBdciY0
	QUOjdhrFIYITWjd8IpQhyIE19AjBDg4dv/n6ESJxOqlfAcJRSMhRs+jIbT6nAh9rxoXWt6dNL8W6U
	eMpAtE4VtKgcqIF823PwVXTHiMATIrwexYX2KLlYkRpWz5BIJQpPr+/rD4v074nieeoGwB6hDbK0e
	UaOhHL6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPftD-0005F6-NA; Tue, 06 Oct 2020 05:51:55 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPftB-0005EE-1Q; Tue, 06 Oct 2020 05:51:53 +0000
Received: by mail-pf1-x442.google.com with SMTP id 144so8385826pfb.4;
 Mon, 05 Oct 2020 22:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ERNSfxgas2DII8SXjODRY6IOJVbvcgjIrZFOFrxw68Q=;
 b=nDgd2YQZUqL1nttwrXO/U6M6W5KPXo1VoEtVnvgRmrLNFmjE95JOVRQjsslmvw++Gj
 HoRjvtDIglVlfpBwITfh7XOZVu3LZIoWKlR5faIe1yR1TgZt7LGCJINGiBoM3+PpF2NQ
 2NKyHnZyqTGOkqK956vfN+nXXFsntorWPYR2/bfdsy7aGa/lXr94bq+/bvHII9/JspQH
 dXWdI2PZ+QeSCDe/Sh0hdisJue0hCS6W6SV6SISSy7sNpbxPkVpCq+CfXzOzXmQ+IOai
 WgFPgOeAP4MRRBZRIE+sd6qNmQ6rCKdkxrdkfjLDcQnSY6N5b7NLXSLPVw68n8S3lnoW
 4nJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ERNSfxgas2DII8SXjODRY6IOJVbvcgjIrZFOFrxw68Q=;
 b=i4kDhd08MT1EDC/LJDmEMVST3gnZHA9i8lCQ+HVINoOK1gcu8WvXyjeArMm7HMWfpc
 sBKymR8AwPBdvfAEikihBf0w3btjN7M8YaFl+5OVs7N1y8IHxu0/WfKow8ELKsFuQVND
 Fo2Sm8p7h9jCO7OshnNUuw39BXv4LY/3mnDa4/g4xRksQWQbVEvoEW0hajHjvT8HSXu+
 3k4+wbIB6YLbHLvdVsJ9tU+9Zago+WQWqp8yzYc4ILYpEr28EiRu4edxfKspEXhgXRhQ
 gYbYHREW9/j+mf5HBfsVXJuepQ+kAUA9jQpE9g+KDHAKfGcbmf/6WJ8tO1+rzOR3u5EW
 7IAg==
X-Gm-Message-State: AOAM531GTjuuslnPKZNyXba3LvTik0MNo7upnHy7YFIFnNe+uWim5DIG
 K31P5I6i7vkKLPkXyfPXw6g=
X-Google-Smtp-Source: ABdhPJwAbleMDsb1ZTQ4D/iBDyR3wegYp8LU5qODIJJrXN18xWqRoW+fRBqbmGYZjN4f3cXrm7tS1A==
X-Received: by 2002:a63:465b:: with SMTP id v27mr2580914pgk.318.1601963509151; 
 Mon, 05 Oct 2020 22:51:49 -0700 (PDT)
Received: from localhost.localdomain ([49.207.203.202])
 by smtp.gmail.com with ESMTPSA id x6sm1413685pjp.25.2020.10.05.22.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 22:51:48 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: kvalo@codeaurora.org
Subject: wireless: convert tasklets to use new tasklet_setup() API
Date: Tue,  6 Oct 2020 11:21:33 +0530
Message-Id: <20201006055135.291411-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_015153_093613_B13E60A6 
X-CRM114-Status: UNSURE (   9.85  )
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org,
 Allen Pais <apais@linux.microsoft.com>, davem@davemloft.net, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

 This series converts the remaining drivers to use new
tasklet_setup() API.

 The patches are based on wireless-drivers-next.git

Allen Pais (2):
  ath11k: convert tasklets to use new tasklet_setup() API
  wireless: mt76: convert tasklets to use new tasklet_setup() API

 drivers/net/wireless/ath/ath11k/pci.c              |  7 +++----
 drivers/net/wireless/mediatek/mt76/mt7603/beacon.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7603/init.c   |  3 +--
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c   |  6 +++---
 drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c   | 10 +++++-----
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c  |  7 +++----
 drivers/net/wireless/mediatek/mt76/usb.c           |  6 +++---
 drivers/net/wireless/mediatek/mt7601u/dma.c        | 12 ++++++------
 9 files changed, 27 insertions(+), 30 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
