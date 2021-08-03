Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123CCC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:50:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D825260EC0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D825260EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dnufxl0HY40/22U5fL7IRDFdwYUr2WAia0mq9vQyBdw=; b=wO2I/zx/LzrgDA
	3VjBkYj8aXIdU1ZTd7N+HF33IUaMU3tJfSaSXg8AkkzTQEunwh0ButscJpMdJLPu6lLhHmCm22m2/
	YiJRIXYUj7JbhujZzjqL0rkQHOUclVA1m6aEkm/OHvyGBDR45PQf/4HxeSChetHr+F7fSdFJ19qrc
	5BT+uj/CvGX6VfKPU2KExIDSkuZbl4Pbd0okJXJzKmgUHmGIYtiFQMBiRkDs4fmME6XCFF97d16hq
	KzlG77V9gAxFyYmZ4gdlaswnNNU08CKfeEtzSDFLi5uzWFpra0tjVlbOWxiT/1IeG5051SvW/eZWF
	K3gi3Qy+8k1OgioLWwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAxcS-003fYT-EE; Tue, 03 Aug 2021 16:50:20 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAxcF-003fWr-Jm; Tue, 03 Aug 2021 16:50:08 +0000
Received: by mail-ed1-x529.google.com with SMTP id z11so7387726edb.11;
 Tue, 03 Aug 2021 09:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kz6WHa39NY1DimcXBCejglUOLZCSLGBCNYys39i436A=;
 b=GidJ4PALd8lcsN/+479wWdZjwN5ItPKon+1LgsGZDHx9vrASQ/Rm4ShGdFlftUrzqH
 QoAu/b7TUQedXNnHDd9jAC5OD/x+fJ+KU1Ax8uR0V+4iDCxeBzsN+zdX8L/GbuTkz5oz
 pysUAGB76bqKnH8xM3sBmCpFVy5x61+r6ENFAqc4XSN1tBwUhWGtOv1HT9ynTJTuwjXO
 zmk1hdAuc+jV1mhdMvHPHiS+xMZod5V6HkOU8YFpsyKQkbJphn3CYshwGAeEIKOZbZsO
 +2vcAtRltz8hdDCEhe4W5fkqWqWfVheM/y5wvjue3pz4YT0eiA4FMnutf/c02BT2cvYo
 gF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kz6WHa39NY1DimcXBCejglUOLZCSLGBCNYys39i436A=;
 b=am2uIKbL4TgXW2D5zVu+Gq/hybqcRraje3w3xjx/Do9u5tzENi10WmJH3E+ZU9IU9N
 /1KEBW8yavypG9o60if5jMYSyWN+48tcYFS+hnFQ1T+DmO7ppxJxFVf19Zxc6kRHtaeg
 u3sRS6fS88vXNRN+jHZQth3oYD41nBrXohIFJhVtBiDCFY95vDkCl6rVCJ35KYUaNyxr
 OTI1FKtTEWU/rZ5hrfThXLisqAQnQHLQelke/GrehGCWfIbAZslSDeUqHnzfuMVN0T8v
 2d9eEWjkAUPt7dK5srC29BQc/GfhpwvhsylFti387EodV1T/cchktmGJTN1dttDHAE3Y
 7vqA==
X-Gm-Message-State: AOAM5309AsRtjGqy6eXThFy1msL2GCfgHG6GEaQikrp+OfpRh4YJne2R
 5Mq9QLyvxphLnZXVCtTWvbM=
X-Google-Smtp-Source: ABdhPJwmNyBDEg0fSP5PACTINUZaszc78lirWA5ib/lzzSZQe+Vxywl11jsMf8bIyAeX8DaOSKG/pQ==
X-Received: by 2002:a05:6402:278d:: with SMTP id
 b13mr27469906ede.20.1628009405884; 
 Tue, 03 Aug 2021 09:50:05 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id e7sm6489399ejt.80.2021.08.03.09.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:50:05 -0700 (PDT)
Date: Tue, 3 Aug 2021 19:50:04 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Woudstra <ericwouds@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: Re: [PATCH net-next v2 3/4] net: dsa: mt7530: set STP state on
 filter ID 1
Message-ID: <20210803165004.za4oz7xhf6iynee7@skbuf>
References: <20210803160405.3025624-1-dqfext@gmail.com>
 <20210803160405.3025624-4-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803160405.3025624-4-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_095007_709226_212E67C9 
X-CRM114-Status: UNSURE (   9.56  )
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

On Wed, Aug 04, 2021 at 12:04:03AM +0800, DENG Qingfang wrote:
> As filter ID 1 is the only one used for bridges, set STP state on it.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
