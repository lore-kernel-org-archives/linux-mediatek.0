Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EB96C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 18:09:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E779660F00
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 18:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E779660F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+6c5UWspNmqKFOPm2zRKt10u2wbRl8y/hilEKp7jlw=; b=mOKdQGk2GXaNAP
	iL9vrT3NoRUPpNi0S3/N/iKzl9jT7NIHcwiwl9v8w085r4rLams51qiSGrpNhWUeZMAnJCdubEKCY
	LU+UyPt4xG28jycMlw4cMkZQ5cHszXAqXuG1fZw9WJcl3A57MGaPsAE6OEvDWCOd2VdI0ZxmEszuw
	t66ejYI8/4OpufPsXpaMF6vHDUcyaOJgS5HaUEXpjrc6BgzeIG66KNhMc3m7YQUGqpGMKip8Nr6YY
	RlFdz9sdfAVIj3Q41NyK/IPQhZOpKMbujJGVjT99jPsBTE2NPHKs1Z/9fDO3RVjKqoZ1fhKLNDIYq
	xaU7TtVCp566ty4o+hRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8nzA-0021DA-LF; Wed, 28 Jul 2021 18:08:52 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8nyh-00212i-LI; Wed, 28 Jul 2021 18:08:25 +0000
Received: by mail-ed1-x535.google.com with SMTP id h8so4463916ede.4;
 Wed, 28 Jul 2021 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0ZTJnZtraIG0xPipALR10pj5tmmjQMjK6shf1JTwqpk=;
 b=JgPC/3JBmvWiLoyT2NK/dn+kzAbbqaqEpRXKf55vkck4YPBZRdLOwv2yRCvOoVpMEi
 aBS0ltY4gtDOwISN64UiY7MQyxGOuHwV0pj5KulGZMK1zJRFi8esjjQOPJqeqslDRuTp
 vU3X76haMpN+qSk4DgJ0Org9uNSF9E1aIw//lNjmGZ8/ZCaeCPeci7TU8blJVRXfOhKQ
 kEj+a5p8W1P+P6tEDmYLR/HyaQwIR9dB0neIY9v/YtR3wFu54Cma8AUOFxZgk2t1p5TT
 Mz7LcRtOfkCnqzfc64ZUh+gQuAIbhmD5ZNY0qidALiD6YQPjtlJUY5lKGy4kXkSC7sKU
 NGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0ZTJnZtraIG0xPipALR10pj5tmmjQMjK6shf1JTwqpk=;
 b=ces2OXWDK/W6q5j/drmG7NKNa8QVc/OKNe/7xpq2s6jlrMlh+omvnks08oMCoVh1yC
 qskSH85v5WTP5Y25nHzIkWKKMpNxV5/ruMM7zF1GOYpDKubK1HgVnpwqCe4UQRu/fX7k
 nnTi79tW7vLhy/mzx5J6hXcoRxGB7xLvGVzYipd5oAsEWYDHTSc0zraSIxqJaPsttle4
 l0LO/5Tt262u9hy+UaYMZbeFX0iZ8SPJxbOHOdafF1xE9/zjP7EK0kckAtBST60vr3Fp
 QSd42a7Rp1nWKnh1TL+SQLTkgCZ+BgJHJHpptsrUUV/Y/Tjl2sJDLbGxN1qRRijQsk6V
 24Cw==
X-Gm-Message-State: AOAM5337OpXU7k1nAszR99DN8EkgN4fyU73ZrFglzvLBRA4O/jm0atB6
 px/it2fO6v8b+NUEa7S2rb4=
X-Google-Smtp-Source: ABdhPJwEqVB8zqyKQ4K2P8TAEa37pHxPMHxMS6a23Sxq7bHR4vQ2I2cH6uzNfreWqKQe++YLwYM31Q==
X-Received: by 2002:a05:6402:291a:: with SMTP id
 ee26mr1342296edb.220.1627495701024; 
 Wed, 28 Jul 2021 11:08:21 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id x2sm211241edj.37.2021.07.28.11.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 11:08:20 -0700 (PDT)
Date: Wed, 28 Jul 2021 21:08:19 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 0/2] mt7530 software fallback bridging fix
Message-ID: <20210728180819.egvin5gyllmwqp3n@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728175327.1150120-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_110823_814064_4B6CF692 
X-CRM114-Status: GOOD (  16.49  )
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

On Thu, Jul 29, 2021 at 01:53:24AM +0800, DENG Qingfang wrote:
> DSA core has gained software fallback support since commit 2f5dc00f7a3e,
> but it does not work properly on mt7530. This patch series fixes the
> issues.

I haven't looked at the patches, just read the commit messages. Your
approach makes sense considering that mt7530 supports ACL rules. For
switches that don't, I was thinking that we could add a check within DSA
that bridging with software uppers such as LAGs can be allowed only as
long as the bridge is VLAN-aware. If it is, then the classified VLAN for
packets on standalone ports can be made == 0, and if independent VLAN
learning is used, then the FDB entries learned on bridged ports will
always have a VLAN ID != 0, so the standalone switch port won't attempt
to shortcircuit the forwarding process towards the bridge port.
Anyway, we can have both solutions, yours and the generic DSA restriction.
I was just not expecting to see a fix for this already, it makes me
think that the DSA restriction for VLAN-unaware software bridging should
not be unconditional, but we should guard it behind a new bool option
like ds->fdb_shared_across_all_ports = true or something like that.
What do you think?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
