Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31AAC3815B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 13:55:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C66820656
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 13:55:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D5k3wLBl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C66820656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=faDlUGx9PIXl0vIQHaBRIhKSQdpBzXtHdIlQ2ysJ9a4=; b=D5k3wLBloqcCGc
	P/PEKQo04Kf9yoxZUMPBJqXPkrLebm7fmapk2SPZtrnkByy6O4kL2MD/7FZQz/AOBJsXdn78gNFJZ
	ZNB+wJT7h7Bd9370d5OiloH3H2c7jc+0bDh1Yrk9cEpdNStFQIn/0l7E4QWfGebo49phhwYy3d2wj
	Rs7k3uhwG1Tqvurx4nfq+5bZ65FCY0XoB4QF6ykR3sWBpfjvVgzjO9NnbRFjtYdl+IApfRzt5E1LN
	Tw7e3t8hUrOYMbq6N5gE6S0axMy8akb/fVyMjc0S57vPdkP8oYg86ceXRQr+1KycZQL5s8kNbPR58
	plPXCHkhnK4kU87nFmmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOM2K-0007JW-3V; Tue, 14 Apr 2020 13:55:36 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOM2H-0007J9-Ak; Tue, 14 Apr 2020 13:55:34 +0000
Received: by mail-oi1-f196.google.com with SMTP id j16so10449168oih.10;
 Tue, 14 Apr 2020 06:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FjapXsJJ1fyLNoa0nVkaYgxq1rkyUWv/mPY5Av8L+lI=;
 b=p8c0S17zk0RhbS2gC4Lv5JVrcg0QVOvYhJuLxwByi4lcrVzKJAURqVhMLGghISRY2g
 T88i28fz01MLaw6M1zoz6VLYWj9LE5bB0vHNHENbrFN/uan0F/cY5zbsndCiC7DH9eYs
 H85GC6ptwv5XDEXla6qkpVze9cJQGq/mv6Lt3aqxqjDTTpW5eMjBcC8zpR+xHSSA+ZlZ
 07M9MFQTdAh8xrhhQXMDPbIImobbnGwzPfUrxJKBhVAxzn+0cgpmQaxoMaLBEn88AL5R
 ggAtdwxqC/aa7lytKyF+q9AVX823CQJ3WrmsoN9yn3lFXpfbevwXBUhYwaWUiDp1/R8c
 6unw==
X-Gm-Message-State: AGi0PuYqOrO8Zbvp30nVjgWwNKufR8vOl4MwRGLFm6dVPWFjszAERYFG
 JjtsmQ2TUXOtRnLqEI3F/w==
X-Google-Smtp-Source: APiQypLcp/5uJ/D4DypcS679K7Ewi00Jt/u7fJHXM5Ahks0NWkXNW+M1+Flus8mNofz8AEHBNeHjiw==
X-Received: by 2002:aca:d705:: with SMTP id o5mr15988391oig.67.1586872531843; 
 Tue, 14 Apr 2020 06:55:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r205sm5589832oih.47.2020.04.14.06.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:55:31 -0700 (PDT)
Received: (nullmailer pid 29150 invoked by uid 1000);
 Tue, 14 Apr 2020 13:55:29 -0000
Date: Tue, 14 Apr 2020 08:55:29 -0500
From: Rob Herring <robh@kernel.org>
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Subject: Re: [PATCH 5/5] [5/5] dt-bindings: mmc: mediatek: Add document for
 mt6779
Message-ID: <20200414135529.GA28611@bogus>
References: <1586165281-11888-1-git-send-email-chun-hung.wu@mediatek.com>
 <1586165281-11888-6-git-send-email-chun-hung.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586165281-11888-6-git-send-email-chun-hung.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_065533_678775_C6F0B98F 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, wsd_upstream@mediatek.com,
 linux-mmc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Al Cooper <alcooperx@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Chaotian Jing <chaotian.jing@mediatek.com>, kernel-team@android.com,
 Pan Bian <bianpan2016@163.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 mirq-linux@rere.qmqm.pl, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 6 Apr 2020 17:28:01 +0800, Chun-Hung Wu wrote:
> Add compatible node for mt6779 mmc
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
