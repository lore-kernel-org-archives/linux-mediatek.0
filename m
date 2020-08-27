Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D55C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 12:54:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31642177B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 12:54:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zoXOJNc+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGT1CbGR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F31642177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nAcJanFEn7IuWSHwT2qXV+PHoO2JIZnqoRIkFUSFTbw=; b=zoXOJNc+EKZxYQR0mEBDxj1an
	y91UM3Txii57Pk5eaYkQIz7c+VqK23ngOMRFE082GC9LTKG06mgEA3A+UEDVionRm6if5BSpVGY64
	DunFm4z1igpXE3B7aufdinLsn/dorGIZcE8ZJr0IpAnFvpW4WHmC/1U1FDbwniTDDFgJFuKbA5Fxp
	dsvs8tTbCmBBPsqro189JeFzhirZNNmJan59k4FCTCipcR4JHhcFk7JvOlmKQP6jmHYxVT0o8ky0W
	bo3HRTuNA+5y0bC899jTpXjX9RR1NLYBH57va0Wxa8bhIabNueEl88ryWmalU+leW5/Q7Pkf/C9UY
	rZWGZiY+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBHQS-0000b7-Hd; Thu, 27 Aug 2020 12:54:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBHQO-0000aM-G4; Thu, 27 Aug 2020 12:54:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id u18so5068066wmc.3;
 Thu, 27 Aug 2020 05:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a5lpHFvSWQoGrjybaXmlV69Axq+442tGTTEhKXzXB/M=;
 b=FGT1CbGRN8nWIZimQQJFHaFlgGbXUWXcohmF6aYnzTMEIdoXLV8ASHcjH/rftf8dPu
 05h7ynqky+tK0sVnESIUNMOkwDJXKaIKOOjfk8ZzK2aS6ItFzfPK1RiS8Sgq9gCPkksa
 s87z1TYPj+YUb/w6uaLEL+ETfgmlzhXCU10ucGJlzNXsBINUdbYoCrfyflOTHYw+cbz4
 RAdiDof8rxMnyZ5hwply2FrDERb1PY3A2wl1RdJOsOW1zwqi8pXPitwO0zzOFjipVey5
 oUPQnIgnx+nqlo3zwpUr7dRtVO/mC+2RV5+VHT1jDZZ+PWuU7gSvtmMNjL2CWO/kpKhp
 IGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a5lpHFvSWQoGrjybaXmlV69Axq+442tGTTEhKXzXB/M=;
 b=bLO2kJfH6qPtTHu9fmmZrni3B1klpeM7G61RjNvMyiSVPOZy4p+E1lQdRDjruJWdB6
 Oj9z8tHbppRN6wPRikVJPHDrQJKypxHuoInizXi3RPhAPufEFOLhIAIjJHs9GR4wb+EF
 BoctAgf9ffBWsd4EzJX8DCnPry56Bwmf93i9Zso/JUmd97fPAiibQWH/pb6Y54TrtzBX
 4i8GoHxK7VqDQpzgB0LVB/FBnbQIQ6UA4J+bBqhDB/UrkCf+wOwalu5s5l/dpRfp1t/d
 sFuZnUpeS1LjigflKai/w4y2+HySsGCG+1HNip8uKhxp/0GC7+7Vm6/XOEt/Qqch/0aI
 1tzA==
X-Gm-Message-State: AOAM530Ov9jxd7MgaHp1lqw1jIWQ0bUtnHvke2+tgitr2374gqn0XZq1
 k1FnvHZwVMfGzTV726CLFB0=
X-Google-Smtp-Source: ABdhPJwqZV7pk1FvOSkguIjKJvFkFK+Tun3miq523wTMnXd9BGquVzYW29lvsrXbzl2PtJrmqLojuA==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr3074513wmc.100.1598532878977; 
 Thu, 27 Aug 2020 05:54:38 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id m11sm5436719wrn.11.2020.08.27.05.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 05:54:38 -0700 (PDT)
Subject: Re: Aw: [PATCH 00/18] Convert arch/arm to use iommu-dma
To: Frank Wunderlich <frank-w@public-files.de>,
 Robin Murphy <robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <trinity-d6be65d8-9086-42bc-b993-238b731cdf60-1598531519064@3c-app-gmx-bap26>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d54f5d47-63aa-d07e-3875-6acce69073f3@gmail.com>
Date: Thu, 27 Aug 2020 14:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-d6be65d8-9086-42bc-b993-238b731cdf60-1598531519064@3c-app-gmx-bap26>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_085440_582800_AB68832F 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, iommu@lists.linux-foundation.org, jonathanh@nvidia.com,
 agross@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 inki.dae@samsung.com, vdumpa@nvidia.com, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, yong.wu@mediatek.com, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com, kyungmin.park@samsung.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 27/08/2020 14:31, Frank Wunderlich wrote:
> Tested full series on bananapi r2 (mt7623/mt2701, 5.9-rc1 + hdmi-patches), works so far fbcon+x without issues
> 
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> 

Thanks for testing.

Robin this is especially relevant for:
[PATCH 09/18] iommu/mediatek-v1: Add IOMMU_DOMAIN_DMA support

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
