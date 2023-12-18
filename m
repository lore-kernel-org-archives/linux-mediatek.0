Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CD6C35274
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SpahB+QWv3E3W0OgdhIm0v0VxPS8OkkXBvK7FJGwRD4=; b=LeOmJLxplitkEqtLbmRLh+eIl/
	g8KtO44FhYU902Jgu63J8TixZpLL1WbksrN6CDPDE8VQdhOLclJTIbsZt6nIT+lmLx5s+HEvamZS7
	SYo/ec7MqNmIKMnPzdGh1ILJ5ejkdA/4WJCMdt2FEPpUT3aTpKwhHhuqbTu1moFnarHPlunR4vQZ0
	sVvT+zk2/VqHvqv5UtxhZO6Kpd3UrA9F5iCMECerLvjWNz8bezt68h8Rn7UR/cP0dzCvOHd6kK3i3
	i2mbKNky86dBDXTkTjV6dW02z9H7wYxE17Fz5b2bgfKayGo0GjkgqV0TEL3a7txdtg2q4vkfNN8Ea
	OTI8337w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGZE-00BSzW-29;
	Mon, 18 Dec 2023 16:34:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGZC-00BSyl-1H;
	Mon, 18 Dec 2023 16:34:07 +0000
X-UUID: 402ba8409dc311ee958cff29c719f35b-20231218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SpahB+QWv3E3W0OgdhIm0v0VxPS8OkkXBvK7FJGwRD4=;
	b=jqtVQLtSsl7OjXepjLBzCgbpl3zDsIE156MGPYRiX44pWi7nmdg+FlIQzW1Pp6lyzp3j/dn1iLpZaeIaDFTZISWD/5zcGSdxX3EUHrz9l7pxTOdPrmF43X0PuYnaPziVU5cJv5DQ1Qa96/6PgnahRzR8gNwvkveNNhLEVEKoKh4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:d7dde37e-e7ba-4a21-909b-c5fcdc9391e4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:0c83ed73-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 402ba8409dc311ee958cff29c719f35b-20231218
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1017857978; Mon, 18 Dec 2023 09:34:01 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 19 Dec 2023 00:23:58 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 19 Dec 2023 00:23:57 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <yongdong.zhang@mediatek.com>, yugang.wang <yugang.wang@mediatek.com>, Bo
 Ye <bo.ye@mediatek.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] thermal: fix race condition in suspend/resume
Date: Tue, 19 Dec 2023 00:23:46 +0800
Message-ID: <20231218162348.69101-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_083406_448620_309F76A1 
X-CRM114-Status: GOOD (  15.01  )
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

From: "yugang.wang" <yugang.wang@mediatek.com>

  Firstly, it needs to be clarified that this issue occurs in a real-
world environment. By analyzing the logs, we inferred that the
issue occurred just as the system was entering suspend mode, and the user
was switching the thermal policy (this action causes all thermal zones
to unregister/register). In addition, we conducted degradation tests
and also reproduced this issue. The specific method is to first switch
the thermal policy through a command, and then immediately put the
system into suspend state through another command. This method can also
reproduce the issue.

Body:
  This patch fixes a race condition during system resume. It occurs
  if the system is exiting a suspend state and a user is trying to
  register/unregister a thermal zone concurrently. The root cause is
  that both actions access the `thermal_tz_list`.

