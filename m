Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90BBC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 08:39:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74DD61176
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 08:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A74DD61176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nTDso72+Ex3gUpCMhYtVIWMl6bCnA3U6kclnjZTrfUI=; b=qEgwqzWrYpoUph
	qfUkO61JyqYDoackNOHVm406eXrfFr0AABghpdzgTr/4tQml5ZCrgdM/8kLDko9lBZ+XqB7ssDUdM
	KyUp6xxjm2PXKIzyXDFV7sRoQxgYCYB/RgFSKJwI+mKO257pnEj5O3PZ+6J+ldaL/8mgCxLzOkAx0
	xMAim81g+U5kznezI2Sx9voALo5F2LiW1etW3hnGt4yFiwAD1BHy0uhkkIfduZvysELBF6UxhoIq1
	N7UjMYQ8+dU24SePHpZDtEpZBuHMlTDBj5TbKYgQCZmVTJ+Lx9aeHixq4xbJ04USlXoipuv1PBkXB
	qsfS6aMrnrXepxp/CctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIoRC-005wxE-M3; Wed, 25 Aug 2021 08:39:10 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIoQt-005wrb-32; Wed, 25 Aug 2021 08:38:52 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 2so6579219pfo.8;
 Wed, 25 Aug 2021 01:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BpHwxqI/LNSicvwBNy0Qv9b112i5l0eIi9/y2JfjKCA=;
 b=McwVEb5kagSEN63cjSvW5zy94quw6o/zlJizlbvPoSaIMjSUxATKhVdHRiTYvt341q
 JeRJEBRZN/Uep5tGrxflF5br0r/uWZa3PyStRiL0t3RB8VPpwyzV/85V0CAJGNVGqAr7
 YrjX3NjlVovQQF9Lx3GwS7baztpak6SYZ9SFHx1vZ+80XrY+zf3q9dgksLodPW0aLFX8
 0S/UcNcFkqQVdf/wek85vJG5I9iBgw5EbjfhD9yHk0HaTGhUQZcJZajrOs60IKE6LXjV
 LjNAVPb6YvE7hXLUIdffUadB5epjj69R37zam1lcOasCI+OLGfLQWb8tc/HnlRrt6XE8
 3whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BpHwxqI/LNSicvwBNy0Qv9b112i5l0eIi9/y2JfjKCA=;
 b=IF1VL2ODu9guvPzf0b/NSI+r01axRTUDF6hbvgeVeHnmZsQKfKxwDnY2iR75V5ptRD
 OC3D4q8o6Cvvb3/fdQ+azI/mWbOWBfQrwNsxpBSeFKXyQw7T0N+Y1Ur3LVTa6cGSyP3x
 SxG5qXDKbt8SjCRbNkcyb4QvMcKR8g7IdazQRARvoOCRZ6FUUWuxlkULv+Mt8vvqFWwL
 m2F171+ZqBmAizhsQ9pd7RWaVeLoCF0V9eEs9/qlN3ZPw+xMObxjRdX8uOokclueaBQV
 EMIYIrviIu4Mz8ECFFm5MtBzI4RPyHoC5AjZu4lQ3W38BZuuku/qiirKQkCrgosL+o3L
 usIA==
X-Gm-Message-State: AOAM5310OCFcSiNTismfO7ohXSqMfDj2+n+kx1Zf+1QiHdsjSJa7khUH
 zvEKb1XIEbscx6j/IGW3Yfo=
X-Google-Smtp-Source: ABdhPJwufn/wD8i8gVcGRxuoTghZYICIl4/Vd1L0dd3zlujKtCAwouwxvyoxPpT7DfJbk8jKsTK5cw==
X-Received: by 2002:a62:ea0f:0:b029:319:8eef:5ff1 with SMTP id
 t15-20020a62ea0f0000b02903198eef5ff1mr43723266pfh.74.1629880722889; 
 Wed, 25 Aug 2021 01:38:42 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id p18sm24872294pgk.28.2021.08.25.01.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 01:38:42 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC net-next 0/2] DSA slave with customise netdev features
Date: Wed, 25 Aug 2021 16:38:29 +0800
Message-Id: <20210825083832.2425886-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_013851_173031_F45855AE 
X-CRM114-Status: GOOD (  11.57  )
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

Some taggers, such as tag_dsa.c, combine VLAN tags with DSA tags, which
currently has a few problems:

1. Unnecessary reallocation on TX:

A central TX reallocation has been used since commit a3b0b6479700
("net: dsa: implement a central TX reallocation procedure"), but for
VLAN-tagged frames, the actual headroom required for DSA taggers which
combine with VLAN tags is smaller.

2. Repeated memmoves:

If a both Marvell EDSA and VLAN tagged frame is received, the current
code will move the (DA,SA) twice: the first in dsa_rcv_ll to convert the
frame to a normal 802.1Q frame, and the second to strip off the 802.1Q
tag. The similar thing happens on TX.

For these tags, it is better to handle DSA and VLAN tags at the same time
in DSA taggers.

This patch set allows taggers to add custom netdev features to DSA
slaves so they can advertise VLAN offload, and converts tag_mtk to use
the TX VLAN offload.

DENG Qingfang (2):
  net: dsa: allow taggers to customise netdev features
  net: dsa: tag_mtk: handle VLAN tag insertion on TX

 include/net/dsa.h |  2 ++
 net/dsa/slave.c   |  3 ++-
 net/dsa/tag_mtk.c | 46 ++++++++++++++++++++++------------------------
 3 files changed, 26 insertions(+), 25 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
