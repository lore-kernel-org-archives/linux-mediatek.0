Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C0FC4321E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 05:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3ASLZIghjZZWEINuftCEEYOfo6RX0QGBFaQyVHC+9c=; b=giQL+1slk2QlH2
	ie1sriaGF+VI4YDb5xz2B+6nACJ/MPSDrSJpD36wa4rUwqNd6A6N8b+oBCaoRv7Ez2TSCGOuwyJV4
	nB/kmvzkXZnvzdI7YLWpzwxtfjcmc57RYC8bRMKOYCoqSl/yNqoulmGsD0lOh/6B5yCRgbsLNTYhP
	a41l7nZMTh/qOZ41o9ZshfcJiGKDpzKis8fNi0HR0Xdqi/Upr/3zGxYNVl2yKAYU0IaCBu9TKevgN
	xnRtVn351EtMIQbtkl/TwxCn8MsTh0NKy+/PB5xwC4/6hRx+B7O2vjOklTl8Eome+HR1eF2QnJvBm
	uk6crPJjMRkQ08elZ7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np1jM-00AGZl-DO; Thu, 12 May 2022 05:51:20 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np1ge-00AEsR-Cq
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 05:48:33 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so6855166pjb.3
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 22:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Xuxuada9VjQWUI1huyzXxe5QzMXan59Iyu/e0FTIM3E=;
 b=ASJQRBuMuNpLQOOTO1/95U8uONu/PxLK1NQwtEc5uIIinPwbzZ+EiMTqvJW4QuLzs5
 Dvqj2QCJsNx8sPa/tDARlduwW3wdhQ0FGWnBcOUYQPrLWhXtmvZ6L3lTWYbNMl4MuYAf
 A/PyOdptPDjw6TlGMudLwSFxHjVnS2Te9OSnDg+gxoZsDP/tNurbNk44BFro9n430bhV
 vCHyXSBVgahfrymdhsL+5cRgGU7FA/ts3WzupsI2VR2OSHHZ3vUiHxnlMmFDF5i3eP0d
 +FD1eSppYkkUwZIlNxuO6EhS0yW5e5kxoU1rlLL/KgKIpZGwrK/dbcF9nIeuXBhIBiHy
 o7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Xuxuada9VjQWUI1huyzXxe5QzMXan59Iyu/e0FTIM3E=;
 b=KyDzYmyj2MxZk3Db/gxURUXRSv1s2qSozGXj/JkZPTxdjIxLHWyzAYXxjWq6qveHFh
 L1seUvuHfN8sb2y8AAQ7pWr4W7/3Ttlq+z8Gf9z/4cq3KPDxgiXJdgeUTVw0zm9cBtFv
 ITCEqldkEXrHC9NUCTw0NhzzbQwA3Umms7rSkK03YkDbRb/iJNrvB9a8haxqh0llYXU3
 t5xOPs1orFAsJH+Ng1NRekRskLehCCGIDjvFAYT7ec9JYNQi/TKIl7HsVuRNCxcbJRNF
 IMySZh6KvpZqw/ohCHt2aGrsSb+kCkYv95y5EKjPY3NUx8WhtvZsHRC/nwjCHTkP3lCY
 Iecg==
X-Gm-Message-State: AOAM530BQw+wYh4rVrZHSiv0CLmJNfxZD3A54lLPNUVxvpEuE1DHsDSv
 CjIN0gFdlyIn2h2Hvkyl8VTyfQ==
X-Google-Smtp-Source: ABdhPJy/83UwXF9qp2QmxMhj6rkiPyZePvTFVEifIrC1Ee9PJQriq+WUh+dvyq4lN3UFDvlBYmDWUg==
X-Received: by 2002:a17:902:e989:b0:15f:1545:326d with SMTP id
 f9-20020a170902e98900b0015f1545326dmr16902177plb.119.1652334509123; 
 Wed, 11 May 2022 22:48:29 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 p21-20020a1709028a9500b0015e8d4eb245sm2868086plo.143.2022.05.11.22.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 22:48:28 -0700 (PDT)
Date: Thu, 12 May 2022 11:18:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 00/10] cpufreq: mediatek: Cleanup and support MT8183
 and MT8186
Message-ID: <20220512054825.aqe4g4lupuqj3rcq@vireshk-i7>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220506042004.hqzpb66shak4y7rz@vireshk-i7>
 <86851bd03128cc61082d516ebff929d3637063cb.camel@mediatek.com>
 <20220512052732.iqphgpveoyrqjlqg@vireshk-i7>
 <af82434adea0b648d74ed5ffd123e0faaaac6508.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af82434adea0b648d74ed5ffd123e0faaaac6508.camel@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_224832_492383_C3FF00EE 
X-CRM114-Status: UNSURE (   7.46  )
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

On 12-05-22, 13:33, Rex-BC Chen wrote:
> Matthias is not the member of mediatek, so I think we still need his
> feedback for these three patches.

Please ping him and ask for his feedback then.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
