Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5330CC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 21:14:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 223A520748
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 21:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XFudPQiC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="X4N13e+9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 223A520748
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zCmcMpjDxoAml5+hhAu00gcUUnzc4aPsBZEpwtBJkI8=; b=XFudPQiC8r69nmzTatO5OEVREr
	CZo5+DkAmWJ2Q8MUa7CfKcbdBoRZ3r7jnA+hh5+v5lq/c9bAdEOeMMVwibr0wM20QiLp+LfKtKbQs
	LBnutZ+gjQ/eJE5Nz+EHaSHHgoVOlwHamVGchtkvr15kKXqFb1CsyUsMcj5oV+O8H7Eoxp9tXoBdt
	FEQ4h+/mHY+k6SzMuWvqufV5kuHIXKFaw0WDt8DWiQ8DO5OwMk9RdAUgeajJ8tPkCxpXkA2HEp1tQ
	9LzXjHZky+VBvzqTYBc9UV57RC5fujYr25RXibihSxMh1VaeV+ftc4AOBh5+uQsDRU3m9f+WTqgzF
	VtaQGNgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqk3D-0000vk-1w; Wed, 01 Jul 2020 21:13:51 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqk3A-0000v5-Ra
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 21:13:49 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id s7so27406738ybg.10
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=1693jLPCRTZKv04e3tT1L2R/SD/azULEZvoSLa7Hf7o=;
 b=X4N13e+9sePnsNX3KaC3ifEpq8r8prYY7zHclzCR5upKpuH+zMAIp0a3v81FRPNLSQ
 G/oEf3GoGKzfnImMohbfzdfak484FP/LerO7QfZnV6oiJy5RkPeJ4JGyaWW4d/KoT+og
 xaCTxxyLWdrK4Iy5oj1E4JZQLNCwWwFK+QmJ/rHwp8YgFpakYgrdyJcDKvQ7Hhutimdk
 veAa42QeTkaDOUzn9UlIWlC4KV+uT51zeVpLjn2F2l8a/oToAXzSKFN4laYPXVsvB7KO
 IWeEQJElTFTPPbn1R8LGZw8Vc3cSYrMYEomRY+SMbjXzjp+LawK0qruJeF/TCA8JmuqR
 92mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=1693jLPCRTZKv04e3tT1L2R/SD/azULEZvoSLa7Hf7o=;
 b=kWS53R+aIPC83CnbZT7LLjUHYrdLoAyeiT4U0humSdZr7d5q3jwe0TuMVxI/nuCcuZ
 fgyLdvEE3E6UfFoBauwjgdv7P3Il/diTVub61Zt+iXO7fkGyYqI+e00i/YpML+j6HBRW
 E1SH0Dlk4C8Rwcycb4ULozo/EwrKgl1lMixcEhq9hWx3QVOvRnf8KYUnk1WHY1R55lDV
 5XoPmiP4vMypxi7IsciqNdXeL2Y75FjFLV7Ps8BsuVpn7TXaTJYT+eS62A5pXlGJWAlA
 s8bfY4eGJ0KBR8PJW5mbdliNn/mAB2d06dkErQ26hrETwHIEv0K1RQbc6QDNwEZoZr1S
 HlnQ==
X-Gm-Message-State: AOAM5334/t3FGcLgOrOx3UcbkJXElunhXtgrmA/OgReNNz/Z5IJZeV0a
 37rbKBPGV9NcG8+tUPKTyv7k/PwqsW4ZO6dr1EOx
X-Google-Smtp-Source: ABdhPJz8wsHLEwNJYlVtw6qZZkh7AGzr6LYq5q8mwTBXuA/WiMwNXf+RKMjvBio06uTM33Rt9QsVW8X11w5NfovFi+WJ
X-Received: by 2002:a25:c7d3:: with SMTP id w202mr29331301ybe.84.1593638022312; 
 Wed, 01 Jul 2020 14:13:42 -0700 (PDT)
Date: Wed,  1 Jul 2020 14:13:36 -0700
Message-Id: <20200701211337.3027448-1-danielwinkler@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 0/1] Revert "serial: 8250: Fix max baud limit in generic
 8250 port"
From: Daniel Winkler <danielwinkler@google.com>
To: linux-serial@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, 
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_171348_912252_CFD6BBCD 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
Cc: chromeos-bluetooth-upstreaming
 <chromeos-bluetooth-upstreaming@chromium.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 BlueZ <linux-bluetooth@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>,
 Daniel Winkler <danielwinkler@google.com>, abhishekpandit@chromium.org,
 Aaron Sierra <asierra@xes-inc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


This change regresses the QCA6174A-3 bluetooth chip, preventing
firmware from being properly loaded. Without this change, the
chip works as intended.

The device is the Kukui Chromebook using the Mediatek chipset
and the 8250_mtk uart. Initial controller baudrate is 115200
and operating speed is 3000000. Our entire suite of bluetooth
tests now fail on this platform due to an apparent failure to
sync its firmware on initialization.

The driver is in the cros tree at drivers/bluetooth/hci_qca.c
and uses the serdev interface. Specifically, this is the
QCA_ROME chipset.


Daniel Winkler (1):
  Revert "serial: 8250: Fix max baud limit in generic 8250 port"

 drivers/tty/serial/8250/8250_port.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
