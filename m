Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0EFC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 03:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTz94m0ChgYvoExc1q4KYKJnwUNajfLxlZy+6zJmul4=; b=I7Dm4h/tO9aiUXdG7k0AiwCn3Z
	x+e2tihaaGAdDTfL8xGTU4tBAbkQG0B3IemWNi0wkQAkTcarcZM8b9H8zbkRC8+NwumuHDWTT/cYY
	e1335Ity1larsBtyaON8eKnILZnSY0wTcDtpgbCdWByOKmJ5nM7+tTHE8Ej2TR51jyS8/9lmNisul
	4Ni06yGCvtIv3lxtepdnxUd1ahojBYAtNK1cmvFr9rf3yflKdsOdqWe5bXMHxzhJSX6UCW2jZ7dNn
	0pAuK4BJ+6wW4zVKAE5XFRroIA3xVAuXTNURUrC7ZHIujChRN7vUNjGkSLRdhz7gXW36mnhHC2688
	48uOo/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3pJE-00000005wDz-2ulL;
	Mon, 06 May 2024 03:46:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3pJA-00000005wDW-0P8V
	for linux-mediatek@lists.infradead.org;
	Mon, 06 May 2024 03:46:34 +0000
X-UUID: 36f4def80b5b11efa8f1cd58ee6c2400-20240505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OTz94m0ChgYvoExc1q4KYKJnwUNajfLxlZy+6zJmul4=;
	b=ZcWaNa2aWw7mSZka15woZwHKNsK0r1gyqkd4xDQLzAv56CM3dW7B3biShpiy+xyFcblX3OBeEuBeVRUdUTizgVyCO06js8hBg1dzxpdgTvo+abYsBFiwVqAT5fplZqUbR+xn/MH8CGQREs8yAR7USbotwhGBZOqW+4HILmU/V4o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:e3660c71-0527-45b5-bac2-0a1fd07e8158,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:20a5fc86-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 36f4def80b5b11efa8f1cd58ee6c2400-20240505
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <joe.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1362238310; Sun, 05 May 2024 20:46:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 May 2024 11:36:20 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 May 2024 11:36:20 +0800
From: Joe.Zhou <Joe.Zhou@mediatek.com>
To: <ulf.hansson@linaro.org>
CC: <Joe.Zhou@mediatek.com>, <Peng.Zhou@mediatek.com>,
	<Sharp.Xia@mediatek.com>, <Sophie.Wang@mediatek.com>,
	<Wey.Zhang@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-mmc@vger.kernel.org>, <wsd_upstream@mediatek.com>
Subject: Re: [PATCH] mmc: race condition between "sdcard hot plug out" and "system reboot"
Date: Mon, 6 May 2024 11:36:44 +0800
Message-ID: <20240506033644.10538-1-Joe.Zhou@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAPDyKFoB+r7KMdbV-svz9d=WdPm1Zvd6oZppzbsPDWqX7YN_Kw@mail.gmail.com>
References: <CAPDyKFoB+r7KMdbV-svz9d=WdPm1Zvd6oZppzbsPDWqX7YN_Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.385200-8.000000
X-TMASE-MatchedRID: L8tZF6zWW2ov59IrsuHOQvHkpkyUphL9EtdrY/Wb3fPagsZM0qVv16Dx
	dGOQK0e05JZCSInyPcTiDsO2i4yReqgHoGQqnHWREwyZyuMQ410F15s6prCIu92syzTqbBJqUHw
	ogQlwTkld9QijPIgKRT49AUJcbsuYlEx3ASJaTY0XrP0cYcrA2xhH6ApagZfOnp9KgXcu34y7SB
	OwG7Q1A5zfncsmAkm5xJSRiaNdU9w5UybSecwyCIlmrWVDo+jrIaVkFIrQFhtoMXogvMW/faPFj
	JEFr+olwXCBO/GKkVr3FLeZXNZS4EZLVcXaUbdiSimlDBPA/qf+8wzIzvZabdPgyKLYvQEwaKgC
	DeFIijeeqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.385200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 86F016D48AA4A86D76978ADFC68B60A279B90159A94926D440E21652D04C57C82000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_204632_177478_32ADB644 
X-CRM114-Status: UNSURE (   7.01  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Joe Zhou <Joe.Zhou@mediatek.com>

> Thanks for your patch!

> Doesn't commit 66c915d09b94 ("mmc: core: Disable card detect during
> shutdown") take care of this problem?

> Kind regards
> Uffe


Dear Ulf,
     Thank you for your replay!

     I think that commit66c915d09b94 ("mmc: core: Disable card detect during shutdown") doesn't reslove this issue.
     1. Issues may asise in the following processing.
     sdcard hot pulg out:                                  SyS_reboot:
     CPU0                                                  CPU1
     _mmc_detect_change() {
     ......
     mmc_schedule_delayed_work(&host->detect, delay)
     #Step1: call delay work &host->detect
         mmc_rescan()
         {
          .......
              #Step2: detect SD card removed
              mmc_sd_detect() {                              ......
                                                             _mmc_stop_host (.pre_shutdown)
                                                            {
              ......                                        #Step3:_mmc_stop_host() cancel detect use sync
                                                            cancel_delayed_work_sync(&host->detect)
                                                            #Step4: wait delay work complete
                                                            }
                 if (err) {
                 #Step5: host->card is NULL
                 mmc_sd_remove(host);                        ......
                                                            #Step6: wait delay work complete
                                                            mmc_sd_suspend (.shutdown)
                                                            {
                                                             ......

                                                            #Step7:_mmc_sd_suspend claimed host
                                                            mmc_claim_host(host);
                                                            #Step8: use host-card(NULL pointer)
                                                            if (mmc_card_suspended(host->card))
                                                             ......
                                                            }
                 mmc_claim_host(host);
                 mmc_detach_bus(host);
                }
             }
          }
       ......
      }

     2. And in the version that includes the patch, we have reproduced the issue.

Best regards,
Joe

