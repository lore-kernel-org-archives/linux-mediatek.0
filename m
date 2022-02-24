Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048F6C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NO/A+caGv8kkEsnOLRXYUK9U+7myFKM3f8wqr1Ar+KY=; b=mIq3aTBey6GyJZ
	qQg4N6K+RNjbVCNNDyD665rfKn+yzWZ6poUEhjzYlrIoJXueyjHh/aDp98ZkkiimA7uut9r6mp2hB
	UV1ZHqLcqMK23rmYBdAjmBBdCx7m6NdYrtrv/FqirnYBSHQM37+fnAUGOE6PUXQIrJkVH7O6Xu8L0
	RB+XDN0UIaQN9bQfAF8PKHwIw1m1oVJOyyw6di421RxlCA46EPiD6E+B/AAwdAYtRxC8awQAGEZfz
	uB2AhXOOhUHeTGraV29UhHkZaUjGeMaTZs2oTcB8IYzongeaBNsi+rg6PfQb1o47NEoW5mIcZ3dJz
	kVZZEa0gIJR0H1IhFnsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNHKm-001d4S-Pz; Thu, 24 Feb 2022 16:51:16 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNHKj-001d1t-OB
 for linux-mediatek@lists.infradead.org; Thu, 24 Feb 2022 16:51:15 +0000
Received: by mail-oi1-x230.google.com with SMTP id z7so3399884oid.4
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Feb 2022 08:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N8RCTotc4cmUTmsRA5J7naJcJh1Q7sGDDwovYyQT86k=;
 b=fg9hkYcI5u3dbEw84om3H3LjBjjbFYuyGuZzo+47DtuUpbVS1U4m45qC/FWjkCJ0Fq
 Eve4HcWP9XH/q1aMs4G4ocbr+xm+z0OIssB4urMuHCRuI/h6X87iF+ZPNhLWVkMUAt0+
 MTrapkTrtRJFqglGwZ0sh0i1pHqLXoEFoC9Fcl+8BV0ksyQ4oiITyBSys7yZZhX4vEnF
 C27Xn8uPVBu11qhWxaVSvdAR46bqzbW+nttpUdMm5PDNRVqQKBQFEYPhyBtPGYCFsVZo
 XmjrNqjO8pHZW7S7UelvdUQw+nGMK8Y3c7Q5UP6CqicM2vNVAoClaawvVilgXSWCOjPg
 4YOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N8RCTotc4cmUTmsRA5J7naJcJh1Q7sGDDwovYyQT86k=;
 b=hmm/CjAwl4ci0QrNLRbMTofqWU3dtQddxa/AfcDhiXDM0cixrQ21WVzWv/K+lEIXqf
 PEMTvuYkxl6lyVbPBoeNnSt8yAQthrKHbrIoBs1ElyjIMowwjhuX6rYbucedD4/eLMee
 meyS9bUQF2uII9r5aUY3bkikA/BY48NSmkPJ1ub3Uvm7BjWMes7TpwKYu9DVhhTPlQlf
 xQxBbU11gaPSgK1SsFymkRYnhIWh8Q2xptcpCSYGCRVa6XoY1cuHlS664nv4MpsQtLcv
 it5rZvDeBuY7GxBnz2qz7lp0OtO3Vtc1LZccBLeHOsZKyj7JJqJqZI8z7k1C5U95XHrU
 +R8A==
X-Gm-Message-State: AOAM531DWtJ+nnNTSPaynRP/J34GCj/bJwFZTSZfGE5SejyQw+A+s+KW
 A8Gy6B4Uurvjchb3ZiBY0hL4pg==
X-Google-Smtp-Source: ABdhPJyH21pu5ycMxU9OVqYiNC++pfYrdMu5u7iIlq5TKIHOHUPz7vUGqYR/Y3LCAml5DLdoA8oD4g==
X-Received: by 2002:a05:6808:1801:b0:2d7:206e:36fd with SMTP id
 bh1-20020a056808180100b002d7206e36fdmr3705715oib.3.1645721469908; 
 Thu, 24 Feb 2022 08:51:09 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 lc4-20020a056871418400b000c8a240183csm33827oab.25.2022.02.24.08.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 08:51:09 -0800 (PST)
Date: Thu, 24 Feb 2022 10:51:07 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 09/15] scsi: ufs: deprecate 'freq-table-hz' property
Message-ID: <Yhe3e1coeUIGu+NB@builder.lan>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-10-krzysztof.kozlowski@canonical.com>
 <YhUodbzxx4wbr+gy@ripper>
 <455a8a87-63e7-7864-f765-142be18d1fa8@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <455a8a87-63e7-7864-f765-142be18d1fa8@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_085113_821918_9BD7FB93 
X-CRM114-Status: GOOD (  30.80  )
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

On Wed 23 Feb 03:15 CST 2022, Krzysztof Kozlowski wrote:

> On 22/02/2022 19:16, Bjorn Andersson wrote:
> > On Tue 22 Feb 06:58 PST 2022, Krzysztof Kozlowski wrote:
> > 
> >> The 'freq-table-hz' is not correct in DT schema, because '-hz' suffix
> >> defines uint32 type, not an array.  Therefore deprecate 'freq-table-hz'
> >> and use 'freq-table' instead.
> >>
> > 
> > Patch looks good in itself, but why don't we use opp-table to describe
> > the performance states?
> > 
> > In particular looking at the two columns of frequencies for various
> > Qualcomm boards they require different performance-states.
> > 
> > A concrete example is sm8350.dtsi, which specifies 75MHz and 300MHz as
> > the first frequency pair. The lower level requires the VDD_CX power rail
> > to be at least &rpmhpd_opp_low_svs, the higher frequency has a
> > required-opps of &rpmhpd_opp_nom.
> > 
> > 
> > As this isn't possible to express in the current binding we've just been
> > forced to always run at a higher voltage level and kept this in the todo
> > list.
> > 
> > But rather than migrating freq-table-hz to freq-table and then having to
> > introduce an opp table to express the power constraints, could we
> > perhaps skip the intermediate step?
> > 
> > Or would you have any other suggestion about how we can represent the
> > required-opps level together with the freq-table (if that's what we want
> > to stick with).
> 
> Usage of OPP tables is interesting solution. It would solve your problem
> of power rail levels. This would need several opp-tables - one for each
> clock, which is not a big problem.
> 

Ahh, so we can only have a single clock, but multiple regulators and
interconnect paths tied to the opp table.

We have a couple of cases where it would have been nice to be able to
key the opp-table off some index (e.g. the UFS gear or PCI Gen) and
control multiple clocks. So I think we need to look into this further...

> The problem is that I do not have any UFS hardware (none of my Samsung
> Exynos boards have UFS... I don't have even arm64 Exynos chips :( ), so
> implementing it theoretically will be painful.
> OTOH, I believe that having a working dtschema is very useful. Having
> dtschema without errors/warnings is even worth some churn/intermediary work.
> 
> The intermediary work is also not that big. Once proper OPP is
> implemented, we will have "just" two deprecated properties in the bindings.
> 

Fair enough, was just hoping to avoid the middle step. But that's fine,
we'll continue to carry this on our todo list then.

Thanks,
Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
