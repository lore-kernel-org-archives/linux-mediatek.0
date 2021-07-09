Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B782C07E96
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 02:24:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6987661457
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 02:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6987661457
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P7KTFlii0U5AdTmpN53qvXVSMq3ynldAk5MBSni+yvM=; b=gstfrRVtfMRDtj
	UNP0KjhVy9hmOx+fCCw82krZfbZBhStz1ADnQqFM/Cor57d01xfzSIctI7JjHS59FJstqYV1X8xtd
	jyrKOKmNx+x06Kta3ZcaC17Kh7GIONV0vkwcT4bGsfMBFU3ZZLoQ2jAcne9H57h2a1w8K+DqwQtzn
	dPWb91RGA4onNnEXo5SfZ7k4kWId4uCClABKJxzbXJ9YvfuAoDEDv5GXZ4G2+eYnubgBLrh2GNoUL
	wCzWbIe3ocj9Iz2a1HM66o7ZPug6xgFK8mt10C43YVrBWGb5EDMSiFyDpKjAuMeaBZvXt62mHCikg
	NQkDs6EGtZHf9eRqbz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1gBI-000ZBY-Df; Fri, 09 Jul 2021 02:23:56 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1gB1-000Z3c-U7
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 02:23:41 +0000
Received: by mail-pg1-x530.google.com with SMTP id v7so8435180pgl.2
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 19:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+EpRX0Vvrt/sxvQaLYzDThoftpQT11+CjjVmmHJsPQ=;
 b=gJLwSUixj0oppWCY0qYOf+jJ5N0MAYwYaN0OXz/iZpqNxCNOZIJobLE7kEOvgZh83Q
 Z1Bsw4thmyaGtN9IqzWNPGtuajf76sDwpaHoQACS4z309aS298OMRQ3Jk38pwShDvTsB
 dsf59RphRpyWaeOhXbBkJF2S7t8KfRG8mgx7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v+EpRX0Vvrt/sxvQaLYzDThoftpQT11+CjjVmmHJsPQ=;
 b=dHjMGSIbyv7b9kTqH7eUhp5ZRBhkV2APNPFkGkWNyud3M9vOpIeRJEGdlG0KQ+l0zj
 +w7SEan6TMW8nj9iLkwWJlTrynjs7e6bDfoowdfFCQxv7do32ydd+U/iiHXnRfw/3TMv
 0jc/nzm4Jtx6bqEdb8T89Mi6/ujOAbqYe1pTTg1sgnTRpmVFNI+Bw9Rx0/Sa8L+xFOwc
 vOoEP2UZRPIv3KJH9LDad9TxSJ4wpyfqULkHSB4fIYKUkQJhJ+BC8rbyIFocItNMTMxh
 OnJYfaVe2D0otipuwq5F/KUOZzn0+qO1dR5+ImjQQqkGOUHo5hJvwEII7oFBgZvCRfxe
 c2Qg==
X-Gm-Message-State: AOAM531HxBsZCemAu8ZHiFg61EDz+cIKot5cI/mI1ypPd0+adkzVdbmu
 O3Gk+xquApejyEbYLb5t8rEXcg==
X-Google-Smtp-Source: ABdhPJxPINrKdc1ApCi7yYTCgm1y1Wps8+Yvwq+AF+aVfmGq/+OZBFtFlp1ODDIBVYVGdA6WjgQV7A==
X-Received: by 2002:a63:d612:: with SMTP id q18mr35353686pgg.77.1625797416524; 
 Thu, 08 Jul 2021 19:23:36 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:d956:2966:7910:2bd2])
 by smtp.gmail.com with UTF8SMTPSA id x6sm5147650pgq.67.2021.07.08.19.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 19:23:36 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: wenst@chromium.org, chunkuang.hu@kernel.org, yong.wu@mediatek.com,
 enric.balletbo@collabora.com, houlong.wei@mediatek.com,
 Eizan Miyamoto <eizan@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v5 0/8] Refactor MTK MDP driver into core/components
Date: Fri,  9 Jul 2021 12:23:16 +1000
Message-Id: <20210709022324.1607884-1-eizan@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_192340_082148_A2F5AFFB 
X-CRM114-Status: GOOD (  12.85  )
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


This is an update to
https://patchwork.kernel.org/project/linux-mediatek/list/?series=283075
To address some comments and fixes.

This series has been verified to work on 5.13.


Changes in v5:
- rebase and build-test on 5.13-next @ e2f74b13dbe6

Changes in v4:
- rebase and test on 5.13
- don't depend on https://patchwork.kernel.org/project/linux-mediatek/list/?series=464873

Changes in v3:
- get mdp master from aliases instead of strcmp against of_node->name

Changes in v2:
- rebased onto Linux 5.12
- 100 char line length allowance was utilized in a few places
- Removal of a redundant dev_err() print at the end of
  mtk_mdp_comp_init()
- Instead of printing errors and ignoring them, I've added a patch to
  correctly propagate them.
- Use of C style comments.
- Three additional patches were added to eliminate dependency on the
  mediatek,vpu property inside the mdp_rdma0 device node.

Eizan Miyamoto (8):
  mtk-mdp: add driver to probe mdp components
  mtk-mdp: use pm_runtime in MDP component driver
  media: mtk-mdp: don't pm_run_time_get/put for master comp in clock_on
  mtk-mdp: soc: mediatek: register mdp from mmsys
  media: mtk-mdp: search for vpu node instead of linking it to a
    property
  media: mtk-mdp: propagate errors better in pm_suspend/resume
  media: mtk-mdp: use mdp-rdma0 alias to point to MDP master
  dts: mtk-mdp: remove mediatek,vpu property from primary MDP device

 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   1 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 272 +++++++++++++++--
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  36 +--
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 281 ++++++++++++------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   3 +
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c  |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c              |  20 +-
 7 files changed, 473 insertions(+), 144 deletions(-)

-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
