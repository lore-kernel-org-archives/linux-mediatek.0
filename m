Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91271C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 06:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZWBRbWkiUTTIyORFApS/fzMq5oxxkpYsPisaOzlePc=; b=X87GVjzE3gCY6p
	1vu6E9vwDSOC7VVs+awLHpcrASsxsQU74hQ4bsPCloaUvUN63Hz8afm2T2K87lgUDydGkY3UqrBtg
	Ad+ICd3Rcvy0naw++grHGqWy8mx+CjWaJRtEGiruFGJt0ej3GEYlQLiXgMTkNJBRa6rIrolBha9il
	rFAEEAQBgwscx3gRKqKpQgT8Y1Nq3eGlDKYS42f2ZpljuJHxH4qfvOqeAXcib05VS6JNBeyRa+1ae
	WUpGwYzQXiA1l5RCwGwW69syrk7g8n+sd4fMZcXdXPGQmSyfcjsf1o4XoGpW1krWbSlnkhPHhv6Bs
	Y/7FGHdNlmZZpTnGTjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq7zw-006U4X-E1; Thu, 25 Nov 2021 06:12:44 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq7zt-006U3f-PE
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 06:12:43 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso4885751pjb.2
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Nov 2021 22:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YKVOYD3BZCO+X1y+/55daB35BTEfDtfDdx/rM8jqf9E=;
 b=n44WZ2z69BFhD6vXWR3Y71Tv2Zgm+1rz0FtTfpotm+0hmcPZ4gF1VMyFrivfZgFzR8
 MOGavT5d/logVOf2dPzjha8xDqIvaFogxvhakYpzRenhBiKAgeES61jdpxEqZg2oBi6c
 7mwCxUrW6+HKm73SPS/WPDIL6NhLX5CxWq3DUWJWqeGIg0xkpsm3jl23w9Y7ZhtoVkrf
 XXap00ZG3ymtg31S8xYpPyHcp3t9bzHzsbIhEJrt604GMm4tSSm1S9jOjbNKLk3KLYR3
 rsydc2tsDnNk0Tl45d2/T9Z/BEDWXslWhVFaIrkLtoByCb29PbSsbNuJEBoiELGgbGeM
 hP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YKVOYD3BZCO+X1y+/55daB35BTEfDtfDdx/rM8jqf9E=;
 b=slMTYcZbNxpc6JZtvOL9tzl7XSWMb4241/EiHiAzBnK645WNTctHbgSzBd99Uz3VG+
 q0Y6+7bSp+dg7vRIPBjSwsN+c6TGOWisLefgTGjyiCQT4SEljuQmRB1e7h4rIAqIADXl
 ilRNxUuBQeRq1MZI7G8e7duMyfFM5mRbUeFD0Wy/mzygWmUMXhx4WBXdxwrMwQORnOth
 swH0DlbsZHa2/hbAvR3eRCJVlUpGPVE/XCwjYNbQLl5N3iMwAjrc0WnbtP0klYT2+a+h
 C/ILV9b749mutA4Hf3Qm97CWTf5nOBQONouRZeEkl11k77mpPw8sFa69vzciau1mJbql
 57TA==
X-Gm-Message-State: AOAM530xoNfD65zcnc/6ILkL0sioA4B7kXMehsf8AXNou6CwqF5BtXSy
 LxMO3dHZm6BVxmNZE17GovvfVQ==
X-Google-Smtp-Source: ABdhPJwCSDiaHHIcRXyx/a84z6DGPSsJ7vljD/viUs2u9iWx1qa9RfjpBOH+FGAIZgcGnOGyAhdYaw==
X-Received: by 2002:a17:90b:1e0e:: with SMTP id
 pg14mr4061574pjb.143.1637820760339; 
 Wed, 24 Nov 2021 22:12:40 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:cd6a:1959:1c65:cc19])
 by smtp.gmail.com with ESMTPSA id y130sm1621671pfg.202.2021.11.24.22.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 22:12:39 -0800 (PST)
Date: Thu, 25 Nov 2021 14:12:36 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, matthias.bgg@gmail.com, garlic.tseng@mediatek.com,
 kaichieh.chuang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ASoC: mediatek: remove unnecessary CONFIG_PM
Message-ID: <YZ8pVIVApvSiW6Ue@google.com>
References: <20211125042422.2349-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211125042422.2349-1-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_221241_864284_05773288 
X-CRM114-Status: UNSURE (   9.52  )
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

On Thu, Nov 25, 2021 at 12:24:22PM +0800, Jiaxin Yu wrote:
> The unnecessary conditional inclusion caused the following warning.
> 
> Such as:
> >> sound/soc/mediatek/mt8192/mt8192-afe-pcm.c:2368:32: warning: unused
> >> variable 'mt8192_afe_pm_ops' [-Wunused-const-variable]
>    static const struct dev_pm_ops mt8192_afe_pm_ops = {
> 
> Because runtime_pm already handles the case without CONFIG_PM, we
> can remove CONFIG_PM condition.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>

Acked-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
