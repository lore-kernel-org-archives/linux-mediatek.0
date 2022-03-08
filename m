Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63080C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 04:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/yiF4yCFfn3GqSo0jh3c4ARaazVzIFrVfVQPasaB+IY=; b=Twe79QYuLA6khI
	lk5JtFoZ5RXODsdnKbrRCluSxF1vOiT+HlrowaN3VjAm2JPON6vUUhQj8TneLOt3Z+x99Swg8GnYa
	yrufxqaEOIYFsY8m9MBuZ/qH9BV83gPJlTMfvAoMl4Y1MPhUhuXLkfzxiMSB2dDSo9g21SODthYn6
	qxgm1K7fzZv0FZPw37D7ecxgHHfjgB1t0CphSXoqpXTcX/hC/E/QHBOG/GC6GftpX8CTbW+abkpTC
	Av+Q5A/xQd8xhyfyGqoqd7TGVRoEZ0KpURWXpnHI2BTNDIyBSSFXgUIFMQPd6q0UJvsUkskCo03Cl
	nIin9ws8I+0ejDA0Kkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRRaN-002cTC-Ph; Tue, 08 Mar 2022 04:36:35 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRRaA-002cQT-Rm
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 04:36:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso1292960pjq.1
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 20:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hhcpglpMzPp1zRw4giaVrf5u6Sl21ZWC49Bq67Qrzfg=;
 b=Xc9jz6kvXfky7WDyu63HYTIf0sTMeTSiOMenwRCh6w8DSspn8BDfIIcmZaWcu+9P4g
 zSZAEMIDZTGQPMcpUr8WkVB9AELF9BX54DXYzHjW3ZFDDwLTQArf7TLhBOpqetpEN/dd
 ehFwyHshOb3wt3cMeSUu/bWqZy9Kgb4JRXDW0AT66LkHetwiUDHfksyuwXsvf4vGvrIL
 gpDl2I93YDAWfOwO09bZAmV+yvP9aol9Kp+UcJucLnrYG+NRkKHQCf52n1nwzrEh2wyD
 w6YsnNR733Ci7CRfcUY8mZYvPawQaq0uIM9+EOY6R1Qi+xU/kTEgcz6ob2qJL9OdeIET
 V+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hhcpglpMzPp1zRw4giaVrf5u6Sl21ZWC49Bq67Qrzfg=;
 b=zBx/v4N2BSD5zIOMpXxaQRzspKrwVjJAA/IhqJMzhI5mrdQc645ttan4N6Lr6bdNoT
 i4EK+Yg/zYs2aOxI36OWxX0jXFhOnVuV9AqVO5Myak3dNY+iT9zzqA446uyOq2R77QL9
 Q1mVukEJVUOhwoUKdOsQkwT067cloVnI8AwZ1nrZvAyGSrmCPPpzHEtDGAChdE4BNhCb
 vBpV3q5zWDWmZpReIOOX11Ny7bc54rR6hd44oYvRDYHm2GiE4hsokaB5qeA19OROhLFy
 LWgTBA4uL7G+0z244EuzK3XAS2xBE3OZl79EIXOv5+aZpnoS64MO+0od4l8ELE4cdYO5
 tMPQ==
X-Gm-Message-State: AOAM532wi4H9T6cRTHD8pF0nZPVen8x0YwmMS2CNjPdFW6jsT+wSShrV
 f3Fdlo5lH50QpVl0j4A5dTmN+Q==
X-Google-Smtp-Source: ABdhPJyeLmQ0tzc/aEf5lGsbCCAeOa4K+3koVTtM3WL8KO85y8vgAkdbWzoa3spHjolLf1DnsTFyyQ==
X-Received: by 2002:a17:902:ab52:b0:14d:7ce1:8d66 with SMTP id
 ij18-20020a170902ab5200b0014d7ce18d66mr15807860plb.88.1646714177838; 
 Mon, 07 Mar 2022 20:36:17 -0800 (PST)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 q20-20020a056a00151400b004f3cd061d33sm17996768pfu.204.2022.03.07.20.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 20:36:17 -0800 (PST)
Date: Tue, 8 Mar 2022 10:06:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tim Chang <jia-wei.chang@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, fan.chen@mediatek.com,
 louis.yu@mediatek.com, roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com
Subject: Re: [PATCH 0/4] cpufreq: mediatek: introduce mtk cpufreq
Message-ID: <20220308043615.uamxqylo3mvw4rhs@vireshk-i7>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_203622_915392_45537398 
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

On 07-03-22, 20:21, Tim Chang wrote:
> CPUFREQ is DVFS driver used for power saving by scaling clock frequency
> and supply voltage of CPUs. This module cooperates with CCI DEVFREQ for
> certain Mediatek SoCs.

Both subject and this log talks as if you are adding a new cpufreq
driver, while what you are doing is just cleanup mostly. This isn't
how it should be done.

You need to be very explicit with what you are doing and make that
change in a separate patch. The cover letter should tell what you are
doing and why.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
