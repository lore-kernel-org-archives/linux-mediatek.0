Return-Path: <SRS0=HK5I=FD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EF4C3E8C5
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 16:06:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F469206CA
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Nov 2020 16:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tIqdmyi1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTynAWyU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F469206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QD2xXHMFVg0nZx5NRYnvOuMI/DL46/4Q5M+0Hqj6Sbk=; b=tIqdmyi1f8k6whqlXznyxJPVfJ
	91ArJYMSu9rbf0v3zmM+v956QkTGpVh8d7dnJQ3MZPmswkFyfo3RaqfHyz1OKNFkn4cm1cTsuBjAp
	jz9H9ocA+gJpSSJovZYMT+ZtisFuRhtgxfDvg9RcRw8wmA/MUGOa2YwP1bAdkVZwQ40wVLFLQumry
	Ob6DGIuw+cPdQxjxflE2N3UQabuwXNUw17A/70twOw72ztlCsZ23c8/BnbgRvoamxGw8EvdhmkXUu
	i/JznTDsJ84wu0eNzRy1j5DxkOroLizaUszTxjWu9ZCyl0aBNT53/cwPH/nyWP7m4EhNLf7xe7jda
	LBivqHww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjPDk-0008Li-7H; Sun, 29 Nov 2020 16:06:40 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjPDe-0008L3-9x; Sun, 29 Nov 2020 16:06:35 +0000
Received: by mail-pg1-x532.google.com with SMTP id q3so673865pgr.3;
 Sun, 29 Nov 2020 08:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ALXc7Qe3C+ECWCLA5rktXhPD6AeZz9/f+AYmP6J+Vt8=;
 b=sTynAWyUtWwL/d3vDk5zw41PYTBK9FCyUHdlkoYPNtuThJP2wcn+UXaGNH3aXnpzfu
 TvyNCSQLIJ9tWQaNjeTr4dk6wuukzZO6Nc9o/wGh/R2QKLo5ftL74DnSmJUjPhP21QKq
 v4zwI8oS5lnzyhJ65kY+/pameNzrSc9h/Ky8W+hylha6+gl3SB4p28ejhzfNFPdouB+L
 IDk2LbHb8wYfNbKxpJHLJ7zPA6zckQF+Fsssnj+qBijjAtw+sToNv9r1U5u9MFG7vH+R
 J5j6aqNF/fW+j599Y8w1hhq0xw4BxuTnuTERG/fw+6cwpNvUSAe0P96VhsUIckPCDgTp
 yFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ALXc7Qe3C+ECWCLA5rktXhPD6AeZz9/f+AYmP6J+Vt8=;
 b=djyH5r8LdzRFHqtjX/M3g3xPFcPugNaKNWIELN5tvuHD6BVSg7SI9+TwndsQkH4kwB
 hOhRfVLT1gnfThotPbf2BPVbn0q2+vkZv/T7RmV2QyjTuBTWLDHKr4YcSF9RZVnUck/J
 zAcRj3czmF/JiDydSPk5JXk2B4z8Kz0fjNbB39vZs1eWZbumsuJ4ful3Uq9HXoLhcypA
 QduTBMDjpsdFAMT+yxsBTBw/tLiW1Di6m0wy4EtXd++lxSUc82IfJW36qZDts7OglFVz
 CDaaq5l2zxP+q2k6TYNmCf7sg4rveSUbvA1r7ylsFY5vhMuHuLAD6lyY/7757HlAeYWP
 zhJg==
X-Gm-Message-State: AOAM530ENdDwnRbdicg9aYvHJkxtnT1zWGS5giyRXY3ppEcv1ZNHN+wk
 t7a1OWSqZYZWuiadBa506Ew=
X-Google-Smtp-Source: ABdhPJz5LSVSwgMMUQ4+CLBco7tWDqMUukYtlB/zr1LasR2Q3+m+66oVmJPVr52SzwS3ITOXdjNX6g==
X-Received: by 2002:a63:484d:: with SMTP id x13mr13699870pgk.301.1606665990252; 
 Sun, 29 Nov 2020 08:06:30 -0800 (PST)
