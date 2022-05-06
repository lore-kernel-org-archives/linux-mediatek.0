Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31019C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 04:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htgE7yLR/kgQgAyxFv03SnNQX3v6rvLrssJOkexyehM=; b=tVvC4P5ziJ9Spo
	VonHCLZGGkBsLrtCuiSW0RrOK5pJOdy/3l1aFKiXVJOUGuJ+Tb8HZQYOQkCvnmKy+GIQA1zbmhx1H
	VGRkPdaSn3FEgsOeYrds+CEfswSnd7HyBBgUTkd56Nyvkr7PmoL6mMSDoDz0/7mHOAXOEqiW7GIdm
	JMTypejgfJbIiOz01bk3e2qeoVRt0rBvcG54DnSVIxsfiIqgv+y6f8fSv98i8eCObU7ElbHoAn7YM
	JLe5eR0HCrfuqkX1cA7ytijhVI0u4yLdWvALO1DIzIIUAKQVwB6nXdWh0RwOQLB7UOFvs8mnvU9ck
	0SV6vOEPHlfO6VwnZQsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmpHX-001HL6-7U; Fri, 06 May 2022 04:09:31 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmpHU-001HJK-ME
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 04:09:30 +0000
Received: by mail-pg1-x52a.google.com with SMTP id r192so991211pgr.6
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 21:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XsoBtkAebOgjtMxymQU1wBQgO9U1OW2Xx5QkHSE5DvU=;
 b=rGUsO7GehX3b88mwxY/zTcVQU8oj8k7UYuN4o173aiyqlC/wvG1bQc2Fi1rXhtE3Bx
 36+GftgNTCKYaGOqx/CeIa0XZaYCfOYsiabPJlmqnYBxpSbmchkntincElTwg/HoLuJi
 e+lCHyvNqeQZqp1F5XV1AE1AAlRnEUm5g5DGIn5EdsZvvTunX5GoU0ZwZkI7YE8lQKEs
 vEb4rR/TkUiuN4JMzIa1nU3YFANscD/rgHmiXMbPtgYTU4nxHRNQelZogez37nGnPYaW
 6D83cfDUjFuvHsBfG0DgWLAG9QDRFYy3eKhq0ZffkCkdgvNJ29OtPapnnyqNAzzVmxZX
 Z47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XsoBtkAebOgjtMxymQU1wBQgO9U1OW2Xx5QkHSE5DvU=;
 b=tuzCMOeETasc+n+wuDzJUXddwFu/qS5OlNMAQrGfLcP9eibzlN7umf6CPXOAiLXvgk
 TM3JY8r24NWA/h+/XAlDz9kDOSgtbmV8KQa1+JtKHfLx8TUk7ya19M89hq6wApjoOIbf
 J8Blg0ydSQ7K/12y0EHGf/uFQtLL8jAHjr+IlIdL7Grigwow8ryy+vlPzApn3xeho15H
 zV7iQobENxJm0PT4thc7L5gteEvZCuiLhgKQ3s4mq/fdWjhhKMaZgSKay+FhKpTgcrqS
 GHRcwXmHJbhitlVcOXapMME+TvuMz04QBrEEPto6tuHzGdeTf9pZzpP8PrGR8abSoXK0
 xsGw==
X-Gm-Message-State: AOAM5306mylk+ngyi19YNIxszI2+3G2t2CFk1afJ3KhlacfFnxHwWi0j
 Kh5SUVi8SP2+skJPpAvGa0rqrg==
X-Google-Smtp-Source: ABdhPJwx7b+xmNh51JOkVexQJYw4Ub0h4b4eREe4WGecOLA4rSVA2b7lG2+t2YveniTshYGKqRBPJw==
X-Received: by 2002:a65:5245:0:b0:39c:ce49:e97d with SMTP id
 q5-20020a655245000000b0039cce49e97dmr1193052pgp.301.1651810165472; 
 Thu, 05 May 2022 21:09:25 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 e30-20020a631e1e000000b003c14af5060asm2125467pge.34.2022.05.05.21.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 21:09:24 -0700 (PDT)
Date: Fri, 6 May 2022 09:39:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 02/10] cpufreq: mediatek: Add
 platform_device_unregister when driver exit
Message-ID: <20220506040922.n7l3kswvsh4re5xr@vireshk-i7>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220505115226.20130-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505115226.20130-3-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_210928_790904_05FBE357 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 05-05-22, 19:52, Rex-BC Chen wrote:
> We register the platform device when driver inits. However, we do not
> unregister it when driver exits.
> To resolve this, we declare the platform data to be a global static
> variable and rename it to be "cpufreq_pdev".
> With this global variable, we can do platform_device_unregister() when
> driver exits.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
