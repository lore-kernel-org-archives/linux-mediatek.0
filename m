Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AD9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 03:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/h0zgJNI0cyP8jBCslPmsDcxN18KCg7ix0DFjz9eP0=; b=GC4e70kgVRWas+
	HN+QiTCyBEbqOucDyQaNK5YmNmsmliLZzjTqpVOYMB/0AicFolB4oVpNcF41j8/cmIFM25A8XqwlS
	wn5mdMAuezsntidUUwLWb5xp+/FLEbgYOD2NZFSwMuj8qQ2bU5xgHKAahX4GKj2gMBWqAJBNz+xv8
	KZ30gKwkrhK2H6oAq2Smmp5qgASQBFn6SZ5PVxd8tSh4vTf+1qMwXANL/sefZ6ev0xvgUdkyeqhOL
	ql1ZEffNmb+eVWnA1Ia8H1c9+0cyxn/FfvxfUsltlgJvebQ0Bt3OzbNaOj/NGA+A5Wba/gQJPZPbb
	3hMxq4BcSOxw8FISKXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndkb3-006RF3-ND; Mon, 11 Apr 2022 03:20:09 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndkb0-006RDM-Lq
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 03:20:08 +0000
Received: by mail-pj1-x1036.google.com with SMTP id md4so5665648pjb.4
 for <linux-mediatek@lists.infradead.org>; Sun, 10 Apr 2022 20:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tN1G+q/wcvFzwJbeesZQdsHKA960AujjCf5R4X8WE20=;
 b=FuNylqhPzlplRX6n8tyaYgiS6zwGA+pVNFd5RqqHl8IHExlSLjIIzrmlUNoVXPU1tr
 6yMMuesDtEAnrqFcrv4cTlHq1fT8qRK43q4FwsyyQ89bCO9Qf9ObcN2NXIXR3sDbLpkk
 2YI1/V00NKbJk20tqlhEUZ0q+t2JpUN5VD7F4ZcU84oBrbZVUjgevZBP1pSWRlYQnhZ9
 2gQu5aD+sio9Ft2pIWnoAlrqDIJG3ZZmU6D/lUxAlzZyI2CRtr+OZqWuPIVsY6gKEor7
 iGDMzheZBrk5OJHAcSCS1uv3b1G6yFheCFubaHnoewrjG37KEfXFuMWdge6olkUY3qjh
 S7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tN1G+q/wcvFzwJbeesZQdsHKA960AujjCf5R4X8WE20=;
 b=VKA+mAQAXAiTbxO8wSMnTbGBx4uSDaopE3hVROhqUuRDoSdkssZtgZrwHxhjtuWMAV
 J5CjF0fSRoUWqFx46N0VkfuM/k/ZV5BcMeG5UBlQcf5FebHj2rSCgCmocR3rOvHPBUR5
 qXk/I870ZbLJqGwKOcVL43eCEyi18lCHiUykYGPwVxCB/VykKWzugC3vWJPRch4UzCXm
 TqJkO6GkHN551FeQL8aNPIcnzphYbPaw6Wfa8syOaqlqIKg+eD2/bGE3GsVcSjbKLmrt
 RSdmiGRCVGNfbfXseSjXiypJUPDeFH4USWgmng/jh9r0ridc2O35q0yDoefEUDar19BZ
 mfvg==
X-Gm-Message-State: AOAM530oBj6NBqUjd2EjjRRPDFSZRhWTdfyRm7nmTQ7f8TMnodl5kRqp
 2mG6LqYkdwW+RstPnSS86b0B7Q==
X-Google-Smtp-Source: ABdhPJyTNnBj8qT3V4RFBsglvnr2r+FAikoXvU7cRGxlyV+whWVQJZsQPJige4Ynozo5I3N8OxMYIg==
X-Received: by 2002:a17:90a:558a:b0:1c6:fad4:2930 with SMTP id
 c10-20020a17090a558a00b001c6fad42930mr34664972pji.159.1649647205159; 
 Sun, 10 Apr 2022 20:20:05 -0700 (PDT)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 ob8-20020a17090b390800b001c6a1e5595asm19542986pjb.21.2022.04.10.20.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 20:20:04 -0700 (PDT)
Date: Mon, 11 Apr 2022 08:50:03 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 jia-wei.chang@mediatek.com, roger.lu@mediatek.com,
 hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 03/15] cpufreq: mediatek: Cleanup variables and error
 handling in mtk_cpu_dvfs_info_init()
Message-ID: <20220411032003.bn6ahm2phf4lpuwd@vireshk-i7>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-4-rex-bc.chen@mediatek.com>
 <68de368b-d39a-4e55-9ae9-67d6f0ac7705@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68de368b-d39a-4e55-9ae9-67d6f0ac7705@collabora.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_202006_853398_3D419877 
X-CRM114-Status: UNSURE (   7.66  )
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

On 08-04-22, 15:36, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 06:58, Rex-BC Chen ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > - Remove several unnecessary varaibles in mtk_cpu_dvfs_info_init().
> > - Unify error message format and use dev_err_probe() if possible.
> > 
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