Received: from localhost.localdomain ([49.207.196.188])
 by smtp.gmail.com with ESMTPSA id u3sm13496837pfu.47.2020.11.29.08.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 08:06:29 -0800 (PST)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Subject: [PATCH 00/15] drivers: usb: misc: update to use
 usb_control_msg_{send|recv}()
Date: Sun, 29 Nov 2020 21:35:57 +0530
Message-Id: <20201129160612.1908074-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_110634_411765_1734AB40 
X-CRM114-Status: GOOD (  14.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


The new usb_control_msg_{send|recv}() API provides an improved way of 
using usb_control_msg(). Using this, short reads/writes are considered
as errors, data can be used off the stack, and the need for the calling
function to create a raw usb pipe is eliminated.
This patch series aims to update existing instances of usb_control_msg() 
in drivers/usb/misc to usb_control_msg_{send|recv}() appropriately, and
also update the return value checking mechanisms in place (if any), as
necessary so nothing breaks.

I was however unable to update one instance of usb_control_msg() in 
drivers/usb/misc/apple-mfi-fastcharge.c.

The return value checking mechanism present here, is as follows.
	if (retval) {
		dev_dbg(&mfi->udev->dev, "retval = %d\n", retval);
		return retval;
	}

	mfi->charge_type = val->intval;

	return 0;

This implies that mfi->charge_type = val->intval only when number of
bytes transferred = 0, and the return value is directly returned 
otherwise. Since the new API doesn't return the number of bytes 
transferred, I wasn't quite sure how this instance could be updated.
In case this check is logically incorrect, a patch with a fix 
can be sent in as well.


Anant Thazhemadam (15):
  usb: misc: appledisplay: update to use the
    usb_control_msg_{send|recv}() API
  usb: misc: cypress_cy7c63: update to use usb_control_msg_recv()
  usb: misc: cytherm: update to use usb_control_msg_recv()
  usb: misc: ehset: update to use the usb_control_msg_{send|recv}() API
  usb: misc: emi26: update to use usb_control_msg_send()
  usb: misc: emi62: update to use usb_control_msg_send()
  usb: misc: ezusb: update to use usb_control_msg_send()
  usb: misc: idmouse: update to use usb_control_msg_send()
  usb: misc: iowarrior: update to use the usb_control_msg_{send|recv}()
    API
  usb: misc: isight_firmware: update to use usb_control_msg_send()
  usb: misc: ldusb: update to use usb_control_msg_send()
  usb: misc: lvstest: update to use the usb_control_msg_{send|recv}()
    API
  usb: misc: trancevibrator: update to use usb_control_msg_send()
  usb: misc: usbsevseg: update to use usb_control_msg_send()
  usb: misc: usbtest: update to use the usb_control_msg_{send|recv}()
    API

 drivers/usb/misc/appledisplay.c    | 46 ++++++++------------
 drivers/usb/misc/cypress_cy7c63.c  | 10 ++---
 drivers/usb/misc/cytherm.c         | 42 +++++++++---------
 drivers/usb/misc/ehset.c           | 70 +++++++++++++-----------------
 drivers/usb/misc/emi26.c           | 14 +-----
 drivers/usb/misc/emi62.c           | 14 +-----
 drivers/usb/misc/ezusb.c           | 16 +------
 drivers/usb/misc/idmouse.c         |  5 ++-
 drivers/usb/misc/iowarrior.c       | 34 +++++++--------
 drivers/usb/misc/isight_firmware.c | 22 +++++-----
 drivers/usb/misc/ldusb.c           |  8 ++--
 drivers/usb/misc/lvstest.c         | 30 ++++++-------
 drivers/usb/misc/trancevibrator.c  |  6 +--
 drivers/usb/misc/usbsevseg.c       | 52 +++++++---------------
 drivers/usb/misc/usbtest.c         | 63 +++++++++++++--------------
 15 files changed, 180 insertions(+), 252 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
