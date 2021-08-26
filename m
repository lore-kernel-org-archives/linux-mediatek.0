Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D01C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 05:30:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 081456108D
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 05:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 081456108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwAMiID7Dc+dIurWaql1eVP5agiQIN8BHH4rgUIo/Kg=; b=SO4RmDxnSLaIAa
	ilk6uzJgnuQN7PPwQWmezYzBIaocHvD/AORjykS7GdfwvThAfdIBYiX6Rk9jt6m/eNAQUsEHkKszo
	LBSAsdDfGXV0pHonkv2+Qanzb+PZ6VFQPcWSDUmAvjXQy4Hrz4mps4eiKnw80SiHwnevH70ASgBoD
	Fmm5OzavmYKsyYmr6RnWtprzf+X54MpYBZzMYj10YrARTrBqua8m9vKo4Ruj+axG+iNQYYqMxvgAN
	xbEcFV44e/IHN+s/HIE4PaAVoZKe2QjhRAnxnbUr2BroWMjDduKrQtMD8m88wo3fFKo8K9UHlJYou
	vskBkxIl2ubTDFHRkYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ7y1-009D5T-CH; Thu, 26 Aug 2021 05:30:21 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ7xn-009D3x-Ke; Thu, 26 Aug 2021 05:30:09 +0000
Received: by mail-pg1-x52c.google.com with SMTP id g184so2113605pgc.6;
 Wed, 25 Aug 2021 22:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=x4RmyD5fclG+LrgWWesbcdVQE97Kggxj6lIU2hXpp1s=;
 b=Iwld+o5kE3cC7dKFDVPDZ5uAL6M+SDCzXILZlsoW4OOYMm1/e0Pz1EuVluvNGV+rop
 Vd7AzU0ZiFZWltIItaqBiQH8BFMyJCN11+7Hg0sWlJQq3YRn2FjbESWBmqHttTe0L3L0
 4zywT7UMIMUTmOUt8yeDuQdSyFNUrWkcJFlAUM4Gh5AU6SinB9cNKI6CyB2qEne/VZO5
 dFeQ9aOT/l5wfnPAhkUi2zi3V3+K6tvp3WZ0yOMf3ZePhkzSV8+iA4qsPMg325NJrN3T
 c0TdPGJn/xdGWEn9vHLJoRcl5l+zhTLrJsnc477kPc37YLpR46u2Sf5O3cycGwttBe8M
 8rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=x4RmyD5fclG+LrgWWesbcdVQE97Kggxj6lIU2hXpp1s=;
 b=mXk3iigapfSqv9zc8NnkdxZeMSEUtsWTDN+ZH19wJoOx7YxH30Xu8uCvGmVx5yNiBf
 YclEOvZqNGknrNRGnaHkgqUKKul3Q1HD++CJaFmYx4CQ0TStHbdDrfQkFDljUlIcdcpg
 lwka80m9MSkk+o4yp/NAlTsv6rBfXcZ2CPSH9GMCzJpqKI9Vk7b7+IKP1TZB3kieMKPm
 SxmDsBXAPgm2gJQ2z7OSTyV2hfYYuW2LSlJHRnxRTrL28MqDWOepBVa/vaXc/HTXj1zy
 /KFva9XNSNcHG3rrWO4wN74FfGbmdxeRzR4BUu3c9M0mFWTOAVrKyI7ocEb6HXqYYAvf
 MG5Q==
X-Gm-Message-State: AOAM531IXT7UrA6hxazQAtylvLJOqXBJV/Dcpu7ZZzSfX2n1T+USxF5v
 5BMD7p2U2dCHZMwEH/U2mmw=
X-Google-Smtp-Source: ABdhPJwXQo89ZTUyaW5hgncilg4Qn18/2ISbQ2HecVAww0acCXr7JAbk83ELloXGBqr8+KhTkkp1xQ==
X-Received: by 2002:a62:e90b:0:b029:30e:4530:8dca with SMTP id
 j11-20020a62e90b0000b029030e45308dcamr2041539pfh.17.1629955806691; 
 Wed, 25 Aug 2021 22:30:06 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id u3sm1316019pfg.58.2021.08.25.22.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 22:30:06 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 2/2] net: dsa: tag_mtk: handle VLAN tag insertion
 on TX
Date: Thu, 26 Aug 2021 13:29:56 +0800
Message-Id: <20210826052956.3101243-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210826000349.q3s5gjuworxtbcna@skbuf>
References: <20210825083832.2425886-1-dqfext@gmail.com>
 <20210825083832.2425886-3-dqfext@gmail.com>
 <20210826000349.q3s5gjuworxtbcna@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_223007_715015_BB2EAD0B 
X-CRM114-Status: GOOD (  13.54  )
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

On Thu, Aug 26, 2021 at 03:03:49AM +0300, Vladimir Oltean wrote:
> 
> You cannot just remove the old code. Only things like 8021q uppers will
> send packets with the VLAN in the hwaccel area.
> 
> If you have an application that puts the VLAN in the actual AF_PACKET
> payload, like:
> 
> https://github.com/vladimiroltean/tsn-scripts/blob/master/isochron/send.c
> 
> then you need to handle the VLAN being in the skb payload.

I've actually tested this (only apply patch 2 without .features) and it
still worked.

The comment says the VLAN tag need to be combined with the special tag in
order to perform VLAN table lookup, so we can set its destination port
vector to all zeroes and the switch will forward it like a data frame
(TX forward offload), but as we allow multiple bridges which are either
VLAN-unaware or VLAN-aware with the same VID, there is no way to determine
the destination bridge unless we maintain some VLAN translation mapping.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
