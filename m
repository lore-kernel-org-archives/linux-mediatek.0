Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CFEC54EBC
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 01:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bfXJhM3jfsvxM4ujHI3kzKKGuay9TnUa3pjw6jLxvus=; b=Y+EMc7slI2ILdQo7Hqwof6fBHR
	llwEUUqP4NfO0qwfBtiusDqzshbazk+SbTH43g1RRpAIixsZ7DkLFn+Nlm8Qq6P6L5ef8PDxAP4bB
	Gw4N3QTvutP9G4MQ6vqpiex1SXSd8mVfLBDaNgzZTW1+oTFWrfYtM69X2CPD4COM07OYPOOcxnS3p
	Vxd5utKKFjbjKNHE4SkcYFJz6PI5fQe7nvc66y3yLU1eXln8UqBetj4ChjvFClB5rX+zUcrXu5IV6
	hC0+Qqzoxt0bdVScDG1CLnJKppahQ7ZXw52vLaU1wWu2PQAv77VsOf3KyAk4r4U2iTQXjd1MN0iy0
	+opZyJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEh4a-00Gg8r-05; Mon, 09 Jan 2023 01:35:36 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEh4V-00Gg7U-G6; Mon, 09 Jan 2023 01:35:34 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTP Server V5.0(16482:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>); Mon, 09 Jan 2023 09:34:54 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 9 Jan
 2023 09:34:53 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Mon, 9 Jan 2023 09:34:53 +0800
From: <cy_huang@richtek.com>
To: <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
	<matthias.bgg@gmail.com>
CC: <gregkh@linuxfoundation.org>, <gene_chen@richtek.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	ChiYuan Huang <cy_huang@richtek.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] usb: typec: tcpm: Fix altmode re-registration causes sysfs create fail
Date: Mon, 9 Jan 2023 09:34:52 +0800
Message-ID: <1673228092-27281-1-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_173532_055476_B2E15DA9 
X-CRM114-Status: GOOD (  11.61  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

There's the altmode re-registeration issue after data role
swap (DR_SWAP).

Comparing to USBPD 2.0, in USBPD 3.0, it loose the limit that only DFP
can initiate the VDM command to get partner identity information.

For a USBPD 3.0 UFP device, it may already get the identity information
from its port partner before DR_SWAP. If DR_SWAP send or receive at the
mean time, 'send_discover' flag will be raised again. It causes discover
identify action restart while entering ready state. And after all
discover actions are done, the 'tcpm_register_altmodes' will be called.
If old altmode is not unregistered, this sysfs create fail can be found.

In 'DR_SWAP_CHANGE_DR' state case, only DFP will unregister altmodes.
For UFP, the original altmodes keep registered.

This patch fix the logic that after DR_SWAP, 'tcpm_unregister_altmodes'
must be called whatever the current data role is.

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
Fixes: ae8a2ca8a221 ("usb: typec: Group all TCPCI/TCPM code together)
Reported-by: TommyYl Chen <tommyyl.chen@mediatek.com>
Cc: stable@vger.kernel.org
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Since v2:
1. Correct the mail sent from Richtek.
2. Add 'Reviewed-by' tag.

---
 drivers/usb/typec/tcpm/tcpm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 904c7b4..59b366b 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4594,14 +4594,13 @@ static void run_state_machine(struct tcpm_port *por=
t)
                tcpm_set_state(port, ready_state(port), 0);
                break;
        case DR_SWAP_CHANGE_DR:
-               if (port->data_role =3D=3D TYPEC_HOST) {
-                       tcpm_unregister_altmodes(port);
+               tcpm_unregister_altmodes(port);
+               if (port->data_role =3D=3D TYPEC_HOST)
                        tcpm_set_roles(port, true, port->pwr_role,
                                       TYPEC_DEVICE);
-               } else {
+               else
                        tcpm_set_roles(port, true, port->pwr_role,
                                       TYPEC_HOST);
-               }
                tcpm_ams_finish(port);
                tcpm_set_state(port, ready_state(port), 0);
                break;
--
2.7.4

************* Email Confidentiality Notice ********************

The information contained in this e-mail message (including any attachments=
) may be confidential, proprietary, privileged, or otherwise exempt from di=
sclosure under applicable laws. It is intended to be conveyed only to the d=
esignated recipient(s). Any use, dissemination, distribution, printing, ret=
aining or copying of this e-mail (including its attachments) by unintended =
recipient(s) is strictly prohibited and may be unlawful. If you are not an =
intended recipient of this e-mail, or believe that you have received this e=
-mail in error, please notify the sender immediately (by replying to this e=
-mail), delete any and all copies of this e-mail (including any attachments=
) from your system, and do not disclose the content of this e-mail to any o=
ther person. Thank you!