In detail:

  1. At PM_POST_SUSPEND during the resume, the system reads all
  thermal
     zones in `thermal_tz_list`, then resets and updates their
     temperatures.
  2. When registering/unregistering a thermal zone, the
     `thermal_tz_list` gets manipulated.

  These two actions might occur concurrently, causing a race condition.
  To solve this issue, we introduce a mutex lock to protect
  `thermal_tz_list` from being modified while it's being read and
  updated during the resume from suspend.

  Kernel oops excerpt related to this fix:

  [ 5201.869845] [T316822] pc: [0xffffffeb7d4876f0]
  mutex_lock+0x34/0x170
  [ 5201.869856] [T316822] lr: [0xffffffeb7ca98a84]
  thermal_pm_notify+0xd4/0x26c
  [... cut for brevity ...]
  [ 5201.871061] [T316822]  suspend_prepare+0x150/0x470
  [ 5201.871067] [T316822]  enter_state+0x84/0x6f4
  [ 5201.871076] [T316822]  state_store+0x15c/0x1e8

  3.Enable thermal policy operation will unregister/register all thermal zones
     10-21 06:13:59.280   854   922 I libMtcLoader: enable thermal policy thermal_policy_09.

  4.System suspend entry time is 2023-10-20 22:13:59.242
     [ 4106.364175][T609387] binder:534_2: [name:spm&][SPM] PM: suspend entry 2023-10-20 22:13:59.242898243 UTC
     [ 4106.366185][T609387] binder:534_2: PM: [name:wakeup&]PM: Pending Wakeup Sources: NETLINK

  5. It can be proven that the absence of a switch strategy will perform
     unregister/register operations on thermal zones (android time is 2023-10-20 22:13:59.282)，
     Because the logs for other thermal zones switching are not enabled by
     default, we cannot see the logs related to other thermal zones.
     [ 4106.404167][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Thermal/TZ/CPU]tscpu_unbind unbinding OK
     [ 4106.404215][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Thermal/TZ/CPU]tscpu_unbind unbinding OK
     [ 4106.404225][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Thermal/TZ/CPU]tscpu_unbind unbinding OK
     [ 4106.404504][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Thermal/TZ/CPU]tscpu_bind binding OK, 0
     [ 4106.404545][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Thermal/TZ/CPU]tscpu_bind binding OK, 2
     [ 4106.404566][T600922] mtkPowerMsgHdl:[name:thermal_monitor&][Thermal/TZ/CPU]tscpu_bind binding OK, 1

  6. thermal_pm_notify trigger KE(android time:  2023-10-20 22:13:59.315894)
     [ 4106.437171][T209387] binder:534_2: [name:mrdump&]Kernel Offset:0x289cc80000 from 0xffffffc008000000
     [ 4106.437182][T209387] binder:534_2: [name:mrdump&]PHYS_OFFSET:0x40000000
     [ 4106.437191][T209387] binder:534_2: [name:mrdump&]pstate: 80400005(Nzcv daif +PAN -UAO)
     [ 4106.437204][T209387] binder:534_2: [name:mrdump&]pc :[0xffffffe8a6688200] mutex_lock+0x34/0x184
     [ 4106.437214][T209387] binder:534_2: [name:mrdump&]lr :[0xffffffe8a5ce66bc] thermal_pm_notify+0xd4/0x26c
     [ 4106.437220][T209387] binder:534_2: [name:mrdump&]sp :ffffffc01bab3ae0
     [ 4106.437226][T209387] binder:534_2: [name:mrdump&]x29:ffffffc01bab3af0 x28: 0000000000000001

Signed-off-by: Yugang Wang <yugang.wang@mediatek.com>
Signed-off-by: Bo Ye <bo.ye@mediatek.com>
---
 drivers/thermal/thermal_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 9c17d35ccbbd..73d6b820c8b5 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1520,12 +1520,14 @@ static int thermal_pm_notify(struct notifier_block *nb,
 	case PM_POST_HIBERNATION:
 	case PM_POST_RESTORE:
 	case PM_POST_SUSPEND:
+		mutex_lock(&thermal_list_lock);
 		atomic_set(&in_suspend, 0);
 		list_for_each_entry(tz, &thermal_tz_list, node) {
 			thermal_zone_device_init(tz);
 			thermal_zone_device_update(tz,
 						   THERMAL_EVENT_UNSPECIFIED);
 		}
+		mutex_unlock(&thermal_list_lock);
 		break;
 	default:
 		break;
-- 
2.17.0


