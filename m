Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E74C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 16:41:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C1B42177B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 16:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BzqHAcVu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/LX6jW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C1B42177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EfBube3UkJRy3I6iZsJUJ4Vwl/tcJCoyY6ZBBSHptaI=; b=BzqHAcVuBSCfLMcPdprUYjaL/
	G4SJGKhW+27qIBhLtSM8oO6gmqMafma11WEG4E/Bl2LM0Ao2UAQDnuKslFFv9opBtisdleeaxT2LE
	xNhYFwZG8+owZGH4vPVNO00rZqu3XcZHz+IibDsMJ1Y9N2EmJcIfPiF1d0BRkJ7PjVPeB1+ExvHW3
	lrnqYcNpPzrDTvZHQYpRFuPM6ZP7JpfrX1BQUxbofMUFkRiVaF8XgcCdd/nI5cCPaZQY5aWwySzU+
	NYptc5gVEy2rp5kipfi1nx5nIoWcc/GxheUU9FNslEKbPPXf4sfmrxesysVbLoajuNjMQNU8UnLb1
	XFwwK05Hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBKy4-0005cF-79; Thu, 27 Aug 2020 16:41:40 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBKxz-0005bO-Mn; Thu, 27 Aug 2020 16:41:36 +0000
Received: by mail-pf1-x442.google.com with SMTP id 17so3932811pfw.9;
 Thu, 27 Aug 2020 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bliB1023sdj3aVwTJNlYRjd1ewQEAeyLSLCuQayJAjY=;
 b=O/LX6jW3Q1owUemH+ORqZxREhcmC4Tf9sc59qQUxz1eV6D1PEexrtS7HKA9gDAAwN/
 6ZjPIAANWXCGdm/GhZKZ5Y34UVp2agMfpeHcQrSegriMLj3RxUxQTpqQjtAcascxW5z/
 UaDYdM8dNMbL7RycsDJVxvNGtnPq5QG2GTKLeCVc+JphNoz2c6Ev7slanxLt2Brz5LeZ
 y3uedDiM9SWIEBPjhtKaJuJ8t0tU6ZV618y3qNN6N2x+pfAPw4Tqb4tRktEjhaQqtinP
 WhXgJt1e6rWMKe5S2dNIMomtIWAVFYWqXSrkubOm5Nt+S3OMvZ1z1S0ghGRIWxQkwCyF
 8yCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=bliB1023sdj3aVwTJNlYRjd1ewQEAeyLSLCuQayJAjY=;
 b=VtmCxc3YaoQdb0FbOom9M0BSpIn/7LgBgd7Awzo43QFP4qkC1vj+YFelhIfmBFEvsw
 OHaIrsgh5ppsxGqrd1ASJy+rgUxPMRFc5jHTpWvXt2F76fDfVeIP733HzBS1lY9f/RN5
 +wv8a2R8ukfpeFWEW6QqBWo0rKCa6Xxi53Oh7Aijuste45QFFPxvoW1uNljPQCaZUxkW
 8qA/nmSYzBXNwhP6X8YY4Ssh9zhz4J0YR+sM0NAeGCqGOJMM7jqfvl/LocECJKAR7NiI
 pfgks2ap8b3gkJdO5DRTSFks2Mcf2+xIAGfp91ClchDOnCC577WvtvVoogMKbkZ56rHc
 MrMA==
X-Gm-Message-State: AOAM5336AKLZUBUBL/2vNdfuoiClRae+vDusty15U0gT1uX2FUsT2HPp
 5XBvmKcWDOlyf0JeWaEDzo4=
X-Google-Smtp-Source: ABdhPJzxsq/DfBtHgBlz3wlVDsTjBSAiejy26z59L26K47Ecf5fOnNwebJGKqFdOnEwaXfRIPFwAvw==
X-Received: by 2002:a63:1521:: with SMTP id v33mr11635537pgl.374.1598546493237; 
 Thu, 27 Aug 2020 09:41:33 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id a200sm3356631pfd.182.2020.08.27.09.41.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Aug 2020 09:41:32 -0700 (PDT)
Date: Thu, 27 Aug 2020 09:41:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v3 2/3] usb typec: mt6360: Rename driver/Kconfig/Makefile
 from mt6360 to mt636x
Message-ID: <20200827164131.GA86149@roeck-us.net>
References: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
 <1598527137-6915-2-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598527137-6915-2-git-send-email-u0084500@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_124135_780208_D811B26D 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 07:18:56PM +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> 1. Rename file form tcpci_mt6360.c to tcpci_mt636x.c
> 2. Rename internal function from mt6360 to mt636x, except the register
> definition.
> 3. Change Kconfig/Makefile from MT6360 to MT636X.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  drivers/usb/typec/tcpm/Kconfig        |   6 +-
>  drivers/usb/typec/tcpm/Makefile       |   2 +-
>  drivers/usb/typec/tcpm/tcpci_mt6360.c | 212 ----------------------------------
>  drivers/usb/typec/tcpm/tcpci_mt636x.c | 212 ++++++++++++++++++++++++++++++++++
>  4 files changed, 216 insertions(+), 216 deletions(-)
>  delete mode 100644 drivers/usb/typec/tcpm/tcpci_mt6360.c
>  create mode 100644 drivers/usb/typec/tcpm/tcpci_mt636x.c

Maybe Heikki is ok with this change, but I am not, for the reasons
mentioned before. So I won't approve this patch. Note that, either
case, it should be merged with the first patch.

Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
