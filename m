Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE66C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 10:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39BD060F23
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 10:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39BD060F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LybfT6q5nYCVSyI2xq8mc/1F3apapO2rhnt9XcwwxNs=; b=vTzUkMj/dENL9G
	7Bn63ELiZurDDdK+ne+0ZczXjv65n+0W3aijIqOtfV4RkttN4K9v1RgV3qlFvezOIpEbJaB4p5krz
	BsuA/YNXm0YJp2V65yeB0sY8iUTyilKuMkYZDiCmh5BtHWcMdzqdqRjqwhCuHEC218nJaCykpPZ6x
	+OdtaEdYNzb0AY8djCXxv5LXs54cxlP88wQwlQBXHsVcnirl+g/PZQ7iRpZk+XEuqVhd0a3XwAVye
	eZ6usJOqKFHULcLXK0l0A8vMY/AsPWiwFYMgNU0EzZPegA2EhSPMM3ujbK01knafRgj0/Zr9DF4cm
	AdzvDJ5mfdeZ2OP41R+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m932x-003o0b-CA; Thu, 29 Jul 2021 10:13:47 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m932v-003nz6-BK
 for linux-mediatek@lists.infradead.org; Thu, 29 Jul 2021 10:13:46 +0000
Received: by mail-il1-x12d.google.com with SMTP id f8so1958681ilr.4
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Jul 2021 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+TdfjnoknjFApOLGjXLs0J4WDjQDjp/vuxtasshbZxk=;
 b=Gn11Pt3vZ+KHZc32FjDrb0UjEmRwe4paIntceaDMwlEmglVGwEX/a0plEgq0ahC7xg
 0PK8Du5IKwfMhucJcR26mSWJhXAuyMtwqqthvjYTjXi81MXZVt++aNdTR5I9DezSt/4z
 cMgHxEChoygOcO9BmxBs+8dXPfED391hzxxcvkY/DOgfOTXol3xI4bZWTPxm44OndIYB
 RHjuAHzU149hBU7UyHjuLg3mLor1ZGreTfWaVYjuQl+dWFrg68zhQzQpiV7p8xaJmCai
 raGaGumJzLM+XkEUzR8ySWMnN6NtNklgNTWG9ru48MXSIcshzNjzTBu6xKuop6TuqqPn
 2BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+TdfjnoknjFApOLGjXLs0J4WDjQDjp/vuxtasshbZxk=;
 b=aHqxjmxqRpOweh/Z6SuH/+tMTEtH8qvBkgqtqYoFSrwdFdeorkL3+4pbXngHyuJiU4
 xPWTTKUPczl8Bv3ZDxFflvjV9QD0u/8YH3W5IxW0cP4WS9kGB3LttF7dan9CfmLMC4Sa
 9VhTXvfhjkNdLGFCU92kaCoBz/m30b8qZjxnQ3d6Dj6a7Lyc2A+5oqjBBOgmSSIML2Fk
 m537r3nxnMCAcYYQ7r1KArr45an7J6LfdEgQWRk4Uiz5wk1S0fACsQ8qDz+C4qi4NNMv
 em4xIMYtBuRhqrXbzgh7rpun9oF7IV7sSEulE4Mib118CLTS2IRNHUnaSrIIvbph/UGN
 6n6g==
X-Gm-Message-State: AOAM533c3mOTx5KBMVtozEQwpYIl06g2vKB5VaUXVeU307jZjouoVRzH
 q7jxRwWBCI1RI/OdYP+u6oF0FE/z5YA26K4fPEqScw==
X-Google-Smtp-Source: ABdhPJzVaRIPI+gmhmquFj539YU94dP14ON4aHJJAYGwACCa+T/e1bBtcfY2VitFFJ+KUnIIOYaJdIJ0IWDPL0b6HgE=
X-Received: by 2002:a05:6e02:d93:: with SMTP id
 i19mr3091740ilj.72.1627553620250; 
 Thu, 29 Jul 2021 03:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210728035859.5405-1-tinghan.shen@mediatek.com>
 <20210728035859.5405-5-tinghan.shen@mediatek.com>
In-Reply-To: <20210728035859.5405-5-tinghan.shen@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 29 Jul 2021 18:13:29 +0800
Message-ID: <CA+Px+wXwnT5UQ1=deNE4eRpGND1paF+gZ8OD5eX7N1wYJF4Zxw@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] remoteproc: mediatek: Support mt8195 scp
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, 
 robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_031345_454575_3FD546DF 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 28, 2021 at 11:58:59AM +0800, Tinghan Shen wrote:
> The SCP clock design is changed on mt8195 that doesn't need to control
> SCP clock on kernel side.
>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
