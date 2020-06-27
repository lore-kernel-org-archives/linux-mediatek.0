Return-Path: <SRS0=2fNz=AI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0218CC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:09:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D2621582
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:09:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="apGUNTJ9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGldGMH4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D2621582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HEyqjl7uG/Ks9RooIHcWfQRVlPSb/BKVszmcI96EuO4=; b=apGUNTJ99z4OaOFMDFQtJxQOU
	K4IBeg92ff8qEuMmkjzenFu9h3sbjOK4XhCAjxfFK+Kn5HlnhsirtyLpIYkSuXZkp+v/xkGZ/GMHT
	RbIGZcurhxqPhMFJ9FJY1tO3e3DRFNnOPHE6qSKUCWQ000zZFRCkAdvdzM2eQFyZ6hc758HQUqUKm
	2mazWeUhd2AWb1Sdy5J86q/yljTAQe/2VXEdiugKCYrqd7WfkcgvFBSrERi0g2sq/I1Nuh9fll6dA
	72rOWlRe86cXikTpn5WlI/u3IicBL5XRzHff47bX2b9pJcMR6NqD4iSgRulO0PuRfEnLCEdLEHNoR
	b/zVKtabg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp8hi-0004hN-7G; Sat, 27 Jun 2020 11:09:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp8h7-0004Tl-Mc; Sat, 27 Jun 2020 11:08:27 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D12A621531;
 Sat, 27 Jun 2020 11:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593256105;
 bh=CKFRZQvVXoQGRUt/fr1evMIOtF/D2G3jbib+jYbyxlU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LGldGMH4GnVEZJM9lKrAO4vuHndpGt+hjl6cH5CtcHpuSHOS89YEYTeMdXj+1PQKX
 IpFUxwH79KoWlnNgFGOfWbPavxAZkbyeSsGtIo3zhpECkuamaVI9UYUJyQ3WNJjsiF
 4keML4Szu08xHn+uJV7hdRQ1XL2Ht1/vYL+oTEMY=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jp8h5-006s0z-9t; Sat, 27 Jun 2020 12:08:23 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Cooper <jason@lakedaemon.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Oscar Carter <oscar.carter@gmx.com>, Kees Cook <keescook@chromium.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>
Subject: Re: [PATCH v5 0/3] drivers/acpi: Remove function callback casts
Date: Sat, 27 Jun 2020 12:08:05 +0100
Message-Id: <159325548742.93134.13767620418777913420.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200530143430.5203-1-oscar.carter@gmx.com>
References: <20200530143430.5203-1-oscar.carter@gmx.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, matthias.bgg@gmail.com, brgl@bgdev.pl,
 tglx@linutronix.de, oscar.carter@gmx.com, keescook@chromium.org,
 rjw@rjwysocki.net, lenb@kernel.org, andrew.perepech@mediatek.com,
 linux-mediatek@lists.infradead.org, stephane.leprovost@mediatek.com,
 linux-arm-kernel@lists.infradead.org, pedro.tsai@mediatek.com,
 bgolaszewski@baylibre.com, fparent@baylibre.com, linux-kernel@vger.kernel.org,
 kernel-hardening@lists.openwall.com, linux-acpi@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: linux-acpi@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Pedro Tsai <pedro.tsai@mediatek.com>,
 kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 30 May 2020 16:34:27 +0200, Oscar Carter wrote:
> In an effort to enable -Wcast-function-type in the top-level Makefile to
> support Control Flow Integrity builds, there are the need to remove all
> the function callback casts in the acpi driver.
> 
> The first patch creates a macro called ACPI_DECLARE_SUBTABLE_PROBE_ENTRY
> to initialize the acpi_probe_entry struct using the probe_subtbl field
> instead of the probe_table field to avoid function cast mismatches.
> 
> [...]

Applied to irq/irqchip-5.9:

[1/3] drivers/acpi: Add new macro ACPI_DECLARE_SUBTABLE_PROBE_ENTRY
      commit: 89778093d38d547cd80f6097659d1cf1c2dd4d9d
[2/3] drivers/irqchip: Use new macro ACPI_DECLARE_SUBTABLE_PROBE_ENTRY
      commit: aba3c7ed3fcf74524b7072615028827d5e5750d7
[3/3] drivers/acpi: Remove function cast
      commit: 8ebf642f3d809b59f57d0d408189a2218294e269

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
