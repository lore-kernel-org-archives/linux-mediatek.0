Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88652C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 05:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BlR1R4rujDaUm7GANhbPyARyzJiUGR7DjAdWh5YwCo=; b=ZLiBNip+/+8eNw
	ASgmbHrrECEeaKa+RhceH+1ONBmHTbxcvmmzIdWOpbPpvZXUCxYRirtylPcZdqVrFttJonvQ1DHLe
	TWn6jfOco6ThmexbYYXWv0UEjcg5ZlTo3e2xFZSMRrcNMWv3t2/mxfNxEulmLaUoQ1z54Ydw1dsHT
	L/Bd3NaseX2ra+D8u2RdX1XhKNhs4l4if/gpLrNjWAFB3hCmOmoGi0TsLyx6Wsz8veZwjEBuo19oY
	7Od+EwcU5QgsCgIhOjLXi/t/WPqdHDxhOGJfdG1He5EnLAd5VJmeWiAI5+3S1wkdMeE4HQ2EczTr7
	hVRaJxTU3kTDw73S7L3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np1MS-00A570-IR; Thu, 12 May 2022 05:27:40 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np1MP-00A55e-Bk
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 05:27:38 +0000
Received: by mail-pg1-x52a.google.com with SMTP id q76so3614361pgq.10
 for <linux-mediatek@lists.infradead.org>; Wed, 11 May 2022 22:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gRX0Ygzn0dg0e+70kr3m3IwBrYrMdQ1DQ/I+WXCJSvg=;
 b=qJ4KiVHH2rMmMzxaLh80DfGXnszrMQ43AKcvzJ4sxmCmOQHxbuHKloqpOXBMA2gFzq
 JctWdsEodVTpAPAmqX2PujOnIsHVmElZ3U5bWU7FgIFINRyDDriwR843JzqXV3BggJnj
 8cabiBskEd25W/8zfQbOVn4F2Wd88kW8sWZrOn3KWTaaIu12aPfYUTjjKLpkwb/I6dzk
 3RRViu4JGHvu7cHbr7Lgf9d0RDAuBuI7WGhc2/p5n/34xtfhGROPg81entmzf/nT2Fl6
 rNrwqIKxIX9rA0NZhJKABgxnVS09ra14kvAN1JeZD4CA/xUHw7LjlxgyQogLAWb/QF8G
 9dNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gRX0Ygzn0dg0e+70kr3m3IwBrYrMdQ1DQ/I+WXCJSvg=;
 b=WisETBCFdZTu5bWXXR+YpTWyLDh5ZnfpPLESq+HK9Jt+yzNJmEFDL/YIbQ1hdoZoO5
 9n8Ci8MQboD2FWBgs7VtVn2+pQ7PjLWcamKpTOrWAHu/6JtVrNE1z18DPSLrrcOoZVYI
 KfzndwR5Y2mO6jhrGCpFt7FEyBPcOSO5o3szWt+MZAHhQ9P/UeeeDO89H46OTkjtLvSU
 UDkJJrw6y2ZF+pp20X+nSpoqIuWL7LdDGb6zduuZ8ceVWJgMuxayEV0HE/LF2l7kBRxy
 5TXUTn2GashaIWIeZB0a2BVNY3ANSy1XiAxLpsMVy4DS/q7++sH9AwMo0GhqnSqqAAcW
 8G9g==
X-Gm-Message-State: AOAM533TYh6d664bOs++IdO4YF58ts0cCSg4TPwzDP+yQjz5DdmHYZ1S
 /eFqbbRyk8aDFPjY9NjbKz6uWg==
X-Google-Smtp-Source: ABdhPJwH8eYDeF7eTsAmzfIYKUwyKfpVinxgHer5RNdfSqN+NQK5HaJzocJuaIgksr1FKM5eMoFmCQ==
X-Received: by 2002:a63:3144:0:b0:3c1:457c:bc18 with SMTP id
 x65-20020a633144000000b003c1457cbc18mr23993540pgx.582.1652333255605; 
 Wed, 11 May 2022 22:27:35 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 p6-20020a17090a930600b001cd4989fed3sm862658pjo.31.2022.05.11.22.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 22:27:34 -0700 (PDT)
Date: Thu, 12 May 2022 10:57:32 +0530
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
Message-ID: <20220512052732.iqphgpveoyrqjlqg@vireshk-i7>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220506042004.hqzpb66shak4y7rz@vireshk-i7>
 <86851bd03128cc61082d516ebff929d3637063cb.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86851bd03128cc61082d516ebff929d3637063cb.camel@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_222737_473252_16F459D7 
X-CRM114-Status: UNSURE (   9.27  )
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

On 06-05-22, 14:32, Rex-BC Chen wrote:
> As for rest patch:
> The cci series [1] is still under reviewing and it depends on chanwoo's
> series [2].
> Therefore, I think it won't be so quick to be acked for these patches
> in my series.

I have applied 1, 6-7 now. I hope it is safe to apply them ? What about other
three, can you get them acked now ?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
