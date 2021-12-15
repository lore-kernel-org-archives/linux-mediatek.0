Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060CDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 23:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9tyrqqfhDa/ZmDVmXAAHSClMTjmGUIWn5iSnXU95tvk=; b=XjuRwCs2TUzJtM
	uIpe1DT/J+Dm5xcBAA13lKytyG+gdBwQRSJdfFhmXU573oeXcSGU2hqQZ3Q72WpSdKjsckDWs6jqG
	zjBnutC7rjagKso8W3mAPR+mn191yYhL6DsqrYOOs+/J2BUOsX4/28xz50bX7RoNDoV3HAW7tavtp
	QNLOT2lOLUjq8xu+jJX0HVDxKCOVKQpouUVbpHfBE/0FZ2oi53p4lIBpaw3fpc3tbJKvcg8I44cqW
	CtqJHawlFUz+UQossfIG8cWyNcSDH559Luu1/JFVctK4myEpFmAT3J743aMq7eTzNOfO2qRhHQiFc
	j3iOkUi6Za4r2vIf9cVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxdVX-0034jQ-R8; Wed, 15 Dec 2021 23:16:23 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxdVK-0034hK-63; Wed, 15 Dec 2021 23:16:11 +0000
Received: by mail-oi1-f171.google.com with SMTP id bf8so33899374oib.6;
 Wed, 15 Dec 2021 15:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=++wJQfX9SRKTgDa7iRDm4XjqjWaFak1BGA3bq4SdHY8=;
 b=7zHQLSztQRpzKm+/YgIk5cPwmnXA/lLhq83ZNTDZKbWXKXYFjsx3HF9YXfdDOcORFf
 vtAUyhBvVQUbpyL4oqduJifZm2xWDIJCndnC6RBY0Pf0mK79/c3lvFzGRq92lTyjJ+7v
 mxDH0wUIYY7CX36j8Cv8pUo6Xq0zS3C0+DWjWxel0zP9N5OsaAqajizFWukXFHr7LlOk
 f/z9upIjaipHTiUSXnHhkLDLzDTPmn/LXOOoTBNqz/5KeU9NwX6QPXmtxhbruSwYUyxF
 1m6oTuiZFucdWLZ+7DRknaHoq/CMUcL4DSTyBRxyL+LLTVfY8swEmg3XnC0WpqxJjQkN
 jRkQ==
X-Gm-Message-State: AOAM530zRd7w52404a1xzAFDTeInnxyjg4xjd4ByrGXrQ9LixCWpWMWq
 YSkLwsuFTSVtWXL0VliIdMOP0kQZ3g==
X-Google-Smtp-Source: ABdhPJzWb+X8AU9phOzqa3L4kDw+icvNMkXfJyKOKnI6KQnWK5fei15LOQROoLYcH56rzggBqu3/sQ==
X-Received: by 2002:a05:6808:3a3:: with SMTP id
 n3mr1972992oie.81.1639610169310; 
 Wed, 15 Dec 2021 15:16:09 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id g7sm740166oon.27.2021.12.15.15.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 15:16:07 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Paul Cercueil <paul@crapouillou.net>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 0/2] usb: musb resource clean-ups
Date: Wed, 15 Dec 2021 17:07:55 -0600
Message-Id: <20211215230756.2009115-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_151610_265319_7120E80E 
X-CRM114-Status: UNSURE (   9.74  )
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

This short series reworks the platform device resources of the musb 
child device to avoid using static resources. Setting the parent 
device's DT node on the child device is sufficient for the standard 
resource functions to work.

I ran this thru kernel-ci and didn't see any failures, but I don't know 
if any tested platform uses MUSB driver or if a failure would show up in 
the boot log.

Rob

Rob Herring (2):
  usb: musb: Drop unneeded resource copying
  usb: musb: Set the DT node on the child device

 drivers/usb/musb/am35x.c    |  2 ++
 drivers/usb/musb/da8xx.c    | 20 ++++----------------
 drivers/usb/musb/jz4740.c   |  1 +
 drivers/usb/musb/mediatek.c |  2 ++
 drivers/usb/musb/omap2430.c | 23 ++---------------------
 drivers/usb/musb/ux500.c    | 18 ++----------------
 6 files changed, 13 insertions(+), 53 deletions(-)

-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
