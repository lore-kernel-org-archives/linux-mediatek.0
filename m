Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA723C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:04:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B556461078
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B556461078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/C4zdg4I2exaKTCG4cWIoQaReUBJ1r39l2Za8Jy/JU8=; b=Ubw4WfXMI84nLM
	U9gfON7Dps+4A978ldXagJeTd7d6wNIfSPTnFrXZrBmYOetoSo7ILaihK1W7lbrdwxT/PpRg6quKA
	bUvfjc9pPHnf+kHxfVCCPHJythBiByTfMYWhu4pthxSpL83hsVUXejnloqyAjulFQIqZlMd+LyjC0
	/tG5Uhd8fkuVufpo7JW0Oj+29rp3BOIYMHJNzKO2/jR3SC5QnPdQTN7koRorvaKdKpHV8aB7dCxP4
	Q/th6efH14RhmF+tR4EZB6Z5i13DcSLYA5Miv8fJ5XFhHDui6Y6P1Wml4697rd6Q38OJAiU3VdY85
	3U5oV9KVIz3qRQiBWNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAwu7-003WRm-2J; Tue, 03 Aug 2021 16:04:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAwtu-003WPX-BO; Tue, 03 Aug 2021 16:04:19 +0000
Received: by mail-pl1-x631.google.com with SMTP id c16so24275771plh.7;
 Tue, 03 Aug 2021 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Q+M9bdfzC5vw78BK6KF6b7X1yy5cTQ6a22GkGLbvW8=;
 b=EL6GO19w/yJX4+hYApVgoQg03d4gp72M5TckCBpAxCoSwFnzcgS9agnQbNQiPTTIvR
 53OlXPv7BPOh7DjH9xOt9GPMFo+Wf/V+ASVsEPeFMio9dH/SDGa1NrUCa/xQa56E5FQt
 BzeiVT4VzatMocLdr+hQlIgdTGNfhhHzAjI9T8yjHeHTN/+p82zKejs93QvgtfSRoORa
 EMNwTkwbOi7VFoseVVpFY7MY4wDFc/mdXFXfxD0dhWrCA6JGMPf/1THayV9WBdq4BXv/
 I66X4qJft2+Dsr6VVIhsU8H9HePaiKhD4+ciIZEUSE2gaNdVU2xs5XErXpLw7wRV68Pk
 b72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Q+M9bdfzC5vw78BK6KF6b7X1yy5cTQ6a22GkGLbvW8=;
 b=i95zHwj/z36YJ/CwJxMr5XA9C9ouKvfC7MsNfRqpf9D/r343nWytQI6LomtdtUJ959
 hqY1TlNRHccKEdL7+8GjLu+VnplgiQDoOsrOXmCRqZjoQnjt4xjJnYgdisf/AKLlAIV/
 x1fnBeFo3tWmt0EFCJ+QKKpvzWqo5LZ/w0b9c/+KrKomXz9J8bi0z+L1g1vup3pE2SX9
 aZmzUG8I5bEAWkliXv6YSmN9jP8ZQVwFkj01laNyrotw/mEt9iN5hwWkXyUELHpop0As
 rCXhwmBGyitxVZpuQdgnf1vULzdJJoJD1FfswrN6K81sMn3oAunt8zrjKr6Ycj8upnq1
 kSJA==
X-Gm-Message-State: AOAM5316aiwlIb2XMF1ZQPfr5KPxBLi82mbyD/YUXzwBwd6NpEtiX4Uh
 PtisbDg679wpEHSE0gHT87M=
X-Google-Smtp-Source: ABdhPJxe1Q/tx1mCHBBgNfuGn0U0PA6NgtEr/CiQbM+pLNCCSAHZbz6U3WIyTP0ViiUweMKXBNDoaQ==
X-Received: by 2002:a17:90a:c912:: with SMTP id
 v18mr23181709pjt.135.1628006656475; 
 Tue, 03 Aug 2021 09:04:16 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id y6sm14390653pjr.48.2021.08.03.09.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:04:15 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Eric Woudstra <ericwouds@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 0/4] mt7530 software fallback bridging fix
Date: Wed,  4 Aug 2021 00:04:00 +0800
Message-Id: <20210803160405.3025624-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_090418_448983_EAE257DB 
X-CRM114-Status: UNSURE (   7.65  )
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

DSA core has gained software fallback support since commit 2f5dc00f7a3e
("net: bridge: switchdev: let drivers inform which bridge ports are
offloaded"), but it does not work properly on mt7530. This patch series
fixes the issues.

DENG Qingfang (4):
  net: dsa: mt7530: enable assisted learning on CPU port
  net: dsa: mt7530: use independent VLAN learning on VLAN-unaware
    bridges
  net: dsa: mt7530: set STP state on filter ID 1
  net: dsa: mt7530: always install FDB entries with IVL and FID 1

 drivers/net/dsa/mt7530.c | 88 ++++++++++++++++++++++++++++------------
 drivers/net/dsa/mt7530.h | 14 +++++--
 2 files changed, 72 insertions(+), 30 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
