Return-Path: <SRS0=JbG7=YO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF29CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 00:42:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EEC4207FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 00:42:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fhB7bzZf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KmVc3jxG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EEC4207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfVLfkQB2koQ3PTMEe8LPa0pEPkeU9H0B25PWP2Jg6o=; b=fhB7bzZfJqTCTw
	7qxjWCeX9vQ+vFYG9XqfcjswwdBH2FxGfvLm63CS2IzwVL8NIgUv4YnBx8BDL7JSRTQAnqr+EWP28
	STwFNJOo8y0+Np/vwi8nKabSPyUhjubbX1RQ7zZROFPrqUcq2ETbN8pQtaONAijpsl7iVYnlK4DEj
	lXF2W3TxlS5u7i2Vrv0mql1UjLgZxgF4or3ahF3CZ0V9lFQzD2L8w3XQpC+hV6aez3pszNU+Oavjg
	qBA/XI0d6QCZDlvSpq9cIdoixOtYYGHYtskaHxQEsH18zPEvpKgC6y+tiU0Wyh3myrAPXgpVIiwYB
	iO16oL2P5TiRldRhr46w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMLm4-0003cO-Sw; Mon, 21 Oct 2019 00:42:16 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMLm0-0003aZ-Lp
 for linux-mediatek@lists.infradead.org; Mon, 21 Oct 2019 00:42:13 +0000
Received: by mail-lj1-x244.google.com with SMTP id f5so11387054ljg.8
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2019 17:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5RAFiewUpPwyWuNdO/9XHW8T8gkSCyTvJItx6zJP94=;
 b=KmVc3jxGab4evVVavdh8XOYseBclVoWhBn3e9VOmXOZdYnYPMcL5SpohY4awkYK3DQ
 ETOCTAvUrzeAA3ul7m/7zfE0PHm6zwSF3ye2VoN++TBijRbvYwEkQCP05TO+pB9YqrFR
 +q7MfhaCHG4BsAstUzZZHQ8PulcP3ubwfYlrvNuM/ElkY8bA2eObOyRtPuiA3p/mY54V
 VP2vhufU23hOrjdFpos+8jdfhEXZfXeYSaLsJ+vvLJAv4qBMDOfDfq/V/XtjjgF0Ai55
 +EMVQR7fFKfIUu14QUj/HT8f24/VPzQjTJwZmF+Vdyf/LYZVLXDM9MQCxVYrUDTqA1fw
 E3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5RAFiewUpPwyWuNdO/9XHW8T8gkSCyTvJItx6zJP94=;
 b=lM1UszP/R3m74JGTKQAZlRvTxvXqSQSEbRBwJ3GY61h8o9s1hwxSAN8sQXwLR9EmoI
 lfp6vpVHYCFLZdnxID+g/sEJ12M/s3rUX1X6o/K+JP94yUvOVChCkvQYcJCXG/B45S7a
 nQIrvN1cpZp5U8hg0npbLpu+0f0mLWkD+7tC00Hzdp1iVZt9JRDDRTP6KjNm90OZ4Hmw
 I8BDbS0pFVqlo6lWO/Fg2QsS3y9roaxN0zuZ897ULs1Rg38PQLPZSTN1jNnZzTm1U6Ll
 awOPrIj+/wsZF/e/sfj5J/y4JD7MxIDytKCv8RAOhu35ZeEpufwQG2ADGu+mhrqapcO0
 IlzQ==
X-Gm-Message-State: APjAAAWxUPoBpRZICOXprRym9BI26Beur7buivE661mdetA4Kzp4LxeU
 ag87AL8uvvVHwgr62dtxVJrcWmBPXtnkvy+pM3BJ3Q==
X-Google-Smtp-Source: APXvYqx02W60Klyl42qZZwLW2dzAZTfOGWXnrCHVzSdWGC2CYqb7qVDnpQS6901eL0bM7HBE5DOtd24dGywuNoa+dsM=
X-Received: by 2002:a2e:1214:: with SMTP id t20mr12711065lje.191.1571618531310; 
 Sun, 20 Oct 2019 17:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191016200647.32050-1-robh@kernel.org>
 <20191016200647.32050-21-robh@kernel.org>
In-Reply-To: <20191016200647.32050-21-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Oct 2019 02:41:58 +0200
Message-ID: <CACRpkdby+LF5B8t8omn4CVv36NoYya0DZJPCi3a-4FUmDCFrVA@mail.gmail.com>
Subject: Re: [PATCH v2 20/25] PCI: ftpci100: Use inbound resources for setup
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_174212_714027_7C29F3C9 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 linux-pci <linux-pci@vger.kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 rfi@lists.rocketboards.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Tom Joseph <tjoseph@cadence.com>, Simon Horman <horms@verge.net.au>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 10:07 PM Rob Herring <robh@kernel.org> wrote:

> Now that the helpers provide the inbound resources in the host bridge
> 'dma_ranges' resource list, convert Faraday ftpci100 host bridge to use
> the resource list to setup the inbound addresses.
>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
