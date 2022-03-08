Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09683C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 23:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vND44qPcXp1XicGAsWpWZqabvtTZURPa6m/0B0rn9Vs=; b=aDPSxF6x+pW1AZ
	yGVfX7QitaEgc0OcjnlK22gyLHC1aGhk4F1LktdEolSRizBSL5gNDc5mqHJ9ww2qlgf7NsN02I4L+
	e/q2bAC0G4vZP50sj931T7shN/es4FYsRbz2UFAKLxG+wqCoIMbLZ6jPU4SUsYz11pmlZraqKvRV7
	KbO1bFRwUCGMV3W+QCgoOdwMHLoJ67C+s3Ih+n78om6U0bmKmPyp3ychlwea4OaCpImhOskAnAyay
	cvTG6vUdZMyP3FgcqIlh6i0Y1lgvUziq8+rqxJoxinkRcnpaPqLaVEJJ6N7pdCSxU9gM7aQiqmnEg
	GHyiDdJsS2RNg0sogBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRjBL-006Xgp-73; Tue, 08 Mar 2022 23:23:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRjB9-006XfI-Fh; Tue, 08 Mar 2022 23:23:44 +0000
X-UUID: 9686a293e1ea4b95a3ae94d6a61695f5-20220308
X-UUID: 9686a293e1ea4b95a3ae94d6a61695f5-20220308
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1695986968; Tue, 08 Mar 2022 16:23:36 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 15:23:34 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 9 Mar 2022 07:23:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 07:23:33 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <alice.chao@mediatek.com>
CC: <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
 <chun-hung.wu@mediatek.com>, <jejb@linux.ibm.com>, <jiajie.hao@mediatek.com>, 
 <jonathan.hsu@mediatek.com>, <lin.gui@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-scsi@vger.kernel.org>,
 <martin.petersen@oracle.com>, <matthias.bgg@gmail.com>,
 <peter.wang@mediatek.com>, <powen.kao@mediatek.com>,
 <qilin.tan@mediatek.com>, <stanley.chu@mediatek.com>,
 <wsd_upstream@mediatek.com>, <yanxu.wei@mediatek.com>
Subject: Re: [PATCH v2 1/1] scsi: Fix racing between dev init and dev reset
Date: Wed, 9 Mar 2022 07:23:33 +0800
Message-ID: <20220308232333.28978-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220308020725.16116-2-alice.chao@mediatek.com>
References: <20220308020725.16116-2-alice.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_152343_554709_9868AD78 
X-CRM114-Status: GOOD (  21.03  )
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

Hi Alice,

Thanks for your patch. I have some questions.

> Device reset thread uses kobject_uevent_env() to get kobj.parent
> after scsi_evt_emit(), and it races with device init thread which
> calls device_add() to create kobj.parent before kobject_uevent_env().
> 
> Device reset call trace:
> fill_kobj_path
> kobject_get_path
> kobject_uevent_env
> scsi_evt_emit			<- add wait_event()
> scsi_evt_thread
> 
> Device init call trace:
> fill_kobj_path
> kobject_get_path
> kobject_uevent_env
> device_add				<- create kobj.parent
> scsi_target_add
> scsi_sysfs_add_sdev
> scsi_add_lun
> scsi_probe_and_add_lun

These are backtraces, and the things above looks like your solution, not
the problem.
It's better to describe the problem first and solution later:

Device init call:                              Device reset call:   
scsi_probe_and_add_lun()                       scsi_evt_thread()
  scsi_add_lun()
    scsi_sysfs_add_sdev()                        scsi_evt_emit()
      scsi_target_add()                            kobject_uevent_env() 
        device_add()                                 kobject_get_path() // something wrong?
	                                               fill_kobj_path()
	  get_device_parent() // I see a get, not create parent kobj, could you show me that point?
	  kobject_uevent()
            kobject_uevent_env()
              kobject_get_path()
                fill_kobj_path()

> 
> These two jobs are scheduled asynchronously, we can't guaranteed that
> kobj.parent will be created in device init thread before device reset
> thread calls kobj_get_path().

What happens if device reset thread calls kobj_get_path() before kobj.parent's
creation? a crash or something?

> 
> To resolve the racing issue between device init thread and device
> reset thread, we use wait_event() in scsi_evt_emit() to wait for
> device_add() to complete the creation of kobj.parent.
> 
> Signed-off-by: Alice Chao <alice.chao@mediatek.com>

When we send patch N+1, we have to put the change log between patch v1 to vN
under a "---", so others can understand the changes between patch N and N+1.
e.g.,

---

Change since v1
- remove Change-Id

> ---
>  drivers/scsi/scsi_lib.c  | 1 +
>  drivers/scsi/scsi_scan.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index 0a70aa763a96..abf9a71ed77c 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -2461,6 +2461,7 @@ static void scsi_evt_emit(struct scsi_device *sdev, struct scsi_event *evt)
>  		break;
>  	case SDEV_EVT_POWER_ON_RESET_OCCURRED:
>  		envp[idx++] = "SDEV_UA=POWER_ON_RESET_OCCURRED";
> +		wait_event(sdev->host->host_wait, sdev->sdev_gendev.kobj.parent != NULL);
>  		break;
>  	default:
>  		/* do nothing */
> diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
> index f4e6c68ac99e..431f229ac435 100644
> --- a/drivers/scsi/scsi_scan.c
> +++ b/drivers/scsi/scsi_scan.c
> @@ -1904,6 +1904,7 @@ static void do_scsi_scan_host(struct Scsi_Host *shost)
>  	} else {
>  		scsi_scan_host_selected(shost, SCAN_WILD_CARD, SCAN_WILD_CARD,
>  				SCAN_WILD_CARD, 0);
> +		wake_up(&shost->host_wait);

do_scsi_scan_host() is not in the call trace above, could you show the relationship
of do_scsi_scan_host in the call flow?

thanks,
Miles

>  	}
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
