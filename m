Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27CEC432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 14:14:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FCE46103A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 14:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FCE46103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RHi6fGIH1RXvQbuRS1Cm4bmPufmKy2cystvLPxtzp9A=; b=SqU7OjRVI+X16S
	u5f63D34PR3FYipHzZuftfLRw9CIRNLy365F9XcIk+D3dBnl7chcJ3sazK8jXWjE168+WAI/9VIAr
	eexeyNBDs4ctF+afnsfMIg9cp8PY48nijjppxXjWZHWqkqdkuSC+6GfQZInHyOca3dFrCxh+5kb8y
	eASfBEPk6UAgfF3ntwmRK4qtH/N0Q8X8uHO0yzknuNT0T7wbvb6dKmecCuAuvTXkc96ec7HjKQWLn
	aw6XIligLJNr6kHPjdGZ4Xy+zH83GAPa/pvJji8NVt51g47ne6zHtFWO4Wag8WB23D4AvmRN46dwp
	AEOidH9/thy0OV0L0GpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJG8d-00AKcv-9G; Thu, 26 Aug 2021 14:13:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJG8M-00AKZB-Gu; Thu, 26 Aug 2021 14:13:39 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q14so5338875wrp.3;
 Thu, 26 Aug 2021 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=caYyU5A2AvEDiDoSCaNuh/yyConc6WLj0h0u8wdjUAY=;
 b=sfdfnRDFmn99FvOvSeIqiZu3TIpbOjIpjTkWDSMeJtlSprqfChCgqmNX+yuucnUgV9
 i6zK/gAr7uA4GITCV3DLh9/WVEtp6wrDCq6oQG+jyckvjT3+ADGUV0qEW6rSZr2LH7ph
 FGlaDC5Org74CkvgU6zGV0GrKV5pU0kKKE4Nk35WC/1I1vkXvJa+KHP/mkCE5tdnjk8p
 nWogC+riLx3d2o+ePUibWB3xTtU3gnmw5SmwcoSx6tKsS8kovnIp9gIwqtKUDxJvyBn6
 eIRGhiqWGZW3pfFeGyBnFHX+oGbYmorV+PEvPfhsTHJMSpKVOntuKb41J5jkxTBfA42B
 jktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=caYyU5A2AvEDiDoSCaNuh/yyConc6WLj0h0u8wdjUAY=;
 b=kJauJsiBKeuXtYm7WLRCDFLssj9ONJg8fLivxRgjg0Xw2fLeIQkuN6zb63rrJFF6Sl
 pyXAnCEhJJQ9nlCP88VTXVhx6qah79HM8MG5kZkW42SHsb89Q0iyyIFGXVs/0nsbe+YU
 wiKGvrt236Lb3WMwKAegy3W2njgh+H4ypDuo+k3k/DpUT9Zo32DYNuPe+JKvjPHBkTwC
 rItBxzUa8Nr/XSo5vViQjE+FdqDnK+Bh64O0jvArMcTucnhNnbKuwZnnUFp7CytP+mDK
 ctHvTclwuYvRWfxtgntG6T/1pQL9zRFdQ94a0yLml+0oFut4HyFygFaadJGfCynD5nqB
 eaeA==
X-Gm-Message-State: AOAM533ZOTG8nULXm1vt6lGbnk9nuAWGq+J6RyLtQCD4o2uoprQ4YgsM
 ylBqHPPD7A4cE3YhoqP4ZdI=
X-Google-Smtp-Source: ABdhPJy9JM6BAhgGm12/qstapJvz/0SjmJEusJf+9bezqcUxqhO2JhGEOaReMpCaxTpD+2laTY1RsQ==
X-Received: by 2002:adf:9084:: with SMTP id i4mr4333320wri.23.1629987209616;
 Thu, 26 Aug 2021 07:13:29 -0700 (PDT)
Received: from skbuf ([82.78.148.104])
 by smtp.gmail.com with ESMTPSA id b24sm4369821wmj.43.2021.08.26.07.13.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 07:13:28 -0700 (PDT)
Date: Thu, 26 Aug 2021 17:13:26 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 2/2] net: dsa: tag_mtk: handle VLAN tag insertion
 on TX
Message-ID: <20210826141326.xa52776uh3r3jpg4@skbuf>
References: <20210825083832.2425886-1-dqfext@gmail.com>
 <20210825083832.2425886-3-dqfext@gmail.com>
 <20210826000349.q3s5gjuworxtbcna@skbuf>
 <20210826052956.3101243-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210826052956.3101243-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_071334_606902_FA16CCE0 
X-CRM114-Status: GOOD (  19.39  )
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

On Thu, Aug 26, 2021 at 01:29:56PM +0800, DENG Qingfang wrote:
> On Thu, Aug 26, 2021 at 03:03:49AM +0300, Vladimir Oltean wrote:
> > 
> > You cannot just remove the old code. Only things like 8021q uppers will
> > send packets with the VLAN in the hwaccel area.
> > 
> > If you have an application that puts the VLAN in the actual AF_PACKET
> > payload, like:
> > 
> > https://github.com/vladimiroltean/tsn-scripts/blob/master/isochron/send.c
> > 
> > then you need to handle the VLAN being in the skb payload.
> 
> I've actually tested this (only apply patch 2 without .features) and it
> still worked.
> 
> The comment says the VLAN tag need to be combined with the special tag in
> order to perform VLAN table lookup,

It does say this.

> so we can set its destination port vector to all zeroes and the switch
> will forward it like a data frame (TX forward offload),

And it does not say this. So this is supported after all with mt7530?
Are you looking to add support for that?

> but as we allow multiple bridges which are either VLAN-unaware or
> VLAN-aware with the same VID, there is no way to determine the
> destination bridge unless we maintain some VLAN translation mapping.

What does "VLAN translation mapping" mean, practically?
Other drivers which cannot remap VIDs to internal VLANs just restrict a
single VLAN-aware bridge, and potentially multiple VLAN-unaware ones.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
