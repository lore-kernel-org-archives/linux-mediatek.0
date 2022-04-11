Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45CAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 03:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJjWmtynELQjs/8NcwiRC5vIIkTb2xBmh9pBXrZrrQs=; b=dKZwpB3OqMSms3
	aktW4t7RjvgsJ7PaISgWlk6hDZrkq0w0pGM7CVTL3c6dc/nK/PyYN+/aB22sala1/+V5iTh6HDMSy
	iyEgHIdRsT+ZGw4fVub/z2ROzrC1c/w6RkW+PXcOlTsSOHtlOzfPpLXIJIqPIIs/N4y+gVlrGXSzK
	Iwip8t3DI9q6LIE9ixzek6ItX0QHG7JlgzibNpR5IoTFFBMbq/A6hDqydWSDIbaM/VbKQYNbXNFR6
	JSrqzE3j8azB/u+Xu3IIL1rBsajlxajQHCJxu5JXeH913QCqKtYa44Sn6mLJ589RY+LBaReon/c1d
	nn+WBtJmVBNyGIitEegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndkkC-006TXt-H0; Mon, 11 Apr 2022 03:29:36 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndkk3-006TUQ-UA
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 03:29:29 +0000
Received: by mail-pl1-x630.google.com with SMTP id n9so12744228plc.4
 for <linux-mediatek@lists.infradead.org>; Sun, 10 Apr 2022 20:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=glLri0Q5hoPnF9CltB+t3SBRTbSb2KsDjT5cGpcgnl4=;
 b=Lor8cKaxWULoOS+gC8IfE1E+zWobSXFdYdQ9MXCEDM5Br0l/Tc33DpFnB6jfVj9xyD
 RUrlBC9h+YNKwOeF4Bx2uUT3fsAHfeYHJlYDwZWkPQscuKVkwGUionPVKQp3py42IdhN
 sXRAd2yNMYUk+s7wECCWeXGm9ITePH7DEKtMqoIUdqiK1T3VpVkmLMtlSWTT/lr9567F
 b/SXpYq2KVpDDRTy+d6vpGkwepq/NWVmIgGMoQPOEAqw31oMVfCjq5rIzRfaevRaxCKB
 eV037276lxgv3hAQPHBHDPjExa/mKjVtAc4voYESLlWIS9ldT4c6DkVHoQ3Y75V7d87W
 Z95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=glLri0Q5hoPnF9CltB+t3SBRTbSb2KsDjT5cGpcgnl4=;
 b=BnekvSwbCVlHq/vrd1wRYxPZEMRgAkkhayTzB0hL3b6RS5jqWPjSuumgjDzGnmF8Xh
 lGMDPY04ybx49L0P8Vu5ihAPmZA2bXLBOaUDbg08smplcPwJQhaNhU+Pu7MnW5CH+Yv0
 rEDaVkm2LQb+LbTTr5Xg1AEojRQdkOfhUHxre+L6zmWuGO3kw5xdjLNKg0broTTDxH8+
 k9njwnClrLHbrzjsDWr9US/9Vgshm3mRVNeAL3KCQRDkhDUb1/uGCZB9izR4T/CGfIqS
 r34I1fEUbmPeA34orEAC58X11lg4BEswao8a3EfGJbv0BNJo7O2o1kvpebTbsnMhSTXK
 9MuA==
X-Gm-Message-State: AOAM532oHzUc3wepObizeCc+WzoxFLaLWqD7zgDq7G49WZeXpjPCWRMI
 KrimmVT9mlXyXRiWh3tp8QgYKQ==
X-Google-Smtp-Source: ABdhPJzTnmE6XXA7umU2v3xHJBcEhDF7Ru93TRyQrYWdHHOoifJtCYP/hQCVMVgRLXA7Zb4apPNhYw==
X-Received: by 2002:a17:90a:8405:b0:1bc:d521:b2c9 with SMTP id
 j5-20020a17090a840500b001bcd521b2c9mr34455774pjn.119.1649647764750; 
 Sun, 10 Apr 2022 20:29:24 -0700 (PDT)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 s3-20020a056a00194300b004f6664d26eesm35381725pfk.88.2022.04.10.20.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 20:29:24 -0700 (PDT)
Date: Mon, 11 Apr 2022 08:59:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 15/15] cpufreq: mediatek: Use device print to show logs
Message-ID: <20220411032922.yj4p42is5ky6bgau@vireshk-i7>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-16-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408045908.21671-16-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_202927_999545_DD9168FB 
X-CRM114-Status: UNSURE (   9.56  )
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

On 08-04-22, 12:59, Rex-BC Chen wrote:
> Replace pr_* with dev_* to show logs.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 41 +++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 18 deletions(-)

One should always arrange the patches in this form:

- Fix bugs first (since they need to be applied first and need to go
  to stable kernels too).

- Trivial fixes next, like this one which you chose to be present at
  15/15. I would have applied this one right away, if it wasn't he
  last one, because of which we have conflicts now.

- Non-trivial patches later, so reviews on them don't affect other
  patches.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
