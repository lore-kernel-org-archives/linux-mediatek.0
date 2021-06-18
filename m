Return-Path: <SRS0=EvOn=LM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5FCC48BE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 13:57:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 047CF611CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Jun 2021 13:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 047CF611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nFiYGYPN6prueX1bXy8P07KMNB88Z6Bs9zRDhZOKYo8=; b=iU95SJlgCImfop
	DShFqwJZssQVyee/j9YiWs+Q1Llrjc8hNUs9mUUPHLKKnwbGP89hUSj2O9TEm5QT150LWyUSpmB/h
	mah2/UqZ/pIOf8bbOQSBwWU5T0lwoR1hAzHpXjBXyvfASV/G6kyn4k8rNArQLlqSR3+xJeyKY+MIB
	3vmx4GgzpbrKhkWo6bk45K17SmGJUjRdcHhcbeVsJCOzKbJogc+lfHkQtxfb98d7GFMxUgYD/hIqm
	X8RLb9CEAy1ZQUYwq0m9HV+R8tzr5AWt8/m59qqBIQbaG0Pa6K21cMwd2MEZVEqiXgY4vhdZiiUTq
	A1RSFN1Bgts716pARy8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luF01-00ENTc-0L; Fri, 18 Jun 2021 13:57:33 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luEzi-00ENLL-3h; Fri, 18 Jun 2021 13:57:16 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G60hz6R0SzXfb6;
 Fri, 18 Jun 2021 21:52:03 +0800 (CST)
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 21:57:08 +0800
Received: from huawei.com (10.90.53.225) by dggema755-chm.china.huawei.com
 (10.1.198.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 18
 Jun 2021 21:57:07 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH -next 0/2] Fix unbalanced pm_runtime_enable in error handle
Date: Fri, 18 Jun 2021 22:11:02 +0800
Message-ID: <20210618141104.105047-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema755-chm.china.huawei.com (10.1.198.197)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_065714_425276_B3577C0F 
X-CRM114-Status: UNSURE (   5.43  )
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

This two patches fixed the unbalanced PM disable depth. It could
avoid pm_runtime implementation complains when removing and probing
again the driver.

Zhang Qilong (2):
  ASoC: mediatek: mt8192:Fix Unbalanced pm_runtime_enable in
    mt8192_afe_pcm_dev_probe
  ASoC: mediatek: mt8183: Fix Unbalanced pm_runtime_enable in
    mt8183_afe_pcm_dev_probe

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 43 ++++++++++++++--------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 27 +++++++++-----
 2 files changed, 44 insertions(+), 26 deletions(-)

-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
