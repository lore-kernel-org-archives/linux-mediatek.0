Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CD5C43214
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 17:54:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57C561050
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 17:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E57C561050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6FZNfCGrrZei9OIEiiq+Fcf11+IszjuvakibKzILwds=; b=tE5cqc7oYX0u8y
	Tm0/8HJYg9pOMZ55fJOARUHlRxYSdwbeEXL66WEv7/w8SrUcT2y6qV/xTd32D9rdckMkY1qA81/xu
	7swF21ikKMuO4FLj28Gh+3Hbw5LQFsZY8Em11VzogQ9Kqb4EKNqb4mTy16x48bHNrgQuBReXT0otU
	89+ezubxqrDqJ7K8VhEb+rA+H4Bu0h8MFjdTfdEbNNIFLUEwgy4arjiC2bRv482o5Fwhm1gWjCBQQ
	fjkNDf9LH/eXA6I5CMybLsIYj5qN/1JjBTK+F7Wc0IKriyNo+QRZbkah+gxhGDykpMf2GOeFAo6Xf
	gtsO8hFVcz+4eMLGBVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8nkk-001uRR-Co; Wed, 28 Jul 2021 17:53:58 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8nkW-001uNS-M2; Wed, 28 Jul 2021 17:53:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id c16so3614505plh.7;
 Wed, 28 Jul 2021 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CqC/y43oRDqwumvGYr6lFf4wlaUhzXlkiMRga/8qMaI=;
 b=VtjDnXuGL8pZetR604ItURIMyKVUzEYtsaZpaNLPJrSmCDbfzq/K0x9UdoV2zpQc+T
 slJgFb2lKP3CLNZfKXOyCpEuChf6IgLAV5rG8hU5u44d4nLo/ZFa+LgjIOKM97HPU8Lh
 kqWhN1/+/jizFuRzUadqqP2n7w9+LQIqbA9gnxfwnQ2UjIKG3c03lCdbNQjGGk2R/xFO
 5x8DSHXI+G7DYc6fvapF8DXfk1/OZ3LlBoK0dCKl0FzEzYDdSJ+a0vjXQEJb8urP8JC/
 pXJw1NWSu1P+QNBEaT6f9DXcOKZy1Rx487g+jjcOvnN2oZ/IgujVj9DmmP+NW3wcYPnH
 VpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CqC/y43oRDqwumvGYr6lFf4wlaUhzXlkiMRga/8qMaI=;
 b=Um8MyVLRIhemEjXNMXgUT8eoswTD1fxczv+iiwQdkC1Jo/Ofu6D44e1oCbgTvius8B
 04fB6M7nctSwR3JRi9SBvalunj70KEdMuh59XVq9y+4XWClQkwOHdeWpMdMFE79biFUN
 LaLMHfd6/1EId2/2vwPtOdK6ZFA2/kcHWF6md/5reeuxAu5LxXh+KDcxcLhadylaPMJY
 G34RBOxl4BkIfdzf53ltzDHn2xAudavXxpEUaj3OFvdCcRk9iP16oeVElYZ5nndAPlFm
 dFLRjV4/ahTvA8e/+uUeA9q21KoBVrB/Ahz0mdaTYRrrJbMvom9d9pdh5jQWiDhsfQSl
 hD5A==
X-Gm-Message-State: AOAM530Tme7Z+SpCS3bFtXXlU1dQ5sKF0x1oafrhZWQ3kcpEHwm7Z2o+
 isS/JvPHZIYRNdPnVmCirKw=
X-Google-Smtp-Source: ABdhPJxoVFgkCnrOit0lnmP8E7BLwYdhJCroaIPJkDys6vCMRIAt/Wiepmuv8jIoCZI9f6F+FKRioQ==
X-Received: by 2002:a65:41c9:: with SMTP id b9mr82281pgq.322.1627494821168;
 Wed, 28 Jul 2021 10:53:41 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id m19sm647113pfa.135.2021.07.28.10.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 10:53:40 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC net-next 0/2] mt7530 software fallback bridging fix
Date: Thu, 29 Jul 2021 01:53:24 +0800
Message-Id: <20210728175327.1150120-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_105344_789552_8CDEADA0 
X-CRM114-Status: UNSURE (   8.23  )
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

DSA core has gained software fallback support since commit 2f5dc00f7a3e,
but it does not work properly on mt7530. This patch series fixes the
issues.

DENG Qingfang (2):
  net: dsa: tag_mtk: skip address learning on transmit to standalone
    ports
  net: dsa: mt7530: trap packets from standalone ports to the CPU

 drivers/net/dsa/mt7530.c | 28 ++++++++++++++++++++
 drivers/net/dsa/mt7530.h | 56 ++++++++++++++++++++++++++++++++++++++++
 net/dsa/tag_mtk.c        |  6 ++---
 3 files changed, 87 insertions(+), 3 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
