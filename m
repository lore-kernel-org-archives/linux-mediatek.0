Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB896C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 21:00:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7399F60F4B
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 21:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7399F60F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGYRw0niE6eLpQiBbsAy2iTx6uKR0tSxUlm6pfP2I9I=; b=gw1edC31gEs0TQ
	JQLY3dh0OTEP0aAcdmDJEa79a3XrKU0a41mkPCv5fU5e/nJTd+2RRUlRfxbvCF/+3zdRLzSm+tfh0
	xkC+hw2ps4rdYrzkttU/GYXqKu4YAcjj4vh//3yrwwJvDfMHcQzJ1uqLCyXLCy512MoFbCEx+ANU0
	tP/G8NIGc9H530dOuz64rCD/gI1b96mP+YxxlpbKI1/V+zE0K/HuBW00nbrcm+d+Ou/fGDpKZ6huk
	f7VstXB0pKTWW/RLrPlB+xuFQumznERXO7752CX4ySmpR+5ps1l2IxBV+Nz93VH+wCeT/WWfSG45e
	LW2BMTTusc5wxQxHx6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAf2u-000Eir-Ey; Mon, 02 Aug 2021 21:00:24 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAf2g-000Efl-Vn; Mon, 02 Aug 2021 21:00:12 +0000
Received: by mail-ed1-x533.google.com with SMTP id g21so7030679edb.4;
 Mon, 02 Aug 2021 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=au7OmFbdKv+WEAGRQZkjaVywZk0CXvijDSw0i4sbtGE=;
 b=EdFRe/KmdoJn1AHOI1FO9W6HwfLEJuPIttmxOrfsgZ7XSj2xJ/yDY+WwBQCzW2hnM9
 uFPAJdttH57zeJzFLM+i5h53NG/Ag4F2m4dpRrSCB3Xf2B82a32BkeO+KEIMT1CYdb7w
 ZRA8EUoCvu1mmmHj3FR8Dd2PRjokDDk3Dw3rvdLKWxG96hVvNSpWqXJu2jOOSNzSAAOx
 kj2KbixhxQbXUVvKHJ9rdW0Dk6jJnd4qswUs+vQC6OdvWgAAr48ndZgwLlmV26YVV4X6
 vZVl+0dj2R6WiWUGYrIbNCcDiMqwNIch/Y8qAKpmWJYmKX1Wp3evBKuJi52lpvJ56z83
 TcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=au7OmFbdKv+WEAGRQZkjaVywZk0CXvijDSw0i4sbtGE=;
 b=MOcLwy0KferSMeT0//B+gbS9b60oii8RSpWrk+39sExM0jeYmiFHGde2+1c5yeiAic
 mI/oRczd3FutnXtE4IM+FJXwU5AV/z8spS+SVCc53JqVqLFqLb2CxypSMyeo3MYcPC3Y
 7s7rJl3PYhwPlvONQMNBBzB7I06KNWLcrKxUcph4vR7JXQfm5Y6W1MyEYr6wNNXiia8/
 2l8vOv1T117+UDTxuF7T+CfG66ogKkRn12kIuNRsDAOSBE8Fh1/5j8N/On+0pEM4Ixup
 eYpUBA1MFBV/o/oTKVRTB94BDcAtf0PeTCvY+gVk0MqIynWwsQjGJO2xoO8823Yqes2P
 9jKQ==
X-Gm-Message-State: AOAM530D0b46ZgwKhfW8e//iP5vONAIRT+T21rWnNyIBfPwORvqRYEib
 fkCClOisLCDiskgx/bhII5s=
X-Google-Smtp-Source: ABdhPJzyuFCqFOApHOayrbRXZJjmJ3F5gh6jzvSJdRg/0sb8lMnS6VK2GCoDWXc5t1B1LePaHFf/7g==
X-Received: by 2002:a05:6402:35d2:: with SMTP id
 z18mr14382992edc.282.1627938009217; 
 Mon, 02 Aug 2021 14:00:09 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id b5sm5126644ejq.56.2021.08.02.14.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 14:00:08 -0700 (PDT)
Date: Tue, 3 Aug 2021 00:00:06 +0300
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
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [RFC net-next v2 3/4] net: dsa: mt7530: set STP state also on
 filter ID 1
Message-ID: <20210802210006.fhmb5s6dsnziyk7d@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-4-dqfext@gmail.com>
 <20210802134336.gv66le6u2z52kfkh@skbuf>
 <20210802153129.1817825-1-dqfext@gmail.com>
 <20210802154226.qggqzkxe6urkx3yf@skbuf>
 <20210802155810.1818085-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210802155810.1818085-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_140011_077340_B82436D6 
X-CRM114-Status: GOOD (  20.58  )
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

On Mon, Aug 02, 2021 at 11:58:10PM +0800, DENG Qingfang wrote:
> On Mon, Aug 02, 2021 at 06:42:26PM +0300, Vladimir Oltean wrote:
> > On Mon, Aug 02, 2021 at 11:31:29PM +0800, DENG Qingfang wrote:
> > > The current code only sets FID 0's STP state. This patch sets both 0's and
> > > 1's states.
> > >
> > > The *5 part is binary magic. [1:0] is FID 0's state, [3:2] is FID 1's state
> > > and so on. Since 5 == 4'b0101, the value in [1:0] is copied to [3:2] after
> > > the multiplication.
> > >
> > > Perhaps I should only change FID 1's state.
> >
> > Keep the patches dumb for us mortals please.
> > If you only change FID 1's state, I am concerned that the driver no
> > longer initializes FID 0's port state, and might leave that to the
> > default set by other pre-kernel initialization stage (bootloader?).
> > So even if you might assume that standalone ports are FORWARDING, they
> > might not be.
>
> The default value is forwarding, and the switch is reset by the driver
> so any pre-kernel initialization stage is no more.

So then change the port STP state only for FID 1 and resend. Any other
reason why this patch series is marked RFC? It looked okay to me otherwise.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
