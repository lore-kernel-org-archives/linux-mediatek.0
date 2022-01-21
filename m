Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 22:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=viHyzVfJFfxTJ49GAGfr4HHKys0CJuI8uU2F0k0J9y4=; b=OVIYUoBZEOnHz1
	Y0gksuCF+jiHSL1jSkPYuvFD9e5reX5Vg5sAJPlvDzLU0dIHKFc6c6kTs/3fo2mw10RZJHWVRziz5
	Q2lreoZI6IB+lQw/QBDg57+03qKUCRzBFgLACwdJoOK8xz4xnARpqzsPQvWQfcF/AgaNLnyfypQd/
	rHPVz8lJA7ULT6H1PjOplKpoSNrc4TdO1MYfQPjlZrKGVbmIYAadZCLFlVFusWsOt3DSUNGIF1z62
	AAvHxP9JqSlqLOAIKuyOV3tAADeugVNx3C7u3hTFaaShBc+m3+t7Too6q5HapQT8Q0EZd1aaItHzq
	tra8uh2Pa90d63Czk4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nB2lQ-00GDDp-0F; Fri, 21 Jan 2022 22:52:12 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nB2lN-00GDD5-DV
 for linux-mediatek@lists.infradead.org; Fri, 21 Jan 2022 22:52:11 +0000
Received: from smtpclient.apple (p4fefca45.dip0.t-ipconnect.de [79.239.202.69])
 by mail.holtmann.org (Postfix) with ESMTPSA id CE4F5CED1A;
 Fri, 21 Jan 2022 23:52:02 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 1/7] Bluetooth: mt7921s: fix firmware coredump retrieve
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <bddfacd096b6fe927d08e48ad6993c17c9954028.1641972745.git.objelf@gmail.com>
Date: Fri, 21 Jan 2022 23:52:02 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?= <Mark-YW.Chen@mediatek.com>, 
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, michaelfsun@google.com, mcchou@chromium.org,
 shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <A55FE370-4F70-4CA3-BB95-7220EB73D68F@holtmann.org>
References: <bddfacd096b6fe927d08e48ad6993c17c9954028.1641972745.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_145209_649326_8C0697F2 
X-CRM114-Status: GOOD (  11.25  )
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

Hi Sean,

> According to the MCU firmware behavior, as the driver is aware of the
> notification of the interrupt source FW_MAILBOX_INT that shows the MCU
> completed delivered a core dump piece to the host, the driver must
> acknowledge the MCU with the register PH2DSM0R bit PH2DSM0R_DRIVER_OWN
> to notify the MCU to handle the next core dump piece.
> 
> Fixes: db57b625912a ("Bluetooth: btmtksdio: add support of processing firmware coredump and log")
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btmtksdio.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)

all 7 patches have been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
