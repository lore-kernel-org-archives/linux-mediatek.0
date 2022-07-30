Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32670C04A68
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jul 2022 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3i6QT0H5ug9EN2vXDhoq0YiBTjVOYiNk3wwwJBnOD6k=; b=2jArqbYpuErsVPe0WmtDkcDlW8
	VXrnbcfMT3cPNJIbYyRHCvAA+BoxmSgoUXceA+VKStCAOPqPFk1YTgEVoBpEojOuwFot0+t3V7jXw
	jiPyqgxwDe7GBOQ5BKSER3kKEBfxXlyNDYJyerbprzOWbcWLHzQCxyDq5aET36zBDltIEl4Q3Ry8J
	PeEYsxsT6CbVyFwzc6OlwHJtJ4yuSJA4LFSh5gXPbFVJ5nkTmvetS6KMhtn6ciVEoTqZZ/tc3RAiC
	wZ9RRrfk0fIjYZ9MOd1/0vjsslTrjZAiVNHz+DWrPBx4epNjZIVE46f9wwtad4PVLO3UZUrFxUJD6
	/2s29CSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHlta-000eeZ-Ou; Sat, 30 Jul 2022 12:48:42 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHltW-000ebU-Sw
	for linux-mediatek@lists.infradead.org; Sat, 30 Jul 2022 12:48:40 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EB2205C2C6;
	Sat, 30 Jul 2022 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1659185314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3i6QT0H5ug9EN2vXDhoq0YiBTjVOYiNk3wwwJBnOD6k=;
	b=Q71IlXQo6YbKuXUZ6pJrfonlulyHIJbXfPqUhB/22XrII3IYF/qfkICxFfQK6QoFtoa1xd
	Al++6qxt8HlkCIdHEmwwOOSFiRtYfV5jziHY2kwVb0xnVuyHLtrT5RirymcK3Sdf0b+4ei
	scND8zI0bFfEbwrwh1kFlDCt7kXPKnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1659185314;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3i6QT0H5ug9EN2vXDhoq0YiBTjVOYiNk3wwwJBnOD6k=;
	b=nXQIu99qe+mH64pN2bwY1qN9dO1sLXYmnEGK+JRFVMl4ATnWnhhvvluzmtDA/yz956bhmv
	zGtwuy9MvNzgVZCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF44513A8E;
	Sat, 30 Jul 2022 12:48:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7VwwKaIo5WIkZAAAMHmgww
	(envelope-from <jdelvare@suse.de>); Sat, 30 Jul 2022 12:48:34 +0000
Date: Sat, 30 Jul 2022 14:48:33 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-mediatek@lists.infradead.org, Matthias Brugger 
 <matthias.bgg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Chenglin Xu <chenglin.xu@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] soc: mediatek: Let PMIC Wrapper and SCPSYS depend on OF
Message-ID: <20220730144833.0a0d9825@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_054839_102956_FF53F99A 
X-CRM114-Status: GOOD (  13.17  )
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
CONFIG_MTK_PMIC_WRAP=3Dy
CONFIG_MTK_SCPSYS=3Dy
we get the following build warnings:

  CC      drivers/soc/mediatek/mtk-pmic-wrap.o
drivers/soc/mediatek/mtk-pmic-wrap.c:2138:34: warning: =E2=80=98of_pwrap_ma=
tch_tbl=E2=80=99 defined but not used [-Wunused-const-variable=3D]
drivers/soc/mediatek/mtk-pmic-wrap.c:1953:34: warning: =E2=80=98of_slave_ma=
tch_tbl=E2=80=99 defined but not used [-Wunused-const-variable=3D]
  CC      drivers/soc/mediatek/mtk-scpsys.o
drivers/soc/mediatek/mtk-scpsys.c:1084:34: warning: =E2=80=98of_scpsys_matc=
h_tbl=E2=80=99 defined but not used [-Wunused-const-variable=3D]

Looking at the code, both drivers can only bind to OF-defined device
nodes, so these drivers are useless without OF and should therefore
depend on it.

Also drop of_match_ptr() from both drivers. We already know what it
will resolve to, so we might as well save cpp some work.

Developers or QA teams who wish to test-build the code can still do
so by enabling CONFIG_OF, which is available on all architectures and
has no dependencies.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/all/202207240252.ZY5hSCNB-lkp@intel.com/
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chenglin Xu <chenglin.xu@mediatek.com>
---
Changes since v1:
 * Drop of_match_ptr() (suggested by AngeloGioacchino Del Regno

 drivers/soc/mediatek/Kconfig         |    2 ++
 drivers/soc/mediatek/mtk-pmic-wrap.c |    2 +-
 drivers/soc/mediatek/mtk-scpsys.c    |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

--- linux-5.18.orig/drivers/soc/mediatek/Kconfig	2022-07-28 11:22:23.098393=
325 +0200
+++ linux-5.18/drivers/soc/mediatek/Kconfig	2022-07-28 11:23:58.635687065 +=
0200
@@ -37,6 +37,7 @@ config MTK_INFRACFG
 config MTK_PMIC_WRAP
 	tristate "MediaTek PMIC Wrapper Support"
 	depends on RESET_CONTROLLER
+	depends on OF
 	select REGMAP
 	help
 	  Say yes here to add support for MediaTek PMIC Wrapper found
@@ -46,6 +47,7 @@ config MTK_PMIC_WRAP
 config MTK_SCPSYS
 	bool "MediaTek SCPSYS Support"
 	default ARCH_MEDIATEK
+	depends on OF
 	select REGMAP
 	select MTK_INFRACFG
 	select PM_GENERIC_DOMAINS if PM
--- linux-5.18.orig/drivers/soc/mediatek/mtk-pmic-wrap.c	2022-07-30 11:20:2=
2.221919946 +0200
+++ linux-5.18/drivers/soc/mediatek/mtk-pmic-wrap.c	2022-07-30 11:41:14.073=
038643 +0200
@@ -2347,7 +2347,7 @@ static int pwrap_probe(struct platform_d
 static struct platform_driver pwrap_drv =3D {
 	.driver =3D {
 		.name =3D "mt-pmic-pwrap",
-		.of_match_table =3D of_match_ptr(of_pwrap_match_tbl),
+		.of_match_table =3D of_pwrap_match_tbl,
 	},
 	.probe =3D pwrap_probe,
 };
--- linux-5.18.orig/drivers/soc/mediatek/mtk-scpsys.c	2022-07-30 11:20:22.2=
21919946 +0200
+++ linux-5.18/drivers/soc/mediatek/mtk-scpsys.c	2022-07-30 11:41:22.466154=
796 +0200
@@ -1141,7 +1141,7 @@ static struct platform_driver scpsys_drv
 		.name =3D "mtk-scpsys",
 		.suppress_bind_attrs =3D true,
 		.owner =3D THIS_MODULE,
-		.of_match_table =3D of_match_ptr(of_scpsys_match_tbl),
+		.of_match_table =3D of_scpsys_match_tbl,
 	},
 };
 builtin_platform_driver(scpsys_drv);

--=20
Jean Delvare
SUSE L3 Support

