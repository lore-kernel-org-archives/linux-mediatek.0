Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E9CC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 19:10:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 170F022527
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 19:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 170F022527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ev1UUrrH1at1AlkQtbhJocrtcA0o6juQcBkpYbOs/JM=; b=HRVz4fgfpJGexKnwAWdTBBUFU
	zQ1HhBsVG1Er+l942t45MdAbPft9csEGkKX5SBFJJFwuWE7gGj2tPZS5nWh3nvi7ZBcgdevbmbi3D
	2mX6oJRo+4Bsl7ZQFMq5SiNVyTTYV18FFFdM5VKOO3le0YR4kZTZobtpE/24DrWUQh10PemF93brg
	upMN0c+soEqPq4K1UmrWHYeIswo1knH8LqaQiygOApqGMmuwafIgE+38qHm6TM7FPDH7MgPqQ7G2g
	rT0I1QxHCB4j1EdNQvJnq5ofxqmYcP7BogizYGP8jres6o87F3Jf3lj0TkB1juHkZBIU3B1xaLjtX
	FnQNKrLuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krQZL-0000fO-Oc; Mon, 21 Dec 2020 19:10:07 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krQZG-0000do-Nu; Mon, 21 Dec 2020 19:10:03 +0000
Received: by mail-ot1-f48.google.com with SMTP id d20so9792849otl.3;
 Mon, 21 Dec 2020 11:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uflh9aWjQjUACrrKIUHZ3D3HKPpGYANwFYyzpKEZfWY=;
 b=Zvkb/eodYaK6H69k/sYReexaA86HCCvbX0utenp4eSo0g3Y9RsMaaboUk+zXKPTiWx
 LlEFv0uIWu2dGsiZwgDlclmMXwor9WrRYl/MnwAeQERu7zQ2vIURUP2zf6oOdJXpc2Sj
 ieuyzubmTTFW222UBtFoYJMAHdt6iK3qBMsey4KCoQoIxGdxKvKPbJw+9hkWnfIcOwlD
 yui57L9eIISSzEpFiWDyTAZXQ2TO3/Sn1vAG5neX/9m3o7nFJBdUSnlwCw4Z2N24emBk
 lct1bOc1eooKfSDq5O6SCqZxESHdjncAmVSOTvfgY7YEwu2j2grz2t4alZWuaLIxNDrF
 30xQ==
X-Gm-Message-State: AOAM533KKV0izosiq0sQvaopcckA7OhqFTj85BUNbAMg4j6N/wwAvLkN
 aQXZlMiWrtCl9yQvjFBuggOWXhvl/A==
X-Google-Smtp-Source: ABdhPJzk4N4FCaqCFlvX2+gDoZw1/MJMc70ppfBohNwet6wD2y4cn4zQDHGrY/ujUT2i4VWOyBryqA==
X-Received: by 2002:a05:6830:164d:: with SMTP id
 h13mr11021407otr.337.1608577801901; 
 Mon, 21 Dec 2020 11:10:01 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r10sm3879398oom.2.2020.12.21.11.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 11:10:00 -0800 (PST)
Received: (nullmailer pid 380370 invoked by uid 1000);
 Mon, 21 Dec 2020 19:09:56 -0000
Date: Mon, 21 Dec 2020 12:09:56 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v4 02/11] dt-bindings: net: btusb: change reference file
 name
Message-ID: <20201221190956.GA380319@robh.at.kernel.org>
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
 <20201216093012.24406-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216093012.24406-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_141002_816320_DE018F09 
X-CRM114-Status: GOOD (  12.62  )
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
Cc: devicetree@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 16 Dec 2020 17:30:03 +0800, Chunfeng Yun wrote:
> Due to usb-device.txt is converted into usb-device.yaml,
> so modify reference file names at the same time.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v4: no changes
> ---
>  Documentation/devicetree/bindings/net/btusb.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
