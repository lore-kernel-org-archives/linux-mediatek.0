Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60677C63777
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 21:12:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D23A3208DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 21:12:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J4RJQ+wg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D23A3208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ci9vJZCS06NALTXMjb+bsnmajJnVfb3YrVnLJKQUOtY=; b=J4RJQ+wgigSh57/29WR9zfEjc
	LA8KC7YofQLn+QUaubybunX449nfQZU6p4dztH3hhle6jfMWBFtSMzDZnaaq3YzOtANfks8xhsuGJ
	6swKECpiPpb7d9+V1Ej3Ex5EaVzSgV9gg5oFGga/rvkHWlmTgWiPzSZ9gKnncstVEEFwBUMsme6OA
	YUdIGj/CJNdUGOWPgQjJmPzNADUlnsBQ7Lc3Z8xQQU1e4fsNSCXhvueoF0Su3His20ohthxGbG053
	TN+yxzLfqY4FOySlKPIDMkNosU4jb3zAXUc+54qYG/cHUueb3/J5wVJ21s3X4kXGNhm3zvCtY6xuG
	UBDkcS4TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjqTB-00037t-MG; Mon, 30 Nov 2020 21:12:25 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjqSq-00031Z-Km; Mon, 30 Nov 2020 21:12:05 +0000
Received: by mail-il1-f193.google.com with SMTP id g1so12746624ilk.7;
 Mon, 30 Nov 2020 13:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WxsxXvfuMvWF5lnBY7VRxT7Ln+DOtZrxCb5729Hx5GE=;
 b=gvwKkrUzL9eYvWUpgZyTMg/yidpYYHmWploID2V3lKrFyzsYwW0/QfXyAywixdYg+I
 8b3Hg0HHE/PDs7KCueTU02K82DxW4vTfGidfcPTzgaBQpuKJyAsQ2hx96YOjlwSYxfPG
 Iro6/y5bt5q6nzDVxO6eEDZl2hc1GaYdiRHb6XFpwJK8fu0E8SXKwhFYiTtAMbpj05A8
 ADWLbM1hJhC3iNfFUyLFkG8uJgqPSsFDTs6/FBHkFj3Lt1+ZFxaehOFq0sQ4rqcQpCvL
 lJSPCgmHwRRlI8/xHhyHKsgiPolbUz2p4uK108TD2cPn7aTP4M7DcBaRwGF1oK5dQhVq
 rYQg==
X-Gm-Message-State: AOAM5335l2EmPdcpkSvi24IunNcWHShn7JcaTASuTb2rYOpuk9oRKb/k
 iIEMSyn7WnG/e4NXagmAKw==
X-Google-Smtp-Source: ABdhPJw8TNihGk5KIKz2Y6ESbSW8iFmz1M+bCJhphdgM2aFwwEkkRA0LwfHHL5UB2FsRCdCoKVC3DQ==
X-Received: by 2002:a92:520b:: with SMTP id g11mr20335993ilb.14.1606770723876; 
 Mon, 30 Nov 2020 13:12:03 -0800 (PST)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id u12sm11224669ilg.10.2020.11.30.13.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 13:12:02 -0800 (PST)
Received: (nullmailer pid 3030088 invoked by uid 1000);
 Mon, 30 Nov 2020 21:11:59 -0000
Date: Mon, 30 Nov 2020 14:11:59 -0700
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v10 3/6] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Message-ID: <20201130211159.GA3030057@robh.at.kernel.org>
References: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606447736-7944-4-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606447736-7944-4-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_161204_708988_DE205E43 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 gene_chen@richtek.com, jacek.anaszewski@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, dmurphy@ti.com,
 pavel@ucw.cz, matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 27 Nov 2020 11:28:53 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add LED_FUNCTION_MOONLIGHT definitions
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> ---
>  include/dt-bindings/leds/common.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
