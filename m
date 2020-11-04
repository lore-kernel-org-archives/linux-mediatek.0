Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D066C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 03:41:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEDCB2072E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 03:40:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xkwamqmi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mIdmzU92";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Mi+nN8QI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEDCB2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zJVrfWQUt17IoYs5jTEKjdCXs0CSB9+ogZBz4L9WCCw=; b=xkwamqmiX1lnSS9LRHZG96biH
	D3NPxum9YdvFpUY1G6DLDFn+i/OxfuPkKev2D35t2gj6m8D/Mlj00hABwAXu3W3JxtAEl5BleCmCb
	yXQ6MwojMbRNG86Q5azTvFf+vdN2M1LgJIlClO4hdYL8tAVT+yRApUXi8AskhywQKsJtJDiKa4u79
	OgHAAuHKapMWoUanOxFR+Jy8vrbAMSSGwdIFBZWq8yUicCbdD0haVMQylM19wiVRGTZ8d3K3vVIOv
	j2gA45r79xbJzZLJBRuxjHaSOj+ZkKpBNUo1i+bmXxAi/hM6L3QuEa/YLGti7Zcd0bUNJcf33qpZW
	UO7Tn8jag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaW8o-0002mT-AR; Thu, 05 Nov 2020 03:40:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW8c-0002bw-E1
 for linux-mediatek@merlin.infradead.org; Thu, 05 Nov 2020 03:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
 References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ydU8MqNb5ODaxL3+Z2DSyH1qiAoSfviF3VEkdiIDKBY=; b=mIdmzU92SjL2lQHRy/oNqnlqHQ
 gXxLUEg+/ffdju2it4ngZCKs+pjPe/gbMFHvBl1LT1e2IfNO6B8lhZedxpu0PgOqW+Ri8LwNWlBht
 jPVhqXCW6XFC2rPGZRIh8ohVDCs1fUhEBYpamAT745tyFrVwtEF9gqGRiX2/hbCl8TG0pDVmqbGSD
 /Ub1TyKJdNMB1WyZa4bBdnRjEjjSumFuINVT7izUI+BYAHuZWTYaDuwefxq2RmcwIVEieU+PNL+Ql
 IG2orGZHRmONYvb9Hi7AW6S0jLssjbWRB7wWOUUQMtfcJ5zy47/souhmHIxeCsgz6Haa9hbgi7K64
 CUvBeE4g==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaPoo-0007PZ-DO
 for linux-mediatek@lists.infradead.org; Wed, 04 Nov 2020 20:55:53 +0000
Received: by mail-yb1-xb49.google.com with SMTP id j2so40111ybb.12
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2020 12:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=ydU8MqNb5ODaxL3+Z2DSyH1qiAoSfviF3VEkdiIDKBY=;
 b=Mi+nN8QIQ7x63V+TG/eYb4r6c6UacmC9riV2b3bPg3sSUVtnALhVnovndw/IexzccJ
 nx8Les/RmPNDQZDpqqytrNU82vpIYrJEEOw/MlSsV4hCS6sIDVhvOvXWlTszMpvrP1nl
 iSdNI7J0W6i3+3z87KzdLwSTQr6AEw+LipxCCs1IocG+9tkFWO6epStStoDcqwxzSDsY
 i5MBM4tspoQnVHGlZ4PAtsEecXczCzCKWjA2c/WonpQkECU5wL8woPGrIAmt5fxWFCmY
 hWwsXUMHpeyhOtvxkHcgqCZ8SUsTQTBZdHayWNXal4DLYAwiiH1LLtDiqi6SOXBP7d70
 gX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ydU8MqNb5ODaxL3+Z2DSyH1qiAoSfviF3VEkdiIDKBY=;
 b=i7vCLTVnbk1Kq0/kep9TlO8uMV3FE6RCXru1ZxFn1Jhlv7OsQRJ6R+OE3u2BUWOUrF
 BTBFnZxqJsfEDNR3qCwoQt20XDwF/XxEYKRrohuCmT9kPIEbjC2EZfMQOgmjkkRLyoIe
 875aa23guBuq172GAxBjUUCyoHBXxoB6X+Xkop16+520QmVxWJYzc87fNp9+YT5GKyyg
 CsZZC7d/I2exFe4SVA2en6/EPRG3f2qAsnUvlYaBIoGVdL5LB/t1DKSnOccFobEVg4gp
 pPwlYeA38XVj9r3LcsHL/H9S5zqVwD23p7NjT//Jq0SFGlMYhHWIu21epc/0QR5COpFP
 acqA==
X-Gm-Message-State: AOAM531TM+WBaSJtvGitUq4PZFJR8lALaxA7GIjoPZ2cngF6JB/QKHkD
 HKvVFT+zoaJxX4G9ck8LFzaVr2Z9+xNikPE=
X-Google-Smtp-Source: ABdhPJw5zVtQunGCPIAfu7fOW9XCFg0q3VsIcMowV4//GgSeDsTJfw4AS5PE/RJBihvUIcjkmYJH4b+ocO86DZg=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a25:8709:: with SMTP id
 a9mr36737716ybl.208.1604523278064; Wed, 04 Nov 2020 12:54:38 -0800 (PST)
Date: Wed,  4 Nov 2020 12:54:31 -0800
In-Reply-To: <20201104205431.3795207-1-saravanak@google.com>
Message-Id: <20201104205431.3795207-2-saravanak@google.com>
Mime-Version: 1.0
References: <20201104205431.3795207-1-saravanak@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v1 2/2] spi: Populate fwnode in of_register_spi_device()
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_205546_921209_29AE8BB7 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: Saravana Kannan <saravanak@google.com>, Cheng-Jui.Wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 Daniel Mentz <danielmentz@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Daniel Mentz <danielmentz@google.com>

This allows the fw_devlink feature to work for spi devices
too.  This avoids unnecessary probe deferrals related to spi devices and
improves suspend/resume ordering for spi devices when fw_devlink=on.

Signed-off-by: Daniel Mentz <danielmentz@google.com>
[saravanak: Minor commit text cleanup]
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/spi/spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 0cab239d8e7f..d533aa939cca 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2037,6 +2037,7 @@ of_register_spi_device(struct spi_controller *ctlr, struct device_node *nc)
 	/* Store a pointer to the node in the device structure */
 	of_node_get(nc);
 	spi->dev.of_node = nc;
+	spi->dev.fwnode = of_fwnode_handle(nc);
 
 	/* Register the new device */
 	rc = spi_add_device(spi);
-- 
2.29.1.341.ge80a0c044ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
