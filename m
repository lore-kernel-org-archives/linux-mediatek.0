Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCDAC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 11:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1fQtbU2xCnCtNAD1uoQcCQ0vKe7X6uYstVN3t9WTs5Q=; b=cGT7492DpKpIH0bJmCce36D7q7
	jBsFFyY9x5sElrK6n6w8jc1Xnp3A1SCSf9qMJREhP+9oaT+6Uepf/eGSWaNZbIBTYXvahZnUk3Jlg
	feDmZxLdti599a6vJJsAbyl/g74N+6Qr1SGzVz+lijyIfiVDZfYj9ji4+McwTvmuFWAaCx9jjhh9G
	xMPJpo03n3PrR/AVKjKlo7ZXoK5h2u1KNsG8C9TeFUUDT+UJOhv1xh8gUPLYcsiPUvy0Bh7YKWdAG
	DcUw0vk3meHm714yKM6LTcAOKz9KKvZsquBoyiKPMPbkwEhSxvAcmUVkdCwJlzXp5usQbc6xGJwLn
	MUL8IgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfBg-00Cw37-0B; Wed, 27 Jul 2022 11:26:48 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfBc-00CvyA-Gj
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 11:26:46 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5454A37643;
	Wed, 27 Jul 2022 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658921199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1fQtbU2xCnCtNAD1uoQcCQ0vKe7X6uYstVN3t9WTs5Q=;
	b=W20gMLv5MgxHnYrjaIk4GhYWWerWWCJzbWlxbauNNrFh9+sinnpCWncbtnCB/UECrYC/FX
	FM0QMO7UWiGoSfi/Mp7qfqGU0jini/+MYyDpISz+IoG3CnBYzO6newaW9gN2ZadkHB+bi0
	+L+ReXGXAX9roAWPIvEnstD/qhED1RY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658921199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1fQtbU2xCnCtNAD1uoQcCQ0vKe7X6uYstVN3t9WTs5Q=;
	b=laf3znNtppYHOQxA4xWxUVO1BH46vIUnZ9NZdTGuQXQ7+8ubLKrlLcAhF/0m0XVkHGHTCs
	AxaMvtH82UVWxBDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1106A13A8E;
	Wed, 27 Jul 2022 11:26:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yIyJAu8g4WLTfwAAMHmgww
	(envelope-from <jdelvare@suse.de>); Wed, 27 Jul 2022 11:26:39 +0000
Date: Wed, 27 Jul 2022 13:26:37 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chenglin Xu
 <chenglin.xu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH RFC] regulator: mt6380: Fix unused array warning
Message-ID: <20220727132637.76d6073f@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_042644_727729_76DC9033 
X-CRM114-Status: GOOD (  15.04  )
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

With the following configuration options:
CONFIG_OF is not set
CONFIG_REGULATOR_MT6380=3Dy
we get the following build warning:

  CC      drivers/regulator/mt6380-regulator.o
drivers/regulator/mt6380-regulator.c:322:34: warning: =E2=80=98mt6380_of_ma=
tch=E2=80=99 defined but not used [-Wunused-const-variable=3D]

Fix this by annotating that array with __maybe_unused, as done in
various regulator drivers.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/all/202207240252.ZY5hSCNB-lkp@intel.com/
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chenglin Xu <chenglin.xu@mediatek.com>
---
This assumes that the mt6380 driver can be used without OF support.
However, I can't find any in-tree piece of code instantiating the
"mt6380-regulator" platform device by name. So unless there's an
out-of-tree user, a better fix would be to remove mt6380_platform_ids
and make the driver depend on OF. Chenglin, would that be OK with
you?

 drivers/regulator/mt6380-regulator.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-5.18.orig/drivers/regulator/mt6380-regulator.c	2022-07-27 11:55:2=
1.672421481 +0200
+++ linux-5.18/drivers/regulator/mt6380-regulator.c	2022-07-27 12:01:53.151=
833378 +0200
@@ -319,7 +319,7 @@ static const struct platform_device_id m
 };
 MODULE_DEVICE_TABLE(platform, mt6380_platform_ids);
=20
-static const struct of_device_id mt6380_of_match[] =3D {
+static const struct of_device_id  __maybe_unused mt6380_of_match[] =3D {
 	{ .compatible =3D "mediatek,mt6380-regulator", },
 	{ /* sentinel */ },
 };


--=20
Jean Delvare
SUSE L3 Support

