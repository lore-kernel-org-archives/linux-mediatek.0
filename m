Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62F4C636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 19:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7871C60E0B
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 19:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7871C60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dBteXGaYCyZAlh91Id8Y0WuzsqhmOl2RN/O/otLbbk=; b=ce4GEDGS8wzShf
	D3/h/yfalcIz4GMofTMHkv/9lekeq3+8/8QAPG7IecH+4mEtbIuxkvyHCZ6KUxlsdLCgbYvlrg7Az
	2LLvB4uq7yQAJQNNSOWnDlw2/fLV7tesOPWsqvtwBSQ/45nd08Wv54UuJSITC4VNbYOCSeHSbec2J
	UVGsJ5hfvaHx/i3XyFl7yTvpzzlbKZz8W/JFY0etax5hvm8lcJD2Qc2umm7WBYIK31gL5sg96xFaA
	rvbeA83TwVCr+5UePNpi6oZQ5Ed20pwMpO3mpE84SkNUDSQ6l8ScqrLHVxoeC2mWsl4/L9Ar7T33L
	pTGpTu98YWPQ56ZuJHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4pyx-006yQr-1i; Sat, 17 Jul 2021 19:28:15 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4pyk-006yQJ-61; Sat, 17 Jul 2021 19:28:03 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so13584732otl.3; 
 Sat, 17 Jul 2021 12:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OY5P3Qs+aXS0GXol5NiwP3hCcodvv6jduZx0L8iwDwo=;
 b=GDk8Q5ty9EG6/PxzOvcNyuxFvY3tmhdqw7RivNyfIxypiERnzVII2o4n99M/A0CW7S
 VinDg91/OEAyiWKItlwXmj14zRZ2+Q8mI85uXkJoDaHFtxJVeCA2Rf0zj/MLDoB57sYD
 3fdxcK3vIVbyxy+qai/R2xW9qhnXyixG658F7PJfVMdd8qOJ/hDdgESJGXzjeMbzj7GS
 Ybo/6iFiSMw8IeXYBFfCCeT30MgaoW4CvAi0ft8h6tycRO+eTSLtxIAMrEQ+HRkywvX+
 6fhmYpWK1iqLEdnzqmw0U38orl/6XXuu0Tnl9Px7BQal2AWfR21w8eZrZWO0F/Y9aLW5
 kLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OY5P3Qs+aXS0GXol5NiwP3hCcodvv6jduZx0L8iwDwo=;
 b=r4RitZCuTfafE7zRebZXzYMLT2AQ2vRjy/tiDHJQny+Lr3yjNArUemJnEeFjgxYCMC
 6Ww64IQBRFC5P9t0w7M7CS8zxTeN3fwXzV5QbTtc1LypHii90WS9w76RRMBoX23hKMm8
 tJXDT6zlJa2MxXgJ1xsCqd2cLfhJJhGrrRDLETMduQ9fXx31Ggj9LgoiH8StndA91EPB
 T7eYoYa3jVV7e7Fk2L/VYw8rMlSa3D1KSHsduPEUE9mhRPm6W7kh+zYxCKiqO0DY1z1h
 AaRDQMYVtKldlFDGtuclXi1LstxdoAFlVOxpDK1p2a2lqgjF+8d0BUjIZdOONSgyPgCZ
 IBAQ==
X-Gm-Message-State: AOAM5314u6K7nsuQmkqJPxegqwcZNWXNSP3Um0mKBayjiWqMN1LZiRXy
 dLFAEIRhR1OYldTdYZ5RPqdreChGb5XSoXADGAs=
X-Google-Smtp-Source: ABdhPJwdOL3GQLIGVxozk87GaIpeCxhnrSlIsGBjkPcciuhg1QX81Gna8arxi6vshxr7dwIurSKHYHuctsQpn+aidjQ=
X-Received: by 2002:a9d:7e6:: with SMTP id 93mr6516748oto.370.1626550080413;
 Sat, 17 Jul 2021 12:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210716153641.4678-1-ericwouds@gmail.com>
 <20210716210655.i5hxcwau5tdq4zhb@skbuf>
 <eda300a2-4e36-4d0c-8ea8-eae5e6d62bea@gmail.com>
 <20210717154131.82657-1-dqfext@gmail.com>
In-Reply-To: <20210717154131.82657-1-dqfext@gmail.com>
From: Eric Woudstra <ericwouds@gmail.com>
Date: Sat, 17 Jul 2021 21:27:48 +0200
Message-ID: <CABROOSdLyDZd0SBrN7Su40cqZgK1o2hp19mTJ3t4vcgORd-pdg@mail.gmail.com>
Subject: Re: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
To: DENG Qingfang <dqfext@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
 Landen Chao <landen.chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_122802_269964_6CED562C 
X-CRM114-Status: GOOD (  18.35  )
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

On Sat 17 jul. 2021 at 17:41, DENG Qingfang <dqfext@gmail.com>: wrote:
>
> On Sat, Jul 17, 2021 at 10:09:53AM +0200, Eric Woudstra wrote:
> >
> > You are right now there is a problem with vlan unaware bridge.
> >
> > We need to change the line to:
> >
> > if (vid > 1) reg[1] |= ATA2_IVL;
>
> Does it not work with vid 1?

No, I also thought so, but it actually does not. I'm working here on
5.12.11, but there should not be any difference. It needs: if (vid >
1). Just tried it with (vid > 0) but then it does not work.

I really like your fix on wifi roaming, it works nicely. However I
found, still after this patch, it sadly does not work on vlan > 1. At
least it does not on 5.12.11 (the 'self' entry does not get removed
automatically, but after manual remove the client connects ok). I need
to go 5.14 one of these days because I just read DSA has a major
update. Then I also move from ubuntu focal to a more recent version.
Then I'll try wifi roaming on vlan again.

>
> >
> > I have just tested this with a vlan unaware bridge and also with vlan bridge option disabled in the kernel. Only after applying the if statement it works for vlan unaware bridges/kernel.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
