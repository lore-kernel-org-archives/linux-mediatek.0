Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782BDC64E7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 01:20:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2156020757
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 01:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1V+YOnbi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sP8kFzR6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2156020757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vVNqQPY3pVRKKfAZhNZMqesMjrojBcW5+bojw2MNSMI=; b=1V+YOnbib06RI1I3J/3lRQ5v//
	+TEbV57FpPqwpEAQfv9kubZYTXqKdW3AGykaAey7CHt03S9gybE6fAPgvatG335BN3HynA5+doVHC
	HI7du6DewE/7xkuRkIt9IVQNBJFZVDqP1y0SCMhCRPL/HbgtCf5X3NbkC1xE7Hl90+VlXsuUPZhAh
	/mXIqtHF/piWF18xqSd6tqZgUr9yF6z3BAdvVfgFPmqTQc7A8rIYUKDmhs1ybpM35r0rEYpNOHxm3
	ivF9QUtnm9WwIHKP30hisI4rAZFCY3qJbl6bPKDhsq5UApSJsjyiSXTw3thri+eibGEYk1ehRVj0l
	rRmVmN+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjXrm-0000uU-QJ; Mon, 30 Nov 2020 01:20:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjXrj-0000tv-8W; Mon, 30 Nov 2020 01:20:32 +0000
Received: by mail-pl1-x62c.google.com with SMTP id x15so5563625pll.2;
 Sun, 29 Nov 2020 17:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p9neIC2nP4AkQG8eY+IlQyOgSSMBX6Quf44ZMyRQcc0=;
 b=sP8kFzR69H9wb2BgjF9BVHIprW940obj2C3GgnE5KiSsX26HBnzEte+yBu2/xs7nF7
 NxupZizj41Df2KVAP5epghac0sLnIf7LavS+NbHqe+FL+QFaBn7Vju807Efy/ok7gVUX
 nuF1iWP1zWKzNdiOEID78J8vIvzwl+P3+puPkRITotCQf2iDU60datuh+gjF4GA52+Pg
 zt3zEcrhy4VuB/y6cuXINykKyw7eNvlSqQ7fJoYpvW6UBAeRn7z5nlWHsye2gYlmQL6J
 MvxkDVnS1o8zMn+vNK+DLn/8udePoShPcOGn6ZHQAJG8o9rM0tiNggs4FafYaCYmEbRf
 JDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p9neIC2nP4AkQG8eY+IlQyOgSSMBX6Quf44ZMyRQcc0=;
 b=Q+6t4xqZyZ55ddiuZp8n1OllFlhorOAkhxZXUIyi0vIcpXXSciJTF1WbqN9/jxmeKJ
 6YfGVHBtLrSdnuXOpSlTa3aVYlm668KGq+suejiOHJOZHtqKUlcaBGOfBKEb8zM0erTU
 ZFeWdYtCu3iPoa9ueuR9LQ5QXHMCaULYJmb2Qy6UkrQdZf7E2INfBqWQN68QNdEfwExf
 6PPbXAuTrxeP3z7TefDj9h7aUA95haXhhYXS0aMISFNsL1l9uxtETdIhuk8nh6jfAglA
 zJbxUw1EZzW+1YXF4zNIzU8TK4lEoRL8oBB5ZvZ5wUqCIcLSXtkJl5pbEQd7VZJqALQq
 qTSg==
X-Gm-Message-State: AOAM530+gBa0zwHzvkAdiFsOYzS/TrQgvthbrvmiBQhfZDiq+DjcEAUn
 5Im/jcg56W5S65U/U4xdNlk=
X-Google-Smtp-Source: ABdhPJywNIp8bBDK+nxoBIkEXPB7hi3yXNEqpvBhNXKu3OFZe7JfHWZbeDitlY1UswE1xADVZpOxVA==
X-Received: by 2002:a17:90a:b782:: with SMTP id
 m2mr10256163pjr.185.1606699226333; 
 Sun, 29 Nov 2020 17:20:26 -0800 (PST)
Received: from localhost.localdomain ([49.207.196.188])
 by smtp.gmail.com with ESMTPSA id l10sm20002567pjg.3.2020.11.29.17.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 17:20:25 -0800 (PST)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Subject: [PATCH v2 00/15] drivers: usb: misc: update to use
 usb_control_msg_{send|recv}()
Date: Mon, 30 Nov 2020 06:48:04 +0530
Message-Id: <20201130011819.2576481-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_202031_361763_08123930 
X-CRM114-Status: GOOD (  15.35  )
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

Changes in v2:

  * Buffer variables that were previously dynamically allocated are no
    longer dynamically allocated unless they have a variable length
    (since that threw a warning).
    

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

 drivers/usb/misc/appledisplay.c    |  46 +++++------
 drivers/usb/misc/cypress_cy7c63.c  |  21 ++---
 drivers/usb/misc/cytherm.c         | 128 ++++++++++-------------------
 drivers/usb/misc/ehset.c           |  76 ++++++++---------
 drivers/usb/misc/emi26.c           |  31 ++-----
 drivers/usb/misc/emi62.c           |  30 ++-----
 drivers/usb/misc/ezusb.c           |  16 +---
 drivers/usb/misc/idmouse.c         |   5 +-
 drivers/usb/misc/iowarrior.c       |  34 ++++----
 drivers/usb/misc/isight_firmware.c |  30 +++----
 drivers/usb/misc/ldusb.c           |   8 +-
 drivers/usb/misc/lvstest.c         |  38 ++++-----
 drivers/usb/misc/trancevibrator.c  |   4 +-
 drivers/usb/misc/usbsevseg.c       |  60 ++++----------
 drivers/usb/misc/usbtest.c         |  69 +++++++---------
 15 files changed, 216 insertions(+), 380 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
