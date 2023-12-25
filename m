Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54B7C47074
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ncwBF96I3+wYyMTERq4e+nBDWR/IIaIfVwaDbdyJKS8=; b=g9SqxZ1iYZhxAyKGoh4IImVMEc
	csku84wmdemnApWOraSAyqGQi/nzwtpXLe3nNz9iHTqQURSXXT5BZy0kGtVO6YhinO4ATYnjmdjRX
	VTWDvjqklGhirxxIO3zQTCqLK1Z+CSWpYLXn3xx3fLsYQ6+4+1C7ToQD9Dy/+SeezoVK0knKTIqEa
	MFVkE81JTJzy5X/NEkCdMN5iPbWtGD44rAY63hHw7FfQISDj0OQ5l7aTPysHSnvV4HfOUf2+mm+g7
	Xg4nGDiGef2jsp5ZpxlceV16UBZDJJgSTvQiwHyuPorRVaYZwvqUEqHKrxjKhc5NQlZ2rELb+3GYl
	/V9o+Vwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLN38-00E0OO-2R;
	Thu, 04 Jan 2024 12:42:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHkx5-00AvRW-2C;
	Mon, 25 Dec 2023 13:25:05 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3367632ce7bso3390143f8f.2;
        Mon, 25 Dec 2023 05:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703510700; x=1704115500; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ncwBF96I3+wYyMTERq4e+nBDWR/IIaIfVwaDbdyJKS8=;
        b=WkTT8Sqyc0y3zDB66SPegw7PUJtL9D/zfoHEIoSdzsv0Ef2sfYh49YkC1Uv2Hm45DJ
         IR0dpAW+li8ivF+WQ8mwNPlojR3uM5gaeeTkWF3e1r18IKZpOQuplV6pb85XC6k2CMZ7
         7ErvxLPcazLkr6PKTs6BsUMbLYj1pXxWoN8k+qsmGM0hogNFJIra0Xxr3KGOK178Crxn
         eFPBagQDwIdmaZ9VmDYEgsvkJIYL1STO0qu8tfFAPL2BIvDWcszqENN5Ty28L3aTNEZ1
         xq08r34eFc8J/FhjYwBVAgoiCgzWyDY+bKSxl1uIMjVnJ5yuoP25Siz9C5HTFwu1m5sn
         Mi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703510700; x=1704115500;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncwBF96I3+wYyMTERq4e+nBDWR/IIaIfVwaDbdyJKS8=;
        b=lCfgqeY+WO9Bz/1Ied8ehw5OLZHMes6KURT4nJV6YDMmlOEV9Vui0CGmSv1XPcP8uV
         cNmNvPNFEPLTXta7ObFJVheloPgHDcgwvdDoGUs9p+qWScu10H7NhciqEU34qmPWTOu5
         D8XJMBfM941s7fAHsN43zd7t70wdYQpEUVwlpEjkv7ACKOvf+kw34HRMCDEnLmBymg6h
         7ct5P+x9a8ci4fX136Iaj+3uiWvZFACQCzkbF2mNsMV4Iaac1errHSaDOf0HNLU8FVeB
         KVZ+tOSJUE7K0p5xsHV24+KkpZDqDQ2hliHUKJSRkNVCBEK0YTTubqX0UeARsx+mu8Xh
         1U1w==
X-Gm-Message-State: AOJu0YzrMRBCFy9GXe+zr7sc23oalobbuiEXJ804duVt311qEiQeD5qg
	5RNZGDDTkVSK1cO90eI/uyILNWcldlfE8NSddZM=
X-Google-Smtp-Source: AGHT+IG41SCwACWV8U87qYA6+6Kcw8BMdXdgLiqNbl02y0fJ7Ng0ACLwuJ4cwq6yo6961NrTK8H6KAeOUAmB5KRkDO4=
X-Received: by 2002:adf:fd11:0:b0:336:8ac7:4654 with SMTP id
 e17-20020adffd11000000b003368ac74654mr3188758wrr.135.1703510699790; Mon, 25
 Dec 2023 05:24:59 -0800 (PST)
MIME-Version: 1.0
From: Ruipeng Qi <ruipengqi7@gmail.com>
Date: Mon, 25 Dec 2023 21:24:48 +0800
Message-ID: <CADHLONEODF_JiB4q9zQW3P--U68Tf4RGKne4Gt3PB9e8pz7jPA@mail.gmail.com>
Subject: Re: [Patch v6 03/12] docs: qcom: Add qualcomm minidump guide
To: quic_mojha@quicinc.com
Cc: agross@kernel.org, alim.akhtar@samsung.com, andersson@kernel.org, 
	bmasney@redhat.com, conor+dt@kernel.org, corbet@lwn.net, gpiccoli@igalia.com, 
	keescook@chromium.org, kernel@quicinc.com, kgene@kernel.org, 
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-remoteproc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	mathieu.poirier@linaro.org, matthias.bgg@gmail.com, nm@ti.com, 
	robh+dt@kernel.org, tony.luck@intel.com, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_052503_725773_3D299FBB 
X-CRM114-Status: UNSURE (   6.68  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 04 Jan 2024 04:42:13 -0800
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 25 Nov 2023, Mukesh Ojha wrote:

<+How a kernel client driver can register region with minidump
<+------------------------------------------------------------
<+
<+Client driver can use ``qcom_minidump_region_register`` API's to register
<+and ``qcom_minidump_region_unregister`` to unregister their region from
<+minidump driver.
<+
<+Client needs to fill their region by filling ``qcom_minidump_region``
<+structure object which consists of the region name, region's virtual
<+and physical address and its size.

Hi, Mukesh, wish you a good holiday :)

I have the following idea, please help me to assess whether this can be
implemented or not. As we all know, most of the kernel objects are
allocated by the slab sub-system.I wonder if we can dump all memory
keeped by the slab sub-system? If so,  we got most of the kernel objects
which will be helpful to fix problems when we run with system issues.

How can we do this? From the description above, I think we should
register one region for each slab,  for each slab will have some pages,
and the memory between each slab is non-continuous. As we all
know, there are millions of slabs in the system, so if we dump slabs
in this way, it will introduce a heavy overhead.

I am not very familiar with qualcomm minidump, maybe my thought
is wrong. Looking forward to your reply!

Best Regards
Ruipeng

