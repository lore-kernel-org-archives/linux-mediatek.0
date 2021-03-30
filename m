Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30526C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:07:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD9886196A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 08:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD9886196A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0uEmSBpWm4tckaWabBlUXbVoUbdylSuZ/H9ttMAi0/s=; b=hgR376ypfUXn8N/NEvvXCDVGol
	JV1e14pC1vzW4R+W7ydxQS0Al8H0qWHAbQYxUEeFpRt4HICvpaYZCQlHPVyUMAWeUu35Yr6kFWIUC
	p76WiOWlYL7zPPHHzwNpWPSsgDI8ddHlsamIJTGtetp2GoHJR/D/3FJz7MLxoR2qBuCwtSWHTYSHq
	xTp2zV1SBgoQgHh5yFg4r7SK4fpM4/IMT+T96lOFTag/B0MJqNsU1d33+CoYbNKoQxp3nXGP0Ofm5
	zIi3OzK98QqK2quM6W3xuFGRLI1gEBLEOnmU6N874C264HSeRHo576kDKfVPabhesPD49oN2niqsZ
	u+htbylQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR9OV-002yBE-CF; Tue, 30 Mar 2021 08:06:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR9OK-002y7h-AJ
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 08:06:26 +0000
Received: by mail-pj1-x1030.google.com with SMTP id s21so7347394pjq.1
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Mar 2021 01:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ohWyba0j454EaOcs1wMSu7zcUbDYhtyMLYsDEhrXDGs=;
 b=jqo9lLZ7GcMnZC5ZBsguOjSYs6hFI12Dfmn60MxS5gDNrO/+nY8Vn2rY4ywOySIC/k
 QaZ3yvUp/zWMoXGE5D5p0Wf3cwyP0fPTwORkzq7VIU3Tn8pSVeL7osPiN9DAw4zCbc+T
 H9uaV6epPrQ2WddQgw6oq0J+rbn8f5L+2JWKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ohWyba0j454EaOcs1wMSu7zcUbDYhtyMLYsDEhrXDGs=;
 b=Gr72SVY2z97PQ0PEEp7BRQM3cJgawT8vjZu1t8tPbc6++sydda8xrXgwiCQ18su+hm
 qwbFfTmdXCCmvL0Bdt9B03kJc/NWXaEdU26P12qHO0opQGczvtOZxgNGm4NfDXQ6ABoX
 5ujqDekewhpiRqQWaQo+9ClVvbS1AReGQwViQbc3HNKhmsF97rXGD4eK3j8QA/UqTbPK
 m12UQW5SrJ/NfA9Nc3yOTnM118j7GUTHh8MMZ2+Gt6xzh9+sE1IEogeHlK0GBwAs543J
 6BEKAW8bIZeH151CQRBHekqy4jqgjqjDz+pSYILgj/TvqeEOSldR2OGpWx4AHo9j7Ruf
 iuuA==
X-Gm-Message-State: AOAM533BoODtFeh2WUm7UiG+4jwfDfQ3y5uiOhnycMx4TYf1VbdEgr4g
 noJrpygCZeMeLjIUxmNZAfM/JA==
X-Google-Smtp-Source: ABdhPJybMW7B8cavgdFxhd4SwS24cBzLl6Y5MZwunkIgjR2DOE2qND49L/uJeWGi9/heazJekmcuZw==
X-Received: by 2002:a17:90b:e01:: with SMTP id
 ge1mr3199883pjb.117.1617091582045; 
 Tue, 30 Mar 2021 01:06:22 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:49fb:d79d:bee6:d970])
 by smtp.gmail.com with ESMTPSA id f23sm19118913pfa.85.2021.03.30.01.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 01:06:21 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-usb@vger.kernel.org
Cc: Ikjoon Jang <ikjn@chromium.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] usb: xhci-mtk: relax peridoc TT bandwidth checking
Date: Tue, 30 Mar 2021 16:06:15 +0800
Message-Id: <20210330080617.3746932-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_090624_446820_C91F465E 
X-CRM114-Status: UNSURE (   5.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is for supporting typical full speed USB audio headsets
with speaker, microphone, and control knobs together.

With current implementation, such a device cannot be configured
due to xhci-mtk's bandwidth allocation failure even when there's
enough bandwidth available.

Ikjoon Jang (2):
  usb: xhci-mtk: remove unnecessary assignments in periodic TT scheduler
  usb: xhci-mtk: relax periodic TT bandwidth checking

 drivers/usb/host/xhci-mtk-sch.c | 120 +++++++++++---------------------
 drivers/usb/host/xhci-mtk.h     |   2 -
 2 files changed, 41 insertions(+), 81 deletions(-)

-- 
2.31.0.291.g576ba9dcdaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
