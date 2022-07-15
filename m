Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34B3C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 16:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwC5anEg0yjsg9Rw8IcHiu3GinY8BZcocAU9uCH0MCI=; b=yaR5Lt8r/t5ymSsF7AkWqQuMbm
	/nnMC029qXLRNt/OvbKRL0mJX2jyKaZtvH+shCb82VaRqNTDtqdtCdkoyr385PckGHXxQRMgGJd7a
	452tIxEzqbfhzYvttM4H1+qgvOCwP7pUW/H3Rejy6yVV/iPapnP5Ndr4DxEWNVU5YaX8fGybpn8lA
	s8U9iFkEw0j03a9PxDm0C97HQxZVZmW8KTEPtYjjMY2VdCXa6vOTTzgcH17bZuuV12/JJV8kl1Ij+
	9rc1HIGZxa2GI4vi3xuvUNuTqjo1Lp5Y1S9vrrsQPCaf2/9WXHGpdibno/2NHXa9f/5elhU0Q/3H/
	IKADb3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOU9-008vdf-Mm; Fri, 15 Jul 2022 16:48:13 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOTz-008vWU-48; Fri, 15 Jul 2022 16:48:04 +0000
Received: by mail-pj1-x102d.google.com with SMTP id g16-20020a17090a7d1000b001ea9f820449so12032271pjl.5;
        Fri, 15 Jul 2022 09:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UwC5anEg0yjsg9Rw8IcHiu3GinY8BZcocAU9uCH0MCI=;
        b=kRPX1ruM5CjMlu1wj9auhM8ser8wATC3gVJCAiI2vCbhcBXZUWMyDTYhDsEN/2ow6z
         C7+1TvQrQD+ErLtFG/kwIDtsu18cPtzxGuZpGEVGPFYl3nQyigz+bLUFOvO8aqhIeQJW
         4FSZJpcLxa1UNYvKt0avG7GV9ldTRpmJsArPWoQDpxzmoAeCe0mKq4oRFAnuTUE8JlYj
         ZBKcF2ZN1n8f1akV2/h1+4YiqKiFPWla4bdyW3gCXvq3GTO0h7JXURDp3MXRfzNjWyoz
         2UzQFer9HHCToT+r6naorvjdplG/zjIyDzUKHeaM8cEww4he+LQ0Q2IQqBilO84FpZme
         AYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=UwC5anEg0yjsg9Rw8IcHiu3GinY8BZcocAU9uCH0MCI=;
        b=a1BUliqgwv+F/gNNrPnjgXbPwqOyj8fRDeAkC98LX9hRNAxb/E1FoDu3Xf1NgRb4GU
         xTOtpv+5GZ6XUXIbrZ+kZGOisbG8qPycyBdK4NxCYXMJwTAE8QT+k4vwct7pB41iEKOQ
         ux678YXmxK6u7hnC2kfgW19RL/6wIMg9nWyrSOsXg5pKNa5fYLB3m2sDoyHY4hfN81rV
         hujhQQQ572c4caNAVheM3kDGUKlG7q3oVLH9nZhgDwIf+r+YhlJ50yVgYYm8Q1jhNZyh
         NOoxmPa2WleRwfzZtdNoCRrGFma1bGQ+Xi7MSC6r66ZoHp20l4BtK6QYu8RUurMGezxg
         XgSg==
X-Gm-Message-State: AJIora/s31EACMkYE9tJTtbxChmXVKjCFKm1bd/EqMDAVx46NPVnab8P
	PWc1v+IQlpqWmk+tbdZchPJhkZS1iV8=
X-Google-Smtp-Source: AGRyM1vZXzm78rR8Sz4+dl+obcrdf+Xsglp4KJK1yWRu+Aac5B5Bc6klC5UyLMcJy6xRLFKuFTMfdQ==
X-Received: by 2002:a17:903:3093:b0:16b:deea:4d36 with SMTP id u19-20020a170903309300b0016bdeea4d36mr14423269plc.126.1657903681751;
        Fri, 15 Jul 2022 09:48:01 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id g14-20020a62520e000000b00528d3d7194dsm4123824pfb.4.2022.07.15.09.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 09:48:01 -0700 (PDT)
Date: Fri, 15 Jul 2022 06:47:59 -1000
From: Tejun Heo <tj@kernel.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Jing-Ting Wu <jing-ting.wu@mediatek.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Shakeel Butt <shakeelb@google.com>, wsd_upstream@mediatek.com,
	lixiong.liu@mediatek.com, wenju.xu@mediatek.com,
	jonathan.jmchen@mediatek.com
Subject: Re: [Bug] race condition at rebind_subsystems()
Message-ID: <YtGaP+e35DZYSQf0@slm.duckdns.org>
References: <1978e209e71905d89651e61abd07285912d412a1.camel@mediatek.com>
 <20220715115938.GA8646@blackbody.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220715115938.GA8646@blackbody.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_094803_186491_D19B5B2E 
X-CRM114-Status: GOOD (  11.99  )
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

(resending, I messed up the message header, sorry)

Hello,

On Fri, Jul 15, 2022 at 01:59:38PM +0200, Michal Koutný wrote:
> The css->rstat_css_node should not be modified if there are possible RCU
> readers elsewhere.
> One way to fix this would be to insert synchronize_rcu() after
> list_del_rcu() and before list_add_rcu().
> (A further alternative (I've heard about) would be to utilize 'nulls'
> RCU lists [1] to make the move between lists detectable.)
> 
> But as I'm looking at it from distance, it may be simpler and sufficient
> to just take cgroup_rstat_lock around the list migration (the nesting
> under cgroup_mutex that's held with rebind_subsystems() is fine).

synchronize_rcu() prolly is the better fit here given how that list_node's
usage, but yeah, great find.

Thanks.

-- 
tejun

