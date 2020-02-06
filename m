Return-Path: <SRS0=Uacl=32=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFFEC35247
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 20:45:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B8B921775
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Feb 2020 20:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RvflZ/Fw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B8B921775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bo/cdQyd2bNrzNBfCdLByFVQWHipJ1vk+DGXikFUNhM=; b=RvflZ/FwL4GH19
	aST1/TvCG9atsjko065bsUZ/ghqaVLWnOlrB4kRvZ3Sm+GM0PAaPLHro/8MOVAEk/UO4pjBGTnw4X
	y9jf36pR6YoCyRuwGmAAK3adavsBTNZc1+ucilNcTMjHtAN6+aMHzI5DSiXFvF6+u3y4yE/5zdGRr
	zTR4HuKb4Ugp1GjYN2PXxrRkF/Fx0OVE/3JQaK2C35uexDntnkO8GReNJFBCgdTOk0Cq3c8x6OuKI
	0OJI47Q9SnYnL8bOKgyJNw2pXBeWcnuHbJR5GmexsAB/6vaNTPKsvKnZuUrxzT40YRv4+8loRRYdV
	45FwxbURY1Q6sm4R+/2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izo1o-0007TQ-5K; Thu, 06 Feb 2020 20:45:36 +0000
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izo1k-0007O3-BE; Thu, 06 Feb 2020 20:45:33 +0000
Received: by mail-pf1-f196.google.com with SMTP id p14so55336pfn.4;
 Thu, 06 Feb 2020 12:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H2tVfCzm70bqHn3/yPEccEJKGtHclRembq2rrvGRktQ=;
 b=grs08bRkkB8O9FtmXib/mJaWqlqh8x6mZHZuj7eFsBhQ44IEWQu6h0OCMuIHGvTFLE
 ThdMQ98JykQGLw3nWq9eM5GB8fK3kqSDnj2K/OjoxtTO0iZ2Q0BZnL8YVEbAt1X3kucG
 rzzpZBcJgpgqRiJ1H0wNDXwv06vPghbHoDAk82NoH5pWecfOYX+Y5fNGs2ogM1qU74Ht
 nZENBIeUtrnM6XXDcHGXQauONvdzoIvoNhBm0+ZSKvIm44fpNKgvYLAn3O/ZR+RW9ydz
 BNkMezmdgzEllJuWmm9105Vje2AY6M2wqJxtA7F8sDDAYcLf/mnRo7/hxOSuIRxOH5Qy
 9kuA==
X-Gm-Message-State: APjAAAU/qLvGrOuI3UpwUWuhuOHtWFlt0Ma6fEKQvwkUh7NaE5h+KGdC
 TMcHtZRVf5FfRBSumm22xA==
X-Google-Smtp-Source: APXvYqwfL4vZeTOwGsr6xUGNFEjJf8dH67j94K/HXOdtctgmKZDpYGF4Hd+jwY8XeBUB/qLzc7l6kg==
X-Received: by 2002:a62:c583:: with SMTP id j125mr6195854pfg.27.1581021930368; 
 Thu, 06 Feb 2020 12:45:30 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net.
 [63.158.47.182])
 by smtp.gmail.com with ESMTPSA id b1sm282011pfp.44.2020.02.06.12.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:45:29 -0800 (PST)
Received: (nullmailer pid 28991 invoked by uid 1000);
 Thu, 06 Feb 2020 17:22:58 -0000
Date: Thu, 6 Feb 2020 17:22:58 +0000
From: Rob Herring <robh@kernel.org>
To: Louis Kuo <louis.kuo@mediatek.com>
Subject: Re: [RFC PATCH V5 2/3] dt-bindings: mt8183: Add sensor interface
 dt-bindings
Message-ID: <20200206172258.GA19946@bogus>
References: <20200129081650.8027-1-louis.kuo@mediatek.com>
 <20200129081650.8027-3-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129081650.8027-3-louis.kuo@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_124532_397920_FFE2EB3A 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com,
 christie.yu@mediatek.com, srv_heupstream@mediatek.com,
 Jerry-ch.Chen@mediatek.com, tfiga@chromium.org, keiichiw@chromium.org,
 jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 hans.verkuil@cisco.com, zwisler@chromium.org, frederic.chen@mediatek.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 29, 2020 at 04:16:49PM +0800, Louis Kuo wrote:
> This patch adds the DT binding documentation for the sensor interface
> module in Mediatek SoCs.
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> ---
>  .../bindings/media/mediatek-seninf.txt        | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt

Bindings have moved to DT schema. Please convert this to a schema.

Sorry to ask for this on a v5, but I don't recall seeing an earlier 
version recently.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
