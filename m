Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCD2C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 03:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kBFuWbNaffCJqtzsn6fNGut+wV+n+W1/XlDm5rgJ5s=; b=c1CaLbhA4+xQXN
	g0zgA8m+W7Be0y/hLNFw1ZmQYvpAG85buWYsxN3qdlHWtAkUi9mYe2yOKJf+JJujOSndbObZ99xVF
	t/SFasGgy0ophpffC1bVT8IuvOZurVevXCvssND9Lat00+B9pS8KeVq4gZMn5rp4lONz8kF/3v+3G
	x9vLxdsGzxhP5Bku5JSBI2eV8WWNcZR97GY+keXBXA2RtrnMlRmcEAuBIgBdmDVyEzg65hrb5VGFN
	tiITPAgBJI9tCmIuwZLO0x2pbbxyIEevga6S6DGulOXNKjpmFm3p4sLsKhcpzQglTRg9FZQScHzdr
	ORZH7jMN6xodbJPtUE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndkd8-006Rvp-MB; Mon, 11 Apr 2022 03:22:18 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndkd5-006RuB-Tp
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 03:22:17 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 c12-20020a17090a020c00b001cba1ebb20cso699740pjc.0
 for <linux-mediatek@lists.infradead.org>; Sun, 10 Apr 2022 20:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZJz/3Tff3xT2pELYxTDnLdX/EaWMkTM/zNFqF30/VyA=;
 b=Mjc81Law1q/Ilavwb+/4Fl8wIGNrgvJ4XSMH+pz6jNcrc/pfNzRzOLeTYspW+81oS/
 77z0QvGT//6FsfY4Ct2Y5sBYndVVzd2Iqw5DKAQzYjwbq7eDJKOLcqSGbNwaHlWNOzsY
 1eAgs8pw2bwHNVYsy04xXp97MRPBlkFRcigXrOj3VirS0xe/u2WHB0gjMjUA8AAdcX1Z
 c2V3itDAt6+pi5L1IMUcDTXLq6GTjlaU8YxQqqLeXjQx36VtZacCtHgGhRKVlmdSCzWt
 5i498X+ImMLXo5nzun2iLybfce7AHARAsjKQTtepnmQG9W1j2KQmgq56Ay6jLXQOrkPt
 nRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZJz/3Tff3xT2pELYxTDnLdX/EaWMkTM/zNFqF30/VyA=;
 b=cSCOdfSCi1vG6Je+BuKx/ZkW5KvyyT8SYqnXVcdWeTQSdO1sB1A8h2QS89pJ+Xl/Uz
 z0DJGO7aPEU/iFdGCY3xFY1CcaAgEEUsJxVHdLLGYmsFhcjoC89FEUJMbml9eNS5zZoH
 A1G4Zvjf1sde5grRzPH2cSYWksDH2Fwa/uimePFLV9Ykf9niSmu40vWta4J3hBRx8Cwu
 Z+jbhRB1RAzhZmWbGEKEL++EziM/iIPuBLLWcH5LTmbh+23pgtVDwSpS7AS2OXDIjdC2
 RcbflMRyQjDBGUeBI0aEuh1iWtlFW86AzUYC7TrI3XTlv6MvlutMsKLTFCzIpYTyTl3V
 YytQ==
X-Gm-Message-State: AOAM530/SGracq8L3q78sihqAI+DJnAjx3AHrhXvwWZGEgDDM5iMtD0o
 XAGThBlk9/GzolVd/7KZoV1Eng==
X-Google-Smtp-Source: ABdhPJxkTNwLJIMc6qRweDVyjvM5N0omwM+B7eZrYk7M8BHCNbM5RZeL+7W7H7udDcNR2U7WziPuTQ==
X-Received: by 2002:a17:903:2309:b0:153:ad3f:b074 with SMTP id
 d9-20020a170903230900b00153ad3fb074mr29764882plh.82.1649647334268; 
 Sun, 10 Apr 2022 20:22:14 -0700 (PDT)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 h10-20020a056a00230a00b004faa0f67c3esm32288549pfh.23.2022.04.10.20.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 20:22:13 -0700 (PDT)
Date: Mon, 11 Apr 2022 08:52:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 jia-wei.chang@mediatek.com, roger.lu@mediatek.com,
 hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH V2 05/15] cpufreq: mediatek: Enable clocks and regulators
Message-ID: <20220411032212.q46sqavjpvj6vsyy@vireshk-i7>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-6-rex-bc.chen@mediatek.com>
 <bcc8a0e1-144e-b9ba-9532-f54d4051d8a6@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcc8a0e1-144e-b9ba-9532-f54d4051d8a6@collabora.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_202216_030058_05A51DCA 
X-CRM114-Status: GOOD (  10.25  )
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

On 08-04-22, 15:36, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 06:58, Rex-BC Chen ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > We need to enable regulators so that the max and min requested values will
> > be recorded.
> > The intermediate clock is not always enabled by CCF in different projects,
> > so we should enable it in the cpufreq driver.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
