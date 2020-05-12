Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B4BC54E4A
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 14:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B021E20746
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 14:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o6OC0RI2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O/qLDBHj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B021E20746
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyoFgXIGPme8kA2K12rO79Rj3eDph7LSLMrXAnFcyec=; b=o6OC0RI2P92+NX
	DxCdXPS50gyJ+esqQyluoF5BAHPZjMwHaBX0DD15UTokfeM7ExcJDDlny/gGL7PcaRtXlcN5H92tp
	DviT6/O6FgT8GKCbUtYsSpKzAB3zv7E4GeOfSUntZM2iSjSUBj7nlrEFnLZL/8ohVefqlR5io3J2y
	5CeN9S1JiTRdY7zRH20+Z22x64esztxmOZ6Nu/yLBretmXcW8r8dVDSQdQcT9wnFkBcH89r9luoaU
	EYhmd/fhKAgLR5u3yTZgpOpQFSBk+lVZW17q5jOv4RK4gEUOpJbwlzZUW0Q8yxX5vJxTZ40X7A3t/
	1nspJzVYvw6kaB8MqHqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYVeZ-0007y3-Hm; Tue, 12 May 2020 14:13:03 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYVeW-0007wh-SY
 for linux-mediatek@lists.infradead.org; Tue, 12 May 2020 14:13:02 +0000
Received: by mail-pl1-x642.google.com with SMTP id u15so1483937plm.2
 for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2020 07:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ci7zKqD3gUAa4Ry13dacSM6dlpd7qZR1mlqQSLUNRDM=;
 b=O/qLDBHjTmJNZ4W1E9Qf7I7qcg6eamfI+POItL7/mej0hX6DhjCfNdMtun9tUeSSL5
 3uEIkG+olE6RavA7Nz6gumINI0osXMpGfmZrF7Gi3IpxFqn7Fw4dAjRCi9HFxVoMkh0s
 WW74dtEp/Xndy66Sv0QFQVHgnWj8v9lY6LMdjDuz3qftrnH2zIE5CPU270kQ2uTCRX+E
 TJHyVDv+EQNnGK9lX1K0yW+sxwyYPbL1DvuYShy+ufo09thN1vq59owk018ZJp0wC/5T
 gX5sU79An1C83AYAqkLxM8me/QqZMV9bcCKGoV6CF38FfIl/iXAXND6KrmrxHiFjV2YQ
 A14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ci7zKqD3gUAa4Ry13dacSM6dlpd7qZR1mlqQSLUNRDM=;
 b=IKRoccdEcCYUAlLscN1G5CxVGYcazvuGtp1RkPa5V1SmpkIYuq0cnSWXVT4Oumt434
 BB0gPzOQwP8o5F59hWnVCik5aQZe7hAzen0LlT2RjVqqtm/5VxAAf+BmONkaQ7K+XQHl
 VThTs0ACwsLR2fKWhLckdkK3H5o9tyXKrexpV+asU/ckSWx8guITRhsMeFi3AKZzUh3Y
 C/8+l0qVQu/2nrbtp8yvzdwVfa5cEkgPHs571zsv18mo0nM+eHYzEo3vd1eAM4pMQQ8k
 R/OZDfyUC36auEcFAbbdi138yfB/vjpxt1KlZrZcfKI0s6SyIQJgTRxGE0zjWsdT/cEH
 WYhw==
X-Gm-Message-State: AGi0PubuRE/2hPqvlmJrEUSJWcG/5Y07L9flj0wcusdIM2oKDU6xVJkU
 0c6Qkrz1d1vEBQXU37ck7DLg
X-Google-Smtp-Source: APiQypJezn/TnyFOdcX7SBPrI3c2aWKI1uXvAlkdhblYFd0FY2muiujKh7MlqChB350C0ASDPTLqiA==
X-Received: by 2002:a17:90b:34c:: with SMTP id
 fh12mr26385247pjb.134.1589292779836; 
 Tue, 12 May 2020 07:12:59 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6007:2f23:5151:5dd:ea86:4678])
 by smtp.gmail.com with ESMTPSA id 141sm12422236pfz.171.2020.05.12.07.12.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 May 2020 07:12:59 -0700 (PDT)
Date: Tue, 12 May 2020 19:42:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: matthias.bgg@gmail.com, robh+dt@kernel.org
Subject: Re: [PATCH 0/4] Add I2C controller support for MT6797 SoC
Message-ID: <20200512141235.GG5526@Mani-XPS-13-9360>
References: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_071300_951782_BACB8866 
X-CRM114-Status: GOOD (  15.23  )
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
Cc: devicetree@vger.kernel.org, adamboardman@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On Sat, Feb 22, 2020 at 09:54:40PM +0530, Manivannan Sadhasivam wrote:
> Hello,
> 
> This patchset adds I2C controller support for Mediatek MT6797 SoC. There
> are a total of 8 I2C controllers in this SoC (2 being shared) and they are
> same as the controllers present in MT6577 SoC. Hence, the driver support is
> added with DT fallback method.
> 
> As per the datasheet, there are controllers with _imm prefix like i2c2_imm
> and i2c3_imm. These appears to be in different memory regions but sharing
> the same pins with i2c2 and i2c3 respectively. Since there is no clear
> evidence of what they really are, I've adapted the numbering/naming scheme
> from the downstream code by Mediatek.
> 
> This patchset has been tested on 96Boards X20 development board.
> 

Looks like this series has slipped through the cracks...

Thanks,
Mani

> Thanks,
> Mani
> 
> Manivannan Sadhasivam (4):
>   dt-bindings: i2c: Document I2C controller binding for MT6797 SoC
>   arm64: dts: mediatek: Add I2C support for MT6797 SoC
>   arm64: dts: mediatek: Enable I2C support for 96Boards X20 Development
>     board
>   arm64: dts: mediatek: Switch to SPDX license identifier for MT6797 SoC
> 
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt    |   1 +
>  .../boot/dts/mediatek/mt6797-x20-dev.dts      |  49 ++++
>  arch/arm64/boot/dts/mediatek/mt6797.dtsi      | 229 +++++++++++++++++-
>  3 files changed, 271 insertions(+), 8 deletions(-)
> 
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
