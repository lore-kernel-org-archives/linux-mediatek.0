Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5283C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B506D60F4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B506D60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsJdyBKF21yDmvHfCXHLJ65tyjs+QwsYCEmLY9sUwB0=; b=RDVHUP249gR+4b
	vPykXwnB8rigtF5dWpWnbuUubukBBEHGOtEIR2Q7uyBKhLeHNwr0tUn9daUA93A8RYytDDtYfv+x0
	3OmnZtMDsjBjET0YiX3QGxudTAcXpBeLMNvPi7oUJ4AXDYb/fHsYnmCaFxHfIRcpPEP20Ii8F119/
	yZu1B0j6GCFP4OhnCLQ+Ng4Hq3YS/1C3OYZy/13fKj5H6A1lEfUBG2nJ1Y6VOKrz7Fuh3zr2bpkxi
	1dUHmOy+MdM0Mxs1bIaNGFJ56N/FakjDzIub/uZrNOZfScKc7d5+KF6121Io3K2/vOE7OsD72b6mQ
	yY5W9A5KH4gec/LiC+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9WPx-009hwg-24; Fri, 30 Jul 2021 17:35:29 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9WPj-009htW-7Z; Fri, 30 Jul 2021 17:35:16 +0000
Received: by mail-ej1-x631.google.com with SMTP id e19so18128535ejs.9;
 Fri, 30 Jul 2021 10:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Doj/dcye763oRah83vvNs5pzHAb0NoOee/TncGZwApU=;
 b=BQg7DckksWodBw0VQ7WPS4t2HMmrgZ+HfNAu/6WhoBRD0YwS2xvVFwP59v6wjDZcxe
 wKQO2DB9rWXR5UyTuC3T+0KaypDyuZAhGPyEk0webhsBW4dcFfoSO0ZSGtilfWKtwXwd
 fw5Fd7AMIFWvsSPXKtQyob0xfiO+S925Xz05Y+jD0w3V2XEYJvDHteBWvxp/Fx0AzMtf
 0hZpqnuIP1KH22HtnuX0kz36ulXHzIOYribAhl8SjjtkFWzX0eGuExK6LfsJZ+m70Imp
 x2EBmf0dpQnKwtkrMZHhBycAkUjA2+el5Iac1fepoQjWZUg2z/lC89lIeEIBTM8g/t42
 uToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Doj/dcye763oRah83vvNs5pzHAb0NoOee/TncGZwApU=;
 b=myKaXPSIdtTjohLA+Uwq2QaXRkjJZr6tOCLN7MRMI1XgjSpiaAvc+N+X6hqIwRWu5f
 nxVMe+I2M38rHhXpacW7MUXiKD8xbTnkEj2dBES/tiURVIwQO7KgF6IyrYsB1r2bRWBq
 RKqHtWh2t0DIgqZBYhl1GbwxP7NiJD2fe6wBQNN/Ew/+QL8gPka3XcAtGWi2hKfrK/HK
 hTaFp92M35OVaHuvQRGgd5CNzfX8YP3SGX1WAQYM/YatfOPd3GSkiIBJQlcl+WexJu3u
 mTZpbI0YIGXY2vfe/dStJZc1YXRNoO3hlRDJgb1P6nnfsHNFFZ7jzcK9MWwidSmpLp+4
 Mnvw==
X-Gm-Message-State: AOAM532AaafAUOD9zLS4KaLTPR+OmUy94BAoz7BA5H0UYDY/us2aHfx8
 EWbAeKpTYqCFyEl4s2Dk/Pw=
X-Google-Smtp-Source: ABdhPJyOwdP7JUP0KwB6OY34dpeaov8/WjtVtdb0zSBQ4iypGBdQsBLuQqvFN1QpHl2aLsLMa1Bnag==
X-Received: by 2002:a17:906:5509:: with SMTP id
 r9mr3748176ejp.74.1627666513708; 
 Fri, 30 Jul 2021 10:35:13 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id ha26sm778371ejb.87.2021.07.30.10.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 10:35:13 -0700 (PDT)
Date: Fri, 30 Jul 2021 20:35:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next 2/2] net: dsa: mt7530: trap packets from
 standalone ports to the CPU
Message-ID: <20210730173511.ulsv7wfogk5cpx5j@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-3-dqfext@gmail.com>
 <20210729152805.o2pur7pp2kpxvvnq@skbuf>
 <CALW65jbHwRhekX=7xoFvts2m7xTRM4ti9zpTiah8ed0n0fCrRg@mail.gmail.com>
 <20210729165027.okmfa3ulpd3e6gte@skbuf>
 <CALW65jYYmpnDou0dC3=1AjL9tmo_9jqLSWmusJkeqRb4mSwCGQ@mail.gmail.com>
 <20210730161852.4weylgdkcyacxhci@skbuf>
 <20210730171935.GA517710@haswell-ubuntu20>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730171935.GA517710@haswell-ubuntu20>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_103515_333987_3B506169 
X-CRM114-Status: GOOD (  10.02  )
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

On Sat, Jul 31, 2021 at 01:21:14AM +0800, DENG Qingfang wrote:
> I just found a cleaner solution: Leaving standalone ports in port matrix
> mode. As all bridges use independent VLAN learning, standalone ports'
> FDB lookup with FID 0 won't hit.

So standalone ports are completely VLAN-unaware and always use a FID of
0, ports under a VLAN-unaware bridge are in fallback mode (look up the
VLAN table but don't drop on miss), use a FID of 1-7, and ports under a
VLAN-aware bridge are in the security mode and use the CVID instead of
the FID for VLAN classification?

Make sure to test a mix of standalone, VLAN-unaware bridge and
VLAN-aware bridge with the same MAC address in all 3 domains. If that
works well this should be really good.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
